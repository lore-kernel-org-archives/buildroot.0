Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F10EC3DA4B
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 12:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFA5F40120;
	Wed, 17 Jul 2024 12:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUfSXyXcooQT; Wed, 17 Jul 2024 12:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C080040277
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C080040277;
	Wed, 17 Jul 2024 12:11:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B06811BF364
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 12:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D7D540674
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 12:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMxazd5M3fJe for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 12:11:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A12A540632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A12A540632
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A12A540632
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 12:11:56 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-447eb65d366so40159491cf.1
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 05:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721218315; x=1721823115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G6WWi0X3O5NqjS+8nxqI8aWoN0q1KbU4NYp28ABxAjo=;
 b=thXDUkLxfXXWSPk7mxug4rZbnFaWMOm+vk+yAdZniw6n1gjOVNVIoMLJXi12RcBE8Z
 Ou24SEgvFAJq+gT/FhTR9er7+K1dYajqf8aTOQTVwJ6ZAlmyvS2GoYneuXk2TqB0h31F
 U/DwOlQMgq0HgsDX+JGiLXPO9MRRMtANWA9lLwSiNoCXP01XlPM2nXx4YM1HTYStRvVL
 4Obk2YwEvA32A1gWUn1CXiUo+spAVC+/T/pi/OH72A/Bb6SV5lxVgANe25FxuqTtWPfg
 TEKw8EpsB5iUhSrFpyj8YepQqBoJVY7jXHMLXOfBU2kgsicjxusaIG7oQO+3E6jt6JdP
 gR9A==
X-Gm-Message-State: AOJu0Yw+DTxZ6bW7kdxwyxLqofw2Wvo+EDIQ52r/B3WGW24EVGUUoYDK
 pYbGTOvwKaETqvDbkJL3vXrskQkt1O4lFwrG9BjxsYO7oi23NnXXzabMAQ==
X-Google-Smtp-Source: AGHT+IEpN8m2Pk6xe49Oe+TNdAukTAldhf7ROcEThOSQyT1DlEc+nkxDy04IWnRA6NiXI1YH3GgANA==
X-Received: by 2002:ac8:5f85:0:b0:446:5b94:d973 with SMTP id
 d75a77b69052e-44f861ac451mr14822191cf.16.1721218315138; 
 Wed, 17 Jul 2024 05:11:55 -0700 (PDT)
Received: from hw-dev-vm01.evs.tv ([212.222.125.68])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f5b7bba66sm46889411cf.5.2024.07.17.05.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 05:11:54 -0700 (PDT)
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
X-Google-Original-From: Fred Lefranc <fred.lefranc+evs@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 14:11:46 +0200
Message-Id: <20240717121147.1353901-1-fred.lefranc+evs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240716075933.1315047-1-fred.lefranc+evs@gmail.com>
References: <20240716075933.1315047-1-fred.lefranc+evs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721218315; x=1721823115; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G6WWi0X3O5NqjS+8nxqI8aWoN0q1KbU4NYp28ABxAjo=;
 b=Zg/fw2EcN06XU5Mj8gjBx50Imm1OIo1NR8DmQ2qnNOTEixfPW3d9Yfn8BfXEiJSGsr
 Oqu79owtgCWRMaUxbPGjCyPGeU0QdpRtzNjZr9uZIBlL53tjfoR25UspVMrAg2XNLz/6
 OCee0T1Ia5lDsfdLeJcrGKPacSrby9tzCzhpHA9cGk0vxrzN4YoImc7C8qf3ZJfxd38P
 joRiXMEpb4D6MHGtct9fOngQJfD8kUA1T7YYcYqX+eczed5oJOGYorS2KgBeGfj5ncs9
 BsxuPqAcxQBzVC+RDVpZZN195xvOlyZAronxTKjnsIMaTHGHFeCEvcfEsbW0Wdw93nVG
 M7PQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Zg/fw2Ec
Subject: [Buildroot] [PATCH v4] package/busybox: fix build with glibc 2.39
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
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When glibc was bumped to version 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97,
it removed the deprecated libcrypt support.

In such a situation, until the upgrade of glibc to 2.39, Busybox could rely on the
libcrypt provided by glibc. Since version 2.39, glibc no longer provides libcrypt,
causing a build failure with Busybox configurations that have CONFIG_USE_BB_CRYPT
disabled.

To fix this, add the libxcrypt dependency to Busybox when BR2_PACKAGE_LIBXCRYPT is
selected. The user is still responsible for enabling BR2_PACKAGE_LIBXCRYPT when
their Busybox configuration has CONFIG_USE_BB_CRYPT disabled.

Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
---
Changes v3 -> v4
  - fix commit message to explain the non-working case
Changes v2 -> v3
  - fix commit message
Changes v1 -> v2
  - busybox.mk: fix BUSYBOX_DEPENDENCIES ident & remove the check
for BR2_TOOLCHAIN_USES_GLIBC (req by Thomas)
  - Config.in: remove libxcrypt mandatory dependency
(req by Thomas)
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index eb5e7ad922..d25e5bf468 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -164,6 +164,10 @@ define BUSYBOX_SET_MDEV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+BUSYBOX_DEPENDENCIES += libxcrypt
+endif
+
 # sha passwords need USE_BB_CRYPT_SHA
 ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA256)$(BR2_TARGET_GENERIC_PASSWD_SHA512),y)
 define BUSYBOX_SET_CRYPT_SHA
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
