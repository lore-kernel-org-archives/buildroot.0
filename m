Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DCFC0218F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91B2840179;
	Sat, 14 Sep 2024 09:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KpYtsM3prz1C; Sat, 14 Sep 2024 09:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A8524034B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A8524034B;
	Sat, 14 Sep 2024 09:55:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3C381BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE306407AA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbFkvIMrW3Jz for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:55:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD10740789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD10740789
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD10740789
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:55:13 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cd74c0d16so28711225e9.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 02:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726307711; x=1726912511;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xB32mHbOFqA2hg6lfbY9syDSKC3UGCt2urwoDCa17Ro=;
 b=OGyPSxvuDNPfEpRm/o3Qu1jdI+WHxxd6Jd/GyQBatatSohk8PVpvk2M9m+spEid6zv
 FXHwUymz9RbEore54Ey82IBzEbg5HuR3jrc26nvDlv2ll8Ykz9RFzYQBZ5EvpPiD3S93
 YlwVg+gUyB3G77mql82MqjMS+FXRJLLdMxvJbi+BTFHP93lVy6UsbcIHJnZpKEtdQsvO
 YpPTFHdnK51VACQijExgcCmjN+5ih2AJNlvOR7FnJkmfBDL2bk9wfoTKjiPrZVhl+wU8
 La1pyZu/EC9BIf4RjHhd8cVfUUKVdztvmvXxMaz50U5f91ILoT8MmOfxAtHdHEMsdTxF
 DwSw==
X-Gm-Message-State: AOJu0YyXjT90Vx7ZGcnbpgRqepkBJz4iPoSm6XCbiKsM9MRr1cnxoIuy
 JJQCBOtdPdECXDrcRMo7iWOFws6DzobCNT9altX86WhPoZ0iYeB7Pxy25jaBhhU05W79XPTmZL3
 al1+qDg==
X-Google-Smtp-Source: AGHT+IE+D8gTOxUtD9UAFVsfY2tB6SSNVuOGBz7XTtRnVmQ+ea2QAjAAw+KZPURCeJjVdg/t8G6kIA==
X-Received: by 2002:a05:600c:468e:b0:42c:b220:4778 with SMTP id
 5b1f17b1804b1-42cdb579c42mr66022545e9.33.1726307711278; 
 Sat, 14 Sep 2024 02:55:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da22b87a9sm14457395e9.6.2024.09.14.02.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 02:55:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:54:58 +0200
Message-ID: <20240914095501.194725-1-arnout@mind.be>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726307711; x=1726912511; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xB32mHbOFqA2hg6lfbY9syDSKC3UGCt2urwoDCa17Ro=;
 b=c7YMs+YbHNWGOtqekgq9qw9MDEqJHxXs39hKXeuSXQUPtNnsi6iHXe1xa+9R7kWVml
 JAK+ynAAUw5Q0gfE+vtS5D1mfgx95sDb7R1CFf3Y+RMUEkqFLAUve1znvN2V26I8ZAU7
 r5SQnlrRMiqu1gUWR7eWN6UNOH+euhU39BLUhXZ8mbFjkF8Fz1Jmh85xmWbDSOpANhMK
 JfTWGK3Xs3EPnwyGPY39f7Cj8IGt4hGjeyLh9INHdgIK/9mMvZcdSwFPw/t5p+7PWT6D
 gn9BVw0URW4mZ3qInUfSBx41omTcU6IniRFybR7ZA0RwiTTRIytL2/8MUHUY4j4Qdw2J
 L3ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=c7YMs+Yb
Subject: [Buildroot] [PATCH 1/4] package/pkg-generic.mk: legal-info: create
 redist directory for override
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit aacca7f0639bac6bb3fb262d0b1738c4387edeb0 introduced the
possibility to also create tarballs for packages that are local or
overridden (i.e., with a custom version). However, it forgot to create
the directory in which that tarball is stored. The original patch did,
but it was reworked by Arnout to use mk_tar_gz instead of tar directly,
and the mkdir was dropped there.

This failure was silent because the mk_tar_gz function doesn't exit on
error. The following error was printed but ignored:

    support/download/helpers: line 68: .../legal-info/sources/busybox-custom/busybox-custom.tar.gz: No such file or directory

Create the directory before calling mk_tar_gz.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>
Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 171163dcb4..69352b3730 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1163,6 +1163,7 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 	$$(Q)rsync -au --chmod=u=rwX,go=rX $$(RSYNC_VCS_EXCLUSIONS) \
 		$(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ \
 		 $$($(2)_BUILDDIR)/.legal-info-rsync/
+	$$(Q)mkdir -p $$($(2)_REDIST_SOURCES_DIR)
 	$$(Q). support/download/helpers; set -x; cd $$($(2)_BUILDDIR); TAR=$$(TAR) mk_tar_gz \
 		$$($(2)_BUILDDIR)/.legal-info-rsync/ \
 		$$($(2)_BASENAME_RAW) \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
