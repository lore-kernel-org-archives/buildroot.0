Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA21CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 561AD60E90;
	Sat,  3 Oct 2026 15:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_aXm0KQVogK; Sat,  3 Oct 2026 15:55:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0E24460EA7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042929;
	b=Ju2Mj1F5d+QME7j0t3y/0Pds+nRZgTns3eivC9fIm14H6Mc7a503E2SmRXNlgq3ry3e6
	 TdMoNlhEAtrlYUJGrUmU1WMwrAFBYwy1q7BXACoohat5dYIDJ09MzMMEN2MpT/nXyBK4Q
	 HnQdC149pYxcVE0dhI6PETm3QjMFt7mF8XMQ+Nc1eb7UTHrUrUPvsclZFv9TEuX5doKVV
	 F4jY9GL4ADuezJTGUOQtHcCK+TCuaAZ366XsNU3lqSZWIxOQBMcYaDyohSQJ+ZGOfGENI
	 6EX+L2FxG2Fs7xWqx2yJF3yDtkyXaqfLbsZsEDNGCv3WhcjsHz21lZGEzcb2/y9fT2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042929;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=0vpvWH1gLmrp7yfPcr3w+o5gscTlnYVEWoIYi7i1pao=;
	b=piKgV1fiQLp9oNAfASJTEKzj08Ohb14mHTelEZBgiRIi1DaK8a2H7irVRvwXJKAz3wny
	 AZ531fHtM7sWl7JHtFzvx231oeZzD6l3DKstIP2Tz6SOZpvpCO4YmwkNLzJRLIXRIUc05
	 wTzIWjkqnsM74iR4eOqToeT+O76YuqgDKAomDAP2paZZyMeP8Q151QHXc+/suwGQClQc6
	 2D7D9jdv9oRbYXoycvl/z5NZLH20u2z1HUuJh+/7Kdn1PNZJ6clZ6/jto35Qr4XqwUeA3
	 Lsew6WFTHyWkhn9EeMu3Jo6Ooo2580MwJrcNJ8P+zx5bBu+TeUeES8g2JpNQDmmXkwg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042929;
	bh=0vpvWH1gLmrp7yfPcr3w+o5gscTlnYVEWoIYi7i1pao=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VJBuzaOrVTlu472vatpa9EbjdKDUh7R/5ZPjGLzaEvDXnTbrEpOt+xehTkJuVyovU
	 u8w6aGxisaoskV8jwmPNFdGZKe+xlgBLFKUUzcbGwMBbkHMVrXdmgwRUx/IkdyytTi
	 MSU6cKKflFAByWZygf8okkF2tg4rryJQETBDvAXTWp+f4/skjq2iSr1/d4c5YwC+Qm
	 3avAoiSi0WQvN+GbNUUCBUi+XqnMdoLODlhejcLyRxwKp/WqV9IhFEoIqHLZOEr6B/
	 6jKnXo0j5PCT4pmadEZUXeUHuxZJRlAN3SRy4rx2LeSOzqc1kotaxzGz//MMd3Ctlm
	 sxyuL5EfvbvNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E24460EA7;
	Sat,  3 Oct 2026 15:55:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B1604B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09921606A2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hF1pvJf4smCX for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 14E7E60662
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=BltkwZZdIvm4/SfjZBIQkA0HoP4U6inE44BTn4VaTlA8eMFCDe//tJzwjr/118jBTrgV
 oaq+n+uM6hAlMqOYPN3Hro8EG3AN0+AHmapz/g5uRvrPjnp1Xres6LEevS9/2/pQ0eZz0
 YPwbMRmY5XccdVfp5tSlrPWAJP6N911NpGqX/Esfc3vBr4OHOh29DooMvQAu/2jtpEwel
 v/VM3PlCKzYVZxLaG+/5XcRPX+kToZQDt4onG+wWff9Q59AAFlUS0eLu7p4bs+RkTdKuB
 30hwzTUtuNY8q+eIgYGShrWiizPp/TwrHkTyNLY1Nv5mfZJoy5woT+wXNNrYqWH65/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rPaeGY979uWlXo3424KnODvssv736pIAwE3xH2Jez78=;
 b=N75SyAO+dDCm9lIWipJplr4I0UtF4lgZV7oE/OT4MjI75HM7WMstNa+MBvJR26C/S/dh
 QlXF4CDcfZqrlf7hkhDRzJ6TnOum8ZX2pkb9MDb3IIJ1k0WTOfren6UiM51RmHyuafg5R
 wpQmGJ4BqRqnZNmrFn1E56/fEZMFX3B0BuKYl8z4PRXSVU/F+MjJxafFgl45kyR9bMgjO
 HyboLjyifK5Ns9wDaKRx95lK7IBnrFPF/nF+Xs3k6G4LIkMO/sR4BY6TjeKQGwbIEwvZJ
 ucOKaD7LbYqclg80MAijuIoSWrQyKaQQN3+APuRGyWyFMh4xoODsjrUwrFMyr+D1OMQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14E7E60662
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55A8A886F7; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8926301d1e9f9918935535c5a46ada42f8a76f36
X-Git-Newrev: fca22bcb7639288626a946e2356d30281eaea3e3
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.55A8A886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sdbus: bump version to
 0.14.3
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
Content-Type: multipart/mixed; boundary="===============4695500793377067583=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4695500793377067583==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fca22bcb7639288626a946e2356d30281eaea3e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Raphaël Mélotte <raphael.melotte@mind.be>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sdbus/python-sdbus.hash | 4 ++--
 package/python-sdbus/python-sdbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sdbus/python-sdbus.hash b/package/python-sdbus/python-sdbus.hash
index 680f501137..385a799cff 100644
--- a/package/python-sdbus/python-sdbus.hash
+++ b/package/python-sdbus/python-sdbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sdbus/json
-md5  b7b98bfd8934b676a48a9e4c6c180f8e  sdbus-0.14.2.tar.gz
-sha256  4f5d13b196e1e1de35311ebb2563a32de791451a30f5b9a4894528ba98766412  sdbus-0.14.2.tar.gz
+md5  901e93c7b74135799459dda07ca722c8  sdbus-0.14.3.tar.gz
+sha256  4ec4fa4108629bae5ab2775e5575b0251fdb555d4a3613c9ddb37fc73f882983  sdbus-0.14.3.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-sdbus/python-sdbus.mk b/package/python-sdbus/python-sdbus.mk
index 685626ffb4..84fa6a2ab0 100644
--- a/package/python-sdbus/python-sdbus.mk
+++ b/package/python-sdbus/python-sdbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SDBUS_VERSION = 0.14.2
+PYTHON_SDBUS_VERSION = 0.14.3
 PYTHON_SDBUS_SOURCE = sdbus-$(PYTHON_SDBUS_VERSION).tar.gz
-PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/7c/0f/0cf6b2fb0338fb3ab564cb8a8d68aa1c6de767851f5f9de9a3c83dbabeab
+PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/69/0e/14b0f16087cf7f1e1817da9282dcb590fe27030c6ba136c3e35dff647f3a
 PYTHON_SDBUS_SETUP_TYPE = setuptools
 PYTHON_SDBUS_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_LICENSE_FILES = COPYING

--===============4695500793377067583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4695500793377067583==--
