Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F74C88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01FEF80DDA;
	Tue, 15 Sep 2026 17:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvZMkiH2T8_Q; Tue, 15 Sep 2026 17:20:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2266D80DBD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789492831;
	b=mVDb8Guvfdp/+q2PsgUJPG3GwNCuoimXjIYpTHisGKH5NXM73SIa2zEOISWJqnTQftgz
	 vs4vUQqhuckjUmZF8xYfk8pEvd2WnrLirg7lKDPVuX9nhnGy/KARn9E5v+mp70FzQhEpi
	 NJRZ6KeoRJmNW8TWdJ8USrclYq5ac+y0zc1UuSIU7mq5obLEsVHpYa90ICYw0dL8l59Ak
	 PrHO4em9ISgbn4EAP59hJazsqstytCRHy/fVvx/qOwbyz2VKbUJ2KO5aXAFQ1xujz4GSo
	 smoQL0/f93LQglUyxHvcRqsgx/M2d2n4DbwxutrOuT9aFb+j+66iG+9brokztblXHtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789492831;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2zQ3Cyyk7X+AykL8Uv7JpU4P91lD5DyX0qXBZSozDn0=;
	b=ICHsWTkrz3kCiLSovDfZAsTRg93dyceADtE240f0L/Qwwqqgc8MCqFFskN4S8v3UgE1K
	 WPPe26c89HvqhhOBOBDB6bUse8CWtGecfjOj2bCNYX1SdAzTbqf8K1YokvYRI/2hB+lix
	 G4Dt8hh3JRaTJeTSqW8iRIFhvTJVBRGI26d3vIospVCKtmz0pW7iBsEVzfBsZJ72Q55z7
	 qlm/LKpBVJGUTIo864M9tDZziN/cDWY7IgMKGU7l9PEnLcIW00HMDHsd5cQwirS/+vFwK
	 ZGoykBo3ue0FrGxoIeAy6Oa1irCh7Q7HMlroirtPPSrnIuhed+IIdq1QsgmQUjy62pg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789492831;
	bh=2zQ3Cyyk7X+AykL8Uv7JpU4P91lD5DyX0qXBZSozDn0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qipN/fl5zdyagXaQHr1cp4u6NKkXL1sn/smbHX6BwuONwNrQYPIQ8OqWN5SWILWsG
	 LrtvHJxOI5ZeG+F0nFUophiqo0OEwf5p6chMGAB9vLUxkT/17aeXguGvBr5CUTiyJQ
	 N9kWh5jP0QNy1gmvWK8/m08cbOnVl4Lwj5hkUPf7CJh5cF9mLgwplutDBYEqQqcIPP
	 W440z9ksDAjGInwF36Ohgc1m5J2Bm9j/TMeNaoH8iJ5KU2PvBYSWZ65AAocco/E8Lf
	 8sXIh9XUWrz7wo/k34kNaitWd2NyBqP/TH4WKe5lH5BiNsFxxyGcVjxEiK0oRFzyog
	 ll8OaQ33l6mxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2266D80DBD;
	Tue, 15 Sep 2026 17:20:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92C372D0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 903F480DD6
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEbUQ5LNbWCl for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:20:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7AEBF80D45
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789492828;
 b=fHx21pApHUWIRI44+JfuGQllQqmh2cPqdP9ezcyQBI3xtt1ZfdcodfVZhuLQHMGVsXDY
 mOzg0AWUGs0z881P9yuuPg4EkE0GF6Uc3UeJxl1FE005Kq0YJZbqbmvp1b0ZPTyuq+Uyj
 RxDjS7Qrk5Gso8nl5xn3vTAUAKY0patObj9+2z1oxyM6R4diTekBKWrx1qaFGfWMDi+QI
 p9P/zuNgjuUL283GYLGZ6tGyG5NeKADhyeJ0ATvSTMchP5oCYPEZTGFrE0ekgBwzfDIVH
 GGahpFHJm39S8exKeLxZ0cDRj7iCWnt+tEj5MBEwnjBDNnoyKvIknwm701GdT8JiQPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789492828;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Nm+4HP18gO+BiUEZ2/kVuHYh7wcuxZvKuxmKO/iWiuE=;
 b=pxLosWwzO+IF/SrK+NRsFF6sqoWOIxW1OuVZ2Tf7j4vaFN0QFIaPU0FSDdpfGX6mfg/c
 +O9iyYW6vGRQBjb4CeY/PZHMQ5gOSyrFluhXFGG1sLBvi0/+ikv97wpD2rUrePEIhTuFY
 uHd3IlG/i/9TuStADB1haUixxP8BdOBllEC5sHMU9EwkywYmlkxOiqu+weES3hHED5mrv
 mzhu1eMy2b8EjqJa/DIEh/Itusxk4yuJ2/EKcBDeDSRGNZaFLwYHzHluFGElpNLiHKXnI
 sLQdbCAX0aA48593T98liVvDtEpMi3SFtn/C9kP1lUdkDYam4v0tBpFWkejPSgObQww==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AEBF80D45
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:20:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8232795D67; Tue, 15 Sep 2026 17:19:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 19:14:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 592d5c517ef6ed003450189cf0c4d7af8801de59
X-Git-Newrev: d64b05108c3cc8426a079723a3b73b1f791c8125
X-Patchwork-Hint: ignore
Message-Id: <20260915171922.8232795D67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: fix
 dependency on gcc version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d64b05108c3cc8426a079723a3b73b1f791c8125
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the bump of libabseil-cpp in commit
76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c, it requires gcc 10. As part
of this commit, the webrtc-audio-processing package was updated, but
not its reverse dependency gst1-plugins-bad. This commit fixes this
issue.

Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 45a8a44077..0586b7f327 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -674,18 +674,18 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	help
 	  WebRTC echo-cancellation, gain control and noise suppression
 
-comment "webrtcdsp needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 8"
+comment "webrtcdsp needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 10"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
 	bool "wpe"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
