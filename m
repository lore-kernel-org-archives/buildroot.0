From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 09:40:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix build with
 python 3.8
In-Reply-To: <20191021231848.57832d2e@windsurf>
References: <20191020203119.99538-1-james.hilliard1@gmail.com>
 <20191021210603.59270fc2@windsurf>
 <CADvTj4ojPDhL1M3L=yzSzJh=zp+8rO0pTBYYcGHH5=CBs6n90w@mail.gmail.com>
 <20191021231848.57832d2e@windsurf>
Message-ID: <20191022094025.0ae71f35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Oct 2019 23:18:48 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> > > Same question: libselinux is not embedding Python, it is providing a
> > > Python extension written in C, so according to what's in
> > > https://bugs.python.org/issue36721, we should not need --embed.    
> > I think it might depend on if python is built with static vs shared libraries.  
> 
> That is not really what the bug report says. It says the reason to not
> link Python extensions with libpython was to allow loading Python
> modules in a statically-compiled Python, if I understood correctly.

So, if you try to build python-alsaaudio, which has some native code,
you will see that it builds fine. The resulting .so Python extension is
not linked against libpython, even though it calls functions like
PyList_New(). This is fine, as the module will be dlopened() in the
Python interpreter, which will provide PyList_New().

libselinux also uses PyList_New(), but complains that it is not
available. So I looked at the libselinux link of the Python extension.

When I use the link command from the Makefile, i.e:

arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -I../include -D_GNU_SOURCE  -DNO_ANDROID_BACKEND  -lpcre -lpthread -L. -shared -o python-3.8audit2why.so python-3.8audit2why.lo -lselinux -l:libsepol.a  -Wl,-soname,audit2why.so,--version-script=audit2why.map,-z,defs

Then the build fails with lots of undefined symbols, such as
PyList_New().

If I change the command line to just:

arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -I../include -D_GNU_SOURCE  -DNO_ANDROID_BACKEND  -lpcre -lpthread -L. -shared -o python-3.8audit2why.so python-3.8audit2why.lo -lselinux -l:libsepol.a  -Wl,-soname,audit2why.so

i.e, I simply drop the version script. Then doh, it builds fine!

It does have undefined references to PyList_New, but it is not linked
against libpython:

$ arm-linux-gnu-readelf -W -a python-3.8audit2why.so | grep PyList_New
0003c29c  00002316 R_ARM_JUMP_SLOT        00000000   PyList_New
    35: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND PyList_New
  1145: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND PyList_New

$ arm-linux-gnu-readelf -W -a python-3.8audit2why.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libpcre.so.1]
 0x00000001 (NEEDED)                     Shared library: [libselinux.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

So as you can see linking against libpython is *not* the solution, it
is just a workaround for another real problem. I have not found (yet)
what is the problem with the versioning script, but I guess we should
research in this direction.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
