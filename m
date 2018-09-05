From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 08:49:27 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-08-30
In-Reply-To: <a9927d39-0d18-8d49-7ac6-07ac9dfb4daa@mind.be>
References: <20180831060016.342FF22A3A@mail.bootlin.com>
 <241764101.4041403.1535918222698.JavaMail.zimbra@datacom.com.br>
 <CANQCQpZxci70YBUJAfJ12RTjDtPBeD8M-3H4b_6EVMUe+oB9jQ@mail.gmail.com>
 <CANQCQpbSwyZXQZyOgG2-kcPFS0HcJENhzZWg9oCjaDRx5FWwYA@mail.gmail.com>
 <20180904114512.153df013@windsurf>
 <a9927d39-0d18-8d49-7ac6-07ac9dfb4daa@mind.be>
Message-ID: <20180905084927.2a3fa35c@windsurf>
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

Aaah, seems like a very good idea. This would solve all the circular
dependencies we're seeing, with essentially no additional complexity.

The only downside is that the python3 util-linux support would not work
in static-linking scenarios, because in such cases dlopen() is not
available. But python3 anyway has "depends on !BR2_STATIC_LIBS", so
we're good :-)

Adam: could you look at implementing this solution, and do a runtime
check that the uuid-related feature of Python 3 are working as
expected ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
