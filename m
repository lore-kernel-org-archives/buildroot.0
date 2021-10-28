Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582D3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 16:16:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1D96058D
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 16:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA1D96058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94D1D40626;
	Thu, 28 Oct 2021 16:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTJZBHleFV4c; Thu, 28 Oct 2021 16:16:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04C0340602;
	Thu, 28 Oct 2021 16:16:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 892A81BF2B7
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 16:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 795F7826C7
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 16:16:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBhGkJwaoD4F for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 16:16:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FD6B82656
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 16:16:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id b71so5541985wmd.0
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 09:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=exrAUgIn7HFO8N9WOetN4hBONGZPXFZyqnbNd/h4K88=;
 b=MZpPrjBgw5FIHvuV+/U83k5+l4HyvTyl60LRtjb5e6+4DBI4XCiIuXvF6+HNf8n2U2
 gYQMCzVrzm3Gfg5Zj9vRTRwXvz8k0FS3HxYpnWP/ZzbgGSu0C+aCYPVW1+2jkevJ6qWb
 LQ/Hxp+HsvEcOUGpZpPvp7Jyqm9GBV22gq9VBls4/Kq+WF1Baytvfon2wVi4hW6R6uYV
 fjNnxRqumKp3Gnofy4/gWxhb2MbB6MlE1YBVGBAobo92lwBKb/imdhOIbb6aRBu3IBFn
 jbL/YoCmUzTh53GlPJ/wsCpBu5Fu/eAyN1qH8XilCmCpyga+9TwCVlJYPPLT4ZYt0N5n
 lcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=exrAUgIn7HFO8N9WOetN4hBONGZPXFZyqnbNd/h4K88=;
 b=GNz7Fspxwwd8o4IO54xB0Wz96K4crHMbr+56GMm3rXizL+IhjYqv7T/1jpfmYIuGq9
 +/L1D1tTibNL2W8I7YDOlGt4i5IZb96BjM1yAVRf9JYPwkTjwhozwJDzD11Ob2UPXsb+
 SZNbleqTdK5EbjFgey7V/xXeQCTRE5Q02mbwdtXRbrlOh3qQMcePMLzeQiXNyeAeSXus
 YETE+alQk+Xixa5gMFpp76fmuMG/1hv+pKSqiy9b/J2TS64oI8LlagZVIxLgjIHzDfpi
 a+QakoXGlQ8zuBjRKtJaT8Qfal0Azm6xJetC3GjXSRXBPugvGP1JLaKtupuVYmVM5m9S
 WFxg==
X-Gm-Message-State: AOAM530JtD7KEvvfS6jCxSO1ZGIzQEnueDetc1KcFta4G+maouhatd2g
 GIZvjOaIeY2XTcZmVlWS+Cwt5eRm/jY=
X-Google-Smtp-Source: ABdhPJzG6ysS0SF+6VTYG4X6pgrQ/4Wv7IyOPVGNkZCLXQZEGjXI3em8nvnGzB+Wh3qzoFiOa144RA==
X-Received: by 2002:a1c:2541:: with SMTP id l62mr13563973wml.11.1635437761315; 
 Thu, 28 Oct 2021 09:16:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id i24sm3074742wml.26.2021.10.28.09.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:16:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Oct 2021 18:14:24 +0200
Message-Id: <20211028161424.1123708-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-watchdog: needs python3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python3 is needed to avoid the following build failure since bump to
version 2.1.6 in commit a1f7597b4dcd60e8373040739d7abbc0f45dd5f5 and
https://github.com/gorakhargosh/watchdog/commit/86b983aa5f7bf2a65314b5dfb7ff8c1b930c10c4:

Traceback (most recent call last):
  File "setup.py", line 18, in <module>
    import importlib.util
ImportError: No module named util

Fixes:
 - http://autobuild.buildroot.org/results/9d4/9d4abcb029f4e44a9cb454faa8416d8ebccb5b2e/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-watchdog/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-watchdog/Config.in b/package/python-watchdog/Config.in
index 18f569ee44..6f0dd62073 100644
--- a/package/python-watchdog/Config.in
+++ b/package/python-watchdog/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WATCHDOG
 	bool "python-watchdog"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_ARGH # runtime
 	select BR2_PACKAGE_PYTHON_PATHTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_PYYAML # runtime
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
