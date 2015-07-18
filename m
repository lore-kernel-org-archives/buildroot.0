From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 15:51:41 +0200
Subject: [Buildroot] [PATCH v9 08/15] sysvinit: added libselinux
 dependency
In-Reply-To: <1436905227-26937-9-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436905227-26937-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436905227-26937-9-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150718155141.135f6e57@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue, 14 Jul 2015 15:20:20 -0500, Clayton Shotwell wrote:

> diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
> index 2460dd9..2b39ee6 100644
> --- a/package/sysvinit/sysvinit.mk
> +++ b/package/sysvinit/sysvinit.mk
> @@ -16,6 +16,11 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  SYSVINIT_DEPENDENCIES = busybox
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +SYSVINIT_DEPENDENCIES += libselinux
> +TARGET_CONFIGURE_OPTS += WITH_SELINUX="yes" ROOT="$(TARGET_DIR)"

This is *absolutely* horrible. What makes you think changing
TARGET_CONFIGURE_OPTS, which affects *all* packages, is a good thing?

So, I've changed your patch quite significantly, here is the summary
of the changes:

    [Thomas:
      - remove the patch from Matthew Weber that did a lot of changes that
        were not needed: the CFLAGS would not get overridden by Buildroot
        ones if the Buildroot TARGET_CONFIGURE_OPTS is passed on the left
        hand-side of make, and the SULOGINLIBS hack needs to be replaced
        by a proper handling of the libcrypt detection.
      - added a patch that changes the libcrypt detection logic to accept
        a SYSROOT variable. Instead of search for /usr/lib/libcrypt.a, it
        search for $(SYSROOT)/usr/lib/libcrypt.a. This avoids the need for
        overriding SULOGINLIBS.
      - don't modify TARGET_CONFIGURE_OPTS in sysvinit.mk, this is
        completely forbidden and broken.
      - don't pass ROOT= since we don't use 'make install' anyway.]

I've applied after making those changes. Can you test that it still
works fine for you?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
