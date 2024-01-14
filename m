Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADD5C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 10:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DFD5408D9;
	Sun, 14 Jan 2024 10:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DFD5408D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X0VvERCNfNIU; Sun, 14 Jan 2024 10:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B805C40187;
	Sun, 14 Jan 2024 10:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B805C40187
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 404851BF2E4
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 10:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D99340187
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 10:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D99340187
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zIFhZMqDw8k for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 10:14:09 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B66A440159
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 10:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B66A440159
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso7047665e9.3
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 02:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705227245; x=1705832045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pu+xbI5E/OA/a134D12Nx6Cr7Vfg5Z6CF4/3puzQdsU=;
 b=g6OAXe5s8xX+ZQ5qS8vELq++FbOxatgnk6qGoJU68wEhCEgqhsG7a1M1zY2ZQtCXOJ
 lfBypMEPaR7rVlBwRU4Pas0V/tIwCral043ksYYllD6VIrOKEC8GXl3gxswk8LRd+n1j
 IK3rJFrIpJNjecFVt+avF+s+HFRe55Idq3p0eR8eUrZvCoqjFYC7PVwev9nSbD8p2MNj
 HE0s0hu1RfLJgmFuo6pa2ytrXfSG73pZDuFE0lkR1uMdhIkpv34U4Ozc3A5zBXP7lFmL
 VZNJ26zSudeVpQcoyCav2Ueoo3h88gka4Bey5j2tx5u0ccxYgjOau3v2mRS6DXOf3VgV
 j4pg==
X-Gm-Message-State: AOJu0YzzxEZhmX85YpJ/rs2yrRcev8dLMdb1jsrj/R5wseNkLKokV0Xd
 WBfqQMIuV0e+4lz1okyR+Fx57UCwCYo=
X-Google-Smtp-Source: AGHT+IGlxoRPB06gI7LBcmm6v9sAuhyJko09m8eGFVC8O3ndUE0en4taS0Cf3bGzY5pX9DAJ7fPZ7A==
X-Received: by 2002:a05:600c:230c:b0:40e:624a:87cd with SMTP id
 12-20020a05600c230c00b0040e624a87cdmr1468735wmo.206.1705227245289; 
 Sun, 14 Jan 2024 02:14:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05600c1d2700b0040e50d82af5sm12092329wms.32.2024.01.14.02.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 02:14:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 11:14:02 +0100
Message-ID: <20240114101402.5633-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705227245; x=1705832045; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pu+xbI5E/OA/a134D12Nx6Cr7Vfg5Z6CF4/3puzQdsU=;
 b=AiPA9arPUum2RtXAWvKXMH6X7vDpY8r68tj1DkiosQlEITtYVItIQwCJOqVWbPDLT3
 VKAeHNnlpsq62Nk8e3rBMk6u4RNHigzZp18z3oi5g4CZyMiXxXWBbhN8rmqagaKTn545
 lVE1VFYDhqgO+BOIuAVmc5yj4vx9dZiTo9kUpJrSH3BE978FudOpWkVD/mjq+HmlLKzE
 AdwVSVm+yGYVY3Ta0Yz5W0D6TeNJffZD6DCcY+BUwyE5hic26y/Be1xxulEzNFRoj++6
 qSWg9V2NIlcPHILFkMpjTb3qPo8b9tiFkRVDnhX8khkJR3XdTO8nVCTfbwkw1MrRM+94
 fSqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AiPA9arP
Subject: [Buildroot] [PATCH 1/1] package/libkcapi: fix legal info
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
Cc: Tan En De <ende.tan@starfivetech.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit e6af32c08c8d47a71d6f8fa48439f3d87dcef2f6 forgot to update hash of
COPYING (update in year:
https://github.com/smuellerDD/libkcapi/commit/fc937358e71253a6efaa3ba74885364976b040ea)

Fixes:
 - http://autobuild.buildroot.org/results/823c89ed3ac3f12e64a22bd88e193a5be28c34e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkcapi/libkcapi.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index 691ef0977a..172b6cbcc7 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
 sha256  15b550c14165a266fa233b485d029d54508da593dfa6d1731ec5d5a285c716e9  libkcapi-1.5.0.tar.xz
-sha256  9765fad61726afb2b253db2c68153672e4178d6809667ae98141f3e90fe8645b  COPYING
+sha256  00e0a844d67b190580a9dc5943e555a3d0b2158e21d01a25526762c619979326  COPYING
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING.gplv2
 sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.bsd
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
