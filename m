Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90AFC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:11:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EFE3610FF
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EFE3610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BB4940455;
	Thu,  5 Aug 2021 11:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id visAzb3sVvIF; Thu,  5 Aug 2021 11:11:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59994404E3;
	Thu,  5 Aug 2021 11:11:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9611E1BF844
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9275460A7F
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEv6Alqo7HV5 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:11:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0BC860A7C
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:11:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 882698B827; Thu,  5 Aug 2021 11:11:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 13:08:09 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 27e2d2d98a9de9ca5f31b9ee1ab8a486c494dd58
X-Git-Newrev: c4e934ca71f7817ea1f24aca718696823ef2cce6
X-Patchwork-Hint: ignore
Message-Id: <20210805111119.882698B827@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gdb: fix gdb
 segfault with Python 3.9 support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=c4e934ca71f7817ea1f24aca718696823ef2cce6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

When enabling Python 3 support in gdb < 10, gdb segfaults at startup.

The issue is was resolved by the following upstream gdb commit,
present since gdb 10.1:

    commit c47bae859a5af0d95224d90000df0e529f7c5aa0
    Author: Kevin Buettner <kevinb@redhat.com>
    Date:   Wed May 27 20:05:40 2020 -0700

        Fix Python3.9 related runtime problems
        [...]

This commit backports this fix to all relevant gdb versions supported
in Buildroot.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5609c63f0b1b11f4c036c2203b01fa697968d173)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Fix-Python3.9-related-runtime-problems.patch | 193 ++++++++++++++++++
 ...07-Fix-Python3.9-related-runtime-problems.patch | 193 ++++++++++++++++++
 ...07-Fix-Python3.9-related-runtime-problems.patch | 227 +++++++++++++++++++++
 3 files changed, 613 insertions(+)

diff --git a/package/gdb/4ecb98fbc2f94dbe01b69384afbc515107de73df/0001-Fix-Python3.9-related-runtime-problems.patch b/package/gdb/4ecb98fbc2f94dbe01b69384afbc515107de73df/0001-Fix-Python3.9-related-runtime-problems.patch
new file mode 100644
index 0000000000..8c2a9d3d5b
--- /dev/null
+++ b/package/gdb/4ecb98fbc2f94dbe01b69384afbc515107de73df/0001-Fix-Python3.9-related-runtime-problems.patch
@@ -0,0 +1,193 @@
+From 8342feee01e4e8d38affcf35e47ad900567f42e0 Mon Sep 17 00:00:00 2001
+From: Kevin Buettner <kevinb@redhat.com>
+Date: Wed, 27 May 2020 20:05:40 -0700
+Subject: [PATCH] Fix Python3.9 related runtime problems
+
+Python3.9b1 is now available on Rawhide.  GDB w/ Python 3.9 support
+can be built using the configure switch -with-python=/usr/bin/python3.9.
+
+Attempting to run gdb/Python3.9 segfaults on startup:
+
+    #0  0x00007ffff7b0582c in PyEval_ReleaseLock () from /lib64/libpython3.9.so.1.0
+    #1  0x000000000069ccbf in do_start_initialization ()
+	at worktree-test1/gdb/python/python.c:1789
+    #2  _initialize_python ()
+	at worktree-test1/gdb/python/python.c:1877
+    #3  0x00000000007afb0a in initialize_all_files () at init.c:237
+    ...
+
+Consulting the the documentation...
+
+https://docs.python.org/3/c-api/init.html
+
+...we find that PyEval_ReleaseLock() has been deprecated since version
+3.2.  It recommends using PyEval_SaveThread or PyEval_ReleaseThread()
+instead.  In do_start_initialization, in gdb/python/python.c, we
+can replace the calls to PyThreadState_Swap() and PyEval_ReleaseLock()
+with a single call to PyEval_SaveThread.   (Thanks to Keith Seitz
+for working this out.)
+
+With that in place, GDB gets a little bit further.  It still dies
+on startup, but the backtrace is different:
+
+    #0  0x00007ffff7b04306 in PyOS_InterruptOccurred ()
+       from /lib64/libpython3.9.so.1.0
+    #1  0x0000000000576e86 in check_quit_flag ()
+	at worktree-test1/gdb/extension.c:776
+    #2  0x0000000000576f8a in set_active_ext_lang (now_active=now_active@entry=0x983c00 <extension_language_python>)
+	at worktree-test1/gdb/extension.c:705
+    #3  0x000000000069d399 in gdbpy_enter::gdbpy_enter (this=0x7fffffffd2d0,
+	gdbarch=0x0, language=0x0)
+	at worktree-test1/gdb/python/python.c:211
+    #4  0x0000000000686e00 in python_new_inferior (inf=0xddeb10)
+	at worktree-test1/gdb/python/py-inferior.c:251
+    #5  0x00000000005d9fb9 in std::function<void (inferior*)>::operator()(inferior*) const (__args#0=<optimized out>, this=0xccad20)
+	at /usr/include/c++/10/bits/std_function.h:617
+    #6  gdb::observers::observable<inferior*>::notify (args#0=0xddeb10,
+	this=<optimized out>)
+	at worktree-test1/gdb/../gdbsupport/observable.h:106
+    #7  add_inferior_silent (pid=0)
+	at worktree-test1/gdb/inferior.c:113
+    #8  0x00000000005dbcb8 in initialize_inferiors ()
+	at worktree-test1/gdb/inferior.c:947
+    ...
+
+We checked with some Python Developers and were told that we should
+acquire the GIL prior to calling any Python C API function.  We
+definitely don't have the GIL for calls of PyOS_InterruptOccurred().
+
+I moved class_gdbpy_gil earlier in the file and use it in
+gdbpy_check_quit_flag() to acquire (and automatically release) the
+GIL.
+
+With those changes in place, I was able to run to a GDB prompt.  But,
+when trying to quit, it segfaulted again due to due to some other
+problems with gdbpy_check_quit_flag():
+
+    Thread 1 "gdb" received signal SIGSEGV, Segmentation fault.
+    0x00007ffff7bbab0c in new_threadstate () from /lib64/libpython3.9.so.1.0
+    (top-gdb) bt 8
+    #0  0x00007ffff7bbab0c in new_threadstate () from /lib64/libpython3.9.so.1.0
+    #1  0x00007ffff7afa5ea in PyGILState_Ensure.cold ()
+       from /lib64/libpython3.9.so.1.0
+    #2  0x000000000069b58c in gdbpy_gil::gdbpy_gil (this=<synthetic pointer>)
+	at worktree-test1/gdb/python/python.c:278
+    #3  gdbpy_check_quit_flag (extlang=<optimized out>)
+	at worktree-test1/gdb/python/python.c:278
+    #4  0x0000000000576e96 in check_quit_flag ()
+	at worktree-test1/gdb/extension.c:776
+    #5  0x000000000057700c in restore_active_ext_lang (previous=0xe9c050)
+	at worktree-test1/gdb/extension.c:729
+    #6  0x000000000088913a in do_my_cleanups (
+	pmy_chain=0xc31870 <final_cleanup_chain>,
+	old_chain=0xae5720 <sentinel_cleanup>)
+	at worktree-test1/gdbsupport/cleanups.cc:131
+    #7  do_final_cleanups ()
+	at worktree-test1/gdbsupport/cleanups.cc:143
+
+In this case, we're trying to call a Python C API function after
+Py_Finalize() has been called from finalize_python().  I made
+finalize_python set gdb_python_initialized to false and then cause
+check_quit_flag() to return early when it's false.
+
+With these changes in place, GDB seems to be working again with
+Python3.9b1.  I think it likely that there are other problems lurking.
+I wouldn't be surprised to find that there are other calls into Python
+where we don't first make sure that we have the GIL.  Further changes
+may well be needed.
+
+I see no regressions testing on Rawhide using a GDB built with the
+default Python version (3.8.3) versus one built using Python 3.9b1.
+
+I've also tested on Fedora 28, 29, 30, 31, and 32 (all x86_64) using
+the default (though updated) system installed versions of Python on
+those OSes.  This means that I've tested against Python versions
+2.7.15, 2.7.17, 2.7.18, 3.7.7, 3.8.2, and 3.8.3.  In each case GDB
+still builds without problem and shows no regressions after applying
+this patch.
+
+gdb/ChangeLog:
+
+2020-MM-DD  Kevin Buettner  <kevinb@redhat.com>
+	    Keith Seitz  <keiths@redhat.com>
+
+	* python/python.c (do_start_initialization): For Python 3.9 and
+	later, call PyEval_SaveThread instead of PyEval_ReleaseLock.
+	(class gdbpy_gil): Move to earlier in file.
+	(finalize_python): Set gdb_python_initialized.
+	(gdbpy_check_quit_flag): Acquire GIL via gdbpy_gil.  Return early
+	when not initialized.
+
+[import into Buildroot, removing ChangeLog change to avoid conflict]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+---
+ gdb/python/python.c | 32 ++++++++++++++++++++++++++++++--
+ 1 file changed, 30 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/python/python.c b/gdb/python/python.c
+index b00b70be85b..0eee3f0397c 100644
+--- a/gdb/python/python.c
++++ b/gdb/python/python.c
+@@ -268,6 +268,30 @@ ensure_python_env (struct gdbarch *gdbarch,
+   return make_cleanup (restore_python_env, env);
+ }
+ 
++/* A helper class to save and restore the GIL, but without touching
++   the other globals that are handled by gdbpy_enter.  */
++
++class gdbpy_gil
++{
++public:
++
++  gdbpy_gil ()
++    : m_state (PyGILState_Ensure ())
++  {
++  }
++
++  ~gdbpy_gil ()
++  {
++    PyGILState_Release (m_state);
++  }
++
++  DISABLE_COPY_AND_ASSIGN (gdbpy_gil);
++
++private:
++
++  PyGILState_STATE m_state;
++};
++
+ /* Set the quit flag.  */
+ 
+ static void
+@@ -281,6 +305,10 @@ gdbpy_set_quit_flag (const struct extension_language_defn *extlang)
+ static int
+ gdbpy_check_quit_flag (const struct extension_language_defn *extlang)
+ {
++  if (!gdb_python_initialized)
++    return 0;
++
++  gdbpy_gil gil;
+   return PyOS_InterruptOccurred ();
+ }
+ 
+@@ -1620,6 +1648,7 @@ finalize_python (void *ignore)
+ 
+   Py_Finalize ();
+ 
++  gdb_python_initialized = false;
+   restore_active_ext_lang (previous_active);
+ }
+ #endif
+@@ -1854,8 +1883,7 @@ message == an error message without a stack will be printed."),
+     goto fail;
+ 
+   /* Release the GIL while gdb runs.  */
+-  PyThreadState_Swap (NULL);
+-  PyEval_ReleaseLock ();
++  PyEval_SaveThread ();
+ 
+   make_final_cleanup (finalize_python, NULL);
+ 
+-- 
+2.31.1
+
diff --git a/package/gdb/8.3.1/0007-Fix-Python3.9-related-runtime-problems.patch b/package/gdb/8.3.1/0007-Fix-Python3.9-related-runtime-problems.patch
new file mode 100644
index 0000000000..63cfa1bd3e
--- /dev/null
+++ b/package/gdb/8.3.1/0007-Fix-Python3.9-related-runtime-problems.patch
@@ -0,0 +1,193 @@
+From 51ef4f6ec819259d4a57fa4155ee78700918f8ff Mon Sep 17 00:00:00 2001
+From: Kevin Buettner <kevinb@redhat.com>
+Date: Wed, 27 May 2020 20:05:40 -0700
+Subject: [PATCH] Fix Python3.9 related runtime problems
+
+Python3.9b1 is now available on Rawhide.  GDB w/ Python 3.9 support
+can be built using the configure switch -with-python=/usr/bin/python3.9.
+
+Attempting to run gdb/Python3.9 segfaults on startup:
+
+    #0  0x00007ffff7b0582c in PyEval_ReleaseLock () from /lib64/libpython3.9.so.1.0
+    #1  0x000000000069ccbf in do_start_initialization ()
+	at worktree-test1/gdb/python/python.c:1789
+    #2  _initialize_python ()
+	at worktree-test1/gdb/python/python.c:1877
+    #3  0x00000000007afb0a in initialize_all_files () at init.c:237
+    ...
+
+Consulting the the documentation...
+
+https://docs.python.org/3/c-api/init.html
+
+...we find that PyEval_ReleaseLock() has been deprecated since version
+3.2.  It recommends using PyEval_SaveThread or PyEval_ReleaseThread()
+instead.  In do_start_initialization, in gdb/python/python.c, we
+can replace the calls to PyThreadState_Swap() and PyEval_ReleaseLock()
+with a single call to PyEval_SaveThread.   (Thanks to Keith Seitz
+for working this out.)
+
+With that in place, GDB gets a little bit further.  It still dies
+on startup, but the backtrace is different:
+
+    #0  0x00007ffff7b04306 in PyOS_InterruptOccurred ()
+       from /lib64/libpython3.9.so.1.0
+    #1  0x0000000000576e86 in check_quit_flag ()
+	at worktree-test1/gdb/extension.c:776
+    #2  0x0000000000576f8a in set_active_ext_lang (now_active=now_active@entry=0x983c00 <extension_language_python>)
+	at worktree-test1/gdb/extension.c:705
+    #3  0x000000000069d399 in gdbpy_enter::gdbpy_enter (this=0x7fffffffd2d0,
+	gdbarch=0x0, language=0x0)
+	at worktree-test1/gdb/python/python.c:211
+    #4  0x0000000000686e00 in python_new_inferior (inf=0xddeb10)
+	at worktree-test1/gdb/python/py-inferior.c:251
+    #5  0x00000000005d9fb9 in std::function<void (inferior*)>::operator()(inferior*) const (__args#0=<optimized out>, this=0xccad20)
+	at /usr/include/c++/10/bits/std_function.h:617
+    #6  gdb::observers::observable<inferior*>::notify (args#0=0xddeb10,
+	this=<optimized out>)
+	at worktree-test1/gdb/../gdbsupport/observable.h:106
+    #7  add_inferior_silent (pid=0)
+	at worktree-test1/gdb/inferior.c:113
+    #8  0x00000000005dbcb8 in initialize_inferiors ()
+	at worktree-test1/gdb/inferior.c:947
+    ...
+
+We checked with some Python Developers and were told that we should
+acquire the GIL prior to calling any Python C API function.  We
+definitely don't have the GIL for calls of PyOS_InterruptOccurred().
+
+I moved class_gdbpy_gil earlier in the file and use it in
+gdbpy_check_quit_flag() to acquire (and automatically release) the
+GIL.
+
+With those changes in place, I was able to run to a GDB prompt.  But,
+when trying to quit, it segfaulted again due to due to some other
+problems with gdbpy_check_quit_flag():
+
+    Thread 1 "gdb" received signal SIGSEGV, Segmentation fault.
+    0x00007ffff7bbab0c in new_threadstate () from /lib64/libpython3.9.so.1.0
+    (top-gdb) bt 8
+    #0  0x00007ffff7bbab0c in new_threadstate () from /lib64/libpython3.9.so.1.0
+    #1  0x00007ffff7afa5ea in PyGILState_Ensure.cold ()
+       from /lib64/libpython3.9.so.1.0
+    #2  0x000000000069b58c in gdbpy_gil::gdbpy_gil (this=<synthetic pointer>)
+	at worktree-test1/gdb/python/python.c:278
+    #3  gdbpy_check_quit_flag (extlang=<optimized out>)
+	at worktree-test1/gdb/python/python.c:278
+    #4  0x0000000000576e96 in check_quit_flag ()
+	at worktree-test1/gdb/extension.c:776
+    #5  0x000000000057700c in restore_active_ext_lang (previous=0xe9c050)
+	at worktree-test1/gdb/extension.c:729
+    #6  0x000000000088913a in do_my_cleanups (
+	pmy_chain=0xc31870 <final_cleanup_chain>,
+	old_chain=0xae5720 <sentinel_cleanup>)
+	at worktree-test1/gdbsupport/cleanups.cc:131
+    #7  do_final_cleanups ()
+	at worktree-test1/gdbsupport/cleanups.cc:143
+
+In this case, we're trying to call a Python C API function after
+Py_Finalize() has been called from finalize_python().  I made
+finalize_python set gdb_python_initialized to false and then cause
+check_quit_flag() to return early when it's false.
+
+With these changes in place, GDB seems to be working again with
+Python3.9b1.  I think it likely that there are other problems lurking.
+I wouldn't be surprised to find that there are other calls into Python
+where we don't first make sure that we have the GIL.  Further changes
+may well be needed.
+
+I see no regressions testing on Rawhide using a GDB built with the
+default Python version (3.8.3) versus one built using Python 3.9b1.
+
+I've also tested on Fedora 28, 29, 30, 31, and 32 (all x86_64) using
+the default (though updated) system installed versions of Python on
+those OSes.  This means that I've tested against Python versions
+2.7.15, 2.7.17, 2.7.18, 3.7.7, 3.8.2, and 3.8.3.  In each case GDB
+still builds without problem and shows no regressions after applying
+this patch.
+
+gdb/ChangeLog:
+
+2020-MM-DD  Kevin Buettner  <kevinb@redhat.com>
+	    Keith Seitz  <keiths@redhat.com>
+
+	* python/python.c (do_start_initialization): For Python 3.9 and
+	later, call PyEval_SaveThread instead of PyEval_ReleaseLock.
+	(class gdbpy_gil): Move to earlier in file.
+	(finalize_python): Set gdb_python_initialized.
+	(gdbpy_check_quit_flag): Acquire GIL via gdbpy_gil.  Return early
+	when not initialized.
+
+[import into Buildroot, removing ChangeLog change to avoid conflict]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+---
+ gdb/python/python.c | 32 ++++++++++++++++++++++++++++++--
+ 1 file changed, 30 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/python/python.c b/gdb/python/python.c
+index c23db2c1261..0b77354630e 100644
+--- a/gdb/python/python.c
++++ b/gdb/python/python.c
+@@ -235,6 +235,30 @@ gdbpy_enter::~gdbpy_enter ()
+   restore_active_ext_lang (m_previous_active);
+ }
+ 
++/* A helper class to save and restore the GIL, but without touching
++   the other globals that are handled by gdbpy_enter.  */
++
++class gdbpy_gil
++{
++public:
++
++  gdbpy_gil ()
++    : m_state (PyGILState_Ensure ())
++  {
++  }
++
++  ~gdbpy_gil ()
++  {
++    PyGILState_Release (m_state);
++  }
++
++  DISABLE_COPY_AND_ASSIGN (gdbpy_gil);
++
++private:
++
++  PyGILState_STATE m_state;
++};
++
+ /* Set the quit flag.  */
+ 
+ static void
+@@ -248,6 +272,10 @@ gdbpy_set_quit_flag (const struct extension_language_defn *extlang)
+ static int
+ gdbpy_check_quit_flag (const struct extension_language_defn *extlang)
+ {
++  if (!gdb_python_initialized)
++    return 0;
++
++  gdbpy_gil gil;
+   return PyOS_InterruptOccurred ();
+ }
+ 
+@@ -1573,6 +1601,7 @@ finalize_python (void *ignore)
+ 
+   Py_Finalize ();
+ 
++  gdb_python_initialized = false;
+   restore_active_ext_lang (previous_active);
+ }
+ 
+@@ -1736,8 +1765,7 @@ do_start_initialization ()
+     return false;
+ 
+   /* Release the GIL while gdb runs.  */
+-  PyThreadState_Swap (NULL);
+-  PyEval_ReleaseLock ();
++  PyEval_SaveThread ();
+ 
+   make_final_cleanup (finalize_python, NULL);
+ 
+-- 
+2.31.1
+
diff --git a/package/gdb/9.2/0007-Fix-Python3.9-related-runtime-problems.patch b/package/gdb/9.2/0007-Fix-Python3.9-related-runtime-problems.patch
new file mode 100644
index 0000000000..89b0cdc4a0
--- /dev/null
+++ b/package/gdb/9.2/0007-Fix-Python3.9-related-runtime-problems.patch
@@ -0,0 +1,227 @@
+From c47bae859a5af0d95224d90000df0e529f7c5aa0 Mon Sep 17 00:00:00 2001
+From: Kevin Buettner <kevinb@redhat.com>
+Date: Wed, 27 May 2020 20:05:40 -0700
+Subject: [PATCH] Fix Python3.9 related runtime problems
+
+Python3.9b1 is now available on Rawhide.  GDB w/ Python 3.9 support
+can be built using the configure switch -with-python=/usr/bin/python3.9.
+
+Attempting to run gdb/Python3.9 segfaults on startup:
+
+    #0  0x00007ffff7b0582c in PyEval_ReleaseLock () from /lib64/libpython3.9.so.1.0
+    #1  0x000000000069ccbf in do_start_initialization ()
+	at worktree-test1/gdb/python/python.c:1789
+    #2  _initialize_python ()
+	at worktree-test1/gdb/python/python.c:1877
+    #3  0x00000000007afb0a in initialize_all_files () at init.c:237
+    ...
+
+Consulting the the documentation...
+
+https://docs.python.org/3/c-api/init.html
+
+...we find that PyEval_ReleaseLock() has been deprecated since version
+3.2.  It recommends using PyEval_SaveThread or PyEval_ReleaseThread()
+instead.  In do_start_initialization, in gdb/python/python.c, we
+can replace the calls to PyThreadState_Swap() and PyEval_ReleaseLock()
+with a single call to PyEval_SaveThread.   (Thanks to Keith Seitz
+for working this out.)
+
+With that in place, GDB gets a little bit further.  It still dies
+on startup, but the backtrace is different:
+
+    #0  0x00007ffff7b04306 in PyOS_InterruptOccurred ()
+       from /lib64/libpython3.9.so.1.0
+    #1  0x0000000000576e86 in check_quit_flag ()
+	at worktree-test1/gdb/extension.c:776
+    #2  0x0000000000576f8a in set_active_ext_lang (now_active=now_active@entry=0x983c00 <extension_language_python>)
+	at worktree-test1/gdb/extension.c:705
+    #3  0x000000000069d399 in gdbpy_enter::gdbpy_enter (this=0x7fffffffd2d0,
+	gdbarch=0x0, language=0x0)
+	at worktree-test1/gdb/python/python.c:211
+    #4  0x0000000000686e00 in python_new_inferior (inf=0xddeb10)
+	at worktree-test1/gdb/python/py-inferior.c:251
+    #5  0x00000000005d9fb9 in std::function<void (inferior*)>::operator()(inferior*) const (__args#0=<optimized out>, this=0xccad20)
+	at /usr/include/c++/10/bits/std_function.h:617
+    #6  gdb::observers::observable<inferior*>::notify (args#0=0xddeb10,
+	this=<optimized out>)
+	at worktree-test1/gdb/../gdbsupport/observable.h:106
+    #7  add_inferior_silent (pid=0)
+	at worktree-test1/gdb/inferior.c:113
+    #8  0x00000000005dbcb8 in initialize_inferiors ()
+	at worktree-test1/gdb/inferior.c:947
+    ...
+
+We checked with some Python Developers and were told that we should
+acquire the GIL prior to calling any Python C API function.  We
+definitely don't have the GIL for calls of PyOS_InterruptOccurred().
+
+I moved class_gdbpy_gil earlier in the file and use it in
+gdbpy_check_quit_flag() to acquire (and automatically release) the
+GIL.
+
+With those changes in place, I was able to run to a GDB prompt.  But,
+when trying to quit, it segfaulted again due to due to some other
+problems with gdbpy_check_quit_flag():
+
+    Thread 1 "gdb" received signal SIGSEGV, Segmentation fault.
+    0x00007ffff7bbab0c in new_threadstate () from /lib64/libpython3.9.so.1.0
+    (top-gdb) bt 8
+    #0  0x00007ffff7bbab0c in new_threadstate () from /lib64/libpython3.9.so.1.0
+    #1  0x00007ffff7afa5ea in PyGILState_Ensure.cold ()
+       from /lib64/libpython3.9.so.1.0
+    #2  0x000000000069b58c in gdbpy_gil::gdbpy_gil (this=<synthetic pointer>)
+	at worktree-test1/gdb/python/python.c:278
+    #3  gdbpy_check_quit_flag (extlang=<optimized out>)
+	at worktree-test1/gdb/python/python.c:278
+    #4  0x0000000000576e96 in check_quit_flag ()
+	at worktree-test1/gdb/extension.c:776
+    #5  0x000000000057700c in restore_active_ext_lang (previous=0xe9c050)
+	at worktree-test1/gdb/extension.c:729
+    #6  0x000000000088913a in do_my_cleanups (
+	pmy_chain=0xc31870 <final_cleanup_chain>,
+	old_chain=0xae5720 <sentinel_cleanup>)
+	at worktree-test1/gdbsupport/cleanups.cc:131
+    #7  do_final_cleanups ()
+	at worktree-test1/gdbsupport/cleanups.cc:143
+
+In this case, we're trying to call a Python C API function after
+Py_Finalize() has been called from finalize_python().  I made
+finalize_python set gdb_python_initialized to false and then cause
+check_quit_flag() to return early when it's false.
+
+With these changes in place, GDB seems to be working again with
+Python3.9b1.  I think it likely that there are other problems lurking.
+I wouldn't be surprised to find that there are other calls into Python
+where we don't first make sure that we have the GIL.  Further changes
+may well be needed.
+
+I see no regressions testing on Rawhide using a GDB built with the
+default Python version (3.8.3) versus one built using Python 3.9b1.
+
+I've also tested on Fedora 28, 29, 30, 31, and 32 (all x86_64) using
+the default (though updated) system installed versions of Python on
+those OSes.  This means that I've tested against Python versions
+2.7.15, 2.7.17, 2.7.18, 3.7.7, 3.8.2, and 3.8.3.  In each case GDB
+still builds without problem and shows no regressions after applying
+this patch.
+
+gdb/ChangeLog:
+
+2020-MM-DD  Kevin Buettner  <kevinb@redhat.com>
+	    Keith Seitz  <keiths@redhat.com>
+
+	* python/python.c (do_start_initialization): For Python 3.9 and
+	later, call PyEval_SaveThread instead of PyEval_ReleaseLock.
+	(class gdbpy_gil): Move to earlier in file.
+	(finalize_python): Set gdb_python_initialized.
+	(gdbpy_check_quit_flag): Acquire GIL via gdbpy_gil.  Return early
+	when not initialized.
+
+
+[import into Buildroot, removing ChangeLog change to avoid conflict]
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+
+---
+ gdb/ChangeLog       | 10 ++++++++
+ gdb/python/python.c | 56 ++++++++++++++++++++++++---------------------
+ 2 files changed, 40 insertions(+), 26 deletions(-)
+
+diff --git a/gdb/python/python.c b/gdb/python/python.c
+index 67f362b852d..4bdd2201abc 100644
+--- a/gdb/python/python.c
++++ b/gdb/python/python.c
+@@ -238,6 +238,30 @@ gdbpy_enter::~gdbpy_enter ()
+   PyGILState_Release (m_state);
+ }
+ 
++/* A helper class to save and restore the GIL, but without touching
++   the other globals that are handled by gdbpy_enter.  */
++
++class gdbpy_gil
++{
++public:
++
++  gdbpy_gil ()
++    : m_state (PyGILState_Ensure ())
++  {
++  }
++
++  ~gdbpy_gil ()
++  {
++    PyGILState_Release (m_state);
++  }
++
++  DISABLE_COPY_AND_ASSIGN (gdbpy_gil);
++
++private:
++
++  PyGILState_STATE m_state;
++};
++
+ /* Set the quit flag.  */
+ 
+ static void
+@@ -251,6 +275,10 @@ gdbpy_set_quit_flag (const struct extension_language_defn *extlang)
+ static int
+ gdbpy_check_quit_flag (const struct extension_language_defn *extlang)
+ {
++  if (!gdb_python_initialized)
++    return 0;
++
++  gdbpy_gil gil;
+   return PyOS_InterruptOccurred ();
+ }
+ 
+@@ -943,30 +971,6 @@ gdbpy_source_script (const struct extension_language_defn *extlang,
+ 
+ /* Posting and handling events.  */
+ 
+-/* A helper class to save and restore the GIL, but without touching
+-   the other globals that are handled by gdbpy_enter.  */
+-
+-class gdbpy_gil
+-{
+-public:
+-
+-  gdbpy_gil ()
+-    : m_state (PyGILState_Ensure ())
+-  {
+-  }
+-
+-  ~gdbpy_gil ()
+-  {
+-    PyGILState_Release (m_state);
+-  }
+-
+-  DISABLE_COPY_AND_ASSIGN (gdbpy_gil);
+-
+-private:
+-
+-  PyGILState_STATE m_state;
+-};
+-
+ /* A single event.  */
+ struct gdbpy_event
+ {
+@@ -1616,6 +1620,7 @@ finalize_python (void *ignore)
+ 
+   Py_Finalize ();
+ 
++  gdb_python_initialized = false;
+   restore_active_ext_lang (previous_active);
+ }
+ 
+@@ -1785,8 +1790,7 @@ do_start_initialization ()
+     return false;
+ 
+   /* Release the GIL while gdb runs.  */
+-  PyThreadState_Swap (NULL);
+-  PyEval_ReleaseLock ();
++  PyEval_SaveThread ();
+ 
+   make_final_cleanup (finalize_python, NULL);
+ 
+-- 
+2.26.3
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
