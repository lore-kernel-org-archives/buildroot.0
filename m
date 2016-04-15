From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 15 Apr 2016 08:40:36 +0200
Subject: [Buildroot] [PATCH v3] qt: Fix musl build
In-Reply-To: <1460675461-24046-1-git-send-email-joerg.krause@embedded.rocks>
References: <1460675461-24046-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1460702436-2666-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This helps to make sure that QT_SOCKLEN_T is defined to be 'int' only for legacy
glibc < 2 and not also for other libraries which may define it as per standards
but are not glibc, e.g. musl.

Fixes the following build error:
In file included from ../../include/QtNetwork/private/qnet_unix_p.h:1:0,
                 from kernel/qnetworkinterface_unix.cpp:46:
../../include/QtNetwork/private/../../../src/network/socket/qnet_unix_p.h: In function 'int qt_safe_accept(int, sockaddr*, int*, int)':
../../include/QtNetwork/private/../../../src/network/socket/qnet_unix_p.h:121:76: error: invalid conversion from 'int*' to 'socklen_t* {aka unsigned int*}' [-fpermissive]

Fixes:
http://autobuild.buildroot.net/results/709/709d547699596d09b4601a7940677d2010adeedf/
http://autobuild.buildroot.net/results/f05/f0589e1d06404a7bd57f5734228afe45164e553d/

Backported from Qt5:
https://github.com/qtproject/qtbase/commit/813f468a14fb84af43c1f8fc0a1430277358eba2

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Note: A first version for the package qt to fix the musl build was proposed by
Bernd Kuhls [1].

v3:
 - Add note about the first version of this patch submitted by Bernd Kuhls
 - Fix some comments

v2:
 - Replace proposed patch from v1 with a backported patch from Qt5

[1]
http://patchwork.ozlabs.org/patch/572101/

---
 ...tform-socklen_t-on-other-C-libraries-than.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/qt/0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch

diff --git a/package/qt/0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch b/package/qt/0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
new file mode 100644
index 0000000..9b16553
--- /dev/null
+++ b/package/qt/0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
@@ -0,0 +1,43 @@
+From 0bf90de93b9fe21df32319e27b2507154fa8a21d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 15 Apr 2016 00:37:26 +0200
+Subject: [PATCH] Fix for platform socklen_t on other C libraries than glibc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This helps to make sure that QT_SOCKLEN_T is defined to be 'int'
+only when its glibc < 2 and not also for the libraries which may define
+it as per standards but are not glibc, e.g. musl.
+
+This patch is adapted from Qt5 [1].
+
+[1]
+https://github.com/qtproject/qtbase/commit/813f468a14fb84af43c1f8fc0a1430277358eba2
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ mkspecs/linux-g++/qplatformdefs.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mkspecs/linux-g++/qplatformdefs.h b/mkspecs/linux-g++/qplatformdefs.h
+index de751dd..d4146ed 100644
+--- a/mkspecs/linux-g++/qplatformdefs.h
++++ b/mkspecs/linux-g++/qplatformdefs.h
+@@ -86,10 +86,10 @@
+ 
+ #undef QT_SOCKLEN_T
+ 
+-#if defined(__GLIBC__) && (__GLIBC__ >= 2)
+-#define QT_SOCKLEN_T            socklen_t
+-#else
++#if defined(__GLIBC__) && (__GLIBC__ < 2)
+ #define QT_SOCKLEN_T            int
++#else
++#define QT_SOCKLEN_T            socklen_t
+ #endif
+ 
+ #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
+-- 
+2.8.0
+
-- 
2.8.0
