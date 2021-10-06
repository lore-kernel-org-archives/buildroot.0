Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7518EC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:21:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9724C610A0
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9724C610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3560D4049F;
	Wed,  6 Oct 2021 16:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6ey1WRnR8h4; Wed,  6 Oct 2021 16:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FE81402CC;
	Wed,  6 Oct 2021 16:21:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21CE61BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1138140531
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yv-o7ZD52ZWh for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 16:21:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57BC240500
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 16:21:41 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t2so10479168wrb.8
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 09:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vd+ANKk3qEU9plh6PmTR5zZrYoXwI1qjQV8eADlSnj4=;
 b=JmipilOQegKT4RMAZ27sGu3pMStrTL5O/jgI81WH/4QtADv2QRAqlIbCNCsuMV2GQQ
 220HQmomURp0JLjSVwDCYdH9yy90su7Ahjnt/OfIa+eR6w49KxDtSko7/TB9Kl79Enwy
 l4UVFwPPQ5PFxfcOLp3HuDttrtTNfL7g9pxHj5z1G3f0JiUzsxMUC/Xxk0RCUl6cPFHu
 Fa7VornbiBUPm6QNESp0SAWZ+BTUgcku+RqpKIaEgFj0u2XStGp9iuGGtRcqKBZsxlFx
 wq7sdr6xNjqoffGjT3sNSD8sHqJO1fhByxTKoYRvSsdbOgU2qfYC4jHdC/hhNRVwPgXv
 Z/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vd+ANKk3qEU9plh6PmTR5zZrYoXwI1qjQV8eADlSnj4=;
 b=AD5zkr9Xe1AbxG55jKERcv48pcDxUka9z8pToiMgZusqQQjb2OGTd5No9OjlF/U075
 AEAti8xgfZnpLa1ALUrwAIwQOU4ytIcCujx2yS3ZeaFjyYMI7aRiWxSicSzdJBVDGV8k
 Jw2qPDBpNg8RuR94BJl6G7DX7bhXsFv/gk5Yt/jV0LcCvL/CamXzeWVEugfEeCQBKoNB
 CtYM1qzNRg7TphO/XUE3Ci602TZ6BEQAxRW0y3IYYgb8RzOIupQ32wqWyDIor5Hg4Tar
 4gswIVGhjx0jIgXkll+9HuQGgkcb6wIE6sKBYunx6bE031rISYLvpHnF2osrtiBBxzqq
 oqbg==
X-Gm-Message-State: AOAM532OkF5hBzK+MM1Lj3b3nc1JrUN3YRjSX7oU0pbcAIEbmA9GD3Mj
 E+Nt1v8PdMD1+YmRgVj34wEy/nbJYtc=
X-Google-Smtp-Source: ABdhPJzKUn2lroYCpQCJWCGd05Ac6+j+Sae/FsU0U5JVFBd2NdfdiaQ3GbPBBqvF+UNjApaeQcUG0A==
X-Received: by 2002:adf:aad0:: with SMTP id i16mr29686523wrc.128.1633537299242; 
 Wed, 06 Oct 2021 09:21:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id k128sm6117351wme.41.2021.10.06.09.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:21:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 18:20:44 +0200
Message-Id: <20211006162044.2500210-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-autotools: fix autoreconf with
 autoconf >= 2.70
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following build failure is raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da and
http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=dd880a0a6de5602cdd40b770ed6b083b34aa0768:

Can't exec "gtkdocize": No such file or directory at /home/buildroot/autobuild/instance-1/output-1/host/share/autoconf/Autom4te/FileUtils.pm line 293.
autoreconf: error: gtkdocize failed with exit status: 2

This failure is raised because autoreconf runs gtkdocize if configure.ac
contains GTK_DOC_CHECK, so set GTKDOCIZE to true in pkg-autotools to fix
this issue for all affected packages (i.e. host-libgtk3, libtasn1,
raptor, etc.). Indeed, gtk-doc is already forcefully disabled in
pkg-autotools through --disable-gtk-doc configure flag.

Fixes:
 - http://autobuild.buildroot.org/results/ce974281acdd6729327f2083b24f62485f9b1e1a
 - http://autobuild.buildroot.org/results/23dd993be4dcd7937d48eef4521690bf30123979
 - http://autobuild.buildroot.org/results/bcf489ccd41197b57b39312b369921467f295431

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pkg-autotools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index daa688dab6..7720d6ffe7 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -100,7 +100,7 @@ endef
 #
 define AUTORECONF_HOOK
 	@$(call MESSAGE,"Autoreconfiguring")
-	$(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
+	$(Q)cd $($(PKG)_SRCDIR) && GTKDOCIZE="true" $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
 endef
 
 ################################################################################
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
