Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CDAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 16:01:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B74060FC4
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 16:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B74060FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E23588264C;
	Thu, 28 Oct 2021 16:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfM2rbDsqX8l; Thu, 28 Oct 2021 16:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49F7182640;
	Thu, 28 Oct 2021 16:01:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00B561BF83E
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 16:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F19CC82640
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 16:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHDL3kC4j_sJ for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 16:01:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1224E8263D
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 16:01:40 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso626002wmc.2
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 09:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ac4n3cW9lt3wsAb/jH8zMuDQVa4Qx2FgLcJU7otLg3U=;
 b=ZxF1kuGaFCRPP9GX6s7+HLjPOtKDrZcWKP6QNPkn3LcQpVeQxZGk0K0UYCRsb6f4/o
 02PuG1TwnPVQJu21POfJXf/FLh49+vkkhRJlz1oeJWSZnUKX4DNJMzBmHdnKj0y7ZpYF
 BhHzr0Wci8498OrzyMPOUP35b+oo2H39czOWO9TvXo4IHylzflyutVz9v+xFO3vNJkGL
 Sh+vSaNFVeILNvSabkCj/FlAWPyaFm854YTYeBGDl4NIQgn+00JcC2zuVc1M/jb7cSsA
 uStP7Elg3uPBv324/qWABDwNaup/EXLRuG5UadNe7SWqd08YSMT3/q4is0cHmXc/B8Nx
 U3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ac4n3cW9lt3wsAb/jH8zMuDQVa4Qx2FgLcJU7otLg3U=;
 b=bIW+h5T0NBXwJU6KbZDWb4gkDGxLgp24al696pCcIpUlEBK8vr8uqXIQJlRs9pBjLf
 kCGYANCI61zOkL75lqNU4iXA9iOKgijkQVIJ9PYe/nTzD5p3QihuH1V+/B2WuX/IWLQH
 e2sVrAMjhvTmn+O8P1T6uK9LoSxXPngfHC0P3bAT2xqTr52wS5XkBwt8uAewxPSREx8A
 m42KIWVrh/c/Gs+Zzwwk96wi517/sqr9rnIRjOUiLe3sPBgr8XDsAMkqJ5YD4Z/Wg1XE
 fzJ4vKouXJnfqggr1EDl/vL7rZbOVQWNAWYqvrqIcQbmfDqUYRS8JYFZ/0HgQFzjTL4Q
 GxFw==
X-Gm-Message-State: AOAM5306Ll5Dpr6FIirDyBefEKzTiTnE2ZJthnDQ/iftxXZ8k9Q3h+O8
 AIDdwwbHqz8eg2V6bmg1rSuVtToFpS0=
X-Google-Smtp-Source: ABdhPJxYfmG1KCSMicSEOxOooqBaBhuaMad2+Ub7gUdpJiM/V4N/yC4rkNHUfpNyhC8jdUS3uGwx9g==
X-Received: by 2002:a1c:4b0b:: with SMTP id y11mr4368379wma.9.1635436898967;
 Thu, 28 Oct 2021 09:01:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id k8sm7083884wms.41.2021.10.28.09.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:01:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Oct 2021 17:59:38 +0200
Message-Id: <20211028155938.1116414-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: add xdg
 SELinux module
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

xdg SELinux module is needed to avoid the following build failure raised
since commit 5220d3c5c62df35e994b4b7c6caecc8d16e72b78:

 Compiling targeted policy.30
 env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 30 -U deny -S -O -E policy.conf -o policy.30
 policy/modules/services/xserver.te:116:ERROR 'attribute xdg_cache_type is not declared' at token ';' on line 632811:
	typeattribute user_fonts_cache_t xdg_cache_type;
 checkpolicy:  error(s) encountered while parsing configuration

Fixes:
 - http://autobuild.buildroot.org/results/a1222d4ba0abf104dfc4a3dfc3c787e843fb6124

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 2d276f90d5..57dcbbf46d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -9,7 +9,7 @@ XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
-XSERVER_XORG_SERVER_SELINUX_MODULES = xserver
+XSERVER_XORG_SERVER_SELINUX_MODULES = xdg xserver
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 # xfont_font-util is needed only for autoreconf
 XSERVER_XORG_SERVER_AUTORECONF = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
