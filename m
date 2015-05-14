From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 14 May 2015 07:38:59 +0300
Subject: [Buildroot] [PATCH 1/2] binutils: fix xtensa ld bug triggered by
	--gc-sections
In-Reply-To: <1431578340-11753-1-git-send-email-jcmvbkbc@gmail.com>
References: <1431578340-11753-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1431578340-11753-2-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

elf_xtensa_gc_sweep_hook doesn't correctly unreference symbols that were
made local, that results in link failure with the following message:

  BFD (GNU Binutils) 2.24 internal error, aborting at elf32-xtensa.c line
  3372 in elf_xtensa_finish_dynamic_sections

elf_xtensa_gc_sweep_hook determines symbol reference type (PLT or GOT) by
relocation type. Relocation types are not changed when symbol becomes
local, but its PLT references are added to GOT references and
plt.refcount is set to 0. Such symbol cannot be unreferences in the
elf_xtensa_gc_sweep_hook and its extra references make calculated GOT
relocations section size not match number of GOT relocations.

Fix it by treating PLT reference as GOT reference when plt.refcount is
not positive.

Fixes:
  http://autobuild.buildroot.net/results/3e2e24f697e26c93d4d95782b1cb7799fa620a7a/
  http://autobuild.buildroot.org/results/97d4c96d6f6cdc1ed4007456f4ab70be9dfa41b5/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 ...localized-symbol-refcounting-with-gc-sect.patch | 57 ++++++++++++++++++++++
 ...localized-symbol-refcounting-with-gc-sect.patch | 57 ++++++++++++++++++++++
 ...localized-symbol-refcounting-with-gc-sect.patch | 57 ++++++++++++++++++++++
 ...localized-symbol-refcounting-with-gc-sect.patch | 57 ++++++++++++++++++++++
 4 files changed, 228 insertions(+)
 create mode 100644 package/binutils/2.22/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
 create mode 100644 package/binutils/2.23.2/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
 create mode 100644 package/binutils/2.24/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
 create mode 100644 package/binutils/2.25/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch

diff --git a/package/binutils/2.22/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch b/package/binutils/2.22/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
new file mode 100644
index 0000000..9ad6b3b
--- /dev/null
+++ b/package/binutils/2.22/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
@@ -0,0 +1,57 @@
+From 8ec76b16f62d1bf386fb2c39af5f66c3afddc5cb Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 14 May 2015 05:22:55 +0300
+Subject: [PATCH] xtensa: fix localized symbol refcounting with --gc-sections
+
+elf_xtensa_gc_sweep_hook doesn't correctly unreference symbols that were
+made local, that results in link failure with the following message:
+
+  BFD (GNU Binutils) 2.24 internal error, aborting at elf32-xtensa.c line
+  3372 in elf_xtensa_finish_dynamic_sections
+
+elf_xtensa_gc_sweep_hook determines symbol reference type (PLT or GOT) by
+relocation type. Relocation types are not changed when symbol becomes
+local, but its PLT references are added to GOT references and
+plt.refcount is set to 0. Such symbol cannot be unreferences in the
+elf_xtensa_gc_sweep_hook and its extra references make calculated GOT
+relocations section size not match number of GOT relocations.
+
+Fix it by treating PLT reference as GOT reference when plt.refcount is
+not positive.
+
+2015-05-14  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (elf_xtensa_gc_sweep_hook): Treat PLT reference
+	as GOT reference when plt.refcount is not positive.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: e6c9a083ec5ae7a45bd71682b26aae1939849388
+Changes to ChangeLog are dropped.
+
+ bfd/elf32-xtensa.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 53af1c6..2523670 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -1360,10 +1360,14 @@ elf_xtensa_gc_sweep_hook (bfd *abfd,
+ 	{
+ 	  if (is_plt)
+ 	    {
++	      /* If the symbol has been localized its plt.refcount got moved
++	         to got.refcount.  Handle it as GOT.  */
+ 	      if (h->plt.refcount > 0)
+ 		h->plt.refcount--;
++	      else
++		is_got = TRUE;
+ 	    }
+-	  else if (is_got)
++	  if (is_got)
+ 	    {
+ 	      if (h->got.refcount > 0)
+ 		h->got.refcount--;
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.23.2/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch b/package/binutils/2.23.2/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
new file mode 100644
index 0000000..9ad6b3b
--- /dev/null
+++ b/package/binutils/2.23.2/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
@@ -0,0 +1,57 @@
+From 8ec76b16f62d1bf386fb2c39af5f66c3afddc5cb Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 14 May 2015 05:22:55 +0300
+Subject: [PATCH] xtensa: fix localized symbol refcounting with --gc-sections
+
+elf_xtensa_gc_sweep_hook doesn't correctly unreference symbols that were
+made local, that results in link failure with the following message:
+
+  BFD (GNU Binutils) 2.24 internal error, aborting at elf32-xtensa.c line
+  3372 in elf_xtensa_finish_dynamic_sections
+
+elf_xtensa_gc_sweep_hook determines symbol reference type (PLT or GOT) by
+relocation type. Relocation types are not changed when symbol becomes
+local, but its PLT references are added to GOT references and
+plt.refcount is set to 0. Such symbol cannot be unreferences in the
+elf_xtensa_gc_sweep_hook and its extra references make calculated GOT
+relocations section size not match number of GOT relocations.
+
+Fix it by treating PLT reference as GOT reference when plt.refcount is
+not positive.
+
+2015-05-14  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (elf_xtensa_gc_sweep_hook): Treat PLT reference
+	as GOT reference when plt.refcount is not positive.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: e6c9a083ec5ae7a45bd71682b26aae1939849388
+Changes to ChangeLog are dropped.
+
+ bfd/elf32-xtensa.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 53af1c6..2523670 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -1360,10 +1360,14 @@ elf_xtensa_gc_sweep_hook (bfd *abfd,
+ 	{
+ 	  if (is_plt)
+ 	    {
++	      /* If the symbol has been localized its plt.refcount got moved
++	         to got.refcount.  Handle it as GOT.  */
+ 	      if (h->plt.refcount > 0)
+ 		h->plt.refcount--;
++	      else
++		is_got = TRUE;
+ 	    }
+-	  else if (is_got)
++	  if (is_got)
+ 	    {
+ 	      if (h->got.refcount > 0)
+ 		h->got.refcount--;
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.24/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch b/package/binutils/2.24/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
new file mode 100644
index 0000000..9ad6b3b
--- /dev/null
+++ b/package/binutils/2.24/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
@@ -0,0 +1,57 @@
+From 8ec76b16f62d1bf386fb2c39af5f66c3afddc5cb Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 14 May 2015 05:22:55 +0300
+Subject: [PATCH] xtensa: fix localized symbol refcounting with --gc-sections
+
+elf_xtensa_gc_sweep_hook doesn't correctly unreference symbols that were
+made local, that results in link failure with the following message:
+
+  BFD (GNU Binutils) 2.24 internal error, aborting at elf32-xtensa.c line
+  3372 in elf_xtensa_finish_dynamic_sections
+
+elf_xtensa_gc_sweep_hook determines symbol reference type (PLT or GOT) by
+relocation type. Relocation types are not changed when symbol becomes
+local, but its PLT references are added to GOT references and
+plt.refcount is set to 0. Such symbol cannot be unreferences in the
+elf_xtensa_gc_sweep_hook and its extra references make calculated GOT
+relocations section size not match number of GOT relocations.
+
+Fix it by treating PLT reference as GOT reference when plt.refcount is
+not positive.
+
+2015-05-14  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (elf_xtensa_gc_sweep_hook): Treat PLT reference
+	as GOT reference when plt.refcount is not positive.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: e6c9a083ec5ae7a45bd71682b26aae1939849388
+Changes to ChangeLog are dropped.
+
+ bfd/elf32-xtensa.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 53af1c6..2523670 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -1360,10 +1360,14 @@ elf_xtensa_gc_sweep_hook (bfd *abfd,
+ 	{
+ 	  if (is_plt)
+ 	    {
++	      /* If the symbol has been localized its plt.refcount got moved
++	         to got.refcount.  Handle it as GOT.  */
+ 	      if (h->plt.refcount > 0)
+ 		h->plt.refcount--;
++	      else
++		is_got = TRUE;
+ 	    }
+-	  else if (is_got)
++	  if (is_got)
+ 	    {
+ 	      if (h->got.refcount > 0)
+ 		h->got.refcount--;
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.25/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch b/package/binutils/2.25/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
new file mode 100644
index 0000000..9ad6b3b
--- /dev/null
+++ b/package/binutils/2.25/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
@@ -0,0 +1,57 @@
+From 8ec76b16f62d1bf386fb2c39af5f66c3afddc5cb Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 14 May 2015 05:22:55 +0300
+Subject: [PATCH] xtensa: fix localized symbol refcounting with --gc-sections
+
+elf_xtensa_gc_sweep_hook doesn't correctly unreference symbols that were
+made local, that results in link failure with the following message:
+
+  BFD (GNU Binutils) 2.24 internal error, aborting at elf32-xtensa.c line
+  3372 in elf_xtensa_finish_dynamic_sections
+
+elf_xtensa_gc_sweep_hook determines symbol reference type (PLT or GOT) by
+relocation type. Relocation types are not changed when symbol becomes
+local, but its PLT references are added to GOT references and
+plt.refcount is set to 0. Such symbol cannot be unreferences in the
+elf_xtensa_gc_sweep_hook and its extra references make calculated GOT
+relocations section size not match number of GOT relocations.
+
+Fix it by treating PLT reference as GOT reference when plt.refcount is
+not positive.
+
+2015-05-14  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (elf_xtensa_gc_sweep_hook): Treat PLT reference
+	as GOT reference when plt.refcount is not positive.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: e6c9a083ec5ae7a45bd71682b26aae1939849388
+Changes to ChangeLog are dropped.
+
+ bfd/elf32-xtensa.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 53af1c6..2523670 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -1360,10 +1360,14 @@ elf_xtensa_gc_sweep_hook (bfd *abfd,
+ 	{
+ 	  if (is_plt)
+ 	    {
++	      /* If the symbol has been localized its plt.refcount got moved
++	         to got.refcount.  Handle it as GOT.  */
+ 	      if (h->plt.refcount > 0)
+ 		h->plt.refcount--;
++	      else
++		is_got = TRUE;
+ 	    }
+-	  else if (is_got)
++	  if (is_got)
+ 	    {
+ 	      if (h->got.refcount > 0)
+ 		h->got.refcount--;
+-- 
+1.8.1.4
+
-- 
1.8.1.4
