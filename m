Return-Path: <SRS0=UKoJ=OW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2A6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 06:22:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50FF61AAA
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 06:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A50FF61AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41F1440846;
	Sat,  2 Oct 2021 06:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E241uf0rgIiv; Sat,  2 Oct 2021 06:22:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FD5740821;
	Sat,  2 Oct 2021 06:22:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 968A51BF865
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 06:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80398846B5
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 06:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EphEidYdV9bo for <buildroot@lists.busybox.net>;
 Sat,  2 Oct 2021 06:22:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95E838469A
 for <buildroot@busybox.net>; Sat,  2 Oct 2021 06:22:38 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 b192-20020a1c1bc9000000b0030cfaf18864so8189875wmb.4
 for <buildroot@busybox.net>; Fri, 01 Oct 2021 23:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/NGbXlJaC1P3LscdWGNUwvndDzMrPeXVEUAdJdZTUjM=;
 b=Gqlcxp4dOgAbUVvgBaHIse3eZe3cBR5ZjTBsew0ATbC3lA0y/1ET/Pw4/xj1GeZxLz
 qJ36VE1yWbHyQhvZB0Get4jqnf5vQC+vUwJ56Sii1Nl3JxynHLc5+9MEi0/mn6yb1k/h
 gP3CHLhBCxUIm3z7FdDx6W3XZzTup8FemTp2ve1g8LwvEt1LZnFum5a8vFyPKXS1WD2Y
 Hbj0oSSZO68G0i9GdJRmVAd7P2Rr5KQZK5UYYI2PmfpiFsy4dEkPoWgQ4N0PRFiGjbc+
 Oboe5Jsng6St3THH7GCKv92jspDqg+gVWAR0Lr8SpcPO+AUrrNaqzx48L8myr6gcm9P8
 8AyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/NGbXlJaC1P3LscdWGNUwvndDzMrPeXVEUAdJdZTUjM=;
 b=NQRgM4sOgDfLXtB/oECUL4CDru+Mb63A10QdoIEcGwvDYsF4Jw0cl8ANz5Jg1TLYhX
 9WGtLpE893XUop/TxuuNhGDiXPF//O/6mny6Cegmr4q3xluUdnd8EJC4diLBRz+G9TI3
 U0K7JOTrxrL3FAtJc4nNmmkJUCagYSoHC+0ibZuDZ0eBdI7HxKZJlo/PyeFG+3v5jFP3
 1HNYYhJNV9MdLOb1HfxwhyH61tUzU2PcRN4BsTPc79WROvq9j2nXGneAVMv5IkYUM5Bp
 fbgz2TG+zVcGluLkYJh43N5UEEuggRvLpOUfZX0IoBEWJAq0SlKrklVW5AZDqx71Uhed
 T+bg==
X-Gm-Message-State: AOAM531+uQL0VsflsoC4lcCSpuNiOY6Oio+mQDkpJAjafdyPTLGKtc6n
 Q8527b/IH5VJl4iyOvBRfbvUHRqP98o=
X-Google-Smtp-Source: ABdhPJz1WS9GLC8eve/a5ivQBfc+cQInFP/Ot8Vj4C5JxlF+Ux3CIA3m30CQaUoB8A6mxD6wIDLVUA==
X-Received: by 2002:a05:600c:210f:: with SMTP id
 u15mr435651wml.157.1633155756596; 
 Fri, 01 Oct 2021 23:22:36 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id m2sm9630954wmm.3.2021.10.01.23.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 23:22:36 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  2 Oct 2021 08:22:27 +0200
Message-Id: <20211002062227.148999-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.3.5
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
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 45afd04dc..d046e8951 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  bcce767a3fed252bfd1210f8a7e3505a2b54d3008f66e43d9b95e3f30c072931  libressl-3.3.4.tar.gz
+sha256  0a51393f0df1cf27e070054a2788a4d073339f363d79cd594076a1b4c48be9a5  libressl-3.3.5.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index f1847b18d..268ded69a 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.3.4
+LIBRESSL_VERSION = 3.3.5
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
