From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 19:27:09 +0200
Subject: [Buildroot] [PATCH 1/5] dash: bump to version 0.5.8-1
In-Reply-To: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 8 Oct 2014 10:19:45 -0300")
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87eguieaky.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Add hash file, make the /bin/sh -> dash symlink and build after busybox and
 > use $(INSTALL) instead of cp for proper mode handling.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  ...r-helpers.patch => dash-0001-no-config.h-for-helpers.patch} |  0
 >  package/dash/dash.hash                                         |  3 +++
 >  package/dash/dash.mk                                           | 10 +++++++---
 >  3 files changed, 10 insertions(+), 3 deletions(-)
 >  rename package/dash/{dash-0.5.7-no-config.h-for-helpers.patch => dash-0001-no-config.h-for-helpers.patch} (100%)
 >  create mode 100644 package/dash/dash.hash

 > diff --git a/package/dash/dash-0.5.7-no-config.h-for-helpers.patch b/package/dash/dash-0001-no-config.h-for-helpers.patch
 > similarity index 100%
 > rename from package/dash/dash-0.5.7-no-config.h-for-helpers.patch
 > rename to package/dash/dash-0001-no-config.h-for-helpers.patch
 > diff --git a/package/dash/dash.hash b/package/dash/dash.hash
 > new file mode 100644
 > index 0000000..0198cd8
 > --- /dev/null
 > +++ b/package/dash/dash.hash
 > @@ -0,0 +1,3 @@
 > +# From http://ftp.debian.org/debian/pool/main/d/dash/dash_0.5.8-1.dsc
 > +sha256	c6db3a237747b02d20382a761397563d813b306c020ae28ce25a1c3915fac60f	dash_0.5.8.orig.tar.gz
 > +sha256	d751769cc1ef8b825a177e782f1cd3e35bde7c268107fa4febf8d235e12c64d9	dash_0.5.8-1.diff.gz
 > diff --git a/package/dash/dash.mk b/package/dash/dash.mk
 > index 5bc0835..cc71337 100644
 > --- a/package/dash/dash.mk
 > +++ b/package/dash/dash.mk
 > @@ -4,15 +4,19 @@
 >  #
 >  ################################################################################
 
 > -DASH_VERSION = 0.5.7
 > +DASH_VERSION = 0.5.8
 >  DASH_SOURCE = dash_$(DASH_VERSION).orig.tar.gz
 >  DASH_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/d/dash
 > -DASH_PATCH = dash_$(DASH_VERSION)-3.diff.gz
 > +DASH_PATCH = dash_$(DASH_VERSION)-1.diff.gz
 > +# Build after since dash is better than busybox shells
 > +DASH_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 >  DASH_LICENSE = BSD-3c, GPLv2+ (mksignames.c)
 >  DASH_LICENSE_FILES = COPYING
 
 > +# Make /bin/sh -> dash (no other shell, better than busybox shells)
 >  define DASH_INSTALL_TARGET_CMDS
 > -	cp -a $(@D)/src/dash $(TARGET_DIR)/bin/dash
 > +	$(INSTALL) -m 0755 $(@D)/src/dash $(TARGET_DIR)/bin/dash
 > +	ln -sf dash $(TARGET_DIR)/bin/sh

So what about bash? Which one should "win"? bash?

-- 
Bye, Peter Korsgaard
