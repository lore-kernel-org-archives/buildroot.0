From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:16 +0200
Subject: [Buildroot] [PATCH 036/100] httping: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-37-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/httping/Config.in  | 1 -
 package/httping/httping.mk | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/httping/Config.in b/package/httping/Config.in
index 6564415..07ff102 100644
--- a/package/httping/Config.in
+++ b/package/httping/Config.in
@@ -4,7 +4,6 @@ comment "httping needs a toolchain w/ wchar"
 config BR2_PACKAGE_HTTPING
 	bool "httping"
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Httping is like 'ping' but for http-requests.
 	  Give it an url, and it'll show you how long it takes to connect,
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index e1c686f..649c643 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -10,10 +10,10 @@ HTTPING_SITE = http://www.vanheusden.com/httping
 HTTPING_LICENSE = GPL-2.0
 HTTPING_LICENSE_FILES = license.txt
 HTTPING_LDFLAGS = $(TARGET_LDFLAGS) \
-	$(if $(BR2_NEEDS_GETTEXT),-lintl) \
+	$(TARGET_NLS_LIBS) \
 	$(if $(BR2_PACKAGE_LIBICONV),-liconv)
-HTTPING_DEPENDENCIES = host-gettext \
-	$(if $(BR2_NEEDS_GETTEXT),gettext) \
+HTTPING_DEPENDENCIES = \
+	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncurses) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
-- 
2.9.4
