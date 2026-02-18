Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA80E9A02C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 14:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D423E407E9;
	Wed, 18 Feb 2026 14:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpfMfIBdJrm0; Wed, 18 Feb 2026 14:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 292E1407C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771423466;
	bh=s25LJ3fJkuVUzJ6Am+8gQV/euuYyYZSS/C7cUrWFaJk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WKooFf1umx3TpaGApuzsCfzrYj/bfP20680eovCf2IRrcdug+ICkNzeAcRps5TEY3
	 Bf6rRJACWPqDox4Ypdx0mxL0EaJxFz0mtRRNAI7IBC38IMA36E3DN4ovqGlpiVwZcn
	 ZVYza65TZL9VsHKAk1d5EdOCWd4250DgB+514BXhDUwg3pSlLccjudAW6vfuCXqLOm
	 DZ6hRX+lV6yEq5DQWsjiAiUrdt+HYColwUJCkz8IH7MDyJDyPQDCwhi6O9VHdRBq0P
	 0l1UzIgVDBZqFs5vR/LPj0rKpAvte7547/f6CiWC5b1lktvVvCu1Tx1ox7Nk5lYk4M
	 vhJZusrPaktjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 292E1407C5;
	Wed, 18 Feb 2026 14:04:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D33135B
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 14:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42CCC400AE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 14:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYzeRuMXX8RH for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 14:04:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.61;
 helo=mout-b-201.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7A944004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7A944004E
Received: from mout-b-201.mailbox.org (mout-b-201.mailbox.org [195.10.208.61])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7A944004E
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 14:04:22 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-201.mailbox.org (Postfix) with ESMTPS id 4fGJCj5sCTzDs53;
 Wed, 18 Feb 2026 15:04:17 +0100 (CET)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 15:00:29 +0100
Message-ID: <20260218140031.3124335-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4fGJCj5sCTzDs53
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1771423457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EMRzJs4ByxN6xUPU+IV5I96jJNwtZ0WvLbfE/kP9Zos=;
 b=GlagD2jcJJ+MGkWVzACimy9hL8aVfiNK9Psh8VcaKrsiVU/X9t0hJnH5HCm5YtP5p3gXwA
 Spe/oi1khusD2513YXyTh4sWGG0hFo/tE3TziWpnzn0ocwY+aKXswtyebglGXooJ1RTwE1
 lHtMJptlbE0cGBHVf6rD2i3zuxBR2JvzORgfLNlr7HUu3wsXP/MOaJACqDzvtgZyBJ2cI1
 XKNZ0846Q/pMe8lF7mk34Gb3uiGDPQzxUOyrvXp/NgjV+3D0+9oZYb5TDvSEhbUBwWMQEn
 i3S0qJyxKMu07+AL2EgZrgtVvzwAyXvHaslWYcNJAEcodpLZjDb3FjZhWpSu3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=GlagD2jc
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.12.0
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes here: https://github.com/pymodbus-dev/pymodbus/releases/tag/v3.12.0

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 8d990d0d5f..b1183fba1e 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  7485a0f834aafb48273c6adb297dff93  pymodbus-3.11.4.tar.gz
-sha256  6910e385cb6b2f983cd457e9ecee2ff580dbb23cf3d84aefec0845e71edd606a  pymodbus-3.11.4.tar.gz
+md5  c120f359fa9a0bba0c450efcb93941e9  pymodbus-3.12.0.tar.gz
+sha256  3fafe85e5d82bb9bcbda14b97a0e69a47dc46be55631e9f988adfaf95140c44b  pymodbus-3.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 1e7df6892a..75c0bdc35a 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.11.4
+PYTHON_PYMODBUS_VERSION = 3.12.0
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/2a/af/bbb716301ab9c60f0702c3cdf72cc0e373286a5648fe16bc4431400489dc
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/41/dc/8db192f3a66032e1bd900eb87b5bbcb539d5118f520372af0cb92ba42499
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
