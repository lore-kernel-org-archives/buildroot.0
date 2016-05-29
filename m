From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 May 2016 19:29:31 +0200
Subject: [Buildroot] [PATCH] [PATCH v2] p7zip: New package
In-Reply-To: <574B256A.4010502@dawncrow.de>
References: <1464539299-3853-1-git-send-email-nerv@dawncrow.de>
 <20160529171412.GA3367@free.fr> <574B256A.4010502@dawncrow.de>
Message-ID: <20160529172931.GA29556@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?, All,

On 2016-05-29 19:22 +0200, Andr? Hentschel spake thusly:
> Am 29.05.2016 um 19:14 schrieb Yann E. MORIN:
> > On 2016-05-29 18:28 +0200, Andr? Hentschel spake thusly:
> >> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> >> ---
> > [--SNIP--]
> >> diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
> >> new file mode 100644
> >> index 0000000..1a6a4df
> >> --- /dev/null
> >> +++ b/package/p7zip/Config.in
> >> @@ -0,0 +1,15 @@
> >> +config BR2_PACKAGE_P7ZIP
> >> +	bool "p7zip"
> >> +	depends on BR2_INSTALL_LIBSTDCPP
> >> +	depends on BR2_i386 || BR2_x86_64 || \
> >> +		BR2_aarch64 || BR2_arm || BR2_armeb
> > 
> > Please explain why this is limited to those architectures.
> > 
> > You can put it in the commit log, or you may add a terse comment just
> > above the depends-on line. If the explanations is not straightforward,
> > prefer the commit log.
> > 
> > (Yes, I read the previous reply that it was broken on NIOSII. Limiting
> > to a small set of architectures wihtout an explanation is not enough.)
> > 
> > Thanks! :-)
> 
> Can I start with a small set of archs until it is tested on more?
> (with a comment then anyway of course)

Yes, that's perfectly OK for me. Just say so, like:

    Only enabled on a subset of known-working architectures.
    It fails to build on some archs, like NIOSII.

[--SNIP--]
> >> diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
> >> new file mode 100644
> >> index 0000000..95d47d2
> >> --- /dev/null
> >> +++ b/package/p7zip/p7zip.mk
> >> @@ -0,0 +1,25 @@
> >> +################################################################################
> >> +#
> >> +# p7zip
> >> +#
> >> +################################################################################
> >> +
> >> +P7ZIP_VERSION = 15.14.1
> >> +P7ZIP_SOURCE = p7zip_$(P7ZIP_VERSION)_src_all.tar.bz2
> >> +P7ZIP_SITE = http://downloads.sourceforge.net/project/p7zip/p7zip/$(P7ZIP_VERSION)
> >> +P7ZIP_LICENSE = LGPLv2.1+
> >> +P7ZIP_LICENSE_FILES = DOC/License.txt
> >> +
> >> +# Note that the build system of p7zip is a mess, so we can't use TARGET_CONFIGURE_OPTS
> >> +define P7ZIP_BUILD_CMDS
> >> +	$(MAKE) CC="$(TARGET_CC)" ALLFLAGS_C="$(TARGET_CFLAGS)" \
> >> +		CXX="$(TARGET_CXX)" ALLFLAGS_CPP="$(TARGET_CXXFLAGS)" \
> >> +		LDFLAGS="$(TARGET_LDFLAGS)" \
> > 
> > Well, I at least see three variables in there (CC, CXX and LDFLAGS) that
> > are in TARGET_CONFIGURE_OPTS. Can you do:
> > 
> >     $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> >         ALLFLAGS_C="$(TARGET_CFLAGS)" ALLFLAGS_CPP="$(TARGET_CXXFLAGS)" \
> >         7zr
> > 
> > ... instead?
> 
> We can't touch CFLAGS and CXXFLAGS,

OK, I guess we should also say so:

    # p7zip buildsystem is a mess: it plays dirty tricks with CFLAGS and
    # CXXFLAGS, so we can't pass them. Instead, it accepts ALLFLAGS_C
    # and ALLFLAGS_CPP as variables to pass the CFLAGS and CXXFLAGS.

> other option would be to patch
> p7zip, but it's already too messy, no intention to touch that...

Meh... ;-)

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
