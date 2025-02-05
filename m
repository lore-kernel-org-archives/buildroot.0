Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E51C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB77881185;
	Wed,  5 Feb 2025 14:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfTl3ufmWUAO; Wed,  5 Feb 2025 14:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69BC08119C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69BC08119C;
	Wed,  5 Feb 2025 14:10:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9914612F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D339413DE
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VG5zaRDMuFM5 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:10:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A65D4131A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A65D4131A
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A65D4131A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:10:16 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso68845175e9.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 06:10:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738764614; x=1739369414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0uA1eSUrMvhLrbRZyotMWCyYWCZkmGhybjnNkHo2aVU=;
 b=U+j0B0tA0a3feNOITkKDUMzxcen60EZzDSIx9vBOMYtNaVSnihaPpIH+GqRQvHO/Ai
 flIgGtJf3N5ZtA7S3GoIMb4XFZkgJXo8flm48uFq4wjoboh38qeSg9Yng/rKsBMfEeA+
 tTsHr31nMqcoXrfDdq/OLfEQlVe2Ao8/DLx08YABUoP6q14BucIRyBRljulUqPtvhOwB
 S8eHyXE002jKYRJ3S0zuGIUQIXuK5rg66fd8MTPeb1XpQUUVcNZAP0FB0N9u4mteaxct
 QR4NXBnlGCm7Dh/3/XzBVf/dRPmmcnw7QSFvVprPijwauoUGf/tPBnUtueoKgOXXIctZ
 ZEFQ==
X-Gm-Message-State: AOJu0YyOZ080E3fvc+1wyCSlk7eJThoj53CDvPcYf6+DFM6nWwJmXMgW
 yiZdWfX+d5qv0kKPSqXl7odDZeeDdMjsNgP9ltFj0oz7XarS52UekcsX43sZ9a5HfoKRmhQNVvw
 wKVY=
X-Gm-Gg: ASbGnctf4JCgAJBs192b9ZgsLeQ73hu19Pz5FOzradvTP01jTgGBI8VP0cUqhsGt3WB
 IqKl6UjNUCdYMrMmnoRhBo/DdZAl7SWtPkr1Y+LMSqXNuVc59ZXoVOwJQJrByBawnCG0FhW5M9M
 Wee8UixTVzTzE7clTB3nJbdxFjVG1bZ3UK3ZOmz9gEkdQUnqXhd0HhUx58/dkNw7xagjR/1h3Yu
 QvqJ8WbQyXwgRJhsaK4XMBnX0XHefszkjF6sEEvZn4u8zXsKyBN8YQqSUreASuJLwLamcyTjpeU
 3TN5h58G5TDj4BTFunK3/KMJVaOeAMGL4PsGHqs2Doj5fwl61Rj45at3ZNEghQmZFg==
X-Google-Smtp-Source: AGHT+IHMnZDnhhBIpRcCWNcPai1LThVZXULPJcT80Li+VI9t9HTlOT7gGJiSekkQXd+gAHo0JqNgRg==
X-Received: by 2002:a05:600c:4586:b0:436:fb9e:26c with SMTP id
 5b1f17b1804b1-4390d43dde8mr23015565e9.17.1738764614115; 
 Wed, 05 Feb 2025 06:10:14 -0800 (PST)
Received: from localhost.localdomain (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43907f19247sm34913945e9.1.2025.02.05.06.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 06:10:13 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 15:09:46 +0100
Message-ID: <20250205140947.843661-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250205140947.843661-1-thomas.perale@mind.be>
References: <20250205140947.843661-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738764614; x=1739369414; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0uA1eSUrMvhLrbRZyotMWCyYWCZkmGhybjnNkHo2aVU=;
 b=XvwVzSp4R06bsbVamZWc1Sx0qlatzIktDGPABrPdY9pO0HwOBuH/lRffAxPypVWn/a
 YiKFjFZFLqHq3GYH98Cl6DFGCt0Hd06tjSrUPYH4ta3VFgqxKrnshVokPhMq5uOK/7tu
 pDLeqk1PSVZEGzROsmb3sGrs5fRpXZ8x6Z7/Ax2EljX4MIqdHowz4yBRuU1m2f32ZrIr
 bShDpPHYC5niVYFXJycH2Q8yMSIOBX73xNnSXwIsyA7tB+JEgmZhV1qkzmyZGN2YwKuA
 JZzV84UouvYG1dOfiHgmCSwSIS4mbkaTTK+RfpETW0Mc/2Qiha038NbSo22uYYwQO8+e
 aZ0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XvwVzSp4
Subject: [Buildroot] [v2, RFC,
 PATCH 1/2] package/pkg-utils.mk: add patches to show-info json
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Matthias Swiggers <matthias.swiggers@mind.be>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds support for listing the patches path or url applied to a
package when calling `show-info`.

To avoid making `show-info` dependant on having to download and patch the
packages there is a known limitation with the patch listing of `show-info`:

  * If a package apply patches in the pre/post hook, they won't be listed
    (for instance: `android-tool`, `libmad`, `gcc-initial`, `gcc-final`,
    `linux-header`)
  * Patches defined in the `<pkg-name>_PATCH` variable will be listed as
    an URL instead of a path.

Those limitations does not apply for packages for which an
`.applied_patches_list` exists.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Co-authored-by: Matthias Swiggers <matthias.swiggers@mind.be>
---
 package/pkg-utils.mk | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index a0dbeac18e..ac70ad838f 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -156,6 +156,20 @@ define _json-info-pkg
 	)
 endef
 
+pkg-patches-dirs = $(addsuffix /$($(1)_PKGDIR),$(CURDIR))\
+	$(addsuffix /$($(1)_PKGDIR)/$($(1)_VERSION),$(CURDIR))\
+	$(addsuffix /$($(1)_RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))\
+	$(addsuffix /$($(1)_RAWNAME)/$($(1)_VERSION),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
+
+pkg-patches-url = $(foreach patch,$($(1)_PATCH),\
+	$(if $(findstring ://,$(patch)),$(patch),\
+		$($(1)_SITE_METHOD)+$($(1)_SITE)/$(patch)))
+
+pkg-patches-list = $(if $(wildcard $($(1)_DIR)/.applied_patches_list),\
+	$(file <$($(1)_DIR)/.applied_patches_list),\
+	$(foreach patchdir,$(call pkg-patches-dirs,$(1)),$(wildcard $(addsuffix /*.patch,$(patchdir)))) $(call pkg-patches-url,$(1))\
+)
+
 define _json-info-pkg-details
 	"version": $(call mk-json-str,$($(1)_DL_VERSION)),
 	"licenses": $(call mk-json-str,$($(1)_LICENSE)),
@@ -178,6 +192,12 @@ define _json-info-pkg-details
 		},
 	)
 	],
+	"patches": [
+		$(foreach patch, \
+			$(call pkg-patches-list,$(1)), \
+			$(call mk-json-str,$(patch))$(comma) \
+		)
+	],
 endef
 
 define _json-info-fs
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
