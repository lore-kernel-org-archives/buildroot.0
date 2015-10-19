From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 19 Oct 2015 22:45:27 +0200
Subject: [Buildroot] [PATCH 3/3] package/swupdate: add patch to fix link
	error for CONFIG_UBOOT and missing libz
In-Reply-To: <1445287527-30196-1-git-send-email-joerg.krause@embedded.rocks>
References: <1445287527-30196-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1445287527-30196-3-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CONFIG_UBOOT needs libz [1]. So CONFIG_UBOUT mustn't be available when
HAVE_ZLIB=n.

Add patch from upstream to fix a link error for CONFIG_UBOOT and missing libz.
Note, that this link error does not affect the default config provided by
Buildroot.

[1] https://github.com/sbabic/swupdate/commit/cf495e23ad117f4cae9c429e80714fe9c18f2d6a

Reported-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/swupdate/swupdate.hash | 1 +
 package/swupdate/swupdate.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 057cf84..96ebedf 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256	1410f8967aad0f4d3b4561110dbfb2c1f8e337bdc332f6b120f4995762c8bf6b  swupdate-2015.07.tar.gz
 sha256	ec633171e6a893506fad6b96fb2b258d60a023c03be5520b968a1d5cc6bafe6e  c3467290925b2a833a68d9db12c198fdca752e32.patch
+sha256	6cffe115cad73c0d1095f7880b6d2b97fc12b7f7871f532e5b33717e863f03d7  5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 8a20193..7bafa26 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -9,6 +9,7 @@ SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
 SWUPDATE_PATCH = https://github.com/sbabic/swupdate/commit/c3467290925b2a833a68d9db12c198fdca752e32.patch
+SWUPDATE_PATCH += https://github.com/sbabic/swupdate/commit/5a5ef5909f5da5b2070d58ffaee924bb8e6a51e1.patch
 
 # swupdate bundles its own version of mongoose (version 3.8) and
 # lsqlite3 (version 0.8)
-- 
2.6.1
