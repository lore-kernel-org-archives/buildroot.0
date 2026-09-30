Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF6CCA5FA5
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 02:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 130D74082F;
	Wed, 30 Sep 2026 02:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4HfYSjCzIaO; Wed, 30 Sep 2026 02:23:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5801940770
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790735009;
	b=Ya4UZHWhcWsSNfW7KL69yid9K3VdHUh4hgU1Y6PHG45EcfP7h56HZh9Zpi4jJEzTSxfS
	 agXq7EuiNBDkl0pRFQiH4+u4/TR2PfCRlCPMZjya+J7U2K7xdS47KzCeEh1LrfPpDYpHM
	 S6lre0wAkvyJTtuVZfqBQ/aXZZspwsTPm82FUDxPcoS+sMxE72aRdHMJ2BJwYFMysFM+c
	 48xwcF6tgtEtcmpjeD9AzzNbamoEXInjmTvp1zeDH2lWVm+zx67qtsr3W/lBt7QccmO1A
	 JqqUuRWjFpO5wuGDRpP3DgQ32dMOXI22g31qMII3t/plMUTHL3HyhubbW/O5vZOBRrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790735009;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VgpvoWR1M5GX0h0FxTZt2gtIZMxt63nciL24ZJ4e7Dc=;
	b=TzvNAeaEBW7XGpBb/ReTfU7DgjT6yJtloZXDYunfKbbcDFHC2FIFB5Ns67fpitSQQy9t
	 eJSZk2gtNvocYC5s9RWQSBFLplDYy7cYput+KolJyNqPPXJkrBMWQV7kTa8cv74ivjavz
	 FzJ/FWoyEGLrtLU6Y0Z9yzDDs/MTsn+m1z4h9toY9RxrnMGrn115VYNLyuR43y5MN+TWl
	 TyjATLoF4m0/4SBUwnyp36o6VeIFsGk8ZcW3Gw5FfRfBBIou99tH0JX7p0TGLe40OdTbw
	 eknVFebTgzrWiRcu6IkODKfqV2INH1rAxUmR4jbxJb976vlv1azFDRnlCJowGlEgFpg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790735009;
	bh=VgpvoWR1M5GX0h0FxTZt2gtIZMxt63nciL24ZJ4e7Dc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mhG+15R+Hr0A1MjplTQPc9TYx+4jz6X+hoSGcSIzkELq4rvYLZKj8xLoozV2TgiVq
	 GqJe9xAPJD8cDtdaxfBbw5FNX/ITF2pEx993/Q45hkZDnUHzgFLOYTp14ladJgD5Tn
	 0sWF1emYUdAsB3zF+eF6e8rNOETXrXlis+lQgYN0SkUK8fIH7Ekv1euP1MN5h6ymhT
	 rsaiy2b/2v9Fa+YB1lH3zAUANxryIJqP+Llp3DhfY76M478zMHMI8tanR+GiPPHqpQ
	 m1JyVs9wayVZjGgtWnTEJ1WFsRgDJ5iYNck8RXWxkHiuMy2NHNmA+Js6EiXH6YpPXu
	 MW07Uiz9X4Hqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5801940770;
	Wed, 30 Sep 2026 02:23:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D181832F
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 02:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C235B81006
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 02:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFLDg8GQ_JvS for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 02:23:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1197180EE3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790735006;
 b=I+LftH05t6OiSkGPh0rdQTULIwwz5O363KDyyyBbc2Lqb4EWE3P+YyvCqSdukNqgFtri
 Ow6VDBiye4IKcoiige03YY/0GT5Mpsd08hRFWGRBqawzAY1BW8eTWX2D2Ih6KAp2ihudw
 KiKp1g5P736ZKCB/Q8HKpINO6x4FuKAgrPXTE1SZRl+Crq8w0giVrZSDs4qFFMxC+NKOj
 AAOjueNyY5P0gtfqhbgTADntwZdbXLGRqJ1YOAAisjtPAYvXd1Y8mvGtNAignyjLf7mp2
 jFvKudBC65TKw+llm4/p3XbG7FEBVGpGeRhpAbBqDp6XUqfBaJ9Mga3KiJw7yiGFquw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790735006;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=XZX54akjgHn7gluDL/KlHoSrXaVWRym1matPNrzWJBA=;
 b=qxcawLqiS+b44Eo4/ISjpa0yKA1hBCHDsHAHGdlusWzEF7OG1yIm2UbCqtAcheo2DDOh
 vaEXJq8cfPj+6DhkvR8wPQIForURZPcojxZEQ79G76jBKxHKt4j3raeqRMhrwrTCbdzPy
 42N+EBIWAYmfbz9mdkrC/wKIhkUpVDRqIJKINHa4AAHZWXzJDQlb7lXAzfZ4A1s+UqYGp
 b7aSZia0fjLDVRlOa6ewR7UFcRDwSro/fROGzUaaV6JY2nnoQmw1fbp+O4QKsAOGna9Yz
 u98DRuuCOIxG3Sg+88ZSxUXPVNKcT7VyUu7Ca32cBBCKTXa/qikvFXx0S3Zg9FZ0i8A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=NO3rWtVq; 
 arc=none smtp.remote-ip=213.167.242.64
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=paul.elder@ideasonboard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=NO3rWtVq
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1197180EE3
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 02:23:25 +0000 (UTC)
Received: from neptunite.hamster-moth.ts.net (unknown
 [IPv6:2400:2411:160:2f00:5ebe:c680:ee8f:e17f])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB95D5E;
 Wed, 30 Sep 2026 04:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1790734890;
 bh=ioXiDnTNRY7kRdF3RoTDU+XjIcSFwz2idajrzkbF70M=;
 h=From:To:Cc:Subject:Date:From;
 b=NO3rWtVqKaBw5HRsSK04lijXp4Mdc4Wcw0VT24/Ny1ss8azA+0TDb109Th1BjEggk
 GRdOKOytblPqJJYrLMp1yiWdpq3YEpIOJD4/s2XB7SZABvyPqssEHz+nRGAk+/bOtg
 hAGAoROD4QFPDQunAaURYL6VHsUDjggLCA1t6JcU=
From: Paul Elder <paul.elder@ideasonboard.com>
To: buildroot@buildroot.org
Cc: laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
 Paul Elder <paul.elder@ideasonboard.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 30 Sep 2026 11:23:03 +0900
Message-ID: <20260930022304.541411-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/raw2rgbpnm: Add package for
 raw2rgbpnm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add package for raw2rgbpnm. It is a tool for converting raw images to
RGB PNM. While the original repo is at:
https://git.retiisi.eu/?p=~sailus/raw2rgbpnm.git
A mirror is hosted on freedesktop:
https://gitlab.freedesktop.org/camera/raw2rgbpnm
so use that instead, as it likely has more resources for maintenance and
availability.

As the build is simple and has no dependencies nor releases, use the
commit ID of the head of master branch at the moment.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
Changes in v2:
- fix formatting
- use commit id instead of branch
- add hash

This patch is based on 2026.08.
---
 package/Config.in                  |  1 +
 package/raw2rgbpnm/Config.in       |  6 ++++++
 package/raw2rgbpnm/raw2rgbpnm.hash |  5 +++++
 package/raw2rgbpnm/raw2rgbpnm.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/raw2rgbpnm/Config.in
 create mode 100644 package/raw2rgbpnm/raw2rgbpnm.hash
 create mode 100644 package/raw2rgbpnm/raw2rgbpnm.mk

diff --git a/package/Config.in b/package/Config.in
index 6058800682b4..6d9daeadafec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -195,6 +195,7 @@ menu "Development tools"
 	source "package/mawk/Config.in"
 	source "package/patch/Config.in"
 	source "package/pkgconf/Config.in"
+	source "package/raw2rgbpnm/Config.in"
 	source "package/ripgrep/Config.in"
 	source "package/sed/Config.in"
 	source "package/subversion/Config.in"
diff --git a/package/raw2rgbpnm/Config.in b/package/raw2rgbpnm/Config.in
new file mode 100644
index 000000000000..3d8f36459f4e
--- /dev/null
+++ b/package/raw2rgbpnm/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_RAW2RGBPNM
+	bool "raw2rgbpnm"
+	help
+	  Convert raw bayer images to RGB PNM for easier viewing
+
+	  https://gitlab.freedesktop.org/camera/raw2rgbpnm
diff --git a/package/raw2rgbpnm/raw2rgbpnm.hash b/package/raw2rgbpnm/raw2rgbpnm.hash
new file mode 100644
index 000000000000..5ac2c4fbf5e6
--- /dev/null
+++ b/package/raw2rgbpnm/raw2rgbpnm.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  3d0df8cca5f3e1fd45c9f1e76344413ea58a753d93b9764272dad0498a482cfb  raw2rgbpnm-f28b903ca63b4c221dc011df5edf1d51eea533d7-git4.tar.gz
+
+# license files
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/raw2rgbpnm/raw2rgbpnm.mk b/package/raw2rgbpnm/raw2rgbpnm.mk
new file mode 100644
index 000000000000..fc6d9064a0fc
--- /dev/null
+++ b/package/raw2rgbpnm/raw2rgbpnm.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# raw2rgbpnm
+#
+################################################################################
+
+RAW2RGBPNM_SITE = https://gitlab.freedesktop.org/camera/raw2rgbpnm
+RAW2RGBPNM_SITE_METHOD = git
+RAW2RGBPNM_VERSION = f28b903ca63b4c221dc011df5edf1d51eea533d7
+
+RAW2RGBPNM_LICENSE = GPL-2.0-only
+RAW2RGBPNM_LICENSE_FILES = LICENSE
+
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
