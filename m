Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01226C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7920940231;
	Tue, 14 Dec 2021 21:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOe1WP102fHO; Tue, 14 Dec 2021 21:42:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FDDE4021D;
	Tue, 14 Dec 2021 21:42:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F01CA1BF3C8
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 21:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE99260C30
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 21:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5tjQcYqazhq for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 21:42:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D25D60C2B
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 21:42:49 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v11so34703079wrw.10
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 13:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3m7m7uJ+f5MDqbXQyRwIMzdn56sPBZfby0U+sS6FBf4=;
 b=RSkscJX/HT3oka89YZE0lTavMKXMCtVKFUvzuXiOFOJJXAE/zCBgi9nhBW/IQsVi0D
 xAwXZCxEzzqmAqaXoTYCxtMv2i7W6MgWyqdR8vEVLsLfLQSkq68lRWC8fqIEYaRmW8n9
 tc8Gq42UZ0kGlDW6+/Q4QkYQnAI3NTkZxYg3VcPqz8CeDajGhY6qlckdmuf0f5CM+z+L
 tRKeGzmuclMOsas52O80Nv46gIQgTszWkSXxXKeKw1ppF4/Dj9F0IiySqmgwajZgKiCY
 AyCNmIkq7AoqqBQmBO5lITyUg4WYiZMf5OLHMaN24uKGva3YVvkoBSdguaw/lIih3/4f
 Pf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3m7m7uJ+f5MDqbXQyRwIMzdn56sPBZfby0U+sS6FBf4=;
 b=7PMzbYiLCQHjhA4kEED81g445wwGqXl07lLY6+/NMC+8Ar+DXa6u3G1Xm8I94DZdvY
 QI4VDzlgmvnxXuIQ82Y3BlZ/HLD2gX7jO2OmR1/9rXs1JDDJVqh7XetSJZa3hiHo23/U
 MZmGjC3enhtJClX3DXJIRzTE0ALpHmftwlkoZybcYiJRqgCRhlQ8SWd2D+5316fkmAGn
 A8kutJbZUt2Iu1y423urQYBVdpwCYW2vqFrH5ihyNVul8+Nw+7O6EDc6gDAGsutWqQeM
 6B5R2iKn/vzdFnNV8CUlJ7HW22CyaRPRBA74Jbb3CHFrPlwk7kaHb7I0EYC9TsRteW+S
 65Yw==
X-Gm-Message-State: AOAM532W/nxxc6fPX00v4sL4kHMY0fKWJ08DiMgOcAObBanx4BbhLLCb
 +Nmbqn78RxvcmG3DnoEmbG07QKaBQOsB4g==
X-Google-Smtp-Source: ABdhPJzVpYFzdDcpJoQXh6+qEqj7zrgQUpy0KYemgngzMAvw1BDk9KCtmxY/sfjL8bmUK9kY14qU8g==
X-Received: by 2002:adf:ee45:: with SMTP id w5mr1574783wro.0.1639518167296;
 Tue, 14 Dec 2021 13:42:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id o12sm92004wrc.85.2021.12.14.13.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 13:42:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 22:42:23 +0100
Message-Id: <20211214214223.2292967-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/autofs: bump to version 5.1.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/tree/CHANGELOG?h=release_5_1_8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...7-use-default-stack-size-for-threads.patch | 124 ------------------
 package/autofs/autofs.hash                    |   2 +-
 package/autofs/autofs.mk                      |   2 +-
 3 files changed, 2 insertions(+), 126 deletions(-)
 delete mode 100644 package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch

diff --git a/package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch b/package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch
deleted file mode 100644
index f63c399fdc..0000000000
--- a/package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From 91edcc55c681dac41d2213b498ec6450aee22d9f Mon Sep 17 00:00:00 2001
-From: Ian Kent <raven@themaw.net>
-Date: Mon, 26 Jul 2021 13:18:38 +0800
-Subject: autofs-5.1.7 - use default stack size for threads
-
-autofs uses PTHREAD_STACK_MIN to set the stack size for threads it
-creates.
-
-In two cases it is used to reduce the stack size for long running
-service threads while it's used to allocate a larger stack for worker
-threads that can have larger memory requirements.
-
-In recent glibc releases PTHREAD_STACK_MIN is no longer a constant
-which can lead to unexpectedly different stack sizes on different
-architectures and the autofs assumption it's a constant causes a
-compile failure.
-
-The need to alter the stack size was due to observed stack overflow
-which was thought to be due the thread stack being too small for autofs
-and glibc alloca(3) usage.
-
-Quite a bit of that alloca(3) usage has been eliminated from autofs now,
-particularly those that might be allocating largish amounts of storage,
-and there has been a lot of change in glibc too so using the thread
-default stack should be ok.
-
-Signed-off-by: Ian Kent <raven@themaw.net>
-
-[Retrieved (and updated to drop CHANGELOG update) from:
-https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?id=91edcc55c681dac41d2213b498ec6450aee22d9f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CHANGELOG          |  1 +
- daemon/automount.c | 29 -----------------------------
- daemon/state.c     |  6 +-----
- lib/alarm.c        |  6 +-----
- 4 files changed, 3 insertions(+), 39 deletions(-)
-
-diff --git a/daemon/automount.c b/daemon/automount.c
-index 23235a7..d743235 100644
---- a/daemon/automount.c
-+++ b/daemon/automount.c
-@@ -84,7 +84,6 @@ static size_t kpkt_len;
- /* Attributes for creating detached and joinable threads */
- pthread_attr_t th_attr;
- pthread_attr_t th_attr_detached;
--size_t detached_thread_stack_size = PTHREAD_STACK_MIN * 144;
- 
- struct master_readmap_cond mrc = {
- 	PTHREAD_MUTEX_INITIALIZER, PTHREAD_COND_INITIALIZER, 0, NULL, 0, 0, 0, 0};
-@@ -2620,34 +2619,6 @@ int main(int argc, char *argv[])
- 		exit(1);
- 	}
- 
--#ifdef _POSIX_THREAD_ATTR_STACKSIZE
--	if (pthread_attr_setstacksize(
--			&th_attr_detached, detached_thread_stack_size)) {
--		logerr("%s: failed to set stack size thread attribute!",
--		       program);
--		if (start_pipefd[1] != -1) {
--			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
--			close(start_pipefd[1]);
--		}
--		release_flag_file();
--		macro_free_global_table();
--		exit(1);
--	}
--#endif
--
--	if (pthread_attr_getstacksize(
--			&th_attr_detached, &detached_thread_stack_size)) {
--		logerr("%s: failed to get detached thread stack size!",
--		       program);
--		if (start_pipefd[1] != -1) {
--			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
--			close(start_pipefd[1]);
--		}
--		release_flag_file();
--		macro_free_global_table();
--		exit(1);
--	}
--
- 	info(logging, "Starting automounter version %s, master map %s",
- 		version, master_list->name);
- 	info(logging, "using kernel protocol version %d.%02d",
-diff --git a/daemon/state.c b/daemon/state.c
-index 5156bb2..5df0561 100644
---- a/daemon/state.c
-+++ b/daemon/state.c
-@@ -1177,12 +1177,8 @@ int st_start_handler(void)
- 	status = pthread_attr_init(pattrs);
- 	if (status)
- 		pattrs = NULL;
--	else {
-+	else
- 		pthread_attr_setdetachstate(pattrs, PTHREAD_CREATE_DETACHED);
--#ifdef _POSIX_THREAD_ATTR_STACKSIZE
--		pthread_attr_setstacksize(pattrs, PTHREAD_STACK_MIN*4);
--#endif
--	}
- 
- 	status = pthread_create(&thid, pattrs, st_queue_handler, NULL);
- 
-diff --git a/lib/alarm.c b/lib/alarm.c
-index f27e13c..1631a9b 100755
---- a/lib/alarm.c
-+++ b/lib/alarm.c
-@@ -270,12 +270,8 @@ int alarm_start_handler(void)
- 	status = pthread_attr_init(pattrs);
- 	if (status)
- 		pattrs = NULL;
--	else {
-+	else
- 		pthread_attr_setdetachstate(pattrs, PTHREAD_CREATE_DETACHED);
--#ifdef _POSIX_THREAD_ATTR_STACKSIZE
--		pthread_attr_setstacksize(pattrs, PTHREAD_STACK_MIN*4);
--#endif
--	}
- 
- 	status = pthread_condattr_init(&condattrs);
- 	if (status)
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
index 10ca42ebed..97bc757d6b 100644
--- a/package/autofs/autofs.hash
+++ b/package/autofs/autofs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
-sha256  a36b268611b79b07051749870ba540b139938efc84bc0293244c483e94f9ced7  autofs-5.1.7.tar.xz
+sha256  b33d1059855664b20eeda26f3e28ff518fb0c3d58f565570af2ae569dc73c0fd  autofs-5.1.8.tar.xz
 
 # Hash for license files
 sha256  458028929f712b4795bc5adc31a1d6a2151364ce1b372ac43f613f56c8448fed  COPYING
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 4c5200584f..97b1b6b3e4 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOFS_VERSION = 5.1.7
+AUTOFS_VERSION = 5.1.8
 AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
