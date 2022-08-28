Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AFEC0502A
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 15:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEE61408B8;
	Sun, 28 Aug 2022 15:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEE61408B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jfR9uh6ITX1h; Sun, 28 Aug 2022 15:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 039A240B9C;
	Sun, 28 Aug 2022 15:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 039A240B9C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39DAA1BF97C
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 15:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11214408A8
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 15:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11214408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLMn-rRlg39y for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 15:53:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3F99401A0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3F99401A0
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 15:53:14 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m5so8160333lfj.4
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 08:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Fk5j+ZXwNi2/ztfW9G2hKt+22fAP+gkB1mHkxyPdIZg=;
 b=uKvOjtGWScreWOou9LLwJ1FbDO2T0w1nsVtrHpW+hc4rAex9ZWs3nq56MFIsA1O2jj
 CBAdROk90M29Mnh9gyf+JlZsAggfDCTxufVYtpPXVgGbjnEoDL+dK42gfkNDJcT97aXT
 /WMbuU0bb69gd/v0PnPn+mogktr+DtPdhERdybUsHQaERjVbuufEAjeFIsJGL8gL+7fH
 R+9nEr0AzydYFFUCowJweoTV9Q9s3Pbh8yEHXUFtuh3qUIuU8sNepVc/s3YXqUB0gn+c
 bL6tlfx+xlkgPG3BfplxMdYqlYnq81X/1PRSrf2GWqcdiG5TuiGK0T122coDqu1/4iA1
 6D6g==
X-Gm-Message-State: ACgBeo0h3Q8djzE81p7L8jsa1OVPJWiBL06uiNjzeTxYKTE5IXeHsKYU
 IlfkfZLWHZypN1P3vhOfBEkqXHmbEUoVLA==
X-Google-Smtp-Source: AA6agR5T9mIpg9p1yfFYegtq/0yxLkBwRrC+M/Nz60eNdjLY8WIzvTawurvhH7SwBM9zfzcmMHp17g==
X-Received: by 2002:a05:6512:31ca:b0:48b:c4c2:d6d4 with SMTP id
 j10-20020a05651231ca00b0048bc4c2d6d4mr4882901lfe.423.1661701992641; 
 Sun, 28 Aug 2022 08:53:12 -0700 (PDT)
Received: from trainer-arch.doty.ru ([2a02:2168:8c12:1d00:325a:3aff:fe53:1b3f])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056512358500b00492cd4bd383sm979813lfr.223.2022.08.28.08.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 08:53:12 -0700 (PDT)
From: Dmitry Ilyin <dima@doty.ru>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 18:53:03 +0300
Message-Id: <20220828155304.4398-1-dima@doty.ru>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <CAF_pguJgm7y+zZ3apxL5p+njipC7vmT8X8x4XwM_w8G_inNrvQ@mail.gmail.com>
References: <CAF_pguJgm7y+zZ3apxL5p+njipC7vmT8X8x4XwM_w8G_inNrvQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=doty-ru.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Fk5j+ZXwNi2/ztfW9G2hKt+22fAP+gkB1mHkxyPdIZg=;
 b=y6QuNuVgu2KcaxgWqSmrGN11zHIxrIjNBc7g4/hHIbxfhWimXSpT17vf8y/Gv/O/SG
 Pvwm22sS3yApZ7XUNrfKLyesPfIzY4Zklo+/rHZtFQVky4oDXdZHk0E7omkg98XWkMBP
 NdOKmElz4tWv/H1h142f5CIeC58r/ybryg7UvLIhhNSivGf4uX6pSg4EJN9fbZX7kG+Y
 fmxhHxpQHGI51keZYxk7ZuDAglmG8Vp7eTCPcsqbXfXDDar9uL6UTf8kt2qAjuFzcy3W
 EwbuVKq0nigt6qV8ALBEn95D17dYA23i5ZDTEX5/Jyg0ppwtzZz3gdVBO4NCtsuzax+8
 ZAAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=doty-ru.20210112.gappssmtp.com
 header.i=@doty-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=y6QuNuVg
Subject: [Buildroot] [PATCH] package/mbedtls: add configurable SRTP support
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
Cc: Dmitry Ilyin <dima@doty.ru>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds new BR2_PACKAGE_MBEDTLS_SRTP_SUPPORT option to have MbedTLS
builds that support SRTP (required option for AWS WebRTC library)

Signed-off-by: Dmitry Ilyin <dima@doty.ru>
---
 package/mbedtls/Config.in  | 6 ++++++
 package/mbedtls/mbedtls.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
index a39ba65d98..f06a27fc5c 100644
--- a/package/mbedtls/Config.in
+++ b/package/mbedtls/Config.in
@@ -29,4 +29,10 @@ config BR2_PACKAGE_MBEDTLS_COMPRESSION
 	  sure CRIME and similar attacks are not applicable to your
 	  particular situation.
 
+config BR2_PACKAGE_MBEDTLS_SRTP
+	bool "enable SRTP support"
+	help
+	  Enable support for negotiation of DTLS-SRTP (RFC 5764)
+	  through the use_srtp extension.
+
 endif
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index af87d62b30..9f9aee1fec 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -72,4 +72,12 @@ else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
 MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_DISABLE_ASM
 endif
 
+ifeq ($(BR2_PACKAGE_MBEDTLS_SRTP_SUPPORT),y)
+define MBEDTLS_ENABLE_SRTP
+	$(SED) "s://#define MBEDTLS_SSL_DTLS_SRTP:#define MBEDTLS_SSL_DTLS_SRTP:" \
+		$(@D)/include/mbedtls/config.h
+endef
+MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_SRTP
+endif
+
 $(eval $(cmake-package))
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
