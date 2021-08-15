Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4583FC4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 08:08:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0BC96103D
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 08:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0BC96103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85EC5834CB;
	Sun, 15 Aug 2021 08:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKQomasFFLyp; Sun, 15 Aug 2021 08:08:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA156834D5;
	Sun, 15 Aug 2021 08:08:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 182561BF4D7
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 08:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C20A40130
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 08:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57OvpzndYs9K for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 08:08:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8118A40129
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 08:08:07 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so12664676wms.2
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 01:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjpOFkgxDXwzrwqAu11rq+5KVOtl2Mw8AK7WQmHs990=;
 b=O+Vq9b1Pn8KmzClT25RJYm+24Riiwa2/6w7UvYZpJzL6H6f73MrBCGgKWDPtcnTTPL
 Jy52K6uQvc0tKwX9HXhlpMPaA82eV/PJh69+kano9U/1PYQlleoNqRrhJPHsvwsrYGpe
 yc4nT8le+sy50AYcdybRYhMdO26pbsJ/XsxxJoUIRdTfN06M6+H04XP+E52XA6i+IiiW
 tskTeqQw9tAmiOCPaZtEt0DhNX6QQxZrU9SE3v87297k1BfJntGCvNMQHkVPxeMFTNVX
 pC5/3ewQn44LvLd0pFVmZ4RSRklxig12OSvlcCDC3xioezyGwASbgcwZ+PFNlcH6R0T8
 jH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WjpOFkgxDXwzrwqAu11rq+5KVOtl2Mw8AK7WQmHs990=;
 b=eivxFWkxhZFmXmmkopxIWBt4OAHkKUQNAYfK79vTWrg4v5UpBXXGubkvAEUaRxvlRD
 D+RotFqnoaP+9q8tv2tCON2GoCu5f6dvogQLHEYuPjjFKmth7E2NvIE216esaS5YETJL
 fUgj06c6gHZZ/OVaYXJJneJwZqV1ge4jmwFFSo4XEvB71GjIlIFJwo5p14YwETbKZt3f
 BOSLQd0iDwXNbLu4eq+b4lfWxolj0eptoQ57LzwtNLZ6QUUuSB4TDlOCrT1qxnSghRh+
 V2AHVjOo8+04Q7TZXtTHKowh9XA/wqq5AUsGL+ZoMzFnMXUWDhyoOqeHxC6fQzvkivIM
 z5Cw==
X-Gm-Message-State: AOAM532yBVyVN9UdevI5CpFY+svKSHjOCooo3BBfbYQz/G4aKrobJmCS
 /xxf+3BQP/IXnj5PREe9RkWaAxfYN34ZnA==
X-Google-Smtp-Source: ABdhPJxHRADLNr88ngJfApbRGUYX8VScQZc28FZG66N94iNA7/Lkt1vVJpd1Hxn2VWh1vPYNvb6U+w==
X-Received: by 2002:a1c:f606:: with SMTP id w6mr2363270wmc.42.1629014886042;
 Sun, 15 Aug 2021 01:08:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id k1sm7333905wrz.61.2021.08.15.01.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 01:08:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 10:06:48 +0200
Message-Id: <20210815080648.536733-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-matplotlib: merge dependency
 comments
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-matplotlib/Config.in | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index e7e2804b4f..afc090856f 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -34,8 +34,6 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
 
 endif
 
-comment "python-matplotlib needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
-comment "python-matplotlib needs glibc or musl"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+comment "python-matplotlib needs a glibc or musl toolchain w/ C++"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
+		!BR2_INSTALL_LIBSTDCPP
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
