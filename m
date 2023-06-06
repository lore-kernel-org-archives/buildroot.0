Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3CDC7EE24
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 07:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57ADA415CE;
	Tue,  6 Jun 2023 07:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57ADA415CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiHPpO6ComUX; Tue,  6 Jun 2023 07:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 568FB415B5;
	Tue,  6 Jun 2023 07:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 568FB415B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E56B1BF3AE
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 07:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0792460B33
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 07:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0792460B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XWDC_VfpV8U6 for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 07:01:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2720C60746
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2720C60746
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 07:01:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f619c2ba18so3802042e87.1
 for <buildroot@buildroot.org>; Tue, 06 Jun 2023 00:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686034889; x=1688626889;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ivg4Bi6/7dKPQohSj+SUoThywHTTcRUvP8zbUfJyLyg=;
 b=bxWKHbvjdnkwaaAedzZ74OKEGax0WbKhU2I1gIr7iCyHNDOdpd55npYZRhLDPFDkFP
 nru9LkzhEsC9xNMZuL7uv0NaTtbiC+qBwGS5473N8lxeV+S6wNAYcDaiIHLkU2Wz/xtO
 3nLiDhImDG3bazZLVVZUL13fG8c7zY1Nr+/dAi+U9d2c5lbwUac8s8y/rb1xqPhAbAqS
 S1bSg05IzcpbPsizQzLGyk+tfWHQI8hl915doe8ywFbH4Y1hYV4tVggh+iqLk8LkelTu
 7D6bqyNVV7BT+JZ2Dsl49kioaNBpNQTVHqSl8YZ0Wpps0b0luSi3do7FrlGsaGzL01Lm
 FwqQ==
X-Gm-Message-State: AC+VfDxufBItnTZ8n2iWGX++XJvGxguY8qcUMAyl2aU3DTcVtKzZu5gi
 966TmigkUfuFWTs41ywH9S2CtyxYTc0=
X-Google-Smtp-Source: ACHHUZ41LAujmz+g79YoaCFoKjoHQ5w1f5hJHZcA5jzSnPNYAVEYVcJqZTRN0UOvhA23Yk4+PI1NYg==
X-Received: by 2002:ac2:4a74:0:b0:4f6:2852:5f57 with SMTP id
 q20-20020ac24a74000000b004f628525f57mr639883lfp.19.1686034889217; 
 Tue, 06 Jun 2023 00:01:29 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21e:3500::522])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a197604000000b004f608eb50d1sm1336684lff.299.2023.06.06.00.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 00:01:28 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Jun 2023 09:01:24 +0200
Message-Id: <20230606070126.165827-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686034889; x=1688626889;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ivg4Bi6/7dKPQohSj+SUoThywHTTcRUvP8zbUfJyLyg=;
 b=XXe3E0oV115QQW27O5So0N2SDMdancijcyNMFwcsNMc2YR5k0EGEkmDKgqD3GLJWeE
 oZeG9mIhj/6xc80V6PoUDGqEtPe18wR0m0f96TrGbuSu0j52gUDLArkPftjUWpg7HOeL
 fNY8GhpEpcc4ZgNQL9TiEhz+PRnxtF1hUGT+ejoJLUyoMj/s50hSp3Iio5axo2EgnXe8
 NaTzY96rx9BUaIx+pB5yadR35IXXwqDWXA0uyRr5xvf/NHC92d8I7C/jLryuSPu3fkRy
 apxU9q1gU1lV2KEHejyf9HyDJQAn/1r6+GM6iMAzNRVMBM/DRa/okvXa4bqblacDSGMt
 503g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XXe3E0oV
Subject: [Buildroot] [PATCH 0/2] package/inadyn: bump to v2.11.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Bump to package/inadyn to latest version
 - Update description, mention a SSL/TLS library needed for HTTPS

Best regards
 /Joachim

 package/inadyn/Config.in   | 10 +++++++---
 package/inadyn/inadyn.hash |  2 +-
 package/inadyn/inadyn.mk   |  2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
