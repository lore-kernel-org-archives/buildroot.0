Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8511AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 22:16:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2413360F92
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 22:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2413360F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAF8D404A1;
	Thu,  7 Oct 2021 22:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjXo_4xINLOL; Thu,  7 Oct 2021 22:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03955402B1;
	Thu,  7 Oct 2021 22:16:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 606E41BF368
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 22:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F1C9402B1
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 22:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCwVxgRjVPKU for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 22:16:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92C5440205
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 22:16:49 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id on6so6002126pjb.5
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 15:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ddopacfyObGeNiY3X/+CqrDzDBjqO8USWr4NUKozuQE=;
 b=avui/hGzFQvlKbbBs/HWBp/4BDOqiyyk86HMn6yXRjYyPe+1FLidmp1qEr8wDijmd7
 AIhJw8xSj4xMn/Tnp3SqnUcm7ksJiEP9vKrXD7KS000GtabkjJr9U3ufP9u3P8cRctDi
 A3oRivWMirbiQiKhN4VHmpon7AVCw0MdolfXZOSAHRu+4lPEulEHNwsZsh4Ogm7677ct
 26SnB0REpgE0dOIYOmkcJDkntrcR4DQf2lez/3z19g+xJie0kRgbJwSw2vBitPKWJ8Kj
 SoSws5Z5F53n4RSl4Lp9gHwiTSfYEBHWy8I3WP3Z83KpLHy3okGsP8BTxRNRETAgxYFb
 hvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ddopacfyObGeNiY3X/+CqrDzDBjqO8USWr4NUKozuQE=;
 b=f9M/cWY7dxivNcuOlw2UGukBLhbtv2xW2yQJ578zXtShlppCHTsh7muTK1dWv2qAMe
 yLUgOxd6bhVSbXA+4w2LcQRse3yxlSu6XzHkAmJJRrtcNRvLNcW9+ZLCJj4o8eeDxe/D
 GX63nM96Yf+FY0T0YKBQCYjsWS/n0FqEYxO0LfPD38bQIVg49WGsC8YJCEjDUBUQ41Xz
 7Ckx+5weibtz8ApPZwXnBBwZGcoW8T+iXtba73GdDcEZfLpEq3NFJLosiUVb5U8pnWQU
 fmRXUL4lrrsVBCfzIXyJ7hRvFuOI/8YhFAFmMs2Xv9fuluXutTF28qtnceqV0f9dDr75
 LQUA==
X-Gm-Message-State: AOAM5300j/xQ+MsZzbAsoxcg/9yOSaXVeLd3j1y03k7SlH4eJDoZ0DCZ
 A4YB0z6uIAc3c+PPcVXXPVX5hHTr07o=
X-Google-Smtp-Source: ABdhPJy9Qc2Q/PRuckBiU7Clgv2pLe48j5WlTwS4IeldGONOGjlswvs/BZfNAEW+o7ux+WnoBBrBkQ==
X-Received: by 2002:a17:902:9a06:b0:13c:86d8:ce0b with SMTP id
 v6-20020a1709029a0600b0013c86d8ce0bmr6077733plp.51.1633645008684; 
 Thu, 07 Oct 2021 15:16:48 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id n66sm405603pfd.21.2021.10.07.15.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 15:16:48 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 15:16:44 -0700
Message-Id: <20211007221646.165282-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/2] package/nodejs: bump version to 14.17.6
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
Cc: Daniel Price <daniel.price@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes include:
  - Remove the dependency on Python2, as nodejs 14 supports Python 3.
  - Remove --without-snapshot as it's no longer a supported config option.
  - Remove /openssl to the shared-openssl-includes config option, as the build
    system automatically appends /openssl to the includes path.

  - Add a qemu wrapper. V8's JIT infrastructure requires binaries such as
    mksnapshot and mkpeephole to be run in the host during the build.
    However, these binaries must have the same bit-width as the target
    (e.g. a x86_64 host targeting ARMv6 needs to produce a 32-bit binary).
    To work around this issue, cross-compile the binaries for the target and
    run them on the host with QEMU, much like gobject-introspection.

V2:
  - Set ssl and bzip2 support to default y in Config.in.host to allow
    host-nodejs to build without selecting nodejs (James Hillard)

Adam Duskett (2):
  package/python3: Add bzip2 option to host
  package/nodejs: bump version to 14.17.6

 .../0001-add-qemu-wrapper-support.patch       | 76 ++++++++++++++++++
 package/nodejs/Config.in                      | 15 +++-
 package/nodejs/nodejs.hash                    |  6 +-
 package/nodejs/nodejs.mk                      | 78 +++++++++++--------
 package/nodejs/v8-qemu-wrapper.in             | 12 +++
 package/python3/Config.in.host                |  8 ++
 package/python3/python3.mk                    |  6 ++
 7 files changed, 160 insertions(+), 41 deletions(-)
 create mode 100644 package/nodejs/0001-add-qemu-wrapper-support.patch
 create mode 100644 package/nodejs/v8-qemu-wrapper.in

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
