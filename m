From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun, 26 Oct 2008 14:37:57 +0200
Subject: [Buildroot] [PATCH] package: remove/replace PKG_CONFIG_SYSROOT
In-Reply-To: <20081025205424.78d812d4@surf>
References: <200810250108.06823.markus.heidelberg@web.de>
	<20081025205424.78d812d4@surf>
Message-ID: <200810261337.58158.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni, 25.10.2008:
> Le Sat, 25 Oct 2008 01:08:06 +0200,
> Markus Heidelberg <markus.heidelberg@web.de> a ?crit :
> 
> > PKG_CONFIG_SYSROOT is not recognized by pkg-config,
> > PKG_CONFIG_SYSROOT_DIR is the valid environment variable name.
> 
> These variables are already defined in TARGET_CONFIGURE_OPTS in
> package/Makefile.in. Just drop them in your packages.

I know, so I just removed it in libogg and libvorbis. Docker uses
Makefile.autotools.in, here I forgot to just remove it. In vim
TARGET_CONFIGURE_OPTS are not used, so I had to change SYSROOT to SYSROOT_DIR.
I don't use any of these packages but wanted to get rid of the wrong
PKG_CONFIG_SYSROOT_DIR variables in Buildroot, confusing me while working on
other packages using pkg-config. I don't wanted to risk side effects, so I did
the minimal work.

When cleaning up the PKG_CONFIG stuff, there are 12 packages defining these
variables on their own instead of using them from Makefile.in:

find package -name *.mk -exec echo {} \; -exec grep -w "PKG_CONFIG\(\|_PATH\|SYSROOT_DIR\)" {} \; | grep PKG_CONFIG -B 1

Also, since libogg and libvorbis used /lib/pkgconfig in addition to the normal
/usr/lib/pkgconfig I just kept it in there.

Markus
