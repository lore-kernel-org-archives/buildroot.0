Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70018C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:25:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C06C6054F
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C06C6054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02A8380F37;
	Mon,  6 Sep 2021 15:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gXmL3GW0Novt; Mon,  6 Sep 2021 15:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5063080F46;
	Mon,  6 Sep 2021 15:25:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E40B01BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E036580F37
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zq69ftQd-9Yy for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:25:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA22B80EEB
 for <buildroot@busybox.net>; Mon,  6 Sep 2021 15:25:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q14so10390987wrp.3
 for <buildroot@busybox.net>; Mon, 06 Sep 2021 08:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZkAwkx9BIe31HRFrtSq+VHMC38zUo9HU54eDh0yk81I=;
 b=YRA0cCiagQYRqje5+INnk/DdKqJURRhvfxRVGwZIyS4PcCmY9lNim+qJMTAt4kgQVN
 /g2PRJryaEIages3aCLmCHnSnG4rlrpuCnO9459pT/dwh+TGzQUeK7B7GWct3lXStJ8K
 5094xrK2InXYbEPyi8deHpR17IOuDPnNj8RT0ReDZkfZGa5vDOLhzuNpDFd2jjm++TH2
 QvvFdPSBtaiyQvSx7CVdioYV7k0/vR4b8tnrtO6raXq7DVwL6A+hx30CpIox1co4pCcX
 KZp2Rh/Up1Tf3oMyPcgAUlCMT+p90BlWSmjFW9bttjTx/gjESxsgt/RuG/Jgji6R3A18
 Kteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZkAwkx9BIe31HRFrtSq+VHMC38zUo9HU54eDh0yk81I=;
 b=GCzvvh8COZp5rf5gM1PprfKEJn27TJLxwSgggKcAeHTUj/iIEd/nPAFgJka7dSp+rs
 uxsKjaJApKaruE1vfNw8wYDMsLkwinJoFHuVJuxjDbnY0xuukP0XC6Cd20G5z2fpLC/F
 ihKs/z43qTrt/cfIAMKXji9fBN/krhfm5nc7x6okF8Cj+/dFXA5ca8NmrrliOgz6pJpg
 6iW3NiIWHMRgzQzmi0x5TANyEKDESak1fVcJxoVbApfc+lYpc3KRN9BWCJflx4fmTtaO
 MCTQIvcLohxiH3Mxg/+ksPszS0FvW7djOmsYUbsPzaIuD1F43ahT/mC4mrl/HoLPkDjx
 XYpw==
X-Gm-Message-State: AOAM5315YJMOnxkOLSN3KYx3ZXCNkAxjouerSnoxQ5CJWidzuPqRhUXe
 WMCMcBvSCZNjYsvZKa0/q9XI8ybxBNI=
X-Google-Smtp-Source: ABdhPJxrhgJCO63fC5FgaYQY/MWN3Xoo15gWx1lW/So7SK1CJznnpdxH1alHcL5M5WE9AIk+C0j/XQ==
X-Received: by 2002:a05:6000:1627:: with SMTP id
 v7mr14123733wrb.347.1630941934277; 
 Mon, 06 Sep 2021 08:25:34 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id b1sm8422223wrh.85.2021.09.06.08.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 08:25:33 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  6 Sep 2021 17:25:23 +0200
Message-Id: <20210906152525.1831463-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] perl-io-socket-ssl: bump to version 2.072
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 4 ++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index 4f2a6811b..b5dc29973 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  3e33497ba43be5adce1f980437253172  IO-Socket-SSL-2.071.tar.gz
-sha256  40da40948ecc9c787ed39c95715872679eebfd54243721174993a2003e32ab0a  IO-Socket-SSL-2.071.tar.gz
+md5  4fb67fc8c4817dce8116f2eb7878fd9c  IO-Socket-SSL-2.072.tar.gz
+sha256  b5bee81db3905a9069340a450a48e1e1b32dec4ede0064f5703bafb9a707b89d  IO-Socket-SSL-2.072.tar.gz
 
 # computed by scancpan
 sha256  090aff5421fd55a9dceeaf6c612c36360402e8d29c1284aef88c87be565ce032  README
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 45f768305..b32cce12c 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.071
+PERL_IO_SOCKET_SSL_VERSION = 2.072
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
