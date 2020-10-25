From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 25 Oct 2020 13:34:57 -0300
Subject: [Buildroot] [PATCH] package/tio: disable for sparc and sparc64
 architectures
Message-ID: <20201025163457.30460-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tio fails to build on sparc and sparc64 architectures with a
redefinition of 'struct termio' error, with no proper fix or workaround
for now. See discussions in [1] and [2] and picocom source code in [3].

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20191227204520.1500501-1-fontaine.fabrice at gmail.com/
[2] http://patchwork.ozlabs.org/project/buildroot/patch/20200511142602.46170-1-vadim4j at gmail.com/
[3] https://github.com/npat-efault/picocom/blob/master/termbits2.h#L37

So let's disable it for now on sparc and sparc64 architectures.

Fixes:
http://autobuild.buildroot.org/results/e041dde522e2a774f528d4377f67ca0a8a99461c
http://autobuild.buildroot.org/results/6e1f9fe47e8b2cfdf5effcb7bbc697189f54ff2c
http://autobuild.buildroot.org/results/49708fe6f404fea6761f102af854e98d6a1d43c1
Many more...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/tio/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/tio/Config.in b/package/tio/Config.in
index 6c748c5d12a1..d5d619100eb3 100644
--- a/package/tio/Config.in
+++ b/package/tio/Config.in
@@ -1,8 +1,15 @@
 config BR2_PACKAGE_TIO
 	bool "tio"
+	depends on !BR2_sparc64 && !BR2_sparc
 	help
 	  "tio" is a simple TTY terminal application which features a
 	  straightforward commandline interface to easily connect to
 	  TTY devices for basic input/output.
 
 	  https://tio.github.io/
+
+# tio is disabled for sparc and sparc64 architectures because it fails
+# to build with a redefinition of 'struct termio' error, with no proper
+# fix or workaround for now
+comment "tio is disabled for sparc and sparc64 architectures"
+	depends on BR2_sparc64 || BR2_sparc
-- 
2.17.1
