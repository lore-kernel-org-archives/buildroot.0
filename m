Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663C0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 11:45:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D79DA6108E
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 11:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D79DA6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 723ED405D9;
	Sat, 13 Nov 2021 11:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hUGqRCOpRqj; Sat, 13 Nov 2021 11:45:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C910540441;
	Sat, 13 Nov 2021 11:45:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FBCB1BF358
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 11:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 385B940136
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 11:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7z5JprKd5Ccc for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 11:45:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C72484000B
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 11:45:14 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id c32so29203189lfv.4
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 03:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=Y7GTzv0Tn/0bLS1wOwb0+Bakz0k5znHxCwRb5Cahc70=;
 b=ojs1Po+W2A6pk6tQ5q6FUh1utio60C4BUftBaw+Vvmdsjjqe+jFcNMdqnUmkHXX00B
 pns96f9tCmMIFDRocPaUY8/ozDyGQ7JK81H5mot2gbbGJtPTH0RL0FMO8E1lMkwRb0VC
 5OOWAG76j2GO86cexgLQjnUIFP4xBymBTSYy1Xwboub1lTRtk6OLT+Y7yRR8SQOqSvEa
 WKwpHDaFHPvxGD4w5T1VNbtzGnKFnD12s0JGIl5BoSeXOR9A8R1RVcH2ZxNOdJrwQ6/j
 Dc1CA0vlGibnr9RbUHh5MSn6USFuhHt+pp0LOeOz4YprY1Z9KFVrkzc1WpywRJxH3gu1
 sbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=Y7GTzv0Tn/0bLS1wOwb0+Bakz0k5znHxCwRb5Cahc70=;
 b=CkNXr6koKpeaTfNcZl9VtbIK3940D3y2hGDliZBGkZUm/08QqZvQAxbHCiaVjhaEhz
 pfjJs5UYZi1bhUNWFexl9Y/UILB+zzMod1Qmc3g3g0o9z22hs0QQmOD7gxfq/xU2sSUW
 1Or3KzEEvUteSQxX/WN91uIMjpuImPH5q8QWhk8OyodiI/7Eh/Lxgs7kfFitq2gfcziQ
 lo9Oaotco8qU47EKlAQI7UJL3yx/mJgn6KYdW6/TR2VlTmF4aKc5ftqT/gKFh8htd3rx
 L5K9ulvPyTnl4d5aBs0omjM+gJjFg+BX2kCWurKxqm8V9Yh5yZSYBUnY1eSKtSpkJWVp
 7VwQ==
X-Gm-Message-State: AOAM533mzVcLqylTsaS0P9a00jjiDYkdSnlxM7LnYZAOfI9sIgnMpRJA
 wk7te/omXpNEmOT5ZLwABDwxJvufBWA=
X-Google-Smtp-Source: ABdhPJyLL8ohnd03QcJVYp9PmjCYb0n9zJsN3cybTePC/FIs8hbSlOifzGFeZMysowLUkreoK4L2ug==
X-Received: by 2002:a05:6512:118c:: with SMTP id
 g12mr21579890lfr.449.1636803912516; 
 Sat, 13 Nov 2021 03:45:12 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.87])
 by smtp.gmail.com with ESMTPSA id u23sm848136lfo.35.2021.11.13.03.45.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Nov 2021 03:45:12 -0800 (PST)
To: buildroot@buildroot.org
From: =?UTF-8?B?0JrRg9C30YzQvNC40L3QvtCyINCh0LXRgNCz0LXQuQ==?=
 <kuzminov.sergey81@gmail.com>
Message-ID: <6fd05f97-7fb9-96d8-cca0-5063be8ad620@gmail.com>
Date: Sat, 13 Nov 2021 14:45:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------74EF02C6093E2079D2C08374"
Content-Language: ru-RU
Subject: [Buildroot] Disable qt5declarative dependency on GUI
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------74EF02C6093E2079D2C08374
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello. My English is poor. You need to remove the "select 
BR2_PACKAGE_QT5BASE_GUI" dependency from the 
package/qt5/qt5declarative/Config.in file.

This is needed to build Qt console applications without a GUI. The 
qt5declarative library is needed as a replacement for the outdated 
qt5script.

Some aspects of qt5declarative are not GUI related: 
https://doc.qt.io/qt-5/qjsengine.html

A simple example:

QJSEngine myEngine;
QJSValue three = myEngine.evaluate("1 + 2");

Thanks a lot!

--------------74EF02C6093E2079D2C08374
Content-Type: text/x-patch; charset=UTF-8;
 name="disable-qt5declarative-dependency-on-GUI.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="disable-qt5declarative-dependency-on-GUI.patch"

diff -u -r -N a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
--- a/package/qt5/qt5declarative/Config.in	2021-11-10 15:17:38.000000000 +0300
+++ b/package/qt5/qt5declarative/Config.in	2021-11-13 14:36:45.631113368 +0300
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QT5DECLARATIVE
 	bool "qt5declarative"
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.

--------------74EF02C6093E2079D2C08374
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------74EF02C6093E2079D2C08374--
