From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 27 Dec 2013 08:34:11 +0100
Subject: [Buildroot] [PATCH 1/1] package: unification of use $(subst [._-],
	[._-], $(<PKG>_VERSION)) macro
Message-ID: <1388129651-4250-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, there are six packages which use subst macro to change their version.

* Three of them (ebtables, icu, perl) use this macro "in place" :

   EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-$(subst .,-,$(EBTABLES_VERSION))

   ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz

   PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
   PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod

* Two of them (boost, libnss) use an additional variable :

   BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
   BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2

   LIBNSS_SITE_VERSION = $(subst .,_,$(LIBNSS_VERSION))
   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(LIBNSS_SITE_VERSION)_RTM/src

* One package (duma) doesn't use it at all :

   DUMA_VERSION = 2_5_15
   DUMA_SITE = http://downloads.sourceforge.net/project/duma/duma/2.5.15

This commit makes changes to use subst macro "in place", in all of them.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/boost/boost.mk   |    3 +--
 package/duma/duma.mk     |    6 +++---
 package/libnss/libnss.mk |    3 +--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 799eb13..273ceec 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 BOOST_VERSION = 1.54.0
-BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
-BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
+BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
 BOOST_LICENSE = Boost Software License 1.0
diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index 93ae16e..d11987f 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DUMA_VERSION = 2_5_15
-DUMA_SOURCE = duma_$(DUMA_VERSION).tar.gz
-DUMA_SITE = http://downloads.sourceforge.net/project/duma/duma/2.5.15
+DUMA_VERSION = 2.5.15
+DUMA_SOURCE = duma_$(subst .,_,$(DUMA_VERSION)).tar.gz
+DUMA_SITE = http://downloads.sourceforge.net/project/duma/duma/$(DUMA_VERSION)
 DUMA_LICENSE = GPLv2+ LGPLv2.1+
 DUMA_LICENSE_FILES = COPYING-GPL COPYING-LGPL
 
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 7215127..666df74 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -6,8 +6,7 @@
 
 LIBNSS_VERSION = 3.14.5
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
-LIBNSS_SITE_VERSION = $(subst .,_,$(LIBNSS_VERSION))
-LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(LIBNSS_SITE_VERSION)_RTM/src
+LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_SUBDIR = mozilla/security
 LIBNSS_DISTDIR = mozilla/dist
 LIBNSS_INSTALL_STAGING = YES
-- 
1.7.9.5
