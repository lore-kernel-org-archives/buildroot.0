Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEE9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 19:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FA2610BA;
	Tue, 12 Apr 2022 19:50:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuscRRrgegT9; Tue, 12 Apr 2022 19:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 079D4610B5;
	Tue, 12 Apr 2022 19:50:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 544951C1135
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F432610B9
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2T_rShQJ9DqF for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:49:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42C8A60E2A
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 19:49:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7C30E83B93; Tue, 12 Apr 2022 19:39:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 21:39:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99ea9343f2e4ee7f5b7dcccaef8320a9273bc28e
X-Git-Newrev: c809fa2d0fd8229f2712747f114eb802ed64d780
X-Patchwork-Hint: ignore
Message-Id: <20220412193953.7C30E83B93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: bump to version 3.7.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c809fa2d0fd8229f2712747f114eb802ed64d780
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...01-locks-define-lock-functions-as-a-macro.patch | 179 ---------------------
 package/gnutls/gnutls.hash                         |   4 +-
 package/gnutls/gnutls.mk                           |   2 +-
 3 files changed, 3 insertions(+), 182 deletions(-)

diff --git a/package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch b/package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch
deleted file mode 100644
index 52965c051d..0000000000
--- a/package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-From 5803bfa3d4febdcf32494e2c2c8f4731cb8be7cd Mon Sep 17 00:00:00 2001
-From: Daiki Ueno <ueno@gnu.org>
-Date: Wed, 9 Mar 2022 08:07:58 +0100
-Subject: [PATCH] locks: define lock functions as a macro
-
-When threads are not supported, glthread_* functions are defined as
-no-op and thus dereferencing lock variables in inline functions will
-cause compilation error.  This change fixes it by redefining our lock
-functions as a macro so it will also be compiled out.
-
-Reported by Fabrice Fontaine in:
-https://gitlab.com/gnutls/gnutls/-/issues/1330
-
-Signed-off-by: Daiki Ueno <ueno@gnu.org>
-
-[Retrieved from:
-https://gitlab.com/gnutls/gnutls/-/commit/5803bfa3d4febdcf32494e2c2c8f4731cb8be7cd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/locks.c       | 54 -----------------------------------------------
- lib/locks.h       | 28 ++++++++++++++++++------
- lib/pkcs11.c      |  2 +-
- lib/priority.c    |  2 +-
- lib/verify-tofu.c |  2 +-
- 5 files changed, 25 insertions(+), 63 deletions(-)
-
-diff --git a/lib/locks.c b/lib/locks.c
-index d61504e077..8888ed6b12 100644
---- a/lib/locks.c
-+++ b/lib/locks.c
-@@ -63,57 +63,3 @@ gnutls_global_set_mutex(mutex_init_func init, mutex_deinit_func deinit,
- 	gnutls_mutex_lock = lock;
- 	gnutls_mutex_unlock = unlock;
- }
--
--int
--gnutls_static_mutex_lock(gnutls_static_mutex_t lock)
--{
--	if (unlikely(glthread_lock_lock(lock))) {
--		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
--	}
--	return 0;
--}
--
--int
--gnutls_static_mutex_unlock(gnutls_static_mutex_t lock)
--{
--	if (unlikely(glthread_lock_unlock(lock))) {
--		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
--	}
--	return 0;
--}
--
--int
--gnutls_rwlock_rdlock(gnutls_rwlock_t rwlock)
--{
--	if (unlikely(glthread_rwlock_rdlock(rwlock))) {
--		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
--	}
--	return 0;
--}
--
--int
--gnutls_rwlock_wrlock(gnutls_rwlock_t rwlock)
--{
--	if (unlikely(glthread_rwlock_wrlock(rwlock))) {
--		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
--	}
--	return 0;
--}
--
--int
--gnutls_rwlock_unlock(gnutls_rwlock_t rwlock)
--{
--	if (unlikely(glthread_rwlock_unlock(rwlock))) {
--		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
--	}
--	return 0;
--}
--
--int
--gnutls_once(gnutls_once_t once, void (*init_func) (void))
--{
--	if (unlikely(glthread_once(once, init_func))) {
--		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
--	}
--	return 0;
--}
-diff --git a/lib/locks.h b/lib/locks.h
-index a1ff0fa9d7..907adfc134 100644
---- a/lib/locks.h
-+++ b/lib/locks.h
-@@ -40,8 +40,14 @@ extern mutex_unlock_func gnutls_mutex_unlock;
-  */
- #define GNUTLS_STATIC_MUTEX(lock) gl_lock_define_initialized(static, lock)
- typedef gl_lock_t *gnutls_static_mutex_t;
--int gnutls_static_mutex_lock(gnutls_static_mutex_t lock);
--int gnutls_static_mutex_unlock(gnutls_static_mutex_t lock);
-+
-+#define gnutls_static_mutex_lock(LOCK)			\
-+	(unlikely(glthread_lock_lock(LOCK)) ?		\
-+	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
-+
-+#define gnutls_static_mutex_unlock(LOCK)		\
-+	(unlikely(glthread_lock_unlock(LOCK)) ?		\
-+	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
- 
- /* Unlike static mutexes, static rwlocks can be locked/unlocked with
-  * the functions defined below, because there is no way to replace
-@@ -50,13 +56,23 @@ int gnutls_static_mutex_unlock(gnutls_static_mutex_t lock);
- #define GNUTLS_RWLOCK(rwlock) gl_rwlock_define_initialized(static, rwlock)
- typedef gl_rwlock_t *gnutls_rwlock_t;
- 
--int gnutls_rwlock_rdlock(gnutls_rwlock_t rwlock);
--int gnutls_rwlock_wrlock(gnutls_rwlock_t rwlock);
--int gnutls_rwlock_unlock(gnutls_rwlock_t rwlock);
-+#define gnutls_rwlock_rdlock(RWLOCK)			\
-+	(unlikely(glthread_rwlock_rdlock(RWLOCK)) ?	\
-+	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
-+
-+#define gnutls_rwlock_wrlock(RWLOCK)			\
-+	(unlikely(glthread_rwlock_wrlock(RWLOCK)) ?	\
-+	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
-+
-+#define gnutls_rwlock_unlock(RWLOCK)			\
-+	(unlikely(glthread_rwlock_unlock(RWLOCK)) ?	\
-+	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
- 
- #define GNUTLS_ONCE(once) gl_once_define(static, once)
- typedef gl_once_t *gnutls_once_t;
- 
--int gnutls_once(gnutls_once_t once, void (*init_func) (void));
-+#define gnutls_once(ONCE, INIT_FUNC)			\
-+	(unlikely(glthread_once(ONCE, INIT_FUNC)) ?	\
-+	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
- 
- #endif /* GNUTLS_LIB_LOCKS_H */
-diff --git a/lib/pkcs11.c b/lib/pkcs11.c
-index 8dda0f07c9..ba8ac0c375 100644
---- a/lib/pkcs11.c
-+++ b/lib/pkcs11.c
-@@ -351,7 +351,7 @@ int _gnutls_pkcs11_check_init(init_level_t req_level, void *priv, pkcs11_reinit_
- 	ret = sret;
- 
-  cleanup:
--	gnutls_static_mutex_unlock(&pkcs11_mutex);
-+	(void)gnutls_static_mutex_unlock(&pkcs11_mutex);
- 
- 	return ret;
- }
-diff --git a/lib/priority.c b/lib/priority.c
-index d17a923318..55ae185c1f 100644
---- a/lib/priority.c
-+++ b/lib/priority.c
-@@ -2505,7 +2505,7 @@ static int set_ciphersuite_list(gnutls_priority_t priority_cache)
- 	}
- 
-  out:
--	gnutls_rwlock_unlock(&system_wide_config_rwlock);
-+	(void)gnutls_rwlock_unlock(&system_wide_config_rwlock);
- 	return ret;
- }
- 
-diff --git a/lib/verify-tofu.c b/lib/verify-tofu.c
-index 40b7acdc8a..97f47385e6 100644
---- a/lib/verify-tofu.c
-+++ b/lib/verify-tofu.c
-@@ -434,7 +434,7 @@ int store_pubkey(const char *db_name, const char *host,
- 	if (fp != NULL)
- 		fclose(fp);
- 
--	gnutls_static_mutex_unlock(&file_mutex);
-+	(void)gnutls_static_mutex_unlock(&file_mutex);
- 	gnutls_free(b64key.data);
- 
- 	return ret;
--- 
-GitLab
-
diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 2ffc6c1b4e..c09e4665e5 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.3.tar.xz.sig
-sha256  fc59c43bc31ab20a6977ff083029277a31935b8355ce387b634fa433f8f6c49a  gnutls-3.7.3.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.4.tar.xz.sig
+sha256  e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f  gnutls-3.7.4.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 7317a3bb1e..0e461cd44c 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.7
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).3
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).4
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
