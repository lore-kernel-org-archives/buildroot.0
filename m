From: Arvid E. Picciani <aep@exys.org>
Date: Thu, 14 Dec 2017 11:57:05 +0100
Subject: [Buildroot] [PATCH 1/2] DTPMOD mod fix for musl's rcrt0
Message-ID: <20171214105706.4577-1-aep@exys.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://github.com/rust-lang/rust/issues/46566

Signed-off-by: Arvid E. Picciani <aep@exys.org>
---
 package/musl/0002-fix-rcrt1.o.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/musl/0002-fix-rcrt1.o.patch

diff --git a/package/musl/0002-fix-rcrt1.o.patch b/package/musl/0002-fix-rcrt1.o.patch
new file mode 100644
index 0000000000..3dae65569f
--- /dev/null
+++ b/package/musl/0002-fix-rcrt1.o.patch
@@ -0,0 +1,26 @@
+diff --git a/ldso/dlstart.c b/ldso/dlstart.c
+index 4dbe178..0dd1d5a 100644
+--- a/ldso/dlstart.c
++++ b/ldso/dlstart.c
+@@ -128,16 +128,18 @@ void _dlstart_c(size_t *sp, size_t *dynv)
+ 	rel = (void *)(base+dyn[DT_REL]);
+ 	rel_size = dyn[DT_RELSZ];
+ 	for (; rel_size; rel+=2, rel_size-=2*sizeof(size_t)) {
+-		if (!IS_RELATIVE(rel[1], 0)) continue;
+ 		size_t *rel_addr = (void *)(base + rel[0]);
++		if (rel[1] == REL_DTPMOD) *rel_addr = 1;
++		if (!IS_RELATIVE(rel[1], 0)) continue;
+ 		*rel_addr += base;
+ 	}
+ 
+ 	rel = (void *)(base+dyn[DT_RELA]);
+ 	rel_size = dyn[DT_RELASZ];
+ 	for (; rel_size; rel+=3, rel_size-=3*sizeof(size_t)) {
+-		if (!IS_RELATIVE(rel[1], 0)) continue;
+ 		size_t *rel_addr = (void *)(base + rel[0]);
++		if (rel[1] == REL_DTPMOD) *rel_addr = 1;
++		if (!IS_RELATIVE(rel[1], 0)) continue;
+ 		*rel_addr = base + rel[2];
+ 	}
+ #endif
+
-- 
2.15.1
