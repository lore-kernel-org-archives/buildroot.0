Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A13C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 19:18:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93E9E60E94
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 19:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93E9E60E94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2C6E80E51;
	Sun, 29 Aug 2021 19:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0CuF89RmIZq; Sun, 29 Aug 2021 19:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7184980E54;
	Sun, 29 Aug 2021 19:18:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68AEC1BF36A
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 19:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 517EC6063E
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 19:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOwcxOYyP91B for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 19:18:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9311E60600
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 19:18:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x6so11008946wrv.13
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOjJT78xBjSgMnGqh8JyFJrLwHX2J8jkyj6yYkJLlqM=;
 b=JdgK3gB099/HXdo565+1zCUk6tI4Q9UgNPLCorkpCFKKqMR9EMRoW8LerO4j/6p35f
 puxpX/lLhBObSYOkH2Yer9AYcDVxulBLu0klIyY55S1VTiCMGAz9fst5HLsygJO3O28M
 ZfslNWVRiqjWOiSgIKi4r7/gjyihdjuss79IrE2/YUtjk842Lyri7AXT2XVnSkKTRltR
 lTzQRfkiiDR6hI/VEp00Q1G8ZQzxuw47xizAnguYCiT0D49GKOf8fJH27ORJFmvtAJfn
 IfDJu81z9H6WaxIeLYWvGaXx5GAXBq69BY1ptnejYuCNP/ODG3t05P2bKunznV+LzDV+
 9dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOjJT78xBjSgMnGqh8JyFJrLwHX2J8jkyj6yYkJLlqM=;
 b=n9kCU1FqykWVc9mFFos2VWnGw4KZWqhmkZM7i5R77JIqZGKIow0QEhohCU3BcMplUH
 5ZJqr/FGPI4JNwwY4QBenNzxsticL1OM5dQpcBuyVewM0v5R3Cc/oAvFjh6SYcRuMllA
 BMC0osDEVIqhc3rpJIgeLeiG7gmcOv0KqyJId/U/X4kTRtgyKuiATclBt250FuShUx/z
 aYY0jiFgP2UmwEJYswB9X63G3grn3LekKAn/uBTI9TvzmyaFGS8c3T0RyVmi4EayblS9
 75WVErRz5QyICvb782bwq7eFGXeXDKsIGZeBR9Xke5y/We9DKwx2iP7Y64T1on6zV9yG
 0QPA==
X-Gm-Message-State: AOAM530/shHUHr4NxEOQcjV3gR5lGz4ReNKMl2zOYiaUVjtHUNhUGXMs
 0oz22GiDkp6sNd0aoJoQd+8O+3T6vNGS7w==
X-Google-Smtp-Source: ABdhPJwtObMMyp5px3qNUCEtCD81by6w6sovNlsS/+iLl0sOmXvyc8n6onKMWYLSeOGI0juPF6xsDA==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr21826275wrp.381.1630264718093; 
 Sun, 29 Aug 2021 12:18:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id a10sm3001486wrd.51.2021.08.29.12.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 12:18:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 21:18:28 +0200
Message-Id: <20210829191828.2035435-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/pkg-utils.mk: fix per-package build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix per-package build with ncurses and toolchains providing ncurses.h by
adding --update parameter to rsync call. Indeed, without this parameter,
the curses.h file installed by ncurses (with wchar support) could be
overriden by a curses.h file provided by the toolchain (without wchar
support) resulting in the following build failure on bmon or rtorrent:

rsync -a --link-dest=/tmp/instance-0/output-1/per-package/host-pkgconf/host/ /tmp/instance-0/output-1/per-package/host-pkgconf/host/ /tmp/instance-0/output-1/per-package/rtorrent/host
rsync -a --link-dest=/tmp/instance-0/output-1/per-package/host-skeleton/host/ /tmp/instance-0/output-1/per-package/host-skeleton/host/ /tmp/instance-0/output-1/per-package/rtorrent/host
rsync -a --link-dest=/tmp/instance-0/output-1/per-package/libcurl/host/ /tmp/instance-0/output-1/per-package/libcurl/host/ /tmp/instance-0/output-1/per-package/rtorrent/host
rsync -a --link-dest=/tmp/instance-0/output-1/per-package/libtorrent/host/ /tmp/instance-0/output-1/per-package/libtorrent/host/ /tmp/instance-0/output-1/per-package/rtorrent/host
rsync -a --link-dest=/tmp/instance-0/output-1/per-package/ncurses/host/ /tmp/instance-0/output-1/per-package/ncurses/host/ /tmp/instance-0/output-1/per-package/rtorrent/host
rsync -a --link-dest=/tmp/instance-0/output-1/per-package/skeleton/host/ /tmp/instance-0/output-1/per-package/skeleton/host/ /tmp/instance-0/output-1/per-package/rtorrent/host
rsync -a --link-dest=/tmp/instance-0/output-1/per-package/toolchain/host/ /tmp/instance-0/output-1/per-package/toolchain/host/ /tmp/instance-0/output-1/per-package/rtorrent/host

[...]

checking for NcursesW wide-character library... yes
checking for working ncursesw/curses.h... no
checking for working ncursesw.h... no
checking for working ncurses.h... no
configure: WARNING: could not find a working ncursesw/curses.h, ncursesw.h or ncurses.h

It should be noted that the same kind of issue is raised with libxcrypt.
Indeed, without the --update parameter, crypt.h provided by libxcrypt
will be overriden by crypt.h provided by the toolchain resulting in the
following build failure with linux-pam:

>>> linux-pam 1.5.1 Configuring
mkdir -p /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/linux-pam/host
rsync -a --link-dest=/home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/flex/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/flex/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/linux-pam/host
rsync -a --link-dest=/home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/host-autoconf/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/host-autoconf/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/linux-pam/host
rsync -a --link-dest=/home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/host-automake/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/host-automake/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/linux-pam/host
rsync -a --link-dest=/home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/host-flex/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/host-flex/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/linux-pam/host
rsync -a --link-dest=/home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/host-libtool/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/host-libtool/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/linux-pam/host
rsync -a --link-dest=/home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/host-pkgconf/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/host-pkgconf/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/linux-pam/host
rsync -a --link-dest=/home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/host-skeleton/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/host-skeleton/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/linux-pam/host
rsync -a --link-dest=/home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/libxcrypt/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/libxcrypt/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/linux-pam/host
rsync -a --link-dest=/home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/skeleton/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/skeleton/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/linux-pam/host
rsync -a --link-dest=/home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/toolchain/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/toolchain/host/ /home/giuliobenetti/autobuild/run/instance-2/output-1/per-package/linux-pam/host

[...]

opasswd.c: In function 'compare_password':
opasswd.c:131:21: error: storage size of 'output' isn't known
  131 |   struct crypt_data output;
      |                     ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8c0d13e3cc3ddd2a21f99477cad4e39522e9deec
 - http://autobuild.buildroot.org/results/d2f18ccad6a0330d78e97d70c810ac89b84d2261
 - http://autobuild.buildroot.org/results/24038989d4ab962c9abea5cf061345f17a57c688

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Update commit log with libxcrypt

 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index ae3c7f9da9..5af34d4ee0 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -184,7 +184,7 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define per-package-rsync
 	mkdir -p $(3)
 	$(foreach pkg,$(1),\
-		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
+		rsync -au --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 		$(3)$(sep))
 endef
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
