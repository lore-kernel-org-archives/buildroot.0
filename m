Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10853C369A5
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8DEA83F65;
	Wed,  9 Apr 2025 20:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBF8wttzzkY7; Wed,  9 Apr 2025 20:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B63E283F60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B63E283F60;
	Wed,  9 Apr 2025 20:03:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4887BD6
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 456DB41385
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6o422JY8GMFS for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90E7B405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90E7B405A3
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90E7B405A3
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so867345e9.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229025; x=1744833825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vl0RpGCGragOZ/Vc4EDiYSCTVjs0TNo1ixieRZfHn+8=;
 b=vc42xFHwnTxrywqHqsPoIYWzk2ryh3he+rxpT5j+GLllucUNtBLSwSQ+zgeH8X+8W/
 cfFOUywDsXlr61tjYmQIzlWufMoUx1TaSm3U9EiYklULqM62YQaivAJD5eF53IHRl99o
 NWzuqlqqJBCUHn3igkbJgsJmUs2aJFZgmkWLH3rw/VMH4239cZjDu1CHr+j2z5ECKf8e
 Gy9YO+/3pf8g9b981kqMIsD34JPj9+rA2sEU/TlMle7on5L6EpnMdKyu01PZmj4dgsn3
 VgeTsMRgjo3uSfN1YrHZl8F8tpZ8hYMv1YTvisk+E6mIzXkmLlhMDHOGWY6bK53SiSha
 7NEQ==
X-Gm-Message-State: AOJu0YzxcjnaqhxvyYcPyE4Lajmr214iyPUcObR4sCjbmycGfxkvNzgY
 7dtYkkHZckqNPQXPhNC/7mJjWD/mOYzkjXIxGXa/MLs7fN/rJSOEMPO8wQ==
X-Gm-Gg: ASbGnctz3bEZxdElUx5pA1SMbOa4HxVFukiXjLxWPhbvL6cdxDL5Dj2Sai5GM5DySy0
 cnECUEUqmWopDmO+fJBhsCdFuVsWuAceup8rhNnYPSgK5WEaXpNWrKfC/8EWE2eIfSwOMYgzFB9
 HUhMi2yMAPQABps/489SIFcm3YnLOnLxviJinc/YZ0rJKBOrhzd2X7xz6OIjCNWbIpq8wcpCZA8
 w+9OBEUAv4YMEOmJkV6lCkSdAJjSar1eQDaw2lCULHGL8a/XAs2dXW6gIB4dUcbK0YoT43150n7
 guRv66SuHghJtoX/geWm8YQ67c2bP0rQKOXAAiqzPFEmZC282Gw=
X-Google-Smtp-Source: AGHT+IGAcdXH+BMxVSqOEfm3j6R15QGYG1r4b3/BpEXEEFublErubmZweIf8FWcWzF/FGWi9/nSlxA==
X-Received: by 2002:a05:600c:3d94:b0:43c:e9f7:d6a3 with SMTP id
 5b1f17b1804b1-43f2d7b89d4mr3357615e9.13.1744229025357; 
 Wed, 09 Apr 2025 13:03:45 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:45 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  9 Apr 2025 22:03:16 +0200
Message-ID: <f89b12cd7480ceb378067d5088717357615293ec.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229025; x=1744833825; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vl0RpGCGragOZ/Vc4EDiYSCTVjs0TNo1ixieRZfHn+8=;
 b=dLvkia7TAyVdSGjtCDb8GT4eVROtyLJ1UGYYBWLuWsdi41G8wqulrZI1shvYXk+hUN
 Vn/cJPNLh1bNqkFLOGRGY9y4aT256CDr8gqwbas9Pqv2EOCPikFbKN6YFxIM3+w80kqZ
 bRGSa7/C7FWGqmgSjogZQsNMkN0u54V4dRyCYPS/bqhM6bGDGw7w/nop1JIFjlYNSyuK
 p9msw3jKDeXHcvcxaCAB5eGMssKoN7ZuuKd1Zh7WwWxqx/MDr5zUKo4FxKnQXbJuNA6E
 /h3ar1GpvaUrD/88TLBpARrWGKsJq1a2R+WOfE3DNulEHegcw30HWjwv1f+TXaFz4WbK
 aUIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dLvkia7T
Subject: [Buildroot] [PATCH 01/29 v2] package/libsigrokdecode: needs python3
 w/ zlib support
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

Some protocol decoders in libsigrokdecode need the zlib module:

    srd: ModuleNotFoundError: Failed to load decoder usb_power_delivery: import by name failed: No module named 'zlib'
    srd: Traceback (most recent call last):
      File "/usr/share/libsigrokdecode/decoders/usb_power_delivery/__init__.py", line 24, in <module>
        from .pd import *
      File "/usr/share/libsigrokdecode/decoders/usb_power_delivery/pd.py", line 24, in <module>
        import zlib   # for crc32
        ^^^^^^^^^^^
    ModuleNotFoundError: No module named 'zlib'

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsigrokdecode/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsigrokdecode/Config.in b/package/libsigrokdecode/Config.in
index b58c8a2a29..463cb25f28 100644
--- a/package/libsigrokdecode/Config.in
+++ b/package/libsigrokdecode/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBSIGROKDECODE
 	depends on !BR2_STATIC_LIBS # python3
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB  # runtime
 	help
 	  Libsigrokdecode is a shared library written in C, which
 	  provides (streaming) protocol decoding functionality. Say
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
