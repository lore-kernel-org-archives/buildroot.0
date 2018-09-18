From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 23:49:23 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-08-30
In-Reply-To: <a9927d39-0d18-8d49-7ac6-07ac9dfb4daa@mind.be>
References: <20180831060016.342FF22A3A@mail.bootlin.com>
 <241764101.4041403.1535918222698.JavaMail.zimbra@datacom.com.br>
 <CANQCQpZxci70YBUJAfJ12RTjDtPBeD8M-3H4b_6EVMUe+oB9jQ@mail.gmail.com>
 <CANQCQpbSwyZXQZyOgG2-kcPFS0HcJENhzZWg9oCjaDRx5FWwYA@mail.gmail.com>
 <20180904114512.153df013@windsurf>
 <a9927d39-0d18-8d49-7ac6-07ac9dfb4daa@mind.be>
Message-ID: <20180918234923.5dbb7abe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Sep 2018 00:43:32 +0200, Arnout Vandecappelle wrote:

>  So what does gentoo do? They simply don't have a dependency on util-linux in
> the python3.7.0.ebuild. Indeed, it turns out that the _uuid module is entirely
> optional. It is only used to access the uuid_generate_time_safe() function, but
> the uuid.py module can also get this function through ctypes (i.e. dlopen()). So
> perhaps a simpler solution is to just remove the build-time python3 ->
> util-linux dependency? Runtime is still needed to support the dlopen path.

So I just tested this and for some reason, ctypes doesn't seem to work.
The Lib/uuid.py code looks like this:

        for libname in _libnames:
            try:
                lib = ctypes.CDLL(ctypes.util.find_library(libname))
            except Exception:                           # pragma: nocover
                continue
            # Try to find the safe variety first.
            if hasattr(lib, 'uuid_generate_time_safe'):
		[...]
            elif hasattr(lib, 'uuid_generate_time'):    # pragma: nocover
		[...]

On the target, I have:

# python
Python 3.7.0 (default, Sep 18 2018, 23:23:41) 
[GCC 4.9.4] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import ctypes.util
>>> lib = ctypes.CDLL(ctypes.util.find_library("uuid"))
>>> lib
<CDLL 'None', handle 76f17178@0x76b37eb0>
>>> hasattr(lib, 'uuid_generate_time_safe')
False
>>> hasattr(lib, 'uuid_generate_time')
False

Even though libuuid does provide those symbols:

     9: 00001a18     4 FUNC    GLOBAL DEFAULT   10 uuid_generate_time@@UUID_1.0
    56: 00001a1c     4 FUNC    GLOBAL DEFAULT   10 uuid_generate_time_safe@@UUID_2.20

But uuid.uuid1() does work:

# python -c "import uuid; print(uuid.uuid1())"
60fa6f9e-bb8c-11e8-b77b-525400123456

But stracing this process, I don't see the libuuid.so library being
opened, however, I see that Python tries to call gcc and ld, apparently
because that's what ctypes.find_library does
(https://docs.python.org/3/library/ctypes.html#finding-shared-libraries).

So perhaps the pure Python uuid module can do without a working
libuuid. At this point, it's 23:48, and I'm tired, so I stopped the
investigation here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
