From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  6 Mar 2018 07:05:53 +0200
Subject: [Buildroot] [PATCH] iptables: fix build with older kernel headers
Message-ID: <732e96c8f30e874d16bc42df3e721b3386cf7da7.1520312753.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iptables version 1.6.2 uses the BPF_OBJ_GET macro that is only available
since kernel version 4.4. Add a patch fixing the detection of the
feature availability.

Fixes:
http://autobuild.buildroot.net/results/e67/e670548c4b250e8a102a4929cafa85634fc79a3d/
http://autobuild.buildroot.net/results/1a7/1a7ab509440c9acacf606f238b8989d9b4287d52/
http://autobuild.buildroot.net/results/555/55583e20bcdf602132c074e08d1a49507d5a48ad/

Cc: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...libxt_bpf-Fix-build-with-old-kernel-versi.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/iptables/0001-extensions-libxt_bpf-Fix-build-with-old-kernel-versi.patch

diff --git a/package/iptables/0001-extensions-libxt_bpf-Fix-build-with-old-kernel-versi.patch b/package/iptables/0001-extensions-libxt_bpf-Fix-build-with-old-kernel-versi.patch
new file mode 100644
index 000000000000..966cbe31ab62
--- /dev/null
+++ b/package/iptables/0001-extensions-libxt_bpf-Fix-build-with-old-kernel-versi.patch
@@ -0,0 +1,49 @@
+From 5beb1582d13d3bfdd0d2b277f5f3154b2fbf4a8e Mon Sep 17 00:00:00 2001
+From: Hauke Mehrtens <hauke@hauke-m.de>
+Date: Tue, 27 Feb 2018 16:56:55 +0100
+Subject: [PATCH] extensions: libxt_bpf: Fix build with old kernel versions
+
+In kernel 3.18 the union bpf_attr does not have a pathname attribute and
+BPF_OBJ_GET is also not defined in these versions.
+This was added in Linux commit b2197755b263 ("bpf: add support for
+persistent maps/progs"). Check for the BPF_FS_MAGIC define which was
+also added in this Linux commit and only activate this code in case we
+find that define.
+
+This fixes a build problem with Linux 3.18.
+Netfilter bug: #1231
+
+Fixes: f17f9ace8a8 ("extensions: libxt_bpf: support ebpf pinned objects")
+Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit 5beb1582d13d
+
+ extensions/libxt_bpf.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/extensions/libxt_bpf.c b/extensions/libxt_bpf.c
+index 9510c190f315..92958247c756 100644
+--- a/extensions/libxt_bpf.c
++++ b/extensions/libxt_bpf.c
+@@ -22,6 +22,7 @@
+ #include <linux/bpf.h>
+ #endif
+ 
++#include <linux/magic.h>
+ #include <linux/unistd.h>
+ 
+ #define BCODE_FILE_MAX_LEN_B	1024
+@@ -62,7 +63,7 @@ static const struct xt_option_entry bpf_opts_v1[] = {
+ 
+ static int bpf_obj_get(const char *filepath)
+ {
+-#if defined HAVE_LINUX_BPF_H && defined __NR_bpf
++#if defined HAVE_LINUX_BPF_H && defined __NR_bpf && defined BPF_FS_MAGIC
+ 	union bpf_attr attr;
+ 
+ 	memset(&attr, 0, sizeof(attr));
+-- 
+2.16.1
+
-- 
2.16.1
