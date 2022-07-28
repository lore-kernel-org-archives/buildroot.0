Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D985FC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 01:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41F5760EE6;
	Thu, 28 Jul 2022 01:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41F5760EE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQSsfX2vucSV; Thu, 28 Jul 2022 01:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EC6A60EDE;
	Thu, 28 Jul 2022 01:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EC6A60EDE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2131BF393
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 01:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76E4F41795
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 01:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76E4F41795
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4O04OeMIQVA for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 01:44:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DB0941774
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DB0941774
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 01:44:13 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id c185so440662iof.7
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 18:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+oseH7SqcdgFzmTbXgljM5GM/43G5Q6mRDj6crKslJg=;
 b=LQaYECJ3EdX6naxsFmvLS8Hf+VWwH6OQ9gO5LYECfgEwOIZQsbbT1Bgs2KTQmgdeGy
 UIQabNq5blcUuiaPbME2kVUBIGbPU8s1rLM4f/pE6X8473rTZThSJlG8iRhHFWL7CJ41
 6WmyIw+gAHSdionr/PuxqaTrDP0XUMZd7OQYP9mXbivlMbsbFgslj+CKK3JNcQXRxW/d
 XGousekh6BLrzwb4tn7JY/QmTgSODk3jh7ojXpC2BvuP4f7yWlXkC5oQ6PWgywx3k8D3
 sRNVxBqZZxowbZ/ZEQIhv5WnUdiXA98bf0h1n1XNQX2mnGsm6DOYrB4D6N6/uLEtGETi
 rK4g==
X-Gm-Message-State: AJIora8mTBx0AmarCHR70mKhP3X5jHv25CwN6zGEfpj6caXtm8WI2SDW
 7TXgS+3KOXaJEsTHtYXrncWQNV4kNdpP6w==
X-Google-Smtp-Source: AGRyM1tF9cUYLhBd5Pix5RmHUM5r2V8gJAo666dMD2UhcNkQZ4aSrw6m3p6daPwKznD8VhPtshuZ6A==
X-Received: by 2002:a05:6638:1a13:b0:33f:1f32:6248 with SMTP id
 cd19-20020a0566381a1300b0033f1f326248mr9815563jab.53.1658972652433; 
 Wed, 27 Jul 2022 18:44:12 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 i2-20020a6bb802000000b0067bcb28e036sm9037283iof.49.2022.07.27.18.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 18:44:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 19:44:02 -0600
Message-Id: <20220728014402.142320-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728014402.142320-1-james.hilliard1@gmail.com>
References: <20220728014402.142320-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+oseH7SqcdgFzmTbXgljM5GM/43G5Q6mRDj6crKslJg=;
 b=RHLeLAIR5bT8xyW+KC8qyceAV0Fr2B8RJcTHDNGbgh2i8zQOeId0rM6zcASH9lrOCw
 B5bxAX6athZ/w7PpSfTRcivsyF31etlEukBUs1dHjypPxgv0r0jpG1mfF6zAbcz9jOgH
 UYLYg6DnRd/InejrF5rj0mb14D8OZzLBD9rVYTPKa7u25cl7IgPsNbaybPADiQvz/B9K
 4ES3/eYXxAZvdpDUqvRiUc5tSbk5qLqtldBnUdsArcNRZEFpy9Eq/ULISU4ZXwyPKTV3
 bXUNSuLysb4v6VpODojil/ZX3hXvpOjMzgAKRLHB7Hqd1h7od5DQNCwYvUPJaRTn5ZEa
 Lmag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RHLeLAIR
Subject: [Buildroot] [PATCH 2/2] package/pkg-meson: generate relocatable
 pkgconfigs
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This format prevents pkgconfig path issues when using meson's
built-in install functionality.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-meson.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 156b005fdd..1830c7b10c 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -134,6 +134,7 @@ define $(2)_CONFIGURE_CMDS
 	CXX_FOR_BUILD="$$(HOSTCXX)" \
 	$$($$(PKG)_CONF_ENV) \
 	$$(MESON) \
+		--pkgconfig.relocatable \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
@@ -154,6 +155,7 @@ define $(2)_CONFIGURE_CMDS
 	mkdir -p $$($$(PKG)_SRCDIR)/build
 	$$(HOST_CONFIGURE_OPTS) \
 	$$($$(PKG)_CONF_ENV) $$(MESON) \
+		--pkgconfig.relocatable \
 		--prefix=$$(HOST_DIR) \
 		--libdir=lib \
 		--sysconfdir=$$(HOST_DIR)/etc \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
