Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3381AC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 16:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C255740A69;
	Sat, 27 Jan 2024 16:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C255740A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NUWFcKKv8Wwy; Sat, 27 Jan 2024 16:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1B71408C9;
	Sat, 27 Jan 2024 16:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B71408C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 590EA1BF23B
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31D2941527
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31D2941527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DeuKgsORJtpl for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 16:38:10 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75F2E41523
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 16:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75F2E41523
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40ef0a84bfbso2688875e9.1
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 08:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706373488; x=1706978288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+4lvU3alNXdZlvzkXMA8CtoXmSPHSsf6YE3OMFdPNwM=;
 b=WFqpFogY++Ja2wl1jrxQFgUi/wlou43IhIuHJPsSqLIA/jBIHB9lWRMGil4+1+hb+T
 9lphEQ+wFDFN+DBG6VOwn3UxxpGqsXNbfxm3SuXaNgw3Pc0yfqBYb9gNQoqiZqBTBXkY
 9x0CsjB5DMt5UaMcQjG4nCf5HMXJmdAonVBZWbeX5JP9gXZbbifE4EeFrvI/WmNx8uDs
 OEdIIVzNGwqil69+Z/FoToC3EDrNb7TIBe0z+NngJCkUtDvszo9LWxj/Cy688cPf7P2G
 Nd6kTjyMtL/K9gDA/sujXZBahnK5RJBbPyHyDklgLtNGzcw/IHO3loj91oQBlOAbCFnR
 JOFg==
X-Gm-Message-State: AOJu0YxlCxz6J1RxFvPtgWUNOca+aFgWW453l2RDXn/OwP6lu5NXoB2w
 dIy2ouqMfFz9aMZcrV8O26qFoPOpQMuMgJMINSPm+HCPfRG6H+cX7/heD7k4
X-Google-Smtp-Source: AGHT+IEpKIerSpr+LnewyDwIO2XxwF6MkA+69ibYjoMEjlvJdzAkFNqIKKgv68FrgdSjSiDRAF/Hlw==
X-Received: by 2002:adf:eb0b:0:b0:339:35b0:fc10 with SMTP id
 s11-20020adfeb0b000000b0033935b0fc10mr1279736wrn.106.1706373487996; 
 Sat, 27 Jan 2024 08:38:07 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a05600016c200b003392c1f40acsm3857976wrf.28.2024.01.27.08.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jan 2024 08:38:07 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 17:38:07 +0100
Message-ID: <20240127163807.233065-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706373488; x=1706978288; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=+4lvU3alNXdZlvzkXMA8CtoXmSPHSsf6YE3OMFdPNwM=;
 b=CCplvF48mkw/KA9Kfj5gBXHESNrXwS+9oOlb1FrkQvOAqY3fb+ow8r0kxTn6JAfh63
 8PDhIuUjCBRO2emVpOFVyCUE1yBbz81O6G/a54/HtuEEfDB63rzFwvxRiTR5uOOzc5V0
 y6VCu/45I/i1asdV93Bf4v89NusOCf3wgPD6AJU0Q0GNV0wNjcwvL90S9QTrVs4JyUQo
 d35GwRIU5Wf4RwxxVvHLiU3KPgjOT97CGpDFCSmV/nOjZKPgTsZD50PIgmD9L4v/flnV
 fce9YFRA11rd+DRrjDOug1+92WIHhRiCHVpVIzaTK+8yEELxQBa9DRWmeThkoY+H47tc
 U28A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CCplvF48
Subject: [Buildroot] [PATCH] package/pkg-utils: add missing licensing data
 to show-info
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

While the list of licenses is present in the show-info output, the list
of license files and the redistributable status were missing. Add them.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 059e86ae0a..723bbe4e24 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -157,6 +157,10 @@ endef
 define _json-info-pkg-details
 	"version": $(call mk-json-str,$($(1)_DL_VERSION)),
 	"licenses": $(call mk-json-str,$($(1)_LICENSE)),
+	"license_files": [
+		$(foreach f, $($(1)_LICENSE_FILES),$(call mk-json-str,$(f))$(comma))
+	],
+	"redistributable": $(if $(filter NO,$($(1)_REDISTRIBUTE)),false,true),
 	"dl_dir": $(call mk-json-str,$($(1)_DL_SUBDIR)),
 	"downloads": [
 	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
