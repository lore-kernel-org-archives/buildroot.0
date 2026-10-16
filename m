Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9593ECCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68D7860B89;
	Fri, 16 Oct 2026 13:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ne5jKBV9HPZf; Fri, 16 Oct 2026 13:10:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4423160F38
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156207;
	b=QxVR5IBTqJri8/x8d7JuMjtUBAzRCdcXpOGeLr5WochKH0XiaN3txyqCXdfedVGC6BRe
	 jKi3vP21lOzAYb1cJwW2RdkrDAzw9TdmlxOLv9KhYGITjuqsCLMgGyIF9U0aM9qqrjxED
	 T2ZZ6mAxtHWEXiXnP2mAF+ZP+ycKrQwuhd/Ci+6ovpl/s9KwP/giAFo8v2r20gGFpc9PM
	 GuftAlT/nZyuz023/3rEiu0dzo3gw4UwbO8fUFVUHnqmC6Hx0glSbebLl1Rzows2ufBE7
	 5H6ZmQ0PxFPAUveVDdWqH53c+Et+31qQkbYIQzynCtjVpL5y0b3z5tRrbZ66MbDmVmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156207;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wwVUn6vT388xtilWlS9lg5qGhqftyrd6mKsDxl4X2G8=;
	b=kPL2eu693QWURTeHdqoIlNvqYwXTNSvE4ohlYDSsxsBTV6/zYlAojykPjtgovPaypgk9
	 yBfQJXv66p1DrnvAlWeURmwFgB+wJRujkuoofRflTKdRq+X0iWTztqV/wvC3HTBKde2US
	 4hujcnstaSPlxCdJfsjRBM8w1Olh/FIxGQCprwn98AIOrh/XA3rf6p9wAaEi8KcUTsjMW
	 +Fs7T1GBAADgDusOnKq18+6yJNMkddlXPRgVYN6JFj677LQ2dco6fG7W75sBXm5gCkvGv
	 N29SPF08QsVJqCy1H1vk0p46HZdNXk0oyiswzaaUAUgl/MD+x+ByeaiGg7nNk8ZrHKA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156207;
	bh=wwVUn6vT388xtilWlS9lg5qGhqftyrd6mKsDxl4X2G8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RbYJ1jIUzSoXMLzJFHQLcGhuf2FqDIEmvpRwoyquOBmJbiW8fu1183pXRVywrnBej
	 f0zMdh6+vvLHxykoYTc2gVXv+rbAkmEnkS5FDOVaw6uEE1uomMbb1qgGXmlCUpJR9N
	 BqdJWGaZ2u7s0TQiCEG3IxxjpA9965p4DfW5o1xku4qTFwyvQByjpiaigN2Rc1oJuA
	 NvU/MRtl4V0oBW3wGkM2MmztjokQ1gxVYFb3TFWNB/MYcFDXOK8yiVGPUAFULHh5zC
	 uMcL/cXjPlkmBfwtLvvwi5kuBZ4+TTss8AP/OePFxmZfLkacWq+LjinGvSULVahb3c
	 KIq+o5tKiCH9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4423160F38;
	Fri, 16 Oct 2026 13:10:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A0A2255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0832480772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNMmMnDxVCfK for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3AAAB814A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=c/buTeuyvvXahlTNxQ2Tzfb5LUMhsxwF5yD/ZjLQtTZ3w38gXUXZWI15Sqy316lG1uA4
 U3/v47oTvhpoo9BqyRhHvramML49fCw/sYb4NusW56z2vCowfjvrSikvu/nquZyF2wpUn
 HhnHjLC061qYicPnFglznEgD7bjggmqERAR9zfvtAeQifXUUnNi+OjwIxDl/8DMvqRN/+
 ZttRNzvEAr3wf05zJw8sVGtQEzgKN2uEFXzwtCgkmxh5T2Q1I4gKhvrM46Jm7CymeyUyo
 I2Yj86Gmu8DeiKMqxTOmUxWa7GC9cTA+owgD1KTdEhX0AZVDBa5lgoagBzJbAjcZ6qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0NEqXBQIxWkn6NuWpnwyBi8wyc9mnr7erg1SeYoTl94=;
 b=h5oZx/fDkQZwBl6hRdbCE3MQaplCY6IOIYgN6Iq1D2qsbUDHmhhDWA4P1KzKMl3qW7Es
 SkqtaOAaSsiFZGQOuN9jQRj5/ZieFD/lF1dzW0T3HIO1olENRAjnk66T5B6eQmTKNQ2ha
 vckvtqaA3QNJXzbHLwg1nCJi+hOYJDDZgyC+Bc4aJAe0QH6awpQ4TK7E859nwk7/Ke/Wu
 WRgZXICqb8LEKcTGWd8RpfJjXWFvbxUO+ItFxE5jXwvkN/KTzSu0Jv35WVZ8+QDs9nB4i
 Wy8cnyMOJOue4OAnQxlF7xRoRJLZGg0ovwZF8JQwqM1EKrfy0XMgRorsOZLF3oQFHlg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AAAB814A0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BCED960D5; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e554e3378573667b03193e712c2bee89fa5e9c94
X-Git-Newrev: 40164b1bba39d5eb0bde61f4d6e95a6ac0037537
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.2BCED960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pkg-generic.mk:
 drop PKGDIR variable for {, actual-}source step
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
Content-Type: multipart/mixed; boundary="===============5814833136110185106=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5814833136110185106==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40164b1bba39d5eb0bde61f4d6e95a6ac0037537
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This was added in commit 2d4fd5d358 ("pkg-infra: also set PKGDIR for the
download step") for the DOWNLOAD macro, which was reworked in commit
155f752d8a ("core/download: do not hard-code the path to the package hash
file") to instead use <FOO>_HASH_FILE, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f454580f0f5f591f9a9edfdefb5c7ef4b0aa28db)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/pkg-generic.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 57514bc415..e6116df397 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1087,9 +1087,7 @@ $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
-$$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_ACTUAL_SOURCE):		PKG=$(2)
-$$($(2)_TARGET_ACTUAL_SOURCE):		PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		NAME=$(1)
 

--===============5814833136110185106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5814833136110185106==--
