Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B322ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E5780C9C;
	Mon,  9 Sep 2024 16:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhWgANjlT8uA; Mon,  9 Sep 2024 16:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF2FB80D6C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF2FB80D6C;
	Mon,  9 Sep 2024 16:27:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB8581BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98C4880CA9
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCf4HxnE2ptt for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:27:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7640880C7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7640880C7D
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7640880C7D
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:27:54 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42cb1758e41so18470395e9.1
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899272; x=1726504072;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ahthSB/qHjSfmbBo8Qv7adzUDlhEpySkT9039hKZGoY=;
 b=jQnB7PBSA9He3JibRi2mK7ipWOFDOSu7Vao424QH34rkAOqzuWE50aMQim+i4HCFq0
 vmoqvfQO7Va5KUhwOXZm0688sN4pb3c04imft0NzxLH5GJIzBGw3NrD7AsJNmehT3tnn
 rdSGd/yzcNDt4C9nzkGxnYji0mk4NM6lsv11krwDw4qSejVhrX2goZWMz8RGbBBVbyU2
 mo8tcjx9z9/7WDQmrN+3n9BOIiDoE1FrZugYHiPJBthx+QCFD/9lPCIDuTGNVq6ous6/
 wj/ISMWe0GJjQb/l1dkuEwP+eaU/aKN77PZ4lYFsN+9644UQ7elIZsePz6CLwbcbyX5j
 xH+A==
X-Gm-Message-State: AOJu0Yw8D+JaKlR0hvjYHG/EmCqg1y7hrCcn3IWzahBv+Awnb6dtj3lr
 5puFZ585b7vdNDlX7uXLyRRqzfAuY3/WkJwysxBQfWVqbcUFnxmzjo7/9Vn2sRa9XUs/0ar6XaX
 2wQ==
X-Google-Smtp-Source: AGHT+IFfBjFmHQx1io36kpRuir8LQPQTTUkXQzidPMsZ2SaqVzoUSsFPqmtHKXZjAGS4NhNvSNcXug==
X-Received: by 2002:a05:600c:5107:b0:426:5ef5:bcb1 with SMTP id
 5b1f17b1804b1-42cae709f0cmr45377735e9.6.1725899271420; 
 Mon, 09 Sep 2024 09:27:51 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:51 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:43 +0200
Message-ID: <20240909162703.3439481-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899272; x=1726504072; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ahthSB/qHjSfmbBo8Qv7adzUDlhEpySkT9039hKZGoY=;
 b=iKXyolJwiwBX9WMqn9j0L3Xib9EwuW7ScFWFpvW+f3qAaaVilGLiDNVwCygeRyTPHo
 4alZ01AbJfGQGgTA8R2xl/l32ASoPzFwWFz0ge5gUxVdTUeX4sp2DzUKXONKQSy482xo
 gsKMLvZbcmddec44ADm/b6E/2iUXUnt/tJU8QNMp+SclEFlOkhnJ1MqFK6qMVZgKxD/D
 xS8TzRUUZ5s1c+lFr001/8E5lrxfjrRRccc/Ku3elULpjd1hPaflXlOU7MGBuzRKhy13
 UQUqXLlaBOVeOAcFnVBw70hJHH21eHyRMxQiXAImNFLcp81ltk2rMCmw1b+qWP7bIQTu
 ZTMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=iKXyolJw
Subject: [Buildroot] [PATCH 01/20] package/perl-clone: bump to version 0.47
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-clone/perl-clone.hash | 4 ++--
 package/perl-clone/perl-clone.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-clone/perl-clone.hash b/package/perl-clone/perl-clone.hash
index 7b69b97d0..2cd62648a 100644
--- a/package/perl-clone/perl-clone.hash
+++ b/package/perl-clone/perl-clone.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  cafa8984a2c2e005e54b27dd1e3f0afe  Clone-0.46.tar.gz
-sha256  aadeed5e4c8bd6bbdf68c0dd0066cb513e16ab9e5b4382dc4a0aafd55890697b  Clone-0.46.tar.gz
+md5  62ff032a4df0c4abb74f76adf519361e  Clone-0.47.tar.gz
+sha256  4c2c0cb9a483efbf970cb1a75b2ca75b0e18cb84bcb5c09624f86e26b09c211d  Clone-0.47.tar.gz
 
 # computed by scancpan
 sha256  40aa7eb133e97b075024380640528760a54aefc344781741ed02539a375db5ac  README.md
diff --git a/package/perl-clone/perl-clone.mk b/package/perl-clone/perl-clone.mk
index 9e04329ea..a5d18558b 100644
--- a/package/perl-clone/perl-clone.mk
+++ b/package/perl-clone/perl-clone.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_CLONE_VERSION = 0.46
+PERL_CLONE_VERSION = 0.47
 PERL_CLONE_SOURCE = Clone-$(PERL_CLONE_VERSION).tar.gz
-PERL_CLONE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GARU
+PERL_CLONE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AT/ATOOMIC
 PERL_CLONE_LICENSE = Artistic or GPL-1.0+
 PERL_CLONE_LICENSE_FILES = README.md
 PERL_CLONE_DISTNAME = Clone
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
