Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32F6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:00:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2282D611B0
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2282D611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD12C60614;
	Fri, 10 Sep 2021 21:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYe21uIpKFCN; Fri, 10 Sep 2021 21:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E52A60620;
	Fri, 10 Sep 2021 21:00:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 223CD1BF580
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11E5F41576
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ne-l9WRFBQyC for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 21:00:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EAAB40672
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 21:00:25 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n5so4387016wro.12
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MVt5AeevzJd3mJQ6g4MqYZs54a16p26DrZF0stYcYIQ=;
 b=d4ZLpnZQeSSj9kKdjdAslXl0Sn4Gv1gX3Vztw1/zuXFuhRGuUetqLThdPl9xvKCSxT
 ockYEGDx35j29d/G0tRRU2L741ricrAXIeXLJNYir327tmt2yznPYmjfSGNFWUudiDIr
 hQa8ldiz7WKFBCXAjfvc4jxxDTfSXet++6UAx6z2uIuEnh1l1YdIXg9ZfE203boXpBOK
 zJCupStYhVzmh4V9As+AdxUhtTZ/KkCWpMHR1m82IPU+Wy89REg828du5WcXFTWgTdId
 m7DEWwgUoeg6HeAn0xyk+14q5I9raOv97YJCDg2YgI4gwlOwANPMHX+YGeDsixwRd2gt
 EG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MVt5AeevzJd3mJQ6g4MqYZs54a16p26DrZF0stYcYIQ=;
 b=QR3IT1mQrZxjaj2EeN8+MFQbRnrth2slkPpXhmMRBJ+AHo5GYs6QL1rOKtFGmV6U5B
 3W6BVsikkwXH+ujgDNLTRSP0kOLHVYO7SEywnOZVqOMOoon7yoW8DHMEwDDAOOvCzTM1
 75Tju74rMCjdpojSo2Q7XNLVsLpV3qxPT8EDmkE9HGOV+z18lkRSmZpynsfsJ+n7jR/o
 Mg3vpYRD4CmWrcKR0UjbPal+yIZkmMdR0Wiq6UUhbvauIiuOgBFM2iVWTtLu0+hbLflR
 bTDYb5EgLkfPAw5XPs5WGHCiio30OjOShMwXwUJTFvre1ovZMYP33Pgs5ucWkqbKy+0U
 eDLg==
X-Gm-Message-State: AOAM533QrcpohV93hHgGL/jco4cMa2wCNYCaOwUBD0n0Q42F80c0HRtD
 JXStpaZmsYV9KHQVxj2hbccxfVD1QL8=
X-Google-Smtp-Source: ABdhPJxQxx6Zhr6AV/Tk0lL78MiribifKzW/392FEFYj/EalfUsJVrLqdnQcu3g/ZEcHxoLPVkU88w==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr11614355wrr.382.1631307623300; 
 Fri, 10 Sep 2021 14:00:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id l7sm5727879wmj.9.2021.09.10.14.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 14:00:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 22:59:23 +0200
Message-Id: <20210910205923.632114-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/autofs: fix build with glibc >= 2.34
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure with glibc >= 2.34:

In file included from /tmp/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/bits/local_lim.h:81,
                 from /tmp/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/bits/posix1_lim.h:161,
                 from /tmp/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/dirent.h:233,
                 from automount.c:22:
automount.c:87:37: error: initializer element is not constant
   87 | size_t detached_thread_stack_size = PTHREAD_STACK_MIN * 144;
      |                                     ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/0c8ab8968b2adf6a5f8eeab00ce388968fa1c1d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...7-use-default-stack-size-for-threads.patch | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch

diff --git a/package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch b/package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch
new file mode 100644
index 0000000000..f63c399fdc
--- /dev/null
+++ b/package/autofs/0001-autofs-5-1-7-use-default-stack-size-for-threads.patch
@@ -0,0 +1,124 @@
+From 91edcc55c681dac41d2213b498ec6450aee22d9f Mon Sep 17 00:00:00 2001
+From: Ian Kent <raven@themaw.net>
+Date: Mon, 26 Jul 2021 13:18:38 +0800
+Subject: autofs-5.1.7 - use default stack size for threads
+
+autofs uses PTHREAD_STACK_MIN to set the stack size for threads it
+creates.
+
+In two cases it is used to reduce the stack size for long running
+service threads while it's used to allocate a larger stack for worker
+threads that can have larger memory requirements.
+
+In recent glibc releases PTHREAD_STACK_MIN is no longer a constant
+which can lead to unexpectedly different stack sizes on different
+architectures and the autofs assumption it's a constant causes a
+compile failure.
+
+The need to alter the stack size was due to observed stack overflow
+which was thought to be due the thread stack being too small for autofs
+and glibc alloca(3) usage.
+
+Quite a bit of that alloca(3) usage has been eliminated from autofs now,
+particularly those that might be allocating largish amounts of storage,
+and there has been a lot of change in glibc too so using the thread
+default stack should be ok.
+
+Signed-off-by: Ian Kent <raven@themaw.net>
+
+[Retrieved (and updated to drop CHANGELOG update) from:
+https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git/commit/?id=91edcc55c681dac41d2213b498ec6450aee22d9f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CHANGELOG          |  1 +
+ daemon/automount.c | 29 -----------------------------
+ daemon/state.c     |  6 +-----
+ lib/alarm.c        |  6 +-----
+ 4 files changed, 3 insertions(+), 39 deletions(-)
+
+diff --git a/daemon/automount.c b/daemon/automount.c
+index 23235a7..d743235 100644
+--- a/daemon/automount.c
++++ b/daemon/automount.c
+@@ -84,7 +84,6 @@ static size_t kpkt_len;
+ /* Attributes for creating detached and joinable threads */
+ pthread_attr_t th_attr;
+ pthread_attr_t th_attr_detached;
+-size_t detached_thread_stack_size = PTHREAD_STACK_MIN * 144;
+ 
+ struct master_readmap_cond mrc = {
+ 	PTHREAD_MUTEX_INITIALIZER, PTHREAD_COND_INITIALIZER, 0, NULL, 0, 0, 0, 0};
+@@ -2620,34 +2619,6 @@ int main(int argc, char *argv[])
+ 		exit(1);
+ 	}
+ 
+-#ifdef _POSIX_THREAD_ATTR_STACKSIZE
+-	if (pthread_attr_setstacksize(
+-			&th_attr_detached, detached_thread_stack_size)) {
+-		logerr("%s: failed to set stack size thread attribute!",
+-		       program);
+-		if (start_pipefd[1] != -1) {
+-			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
+-			close(start_pipefd[1]);
+-		}
+-		release_flag_file();
+-		macro_free_global_table();
+-		exit(1);
+-	}
+-#endif
+-
+-	if (pthread_attr_getstacksize(
+-			&th_attr_detached, &detached_thread_stack_size)) {
+-		logerr("%s: failed to get detached thread stack size!",
+-		       program);
+-		if (start_pipefd[1] != -1) {
+-			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
+-			close(start_pipefd[1]);
+-		}
+-		release_flag_file();
+-		macro_free_global_table();
+-		exit(1);
+-	}
+-
+ 	info(logging, "Starting automounter version %s, master map %s",
+ 		version, master_list->name);
+ 	info(logging, "using kernel protocol version %d.%02d",
+diff --git a/daemon/state.c b/daemon/state.c
+index 5156bb2..5df0561 100644
+--- a/daemon/state.c
++++ b/daemon/state.c
+@@ -1177,12 +1177,8 @@ int st_start_handler(void)
+ 	status = pthread_attr_init(pattrs);
+ 	if (status)
+ 		pattrs = NULL;
+-	else {
++	else
+ 		pthread_attr_setdetachstate(pattrs, PTHREAD_CREATE_DETACHED);
+-#ifdef _POSIX_THREAD_ATTR_STACKSIZE
+-		pthread_attr_setstacksize(pattrs, PTHREAD_STACK_MIN*4);
+-#endif
+-	}
+ 
+ 	status = pthread_create(&thid, pattrs, st_queue_handler, NULL);
+ 
+diff --git a/lib/alarm.c b/lib/alarm.c
+index f27e13c..1631a9b 100755
+--- a/lib/alarm.c
++++ b/lib/alarm.c
+@@ -270,12 +270,8 @@ int alarm_start_handler(void)
+ 	status = pthread_attr_init(pattrs);
+ 	if (status)
+ 		pattrs = NULL;
+-	else {
++	else
+ 		pthread_attr_setdetachstate(pattrs, PTHREAD_CREATE_DETACHED);
+-#ifdef _POSIX_THREAD_ATTR_STACKSIZE
+-		pthread_attr_setstacksize(pattrs, PTHREAD_STACK_MIN*4);
+-#endif
+-	}
+ 
+ 	status = pthread_condattr_init(&condattrs);
+ 	if (status)
+-- 
+cgit 1.2.3-1.el7
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
