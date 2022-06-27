Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97F4C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 07:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71095415A9;
	Mon, 27 Jun 2022 07:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71095415A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id riAiJw6Lvkub; Mon, 27 Jun 2022 07:33:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B7C741522;
	Mon, 27 Jun 2022 07:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B7C741522
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DCD71BF3D5
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 07:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0993B6103B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 07:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0993B6103B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6BMb3FqfzjM1 for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 07:33:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D0E961038
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D0E961038
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 07:33:10 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id h85so8697082iof.4
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 00:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KgkMDfOLrWWYERd6NGVAnPi4M2BU0lVxIM5b0CEsEAk=;
 b=aefUlfATu7bZQNXDascboKgEwEgvbChVh1B5b122CBRO9IR2UBgILFYzKLQgSQXA1C
 kpJoKUZNi/ONRWemPRz3JjeLQ4LjVzhAdxHnA/yKsBgcPcxQ8glJtNdpayji9xiioAes
 P0p3vq7UjnM5ZkbIdQiyIZ1cPsFAvtQAdOmnT0sC7LAMDAWrv6nWyo5CzfzfwjQ9Et3F
 XRzr9/Q31N7cCo8GcN6vXbF2PBdnrsAcqotZQnDlf6UnEeUu+KAAH4A8t7JGqlb57DJs
 8bBosjtpDzDMG1sAWsGkTFDfEQ59RZN+fiRkxEdvqqgBncmdDNPoj1OVAX5GfnsEtn+s
 rLAw==
X-Gm-Message-State: AJIora+eubvdwwyPUY/seqqgAS1JS2BfprzChosph2vUbK+crWbEYS55
 FYKZsQiIqeXjQjdzhXgQ7bpoHT0pxNc=
X-Google-Smtp-Source: AGRyM1vN4fZyKuN9bi+8Xjz9SjaVKjrTciajepH6uyQmi4EUElY4HPnlOQzAPipuQ21Vdt/FdbsbYA==
X-Received: by 2002:a6b:fa13:0:b0:64f:d480:30d3 with SMTP id
 p19-20020a6bfa13000000b0064fd48030d3mr5869625ioh.179.1656315189052; 
 Mon, 27 Jun 2022 00:33:09 -0700 (PDT)
Received: from james-x399.localdomain (97-118-147-20.hlrn.qwest.net.
 [97.118.147.20]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056638110400b0032e174e945csm4397890jal.32.2022.06.27.00.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:33:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 01:33:06 -0600
Message-Id: <20220627073306.2673751-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KgkMDfOLrWWYERd6NGVAnPi4M2BU0lVxIM5b0CEsEAk=;
 b=oPrGwAb0bpDMuH7wngK6eq/aDYxbKq2WoAsbQXANpKOqQgQcSgVOkmEpZZePssJcaZ
 cKBQsLLonaNLmt+gPVY2XYsYiCg6ikkBiayxuHoEnCkmCV6e6lcmb4kCsLQEljYI/FeG
 jWcpqFdFHahY+c/L7f3nnXirjgG6f80Ej0H0Zj43pqL+1L3pZqBTdUJ0qVMdnqfb4My6
 eFnuAnIoDKLnnEue0y5WoVzlmvPNxoWgKAgqk0d5gDmRoET7IDm4rndx2PPKi5SVidcs
 37n/9eMvGvbdoSyIkDgmcECChTQcO/tSTSoxhf/XwHzR9Q0tQFoab7SHU82ufBda2TAI
 bYYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oPrGwAb0
Subject: [Buildroot] [PATCH 1/1] package/{webkitgtk,
 wpewebkit}: select subenc for multimedia
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using webkit with multimedia support the subenc element may
be needed, as such we should select the subenc plugin.

Fixes runtime warning:
isGStreamerPluginAvailable: Plugin subenc not found. Please check your GStreamer installation
WebKit wasn't able to find a WebVTT encoder. Subtitles handling will be degraded unless gst-plugins-bad is installed.

See:
https://github.com/WebKit/WebKit/blob/72b59ad50e079037073722bbdf469c0952e399fa/Source/WebCore/platform/graphics/gstreamer/TextCombinerGStreamer.cpp#L221

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/webkitgtk/Config.in | 1 +
 package/wpewebkit/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 2575108363..2219aa353e 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -97,6 +97,7 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index f50e0da21c..fac7672939 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -90,6 +90,7 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
