From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Nov 2013 23:18:24 +0100
Subject: [Buildroot] [PATCH 1/2] ola: add upstream patch to fix build on
	AArch64
Message-ID: <1385072305-9127-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

   http://autobuild.buildroot.org/results/596/5967dfd4bd7c2b68e2911a98b9b84c8fe7adf0aa/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
A new version of Ola, 0.8.33 has been released, it would be good to
bump the version in the future version of Buildroot.
---
 package/ola/ola-0001-fix-build-warning.patch | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/ola/ola-0001-fix-build-warning.patch

diff --git a/package/ola/ola-0001-fix-build-warning.patch b/package/ola/ola-0001-fix-build-warning.patch
new file mode 100644
index 0000000..1fdb58f
--- /dev/null
+++ b/package/ola/ola-0001-fix-build-warning.patch
@@ -0,0 +1,27 @@
+Fix build on 64 bits architectures
+
+This upstream patch fixes a warning that, due to -Werror, is causing
+build failures on 64 bits architectures.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+commit ea375582b0bfee93d66608ffc807078ffc48e961
+Author: Simon Newton <nomis52@gmail.com>
+Date:   Wed Oct 30 09:23:49 2013 -0700
+
+    * Avoid a compiler warning
+
+diff --git a/plugins/e131/e131/PreamblePacker.cpp b/plugins/e131/e131/PreamblePacker.cpp
+index ef29e18..8dfcc72 100644
+--- a/plugins/e131/e131/PreamblePacker.cpp
++++ b/plugins/e131/e131/PreamblePacker.cpp
+@@ -77,7 +77,8 @@ const uint8_t *PreamblePacker::Pack(const PDUBlock<PDU> &pdu_block,
+   if (!m_send_buffer)
+     Init();
+ 
+-  unsigned int size = MAX_DATAGRAM_SIZE - sizeof(ACN_HEADER);
++  unsigned int size = MAX_DATAGRAM_SIZE -
++      static_cast<unsigned int>(sizeof(ACN_HEADER));
+   if (!pdu_block.Pack(m_send_buffer + sizeof(ACN_HEADER), &size)) {
+     OLA_WARN << "Failed to pack E1.31 PDU";
+     return NULL;
-- 
1.8.1.2
