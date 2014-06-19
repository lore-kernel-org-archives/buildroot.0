From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 19 Jun 2014 18:13:36 +0200
Subject: [Buildroot] [PATCH 1/2] icu: Delete inapropriate flag at link
Message-ID: <1403194417-19986-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>

Theses flags may cause libicudata to not be loaded on ARM EABIHF
because it would be built for ARM EABI only.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
Cc: Thomas Petazzoni  <thomas.petazzoni@free-electrons.com>
---
 .../icu/icu-004-link-icudata-as-data-only.patch    | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/icu/icu-004-link-icudata-as-data-only.patch

diff --git a/package/icu/icu-004-link-icudata-as-data-only.patch b/package/icu/icu-004-link-icudata-as-data-only.patch
new file mode 100644
index 0000000..b69cec1
--- /dev/null
+++ b/package/icu/icu-004-link-icudata-as-data-only.patch
@@ -0,0 +1,32 @@
+From d5d0c4bb7cc9aa4a132ec0bea13255aee50c1cf9 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
+Date: Fri, 6 Jun 2014 14:55:58 +0200
+Subject: [PATCH] link icudata as data only
+
+This patch came straight from Debian.
+It fix a trouble when libicudata would not respect some flags and would
+for example end up being built for ARM EABI instead of ARM EABIHF
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
+---
+ source/config/mh-linux | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/source/config/mh-linux b/source/config/mh-linux
+index 531a3b2..5a2a7c4 100644
+--- a/source/config/mh-linux
++++ b/source/config/mh-linux
+@@ -21,7 +21,9 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
+ LD_RPATH_PRE = -Wl,-rpath,
+
+ ## These are the library specific LDFLAGS
+-LDFLAGSICUDT=-nodefaultlibs -nostdlib
++#LDFLAGSICUDT=-nodefaultlibs -nostdlib
++# Debian change: linking icudata as data only causes too many problems.
++LDFLAGSICUDT=
+
+ ## Compiler switch to embed a library name
+ # The initial tab in the next line is to prevent icu-config from reading it.
+--
+2.0.0.rc2
+
--
2.0.0
