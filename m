Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8F8CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F20E60FEC;
	Sat,  3 Oct 2026 15:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnkvoPn5RDYv; Sat,  3 Oct 2026 15:56:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 392E060FE2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042996;
	b=ZeZYDnjORuq36PSnRzMFgdpzQdbrz00KDXX4/9Owx9j6Qd4hVtwwq4g6YJRBSku57pxu
	 dJ6Q+nTy76oA+oCnY4XadZSa348fV12ImrSdQrOf7H7RQtxEvf+jAfnoxbu+f83N8ailQ
	 FPWqyZobAf96qd/IQc9tnOjzvX5CMSsPAXg1KvnJ5zERcguCLrKsJo5GNWPIHXzEjYEGj
	 9IacHRdBH2vnt5g9fNw5Btuo80Wr2Bzh8ejKsp5qUoWvmrf4urEMZQr3iBAoM06tUnQ07
	 pB3ZSPrLTnM5Wmpn+0tdtgzgUjuuXqo9bB6M5YaaWHV98eSS866s/U58ElbZuuYXj2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042996;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=myAONxhvkUZ/yWKwvJeV+Uhj+TYKyPhirZIRAmfZHDA=;
	b=fASm11xxcVfEktZFqeIhrhDFzf/q9bLv2f9jaw6BRxkk6FAO8Vbll4i0+w9kW2FCfNaA
	 +zJuF801B4qacAlJUpNNrdBenb/7ZPhpa/rlZxI967EMqfsxT8xax6Eul6BmHDTeMtaXt
	 tvMzUym3z/Y3B6ZYM+gsYSNwks2kwvPA7SeU6VmOMtiSmnSkpZ0NTrS91dgxouavYrOP0
	 2KFHS6PWjWU5Sx+Oi8jnLUkhb1i5mBax07ttZ3i493TS+PUsNCz9ck0jtMYYGpVNp/0+v
	 dk3a/EEgIzI7QPE9NNb+HQOCPV5x7dPSqcYLrrwL09CR1WXVj79GUYK7ZjY8+XiagYg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042996;
	bh=myAONxhvkUZ/yWKwvJeV+Uhj+TYKyPhirZIRAmfZHDA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OYfFYLMGBhMGljU0f7Cye9/CvuHb51ffialu+qsZmlF0C4WaiTC6tJc5Ej8XIeYEE
	 G+dxpS5JHXLcXs/ymDue/B6RRvwe5i6KAM27a9Q2Xnkfdfio1c6WgplB5cvN3MIjq3
	 b/TOpNWZtK+mQdo5YTMGkd2Z4N2cmDGwHP6auxozU6z23IVMzXdGKUjCCGOrjjJobe
	 taCPpzNo9frUO327tiiLZfrT92F73Hy+CYKOPshY2rUnK7K/1w8JyGu+Cc4++nGSn/
	 /GvRb1PX5IxDazXCEghLw2e5kw3QWqmysJJIPyCT4ABdfKUUfPieG4gwbL4rjhO+pF
	 D9RQ94tmPXycg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 392E060FE2;
	Sat,  3 Oct 2026 15:56:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD5C41D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBD216067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bgAlNjWG8qJ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4F15F606AA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=pGtKabg6uyArL017RKYMIbZzcwbQl19HK9w6IHDAjt6y2PCz1N7w0eMO9SWWL3+Qmn52
 2Y6KA0yGvEyuCuABOvJ/f4MWVEHzmx3yWGUlLon+dlFoYIPeG9hNrIMMfGSOcreQJ7zDS
 w9h5ijsJKCyroL/QgRkUx5LMPVczkrz34BU6ivhazIiXdFmKYCxcmxwCSHBn5Nw04Syei
 V/WcC+ljVWawFH/K+vxJuelJklj80Ma8aovcFQPY247x4KVBJ2Hd/qlvyo21IbZYFuVo5
 imgtn3yRYfGLWID+VUeAvLdF17ZGunslhm7yG/bvqf5GSvMHt/hzHDTEgYk00+qJi+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VmhpdOnCyJGXyc56IVA4WDQ949XvaAgLPLibtpZT/gc=;
 b=Jux+CuPPn9tp+PCBFoMpiY95UYuk9XBrrn/JJOeUdgY9vqyiZTl2UJIrHiQxHBa+au1x
 PfrAfA12LpPk62pC1tK+oPaeei3GP7HiDYyPR0jrGy2EsGhYgFpJI1D7FzLHBNI1KRJuf
 NS9MjibVQjsSnCYovhSrg6nHBy6UPJnQ+npxW1VV6l549TxkTMobBzfBO7AnsvvnGnPrP
 PJf5HETelU55YzwBg/KTW5TkAATNpRdqpG65FWPt/WX951KtYcWzzmsVAaNSkrLF/7zu6
 GVxcdO+9N8/og6XkdaQHh69+zsVvwJt0JE/gC6/SZ4kmMTq7fQpYHqu4+cirR26/vWw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F15F606AA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90B938A4B8; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94263d0bf29ee82034e1f3e6102d645b3585dc24
X-Git-Newrev: cca0b08180130053c725249cb760381f71d01f73
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.90B938A4B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump version to
 4.0.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cca0b08180130053c725249cb760381f71d01f73
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 8b32611fc2..302664deb8 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  85c7195c8c6455fd212d74717cc6a62b  filelock-3.29.0.tar.gz
-sha256  69974355e960702e789734cb4871f884ea6fe50bd8404051a3530bc07809cf90  filelock-3.29.0.tar.gz
+md5  7ad81dd59ab8b9af8af536bce90b37e3  filelock-4.0.4.tar.gz
+sha256  90999ed63a26ccf86b93b959ab10cf1017f422d816be454ed54cbed263e71ab5  filelock-4.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index b7a4638775..97d0cc96dd 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.29.0
+PYTHON_FILELOCK_VERSION = 4.0.4
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/b5/fe/997687a931ab51049acce6fa1f23e8f01216374ea81374ddee763c493db5
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/c8/d7/37691dc5063438a448b646f6f2442b4beebf16cc0e18d8cdfa7aeec60b8c
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
