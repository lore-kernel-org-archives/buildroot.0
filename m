Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFD9C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 08:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39C4060A46;
	Wed, 28 Dec 2022 08:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39C4060A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69nYtIOx8_jy; Wed, 28 Dec 2022 08:39:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F0EE60709;
	Wed, 28 Dec 2022 08:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F0EE60709
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 461641BF316
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 08:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 201FF408BB
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 08:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201FF408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8udYdiHAr0E for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 08:39:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B76640243
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B76640243
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 08:39:24 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id co23so14346848wrb.4
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 00:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PAkv9M27ROUo/0vmTBDOLgAoGBLB5UnLMTzS0h7PCeg=;
 b=eDBpw/PV7Bt2pudnHslTB5R+L5dySlmtf6Sfx2vr1Wpt/gj4zNjq3bV73hEJAUq/rp
 VoeCdoHi2gbh3unJdEMzXVt0vCoV9O0chghX+D5sIPaEXvnpLdT1zfeEqpQcSOf+/Vr5
 3C4Y0ArXdjNli65K0/LayDu2dOW/FM0zUzgTNrMArnm7/qAEuRdutDFOZrjiZ14SYULJ
 E2WLE4vYYFYHqXXEUlrHIOa1eD8Ww/FihQQ2CaDFhjEOegp93ShJg54dV+JguZDtDqxM
 viJhTDh7ip6ick/CLhHEWa5pse5MPCwtLZPH8smL8o43NVB1DLCgBw34Z/O6cbjqHUVH
 ME5Q==
X-Gm-Message-State: AFqh2kpDFlgbh3OmYtfSORGJo01/xDw4gyXH3K+3SZfH8I7gw2stzgNp
 rrrFkCWRtZfJtWN4AHi/fOkITValHiQ=
X-Google-Smtp-Source: AMrXdXvfS1K3wWzXSsHR6sEu6Rd5nUcX/cTxOD0rGBU5C5G7wZnlsI5oWgPT9SklOZaM/kTfH5AUEw==
X-Received: by 2002:a05:6000:18a6:b0:280:4a9:c8dd with SMTP id
 b6-20020a05600018a600b0028004a9c8ddmr7807493wri.18.1672216761858; 
 Wed, 28 Dec 2022 00:39:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o15-20020adfe80f000000b0028965dc7c6bsm5565wrm.73.2022.12.28.00.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 00:39:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 09:39:18 +0100
Message-Id: <20221228083918.3762-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PAkv9M27ROUo/0vmTBDOLgAoGBLB5UnLMTzS0h7PCeg=;
 b=XF7TlMxExd5FAMzqx6/CXWR8TMI6nwr64Nou+Glk7uWTwKnYvTseVXMindN7QMlAl+
 QlSfbz2yKXX06Uwi/n4lqYvjI05D6F+mr3O2/i6vEri4JtzmqubCgFmhTlNl8STNwTmV
 4Cczd5bQLPJtKKrLPqkoeUlVB8Smu4lu9QPu9r0TSMbVvL22RedKw7ft2IqkiV2GeR6o
 btXC7pK+dIxUmJL4MPGzwZ0aceK+/xOJt+uYYaVeeulgPjpsRSwlyI4vfx0dMKAt0DcR
 Fbh9WyeuJwnzoeYa+bxoKkow9Gy+03XwoPzsCxxiccK/BmsruNKOVATkdhSddJ4C1LHV
 iggg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XF7TlMxE
Subject: [Buildroot] [PATCH v2,1/1] DEVELOPERS: drop ucl
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 85c5af46ad6c18841576c0f7abe241a617a44cb7 forgot to drop ucl from
DEVELOPERS file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Fix typo: upx -> ucl

 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 277f0043e1..65014a9926 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1093,7 +1093,6 @@ F:	package/libsodium/
 F:	package/php-amqp/
 F:	package/python-cherrypy/
 F:	package/sane-backends/
-F:	package/ucl/
 F:	package/upx/
 F:	package/zxing-cpp/
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
