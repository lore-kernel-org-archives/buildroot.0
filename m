Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00506CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 11:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A88E561162;
	Wed,  3 Sep 2025 11:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeE1LkqskU88; Wed,  3 Sep 2025 11:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E64EB61176
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E64EB61176;
	Wed,  3 Sep 2025 11:01:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1468F10E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 11:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1174083B97
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 11:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jns77sYGsOGD for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 11:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B285842B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B285842B7
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B285842B7
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 11:01:01 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b113eso8618743a12.0
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 04:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756897260; x=1757502060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EnaP7Qd5h2DbRpH4jL9Y3i3q6AT3k/3qE9Czvn8dptg=;
 b=CFIqvvF9u8JY2JErQVHIpm1PJdsVYK69G0tZsIubdj4NU+s8REmNPGXNptA/zmdVpc
 +FhxVan5APT+72iAnqRy8Uu/qMDJurUYI2g9IcIuazcAAXWai+5oV0JYPNHeU9Avbv8M
 CslcP+sixYJ+eJl6lHdG8JM87qYIA7ehoee3yu0Oo8d4ubhWZ27pUHFfCnAoM4JRdYeT
 s5C9asX+Mh1Eu9eLJSsgRwNnO2unTWvDUPWH6RbZkTDnlyIg8FnKETJSuq/qxeEsYUnd
 3bL9YL40TogJbXIGgzo3gwCQsNRWNyhbuHDxNn4hzshNm3+EMRYNpo1Auijd3436IOyj
 hnEA==
X-Gm-Message-State: AOJu0YzABUT24CIs+LZftrLG+8PGA3zSsTtLx9ituC6/QjrqCCQ2T11n
 9EdRC87HD8eoHIPDsgT9W/cyWgE2CjEx5jvna9L9SJb+yTaQzO1u9+K68bVEjUAeOj0lzwy/j8y
 s8lvFa9R3bl3T
X-Gm-Gg: ASbGncuWnSTolnPL5JwTC8Vl482rEzp3XqX9ULCt+gvuPJ+8Z9YvQFRyJRQmHchWcff
 nrCoC3Ej03hzod/PQwYXJxn0IfVH1WRnZVXvaTVYKkh2uU8w2PILuO/pb/poVMJpnwplg5N1qu+
 Y0LOYrQCTYh41HEmk11mJvH/cVKmXjCMpht80Dfd74xmOyfWvtZoVGU4Vi7jd+q1OoCXLjislN2
 5WiqwNllB/W7U+0RNeC93ku+K/bLNODPzDtOIDnGyLIPCdWMKTIas1pgXm0mGifHs/bltFgdKLa
 Fxsbkp9rsL9/mpn2t5zoMSY6YHKxVu4KUXKsqp6k8ta5FY2ZgrzZ/dfQHGQ9Rwly+2ohydtEM9q
 o/IE2DdAb+KfSUucO76MaHwIFohJihaBXScJsj7E1MYb1cDs=
X-Google-Smtp-Source: AGHT+IHKp+PTyxrHfpLlwP/gNtodV81z/hMpRG2/GtghxmGCyA81ZS6vDf8zpzzejdIw88WBmzGfTA==
X-Received: by 2002:a05:6402:210b:b0:61e:a5c2:6358 with SMTP id
 4fb4d7f45d1cf-61ea5c26477mr7651874a12.34.1756897259638; 
 Wed, 03 Sep 2025 04:00:59 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbc9asm11863399a12.25.2025.09.03.04.00.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:00:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Sep 2025 13:00:46 +0200
Message-ID: <20250903110048.441164-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756897260; x=1757502060; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=EnaP7Qd5h2DbRpH4jL9Y3i3q6AT3k/3qE9Czvn8dptg=;
 b=Hk/4l7FMbryc5u24XSFHwCSwjmrsqcmUtZPJyX147NLSdLZwiNvRSGSj+Kt5YeaL+D
 UEIVgCofgfMeozayXr6AazdyQxG5feK+MN3k/0yqpltw5/25sDLJCMGwPo2f4spcbA/h
 O42MtkORISESdToLQW3Jo8+WmTWsACLkLbDYM4r1IKznGMi4td6JgxBFuRdnVUqXDMEm
 wCEpL+Qbj+U4WxZDBTbU/STQf5l7x2LMk/3W3Fvji0dDay+qqik1hgjIHZArBrG7tQBX
 Z/mBverXsZMOO/cKDhAdlMJYq0OR3T5LENLAN/QWxcjeO6J6u7O3RBhiLzHbL6v42bsJ
 9YFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Hk/4l7FM
Subject: [Buildroot] [PATCH 0/2] package/wireshark: update to latest version
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series contains 2 patches that gradually update Wireshark:
1. to the latest old-stable 4.2 version, fixing a CVE
2. to the latest stable 4.4 version

such that only the first one could be backported to LTS

Titouan Christophe (2):
  package/wireshark: security bump to v4.2.13
  package/wireshark: bump to latest upstream stable v4.4.9

 package/wireshark/wireshark.hash | 10 +++++-----
 package/wireshark/wireshark.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
