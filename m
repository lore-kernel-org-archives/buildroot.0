Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7683CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:28:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B501260F22
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B501260F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81D4E40505;
	Sat, 13 Nov 2021 13:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bkbQwodjjfHG; Sat, 13 Nov 2021 13:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F08F440501;
	Sat, 13 Nov 2021 13:28:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1511BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C6AD40501
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5LmDHYoRGiOL for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F891404EB
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u1so20612230wru.13
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qnCs7VzV0q8J9vCKb3zowQv2fHlGixjNaOYCObrn8xs=;
 b=qM0g3YBupv8Pv53jyeCeKpVCaPvWm48DpBocrvU7a8ZsAQYSg/yRBkrSAOWwxVqS83
 h5/SMdL/jCJohwC+CLCKtemlMy4Xn+juUq2PytFSihJdNVr5sbte/oCPkrZbrcI36JvW
 TIolJtRnK0OaMKCOk6e9xnj+3xPYRFYU/QPZKJodwqVxTWUhIEy6iRwaW0lpMXfHDgit
 urheZbTRtmSqMwHiZOrNqqq2FZM7wVSz436LccA6RMHkuxnhp4afUZ1MGe6SMnnYIBBb
 h7ntEz8sTTcObpvzaIKUMYi7BugmCUGFSp0Se3dZRmRSi2I0l1MervdUgI54wJgSY5xJ
 kS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qnCs7VzV0q8J9vCKb3zowQv2fHlGixjNaOYCObrn8xs=;
 b=oNevsBLEkQxsuCqK9tOn0wHpIOyiya5J0zFafylnf+Kj1aRjxEIS2CEjZAYWGKSJEL
 CSFsHDxTPzECmqVFBoCnJWjJjhQE9EiYlrt3DWyEO6klzw1zqr6Tzsog1/ZNSC/f7ZaW
 cOa3FQmMTa7Xg+DZIyUYN+bz1JAEKlGETQ8CwflLGPeS79MCwneQcWDD8AwWtRAfHqjs
 HCz5cPhPbITDfWV5DrCVu3pyPeJ3d65HW74Hd5c3UEcAASr2HiF0Y+A7NU4aPp2sYdWw
 H7+O855gqsXaYvGgmYdtsARSYfkLR6cJmPtEZ62MusOlKrczG0jaDF50EBiviklJX377
 yvtA==
X-Gm-Message-State: AOAM530F8bJD9ezlkMfpgIIsJx4or01BOUSKDsgMjqzOtoi6D9uQIo6X
 czGIAJsTeK3HoqVYYEQYGkmqIp1wnmjEPQ==
X-Google-Smtp-Source: ABdhPJxy9S2/zn9aHNnI22SV36caFXCgRzAoGzycmo48xXa7ztylE8/LrUP+iPaGDtR7dW+qyORRkA==
X-Received: by 2002:adf:dd87:: with SMTP id x7mr27239577wrl.158.1636810108747; 
 Sat, 13 Nov 2021 05:28:28 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:28 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:12 +0100
Message-Id: <131995cf092cfa13a4032e05a1cda77319566fa1.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 01/16 v2] core/show-info: report build_dir
 relative to CONFIG_DIR
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the build_dir field is reported relative to $(BASE_DIR), to
avoid leaking local paths.

However, BASE_DIR is not a directory that is very convenient: for
in-tree builds, it is $(CONFIG_DIR)/output/, while for out-of-tree
builds, it is $(CONFIG_DIR). This difference is purely an idiosyncracy
of how out-of-tree builds have been implemented in Buildroot, and is
not under the control of the user.

What the user is in control of, however, is where the .config file is
located. This, really, is the directory we should base relative paths
on.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index ae3c7f9da9..b2f0b8cebf 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -113,7 +113,7 @@ define _json-info-pkg
 		"virtual": false$(comma)
 		$(call _json-info-pkg-details,$(1)) \
 	)
-	"build_dir": "$(patsubst $(BASE_DIR)/%,%,$($(1)_BUILDDIR))",
+	"build_dir": "$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))",
 	$(if $(filter target,$($(1)_TYPE)), \
 		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
 		"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING))$(comma) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
