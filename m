Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E217FC982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A79DD60DFB;
	Fri, 18 Sep 2026 13:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2XDY9IbuAPa; Fri, 18 Sep 2026 13:07:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C7AA360DD3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736852;
	b=IVHBJsKIWvaEP7Unr43rR7m5IMoJKnN6cH3xyjXEVR2mKCNTVzvsfXvrYWsc3eQqI45N
	 zamsc2SeZDqPkAJyA4ncyc4478Nts6Xp+Y9VHDLIRLv/z/4J/hO/JjuKVgvOt22vdkyQL
	 ZP36+0y/A7MjtS/LAx/BpvlslqnVi4AcIie1bVOFxgMEzNwH1RLepUtG6nylVbngjudiB
	 vyiMuaWair1uTKdCDhgSHd2pcUv9MPUUwhRUgWx+fk7Miijc6EfCVyWbLeYt2TuSSUuPU
	 OaFyNCzU81n5VG6vr6bue1DXOTjiDCXk0sbgE7JbKX2LJdouxenofo9Wj8oOKhq0YgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736852;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sC74yfRuiZhj2Xeiu07i0CUWBg79iNBcHBQNcy6zYH8=;
	b=NuAusbDOvELhVZ6JTe4ouZHms/SzvPfNeey7BXcYHyA2VaMmHLHfISXIo2FVUPPW5Trm
	 rdpuIX5JU/3mq8fxjcJSIFg4WiI6AFSSAuEWNIvRrNVf7C7el7a+810k4bSI1KyEHSpWo
	 qtwMogSGSALL2X2szF6cPc51poZiUMT4Ryh21VX4GtQggt0/zbEQ6UEwYa7PvkercV4YK
	 5o7c2Dk5rxMDOtquDUxeI13ptXe34jTMo2QwVZr5RNpICle1AP2VJpXXsZDWOG+Mak0x+
	 7FFoZFzuME0l6xDkFclInJAy8BL7LMrefu59sgYbuMK3HLiptcz+Zyz6VShfGM2o/Kg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736852;
	bh=sC74yfRuiZhj2Xeiu07i0CUWBg79iNBcHBQNcy6zYH8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ok+xi/HAIWWcJkF+6GKCoUr9AiK0/IIr4k5yvFWrnicvQ4xyA0lrD5hBTF8SQrbIy
	 /Fhi1xBwKluYRZAR+DdsDeRpvxaN/RsPcbmuuod7vElM0p2RqORwZ057zHTk+DlN5A
	 m3GtdAvfJYus4L+LL9V+H/XZ0gp5gHg6wVwiiCe/RnXmav4uvzo/AgBwho4GgrkggF
	 i4KgRsNn6fVMRbgZpD9T+6DUgtmcugJekQFLfHKaB5Jyqr1IE/9nQeP9Fz8i+1KRFw
	 k5n/mOznYS8e9Zbk2sRbn1dpQjmHzabQoi0vqd7gBc5vlw5CYZHyMIbGVvdEJQbYbJ
	 PYvXjOD0Ha5+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7AA360DD3;
	Fri, 18 Sep 2026 13:07:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FB6D1FC8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 364A840B90
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TiCROh84ev_m for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 78E3240B9E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736812;
 b=Vdu+10U+QrnnZzssnRWN9uqjptvM9/225/qDk6v/rEmyXdufEpnFAqMa1vBupR6fsD7i
 eGuu1lnXGpwYLXoQG8Q+MDDXZY5k/lfHboH2i1GZpdq/tpfy9yeB0Wtp+hkZvL3skB+ph
 7tOKvqtlIYlbrnLOPPbre1a8QqpPNfwGCCKXSFyyM0/9svbzZSTbdLc40bPjA7Hwp04d+
 yjOnmt0dp92X1+jBZoW3cs0s1Pwt325py0SJqVflW0O1jcQOz0f8WNlfGqJmCFFQCmiMq
 w3qxRuFdQ9n7HUv2LDzzwsSmo217PpuQbI0ZdTEakb0iLzWKiYqKzIYFg4ykWe1762w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736812;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bvRt9rmPmxFNYwuZl1iHg8vdMUybVaW+Th1zVB2A2y4=;
 b=dihpXxV0YDeBHWSE+GY1E9yRTbKXuwX3XOe4I0WqXhmAHb0h+tIta4GxB2EUr8aawazm
 BTpdOqAKmLtFZOtAASCQsD2xeddqX6h+kEPDTp6Zz3haHdEP2WtVMCk/AfHhemLo2J1Kk
 XDYY7Rm2Njkj+W763QSw9s31AQBKqCU6A/8XxC+ICUr0bIOWiniuEuprZx/k0/U2dkmPh
 iJLL5EwUsVtuM/e6Ci4PidwqlzjM8t7yOxLPi8mbRXAhea2A/zJqGtk/ZW/Uu4EZbUeXI
 kfTXKYIO2TiddfCcofqeT7SDNfJjBY2nzPsGvXtX3lP7h8o7sPWr5h4FJzkgcKQOiYw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78E3240B9E
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 320999718A; Fri, 18 Sep 2026 13:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 12:19:26 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b65a2ca6efd75f8af99ea6caa2ed9b0cfb3f8c64
X-Git-Newrev: d0f4c12dd1f9540deb5d05eb0d40d46cc795804c
X-Patchwork-Hint: ignore
Message-Id: <20260918130545.320999718A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/ivi-homescreen:
 add missing BR2_USE_MMU dependencies
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0f4c12dd1f9540deb5d05eb0d40d46cc795804c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

- BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS selects gstreamer1, which
  has a depends on BR2_USE_MMU, but does not propagate it

- BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN selects
  libsecret, which has a depends on BR2_USE_MMU, but does not propagate
  it

In practice there is no problem since ivi-homescreen depends on glibc,
and glibc doesn't support any noMMU architecture. But just by walking
the chain of option dependencies, this is not something that is
theoretically guaranteed (making automated verification of
dependencies difficult).

The other "depends on" from gstreamer1 and libsecret, BR2_USE_WCHAR
and BR2_TOOLCHAIN_HAS_THREADS are on the other hand already handled by
the top-level BR2_PACKAGE_IVI_HOMESCREEN option, so there is no
ambiguity.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 90aeea08bb685ac38b74799d830aff4023698cd0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ivi-homescreen/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
index a4f5f6835f..d7cc4ce04e 100644
--- a/package/ivi-homescreen/Config.in
+++ b/package/ivi-homescreen/Config.in
@@ -187,6 +187,7 @@ config BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN
 comment "plugins with external dependencies"
 config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
 	bool "Audio Players"
+	depends on BR2_USE_MMU # gstreamer1
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
@@ -201,6 +202,7 @@ config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
 
 config BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN
 	bool "Flutter Secure Storage"
+	depends on BR2_USE_MMU # libsecret
 	select BR2_PACKAGE_LIBSECRET
 	help
 	  Store data in secure storage
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
