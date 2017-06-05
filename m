From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:48:46 +0200
Subject: [Buildroot] [git commit] package/doxygen: add upstream patch fixing
	segfault
Message-ID: <20170605095008.098DC802EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fc3338e53a3caf8b1df1e93575a55f483eb76a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream patch fixing a segfault in xmlgen [1].

[1] https://github.com/doxygen/doxygen/pull/555

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1.8.13-Regression-Segfault-building-the-b.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/doxygen/0001-Bug-776791-1.8.13-Regression-Segfault-building-the-b.patch b/package/doxygen/0001-Bug-776791-1.8.13-Regression-Segfault-building-the-b.patch
new file mode 100644
index 0000000..b64158c
--- /dev/null
+++ b/package/doxygen/0001-Bug-776791-1.8.13-Regression-Segfault-building-the-b.patch
@@ -0,0 +1,30 @@
+From 0f02761a158a5e9ddbd5801682482af8986dbc35 Mon Sep 17 00:00:00 2001
+From: albert-github <albert.tests@gmail.com>
+Date: Wed, 4 Jan 2017 12:24:55 +0100
+Subject: [PATCH] Bug 776791 - [1.8.13 Regression] Segfault building the
+ breathe docs
+
+Protected against NULL pointer of variable al
+
+[Romain: backport from upstream]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/xmlgen.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/xmlgen.cpp b/src/xmlgen.cpp
+index fe95c7a..70e198a 100644
+--- a/src/xmlgen.cpp
++++ b/src/xmlgen.cpp
+@@ -620,7 +620,7 @@ static void generateXMLForMember(MemberDef *md,FTextStream &ti,FTextStream &t,De
+     if (md->isInline()) t << "yes"; else t << "no";
+     t << "\"";
+ 
+-    if (al->refQualifier!=RefQualifierNone)
++    if (al!=0 && al->refQualifier!=RefQualifierNone)
+     {
+       t << " refqual=\"";
+       if (al->refQualifier==RefQualifierLValue) t << "lvalue"; else t << "rvalue";
+-- 
+2.9.4
+
