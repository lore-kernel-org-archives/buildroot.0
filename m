From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 12:12:06 +0100
Subject: [Buildroot] [git commit] ola: add upstream patch to fix build on
	AArch64
Message-ID: <20131122145920.DD0129BD8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b14cab5864dd943d2be6232432ee2172b044cd67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

   http://autobuild.buildroot.org/results/596/5967dfd4bd7c2b68e2911a98b9b84c8fe7adf0aa/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ola/ola-0001-fix-build-warning.patch |   27 ++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

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
