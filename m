From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu,  9 Jul 2015 13:00:11 +0300
Subject: [Buildroot] [PATCH] quagga: disable PIE on ARC
Message-ID: <1436436011-8126-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though ARC gcc understands "-pie" option and attempts to generate
PIE binaries as of today PIE is not really supported for user-space
applications.

So we disable PIE detection if building for ARC.
That fixes http://autobuild.buildroot.net/results/ca0/ca0b1e271f29d7639b6a6e895472a35e2c1d8aba
and also prevents execution of non-supported PIE binary in runtime.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/quagga/quagga.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 756d6e0..ce1d34b 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -39,4 +39,8 @@ else
 QUAGGA_CONF_OPTS += --disable-vtysh
 endif
 
+ifeq ($(BR2_arc),y)
+QUAGGA_CONF_OPTS += --disable-pie
+endif
+
 $(eval $(autotools-package))
-- 
2.4.3
