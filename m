From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 23:34:20 +0100
Subject: [Buildroot] [git commit] package/libiec61850: fix CVE-2020-15158
Message-ID: <20210109221602.A33B28103D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3663d810ca04ddfc3dce616ffe28aad909e156ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In libIEC61850 before version 1.4.3, when a message with COTP message
length field with value < 4 is received an integer underflow will happen
leading to heap buffer overflow. This can cause an application crash or
on some platforms even the execution of remote code. If your application
is used in open networks or there are untrusted nodes in the network it
is highly recommend to apply the patch. This was patched with commit
033ab5b. Users of version 1.4.x should upgrade to version 1.4.3 when
available. As a workaround changes of commit 033ab5b can be applied to
older versions.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...eap-buffer-overflow-when-handling-message.patch | 27 ++++++++++++++++++++++
 package/libiec61850/libiec61850.mk                 |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/package/libiec61850/0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch b/package/libiec61850/0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch
new file mode 100644
index 0000000000..88048555b7
--- /dev/null
+++ b/package/libiec61850/0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch
@@ -0,0 +1,27 @@
+From 033ab5b6488250c8c3b838f25a7cbc3e099230bb Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Wed, 12 Aug 2020 07:25:37 +0200
+Subject: [PATCH] - COTP: fixed possible heap buffer overflow when handling
+ message with invalid (zero) value in length field (#250)
+
+[Retrieved from:
+https://github.com/mz-automation/libiec61850/commit/033ab5b6488250c8c3b838f25a7cbc3e099230bb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/mms/iso_cotp/cotp.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/mms/iso_cotp/cotp.c b/src/mms/iso_cotp/cotp.c
+index cbb34b36..8c37d262 100644
+--- a/src/mms/iso_cotp/cotp.c
++++ b/src/mms/iso_cotp/cotp.c
+@@ -720,6 +720,9 @@ CotpConnection_readToTpktBuffer(CotpConnection* self)
+             goto exit_waiting;
+     }
+ 
++    if (self->packetSize <= bufPos)
++        goto exit_error;
++
+     readBytes = readFromSocket(self, buffer + bufPos, self->packetSize - bufPos);
+ 
+     if (readBytes < 0)
diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 9d527f5831..6413073805 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -12,4 +12,7 @@ LIBIEC61850_LICENSE_FILES = COPYING
 LIBIEC61850_CONF_OPTS = -DBUILD_EXAMPLES=OFF \
 	-DBUILD_PYTHON_BINDINGS=OFF
 
+# 0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch
+LIBIEC61850_IGNORE_CVES += CVE-2020-15158
+
 $(eval $(cmake-package))
