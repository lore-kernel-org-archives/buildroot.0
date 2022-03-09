Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07A5C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 21:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5367A40142;
	Wed,  9 Mar 2022 21:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yxqf9fC5vr1q; Wed,  9 Mar 2022 21:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE08F4055E;
	Wed,  9 Mar 2022 21:26:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73B421BF37E
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62E37418C3
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbC3XIdSscSy for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 21:26:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE0A9418BC
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 21:26:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:959:4871:d6cd:4ee3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E181913F854;
 Wed,  9 Mar 2022 22:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646861182;
 bh=ujhc0b6VFq22uWpqo98U52ZfCVwWx8xHqcYuWQF+y5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RsePoiD42FrxOzK3Be+Ity7ApIJe7Bh6GYLwW3WQ13fh2BOgtTAGEOS0hQvZPkE9/
 +GFY+fjzgwyfSX2/RbuHMZFBBk8ZLAecgJ5HADbBmQHChOWA4gulz0OLa/3MURaS11
 USSHeDv/8uoZIUtfsX9Gk26HWUITmvPy6AA762M8LVH/ZWKWflPQ2UHecdsOU7GSFz
 gDWT3sWNCNv7fHjXPdz1MBZtNvhJThoHdsftZBv4i5to2SSRpLf87t1/XNWzih5jF7
 9g+SWcc/VHrTqyxj70WhMpaBRZmtsaISG/xCmWQBiC9VRxVl52MN0EiL3D7GrYbI29
 gSyXwFwCvqvuQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 09 Mar 2022 22:26:18 +0100
Date: Wed, 9 Mar 2022 22:26:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220309212618.GE23050@scaer>
References: <20220309173503.527227-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220309173503.527227-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: fix build without
 threads
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-03-09 18:35 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure without threads raised since bump to
> version 3.7.3 in commit 212b020bb43f13121d6cde464f871d5d1cf6cfbe:
> 
> kx.c: In function '_gnutls_nss_keylog_write':
> kx.c:164:33: error: 'keylog_mutex' undeclared (first use in this function); did you mean 'keylog_once'?
>   164 |   if (gnutls_static_mutex_lock(&keylog_mutex) < 0) {
>       |                                 ^~~~~~~~~~~~
>       |                                 keylog_once
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e092bc11ce4b5908cb6285aa77a3594b8626eeec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...cks-define-lock-functions-as-a-macro.patch | 179 ++++++++++++++++++
>  1 file changed, 179 insertions(+)
>  create mode 100644 package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch
> 
> diff --git a/package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch b/package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch
> new file mode 100644
> index 0000000000..52965c051d
> --- /dev/null
> +++ b/package/gnutls/0001-locks-define-lock-functions-as-a-macro.patch
> @@ -0,0 +1,179 @@
> +From 5803bfa3d4febdcf32494e2c2c8f4731cb8be7cd Mon Sep 17 00:00:00 2001
> +From: Daiki Ueno <ueno@gnu.org>
> +Date: Wed, 9 Mar 2022 08:07:58 +0100
> +Subject: [PATCH] locks: define lock functions as a macro
> +
> +When threads are not supported, glthread_* functions are defined as
> +no-op and thus dereferencing lock variables in inline functions will
> +cause compilation error.  This change fixes it by redefining our lock
> +functions as a macro so it will also be compiled out.
> +
> +Reported by Fabrice Fontaine in:
> +https://gitlab.com/gnutls/gnutls/-/issues/1330
> +
> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
> +
> +[Retrieved from:
> +https://gitlab.com/gnutls/gnutls/-/commit/5803bfa3d4febdcf32494e2c2c8f4731cb8be7cd]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + lib/locks.c       | 54 -----------------------------------------------
> + lib/locks.h       | 28 ++++++++++++++++++------
> + lib/pkcs11.c      |  2 +-
> + lib/priority.c    |  2 +-
> + lib/verify-tofu.c |  2 +-
> + 5 files changed, 25 insertions(+), 63 deletions(-)
> +
> +diff --git a/lib/locks.c b/lib/locks.c
> +index d61504e077..8888ed6b12 100644
> +--- a/lib/locks.c
> ++++ b/lib/locks.c
> +@@ -63,57 +63,3 @@ gnutls_global_set_mutex(mutex_init_func init, mutex_deinit_func deinit,
> + 	gnutls_mutex_lock = lock;
> + 	gnutls_mutex_unlock = unlock;
> + }
> +-
> +-int
> +-gnutls_static_mutex_lock(gnutls_static_mutex_t lock)
> +-{
> +-	if (unlikely(glthread_lock_lock(lock))) {
> +-		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
> +-	}
> +-	return 0;
> +-}
> +-
> +-int
> +-gnutls_static_mutex_unlock(gnutls_static_mutex_t lock)
> +-{
> +-	if (unlikely(glthread_lock_unlock(lock))) {
> +-		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
> +-	}
> +-	return 0;
> +-}
> +-
> +-int
> +-gnutls_rwlock_rdlock(gnutls_rwlock_t rwlock)
> +-{
> +-	if (unlikely(glthread_rwlock_rdlock(rwlock))) {
> +-		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
> +-	}
> +-	return 0;
> +-}
> +-
> +-int
> +-gnutls_rwlock_wrlock(gnutls_rwlock_t rwlock)
> +-{
> +-	if (unlikely(glthread_rwlock_wrlock(rwlock))) {
> +-		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
> +-	}
> +-	return 0;
> +-}
> +-
> +-int
> +-gnutls_rwlock_unlock(gnutls_rwlock_t rwlock)
> +-{
> +-	if (unlikely(glthread_rwlock_unlock(rwlock))) {
> +-		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
> +-	}
> +-	return 0;
> +-}
> +-
> +-int
> +-gnutls_once(gnutls_once_t once, void (*init_func) (void))
> +-{
> +-	if (unlikely(glthread_once(once, init_func))) {
> +-		return gnutls_assert_val(GNUTLS_E_LOCKING_ERROR);
> +-	}
> +-	return 0;
> +-}
> +diff --git a/lib/locks.h b/lib/locks.h
> +index a1ff0fa9d7..907adfc134 100644
> +--- a/lib/locks.h
> ++++ b/lib/locks.h
> +@@ -40,8 +40,14 @@ extern mutex_unlock_func gnutls_mutex_unlock;
> +  */
> + #define GNUTLS_STATIC_MUTEX(lock) gl_lock_define_initialized(static, lock)
> + typedef gl_lock_t *gnutls_static_mutex_t;
> +-int gnutls_static_mutex_lock(gnutls_static_mutex_t lock);
> +-int gnutls_static_mutex_unlock(gnutls_static_mutex_t lock);
> ++
> ++#define gnutls_static_mutex_lock(LOCK)			\
> ++	(unlikely(glthread_lock_lock(LOCK)) ?		\
> ++	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
> ++
> ++#define gnutls_static_mutex_unlock(LOCK)		\
> ++	(unlikely(glthread_lock_unlock(LOCK)) ?		\
> ++	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
> + 
> + /* Unlike static mutexes, static rwlocks can be locked/unlocked with
> +  * the functions defined below, because there is no way to replace
> +@@ -50,13 +56,23 @@ int gnutls_static_mutex_unlock(gnutls_static_mutex_t lock);
> + #define GNUTLS_RWLOCK(rwlock) gl_rwlock_define_initialized(static, rwlock)
> + typedef gl_rwlock_t *gnutls_rwlock_t;
> + 
> +-int gnutls_rwlock_rdlock(gnutls_rwlock_t rwlock);
> +-int gnutls_rwlock_wrlock(gnutls_rwlock_t rwlock);
> +-int gnutls_rwlock_unlock(gnutls_rwlock_t rwlock);
> ++#define gnutls_rwlock_rdlock(RWLOCK)			\
> ++	(unlikely(glthread_rwlock_rdlock(RWLOCK)) ?	\
> ++	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
> ++
> ++#define gnutls_rwlock_wrlock(RWLOCK)			\
> ++	(unlikely(glthread_rwlock_wrlock(RWLOCK)) ?	\
> ++	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
> ++
> ++#define gnutls_rwlock_unlock(RWLOCK)			\
> ++	(unlikely(glthread_rwlock_unlock(RWLOCK)) ?	\
> ++	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
> + 
> + #define GNUTLS_ONCE(once) gl_once_define(static, once)
> + typedef gl_once_t *gnutls_once_t;
> + 
> +-int gnutls_once(gnutls_once_t once, void (*init_func) (void));
> ++#define gnutls_once(ONCE, INIT_FUNC)			\
> ++	(unlikely(glthread_once(ONCE, INIT_FUNC)) ?	\
> ++	gnutls_assert_val(GNUTLS_E_LOCKING_ERROR) : 0)
> + 
> + #endif /* GNUTLS_LIB_LOCKS_H */
> +diff --git a/lib/pkcs11.c b/lib/pkcs11.c
> +index 8dda0f07c9..ba8ac0c375 100644
> +--- a/lib/pkcs11.c
> ++++ b/lib/pkcs11.c
> +@@ -351,7 +351,7 @@ int _gnutls_pkcs11_check_init(init_level_t req_level, void *priv, pkcs11_reinit_
> + 	ret = sret;
> + 
> +  cleanup:
> +-	gnutls_static_mutex_unlock(&pkcs11_mutex);
> ++	(void)gnutls_static_mutex_unlock(&pkcs11_mutex);
> + 
> + 	return ret;
> + }
> +diff --git a/lib/priority.c b/lib/priority.c
> +index d17a923318..55ae185c1f 100644
> +--- a/lib/priority.c
> ++++ b/lib/priority.c
> +@@ -2505,7 +2505,7 @@ static int set_ciphersuite_list(gnutls_priority_t priority_cache)
> + 	}
> + 
> +  out:
> +-	gnutls_rwlock_unlock(&system_wide_config_rwlock);
> ++	(void)gnutls_rwlock_unlock(&system_wide_config_rwlock);
> + 	return ret;
> + }
> + 
> +diff --git a/lib/verify-tofu.c b/lib/verify-tofu.c
> +index 40b7acdc8a..97f47385e6 100644
> +--- a/lib/verify-tofu.c
> ++++ b/lib/verify-tofu.c
> +@@ -434,7 +434,7 @@ int store_pubkey(const char *db_name, const char *host,
> + 	if (fp != NULL)
> + 		fclose(fp);
> + 
> +-	gnutls_static_mutex_unlock(&file_mutex);
> ++	(void)gnutls_static_mutex_unlock(&file_mutex);
> + 	gnutls_free(b64key.data);
> + 
> + 	return ret;
> +-- 
> +GitLab
> +
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
