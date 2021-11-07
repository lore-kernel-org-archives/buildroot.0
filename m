Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE1DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 09:54:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A073C6140A
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 09:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A073C6140A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3931340298;
	Sun,  7 Nov 2021 09:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOYczF4Yfc2X; Sun,  7 Nov 2021 09:54:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 927F940294;
	Sun,  7 Nov 2021 09:54:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 770191BF317
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 09:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65F15401A2
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 09:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G4MIK8LuQTDv for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 09:54:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A704400D2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 09:54:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id c4so21392875wrd.9
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 01:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vugf2JVApFnm/PcUhLVJeAa/aB8KQywJpRuUd2Ozh/Q=;
 b=TkuAvsTQB8SQH2v9utxAKmUOzGWZD4q5gjOnx00N9k1Kq5b4Pm2duaXCN+k76HK9av
 b5JosHnOYUY9FsUxlB+vTQFhjjM61lS82nBW3nvbNc/w2DaWXT8Y14sEklFdAUo0bHLU
 CqXJmBucWFYJ5iY57uDgDPmi7ur0O75zesNNuOV5b6iPUl/3ubKMWF3MVTJN/UOG8zQs
 a4fykYXa8qiu9JIP1GIlnxvbuuljhj1zu4P5y2ZGL1qYbOTidxCYWxA+NYTFnjN3C8XB
 G3OSRSBFEN+9Lh9i13xo9wMvxK1QokPmGXy/ph15vxwfy54fypghl9G0hGuaB5a9uUh9
 uiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vugf2JVApFnm/PcUhLVJeAa/aB8KQywJpRuUd2Ozh/Q=;
 b=6tKO+iHBFB8p1hb3yBwxn4J7+nWm6gbJvtbVXZtbzqVWsgv3K6brSZx4YpR8w73leh
 GWr2ZOl/HAt99FxqYYo2+hhoS7RYQAWjPCPgDbj5QOzIrk+BJ1jRRb2pWAVAOotc09wT
 FUJALDxTZ43WbZf3A97GylkX22mYyZyIk+tV9OeAlPOx3U6hebTvas1WQ+smpYaZnPGm
 NJet7s2Wq2YGWeghoXLQm0uC7BzwkQyPzfsoaBLVu/qvHsv1XP4f87NKiRiPYv4QZs//
 CmrBE9BitKuNrbxwGtKc6uuWYaOZj/KX0I5LUV4bjidJm0dHm0h0kaW3+CBwfv/osFr1
 N/hQ==
X-Gm-Message-State: AOAM530eVELgTlxsAYqF96ili8oaZFM2TUlR1WDsdeJuft+iiIML2MaS
 I0XCr5LhVmG3rzW1ZUhDNkFkMLIR3ag=
X-Google-Smtp-Source: ABdhPJwEunjrhboe0g5GqzNclA1Elx4sc3Wl3JZVlfK6S4pUX4Krlb2teAT8HveLSLtMtYQS3KaJsA==
X-Received: by 2002:adf:e7cf:: with SMTP id e15mr89325667wrn.287.1636278875247; 
 Sun, 07 Nov 2021 01:54:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id c1sm12840886wrt.14.2021.11.07.01.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 01:54:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 10:52:44 +0100
Message-Id: <20211107095244.3503192-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/softhsm2: needs threads
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

softhsm2 needs threads since the addition of the package in commit
53873b6daecd2a97740833cae7c5b4cdb185a6b2 to avoid the following build
failure:

osmutex.cpp:240:2: error: #error "There are no mutex implementations for your operating system yet"
  240 | #error "There are no mutex implementations for your operating system yet"
      |  ^~~~~

While at it, fix a typo in comment

Fixes:
 - http://autobuild.buildroot.org/results/40a8c2d9f58fbe490b6832754fdf8ac4ee0804fc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/softhsm2/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
index 58f3e3086e..78fccc9512 100644
--- a/package/softhsm2/Config.in
+++ b/package/softhsm2/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SOFTHSM2
 	bool "softhsm2"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
@@ -14,6 +15,7 @@ config BR2_PACKAGE_SOFTHSM2
 
 	  https://www.opendnssec.org/softhsm
 
-comment "sofhsm2 needs a toolchain w/ C++, gcc >= 4.8 and dynamic library support"
+comment "softhsm2 needs a toolchain w/ C++, threads, gcc >= 4.8 and dynamic library support"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
