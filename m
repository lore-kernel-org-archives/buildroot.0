From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 10:29:53 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/binutils/2.32:
 backport or1k upstream patch
Message-ID: <20191030092335.8CBAC8DF17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f22adbe885cb728369756d07fff8969e3cd2edf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Without this patch, the system build using qemu_or1k_defconfig
(gcc 9.2, binutils 2.32 and uClibc 1.0.32) doesn't boot.

https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001895.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e1c7dffb254fbefaa929af4443e4b35439a84221)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...correct-value-in-PLT-GOT-entries-causing-.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/binutils/2.32/0006-or1k-Fix-incorrect-value-in-PLT-GOT-entries-causing-.patch b/package/binutils/2.32/0006-or1k-Fix-incorrect-value-in-PLT-GOT-entries-causing-.patch
new file mode 100644
index 0000000000..8527b66733
--- /dev/null
+++ b/package/binutils/2.32/0006-or1k-Fix-incorrect-value-in-PLT-GOT-entries-causing-.patch
@@ -0,0 +1,46 @@
+From b17678f639f953d687d96cd52690e7cbfae50f91 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Fri, 23 Aug 2019 22:25:55 +0900
+Subject: [PATCH] or1k: Fix incorrect value in PLT GOT entries, causing
+ infinite loop
+
+The PLT GOT entry should point to the first PLT entry which contains the
+runtime linker function.  It was pointing back to the symbol PLT entry
+causing an infinite loop.
+
+I found this when testing the OpenRISC glibc port which uses the runtime
+dynamic linker.  It seems other libc's we use so far have not been
+making use of the initial PLT GOT entries.
+
+bfd/ChangeLog:
+
+	* elf32-or1k.c (or1k_elf_finish_dynamic_symbol): Use correct value for
+	PLT GOT entries.
+
+(cherry picked from commit 09f7b0de537d465fc8ed9f9433e348c1bc78aab2)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ bfd/elf32-or1k.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 2f200b197b8..32839cfa7b6 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2379,8 +2379,11 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+       or1k_write_plt_entry (output_bfd, splt->contents + h->plt.offset,
+ 			    plt0, plt1, plt2, OR1K_JR(12));
+ 
+-      /* Fill in the entry in the global offset table.  */
+-      bfd_put_32 (output_bfd, plt_addr, sgot->contents + got_offset);
++      /* Fill in the entry in the global offset table.  We initialize it to
++	 point to the top of the plt.  This is done to lazy lookup the actual
++	 symbol as the first plt entry will be setup by libc to call the
++	 runtime dynamic linker.  */
++      bfd_put_32 (output_bfd, plt_base_addr, sgot->contents + got_offset);
+ 
+       /* Fill in the entry in the .rela.plt section.  */
+       rela.r_offset = got_addr;
+-- 
+2.23.0
+
