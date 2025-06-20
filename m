Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FA1C7115B
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 08:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860EB60AD8;
	Fri, 20 Jun 2025 08:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMM_gX_5VPV3; Fri, 20 Jun 2025 08:10:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A87CB60BD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A87CB60BD1;
	Fri, 20 Jun 2025 08:10:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4100916B
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3043380AF5
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG66PnDoHakw for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 08:10:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81603808A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81603808A0
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81603808A0
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:10:17 +0000 (UTC)
X-CSE-ConnectionGUID: Bvp6jEQpRO69ItGUGuMnsA==
X-CSE-MsgGUID: /zXW07iPSJuxh6rRXHGLWg==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 10:10:15 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2025 10:10:13 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 20 Jun 2025 10:10:11 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Jun 2025 10:10:11 +0200
X-CSE-ConnectionGUID: P0i7OXwwQ8CC9Q4Ygf5Svg==
X-CSE-MsgGUID: vuswKOIMSdaXhtQtvLUVeA==
X-IronPort-AV: E=Sophos;i="6.16,250,1744063200"; d="scan'208";a="300126315"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Fri, 20 Jun 2025 10:10:08 +0200
Message-ID: <4151125fea44bbd68771383fac5f7798aed96d93.1750407006.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1750407006.git.yann.morin@orange.com>
References: <cover.1750407006.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX102.corporate.adroot.infra.ftgroup (10.115.26.3)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1750407018; x=1781943018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SBP0/6LpeNit/pUnr0g2zzqMFUI31b535KoZSG7NEVk=;
 b=r9bYuDnwGKi2XRTR2r+viRluWsX78hTJgp//wRzyKwn3vNIf9drAKsXD
 GLRWmPt4rsRTPJGPDmgoLDVyTSa0LNREM8jWQRjsZkx7KjWcsJRSvhOiR
 DAwXOwWVz8k1jiZZWXvsBeDpcO1BoA097UowiUZTf/yN3H7if1sqZhqwx
 g/GBwiLZMIC9U+wePJtvwW6YYpcAYzDTS5IbllqH3GBUGykrqcCY/2DVK
 pBJ1xmQ+PteDyTWCEdWmA8Gk8gqFSbUhRQnPtJ9NI3qsoA0l1xgxbpvK3
 M8KLGzs3FUopxGvQN9bS6hd5j5waZ+Hq/Im+iDyD+4JsYmEHHhPEHyn28
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=r9bYuDnw
Subject: [Buildroot] [PATCH 1/4] package/pkg-golang: simplify installing
 multiple binaries
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Currently, when a golang package defines multiple _BUILD_TARGETS, it has
to basically repeat the same list in its _INSTALL_BINS.

When a golang package defines multiple _BUILD_TARGETS, the pkg-golang
infra will forcibly use the basename (the notdir) of each target as the
name of the generated binary; there is no option to set a per-target
binary name.

However, the pkg-golang infra by default tries to install a binary named
after the package rawname. This forces packages to basically repeat the
same list as their _BUILD_TARGETS to override _INSTALL_BINS, when the
list of generated binaries is already known to the infra.

We change the pkg-golang infra to better cover such a case:

  - if _BUILD_TARGET is '.' (the default), keep the current scheme:
    install a single binary named after the package rwaname;

  - if _BUILD_TARGET is not '.', and contains a single word, use the
    notdir of the built target, but allow the user to override it with
    _BIN_NAME (the current behaviour);

  - otherwise (_BUILD_TARGETS is set to more than one word), do not
    allow the user to set _BIN_NAME (it does not make sense), but set
    _INSTALL_BINS by default to the notdir of _BUILD_TARGETS.

We still allow the user to set _INSTALL_BINS in the last case, to cover
the case for existing packages; those are going to be "fixed" in the
following commits.

We now consider that _INSTALL_BINS is an internal implementation details
that should no longer be exposed to the users, so we drop it from the
documentation; we rephrase the corresponding part for _BUILD_TARGETS.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
---
 docs/manual/adding-packages-golang.adoc | 26 ++++++++++++-------------
 package/pkg-golang.mk                   | 11 +++++++++--
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/docs/manual/adding-packages-golang.adoc b/docs/manual/adding-packages-golang.adoc
index 6de0916a83..21b6a122a9 100644
--- a/docs/manual/adding-packages-golang.adoc
+++ b/docs/manual/adding-packages-golang.adoc
@@ -94,20 +94,20 @@ therefore only use a few of them, or none.
   defaults to +.+. We then have two cases:
 
 ** +FOO_BUILD_TARGETS+ is +.+. In this case, we assume only one binary
-   will be produced, and that by default we name it after the package
-   name. If that is not appropriate, the name of the produced binary
-   can be overridden using +FOO_BIN_NAME+.
+   will be built and installed, and by default we name it after the
+   package name; if that is not appropriate, the name of the binary can
+   be overridden using +FOO_BIN_NAME+.
 
-** +FOO_BUILD_TARGETS+ is not +.+. In this case, we iterate over the
-   values to build each target, and for each produced a binary that is
-   the non-directory component of the target. For example if
-   +FOO_BUILD_TARGETS = cmd/docker cmd/dockerd+ the binaries produced
-   are +docker+ and +dockerd+.
-
-* +FOO_INSTALL_BINS+ can be used to pass the list of binaries that
-  should be installed in +/usr/bin+ on the target. If
-  +FOO_INSTALL_BINS+ is not specified, it defaults to the lower-case
-  name of package.
+** +FOO_BUILD_TARGETS+ is not +.+. In this case, it is interpreted as a
+   space-separated list, and we iterate over the targets to build and
+   install a binary named after the non-directory component of the
+   target. For example if +FOO_BUILD_TARGETS = cmd/docker cmd/dockerd+,
+   the binaries built and installed are +docker+ and +dockerd+. If
+   +FOO_BUILD_TARGETS+ contains only one target, then it is possible to
+   override the built and installed binary by setting +FOO_BIN_NAME+,
+   as above; if +FOO_BUILD_TARGETS+ contains two or more targets, then
+   it is not possible to override the names of the installed binaries
+   (use a post-install hook for that).
 
 With the Go infrastructure, all the steps required to build and
 install the packages are already defined, and they generally work well
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index a4e8bd30cc..ff8d28aa7e 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -61,9 +61,16 @@ $(2)_BUILD_TARGETS ?= .
 # after each build target building them (below in <pkg>_BUILD_CMDS).
 ifeq ($$($(2)_BUILD_TARGETS),.)
 $(2)_BIN_NAME ?= $$($(2)_RAWNAME)
+$(2)_INSTALL_BINS ?= $$($(2)_BIN_NAME)
+else ifeq ($$(words $$($(2)_BUILD_TARGETS)),1)
+$(2)_BIN_NAME ?= $$(notdir $$($(2)_BUILD_TARGETS))
+$(2)_INSTALL_BINS ?= $$($(2)_BIN_NAME)
+else
+ifneq ($$($(2)_BIN_NAME),)
+$$(error $(1) sets $(2)_BIN_NAME while there are multiple targets in $(2)_BUILD_TARGETS)
+endif
+$(2)_INSTALL_BINS ?= $$(notdir $$($(2)_BUILD_TARGETS))
 endif
-
-$(2)_INSTALL_BINS ?= $$($(2)_RAWNAME)
 
 # Source files in Go usually use an import path resolved around
 # domain/vendor/software. We infer domain/vendor/software from the upstream URL
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
