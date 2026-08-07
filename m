Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA68C2A09B
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 12:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 614098133C;
	Fri,  7 Aug 2026 12:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPcKp69a9IfZ; Fri,  7 Aug 2026 12:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49E1F8133D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786107331;
	bh=7vtBJoQoHbZVsJpWjMv9tx+VtzGDw/jiwVx/rr7NiKw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXBqVrNFE0o4v6VscRT7Xl4TwlGsegt3Vx6RnrEEI33tAHLElcw5IJEsKgHfnew2Z
	 Y1hkX/ymNU2zC3lRvQ3vUyuv9JGN6uyZBeTeJQtzs/hCjm60Lc5/B4sCpvV0/QJUwT
	 KQIkIe2bsLLmVs44f1+uz12ZS5Ljze1WMZgLavkxdqZWrs85qTWyZpnLMbWVVs7p1K
	 BamWclbDmCrQyTv2DvNx1CuwMIyYO4pU1F1trzo03jcaaX1NtUPtanIWcNNupETLHL
	 HqpP+Q8bH6mwa8pu71PSPKXC28itrgcW12dlNqB9Nnxxzk3gy8R8z1IzKAbuMEX+RE
	 40iRnEXXOkaaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49E1F8133D;
	Fri,  7 Aug 2026 12:55:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C7AED3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22B1540AAA
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDM1fl7Je8tN for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 12:55:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C51D40A9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C51D40A9F
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C51D40A9F
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:21 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c1676648c1eso22345866b.0
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 05:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786107320; x=1786712120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pZpvRobbnyEqXgzinwMT+LNQjoWiy1TReq/cHqQw84o=;
 b=pKCESQAHk5NPpq7hsbC6Ly04eowTMomKetKUid6gQe86QqeyPsVp87dM0BwJ6ESaMX
 fPwuyxqke1TuA8j6hVc3U/SbNz8UZbEbpUjGAkrvrQaF7SkBfzY3Wn+bXKUAYHBc1Aft
 Suzd/YpDqO/6oGSk3uzsKP6tneNEVQYjDlOxvZYxStoMckg3z/LXHLSvMdT6nElJdMoj
 C6r3kr9RE0X++9M/LJA/QvIpS/53ysgQJYaaCUfhSMANWZTBzRDXdGEz25pSw5RNVDAm
 RUl9P/X3T8XmYjPakXxkWyXNbDkagOFNv2QaugWBdzievv3VvDNlbax7TrsMjca7Za6q
 Mb+A==
X-Gm-Message-State: AOJu0YyD287BBcDvrOg/ijo4ZeHEWGyLzrubiGX8LFfURYnnMYedEPhY
 t1xjhGaZR9hlJP+KkaBLSfDtiUMBvwFGCtHdWJeoaD4zbJM8uBN0jjg0SVa5djyGLIeLav8LItG
 l57vMWX4=
X-Gm-Gg: AR+sD116k+OshZ3A4J3NHcUybnDaHYr8LsvcNlGfVtmOQu/M5/yYe/5LyCSofzlUOL7
 IZ3e6vMv8hzDMePLJbL8idKQhxqIZs5DQSsDkA9xyXQmHf7upTtr0PxnffHDZ15rm2AkJeBXWX6
 HIBtm3JOh7D53ffKJ2/kW5701fDpgHWiI9N/YmNGLVufu+bUJAPdgRz3YkITlCJ5uylYtq6sNsl
 KF0Ycpdmk5fVpHBTr5M9LrJTUxp7raNQNM26Ek9w60RYA65BSl6vgPxyF1HvWWmtAJqO7BCRqmt
 uDnDh1VvmvLf5kySDvOHeZoUvnLhBHO65xIqf6IcBYQ79xIxjYt+gkf2wwDw+qrDhPw3g0f93vO
 JzDLsLjBMJkwWdcZj+TKN8muEeeutiR+Bjd410Kql71J4mHFIZWVcMvzc/H6U5/bZ38/b94JFlm
 VRZFLnUuB44VNSgOMeqkYVhjU+S8ITcjOcnVEcpHrLelGq/Xh5eUaOgBG1vlnFD67rosXJsCw5f
 FJ6AvyPVzfTgML2d8/YXlpJp8JHLKhNJvPBY5oQOtATdwCc95EyrQ+0eSmyUKSfANxci8+16/mM
 X3t36K/9Kpi1FaOwD1aJD1AZAYFxiVUTk+fQjlHa/IZMLmut5yNdXHzs14lxY50Dj+4pL92mU/f
 GKVBBarGHGyM=
X-Received: by 2002:a17:907:a88b:b0:c15:de99:8060 with SMTP id
 a640c23a62f3a-c2039824c4cmr604319166b.0.1786107319960; 
 Fri, 07 Aug 2026 05:55:19 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2080a29a8fsm49539866b.4.2026.08.07.05.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 05:55:19 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri,  7 Aug 2026 14:55:09 +0200
Message-ID: <20260807125510.1285300-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1786107320; x=1786712120;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pZpvRobbnyEqXgzinwMT+LNQjoWiy1TReq/cHqQw84o=;
 b=a3Iu+ZwDidAF427WOH50FGifHaS/RLBCoDWyi5JTM4cm60N8ZHbjDspLWBplf44z8S
 ia2DxbWahhHzydwOwpX6D+Pg2KL9bAtB3AzRVUQS2GH8+ReIJ+qqjOLYKCLrb9MSJiRi
 XLDxt3SzlxBcCbmo2ElT2Z827Bb7RXTKd9dmI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=a3Iu+ZwD
Subject: [Buildroot] [PATCH 10/11] test_mender/post-build.sh: add rootfs
 image checksum for bootstrap artifact
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

Just like the generate_mender_bootstrap_artifact method in
board/mender/x86_64/post-image-efi.sh, calculate the rootfs-image checksum.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 support/testing/tests/package/test_mender/post-build.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/testing/tests/package/test_mender/post-build.sh b/support/testing/tests/package/test_mender/post-build.sh
index 76698fb7d9..db075628e0 100755
--- a/support/testing/tests/package/test_mender/post-build.sh
+++ b/support/testing/tests/package/test_mender/post-build.sh
@@ -4,11 +4,15 @@ COMPATIBLE_TYPE="buildroot-arm"
 ARTIFACT_NAME="RUNTIME_TEST_ARTIFACT_NAME"
 
 generate_mender_bootstrap_artifact() {
+  img_checksum=$(sha256sum "${BINARIES_DIR}"/rootfs.cpio |awk '{print $1}')
+
   "${HOST_DIR}"/bin/mender-artifact \
     write bootstrap-artifact \
+    --compression none \
     --artifact-name "${ARTIFACT_NAME}" \
     --compatible-types "${COMPATIBLE_TYPE}" \
     --provides "rootfs-image.version:${ARTIFACT_NAME}" \
+    --provides "rootfs-image.checksum:${img_checksum}" \
     --clears-provides "rootfs-image.*" \
     --output-path "${TARGET_DIR}"/var/lib/mender/bootstrap.mender \
     --version 3
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
