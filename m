From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Mar 2020 20:02:32 +0100
Subject: [Buildroot] [PATCH 2/2] package/libvncserver: fix CVE-2019-15681
In-Reply-To: <20200303190232.226493-1-fontaine.fabrice@gmail.com>
References: <20200303190232.226493-1-fontaine.fabrice@gmail.com>
Message-ID: <20200303190232.226493-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LibVNC commit before d01e1bb4246323ba6fcee3b82ef1faa9b1dac82a contains a
memory leak (CWE-655) in VNC server code, which allow an attacker to
read stack memory and can be abused for information disclosure. Combined
with another vulnerability, it can be used to leak stack memory and
bypass ASLR. This attack appear to be exploitable via network
connectivity. These vulnerabilities have been fixed in commit
d01e1bb4246323ba6fcee3b82ef1faa9b1dac82a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...on-t-leak-stack-memory-to-the-remote.patch | 26 +++++++++++++++++++
 package/libvncserver/libvncserver.mk          |  3 +++
 2 files changed, 29 insertions(+)
 create mode 100644 package/libvncserver/0004-rfbserver-don-t-leak-stack-memory-to-the-remote.patch

diff --git a/package/libvncserver/0004-rfbserver-don-t-leak-stack-memory-to-the-remote.patch b/package/libvncserver/0004-rfbserver-don-t-leak-stack-memory-to-the-remote.patch
new file mode 100644
index 0000000000..056b940cdf
--- /dev/null
+++ b/package/libvncserver/0004-rfbserver-don-t-leak-stack-memory-to-the-remote.patch
@@ -0,0 +1,26 @@
+From d01e1bb4246323ba6fcee3b82ef1faa9b1dac82a Mon Sep 17 00:00:00 2001
+From: Christian Beier <dontmind@freeshell.org>
+Date: Mon, 19 Aug 2019 22:32:25 +0200
+Subject: [PATCH] rfbserver: don't leak stack memory to the remote
+
+Thanks go to Pavel Cheremushkin of Kaspersky for reporting.
+[Retrieved from:
+https://github.com/LibVNC/libvncserver/commit/d01e1bb4246323ba6fcee3b82ef1faa9b1dac82a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libvncserver/rfbserver.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libvncserver/rfbserver.c b/libvncserver/rfbserver.c
+index 3bacc891..310e5487 100644
+--- a/libvncserver/rfbserver.c
++++ b/libvncserver/rfbserver.c
+@@ -3724,6 +3724,8 @@ rfbSendServerCutText(rfbScreenInfoPtr rfbScreen,char *str, int len)
+     rfbServerCutTextMsg sct;
+     rfbClientIteratorPtr iterator;
+ 
++    memset((char *)&sct, 0, sizeof(sct));
++
+     iterator = rfbGetClientIterator(rfbScreen);
+     while ((cl = rfbClientIteratorNext(iterator)) != NULL) {
+         sct.type = rfbServerCutText;
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 79db2dad83..5b8648fa6d 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -16,6 +16,9 @@ LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
 # 0003-Limit-lenght-to-INT_MAX-bytes-in-rfbProcessFileTransferReadBuffer.patch
 LIBVNCSERVER_IGNORE_CVES += CVE-2018-20750
 
+# 0004-rfbserver-don-t-leak-stack-memory-to-the-remote.patch
+LIBVNCSERVER_IGNORE_CVES += CVE-2019-15681
+
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += \
 	-DWITH_FFMPEG=OFF \
-- 
2.25.0
