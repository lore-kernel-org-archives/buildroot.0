Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF7EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:31:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9197B60F22
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9197B60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68CBC60676;
	Sat, 13 Nov 2021 13:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7Rea6THk1AZ; Sat, 13 Nov 2021 13:31:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9630605DF;
	Sat, 13 Nov 2021 13:31:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B24C1BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 150C760676
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHn7z7Am2yTQ for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A483C605AD
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:39 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so11296611wmb.5
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e0qf4U/vhQnSimrP25oms7iDFGkaBAgYu/DEUcQsvkI=;
 b=KTI8x2U6xuTKpS8QEEHVHID9icTSw79yMksbRKnRgJpVnd8hHpTWbfj9z+7+xIlosP
 cZLxn3W75O0dI0qS4QARd0IYWN7pCs+J8S89lMMWv92y2C/P5sXiR6QDTKHTUZpPOK0d
 adh0+lF/HzaK5rAEvGfAOVTpMyYw/Xq+mCZJGW0wzr+7Ekf6psOi4cvmlSLh6foLx7Nn
 xn28f8xwpaJvQ27N54uenfYZXTPIkSUFeLaXvIE1VzP5dWrbjhGeFcA4Fb9aNsWaPF5r
 YyUEt+yfPKvREnijJvPXJwtuSnGZtKWMN6k1lUnLbiOLSyHfqI/8S9jcGsTt5eYZgmYh
 XTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e0qf4U/vhQnSimrP25oms7iDFGkaBAgYu/DEUcQsvkI=;
 b=tQmvh/cT+sTK9LpfQgxak5EydFVOO06Ih7x2juIsESM0fOSK0pCuV0hXOyVAXJzU8g
 nQSUijxIOt0gi2EvFq5WM+yO3NpJoC8fmtmak3omtImiAnyrDQXrMZQGiMpsFO1xTAGa
 qSUVWk9CAzcvY6BxbSavb/yVdf/Iz2ZCR68tKkz9ryqMXEMnUmaKr6AWoJOW2Uab86b1
 m/OiFIuRjK8Dyf6ZD9oKVV1j6oQggQyiU87HqjctbzUCW4+uWZ7JHmfYgj2tpgmDNEqv
 nBqqA7f7CLQqHovcizxFsn62ha4NppLl+5ovbUXOPXKulrMkAgGEBjkpzsgAlwbn1/vE
 Nvgg==
X-Gm-Message-State: AOAM530LPJWW6W2VKbB1N1rnDaqkhbU0lr+blJ70sMMl++vA6fJ1rqJY
 UVY50Zoxnmu3tj4TPtUgBU535jrVP5xBgQ==
X-Google-Smtp-Source: ABdhPJyq+DnsEAjmkhSmxOeLTGbZpYllIELDJRFAF5Jw3PZNw147TK/vuOZTm90L4FemFzCQMXZ7Mg==
X-Received: by 2002:a1c:9a16:: with SMTP id c22mr42409764wme.160.1636810117964; 
 Sat, 13 Nov 2021 05:28:37 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:37 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:25 +0100
Message-Id: <ed84a285abd5f0aaff890734677bd099473e524e.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 14/16 v2] core/show-info: also export source and
 stamp directories in show-info
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

External tools may need to peek into the source tree (to check what the
list of patches that were applied), or in the stamp directory (to check
and report on the progress of a build)

Currently, both locations are identical, but semantically different and
an internal implementation detail. Exposing both separately will llow us
to change either without breaking users' scripts. Hopefully.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index da123a6ed2..37a4d244d7 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -114,6 +114,8 @@ define _json-info-pkg
 		$(call _json-info-pkg-details,$(1)) \
 	)
 	"overriden": $(if $($(1)_OVERRIDE_SRCDIR),true,false),
+	"stamp_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
+	"source_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
 	"build_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))),
 	$(if $(filter target,$($(1)_TYPE)), \
 		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
