Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27FFC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 13:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09D6140549;
	Sun,  4 Feb 2024 13:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09D6140549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0eKhNgOSxPhI; Sun,  4 Feb 2024 13:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15FD84052B;
	Sun,  4 Feb 2024 13:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15FD84052B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1411BF48C
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 13:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75F64850F7
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 13:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75F64850F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KPWpR9SfsChX for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 13:36:12 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03B12850F2
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 13:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03B12850F2
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40fd55c7f93so5501205e9.1
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 05:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707053769; x=1707658569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UE5rLONiTKsQPGHufT2Bwpdu/i5ySl0IlxhpzCDD1qU=;
 b=iL5M2Wg0lnNiaDM4dVPH/7SQIoz3Ylwbg127TZ/ydYGwQCWFqjRiqwtE8QSFS5Ypyk
 FbkEcKsDp0Ydei28oqwcw0V8bhSNRf2d6eprqBLThPm8WYyCeKdLH4LuCUzQWOlG8BvX
 KhNIuA0q3SUX7raXMPNgfA6e+IqxSnYnd1Dvzo0ONZyDv+K5FwuqmlTzvme96xrXh3fM
 CnqC6I7WdJKKebDLFTCim6sIgxgvub0lfFjTaRcdcIfiWJoV10tMgMPwmpor1w39E6dN
 cX34w7X/SiZby6fN3iR2qnUMyd5M1clI6KejlLPMFvLeFsXbHLcVT5qSwDAazUUjPA3E
 KliQ==
X-Gm-Message-State: AOJu0YxfQ5u75kzh348vvVbyjQ6EuWqSf7y0OsSZZxHjh+CUZALY0MRO
 4nMFPv6kX7+K2Mpy7gohbWWDyqE4dlgFHaDCkWpyjFbbRb7vMd5CypYn5dKIWgc=
X-Google-Smtp-Source: AGHT+IGu8cW6K+5UNKecujVVg93HeuU2Rnrxkn4qzvh3YMO0MB5zsLx0nG5lt6PMnX1gJJXH5X7v9A==
X-Received: by 2002:a05:600c:2159:b0:40e:fb4c:c1a4 with SMTP id
 v25-20020a05600c215900b0040efb4cc1a4mr3410279wml.21.1707053769050; 
 Sun, 04 Feb 2024 05:36:09 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUc/nLd7cz/lHRrEIGr54oPlqZwKZHmVSPDcgc5ydtCCYbnUPz/g3P8PvRrFabi8dAU4nOw1kmTqyom9dxwey81xV7Zv1EjmE3eL8MMR/TzzHMEgxNgtG7I+B1jadRNR7UUjWvaSD+NROecIA2Casf2maPJwNiwkSXJ8U9A2QCnbgQ=
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b0040d8ff79fd8sm5750125wmq.7.2024.02.04.05.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 05:36:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 14:35:55 +0100
Message-ID: <20240204133557.1512951-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707053769; x=1707658569; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UE5rLONiTKsQPGHufT2Bwpdu/i5ySl0IlxhpzCDD1qU=;
 b=TsEfm3CagcWWPh81AYZPyDS22q/Rw5IjWTYT1hpzD5ftEmXq4+TDzymxEuYf28UiGh
 /95Jc8EksKrac8XpjmjdVzpkFWL0ikwWlNhymr9MBYrJirF3dfAgLdMluqnlrdK+lxyb
 JtF/CrJbYjaRixJ//udXV4C3R1IneWkGXIm6J1mwnqJtI41PM9zH9D52URAzQ7xD2yoF
 9eSJoeN3sl/O+NXYWxdmA6Pw0/1W0kZgnquGofBiyA0lh0n8D7e0X+oFEaslP3V0UuPn
 c6/cuw476Spqk8OA1S1fJ7/iuLKlc4PRtqsF4zNEwCIPTksBgZwtSDenGq8DwvfRQdUM
 9zZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TsEfm3Ca
Subject: [Buildroot] [PATCH 1/3] package/containerd: drop
 CONTAINERD_CPE_ID_VENDOR
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Christian Stewart <christian@aperture.us>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 35af2bb8011ea57642777acf5613afa244d325d7 set
CONTAINERD_CPE_ID_PRODUCT to containerd but this is not needed as
CONTAINERD_CPE_ID_PRODUCT will be set to the package name
(i.e. containerd) by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/containerd/containerd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 61a8472ddd..d3ca102797 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -9,7 +9,6 @@ CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
 CONTAINERD_CPE_ID_VENDOR = linuxfoundation
-CONTAINERD_CPE_ID_PRODUCT = containerd
 
 CONTAINERD_GOMOD = github.com/containerd/containerd
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
