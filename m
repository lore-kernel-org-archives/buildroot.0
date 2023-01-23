Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD96DC05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 08:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A25D4046B;
	Mon, 23 Jan 2023 08:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A25D4046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lYTmLC-l385; Mon, 23 Jan 2023 08:35:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF7EF405D7;
	Mon, 23 Jan 2023 08:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF7EF405D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 004031BF369
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 08:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCED5410A8
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 08:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCED5410A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSEtps9rPpGD for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 08:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7DCD410B5
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7DCD410B5
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 08:34:32 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id mg12so28434473ejc.5
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 00:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zdCfGmfPpXuZvPc1ZCSZ5btD2ZH6Jx/kE5DOTpodJGQ=;
 b=zVSVhENgrVk0x6SYM5yO/wSDI1FuZHyZcSB4nXtQipy4rixBGvKbNBpPBppa63rLJ3
 r5XT7BdXB/QFB0ce7M8SN+G9c0hWrI6D9RT76DIxmXrdumdH693wwUGz/2Qv9So+a10O
 ktEd9b4yDtDc+VfoommPdmO67Dsa6zXkS3Cpj4rU7viKwEq8ln7AKerrk21bl0H2tIyf
 VdWNimGVcTRAv7xRKaDK64iD/QaFqhpIVUd+RwyDzX0Y0nQdfmBsWhez7jtU4zlm92W4
 TnKdHXsLOOa6N/eb5Kntfa+ADUpl8jG4IqyT5sj/ixKXdhcmFvzhZj3wrFlz/EwtpBj2
 vEnw==
X-Gm-Message-State: AFqh2kpiPl9lD54sUVCborUbJVO+XOmWE9rjR10q0UverTmx29/DBHfS
 XYD5WRXD998PovAZX0IFfns37OoUitExgQ==
X-Google-Smtp-Source: AMrXdXu4yZc42FACeNsNyxhJwxIb9ANC8CgVmWnvDLM3Fvcw5VsbVWyZ1DpcONyA1hyTyLgy62MrVA==
X-Received: by 2002:a17:906:5214:b0:7c0:f2c5:ac3d with SMTP id
 g20-20020a170906521400b007c0f2c5ac3dmr22935998ejm.15.1674462871999; 
 Mon, 23 Jan 2023 00:34:31 -0800 (PST)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 t1-20020a1709061be100b0086f40238403sm11986212ejg.223.2023.01.23.00.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 00:34:31 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 09:35:08 +0100
Message-Id: <20230123083508.3041367-3-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230123083508.3041367-1-marcus.folkesson@gmail.com>
References: <20230123083508.3041367-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdCfGmfPpXuZvPc1ZCSZ5btD2ZH6Jx/kE5DOTpodJGQ=;
 b=DvarWDyjCfVnUvvM7lzQvu+9ZaQGlOHR3VTypzZCrLWRCaMs3DcQygTUqvstE0zkgj
 UNVGBn6AQLGAeZC/DIvZrFDSV1w6GcTL/D6fvR05mucdATXsW9UPQ4MHgyjcYxNkjzyL
 NEa68SP5QlDFfUOiMZCEY1DXQBOMi3AMMuZXWQca7vg3IUnPRf3+qcwVAOsy9T1yJ5/A
 4nPNjszOWqs+hPbVY4OG8wEHp73DZMgjlWtwlkzYzgLpd7ATMRMIBK2ZvsKmA95UfLem
 Lrl3G0ZHKNK5UgearD+5lbYRQ10AMtBJRTKscMHlUD2pbW3yaKsdvZ7TO7wVYKdLBnf6
 rPGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DvarWDyj
Subject: [Buildroot] [PATCH 3/3] DEVELOPERS: add libcamera/libcamera-apps
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libcamera-apps is orphaned, so take care of it.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e8e0dffcd3..b973c37b82 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1890,6 +1890,8 @@ F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/libcamera/
+F:	package/libcamera-apps/
 F:	package/libostree/
 F:	package/libselinux/
 F:	package/libsemanage/
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
