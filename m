Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07D2CDB474
	for <buildroot@archiver.kernel.org>; Sat, 14 Oct 2023 22:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30C1C8188A;
	Sat, 14 Oct 2023 22:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30C1C8188A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3L-ZF9pbdGr; Sat, 14 Oct 2023 22:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6745D818C2;
	Sat, 14 Oct 2023 22:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6745D818C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D9C91BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 22:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14C68402DC
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 22:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14C68402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBDdM3dUV6gL for <buildroot@lists.busybox.net>;
 Sat, 14 Oct 2023 22:25:45 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D92994015E
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 22:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D92994015E
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4064876e8b8so36555195e9.0
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 15:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697322343; x=1697927143;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDCpd8Z/IHw3+HhzF9mbuIBaYiRFXy12ASiNZwesJo4=;
 b=SRCnTI1CAz1p4aY5jsrkY3T0TBG2BObm4Wht+BkKWnpnp8CmdRtgOd4eUTKP7gK2Y3
 GMWhxA51SqDvLA77skiKKADg5YhvtjrXpi2baX0SQ2CaNPE5SGsv8Cf8KGbwq3mxdIO/
 amVJKgKRWUngzVE8Bmm3siaCAzwddB7zNfBNm1jGFezui/G8NqR2OW1HnJddjj5+rqj9
 /eIOk/l7I2ABVCnnQ0BfCYenXVyLpMrld6VKcyJHFb7Q+xAbO2OiZ8MH+ZXSLTEQaSZ0
 DMHRZVLgN4IRy5U3HNZUOME0v/fOFXge4xGGtWSZTheD4YnJDH9F+H8UQMZfxjfsHU9U
 wWww==
X-Gm-Message-State: AOJu0Yw77mNUAmJuae/9xbu5EtFtXLLbZkGRhyaE1NSwKAlHEgFP4L1r
 RxZEbcMtffYKxDq7J2MoTxaYuj+UBv0=
X-Google-Smtp-Source: AGHT+IGVIm7jL/KAPNRfzTSfx3M/x9Ac+JPJdsaxU1F4Yv/bZiH7JIyajhYrNGzShKFOH5PH2/kC4g==
X-Received: by 2002:a05:600c:2150:b0:402:8c7e:ba5 with SMTP id
 v16-20020a05600c215000b004028c7e0ba5mr25474789wml.18.1697322342560; 
 Sat, 14 Oct 2023 15:25:42 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8290:3800:a426:a01d:739:9ce4])
 by smtp.gmail.com with ESMTPSA id
 az23-20020a05600c601700b00406447b798bsm3019107wmb.37.2023.10.14.15.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 15:25:42 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 00:25:41 +0200
Message-Id: <20231014222541.891768-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697322343; x=1697927143; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=CDCpd8Z/IHw3+HhzF9mbuIBaYiRFXy12ASiNZwesJo4=;
 b=kG5HTCIKeg+xb0dPNUay0HsRADf/OOMBX9HMkkBbbB3lF6ipCET8HPvMD84AXoivGm
 rZ2kbxu5jqn1kIOnIrWo8XlldRt3RnlO7RC+zlkc7Jw4P/dNch1s9tvEWufPame6ErlR
 sApBZwQP2LemZ/osQVg5wK7yLh5wNaHVfmAtBBpIg4g66DuBroZ6YI8hPsdrUA6u9JrE
 HXKb/3J5T8za3EbyuAJOKjLnEK+0rW1FNdEftvZOvIQRIzav/JHNkORkuLwuyx+WCZ4V
 d32izngPxB0VGxlS3H5zlUEx2S+qTaE3h5GTI2NJxtHwrytl/ADcB0bNHslS7yE2dY4M
 wv2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kG5HTCIK
Subject: [Buildroot] [PATCH] package/pkg-generic: drop support for
 arch-specific patches
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The last architecture-specific patch we had was removed 2015-02-14 with
commit 9863553fe8fa (packages: all salute the passing of avr32), where
we eventually got rid of the avr32-specific patch for fbv.

Since then, we've only had common patches (that apply systematically),
of conditional patches, that are applied in an ad-hoc manner with
post-patch hooks. Currently, we even only have one such patch (for
Linux).

Since we do not advertise that possibility in the manual, and since we
do not want to have such patches, drop the support for it.

This has the potential for breaking existing br2-external trees, but
there is a workaround for those: they can provide a pre-patch ook that
copies the ecessary per-arch patches if needed. We document this in the
manual.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/migrating.adoc | 23 +++++++++++++++++++++++
 package/pkg-generic.mk     |  4 ++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 2667aeab96..21277f947b 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -100,3 +100,26 @@ change implies that:
   to be updated appropriately;
 * the archive version suffix has been updated to +-br3+, so the hash
   files must be updated appropriately.
+
+Before Buildroot 2023.11, it was possible (but undocumented and unused)
+to apply architecture-specific patches, by prefixing the patch filename
+with the architecture, e.g. `0001-some-changes.patch.arm` and such a
+patch would only be applied for that architecture. With Buildroot 2023.11,
+this is no longer supported, and such patches are now longer applied at
+all.
+
+If you still need per-architecture patches, then you may provide a
+xref:hooks[pre-patch hook] that copies the patches applicable to the
+configured architecture, e.g.:
+
+----
+define LIBFOO_ARCH_PATCHES
+    $(foreach p,$(wildcard $(LIBFOO_PKGDIR)/*.patch.$(ARCH)), \
+        cp -f $(p) $(patsubst %.$(ARCH),%,$(p))
+    )
+endef
+LIBFOO_PRE_PATCH_HOOKS += LIBFOO_ARCH_PATCHES
+----
+
+Note that no package in Buildroot has architecture-specific patches, and
+that such patches will most probably not be accepted.
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6e944dd6b7..face2dc6d9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -252,9 +252,9 @@ $(BUILD_DIR)/%/.stamp_patched:
 	for D in $(PATCH_BASE_DIRS); do \
 	  if test -d $${D}; then \
 	    if test -d $${D}/$($(PKG)_VERSION); then \
-	      $(APPLY_PATCHES) $(@D) $${D}/$($(PKG)_VERSION) \*.patch \*.patch.$(ARCH) || exit 1; \
+	      $(APPLY_PATCHES) $(@D) $${D}/$($(PKG)_VERSION) \*.patch || exit 1; \
 	    else \
-	      $(APPLY_PATCHES) $(@D) $${D} \*.patch \*.patch.$(ARCH) || exit 1; \
+	      $(APPLY_PATCHES) $(@D) $${D} \*.patch || exit 1; \
 	    fi; \
 	  fi; \
 	done; \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
