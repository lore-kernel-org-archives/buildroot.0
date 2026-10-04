Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD480CA5FF0
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73F4980E12;
	Sun,  4 Oct 2026 16:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqlD21FVxdvC; Sun,  4 Oct 2026 16:08:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 725D880E10
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130093;
	b=JTOxsjXTHPG4uQUOvA8Biq3zrI/bN2qNoTXKoDKTvRb7/N9dCXLF/WcEQrZJYHFxE3g1
	 K3OfnO1O5Q2RdFQbjpPJPjuvWNMH885mB4VcGj1YWksDd0STzRJ7+xRNMpHNISxLABoK5
	 6YNQ4u0zZFLFYd6f430vYdmLx2LNJ0rEYP3IozO7FXvuQmVveb/WTUYUB0l8UHtgTEa/W
	 xCxT9KRm1dNg3H9fRskgo+tSJeU0HapXjYh7cTfbH5iZfKe8LvcUJd/PcHgYaeXOOGRB+
	 AJmmrmQVnKddb48kGMdANN28CNY1Ddp4/29WPSQa2/eN2IgS1B7FFqV56cwu3IpIxPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130093;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+LkdFF5GxRDuutijSNKAvxgOxUw3siSRSTybdN/Cn20=;
	b=OxwaW0Uzv2wv9lGgCIOt+1ys9JvKSxROb40NkHqkI1ZxtezmfM/fNAFOsE3VpuuJe6U3
	 MB8PeGTY3R6rh6vyKjLQBhtUPypp0XekKwf6/pX3K1JtE7Qg8xR/QBFHCCiM2vKMKQOAL
	 o6CtSFgR4qMh2xmH3JP/wjomXMh46tXhKQtrZG860cjdKo+q8Bdkqoppdrlb1csRncMha
	 l4cU3+BfHDYmrJTR65X9Hp/tU7n8kMseQasAU1WuFWSHxFV3Vwanv8lS7ZIFrI9Myv7qd
	 hbkq6AzEU7Fq21EuX5Es0HKISzy3ib5uVo8jlt48BUtFPd8N/Ik3afapzfEX4TzjpmA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130093;
	bh=+LkdFF5GxRDuutijSNKAvxgOxUw3siSRSTybdN/Cn20=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WJWTUJDbP/k6Zu/5G7D1yBMEymVB9SLYTF1x9csw1zk8KYCFZwOrQbhpVcdGKVdbO
	 RfwtF5LWaZXxpYK/yYnlwM3PKQ0gv+7vmqCOAosnVKpvZ5X4grmTbYodqi4FlKqe7R
	 zVGFq1rZU3nJ4yfsB6wPRpRhm6WoQCiWg/6ieEI1u1hEZN/eSk1MHTHmQdiC2ebVz2
	 0HkYe8XRPtTm2uzdmUQ54/HJ0Mh+uiBKetVju6JKW2/AldrfmBnMSA5q2+vX7mQCmR
	 t7ElKbmnItHotrCueEe99FWVdohnjbLau/994/Swx1slbMZsH69W5luX4rgDhAaW/d
	 UzS6DAC3cTGbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 725D880E10;
	Sun,  4 Oct 2026 16:08:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AEB9A2E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F6856065C
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id we8EwbjjpqIz for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A2928606F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130077;
 b=DW3jf8n8y8lc4xLRmKprRQmAIe5ce/YEvkqmxRE2Bfre4g4X0N26K0l9Ir07sWfQsViJ
 jOUmCcYAIWJoerzZ6IeuBmolfFNdutmTUKMOTckul+VTnfUFjxMI10oAd40lKms70E24n
 c2sKOJUzTAM8fV+vKQCDm/rwIEL7VyC33wvaAF7w3+nFqPJwx/wWdUCdRxsWqaM/SN6Wm
 luUQTEgDduZDxXLR7+XVP/WzJIBy+2U6J7BrwwdhMH64yqidw+62FBJUbw5neK/c/FiCO
 yVnAhEwmJgGkMXOc0mwKODrv1SWE4657PiveVt52fpBDYgWFWpeyggruIROCzKSDb5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=k8inJHra2//HrH4v3wcbK8IsdmSmaJNpKqznVCVzAvA=;
 b=pwkCEd1LWS9aHljs4xr/jC0HsAXP4yf0bvcHMaKNwX9OYZg+nuJWiace2OIzZejFGWWr
 2bC/qGWqLTNS3lEtb/P8W7/HKX8ez0cb9VPLjra8Eu8U6hVUJl3fhE8tWSDBqRQYZcPc/
 G1jElD3lJ/nQ6QHHP6GVP4B94joc0jtvX07yva9DIo1UecmRjkPEXjvgGI6uq/Wu6lQ0G
 Bnu6XZxjawMQl8rPvc7DPkm+tKCGeBbAkJ8ve76ZcIXRArq6UKfsQrrEtgdKBFQKzDFTV
 gbIpFH5HxBfF9Q/Kggbpo32iKFGX8F7+Y3VXVhQ5r491Dab8KigguP/XDTa1y2r2YIA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2928606F3
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FBB78D220; Sun,  4 Oct 2026 16:06:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 18:03:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51de4cb8aa533cce50daf7e8f18f57396ff2870d
X-Git-Newrev: 3e6f6cec204a003c4fee5d672fdc2a33d822f551
X-Patchwork-Hint: ignore
Message-Id: <20261004160642.4FBB78D220@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump to version
 2.1.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e6f6cec204a003c4fee5d672fdc2a33d822f551
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index f3a55962f1..b9f597861d 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  d02bc876368c10e73feb00f82803093a  sqlalchemy-2.1.1.tar.gz
-sha256  fcf3cbb33bb23bad75d2150157c21804618745731e9931ab27e61879a9f6123b  sqlalchemy-2.1.1.tar.gz
+md5  2b235deb7bfe0a97a716c99c66ba3964  sqlalchemy-2.1.3.tar.gz
+sha256  ade5281df06038c6394f532590d592d3381ee5d11b9e0006a2570aef41145118  sqlalchemy-2.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index fdea9e4325..e38f49a4b4 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.1.1
+PYTHON_SQLALCHEMY_VERSION = 2.1.3
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/a8/cb/7c68da82239ffae9378eca076afe14c310e17a4f01e3d315112f266e26c7
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/02/4b/81d972a46c9f1d978af1795e2abc988855c711453552cb45d75f6e4abbf5
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
