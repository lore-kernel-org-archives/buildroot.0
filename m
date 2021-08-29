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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15910C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 18:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A062260E73
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 18:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A062260E73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63E7C80D98;
	Sun, 29 Aug 2021 18:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RayzshZ9wH23; Sun, 29 Aug 2021 18:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6362180DAC;
	Sun, 29 Aug 2021 18:40:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1CB21BF369
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 18:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91788403F5
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 18:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8zNPu1O_FDaS for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 18:40:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A6C0403C7
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 18:40:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso13103311wmg.4
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 11:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RiOjsWuZ3x/JbKxeuWW+3H0mN0OY44ULJjkpFzNUL9I=;
 b=ZJG0wFvJKRl9kBmsco3pXlDJscRMQrsjDog9Cnb+tWxMh4fh9xfMqDIjACbPakvjSy
 xSSPYGNIzUPxbbhS9LvDtxPHxs/oyNb7AUfzN6m2IoU8ZYubvJvmwSBoqPhU8pDRKVI/
 G8DozRkvHn6mhJjGtmzawhjLnI6V0ae3M3EbVoRwm6Th6ngZiVnPMRP8FFwIDkWZiSgt
 VijW2i6ApIohT72VHxwQGMkrJe6oD4sfbNMvcZEPszFw06ymqDzhS9W9soYgz5eHPoVJ
 kzVrz+Pb1f7fL7OlwTF5Lf6IuLUAPVIjgBaV9YIeGCBdK5/86bj3HQ47GhlZX7vZY0nr
 EFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RiOjsWuZ3x/JbKxeuWW+3H0mN0OY44ULJjkpFzNUL9I=;
 b=QokqGLIZhLT7dhAWdyVPq7DKFuQdVSJeagGQo5DknMe9tJEG/JSACKTdEI5N3x3zVQ
 A1XzhrI94kMaDV0DPWe/7aPSFE8E0uKIhaBODaXmJ1Ps5lIS+Hu3wUVXwW4+cZmb6Ks9
 ouia9zt0MWLznNB5FfZXT1v5ANT9bWdXVw0aaCWyW/a7Kdy5HL9sP6+nlpYnaDcn+jzh
 JFcY9NH5q8nsZG1cZfCBa9DMAurpdxjhkIAQ9Pixn9VEAV8wXZaVT+Z95Qpc2kvRwWDY
 mJ70WQcF7s8kPTANcq1yCx17a6T/xeC0aG2avk6X8zf9WbFDSLPfgxoaQYcDkV7b2h8s
 bVeg==
X-Gm-Message-State: AOAM532vjLm8r9FgFDlK0rNJPAOhKb2vZY+BcOtW6dMXGlz0KjiV7XuC
 pO8TUc0p8ihcS5DnsadTxQNyDmICansECA==
X-Google-Smtp-Source: ABdhPJw1LsFB8/UhZBXaMP/8PhWEc5WHWlnxrvzlHOFfhc3A3JRcCdl0/P4rrhsPhYJYfpzHuMRRiw==
X-Received: by 2002:a1c:491:: with SMTP id 139mr20071492wme.137.1630262401875; 
 Sun, 29 Aug 2021 11:40:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id r25sm13873780wra.12.2021.08.29.11.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 11:40:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 20:39:32 +0200
Message-Id: <20210829183932.1737738-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-utils.mk: fix per-package build
 with ncurses
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

Fixes:
 - http://autobuild.buildroot.org/results/8c0d13e3cc3ddd2a21f99477cad4e39522e9deec
 - http://autobuild.buildroot.org/results/d2f18ccad6a0330d78e97d70c810ac89b84d2261

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
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
