Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD44EC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FEDA4029B;
	Sun, 14 Aug 2022 19:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FEDA4029B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJFVBlyuu-QL; Sun, 14 Aug 2022 19:15:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C890400AC;
	Sun, 14 Aug 2022 19:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C890400AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E21BC1BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAFCA409BB
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAFCA409BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrTx4EwCYHJP for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:15:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2782D4030A
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2782D4030A
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:15:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h13so6867564wrf.6
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 12:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=XbIlorjpCUoAS0Qe0xK2aemh1WlD8GMbNV4Y2vAuHOY=;
 b=hs46UPXy6LSMkyvE1nw3QVKLuaf4wzHFFoO/YtubsEuODIWUahEI/8OUazld4S5MvI
 MH9v8HZwqsAK6Y/EIxF3HNrIl2vrk4D3amV5Zv7Sg7uUSjiEjf7yak+qGagsbxCedDG5
 P5fr+KBz1aGBrEYW4DrW0UK5almpWW7x25tSvP9XtPxYgNYZaoiYG8Zw05jJQMRqi8sr
 5tjqzBEUNOWb1nlkE+WpKdf/w24YFYIUyqRZnIuoWPVDWDU9EzY3r9/vlwcEZj1D3frR
 IrnJr4ng90ypwwCY57F4hlcv58ADkPTqsHZUjmkWIU8SOUFT6UCSBU87D3KNmBwjt54b
 +U+A==
X-Gm-Message-State: ACgBeo1Yr1Sv75VeuSgtAlYqV3b/mhHvwB5PQyYdofmSwB1zOrYYRrVy
 Y1nxRonZhuOKdKWb89V+3baVurKPm2Y=
X-Google-Smtp-Source: AA6agR5OsC2amNyCBSkCtsNicp79WQk1aF5EEL5EEEHiCzI1eG8M28CE9rFzN2cbdx2nFjXMfC6Mwg==
X-Received: by 2002:a5d:6487:0:b0:221:7dcb:7cc0 with SMTP id
 o7-20020a5d6487000000b002217dcb7cc0mr6718827wri.365.1660504503102; 
 Sun, 14 Aug 2022 12:15:03 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0046aa77f88f4c2228.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:46aa:77f8:8f4c:2228])
 by smtp.gmail.com with ESMTPSA id
 t3-20020adfeb83000000b0021ee0e233d9sm5090823wrn.96.2022.08.14.12.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 12:15:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 21:14:59 +0200
Message-Id: <20220814191459.3187808-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=XbIlorjpCUoAS0Qe0xK2aemh1WlD8GMbNV4Y2vAuHOY=;
 b=hYn/TN5ePdcxMuE6AUCLjOEh8vWd8FvZ9Ec4Bsxp1p0E2lvVWdqDdnal25NIqxSZdu
 MNiI99FJM8u2wyhrOXUKkchVI8TWtFr0jcerIkCzcHnZh3/NbMXTGe3L6+bC7NWjygUE
 FC2Yu1sdiZZf8FJx031fAkxvh1MlQ4OohyWB/TxhG420NexGx+axB1hq2/zjo4Ia81pI
 YgMHi/p0kcpM9ONEZed3isW/K/wGFSR300OWyC5L6k2XWVMyXIJ7GfUo0S06qqJ4lv6t
 wtj/S/1k5hKO4k+C5soKNRXLaNXpcqjf8tIKWCz8suu+0pGFIRukXajgcYZ/ljHZL2oT
 U86w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hYn/TN5e
Subject: [Buildroot] [PATCH 1/1] package/python-service-identity: drop
 comment
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit a2ba9e7db9bd5fabff738147f73039fc8d4f1b3d forgot to drop comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-service-identity/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index 09ebd97a65..278900971e 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	bool "python-service-identity"
 	# python-pyopenssl -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	# python-pyopenssl -> python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
