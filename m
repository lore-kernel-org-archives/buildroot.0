Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58664C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 12:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC068410C7;
	Sat, 12 Feb 2022 12:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qx78uuvQDkcS; Sat, 12 Feb 2022 12:46:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34497410C3;
	Sat, 12 Feb 2022 12:46:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CDE21BF84C
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25E9760B8F
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MaiZbpm258H for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 12:46:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64B6560B61
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:46:44 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id u18so20250896edt.6
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 04:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TEFwAZS6zK4GufuTB+yft/iQ7KkiPDqTeDcvQBJQ58s=;
 b=L5JJIXJ5jSSxTnFxfBdLMSwjYphZ3Yxrc/GseIYscmGVDD4VvJOMt64DjEqNUWdeYX
 SaIfLVwgmaIohr89yxLQqxUf3pPK7ctMNdFWYhBEKuoSk86IACFxsC65kU/XrCYPMr7u
 iV6+frkUFRXKdwd344Xq1gCZq8jd9kQlr0aAQjQWNrTGlB9A3F/Q8EoL8KK1V0EoBW67
 Fu8rvFMN8RiNiXctK4sbxrxRcxOavZpBH5DkkslTWoHnQuEUuJkhDwmwG7SRlyqrOOK+
 9pYWoAqoQscnCKeP7B7QDxfTMygVj8t0uQvthVZlaGqRGZ6AmSYzRck8sQLGe7XEex38
 F8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TEFwAZS6zK4GufuTB+yft/iQ7KkiPDqTeDcvQBJQ58s=;
 b=fe6qpIroCeVv86E14ZjkS/koC6J+b4MyVF2rKao32P2FPruyggQw94hJ5eVrZ/3u03
 9myjfSaHtC4G2UfYpygIcGXGwGMArANDoxgfFLI8MrHY04UGhbtdms8I3gVcktZ1XH+A
 XSvzDPiRJj1acjbqa5g+wnpPLsdoQFLtUQh0/kab8oPaJOtFajMmPtZLxL3i5j2I6qlT
 QAWcEfu6/ydLJTnU4Z7qOlf+iJoCjED5VLz1vRCvAfO4MoGE0h9S0hHBnHQgsUzo47Bb
 bMzSFZimOJpVjFYnh2P3cs3iUTBhLbJ9Oh40KdZm0ow1K93zgLuZ2q1YYNuxGhrW8m5f
 yerg==
X-Gm-Message-State: AOAM533oeBANGUefO1IzdiQhtO14O0VM5xMuKK2hmGlZX9G6VS8I5GHi
 SDxu1eOHVyqj4l/5ROvXTyNMN1MWfOCPMQ==
X-Google-Smtp-Source: ABdhPJywDkO2CU3m4b/O2yiztQDzQCOpCN1pUrnBWPLCq7Ot70DDMJKmOHUMY/h2NUcRlZvy6c/oow==
X-Received: by 2002:aa7:d459:: with SMTP id q25mr3331802edr.356.1644670002521; 
 Sat, 12 Feb 2022 04:46:42 -0800 (PST)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m17sm65915ejn.118.2022.02.12.04.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 04:46:42 -0800 (PST)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 13:46:33 +0100
Message-Id: <20220212124634.3148041-1-arnout@mind.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] boot/uboot: depend on host-python-setuptools
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

host-python3-setuptools was removed, we should instead use plain
host-python-setuptools.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9e569906ce..6750069173 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -208,7 +208,7 @@ UBOOT_DEPENDENCIES += host-dtc
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
-UBOOT_DEPENDENCIES += host-python3 host-python3-setuptools
+UBOOT_DEPENDENCIES += host-python3 host-python-setuptools
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
