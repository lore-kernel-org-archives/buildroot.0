From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 12:04:49 +0100
Subject: [Buildroot] [git commit] package/mono: fix build with powerpc
Message-ID: <20200215105640.E48E58E094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b56e60e583b770ef9db8a76d960d9d91dcdd05d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/fff0dd08f71facbe367d982d19158ee084ae8047

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...elete-leftover-code-from-pre-monoctx-area.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/mono/0004-ppc32-delete-leftover-code-from-pre-monoctx-area.patch b/package/mono/0004-ppc32-delete-leftover-code-from-pre-monoctx-area.patch
new file mode 100644
index 0000000000..cfda7fdfaa
--- /dev/null
+++ b/package/mono/0004-ppc32-delete-leftover-code-from-pre-monoctx-area.patch
@@ -0,0 +1,33 @@
+From 121928d29ac1e0aebb80531b3ebcca1a9ffcd618 Mon Sep 17 00:00:00 2001
+From: Bernhard Urban-Forster <lewurm@gmail.com>
+Date: Fri, 6 Dec 2019 11:35:11 +0100
+Subject: [PATCH] [ppc32] delete leftover code from pre-monoctx area (#18072)
+
+Also update assert which doesn't make sense since we have moved over to MonoContext
+
+Some context: e7011c780f676914f559f14f25e76c192bb2b0b2
+
+Fixes: https://github.com/mono/mono/issues/18064
+[Retrieved from:
+https://github.com/mono/mono/commit/121928d29ac1e0aebb80531b3ebcca1a9ffcd618]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ mono/mini/exceptions-ppc.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/mono/mini/exceptions-ppc.c b/mono/mini/exceptions-ppc.c
+index 44d09bcaba1d..d14f8383eba9 100644
+--- a/mono/mini/exceptions-ppc.c
++++ b/mono/mini/exceptions-ppc.c
+@@ -692,10 +692,7 @@ mono_arch_handle_altstack_exception (void *sigctx, MONO_SIG_HANDLER_INFO_TYPE *s
+ 	/* may need to adjust pointers in the new struct copy, depending on the OS */
+ 	uc_copy = (MonoContext*)(sp + 16);
+ 	mono_sigctx_to_monoctx (uc, uc_copy);
+-#if defined(__linux__) && !defined(__mono_ppc64__)
+-	uc_copy->uc_mcontext.uc_regs = (gpointer)((char*)uc_copy + ((char*)uc->uc_mcontext.uc_regs - (char*)uc));
+-#endif
+-	g_assert (mono_arch_ip_from_context (uc) == mono_arch_ip_from_context (uc_copy));
++	g_assert (mono_arch_ip_from_context (uc) == MONO_CONTEXT_GET_IP (uc_copy));
+ 	/* at the return form the signal handler execution starts in altstack_handle_and_restore() */
+ 	UCONTEXT_REG_LNK(uc) = UCONTEXT_REG_NIP(uc);
+ #ifdef PPC_USES_FUNCTION_DESCRIPTOR
