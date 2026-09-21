Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6824C982DE
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 06:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50866606A7;
	Mon, 21 Sep 2026 06:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJzpNgpZuQxu; Mon, 21 Sep 2026 06:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 23F8760628
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789971494;
	b=Fs2NsNZgLG/zQmCN26p3SMOka/jS1aR75JLnCi8+mdYQY6DQ6K5uZjtK6zOPWwYOv8RW
	 G0R44tEC1I+GnvWFAoiE4vlmYxEpxUIgxVW+CggXu8O6b1y8wPwUvL3CNwBqe90/7HRGW
	 ZyHJ0B/EAbJRPvT2cMMfeUtquKXfndFNoE+LZNxSPRugiWzMOlkQ2DU3T/71X+FUzeoRn
	 j7RSC5gAmNE7dWowP50C5swz1IivAZbqYegQyLnQsnw9oQwj514Vo59SpSFa4gwvbHtzj
	 PD3mgruMykqzMO3W2YIpWinSrgDupQo/MoI6/sGdpdiHDL/WB+v6QRPOulMAdCElo4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789971494;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Originating-IP:X-ClientProxiedBy:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JWJcc0e+HwFpauvbdhTyMabU/kJXJelZBCDjrNtavm0=;
	b=Ve9maa0LROpko0tC0RkuoVBy91sBNuQubaVq2FkBwKDoeRt8p4M4FHz0KuZVyNwzK5+r
	 JzDMykq3xxuoIp/DEZs7BWsii2YAZB6sTs/ZfbCTh54t6Falz70PmMvgEpBv7UHURDVN6
	 /6xEGvUdDnIQXKMzu1GpRm9r9rLRB7jvk0UGvwFaZPNzsi4SDInAgpZtJySBqLH9HomrK
	 7IbpO9K7uOpanuZlf9ztUx8N9n1fuXq5bpGqPOm94zReRjRobe96TQ5pqpkqnLJEuOzjU
	 MlfHV8ckMJu5YF2pOG1NHCednuznHLgaWHS/zZfYJyHEh50uf1sFSSa3OsFpW4vE4jw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789971494;
	bh=JWJcc0e+HwFpauvbdhTyMabU/kJXJelZBCDjrNtavm0=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/j6vMmpqEpv4QMR/qk35fh85BwHXpdBtBMjIypWzx0tkkzx28xjb+3WBJ2Xe3M3I
	 JGenaMfRNPwel+4CeozOCgCOtAK2NBgIIohqTcfFiguEWGg0TBqOhe1PNvXB2l/PaH
	 766DgWbhTlXEt0shx2xmYQtsWtV1gb0pEVU0YeF1dQ1pUPyIiklgcFI2RtUgzJ5cDu
	 DSwfY6u5f2dt446O0NKCZil4vG+3D/gcYuLBMtte72iQTx3UwrA0FdzoSUamOcRhEP
	 MZ/7DJWwErCwMwpJkTankKStGi55zMT3X6ebjG9pbNKWE+ccBsdDORHdiuBtfeCcGr
	 /UZEiwc2t5MVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23F8760628;
	Mon, 21 Sep 2026 06:18:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D09D0386
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C273140080
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXRAPqmfWUij for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 06:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 357D04006F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=80.12.126.238
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789971491;
 b=WirTN1L6LfsDNaUpsEZYSdSRFqzsua5jyFCU2E1p8yqRKmP9R7riEfW5YLIgL9t2CYRw
 5cEDDaK6i0CkkwMRVmADXPmS7dh3dBTTo0UPlKDDYKmhPc1C9fXArkkapBa6oTcY4HTmw
 8+qRGL1Gze+vTZxSog5S+1ertLYnteixTbT/xctY/GG4VUaoeOhimaKFykG/9uyqmPBYz
 7gULqD+0XcGFokqorrzw/w1OpUE6v+7iQc27yNv1N9D8NgZlEHvhzG70YMItWTIef0kS7
 3MHBqW1Iz+oR5bcqN8rldMFwefOFQPIncjMnIVt65UfrYqiu9nZWTVLSDE2AHvkD1Qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789971491;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:
 Content-Transfer-Encoding;
 bh=uJBN4UrelnuOsHduL8flbOF5UfEFnkHGZemnqM0ReA4=;
 b=B24j9PDRnt3m8GM3eTkbxCmGnvZFRGNpHMINlincLQs7UJzCw6SVzMuX2XlX0tkGXTCR
 87+HNsQ5zu6hoSH1N1EEVzHegG80cpCJZas6JW4lWoqXu/6CqxK7UMWo4kHOmr/eNoGWs
 n5mLEauPGcnrJ1gG19Vk4AqDfgI334ePzsb01r42rKOShszCOE1eyE7yprLhtgjS1wQ3S
 SpVwVVa2wd0CHOvUtIZ1chX/anlXljtEls12YtMWZsF5ncABSF6Ypx8oYtalV5GR3rJlD
 6IH0Z97NU9h7tItcAsGOsIKQ2VYYEWIkAkjwBHzCMpPRaUU0I5940af393Y3cIx4k2A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=DG7h0ZOH; 
 arc=none smtp.remote-ip=80.12.126.238
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=DG7h0ZOH
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 357D04006F
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 06:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789971491; x=1821507491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uJBN4UrelnuOsHduL8flbOF5UfEFnkHGZemnqM0ReA4=;
 b=DG7h0ZOHYW60lUM7jYsQHkatwzMgZIrftbLMWRblOAR+Ezdpwnr8iWej
 VmNHgAy1rDLUGE2m3J9poty4Ru6Cqs8KVtftWPryMwj4pCTUYnv6XpyYF
 SrJTAVb/ye1KtGu0YAn38tr641Yecs7B6qUHep2VNtSVhQ1sRPKYIspEF
 KwUSidBqJKnY5kEGkdycMQXPc4xYMzGDUGzXTzrRvBsSqjSNoiplwayqO
 crG6wHJGyr3diLeepCdTIzPbiq3PZgLnnxX7YDaUpUWgO67gMD7ygNpgK
 d6+9HJuHPNY8GwJU6KNpXC0gwFqHZ1jQhXRChrVRTAaSTOHrMSYJ8Hkxh A==;
X-CSE-ConnectionGUID: zhgq/TJjSrufVeclnQ0MRw==
X-CSE-MsgGUID: 3Q3tz5P6SruYIYTUMH8vUQ==
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Sep 2026 08:18:08 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 08:18:08 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Mon, 21 Sep 2026 08:18:06 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 21 Sep 2026 08:18:05 +0200
X-CSE-ConnectionGUID: f6xbeLTLS6GTx+OMnxmULg==
X-CSE-MsgGUID: TV6IImrOSxCfr+iRwpRSFQ==
X-IronPort-AV: E=Sophos;i="6.27,114,1787004000"; d="scan'208";a="470568713"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 21 Sep 2026 08:18:03 +0200
Message-ID: <79fcf083efc142ce08b4a877e8d8bf60ee568ca8.1789971481.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789971481.git.yann.morin@orange.com>
References: <cover.1789971481.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX504.corporate.adroot.infra.ftgroup
 (10.115.26.28) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 1/3] package/distribution-registry: security bump
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

This feature-release also congtains security fixes:
* CVE-2026-35172
* CVE-2026-33540
* CVE-2026-41888

Drop our backported patch, included since 3.1.0

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 .../0001-s3-aws-fix-build-for-386.patch       | 45 -------------------
 .../distribution-registry.hash                |  2 +-
 .../distribution-registry.mk                  |  2 +-
 3 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 package/distribution-registry/0001-s3-aws-fix-build-for-386.patch

diff --git a/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch b/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
deleted file mode 100644
index a725ab8e92..0000000000
--- a/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 6970080b10a53d858dd444a643a2bd911de12940 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 29 May 2025 11:28:38 +0800
-Subject: [PATCH] s3-aws: fix build for 386
-
-When building for 386, we got the following build error:
-
-  registry/storage/driver/s3-aws/s3.go:312:99: cannot use
-  maxChunkSize (untyped int constant 5368709120) as int value
-  in argument to getParameterAsInteger (overflows)
-
-This is because the s3_64bit.go is used. Adjust the build tag matching
-in s3_32bit.go and s3_64bit.go to fix this issue.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-Upstream: https://github.com/distribution/distribution/commit/6970080b10a53d858dd444a643a2bd911de12940
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- registry/storage/driver/s3-aws/s3_32bit.go | 2 +-
- registry/storage/driver/s3-aws/s3_64bit.go | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/registry/storage/driver/s3-aws/s3_32bit.go b/registry/storage/driver/s3-aws/s3_32bit.go
-index 218e3eab..84161fcb 100644
---- a/registry/storage/driver/s3-aws/s3_32bit.go
-+++ b/registry/storage/driver/s3-aws/s3_32bit.go
-@@ -1,4 +1,4 @@
--//go:build arm
-+//go:build arm || 386
- 
- package s3
- 
-diff --git a/registry/storage/driver/s3-aws/s3_64bit.go b/registry/storage/driver/s3-aws/s3_64bit.go
-index 55254e49..2ed1f92f 100644
---- a/registry/storage/driver/s3-aws/s3_64bit.go
-+++ b/registry/storage/driver/s3-aws/s3_64bit.go
-@@ -1,4 +1,4 @@
--//go:build !arm
-+//go:build !arm && !386
- 
- package s3
- 
--- 
-2.51.1
-
diff --git a/package/distribution-registry/distribution-registry.hash b/package/distribution-registry/distribution-registry.hash
index 38d7b5a487..9c2fa922ee 100644
--- a/package/distribution-registry/distribution-registry.hash
+++ b/package/distribution-registry/distribution-registry.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6330e6b625c0232b43cee8ea32800a660a7d7a0c79f4f53e4d9a8a6707138d46  distribution-registry-v3.0.0-git4-go2.tar.gz
+sha256  5ed3891ed90c7d097304f49aec2e1f16299770309e2f424b5ee9531b1da2429a  distribution-registry-v3.1.1-git4-go2.tar.gz
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/distribution-registry/distribution-registry.mk b/package/distribution-registry/distribution-registry.mk
index a01a3c1710..1119132b48 100644
--- a/package/distribution-registry/distribution-registry.mk
+++ b/package/distribution-registry/distribution-registry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DISTRIBUTION_REGISTRY_VERSION = v3.0.0
+DISTRIBUTION_REGISTRY_VERSION = v3.1.1
 DISTRIBUTION_REGISTRY_SITE = https://github.com/distribution/distribution
 DISTRIBUTION_REGISTRY_SITE_METHOD = git
 
-- 
2.43.0

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
