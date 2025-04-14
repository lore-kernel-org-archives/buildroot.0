Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12EDC3601E
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 06:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A96224052C;
	Mon, 14 Apr 2025 06:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ie6P0ZjGUXEv; Mon, 14 Apr 2025 06:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE28A4053F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE28A4053F;
	Mon, 14 Apr 2025 06:30:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7392108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 06:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89B8C40548
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 06:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62FOKy2-tPva for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 06:30:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B21B64052C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B21B64052C
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B21B64052C
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 06:30:51 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-736ad42dfd6so3077779b3a.3
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 23:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744612250; x=1745217050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gmV3zfQDsttE1JYLUOroGkgB71sXRJjxRH/aJ+MpVqk=;
 b=FJvOHKV+yaPWUqbg0rGBlD2NBiiOz+oUyNlFrMdPP9S3WLcZ0DgZYvZCFWQFSwRaUt
 rExe+jA86Ro75ppmMKDd3NC/AbCbzbXjp9NCoMCJaSJ+K1Ip6GIeLKXjSS+H/cZvl65q
 Eb/+TAZnd+Fjbc2J/dCYjdfzGwH0CUb0Lssjs5H13iWT3Jv/zOQf5a/Wm50O/E3qp/yX
 ITIeqrpDe3h52J+Pk7LCWTzayCrlOIMwBZ6jebz5IZLmPSgWOSdM+n1ZfyEY/1Qbokxk
 JyzenRc/E9GUGjHeo7p16Qfp3MULvZ8rwR8EDUfpbf59VC65VFGE3oPIcyu1HBSR9Mle
 MFaQ==
X-Gm-Message-State: AOJu0Yzh/RTMyInvtqKILI1RRjnCAEtSQ/G6CBm0S2GfL6E8gTnWS3qQ
 Rrii/AZu6AkCD3HEb3599ys4zX3OSMe+o3Au9+mI+AZIyxiAjn2dRgYe7g==
X-Gm-Gg: ASbGnctSFpifQuHTirjn9EjS4YDTyQiXeDsqrEmdm25KfzdZ5UVpXYe7HFfsr/CgP+v
 mG57g064lUyOM9lAtOm6xDgteZ6FTiqCHnyc+nKAn4fNKgkD7WWMPy4rUV3TO6NgePpdJFKQ9DG
 ZHksi/w6UE51/8IbFHeY21hzTnr2yuwot1TQ1QNJt28oEwWNJPslz8FTVYKbR43ldJo+JQKbqRj
 92schKPpFZROdcdJdoSpSKKip7xO8BVTEJHjdpBJto5sTTeqo5/I6wEwBf0UD2PpdBkKTEL/ktj
 EdMrE1tRPKgOq62Tj+bn08q1AY53/YcUPFPXtg==
X-Google-Smtp-Source: AGHT+IHknk0MOL/8YHMCAYV5DS5gxCUeK9CLYAlzzDfleOF71QoU6dTO4jRv1zV+q8yIXHGdBFZ8Bg==
X-Received: by 2002:a05:6a00:ace:b0:736:46b4:beef with SMTP id
 d2e1a72fcca58-73bd119ea08mr17442104b3a.3.1744612250260; 
 Sun, 13 Apr 2025 23:30:50 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd2198ac2sm5910874b3a.8.2025.04.13.23.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Apr 2025 23:30:49 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 14 Apr 2025 14:30:39 +0800
Message-ID: <20250414063041.3385071-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744612250; x=1745217050; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gmV3zfQDsttE1JYLUOroGkgB71sXRJjxRH/aJ+MpVqk=;
 b=RQ09MFAwaVGK3yaHIC2rvq8ujI9ZOePu54WMraATDlOp6w/BaVsBZSlfDNRkdn4R/7
 ie7qEGG3oWxVJM1uKdDLDYEXcVj18GySNimTWXFaq9JwPHTT2WMjTUY2SO3oikPFYuRB
 lo9VIqLnWea5Q1HGMw6dZzi1+KPwIQkLhnNRKj8tcf5AbF1hUC1LzLhG0jZpf9gxp49/
 L9qNA69n4Z7WYV2AmUqeAjEgUbEi9TJOmzaBuhOgD+4iNd4uTqVWk86HZObmNi0uvsUm
 7kNgYu1OX5nk/OLcdOmZDXa1nN7oM+Np0NzbutFKa+zbCrNcWd2bx3IWBJmD6WnGa9p7
 s5dA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RQ09MFAw
Subject: [Buildroot] [PATCH] package/openvpn: security bump version to 2.6.14
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

Fixes CVE-2025-2704.

Release notes:
https://sourceforge.net/p/openvpn/mailman/message/59169015/

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 3c95ff4965..432b1c2afb 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  1af10b86922bd7c99827cc0f151dfe9684337b8e5ebdb397539172841ac24a6a  openvpn-2.6.13.tar.gz
+sha256  9eb6a6618352f9e7b771a9d38ae1631b5edfeed6d40233e243e602ddf2195e7a  openvpn-2.6.14.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index e484a4e80f..ce916dba04 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.13
+OPENVPN_VERSION = 2.6.14
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
