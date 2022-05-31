Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CFCC433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 10:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA8041A21;
	Tue, 31 May 2022 10:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmS4L7wMs4Ca; Tue, 31 May 2022 10:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D7A9419DD;
	Tue, 31 May 2022 10:59:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E77C81BF276
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 10:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5C5083147
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 10:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H61yNLI1AA1Z for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 10:59:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7B6583145
 for <buildroot@buildroot.org>; Tue, 31 May 2022 10:59:48 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id h11so16961282eda.8
 for <buildroot@buildroot.org>; Tue, 31 May 2022 03:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DPHs7AfealmLOUJShhNyCQin9Xu/s96LyihuwdALu+M=;
 b=dR6OywW/mTHU3yUhYtAOBLsZiKbk12KuMMxG5gwdC21pfM+uJv4bGURljl47LVOlWk
 RHWKgMyDaCl69GmtwqerD+TMw5LbtRODY8quZ3Br0etmlz2qj6Qo8cZ8bSUGeOUk88GG
 W6MI910EER9E+gB2Ijgmj5PZ+U7iDD+G+pAGxYPOPsacDJnKVu/2rf2Fb2odJb97zPrr
 7Lhbj/ejVTDf8qSmQcbUvWQzjjkL0LkEHV7ymxCZBYRduMWPXxEu7lpAf44Izr6HlbHL
 7k7qJJfr/YZyKEQFtpgJtRaytYQ36kBSt4hvxC07xuQXPL+Q/KMF9J2o8VrlwumH4zSx
 H3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DPHs7AfealmLOUJShhNyCQin9Xu/s96LyihuwdALu+M=;
 b=2fRNjrBENTHGD38ReOOudXm5PybvJdWV2kXkVI02ULJzMkSJlsqxIWxB0m0igbiGT5
 eBY9wJ8V77Eb5FYtx3siJ1s/YM2xW/SH0xJckZrJWsr77HPS2YQWWlIB9OZr4QHzO/g8
 tXbBtHpyqHiAn36D1j/lj30IIIg57wqZuK+qPxO7wiqRk+gbvFqfobb3MY2yyJaS1nin
 NRz4jUFkiAFzumHjlN1YcPFGqKd8N1E0TzdL7dblifUUd9tVAwZUBOCg9hlj5KYzi2Tv
 rGT/ed9a2uttRQyOYHtGtpLCQpnPiDYusdkV8+oSwsMkUXdplNI2LGJuxnMg5AuMDdzn
 F2tg==
X-Gm-Message-State: AOAM530Ww2QMkm1Ta4YcIiMWkbPlGmuwoQQ70R5s6oWRZMSZA1M9p/hx
 qBqcqAc0SSvnRdUWjXR7DZj+gt0LnBk9wQ==
X-Google-Smtp-Source: ABdhPJxWy9Z37wJaWuonLAF/ykjZXs5IdhHB0QU+bXgG2kRIUfGesNZV+awGyASQR6ciYleLJskRmw==
X-Received: by 2002:a05:6402:390b:b0:42a:acb3:bb5 with SMTP id
 fe11-20020a056402390b00b0042aacb30bb5mr61576133edb.236.1653994786695; 
 Tue, 31 May 2022 03:59:46 -0700 (PDT)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:8e16:45ff:fe22:ad85])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a50c44e000000b0042bdb6a3602sm8188793edf.69.2022.05.31.03.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:59:46 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 12:58:59 +0200
Message-Id: <20220531105902.204022-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/4] Bump U-Boot to 2022.04
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since U-Boot 2022.04 the host tool mkeficapsule requires gnutls. Thus the
dependency to the host variant has to be added in case the U-Boot
defconfig has selected CONFIG_TOOLS_MKEFICAPSULE. Thus a new BR config
option is introduced (BR2_TARGET_UBOOT_NEEDS_GNUTLS) to fullfil this
dependency conditionally.

This adds additional indirect dependencies to host-libasn1, host-nettle and
host-libunistring are added and will increase the buildtime.

Heiko Thiery (4):
  package/nettle: add build support for host
  package/libtasn1: add build support for host
  package/gnutls: add build support for host
  boot/uboot: bump to 2022.04

 boot/uboot/Config.in         | 12 ++++++++++--
 boot/uboot/uboot.mk          |  4 ++++
 package/gnutls/gnutls.mk     | 26 ++++++++++++++++++++++++++
 package/libtasn1/libtasn1.mk |  1 +
 package/nettle/nettle.mk     |  1 +
 5 files changed, 42 insertions(+), 2 deletions(-)

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
