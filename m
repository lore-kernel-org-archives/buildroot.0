From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 May 2019 10:06:45 +0200
Subject: [Buildroot] [git commit] package/mono-gtksharp3: fix build with
 latest mono
Message-ID: <20190523080209.AA746885DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ceab2715da41e95f8481a3aee546be6170f0fd8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/7cae5b32285fe0edf69eab3297be9c6a4e76b7b8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch b/package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch
new file mode 100644
index 0000000000..6596849a89
--- /dev/null
+++ b/package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch
@@ -0,0 +1,28 @@
+From c1b9bd4214b78dc426bc6e6a07c23a8ab4ab50ea Mon Sep 17 00:00:00 2001
+From: Jordi Mas <jmas@softcatala.org>
+Date: Tue, 12 Mar 2019 12:24:19 +0100
+Subject: [PATCH] Fixes MONO_PROFILE_ENTER_LEAVE undeclared when compiling with
+ newer versions of Mono (#266)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/mono/gtk-sharp/commit/c1b9bd4214b78dc426bc6e6a07c23a8ab4ab50ea]
+---
+ gtk/gui-thread-check/profiler/gui-thread-check.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gtk/gui-thread-check/profiler/gui-thread-check.c b/gtk/gui-thread-check/profiler/gui-thread-check.c
+index 11838e3b0..9f45fe6b2 100644
+--- a/gtk/gui-thread-check/profiler/gui-thread-check.c
++++ b/gtk/gui-thread-check/profiler/gui-thread-check.c
+@@ -86,6 +86,10 @@ simple_method_enter (MonoProfiler *prof, MonoMethod *method)
+ 	}
+ }
+ 
++#ifndef MONO_PROFILE_ENTER_LEAVE
++#define MONO_PROFILE_ENTER_LEAVE (1 << 12)
++#endif
++
+ void
+ mono_profiler_startup (const char *desc)
+ {
