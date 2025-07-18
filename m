Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE3AC83F17
	for <buildroot@archiver.kernel.org>; Fri, 18 Jul 2025 05:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 103F2612B0;
	Fri, 18 Jul 2025 05:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWffTI2jcZvH; Fri, 18 Jul 2025 05:10:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A193612B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A193612B4;
	Fri, 18 Jul 2025 05:10:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9C611A6
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 05:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5EB781A5C
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 05:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPRu4rXS3zEk for <buildroot@buildroot.org>;
 Fri, 18 Jul 2025 05:10:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=fede.evol@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6981681AF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6981681AF4
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6981681AF4
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 05:10:02 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so2755080a12.2
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 22:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752815400; x=1753420200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dwxGjqv1OwBe9XsdWSWDEKB8ARQaSxvsPQiRCPH6V/o=;
 b=n10Ok4b6Pcz/wKswTl5cmTW3Dtvlcv5KnPBQorxD0HFqD+SeVyTCsXpaP06Vjf5pja
 +mRwihXtpBEDaygakOCi56XM2JBIkimRe6o97wVD4dA2NgVJnTu52BqXrqvkI4mrik5G
 AJsL5cjwOskCZO4bfcOwV7TGMEBePsChPM30bhQ6w/FK1DXAQqNFli0WatJyiE2SP2Vu
 0mG1RkExFsyJDBBccF0Owp3AY7RlwPlvaP4Vc8vo1IKsKQv2LA++F6LjfrjlJQgigejV
 fKQhtRpI1oemlJqob31yo+VWLBS4MedpxAawdRA7687IXgr7KIvcsV6M9I5CgOxvaRG5
 PBAQ==
X-Gm-Message-State: AOJu0Yx+Gt6AT3QIqznC+h6oQplX6UKZIEiICNoSRBrEVH5+msUHozlh
 xcNxs4wwc+iuwLrFGoi8Si4BjfpN5vEWi2GizhWhVKE52A3UjdGKzhvUpCBqhQ==
X-Gm-Gg: ASbGncub5kdm8oApVZ2cVI2bEjdrbLSWRhgjPxqaFSfdJ+yj8MOwPiG0OWeensGAklo
 nPJCnqIirur0J4YaAlP1sW6S92rlFzIv1JpSf8OLMdjh0Azl50ETFVbNDLGZEyJuGRWsBYEKfN0
 5DoSO+t8aWk5Us0cwa54P1VS4IUx/1SKYLwNkaE+YtVvb3MqaxQRIbWRO7VyzSDMEP1t8lL4GLr
 /jY9gJAo5Mg3OZSTo5SDj762QchBp/JA5obwucwfOYaBXKFmsaVj/XO1AbhdPcS/3QLTGp/tdxp
 FarsT9N4eTnHoZmgnb+WWA8xOJNfKsnRjGpzUDdB2YALrlI3O2mCb1lE11xCdq3/pVqg8YGI+hW
 gBw3bQfgig6rDCgfkzBARYGoqC9Q3h+mTkNUtyNjDqkJ+5/6aI5QLp+hqxn+rrxOcsVS9LHKGsG
 TAg2/Gt0k5mXeZ6/PJGZ4LtPMstpzQXdqAuzfL+sldMw==
X-Google-Smtp-Source: AGHT+IEhYkhVNblLNVVr3ymfkZfC+z5SEWULe7zl8NDXdC4y8piEt1Nq8qBrT1czGVGq1zhnvmepVg==
X-Received: by 2002:a17:907:720d:b0:ae3:c767:da11 with SMTP id
 a640c23a62f3a-ae9ce17e845mr880196266b.50.1752815399858; 
 Thu, 17 Jul 2025 22:09:59 -0700 (PDT)
Received: from rawyouth.fritz.box
 (dynamic-2a02-3102-6875-9900-19b4-7432-1ff2-cb8d.310.pool.telefonica.de.
 [2a02:3102:6875:9900:19b4:7432:1ff2:cb8d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c7c77c0sm54475966b.35.2025.07.17.22.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 22:09:59 -0700 (PDT)
From: Federico Pellegrin <fede@evolware.org>
To: buildroot@buildroot.org,
	joris.lijssens@gmail.com,
	baruch@tkos.co.il
Cc: Federico Pellegrin <fede@evolware.org>
Date: Fri, 18 Jul 2025 07:09:54 +0200
Message-ID: <20250718050954.18325-1-fede@evolware.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752815400; x=1753420200; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=dwxGjqv1OwBe9XsdWSWDEKB8ARQaSxvsPQiRCPH6V/o=;
 b=fHoR/vnkV12X8RMH20z8y1JE80pEMZrx9PfVlkYpG7xPssYeCwqDZJMK7s/JYI5Yl5
 vrpPDDZgpiXQNs4+fFjKXByuL59WtGijGiVuGKhYuwnnDGWXKUHd5RyZsAfWBbvmhnl6
 8vH3fspLuNkVJVSUzlXlX1pzPA7l+Kkb52nM4OTY+/to3XqvZM/vpsJZfXkz/r+TrLp3
 7gsKlTf6aAN5b1utw2tL7AyacKUyjKeADJ/JM9AlU5Y8XvqHUlQP56Lq5NWbYZ9qhbeE
 Plcms6bu5bsEtoKn5V5RhMoxvKK5WnNYP/w+Ms0f1hn99L5JA6ZTYx7unrJdr7f2pvx0
 HOYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=evolware.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fHoR/vnk
Subject: [Buildroot] [PATCH 1/1] package/netsniff-ng: bump to 0.6.9
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

Changes: https://github.com/netsniff-ng/netsniff-ng/releases/tag/v0.6.9

Remove now upstreamed patch 0001-Detect-libpcap-dependencies-using-pkg-config.patch.
Fixes also: https://patchwork-proxy.ozlabs.org/project/buildroot/patch/20240829075015.39164-1-fede@evolware.org/

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 ...ibpcap-dependencies-using-pkg-config.patch | 51 -------------------
 package/netsniff-ng/netsniff-ng.hash          |  2 +-
 package/netsniff-ng/netsniff-ng.mk            |  2 +-
 3 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch

diff --git a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch b/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
deleted file mode 100644
index bbcbd2bfc3..0000000000
--- a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 194ec61843b9598ce90873c812b817c4b96e2e0d Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 2 Sep 2021 12:56:00 +0300
-Subject: [PATCH] Detect libpcap dependencies using pkg-config
-
-When building statically the link command line must include all
-dependencies of all libraries. libpcap can optionally depend on libnl.
-mausezahn can't build statically in this case.
-
-Use pkg-config in configure and in the link command to construct the
-library flags we need to link with libpcap.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
----
-Upstream status: commit 194ec61843b9598ce90873c812b817c4b96e2e0d
-
- configure          | 4 +++-
- mausezahn/Makefile | 2 +-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 510826a798f5..598ae2433a7a 100755
---- a/configure
-+++ b/configure
-@@ -588,7 +588,9 @@ int main(void)
- }
- EOF
- 
--	$CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c -lpcap >> config.log 2>&1
-+	$CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c \
-+		$($PKG_CONFIG --libs libpcap 2>> config.log) \
-+		>> config.log 2>&1
- 	if [ ! -x $TMPDIR/pcaptest ] ; then
- 		echo "[NO]"
- 		echo "CONFIG_LIBPCAP=0" >> Config
-diff --git a/mausezahn/Makefile b/mausezahn/Makefile
-index ca16b6579583..9544565355cc 100644
---- a/mausezahn/Makefile
-+++ b/mausezahn/Makefile
-@@ -1,6 +1,6 @@
- mausezahn-libs =	-lcli \
- 			-lnet \
--			-lpcap \
-+			$(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PKG_CONFIG) --libs libpcap 2> /dev/null ) \
- 			-lrt \
- 			-lpthread \
- 			-lm
--- 
-2.33.0
-
diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index 40b015cb0d..e63963c6d7 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-sha256  77d17d4158faf1d93c7d922a1bd7f093a8b437bd658292c830708540e10894ba  netsniff-ng-0.6.8.tar.xz
+sha256  027840fa3c4e11abfe4fd0fffe9909c5c4ed1428d4b9397fb6d2f5ea69325918  netsniff-ng-0.6.9.tar.xz
 # Locally computed
 sha256  b353349ba51e0d4b59cf2f188f0c285296e154ce8c58954bc5e0dc0282a4db2d  README
 sha256  8f6d85366f3763557d6ddd0637988b9ba11edef354e3c9302fff4262a235c387  COPYING
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 2b5b19b27f..5e779f1cfb 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNIFF_NG_VERSION = 0.6.8
+NETSNIFF_NG_VERSION = 0.6.9
 NETSNIFF_NG_SITE = http://pub.netsniff-ng.org/netsniff-ng
 NETSNIFF_NG_SOURCE = netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz
 NETSNIFF_NG_LICENSE = GPL-2.0
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
