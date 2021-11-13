Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1C7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:30:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 770C261029
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 770C261029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F28C4056C;
	Sat, 13 Nov 2021 13:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxYqxJWR8gMM; Sat, 13 Nov 2021 13:30:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D2854052D;
	Sat, 13 Nov 2021 13:30:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4BA71BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C431F404FE
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8T8CXmJJRp7 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E9AA404EB
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id z200so10004418wmc.1
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kd/XcONpu1NikmM2ZXswH885o5hXjaaMyiD4ldwoj3k=;
 b=dmn6KmxT/z6q5kzG6PS9EkHPXpImaKUqrUfov80wCRthSwycOHKEP/ChUqtd3LS9mO
 /9IhP3GEYnS9r0iD5vTz1o9qp1PxeQbGYzqfi4jrx0Zhq0gzCMdsifveErMUeFgvs9DU
 y7f3n3/CIK8MRrx/Aq683GJ4aInSXyiYj/f240ymAbuGSaBPARkDbbewMPwxj2W4lbmY
 jzk1cIJa/zIa1yCjzd59C5FculeFF2aFqVgYSxCsOs0sXqbVgW0oYB3HnIS27WWq88C6
 o/bL0REBngY/FlWrto6SnWYVjzNJD9i0LF+xrx07Bsde+ruoBSydiK2jjcnQcS2noflN
 b7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Kd/XcONpu1NikmM2ZXswH885o5hXjaaMyiD4ldwoj3k=;
 b=PXi3mo7BtSMZhr4HaRCJxHPhI5+A86hu/846vkG50tJ8kwJAAnJw1vQM7OGse0SpBE
 e6mgvk68V1VfrPgYjftDumCpZB83KYrWnfdQbSw5fWSlM2oV1q1HStnEcgLQH5Fo+4Zt
 wkVpraVwLnrFD8XQK1FKCtWMrN+uZgou1n9+4MzLcqDZKYYJAFljiLr9v9tVzqL6G1NG
 q78n7z6grajkcfPMQGUJHD8K8xR5AyTomjgT+gd/tHmqvC8+I9mP6/CABCmZUq6fG9TM
 cU+rOFuXno9m4dhdFfqOcBMGEQywvqWKw9kCb9tDZUGI9UlFdPOH7u4e6fpdi0J9n+h3
 cp5g==
X-Gm-Message-State: AOAM530ltdEfImTZSOArlpM3sO08HeDI3T1wH888k79QcvQmVyqoyMFU
 ChqT13QwmI/PwdlNGwwtAqS1LwrINsz5aA==
X-Google-Smtp-Source: ABdhPJwzjQI2bKuSe9VIThm2rdRW1wGAweCxrqGf5e2sTBPkDUpV+z15GILw4/+vYA87hpCJFSnc0w==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr26150911wmk.27.1636810114210; 
 Sat, 13 Nov 2021 05:28:34 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:33 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:20 +0100
Message-Id: <fea2c015c08dedfcc7414dbaab261bf43c82f40b.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 09/16 v2] support/utils: make-comma-list does
 just that, not quoting
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

Currently, we have two functions that build a comma-separated list
of items; one is double-quoting the items, while the other is
single-quoting them. Their naming is not very consistent.

Besides, in a followup change, we will need to build a comma-separated
list of items that are already double-quoted.

Introduce a macro that does just build a comma-separated list, and
use that in the two other macros; rename the existing macro so the
naming is consistent.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk  | 10 +++++-----
 support/misc/utils.mk | 12 ++++++++----
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 973eabe437..94e806963b 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -120,17 +120,17 @@ define _json-info-pkg
 		"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES))$(comma) \
 	)
 	"dependencies": [
-		$(call make-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
+		$(call make-dq-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
 	],
 	"reverse_dependencies": [
-		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES)))
+		$(call make-dq-comma-list,$(sort $($(1)_RDEPENDENCIES)))
 	]
 	$(if $($(1)_CPE_ID_VALID), \
 		$(comma) "cpe-id": "$($(1)_CPE_ID)" \
 	)
 	$(if $($(1)_IGNORE_CVES),
 		$(comma) "ignore_cves": [
-			$(call make-comma-list,$(sort $($(1)_IGNORE_CVES)))
+			$(call make-dq-comma-list,$(sort $($(1)_IGNORE_CVES)))
 		]
 	)
 endef
@@ -144,7 +144,7 @@ define _json-info-pkg-details
 		{
 			"source": "$(notdir $(dl))",
 			"uris": [
-				$(call make-comma-list,
+				$(call make-dq-comma-list,
 					$(subst \|,|,
 						$(call DOWNLOAD_URIS,$(dl),$(1))
 					)
@@ -161,7 +161,7 @@ define _json-info-fs
 				null \
 			),
 	"dependencies": [
-		$(call make-comma-list,$(sort $($(1)_DEPENDENCIES)))
+		$(call make-dq-comma-list,$(sort $($(1)_DEPENDENCIES)))
 	]
 endef
 
diff --git a/support/misc/utils.mk b/support/misc/utils.mk
index dc60cad979..fdc22a2eef 100644
--- a/support/misc/utils.mk
+++ b/support/misc/utils.mk
@@ -84,13 +84,17 @@ finddirclauses = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
 # notfirstword(wordlist): returns all but the first word in wordlist
 notfirstword = $(wordlist 2,$(words $(1)),$(1))
 
-# build a comma-separated list of quoted items, from a space-separated
+# build a comma-separated list of items, from a space-separated
+# list of items:   a b c d  -->  a, b, c, d
+make-comma-list = $(subst $(space),$(comma)$(space),$(strip $(1)))
+
+# build a comma-separated list of double-quoted items, from a space-separated
 # list of unquoted items:   a b c d  -->  "a", "b", "c", "d"
-make-comma-list = $(subst $(space),$(comma)$(space),$(patsubst %,"%",$(strip $(1))))
+make-dq-comma-list = $(call make-comma-list,$(patsubst %,"%",$(strip $(1))))
 
-# build a comma-separated list of single quoted items, from a space-separated
+# build a comma-separated list of single-quoted items, from a space-separated
 # list of unquoted items:   a b c d  -->  'a', 'b', 'c', 'd'
-make-sq-comma-list = $(subst $(space),$(comma)$(space),$(patsubst %,'%',$(strip $(1))))
+make-sq-comma-list = $(call make-comma-list,$(patsubst %,'%',$(strip $(1))))
 
 # Needed for the foreach loops to loop over the list of hooks, so that
 # each hook call is properly separated by a newline.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
