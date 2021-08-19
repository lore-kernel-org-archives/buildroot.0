Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76E6C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 22:19:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88C9F60FDA
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 22:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88C9F60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51312400C3;
	Thu, 19 Aug 2021 22:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RbsfyA0U7E8E; Thu, 19 Aug 2021 22:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B6194010B;
	Thu, 19 Aug 2021 22:19:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1E21BF866
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 22:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87E73607A1
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 22:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0c8v4yOsUBO for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 22:19:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0647A606E9
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 22:19:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l11so11248207wrx.4
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 15:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pg43VBDqA3o8iF3upWbkQ6CBGhKOY+qw+eESKN6A7yQ=;
 b=OfEVC5GiicC/MOoRwKq/KkMn8tbKv9qqIYgDh0Pq+RqeTPBNT8iZeH5DQRpfjbJq1w
 moqk7Uu860epOyogUQeN3sknhsxZbYGluYm2j/mEoP7GY/MIdZF4S6/++IPNw2wBQQWT
 VKo7Cvwtvg4yfFxL9b5P7OD4PFKPZpqzDsAJxcyd5HMGwNWx3MA/rL3rI5+cqbaJdo86
 x0Z8biLpusaygSFtKMWpUwQf4G3piRVcrNxEdvCav7EkJYYzJTDRhKG17HpWKgAv0cqb
 IQGwWYts+NuFb0bQ9MlmSg/R3tCkvW1bR1p8onLz3dCPBudSv0ypXHnivSTJiXeE0dVq
 jyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pg43VBDqA3o8iF3upWbkQ6CBGhKOY+qw+eESKN6A7yQ=;
 b=Zyr7UmWGyFuhBi/HeiySAqgJq0cz0XCkCYlROMmDrQlvRor+7HRr2KksTEB/cvAhV1
 BR/A8liKUpBg5sos8cIBQ1iIV5YnWJ8bmRybswIFIt3CXHbkXONgevgc8qhcuVub3VN3
 Mu2Uu9bgJiXwt34tOUghDr/N2RTlXy9O5Isp6eDJkRS5LEK4inJp+R7qW0URbR/L9t3s
 W92+NwmVi8Xcellq4UhA0PFHYq4q8Lx2QKuhVbkrXGgKQm9n7qIVC4ZKhGgO+v2JHeSy
 i3URkFD64gecYUPwmyC4jM6YheskNHoWLZ/dDsXgHwsIpOFsynQJuJwXJLEQ7nK/P0GH
 KWFw==
X-Gm-Message-State: AOAM530eBmuWLlLnDFjxQc8a/mff3oT+bbPkLFQMASU19hcmeO//hsh1
 6uxxvH2TEdQyOPGfUKWfWalTNsfDNg1zWA==
X-Google-Smtp-Source: ABdhPJwBhEQZUWJErG403bkmWSXvync+TrLO2irofPEKuBXyV/MnuCSmsfPAcpmBq9YwqNs0ShqCJQ==
X-Received: by 2002:a5d:4b49:: with SMTP id w9mr6399365wrs.242.1629411572140; 
 Thu, 19 Aug 2021 15:19:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id a11sm4144489wrw.67.2021.08.19.15.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 15:19:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 00:19:29 +0200
Message-Id: <20210819221929.99687-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/mpv: fix build of vaapi with egl-drm
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build of vaapi with egl-drm is broken since commit
6ec47c4e59c7c8c57e972dab985c8a2ba0bf7174 because egl-drm is a part of gl
group which is only enabled if BR2_PACKAGE_HAS_LIBGL or
BR2_PACKAGE_HAS_LIBGLES are set:
https://github.com/mpv-player/mpv/blob/ec0006bfa1aaf608a7141929f2871c89ac7a15d6/wscript#L572

As a result, despite what is being displayed in the autobuilder log
message, the build failure is not related to X11 but to the fact that
we try to enable vaapi through egl-drm but at the same time, we disable
gl.

To fix it, enable gl if libegl is available as gl can be enabled for
example through wayland and egl (gl-wayland):

'deps': 'gl-cocoa || gl-x11 || egl-x11 || egl-drm || '
+ 'gl-win32 || gl-wayland || rpi || '
+ 'plain-gl',

Fixes:
 - http://autobuild.buildroot.org/results/e5c15228f42a73f8c34b26630b2074c30e5f5966

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Update commit message

 package/mpv/mpv.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 91e31dd150..f8ecaeb78a 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -148,6 +148,9 @@ MPV_DEPENDENCIES += libgl
 else ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 MPV_CONF_OPTS += --enable-gl
 MPV_DEPENDENCIES += libgles
+else ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+MPV_CONF_OPTS += --enable-gl
+MPV_DEPENDENCIES += libegl
 else
 MPV_CONF_OPTS += --disable-gl
 endif
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
