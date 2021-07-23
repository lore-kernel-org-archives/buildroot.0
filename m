Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC336C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:34:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73F6460BD3
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73F6460BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C2BC60715;
	Fri, 23 Jul 2021 20:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8QAYeOsDDfN; Fri, 23 Jul 2021 20:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96DED60614;
	Fri, 23 Jul 2021 20:34:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A2811BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6534683B5D
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SpK71bTfomt8 for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:33:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 764FA83B5B
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 20:33:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 m38-20020a05600c3b26b02902161fccabf1so4213485wms.2
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 13:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+9arwK6Sr17oKBzGeUoOGnoNtYwfB9ZozUIBr9dhcfI=;
 b=aaUkdERhXfqg5McLr13XEW2JkUCw+MazV+FmLxHrQH95qHCTU/hJunhpBzI1MGQUjE
 Zbab69G0yjTqEjYq1wMrDRk/1oDf9Zzf1p4B1PeFoLvvwci0yKN0kFioV1Cp/vW0Mt0F
 Dcd9GWnA+yEMOSCCWl1ZDQVQPI7sQbmKlzO2Xzi9Zz+p/JNAeOsOvAf2M/O6gKHjF3sB
 2NMSFDXmVHoh7nXTHDWWVyzgP+b4jPnYOUXCFZWoeGCmeniZta78+v0/289cxuhpvFFp
 1o1I/r9K2ybOHj6inyt6Rug+veUu5ixnDCxBYyQEWoQlW/QQRcRv0w9s5DeZb6RHA4i6
 gQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+9arwK6Sr17oKBzGeUoOGnoNtYwfB9ZozUIBr9dhcfI=;
 b=XYMxp71P4vk9TlHYjYguCNP7FCR+a8awgpBNp30NVS3me5rcNS9iWGomZrtbL1D5Ri
 U+cAwynlW4PzUcF/xvymCHdYEV3CHUAtLxhTYMRzOMpUdbvp3b8BXGurmWiFx4OpAhPo
 tpLfJY3782h2F9QZeOPoTMpgObrtlFw4q2RNqteIbUMoq/O+ZPD/Clyj7SjwvLxdqnFO
 9mYIWc/BmrI5dBX+sSQkPABScujT6jmWp4P2q96elnA9J1WIZLrVUUYwaC7mrxJiU/C5
 cOzySEDHzvSItmXwNDf1NUVdbgphpIQCkC45JVJNQlU8f1TfQgxPKPzwZTwDO6eIzl1p
 mPbA==
X-Gm-Message-State: AOAM533i2vja4l6MdogEw6pe/WUfHI/U1SK2B5VQtv9W7aEafhX1oeki
 2IOUE14H5DOzD873QIzQ/GAP26H1yOI=
X-Google-Smtp-Source: ABdhPJwRUS09KKo2Z59qFHW5F+bO3S5dqv3fdojPTV9wgqB1W3QXoCUNcrEMMcDfVY33sm4rR4d2zw==
X-Received: by 2002:a05:600c:2187:: with SMTP id
 e7mr15776506wme.161.1627072380688; 
 Fri, 23 Jul 2021 13:33:00 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id n17sm2128422wmo.18.2021.07.23.13.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:33:00 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 22:32:41 +0200
Message-Id: <20210723203242.2531909-8-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723203242.2531909-1-francois.perrad@gadz.org>
References: <20210723203242.2531909-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 8/9] package/perl-net-dns: bump to version 1.32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

now, LICENSE lives in its own file.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-dns/perl-net-dns.hash | 6 +++---
 package/perl-net-dns/perl-net-dns.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index a6236357e..916603e71 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  2a0364cea1ab6c1134506921d909f393  Net-DNS-1.31.tar.gz
-sha256  00024a8e371605c6d8422a27a0a87af8b7cf66f26502102e68ddd4baf7cfc615  Net-DNS-1.31.tar.gz
+md5  e8ee02ec42dfeb10ae4a0d175d5fcafc  Net-DNS-1.32.tar.gz
+sha256  b890a7b44d573f27cc713caadf1e12eaaa4478a6504d1157194df614316b5b50  Net-DNS-1.32.tar.gz
 
 # computed by scancpan
-sha256  e4f3224d86bd79ac3d11ea513fcb83c68c20701346653699225331e2b7a2d447  README
+sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 7be1b822c..afba3e216 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.31
+PERL_NET_DNS_VERSION = 1.32
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-PERL_NET_DNS_LICENSE_FILES = README
+PERL_NET_DNS_LICENSE_FILES = LICENSE
 PERL_NET_DNS_DISTNAME = Net-DNS
 
 $(eval $(perl-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
