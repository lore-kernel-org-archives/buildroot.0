From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Mar 2011 23:54:12 +0100
Subject: [Buildroot] [PATCH 1/1] qt: disable isascii calls when undefined
Message-ID: <1300920852-21189-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...ale-disable-isascii-call-when-not-defined.patch |   47 ++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 package/qt/qt-4.7.2-qlocale-disable-isascii-call-when-not-defined.patch

diff --git a/package/qt/qt-4.7.2-qlocale-disable-isascii-call-when-not-defined.patch b/package/qt/qt-4.7.2-qlocale-disable-isascii-call-when-not-defined.patch
new file mode 100644
index 0000000..f3cc3df
--- /dev/null
+++ b/package/qt/qt-4.7.2-qlocale-disable-isascii-call-when-not-defined.patch
@@ -0,0 +1,47 @@
+From d2b483fea53a673a0dc9719717271615260e6ee7 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Wed, 23 Mar 2011 23:12:36 +0100
+Subject: qlocale: disable isascii call when not defined
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ src/corelib/tools/qlocale.cpp |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/src/corelib/tools/qlocale.cpp b/src/corelib/tools/qlocale.cpp
+index cfc8b33..9f03235 100644
+--- a/src/corelib/tools/qlocale.cpp
++++ b/src/corelib/tools/qlocale.cpp
+@@ -123,6 +123,7 @@ static qlonglong qstrtoll(const char *nptr, const char **endptr, register int ba
+ static qulonglong qstrtoull(const char *nptr, const char **endptr, register int base, bool *ok);
+ 
+ #if defined(Q_CC_MWERKS) && defined(Q_OS_WIN32)
++#   define __HAS_ISASCII
+ inline bool isascii(int c)
+ {
+         return (c >= 0 && c <=127);
+@@ -4704,8 +4705,10 @@ static qulonglong qstrtoull(const char *nptr, const char **endptr, register int
+     cutoff = qulonglong(ULLONG_MAX) / qbase;
+     cutlim = qulonglong(ULLONG_MAX) % qbase;
+     for (acc = 0, any = 0;; c = *s++) {
++#if defined(__HAS_ISASCII)
+         if (!isascii(c))
+             break;
++#endif
+         if (isdigit(c))
+             c -= '0';
+         else if (isalpha(c))
+@@ -4802,8 +4805,10 @@ static qlonglong qstrtoll(const char *nptr, const char **endptr, register int ba
+     cutlim = cutoff % qbase;
+     cutoff /= qbase;
+     for (acc = 0, any = 0;; c = *s++) {
++#if defined(__HAS_ISASCII)
+         if (!isascii(c))
+             break;
++#endif
+         if (isdigit(c))
+             c -= '0';
+         else if (isalpha(c))
+-- 
+1.7.0.4
+
-- 
1.7.0.4
