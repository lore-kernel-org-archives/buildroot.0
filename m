Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32385CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F274160684;
	Sat,  3 Oct 2026 15:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fn7QuaizUsuI; Sat,  3 Oct 2026 15:54:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2138260D96
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042871;
	b=ZCvZpbCfBZ8hYhN+xpQQG2QlHst9x6YR1JD9oeLjd77Ttczi3ivmy3WWa8uySesJaFdH
	 Hq7EvIT4CWNVfCayjDiFe84DvHFyzep1Hr8bzc5ZG1ByMSQy4PK4+zVz4t1bUJ26cd1Rk
	 8/HRpISQIDFTjfTgyOSIJduftCuYbMjW6NrOSJI0fJzg7QWwZ1fxRKeBtYxklcXic0WbL
	 2ZbNqHpIjLUT+nPsboOGkRMZrV7uTzOrKF4SJxzfSLLWbAtknJK/l15+e7J+SgMJsJMwd
	 6EBoNQSHMTN/rOPsSxQ6GiJ/Wq4s9pNm+9zHifx8JUZ0Uwgk5aBPvRTp9NnXzkW69PQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042871;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yjPOaTTdmJ7VUE+NWEc2rizS2luWueU9gRKCjXpA8b8=;
	b=YIiViOF5I/HIkXCWZiXpAKzzRybKrf6cUyRjfgH/nTIlM8gDwyoEGxgtGTevfFnVMM+p
	 7YiN6LfxaTMJu2rbirmaoCj/xkR+tcITL4x7NE2MZ3CvUkwFU348ePSeVEviOmKQzsnvI
	 dN5GdU7yXiyK7woLeO8OZfe0M1JMRYqqrVpwp5iTw1T7T8DTL5kga1O7XrKwDzmKS2P5s
	 4r7Nf53TAkx3wKbtZws/NLn0ZdbAglDvXiJ4UCDzmz6YqVbshpMqkf8UZM7aBOTeUHrb9
	 tQkTI9mlHCYVJy2B851pz2kRLmszmYPCSDLKKSGVgAYpl0BztUu3Fw5QEYEqEclHCpQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042871;
	bh=yjPOaTTdmJ7VUE+NWEc2rizS2luWueU9gRKCjXpA8b8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YJIIHIoBBVfpx2GWV2qHGYr8inL3sFnZmfXQr0xxmFs7Fvc02RhMMlPLf05y9JRXR
	 E6ECFSRJTugzuuG6OWWH7DZdIkAahh+o+vi8aP4B3KdwU39XM4N0g9nzogYNMefDGG
	 /dlDdwly9ObnFx8fOiM4N7CdtHG8QAK5hGC8dDOi3iLPSFr2sRw9ku/uNp3wjNDetj
	 VFnsn0JAVN6JwgeyaNmuvoEL7AFv9YBDExxrYqqH9KKAJn4gB+auFAckOf1mlcC9AB
	 wdBdbzOsHSPo+XLo9S02m0qLaEJIGRjYZgHXWZt6Z4MMIfHz83kJYrslzrKm3shr1D
	 iiwBLEphShVGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2138260D96;
	Sat,  3 Oct 2026 15:54:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA18476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E61E400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hgltm5qpR80R for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5DC6340055
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=rCOxl2nYc3ClWp+zMITjbZA+bHJZU3lf9brYIoXi31cVP6QC/IjU/vdt+PqhfbQgnsqF
 F+GK1pNemv2eu1RRCG3LXpgOL2nLf/NXzlUgJsHZ/f3nAHCpHemhlodysczMbFT4zixEn
 T2KySCODSc0+Gz7ZNUmtEVjMmFB8CSTtjacheaRUjOPOUGmhYsBYD9rG9CiAgovvLbO6o
 qBzPVUh+N71xIJotdBDX7dsdBf4PKTYtElHzRoILBs7NK2IFH37/g+wD4GFSnZECH49lD
 lMWYxxe+muVY0re9NGVUND77ccLC8r9MkqcOkdw9TZjl2W3K2UwCPU6l+wyiPZkB1Ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bUKFb7yHk0FeUzAds2SfjuNONf8unobOJRmzFm+kuaI=;
 b=eyJsH7nYdp0EzpnJBw3ZWk66GsuLmuYqzZtQ46n6V8KwiV8s9groSCT20SfvHz8L2bTW
 w7uy0nmrcuN8V1q8havKVbtwCf1sdRr1vtN7pCbyQpWrnZNQjdWiGYn2YEKioMt6ZuMCI
 /NaEZmuPqRfsnc6mdaUeEE5p3Unt0Dsypxo4pn2rH+lGscXuUv894fW1iHHjXZFSEFChv
 0xXe45oh3J38X/jOFUHQ6ONGPrFgehU0J+XwMDvHVD3Y7RPVw/Rh8Xsnqgh1jd6I8Fwt3
 9Z5pvoOiE/tzMXIInJHGdnrX+pxfBejqsUNGKqpFDITXGxvWF93bogNSdO0lky+OD6w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DC6340055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E8B6886F7; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f5f94e74e5086dcc659daa807b32a3d7fb6e87d
X-Git-Newrev: 36ff65db08255e48d29df030a53b4555069aacd0
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.9E8B6886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyparsing: bump version to
 3.3.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/36ff65db08255e48d29df030a53b4555069aacd0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index 509813d777..1413dd7fb6 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  ca3bea68cd1a84584b68cd7bed679464  pyparsing-3.3.2.tar.gz
-sha256  c777f4d763f140633dcb6d8a3eda953bf7a214dc4eff598413c070bcdc117cbc  pyparsing-3.3.2.tar.gz
+md5  2b2d965323de78ac4721dec660361ea6  pyparsing-3.3.3.tar.gz
+sha256  928ae7e20211f3b6f3915a72f06a0cfd29ab9d24279dd6346b6b1a7146397d36  pyparsing-3.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a5425f9dc14ac74d4c5f0b679e941f2442e32cca7452a4418d5b1a49893ebe4e  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 316b864302..596a61c3a5 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.3.2
+PYTHON_PYPARSING_VERSION = 3.3.3
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/f3/91/9c6ee907786a473bf81c5f53cf703ba0957b23ab84c264080fb5a450416f
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/e4/11/b213bebff182584360cb8d17c72c1677fec5c5c228de439e63bcf8ab1c8f
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
