From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 26 Nov 2017 12:04:17 -0200
Subject: [Buildroot] [PATCH] schedtop: new package
In-Reply-To: <20171123231304.397647bc@windsurf.lan>
References: <1509822714-17178-1-git-send-email-sergio.prado@e-labworks.com>
 <20171123231304.397647bc@windsurf.lan>
Message-ID: <CANu7NGuU4iww9mTSsku6PwrWHt4z2Kdx4yPyzcAVTpnNhi4pOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

2017-11-23 20:13 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:
>
> Hello,
>
> On Sat,  4 Nov 2017 17:11:54 -0200, Sergio Prado wrote:
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>
> Thanks for this contribution! See a few comments/suggestions below.

Thanks for reviewing the patch!

> What about using
>
https://github.com/ghaskins/schedtop/pull/1/commits/19d9d3d16e4731c97f1395ba2127fe48a46bb765
> which does pretty much the same thing, but with additional fixes ?

I did not use it because it was not (yet) accepted upstream and it does
more than just fixing build errors, like changing an application error
message. Should we use patches not accepted upstream that changes
application behavior?

> > +SCHEDTOP_MAKE_ENV = $(TARGET_MAKE_ENV) OBJDIR="$(@D)/obj"
LIBRARIES="-lboost_system"
>
> Why do you need to customize OBJDIR ?

As you can see from the application's Makefile, OBJDIR is set to the host
architecture name:

ARCH=$(shell uname -m)
OBJDIR ?= obj/$(ARCH)

And then in the end of the build you can see some build commands using the
"obj/x86_64/" directory, and I thought that would be confuse, since we are
cross-compiling. But I can remove it if you do not see any problem with
this behavior.

> The LIBRARIES change would be taken care of if a patch like
>
https://github.com/ghaskins/schedtop/pull/1/commits/19d9d3d16e4731c97f1395ba2127fe48a46bb765
> is used.

So it is better to patch the application's Makefile instead of changing the
variable in the package's makefile?

>
> > +# uses __atomic_fetch_add_4
> > +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> > +SCHEDTOP_MAKE_ENV += LIBRARIES+=" -latomic"
>
> Are you sure += in shell as the expected result ?

Yes, it works for shell scripts:

$ cat testvar.sh
#!/bin/sh
echo TESTVAR="$TESTVAR"

$ TESTVAR=1 TESTVAR+=2 ./testvar.sh
TESTVAR=12

And for Makefiles:

$ cat Makefile
TESTVAR?=1
all:
@echo TESTVAR="$(TESTVAR)"

$ TESTVAR=A TESTVAR+=B make
TESTVAR=AB

Do you see any problem doing that? I can create an extra variable and
append to it before passing to SCHEDTOP_MAKE_ENV, but that would make the
makefile a little bit more complex. What do you think?

>
> Thanks!

Thanks!

Best regards,

Sergio Prado
Embedded Labworks
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171126/391a85c3/attachment.html>
