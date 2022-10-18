Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B257C433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 03:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 773AE82A2E;
	Tue, 18 Oct 2022 03:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 773AE82A2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_nNRodubFn6; Tue, 18 Oct 2022 03:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A62D782974;
	Tue, 18 Oct 2022 03:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A62D782974
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0C221BF2F0
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 03:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC2384061D
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 03:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC2384061D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nyz-y1zfGhiI for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 03:46:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0806B40133
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0806B40133
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 03:46:08 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id q196so10788559iod.8
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 20:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=41MvAtTcWJBRucmjTftYCM4nNUZ8MhvJxXEokBVBLRc=;
 b=Kw+vmGYcl6F5GSO44WqGCzSJ7O3DIcOi2tNggOVzza5zM151ByIjbZc4S5hYVIQdo3
 FERWqIQcj+nN+YDINCpn0+7XSd79+e9o5pUKPiiNau0Q6yQRgCSLj9S0hTNuQ1RIyYKN
 lXNSr0Bb2ZxjBQNT0ZA9Z/v5I2O/4mqu31T2EZFoVVbUKuUYbt48BU2oAQDHLvTClZhg
 GoI0gV7VAHciwHNXVBqo7G2Y+bq7UlWPEq5W/PkGhngrOVTrJSswYDc+HWvQ+OYC0lyp
 84BCw0fPKtL79ZBVelWEN8bp1FFQLcJdy44m0P7PbiVVfFy+IoXzOtdB6dSYWyVdBk3l
 iIWQ==
X-Gm-Message-State: ACrzQf3v61Alj3sRRwomfSazMZHekGV/7MIdQnlQNyVDIa4Bc4NYAsBe
 2XFojNgI6UW8OXjbZz9fi4Jcxgp3SLU=
X-Google-Smtp-Source: AMsMyM4pYdajlkoDJ0IFZDLXqpVRPFCat81CKKfdz6SBtTX/7lXWp723vNAh0g9j9h3OR1rgSYT+aA==
X-Received: by 2002:a05:6638:144a:b0:364:5a1:d54d with SMTP id
 l10-20020a056638144a00b0036405a1d54dmr901499jad.42.1666064767626; 
 Mon, 17 Oct 2022 20:46:07 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f10-20020a056602088a00b006bb7764890dsm622556ioz.45.2022.10.17.20.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 20:46:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 21:46:05 -0600
Message-Id: <20221018034605.800593-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=41MvAtTcWJBRucmjTftYCM4nNUZ8MhvJxXEokBVBLRc=;
 b=DIboYGLDjT5xcUorVea+MAak6peKYLC1pKj4WBvAEK+AlImOqZR0FZCH25lI7LGWMc
 sl0JPtrjgFvFissNzUTlqYS/RS0DwO02oyNXz3VSswGGI7AwM3emiQOujt0tAkNN89fD
 MjwThHOEJhMwSvTxD8Kb7wWo0Je/sttkTr3GZESnOGVUlpdNIkHK8x8xSYlgqDePI5GW
 xpY/ZzASb7VSjeWZyHKRQHs1NrIm7/e9uciA0Q7pU5Hd4smZ/knsev0mO54ttsKusMCd
 Mm+CCil4SbHqZYzv3854De6/9xRvNb2z7vQeOcEN+q4qXNYZ+JVlQLHjoNe3NFAbLH7k
 Ce1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DIboYGLD
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix rule order for
 re{install, build, configure}
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These command rely on the clean operations being first so that the
stamp files being deleted will rebuild the targets.

The execution ordering of the clean and rebuild operations may
change, for example if --shuffle=reversed is set.

To ensure the evaluation order is always correct use double colon
rules to make the evaluation order explicit as per make docs:

The double-colon rules for a target are executed in the order they
appear in the makefile.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-generic.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f24e03a325..6cb461af90 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1057,17 +1057,20 @@ endif
 			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
 			rm -f $$($(2)_TARGET_INSTALL_HOST)
 
-$(1)-reinstall:		$(1)-clean-for-reinstall $(1)
+$(1)-reinstall::		$(1)-clean-for-reinstall
+$(1)-reinstall::		$(1)
 
 $(1)-clean-for-rebuild: $(1)-clean-for-reinstall
 			rm -f $$($(2)_TARGET_BUILD)
 
-$(1)-rebuild:		$(1)-clean-for-rebuild $(1)
+$(1)-rebuild::		$(1)-clean-for-rebuild
+$(1)-rebuild::		$(1)
 
 $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
 			rm -f $$($(2)_TARGET_CONFIGURE)
 
-$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
+$(1)-reconfigure::	$(1)-clean-for-reconfigure
+$(1)-reconfigure::	$(1)
 
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
