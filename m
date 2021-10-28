Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208CDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 16:27:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F7946023B
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 16:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F7946023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F1A826FB;
	Thu, 28 Oct 2021 16:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGRL25sB0YHu; Thu, 28 Oct 2021 16:27:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6EAA826D5;
	Thu, 28 Oct 2021 16:27:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EE841BF2B7
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 16:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DBB1405C9
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 16:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YH4NQU9EV4sc for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 16:27:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CBD74040D
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 16:27:12 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id v127so6312349wme.5
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 09:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IB1GZ93AqHRnClj59lYsWVPZTXyBMVMzvSo1EsT7Hpw=;
 b=A2IZYdpX0T7mZ9sGYTTICvjU5YgLZepA+yk42TK4HQuO9dIO7xfTbo+bwdju4p7719
 HZlhbQPihimyEAwYVrfxSkxD6A7ZoL87YJ4mQO8GTotmmo9K87iUQcPCkgkR+k8DJuBc
 QgeMTY3Fo+04FCDF3/gi6a/oLTYVEF/FLRfZHiPgjOskVTyjK7gHkzigUL0VEF4JXpfN
 Zg84EV+X4SMOoYA4VRa8NQf0mtfmfHmqnjGWBCsqcYHsH0CUzhzfIhNebGs5UoFZ/K+y
 YuE4IJbMckarF4nDJ3t5p7nOyKRGIpGVE/Cyj9dbpYoyEhj28VZPbNmJubraMlzIPbwu
 rNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IB1GZ93AqHRnClj59lYsWVPZTXyBMVMzvSo1EsT7Hpw=;
 b=s1e6b3F78/whMvZTtvOOOZKmxP9u59rHqNJnaLQ1lGvi9x8CDdNIg5MCR9ZDNKpF32
 sCzBv56mf26ka0sMeBYJ2Ou/Ad+sOjZWypYJs7CGaq88ShZmAkoHeHDC3PxBVdZ0VNJm
 yvQ/RxKl2elBIzI+vZ+mGOJlNis+CtDmTy40FyZC1ls7XrosfZUa3n3uVDOHnH3ZDOTQ
 8yfIA4vLw0e3by/4/bdTX5+6ArrvhIgK9pntOsQNQDs21C7yjb6lwL97gbnlkFOnKVHH
 4w1d1IUZg56WCaR35jJufTSAtkHxrs6sTrxwoBx/BAPScQ2V6SwC0O8Im3a/a9SKRDSk
 xzKA==
X-Gm-Message-State: AOAM533qryyG40Pj2ET6zLVWai2rE2ijfkgGFDDagOEnuPFpvJs+Qliu
 9p7DwXGjy4PhXg1cfjzHBuPqNU/ICFg=
X-Google-Smtp-Source: ABdhPJzn2kFTWSkBiA9oXN7LCx3UUrEqWpwHkzsjtMtMaKmBAFrk0CYho2ikoTIxTTCSwEPK7Yn6Vg==
X-Received: by 2002:a05:600c:4e88:: with SMTP id
 f8mr13649190wmq.185.1635438430610; 
 Thu, 28 Oct 2021 09:27:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id q1sm2963685wmj.20.2021.10.28.09.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:27:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Oct 2021 18:25:32 +0200
Message-Id: <20211028162532.1124296-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ujson: needs python3
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python 2 support has been dropped since version 3.0.0 and
https://github.com/ultrajson/ultrajson/commit/0673d237cf5589a2a059771f694d5fbc5a293b13
resulting in the following build failure since bump to version 4.1.0 in
commit a47f332a20bf3f79ef4903c8ddd2b7917217e354:

./python/ujson.c:79:15: error: variable 'moduledef' has initializer but incomplete type
   79 | static struct PyModuleDef moduledef = {
      |               ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/61cc675281ba25d6ebee4892175e9c7222aabb79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-ujson/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-ujson/Config.in b/package/python-ujson/Config.in
index d185c98532..aee1d75fce 100644
--- a/package/python-ujson/Config.in
+++ b/package/python-ujson/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_UJSON
 	bool "python-ujson"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  UltraJSON is an ultra fast JSON encoder and decoder written
-	  in pure C with bindings for Python 2.5+ and 3.
+	  in pure C with bindings for Python 3.
 
 	  https://pypi.python.org/pypi/ujson
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
