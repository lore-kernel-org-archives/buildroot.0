From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 15 Apr 2016 01:11:01 +0200
Subject: [Buildroot] [PATCH v2] qt: Fix musl build
In-Reply-To: <1453554406-14574-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453554406-14574-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460675461-24046-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is adapted from Qt5 [1].

This helps to make sure that QT_SOCKLEN_T is defined to be 'int' only when its
glibc < 2 and not also for the libraries which may define it as per standards
but are not glibc, e.g. musl.

Fixes the following build error:
In file included from ../../include/QtNetwork/private/qnet_unix_p.h:1:0,
                 from kernel/qnetworkinterface_unix.cpp:46:
../../include/QtNetwork/private/../../../src/network/socket/qnet_unix_p.h: In function 'int qt_safe_accept(int, sockaddr*, int*, int)':
../../include/QtNetwork/private/../../../src/network/socket/qnet_unix_p.h:121:76: error: invalid conversion from 'int*' to 'socklen_t* {aka unsigned int*}' [-fpermissive]

Fixes:
http://autobuild.buildroot.net/results/709/709d547699596d09b4601a7940677d2010adeedf/
http://autobuild.buildroot.net/results/f05/f0589e1d06404a7bd57f5734228afe45164e553d/

[1]
https://github.com/qtproject/qtbase/commit/813f468a14fb84af43c1f8fc0a1430277358eba2

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
v2:
 - replace patch taken from Qt5
---
 ...tform-socklen_t-on-other-C-libraries-than.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/qt/0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch

diff --git a/package/qt/0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch b/package/qt/0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
new file mode 100644
index 0000000..a2fff60
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
