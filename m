Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF71C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4912640127;
	Sat,  8 Jan 2022 17:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLPm0Q14UzBJ; Sat,  8 Jan 2022 17:36:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4374D4011F;
	Sat,  8 Jan 2022 17:36:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55C991BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4494360A91
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6azihsIyquKs for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:35:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91894607F9
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:35:46 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r10so10103464wrc.3
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 09:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D4pQ9+ztnPrnfbszog+xP+Io4rT915ahNgvZPx0hfTo=;
 b=omb3cNk2FaDzd107NecZP6iZ0w9eMjfdPplNJMI8RAfzztUf/FXPHGCRbMJpmUDiY2
 wuuVVC40J6kn45VHpQPPz2ZQQKUJ7MGvVjNQ0zcetTYy0cFcd9Vw/HAsoJG4C2qXWsXd
 cs92DhxDTMJ8OHUhdUPZ+anszH7APcUWb+VcUV8jzi+1B7yK8egtnhdQ3O+uPPRyRzUm
 MWlM3SNK1Qn+y2LdD99kbNjC1j0kVpmoOMbMeAAbP9PbHUhcoE0KU3Qtkm0ReBCMbHsN
 RuKzOmO6iLn/zwC6vizCKMPKOvcbval4tK5UX42VJOZ/FrfndhBkSIJmZmQMvQQO/exQ
 /tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D4pQ9+ztnPrnfbszog+xP+Io4rT915ahNgvZPx0hfTo=;
 b=rVF8cex+AIyvNQTjZenuswWbZFPM1MpRChc3UpOiXMh2Fv08OxEXDDiLClCH3PM1WX
 T0iATICtNXUTrfQNjZ3MYUoRzkdQJcdX+NnAdatkOtfNx8G6L2n5gKNF4YEFxaK/j4kD
 HJBqNK6tqBrLYCe0AR3p0syjycIodW+35YB0JEXJa5rcJzMxvoLmr4CXNG+e9+lEFwvV
 27clYuEfiI80HIjqscVOXCvdCoCsg/EXKaaj0YjYbdTCO4pk1jcdnda15tSNU82flKcN
 SL5y00/ilI5sxHZTwapvpmVlW/fih1EOUAaSfavcxU12SU5TOAEM7tFYEdOTrP6xwTJT
 9EyA==
X-Gm-Message-State: AOAM53088/3PwP9kQeDUoBbooc6uUbKc8FAuKBwV1n0NxZSqVyZe7AYe
 5+MSGCztg20pGdKBKn9J4R+/BOHOEUM=
X-Google-Smtp-Source: ABdhPJzJRcHXL4Es88IQuIzESg0VHBlPuo0DkO9RYEWDVvTaEqrqMostY/lAgVWMkiRf0+qX80gNiA==
X-Received: by 2002:adf:d088:: with SMTP id y8mr5241559wrh.694.1641663344958; 
 Sat, 08 Jan 2022 09:35:44 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 by smtp.gmail.com with ESMTPSA id p5sm2136752wma.16.2022.01.08.09.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 09:35:44 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 18:35:42 +0100
Message-Id: <13e59bc22d9299b2f829d541c1ecdd995f583f95.1641663315.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641663315.git.yann.morin.1998@free.fr>
References: <cover.1641663315.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] core/pkg-generic: apply post-prepare hooks
 before monitoring directories
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Monitoring the target/ and host/ directories and so on, will serve to
generate lists of files installed by the packages. Those lists are then
used to generate graphs of the size those package take on the target
for example.

With PPD, we will also want to use those lists to only copy those files
actually installed by each dependencies of a package, recursively.

Currently, those lists are not entirely reliable, as the starting points
are established before we apply PPD fixup hooks. As such, at the end of
a package installation, fixed up files will be found to belong to the
current package, while they were in fact provided by one of its
dependency.

While this does no big harm, if at all, for the size graphs, it will
trigger overwrite detection when we eventually gather packages together
to aggregate a PPD or te final host and target. So, we better have the
lists of files be reliable.

So, we only start monitoring the directories after we apply the PPD
fixups (or seen the other way around for a smaller diff: we apply the
PPD fixups before we start monitoring the directories).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1022062bcf..b1f4d219bb 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -273,11 +273,11 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call MESSAGE,"Configuring")
 	$(Q)mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR) $(BINARIES_DIR)
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
+	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
 	@$(call pkg_size_before,$(TARGET_DIR))
 	@$(call pkg_size_before,$(STAGING_DIR),-staging)
 	@$(call pkg_size_before,$(BINARIES_DIR),-images)
 	@$(call pkg_size_before,$(HOST_DIR),-host)
-	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
