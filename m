Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F351CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C213411A6;
	Sat,  3 Oct 2026 10:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQU_qhSFItyf; Sat,  3 Oct 2026 10:07:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5604541215
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022079;
	b=m8Y8x3YHBQE8rfo1uZ/TtEduf/rfrbVNabbez4TLQ9a2rxoAIxa7LeXCiNMxjfNf4Tdy
	 +QKKjJEh1n07fPOpcfRtfuXMW0efHPIkXlGPhVR4Uf8xngp4lV0q3YTOv5ZBtS/qAOfDw
	 4DpsoIG5RM72C40sZRrzk/IvkJvvfuaJwUxNosa27Lm/eGhTHHrzwx0RCs6iUY3NljWi+
	 dfFaxwsmWWpSQbqPhjG0GdbWFcXXKwxXdd5bRktGEudehvPSe4CdqAt9cbZx1kEvmBToQ
	 Uf9OFADrFzQNTSg7ViknXRgYewq03Qs0KJEMrttDBvNQB6AGiPv782WTGzOZhv4meBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022079;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZI++7nMt6GDrYafhKxU0CNhGjSD6Z1KPvW7M1tU6wlE=;
	b=JGSJzv3WUu1oc51tY6MsHD2IXnIQcestQxIsInE2x3us1elszy7I2uyRdLoWn714Lg33
	 Bze9pN/L4PP9pC3UAie/4Fr7sKkYp5hnfCldUCp5xUAnd8CSF+VHxneX/DUHWxIfw55Hm
	 W5I+LEXBhEsWnao2FpsKWdOzEx9HOKx/QdLNRoAg29Nu2gWsDMUT27a3+zKXBKG0vvpbj
	 XTzOP46507X3D/L7nz5Gj5eIOfPbYtYmk/TC2n0J8o57DrYibQm5pLsmIEPoUweMmuCNJ
	 zC8H/uVi4zh2X8Wgk1JIJTly2nur890a3X4waaVDn0KIqLi1uX/bg+9ce96AMG9bopA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022079;
	bh=ZI++7nMt6GDrYafhKxU0CNhGjSD6Z1KPvW7M1tU6wlE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iIq234r6SbjvaCUuyr6/uNyasiXdKCm5i4Nl2c1UKeKAs0fw10qiqvpWy8ZMXFaW6
	 N0PChNDJMOhA6iy+To0MPk9IZ+nDQfZBfa5GQE8/Fs7cCoPJHi2nbGiwcTroP1OlrW
	 gdasMsJWqKH7QiZ5jJimdWJ185NXuKcYkPvSvhwK9oMcUvVzUjrawfBpe7gJUjpGVy
	 ErRTj0E91dGcYTGpyNNwU19rT/iNA75OsjZI6xp2IKD4n4z2kEY1bYuq9upKabcgcc
	 7o2Uso/Baq94PHbLal/NnVjJWnK7L1lxgrsEnN5SNd7dpXugbSdN6+d2LBL4wq2awY
	 SfQ3RH4zZW6pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5604541215;
	Sat,  3 Oct 2026 10:07:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 117D84B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3F5160E86
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ko2Zy18L9Crz for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4A54160E8E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=WcelIGJtbJKg2zBvv+uLCdrhbHbD+FzWUspruSDSJa3SOLt2cJLQnJ3Zcv1tx228rMZ7
 TSizF6c7eJt8yZuHmI5kqnqNGtPhyLBymV50tFttoFeOUGZpttnbmxktI2GJ+zmFN/Y0e
 IOENxT1Bdx4fCvtSwDZ7/6c7WmDmjZb2+/tXHi4nwTP0KoLx7Y6ETQUJTtseC1WNOWigS
 5/cWspVTbZS7Jv92+e9L+U3UpdLNIw+HF8l0mwuNTwdUoJo5yp+wsXamJKvmb3e+y6KIR
 L7khwIltZSicrcmTBM/movWtNDLojbrgBlmHiW6Ym6qZAsuhI+EYFwqqrKtu6KYkang==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QjiuJD2+s6SK6X7aL7WlcpFlHWRQqexbr+NBVVxErfg=;
 b=YwgV6nRiFrcLshiWND/yHC0+cymQw9z+6InH8CdEaYgEI1vmoCbXI9esEsjQqj0bX8nN
 xygHssMGZ5o4KZDxn1rtabprlSmvycvYInstG2sdWuko7WrvwbvlmV4yAmDCUCZRAw8ZS
 kZfh/Iu2bpphkvNUvwCadxM7YjC/5QP5CYH+KKtOVTvYB5maiIOEsL/8Bac+A3C1rRa4e
 IcU2zFvjOuy6qX5+n2UAJga97mPiIXkVZtIIG15fgKeGR1gTbbl0vofq39PcWKDqbvJBc
 SBPr7nApQjcSnGLVG0kR7sd6CKVBKz1Np3hA6bBHL3CGtrWJqfO+8mBW1eP6zt7gRTw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A54160E8E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8D1D88762; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2cb9f457c96fa6d093339411aa8c16f59643b84
X-Git-Newrev: 8b411cce3d1aadfcc6de762fdf8d0ab44db8ec6a
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.A8D1D88762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-periphery: bump to version
 2.4.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b411cce3d1aadfcc6de762fdf8d0ab44db8ec6a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/vsergeev/python-periphery/commit/a7361781456fcfa605b0d4d335abfbb9ced45918

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-periphery/python-periphery.hash | 6 +++---
 package/python-periphery/python-periphery.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-periphery/python-periphery.hash b/package/python-periphery/python-periphery.hash
index a758fa7a4d..f14d570390 100644
--- a/package/python-periphery/python-periphery.hash
+++ b/package/python-periphery/python-periphery.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-periphery/json
-md5  2b2a1037fb4ac15e7b0514ce3659d26c  python-periphery-2.4.1.tar.gz
-sha256  61d461d736982a6f766e878720ab10a68151e2e8c1086600d9389ac47e40e88a  python-periphery-2.4.1.tar.gz
+md5  c7d00f4ff0409d88ede49768dad1d733  python_periphery-2.4.2.tar.gz
+sha256  9b334a31832ba64f74aa72700ee5fd6452d79d1d1fa6a0b48333bdb716d91575  python_periphery-2.4.2.tar.gz
 # Locally computed sha256 checksums
-sha256  321124461e9f86f4f7bb9f571500bf58ec1b76206b642e505ce17db7f7c88e05  LICENSE
+sha256  baff9efffe2d42c0e58271d177c3456a7e436ec7c5c47a02da91bbc76de83877  LICENSE
diff --git a/package/python-periphery/python-periphery.mk b/package/python-periphery/python-periphery.mk
index 7a49f305a5..54eccb46c1 100644
--- a/package/python-periphery/python-periphery.mk
+++ b/package/python-periphery/python-periphery.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PERIPHERY_VERSION = 2.4.1
-PYTHON_PERIPHERY_SITE = https://files.pythonhosted.org/packages/df/f1/1a986ad2bb696033168db2121151e5ff90df033af780ffca47c8bb559f29
+PYTHON_PERIPHERY_VERSION = 2.4.2
+PYTHON_PERIPHERY_SOURCE = python_periphery-$(PYTHON_PERIPHERY_VERSION).tar.gz
+PYTHON_PERIPHERY_SITE = https://files.pythonhosted.org/packages/81/4e/e25e53c24192b7a6192f27ae38760dc679737b5b3c44961408e1ab10e802
 PYTHON_PERIPHERY_LICENSE = MIT
 PYTHON_PERIPHERY_LICENSE_FILES = LICENSE
 PYTHON_PERIPHERY_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
