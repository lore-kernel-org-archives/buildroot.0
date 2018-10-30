From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 11:21:51 +0100
Subject: [Buildroot] [PATCH 1/2] lighttpd: security bump to version 1.14.51
Message-ID: <20181030102152.9755-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

1.4.50:
[mod_alias] security: potential path traversal with specific configs
[core] security: use-after-free invalid Range req
[mod_alias] security: path traversal in mod_alias (in some use cases) (fixes #2898)
[core] security: use-after-free after invalid Range request (fixes #2899)

1.4.51:
[core,security] process headers after combining folded headers
[mod_userdir] security: skip username ?.? and ?..?

1.4.51 brings optional pam and wolfssl support.  Explicitly disable these
options for now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.hash | 4 ++--
 package/lighttpd/lighttpd.mk   | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index c99e240c7b..0829c6b4c9 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.49.sha256sum
-sha256 aedf49d7127d9e4c0ea56618e9e945a17674dc46a37ac7990120f87dd939ce09  lighttpd-1.4.49.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.51.sha256sum
+sha256 2af9fdb265d1f025bfa634e13770239712ecbd585e4975b8226edf1df74e9c82  lighttpd-1.4.51.tar.xz
 # Locally calculated
 sha256 5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 06561e9f55..44bee6f90f 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,13 +5,15 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).49
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).51
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
 LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_DEPENDENCIES = host-pkgconf
 LIGHTTPD_CONF_OPTS = \
+	--without-pam \
+	--without-wolfssl \
 	--libdir=/usr/lib/lighttpd \
 	--libexecdir=/usr/lib
 
-- 
2.11.0
