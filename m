From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  8 Apr 2014 14:25:09 +0300
Subject: [Buildroot] [PATCH] libsoup: fix build with host python3
Message-ID: <18d5e2ea9d03866503e41a399eff4f3c7888fda7.1396956309.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply upstream patch to make tld-parser.py python3 compatible.

Fixes:
http://autobuild.buildroot.net/results/d22/d22edc19001037f9593f45444ed953f74ee6b806/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libsoup/libsoup-01-python3-fix.patch | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libsoup/libsoup-01-python3-fix.patch

diff --git a/package/libsoup/libsoup-01-python3-fix.patch b/package/libsoup/libsoup-01-python3-fix.patch
new file mode 100644
index 000000000000..682d57c5c8e8
--- /dev/null
+++ b/package/libsoup/libsoup-01-python3-fix.patch
@@ -0,0 +1,39 @@
+From 74f27b8305cfbcf9324a07bea93829237c86e687 Mon Sep 17 00:00:00 2001
+From: Ross Lagerwall <rosslagerwall@gmail.com>
+Date: Tue, 18 Jun 2013 08:48:44 +0100
+Subject: tld-parser.py: Force file io to use utf-8
+
+This fixes an issue where the build would fail with a UnicodeDecodeError
+when run in a non-utf8 locale (which is typical in build environments)
+using Python 3.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=702534
+
+Patch status: upstream
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+diff --git a/libsoup/tld-parser.py b/libsoup/tld-parser.py
+index c1a0346..5d9d2ba 100755
+--- a/libsoup/tld-parser.py
++++ b/libsoup/tld-parser.py
+@@ -5,13 +5,14 @@
+ # Based on tld-parser.c Copyright (C) 2012 Igalia S.L.
+ 
+ import sys
++import codecs
+ 
+ SOUP_TLD_RULE_NORMAL = 0
+ SOUP_TLD_RULE_MATCH_ALL = 1 << 0
+ SOUP_TLD_RULE_EXCEPTION = 1 << 1
+ 
+-tlds_file = open(sys.argv[1])
+-inc_file = open(sys.argv[2], 'w')
++tlds_file = codecs.open(sys.argv[1], encoding='utf-8')
++inc_file = codecs.open(sys.argv[2], 'w', encoding='utf-8')
+ 
+ first = True
+ for rule in tlds_file:
+-- 
+cgit v0.10.1
+
-- 
1.9.1
