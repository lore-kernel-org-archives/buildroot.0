Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F10CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D6D56105F;
	Sat,  3 Oct 2026 15:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_sRd6DjiLdb; Sat,  3 Oct 2026 15:57:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D295D61068
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043029;
	b=q/ZOv9fpbm1zJaXIuWVEo/MLuqdDRlv7DKNiVabAk1HE+EI0hx8O78g5kfQz/Ml2svIT
	 YD9YHI0fB7renCxv9X1MfwCn++HzQzmP6DQ3LPxpOC15+A4IzMgJCax1H8xrZv+RYExp3
	 zi7OhQqr+FK2su6lU9xpGFMGCTHDSZJjui/i5YwIOrdNGKhiUOHuiGxYxxHe3X3VT3c88
	 yCx/0hfP87MoeDo8sUxDjYL4ahdJL3yc2uATxxANDjJSSLMLZlHaq106wYcVgJ4woZo/L
	 MzjOa8XaNan+yqgq4On+Sg9IyWls2u8M40ioqxJ2WoiXjBdNc4fngF/9/Om+fkgZe1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043029;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=cSbxDGqSb2YsTy5lLBZ17KEmuB+jsJolaU0zZWVe5d0=;
	b=HQWkXwxB8tVS3elbzV6TzEWRq2JOR6RKM5uH1Do60nRcsVi7iCgifsqxIcdV+Tx5XWhw
	 EYEjv8Ui/M6bL3wFXIoOTFfLwrZElq9nbT4XK9S9mzniLVG1XeWIe3UBDw7mqqeVygYXz
	 J0d7VOyzFIuTYzBxa2gpT8paht5ypW5x8ayh3S/unKcJiSzfSSru6WIuLRGN9ioXumWPr
	 lzvsFMRvzAgGBgHhPKIY8wQ6Z+zoAIsvARpZehrKgBTbC74xSMkYGvMYPsD+Y4a9IZ7qA
	 5Sa7rWUnKxtvVTDUL5CndsF5UTVOj4LsEoLc7Dd4ESDGjqpIiYQmP6IcGWrKVcWLouA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043029;
	bh=cSbxDGqSb2YsTy5lLBZ17KEmuB+jsJolaU0zZWVe5d0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H/pbwnl+WC9inbQEr8R2dW/hUoInHW/24YXi2Sv6tzmB/0Q+g1a3Faab+WlbYfkVi
	 PPjOV05rqzA0B3WECAY8vxyL5fOf9Nrw4c5FXt7LPfc3E+VngYduJluQCClGULlwzt
	 M5seeNvR51j1WAc7g8ItJfznGGMf/9edgy1bMn3D41++NW2xkyCYF0O96Qx4yuwRIi
	 vRyVKiE1Eu48aTI4ea4qUoM+/v5MQ5kv4gEMawI8DSy1LemPsinqPx6P19opbgt29e
	 e8bIAb0kW1dmlGqQ1NleJcuONQo/tYeMg2Bdv/tRC5uTBuNHsyT34Xm0nLJnVtVNla
	 nuZZVY00KVtWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D295D61068;
	Sat,  3 Oct 2026 15:57:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 870EA335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7619360680
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-q-1cQlfITs for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 40E3F606B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=HnAdFOwAnEmJ0oLHGuGeadyrzGrhfubmPTwO4VAlOIfjsAMZX4AQJZuv19UnjO8AxEuM
 xoK0YvQvowV0LQBpcx9mbNXSfNKtoCBAaHDILa3IEi29whmA/wi5QSmdVn89kHPjwi2ei
 dDfFQ4YoH6/PGsMJvCEt9H4XspkCLYixIH1uSTRGGhPod1EQ3rxvmk/1PVdXAyjqSCXFc
 MXFhvceB+CM/G5v1ktRpAsG9Dd+V/haJrASGNWY+Facu8RYvM3iWy0Bl34EMqLikxZHB1
 QttqkZw9XM9yw/eGLZo5EgjSG98ZGAfwFqNj5RnBSedxhsaA6P2+5suNPsVsBc078HQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=W+UkrS2LTHLLPBwxr+fITdx60kVVI/uccenG6+C0oPs=;
 b=VPSInix+MlkjmF5eOBDGaq2sT0klHYa32A85WBF9W5RYlUwBhEFcEyNlTuJmuTsZ6kgI
 pPLnqHN7XMkSSHQSGuNazQjQOsqZgCuQgaeB/kx35VEq+tD1Yu6w616z5Qx8TC98UQQGl
 R+Abp7SGTHC727LhfbPRLVn+O0JoA7YdJpv2DF6qDvjEMnQZBXr2ZJzBRH5HYTQUR/DQE
 tByJZo0GUpd4ec8EhrkIhvJisa5FW0ZBg5OORjNkRhkfEJGHj0IVwZcxl9bu0F1QApaDl
 6nRbIYf8dRBunDJwP41izieMSOTftNBMo4RhoMFy9VOtAkqxWdJ7TzrM8AsBDkLJTNw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40E3F606B1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8166F8908D; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e384247dc8fb6bf95b1e01330fbb1e0bbfffb70c
X-Git-Newrev: 938a13fd35bbb868403b9809141770595e82296b
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.8166F8908D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-marshmallow: bump version
 to 4.3.1
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
Content-Type: multipart/mixed; boundary="===============0161990172979104724=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0161990172979104724==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/938a13fd35bbb868403b9809141770595e82296b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Martin Hundebøll <martin@geanix.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index 6be06f20f4..2a135c64a4 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  95589d6f1082aae57ef81cc5ce15fc2c  marshmallow-4.3.0.tar.gz
-sha256  fb43c53b3fe240b8f6af37223d6ef1636f927ad9bea8ab323afad95dff090880  marshmallow-4.3.0.tar.gz
+md5  5663ecbc0a3bb672d4e988294723025b  marshmallow-4.3.1.tar.gz
+sha256  fb6b8048af08d4ab061610d5b7d3696a7e4c95337dbda880edb9f95812cabc20  marshmallow-4.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 964ff66732..795c6faf6a 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 4.3.0
+PYTHON_MARSHMALLOW_VERSION = 4.3.1
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/25/7e/1dbd4096eb7c148cd2841841916f78820bb85a4d80a0c25c02d30815a7fb
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/4e/d7/611e68d57e6a903c29cb33b5afec0f93b4baecacc6c6c62e33cde9eb9dcb
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst

--===============0161990172979104724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0161990172979104724==--
