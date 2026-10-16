Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68313CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F055960EC6;
	Fri, 16 Oct 2026 13:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dr5qtg2xqs0D; Fri, 16 Oct 2026 13:10:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E3A4760F93
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156221;
	b=sVIVU6h7dQmw7VoNVUiSITRxxv1HpwyzrIz/moPU1OUnk3cug1Jjs3uHyBaEZtxArn4V
	 GDi4WHdvJgUJVSeLe9Yhvqrqc35bAuyYlydIX19u8HuuFiBwYmcVotdCHVFa5DGZpyW3l
	 P8NowFl99X0AbcNcvAQQN1KbYh9s/p7RaOGvjKZRdzmEuJxgX4L3mFq2npgqsk30xeL45
	 hexO22TlY/dwuvm7S3ICmbQ35SxqMCjnnHko2BEvsSnqsV7aU7MJ223rTWs5gW9/Y1lJz
	 Z58sQ0cQz79ZX4zywJS5NONaWrqNfylMWWNjVwZhgOzmfnLmuOwDX8JP68P2UMRQUzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156221;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=eev+YdcmhPc4s+HVNRBUMQmAr1CufXAeM/nstTdLFNA=;
	b=FfJ+BHoGXjd33fB0T77tEnHbwUMvcg0aB4dya0sjRke6XeRyjn3k8dX6PHgiVEoqSR0K
	 Q43Il4Li/aEeaY32ezA9RrDBT+r74Ll3ntbQejV1JCzOxvO3zatlKt92T+QUArutyZ99Z
	 UUIFcjQ84zEY+VeGtQHjbWtnKqOBpMTNEAncep8aDzVWUj9uAAFRActjGKvBhWep3FLme
	 OYShSOCY4SxtWIuFh/qxnFBo/F9spdrFoG+Wfj9fUKgisFeLagipgiZ3czocLf6yhcScr
	 Mikr4OzfY9X/l0kMClzdDbreGC2ifgZPAv15HiZh5tSAy3D7jDsYFBiszzfO5fB2CVQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156221;
	bh=eev+YdcmhPc4s+HVNRBUMQmAr1CufXAeM/nstTdLFNA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cOEu6jhOGj3apHY+/8hZ91pXRhsmsC9omCgAhnxs+FQAdnS5zQCCarT4hFYfsVCa7
	 Ne2GmXMkFx0Dj9OsI5UY3abY/AbxM4wdkgyA6b86NdQ4Lh50yx9mSGY0sG+ImB2uJC
	 q+99wp7GGZnRenxqba3ikgCv1E/fBhYMeapJbmtst2ER2IDG6RBmSaoEvowY7OsstZ
	 qB2vpDfprFz+dCAfJSwgjzahx+DY8lnJG8RIuTumAlYB83L5+OKY104X4iX0yHAMV5
	 R2sCeCKyVQVxVlJiQ3BwaGqlkcPkYOwvQKt7S/T0GXCNnK/zk4nHyKLwZcdwW3Ws2H
	 u8L66oXibVf8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3A4760F93;
	Fri, 16 Oct 2026 13:10:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DFCE1F6F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B00281489
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqzczmhVKrpJ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1ED5E814EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=kVJyHJqMrF/iP3UZryRqafA6EwW5kpySEmrPOA13SsRmhLCXW5w0du1UgB7mjCjuNk50
 fZ9IvR4uyzLtumCeh/IX3KadZDd1yh6RAmMzpTYGyQbV5du6WTRNhhJOA/cmZp5xjU3Tx
 x/3uPBzdZSxUCddwWL0ijkFSe9mkCkUFl2Y5CwAZBwqO6C8q45kzkT8kOClTzkv3okt/q
 D9vIjeEveYR21I7rDjpip2zjx8Ka1FV4dw0uV4RHCZnnbhH8Mh+tPfkN7Lum4d7hio4vB
 bPSYud1epUo93ddJTEPQ6EEbah6wIgGP8/sgMVUlXk7hBU9kAcEVg31MAsOX19Qs3iA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nzHVc88iGZ8yzFWydRh9it+KYt2GbZFaYCTJwz9vEZ8=;
 b=OmqDTh6mKdbU1AiJSlw54BCKVLTVvvMlLTBfXh5u++2OvNQsZPWnuhmL2ARfk+NvUUP9
 MniF/e8YCVJ+GXY/EM3CP1nP2EVTlFUADixNzMbbIJmutBgtTueGGKhiDk8srGJS2pEgR
 JEjKTgEJLzt+VbDABfvrtosXbd7WBjbCT1cbNsANy3B91vRp5oQozSguNOVXWayzvYPzg
 pX/LIf5GRoxFrCTSXDTOxn6yC8pD0PfvMP/WBDdcha0FNbcF/LrNiOX9EeQkY9bd8cL2c
 NiJ0WXne+3jRtzMYZVpSGdMPC/eXzYy74rWcJ3DLqbFrY0lmScJm2PxWymnicRWe5sA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ED5E814EE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FDD5960D5; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 33c3f1501ddadb9b118469dee7c8408a1f10e2d4
X-Git-Newrev: c9e3354ba2bb2a73c86dd4bb25151b2ea8160989
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.0FDD5960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/haveged: needs
 threads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3691751668746860667=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3691751668746860667==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c9e3354ba2bb2a73c86dd4bb25151b2ea8160989
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since the bump to version 1.9.15 in commit
2a28d25d0c61 ("package/haveged: bump to version 1.9.15"), haveged
unconditionally includes <semaphore.h> and uses named semaphores
(sem_open() and friends) to synchronize command instances. As a
result, the build fails with toolchains without threads support:

haveged.c:37:10: fatal error: semaphore.h: No such file or directory

Add a dependency on BR2_TOOLCHAIN_HAS_THREADS. Since threads are now
always available, unconditionally pass --enable-threads.

Fixes:
  https://autobuild.buildroot.org/results/814cb7b5537d8b7b2c23f3d90e37b2b41de7ee3f

Fixes: 2a28d25d0c61 ("package/haveged: bump to version 1.9.15")
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cec5f7af80a564b8862aee71e3cf516b325e41f0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/haveged/Config.in  | 5 +++++
 package/haveged/haveged.mk | 7 +------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/haveged/Config.in b/package/haveged/Config.in
index 0e49a2db7c..8862792824 100644
--- a/package/haveged/Config.in
+++ b/package/haveged/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_HAVEGED
 	bool "haveged"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # semaphore.h
 	help
 	  The haveged project is an attempt to provide an easy-to-use,
 	  unpredictable random number generator based upon an adaptation
 	  of the HAVEGE algorithm.
 
 	  http://www.issihosts.com/haveged/
+
+comment "haveged needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index e22712f016..bf3209cfdc 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -18,18 +18,13 @@ HAVEGED_CONF_OPTS = \
 	--disable-nistest \
 	--disable-enttest \
 	--disable-olt \
+	--enable-threads \
 	--enable-tune
 
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 HAVEGED_CONF_OPTS += --enable-clock_gettime
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-HAVEGED_CONF_OPTS += --enable-threads
-else
-HAVEGED_CONF_OPTS += --disable-threads
-endif
-
 define HAVEGED_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/haveged/S21haveged \
 		$(TARGET_DIR)/etc/init.d/S21haveged

--===============3691751668746860667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3691751668746860667==--
