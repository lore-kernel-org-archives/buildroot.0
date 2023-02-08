Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2504DC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 17:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE96C61163;
	Wed,  8 Feb 2023 17:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE96C61163
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7jrsPrrn_kZn; Wed,  8 Feb 2023 17:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0143C6116B;
	Wed,  8 Feb 2023 17:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0143C6116B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1EC1BF275
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 17:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03BC082051
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 17:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03BC082051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jn5ho6UzuCH4 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 17:44:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAEB58204D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAEB58204D
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 17:44:38 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so2077673wmb.5
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 09:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ej+HDgai9mtR9xSLWoXzcCnCPP/m+fTFf/5AH2/mlGk=;
 b=h0nFsqjLpi4Iu5lmmBn4pND9IVt30LLkSeVnPwooaUPxNxbzJMTtVR/DKMEWJeiijh
 lJZQ5XrItzHxtTKTlOdpooMJpAhVcDqnyyNqY3UszKtHHI5p702pYAE0jlvQ0H8w2ipo
 YDBBkDyY4UXykrNcyRXHz/tvx/hTg7wCwYEq0lz8Aendxh5ZPw30HUphyPnHPPw33N/b
 JOrXUliujSYas+LQ8uPGfgdGZRh7XJk3R8dpLwVQZG2d6hKXhFE5JwznGlzdu1kEsQiK
 f91Z+RX4XoVTp5tO19JvGrMrQ1LIN9p6MxLRddH1OGVG73TuNW4AlNFowPx/wL3uJPpi
 uy+Q==
X-Gm-Message-State: AO0yUKWBM7L/8lvLWY7hQAHHCCyEvQFGVZVI+Y+kB6QqHL+pHgrlmcc9
 AQNJwJkcIJtNottnnSEpyTzS4NQoL/I=
X-Google-Smtp-Source: AK7set+xFNYDQ6y8c4xSHiMalaBeakq9bM7bu3OeuhPJU5tkm6St4NRiZFKgwNKG/9u9VzZ7t+/UzA==
X-Received: by 2002:a05:600c:807:b0:3e0:47:66cc with SMTP id
 k7-20020a05600c080700b003e0004766ccmr7434055wmp.23.1675878276489; 
 Wed, 08 Feb 2023 09:44:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o41-20020a05600c512900b003dc4aae4739sm3027653wms.27.2023.02.08.09.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:44:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 18:44:31 +0100
Message-Id: <20230208174431.85800-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ej+HDgai9mtR9xSLWoXzcCnCPP/m+fTFf/5AH2/mlGk=;
 b=kkcaHat8VIqr9XkL4YmNe7TfwoQGcYwip5ZFUwwi5AP8PpZJR524RbVlaqnd+LLpdI
 GnZk2/ur0lvbFt6SpYJkqueP9YelU54ju83HSBp7z5WsRJ3JYHfH9dVsPvCrTNlfiPTv
 XLo3hRATFRT0iPI9n1s8oo6TDnAJTdQskY2r8deW6DaKHWuyjrhCZ8AkEO+plnIHcgJz
 U2AU8Oswd1WESJ5xxL2mfkccq6WMwSjhoEdFjnlC0RnyfMzMHEKeXDJNsew/wUgDN7fd
 z9kyE9RHWheBkYeNbxoLF4ojN8Sjevv0tjwrODVwJtGTyrTnU9nL5eXKOMp+bDP21PMq
 ie4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kkcaHat8
Subject: [Buildroot] [PATCH 1/1] package/open-iscsi: add
 OPEN_ISCSI_CPE_ID_VENDOR
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:open-iscsi_project:open-iscsi is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopen-iscsi_project%3Aopen-iscsi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/open-iscsi/open-iscsi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/open-iscsi/open-iscsi.mk b/package/open-iscsi/open-iscsi.mk
index 249253c64f..e5b965b80d 100644
--- a/package/open-iscsi/open-iscsi.mk
+++ b/package/open-iscsi/open-iscsi.mk
@@ -10,6 +10,7 @@ OPEN_ISCSI_SITE = $(call github,open-iscsi,open-iscsi,$(OPEN_ISCSI_VERSION))
 # well. See https://github.com/open-iscsi/open-iscsi/issues/379
 OPEN_ISCSI_LICENSE = GPL-2.0+, GPL-3.0+
 OPEN_ISCSI_LICENSE_FILES = COPYING
+OPEN_ISCSI_CPE_ID_VENDOR = open-iscsi_project
 OPEN_ISCSI_DEPENDENCIES = kmod open-isns openssl util-linux
 
 OPEN_ISCSI_CONF_OPTS = -Ddbroot=/var/lib/iscsi
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
