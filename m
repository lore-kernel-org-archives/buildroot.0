Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5855BC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0779140102;
	Thu, 29 Dec 2022 09:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0779140102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xq5a3ys-vZNk; Thu, 29 Dec 2022 09:31:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3180140597;
	Thu, 29 Dec 2022 09:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3180140597
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC9E1BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07A8280DC5
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07A8280DC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JP1fnYn55QL1 for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:30:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DF6D80DD1
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DF6D80DD1
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:30:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso2616510wmq.1
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 01:30:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lFftVb9omcPQwzJplw9Ji8z2XYpRSJ3gAZsrRE3/3i8=;
 b=70xO07DO2pRNpKnZwUVpcW4dfWrPeud4+hlwcwr3LqQ9iZ98Zj3qwn3M2PlkGSbirE
 N7FtsFYfnOStwihNCowLerOPlBmmL/cUKdKhqF2op9oh8mmA7jEUkC5iCXDerTUkXcxC
 udFUgJ7m2xbzJqrVKsrqyb+Yqqb/ogBEYwaGJEBo3O6hC/a6bkAV4TMzb+DCapbV0jLR
 QDIlqn8L0MzSS7MFkRn/F3uNhojb6piSdo4uvnste956ffFgh7ZmHOhyYNzMvDPLqMwZ
 4zNlWpMYVWgRdR8uJbcQ0WOVRm5G8Afcwvl8D8kXSyPZC79t9VijFRlpnuqm3P+CIVEU
 HXgg==
X-Gm-Message-State: AFqh2kq4EAUhdbWNf+Jljx7xkTTHyb35m7jzglBJOc2Ij4OvUgNvLPeH
 Ru7Q1fd6a/6JpBTtD1sHSIp3aOMkESg=
X-Google-Smtp-Source: AMrXdXufT1TJ3RrjZIcDjabCBye4lmnyqMVCHWBEG1FRo/rLAtMVBbdIrxWfpUeTzEGBPT3cFoozhA==
X-Received: by 2002:a05:600c:42d4:b0:3d0:6d39:c62e with SMTP id
 j20-20020a05600c42d400b003d06d39c62emr19907696wme.12.1672306238546; 
 Thu, 29 Dec 2022 01:30:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003cf75213bb9sm33101739wmq.8.2022.12.29.01.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 01:30:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:30:29 +0100
Message-Id: <20221229093029.264681-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221229093029.264681-1-fontaine.fabrice@gmail.com>
References: <20221229093029.264681-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lFftVb9omcPQwzJplw9Ji8z2XYpRSJ3gAZsrRE3/3i8=;
 b=CwJwu7sxIH0SgGsZCIqqFPDMErznOooOXpDak+6owiGzNcceMfgAHXbSCEswaFMFGg
 6Z673KcHpXE0Tgu/524Fs1oKbMKg8gagv27L0SQu/d2yvUQLsv5Ea/S6TGBVGTZcYsEJ
 WbvyV/w4WPaCe5s9fmxr83fyLXkCiyMz5zaGpOErfe+qkXucGZjW56SGLVkBOhlez2qR
 Lu/B3hYizow8rVsnck1kWsEj+fO76SoX+VxGrcj0EcuTEHH/mO/Id/S4IfloCdMjGExA
 Ekn0JwH6ZqRw4LHCHDp8CZ/9ggaNCddD2uP4WEjtc/ljnXS3n3zzsAq9nBRXDiHfAxBM
 Ahsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CwJwu7sx
Subject: [Buildroot] [PATCH 3/3] package/tiff: add C++ support
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tiff/tiff.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 6d761ad678..c2a4108f35 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -14,7 +14,6 @@ TIFF_INSTALL_STAGING = YES
 
 TIFF_CONF_OPTS = \
 	--disable-contrib \
-	--disable-cxx \
 	--disable-tests \
 	--without-x
 
@@ -29,6 +28,12 @@ HOST_TIFF_CONF_OPTS = \
 	--disable-tests
 HOST_TIFF_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+TIFF_CONF_OPTS += --enable-cxx
+else
+TIFF_CONF_OPTS += --disable-cxx
+endif
+
 ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
 TIFF_CONF_OPTS += --disable-ccitt
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
