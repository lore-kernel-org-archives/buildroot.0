Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67418CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CED360816;
	Tue, 13 Oct 2026 21:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXnt__6EG5LB; Tue, 13 Oct 2026 21:31:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 25FB06087B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791927097;
	b=KdnawqL8zayQEwRjBY7ruRyStaq7lJTIh5dWu2F/hF4bQBlLS+LefIsGXdrdjsonIvb1
	 QZTUCjNknkFQVZzv5FgJ9Jgmx/hz6J4ffMK+mB+gGEUOS0GslAKijbmpj3xB8VnjSStL/
	 rHVogYG3IQVFW7Qdq11Mpuj4tSuY8IPCFVnrKUb+2UV0tvwcKPUFEQscBOQikKDhEzQCD
	 LnUg0ss0Rl6JOFmHsXZI2cEZ9OyPqHa1aYc9kCqbeBXSf5LTgCDjw7aIf/UMRmRX/wXDF
	 LTxSmADSavD/V5HIzZcMGLjqjg/cPGcSeAl2Pqhk+j1ZOyq8FfUZjX87LLrCACzzFQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791927097;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wZhXWsdNfyty59HulKrnqNPMyj2rdsVs1aBfdxtVuIw=;
	b=GUIarv8IqbtnnP+hD8WyFvwo9D9CKAMsKS61s2gRM3xMp/YPwYr6ilRG0qOqZzbGLIbk
	 MhrvYz9bl35N5DmEOultco2xc6/KM4+NTmKIdCAcgXSg2KYpxhs0Z0qKcDvUruY3FGgFG
	 fr6MjaSzLDGK7QTEjfry02uh1F+W71LjQjn8D9ivkkmg2QUDUwxpFgCuu/NH4ticM3knp
	 CCtBsPNA95rvq2aILGJhtNGsOEHCJ8OusFUEuSzkdKwqoYf86pr7QUVs5IpI+uKwgNjCZ
	 2/XdsA6kNZsdAtis3A2On+B83Ray6BTkp/3gqed4J2+Cd8EJxISUNpOnzrrqlh03y6w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791927097;
	bh=wZhXWsdNfyty59HulKrnqNPMyj2rdsVs1aBfdxtVuIw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e4z4FZTRWF52BHFKMO8GNYNBJvx0yrzwQvA8HxA2K0NHCyks13ZA6tF5fA1y0Q8Zt
	 g19i5uQGS3JpOcvo7ca4UhkZxk0T+JtJnicfEuinIqJrtIlS31jDISbC8bcZ4O5e0V
	 cA2hy2M/GD9aF9Np2HzfkHzZ5bX62017NAITiRycfzu2sRN6vcar9sGnK5X7EBsMAT
	 FkX87LPGXGt0We+Rlgf7S2xNgzSU89iMduVOAp61H89qFa3M/rKsa+5MdDrE+OaSha
	 TRlCBO/Dmulwb2li3Yr0dZR1/GYzaaasM4Q9Xl23E4GHcVfY9dsrAQRBh4ylZM8xcz
	 e6rpskMd3THmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FB06087B;
	Tue, 13 Oct 2026 21:31:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B68A42AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CA04405BF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5h5hB91wYax for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:31:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EBE6140560
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791927095;
 b=jV2V9tqlcJd26CNpBXum9JifBQlX0gUrccTkcQsR8FkDx4aRQHJgMfil7s4fe1b2Q8a3
 EAFrZWd4PlV7D7tXJoY7boJ/R5/vys7LUZLUL6MXRIS1TTYAaMLmz9v6QF9zM5kMeqHI+
 OVKMxr400ZaWjeU2ipifewzV/ZWP8bzcP2Ujqmkpo2nBnge/cWMI/wuM/PmnTPRv3cEP7
 qaqgKvJd24bBwEM2TxSuQp8J4ISc6W0JznJZcApkIgqNvlsf5jwRLQbVTl6Zq61+8znC5
 DiB1wE2Jw737k4Vf3gVS4VT3NTI139Io8Y/DX3/bEfXSxTvclbNXRoLPdrLAFjMDQwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791927095;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TEzrCTsEYBVi/yFX+79tecLGImyItSwIcyBMTpPf07E=;
 b=TildofLgO+XzvC7D7gFELoid3cNVr5j9ppFvJz+z5zJJvN2Fb2JxtFNleAMkVVYsTxb9
 UIeYqV8YydpcMaY8h3/hbHA2njh30O/Qwg+MxXzMLhGdiiz+pitcAsMO6YkZ1msGG4/1j
 9KPrfsazFUjXK3EnjjLn6u81BOHnRo6vjsW5nESiyAMQBz8zDNlqD85rY267jbh6B/XiG
 4ejnj7LW21i87cDVFkqyK18NJ8OblWza5ecbcRkxUEckEKBTyCFir1G5x+cyAvf4HO6bn
 H0phxK9RJ4dEHZaNYOf3amSYc3hZOQwejtvifoBZEyumudvNYB7fML4SsEX55uqIgMA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBE6140560
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:31:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F06295B98; Tue, 13 Oct 2026 21:30:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 23:28:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 728fcc8abb5e4226cf3b4c9c349c12154c27306b
X-Git-Newrev: acbcc911b71f93bb7ea9400aa19713f3464c8e69
X-Patchwork-Hint: ignore
Message-Id: <20261013213015.0F06295B98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/targetcli-fb: bump to version 3.0.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/acbcc911b71f93bb7ea9400aa19713f3464c8e69
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to hatchling with hatch-vcs and use the PyPI source distribution,
which includes the version metadata needed by hatch-vcs.

Drop the obsolete six dependency and keep the remaining Python
dependencies as runtime selections.

Update the license hash for the removal of a trailing blank line:
https://github.com/open-iscsi/targetcli-fb/commit/f9d97a8bdecff94727ad975f263d132eec8d8ca6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/targetcli-fb/Config.in         |  1 -
 package/targetcli-fb/targetcli-fb.hash |  8 +++++---
 package/targetcli-fb/targetcli-fb.mk   | 13 +++++--------
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index 4455a6ce31..00af7dd159 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -17,7 +17,6 @@ config BR2_PACKAGE_TARGETCLI_FB
 	depends on BR2_PACKAGE_HAS_LIBUDEV # python-rtslib-fb -> python-pyudev
 	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_RTSLIB_FB
-	select BR2_PACKAGE_PYTHON_SIX
 	select BR2_PACKAGE_PYTHON_GOBJECT
 	help
 	  targetcli-fb is a command-line interface for configuring the
diff --git a/package/targetcli-fb/targetcli-fb.hash b/package/targetcli-fb/targetcli-fb.hash
index 1732fa99e5..95b76a4194 100644
--- a/package/targetcli-fb/targetcli-fb.hash
+++ b/package/targetcli-fb/targetcli-fb.hash
@@ -1,3 +1,5 @@
-# locally computed
-sha256  605f4e4e4e7189d6a03f11a4f55e7ddb4671002d542c2f684f87dd68391dcdc2  targetcli-fb-2.1.58.tar.gz
-sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
+# md5, sha256 from https://pypi.org/pypi/targetcli/json
+md5  e7f681218a3895008ebaf503d46806cb  targetcli-3.0.2.tar.gz
+sha256  00422cce70f1d4a4d804cb1f3f633169ff4ad13b017b7e52d8f49262afe43b9e  targetcli-3.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index 503b9224d0..a04cfae3f6 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -6,17 +6,14 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and python-configshell-fb at the same time.
-TARGETCLI_FB_VERSION = 2.1.58
-TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
+TARGETCLI_FB_VERSION = 3.0.2
+TARGETCLI_FB_SOURCE = targetcli-$(TARGETCLI_FB_VERSION).tar.gz
+TARGETCLI_FB_SITE = https://files.pythonhosted.org/packages/01/3d/d6c306d24bdc31657599d2487879c3a1435e3c6c2268a7a1a984ef6f6b7b
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
 TARGETCLI_FB_CPE_ID_VALID = YES
-TARGETCLI_FB_SETUP_TYPE = setuptools
-TARGETCLI_FB_DEPENDENCIES = \
-	python-configshell-fb \
-	python-gobject \
-	python-rtslib-fb \
-	python-six
+TARGETCLI_FB_SETUP_TYPE = hatch
+TARGETCLI_FB_DEPENDENCIES = host-python-hatch-vcs
 
 define TARGETCLI_FB_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
