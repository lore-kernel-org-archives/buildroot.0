Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2402FCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFF5D40B17;
	Sat, 10 Oct 2026 09:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QlxrBUsP_5Qz; Sat, 10 Oct 2026 09:28:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0651140B03
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624500;
	b=maqxO4SHBkoXGWsrgeZyRh2fu9t089CdSAoAeyqM9aqqEC70FDW3zxhOjPx9dSZdJj9h
	 2aEUXCY7OGGeT0kRiAskV9dSqfK+D8J8TZ89MvneK0T6iOMwUcnLjCfsDOaxUKYDlJGS0
	 w5KP4VKxCFN4VCBqnOJgsEygL+RnEltq502cZyQRFInj23WI/jmn63K37FX2cgj9Kvr1j
	 Sdm2j2EqQ28bcn/RzboQlTc9Y9SCC+i3xp4uWC6ur8fgdg4v50FoxRaM1JozILLpM32HH
	 4yl4wCEjV/9qbDAS22YoZxGyPeRZUc5AsnRYrgH6jqhw7EjTCjMCDrSNv3rPVWijvfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624500;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=dVcBcagYKQ342IQpef7SI8eUlS76puUzefGena1wHXs=;
	b=rIhzM0fp8WWWg3c/J0kK7GHKRRLH+jc09+jwoHSSBL/09OAz/oTIAaQWq2yhfXiiU0RH
	 mvHjn8QIpka8wJr4ACWd13RFInKz4vgaBSjQPXKVGpa6wQ11OZFXIyYBWyml+P2OF5I41
	 eXwvW9UtVo1B2BHcDq31Lph+fqT1ctlOiT/4KhNq4VI/X/Eq7Y5rYFJYmSU1bsTKe6e/F
	 rmf6hclpz7r+C54JyTyWUWXIqh/V0tTH40aElmGqxEPA+8irdsHx1e0WIjAQpxXOzAn2U
	 lyggLObkCeS83Gjv3HhkyoGJsc2LAa7Hdd1XSujTX+s36cKC5lYrakJtCltC9vyAj0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624500;
	bh=dVcBcagYKQ342IQpef7SI8eUlS76puUzefGena1wHXs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rRMikgVEJjwcm34otPFRwal/5B/AgcdSLqzPftw/a1Ngp/X7IYLawpQK14Cvog12O
	 VrJRV+maMjHnUR5QdKZAQ1ISXXj3dNmkpybe2tZp+Pfun0fGRv1RSqSLAf2xJz9Kq7
	 Uv+kcvLsvbUR6dCxqLG6tuFVsSoX1xcH2fJdeY6+LVebu5pxhu4qD/egAekTwk41hz
	 6iwFdOWwNGgvn463DpTQTArbA7WoA2FnbLEQZXmsguBezzNFfxZIFdmwuZKGd09rrn
	 bq2PBXLAmZC6GelVVVoGHzPAtFJSbvn+q3HjeKFHqC/7gEpdi5w6MlSYxGK6LjAtxR
	 HLLgev5QDZM9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0651140B03;
	Sat, 10 Oct 2026 09:28:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26349A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A7C680F85
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dd9h4mmoQAw8 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A2A6081209
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=r1lHRKJIdYekb7TTttYfry5t+8u2fClzyMsHWZbYGJSMehE6gE/mxFTBGVzdGbPNRtQt
 iYSVXspBDeWasV4eFd7AV2auGNL17RqHHioH50wNNDx5Nqzj7+osMIC88a0JHs/IuQrzt
 DJm4oT1cXwn5kvE6I3kjv4E9tIXY0g4brMNsEilJM+U0wTR+DOsEPkgE8EKkclbS6YnGt
 215yvjuX5yYX1IgXT29/F+7Bub1Whe2IcSaRdm8bSXCi6BP5g0Lm4lo2ZoznB8BO5sWWC
 5DdPHDZh0rvlVE1eVmKNgzEgeO920lYmzwkgddeBtLO6YSLQQVOkpH8fUiWEMGhc13A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=s3CrvKc2nh71Z6K29es875BMTjAobA6l/hkl1yaOk+Q=;
 b=Ltr8w24EZ61XIWH+7yQDre9fe9rtlC8boVi0G+LSVHfkW+PV0hjgY76IWQN983K8NvXX
 hMMpesU//u/KP1DnUAFs9cYMgtotqKdIbtjh0IyucAsrasExH/zB9AxlatefEbFczvyYW
 IJw0HC5g96sRoG3joD7VncKX5BUP3O2ruetmu3x505gATY6f+O2H+n8a7+ZH2OEQubYDI
 MQd9llkqz8Wk0UTUNLzF13MQgZ7pX4xYXAZy7HyHG2mszZPINakaLAUWq1lETzkQqmhDT
 bOXs8HHd2Dt4czdHK2TIpmD2CmGhGoYE5nmzmxCWQFqx/x0XaZPSPefGsmspzaxPKeA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2A6081209
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C32E8F1BD; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:56:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fc0f3237b2d66d55c0f598b5f0dd87e8021ec21c
X-Git-Newrev: d143df8d07624f9c3179780a7254849c989ebd94
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.8C32E8F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/swig: also create
 a swig4.0 symlink
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7000983569452703351=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7000983569452703351==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d143df8d07624f9c3179780a7254849c989ebd94
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

FindSWIG in CMake searches for swig4.0, swig3.0 and swig2.0 before it
tries plain swig, and it searches the whole PATH for one name before
moving on to the next. We only create swig3.0 and swig$(SWIG_VERSION_MAJOR)
(swig4.5) symlinks in $(HOST_DIR)/bin, so a swig4.0 installed on the
build machine, as Ubuntu 22.04 does with its swig4.0 package, takes
precedence over our host-swig for every CMake package that does not pass
SWIG_EXECUTABLE explicitly. With CMake 3.22.1, libftdi1 with Python
bindings ends up with

  -- Found SWIG: /usr/bin/swig4.0 (found suitable version "4.0.2", ...)

Also create a swig4.0 symlink, and update the comment accordingly.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9722f61382cd86a55e80585af3a088b4d121def4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/swig/swig.mk | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 71e5e05f96..0776ad3d74 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -30,18 +30,19 @@ endef
 
 HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_WRAPPER
 
-# CMake looks first at swig3.0, then swig2.0 and then swig. However,
-# when doing the search, it will look into the PATH for swig2.0 first,
-# and then for swig.
+# CMake looks first for swig4.0, then swig3.0 and swig2.0, and only
+# then for swig. However, it searches the whole PATH for one name before
+# trying the next one.
 # While the PATH contains first our $(HOST_DIR)/bin, it also contains
 # /usr/bin and other system directories. Therefore, if there is an
-# installed swig3.0 on the system, it will get the preference over the
-# swig installed in $(HOST_DIR)/bin, which isn't nice. To prevent
-# this from happening we create a symbolic link swig3.0 -> swig, so that
-# our swig always gets used.
+# installed swig4.0 or swig3.0 on the system, it will get the preference
+# over the swig installed in $(HOST_DIR)/bin, which isn't nice. To prevent
+# this from happening we create swig4.0 and swig3.0 symbolic links to
+# swig, so that our swig always gets used.
 
 define HOST_SWIG_INSTALL_SYMLINK
 	ln -fs swig $(HOST_DIR)/bin/swig$(SWIG_VERSION_MAJOR)
+	ln -fs swig $(HOST_DIR)/bin/swig4.0
 	ln -fs swig $(HOST_DIR)/bin/swig3.0
 endef
 

--===============7000983569452703351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7000983569452703351==--
