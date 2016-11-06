From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 14:39:01 +0100
Subject: [Buildroot] [git commit] binutils: add patch to 2.27 to fix arm
	issue with file having no data
Message-ID: <20161106134005.612B0802F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7027bf022b9c9d488d53e3168af1cf16c6e41a0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to binutils 2.27, which fixes the build of
kvmtool on ARM. The fix is taken from the upstream mailing list at
https://lists.gnu.org/archive/html/bug-binutils/2016-08/msg00165.html.

Fixes:

  http://autobuild.buildroot.net/results/bae83d495b46efeec45c8008949c811b6241adaa

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../binutils/2.27/0100-elf32-arm-no-data-fix.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/binutils/2.27/0100-elf32-arm-no-data-fix.patch b/package/binutils/2.27/0100-elf32-arm-no-data-fix.patch
new file mode 100644
index 0000000..c6b0e7e
--- /dev/null
+++ b/package/binutils/2.27/0100-elf32-arm-no-data-fix.patch
@@ -0,0 +1,22 @@
+bfd/ChangeLog
+2016-08-23  Nick Clifton  <address@hidden>
+
+        * elf32-arm.c (elf32_arm_count_additional_relocs): Return zero if
+        there is no arm data associated with the section.
+
+[Thomas: taken from https://lists.gnu.org/archive/html/bug-binutils/2016-08/msg00165.html.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+diff --git a/bfd/elf32-arm.c b/bfd/elf32-arm.c
+index 1eba21b..4478238 100644
+--- a/bfd/elf32-arm.c
++++ b/bfd/elf32-arm.c
+@@ -18688,7 +18688,7 @@ elf32_arm_count_additional_relocs (asection *sec)
+ {
+   struct _arm_elf_section_data *arm_data;
+   arm_data = get_arm_elf_section_data (sec);
+-  return arm_data->additional_reloc_count;
++  return arm_data == NULL ? 0 : arm_data->additional_reloc_count;
+ }
+ 
+ /* Called to set the sh_flags, sh_link and sh_info fields of OSECTION which
