Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C3ECA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64AB8816E7;
	Sat,  3 Oct 2026 15:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kfBBfl30HVE; Sat,  3 Oct 2026 15:56:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7E62A816E2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042981;
	b=ee7pMY54ArSilG601iEoF9fuo3uuxml2j0+G6AG+p5HADpFQlg9+ZDN9GO2CaaQWLs8h
	 b+VJnGt+dnD/GcJX2eujxvt/5pHTgidExqDZP5+BvGmGzu+7u0O1NBmHz9n2hTCaFBs22
	 g/xOsqB+nRTUYvFtFtcPTMdRYO48b9WtXxxvSoNMRNUG+SWx0FpZ2ofltXnePEk3IlpPo
	 eygq0mv0ziNy994gN6fUC/HDCGnZ37C6Sg5V1oCA204tVfhYOPqtFZLndSm33/Q+z2lki
	 8V690dsTTym1v4cMgbKWS0SkQxLxVsHeWW9zZMuBKhvghU/gJr5PlOCzhOH0MztlZzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042981;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=B/X/zutBYzGie4JL47zE+N4Uw5m2FXXUkghguwVRetM=;
	b=RY+J2lPOLFN5aOElBFa8OCeWGB+FO4AlhBoN3TRAP+Ci4wa5hwyX+xe/N5SeF2Xgnd7i
	 hreP3EXH7SPvR1c4K7pIk6s1gQCY5AN8W8IyR4qJxA/myrjEKuhGwDX2LjQ8KLburDzhK
	 pHhMv7M/l4b51ueSaAhXBAqBGHuZgokGFLAVt72uEt/5FE5qeie4aBhnyv/IiV/kxgHG+
	 MUW6UCo/fttvWSk1rF1OKM9NMWEzT/iWKjSWdHyD8WZv1EnF1YRMyOiY8tYGLfDYFgCkQ
	 Vl7UXyxx8ZOBXo2iMdhlVFPi09fWEenNn0qHyp49G4ixRuPYJqQykS2W6JJUQWIIQCw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042981;
	bh=B/X/zutBYzGie4JL47zE+N4Uw5m2FXXUkghguwVRetM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lO3VAsjjDrE6NDCtRGjh0gTscnFPn3TRfl+NEoC4h+q2bGLiUDjjy9ddIy/3JqDHm
	 2Z6UEjrw39h7EZlhnylMBRB3sGnsfY53EC+/cf/E7ym9xOkGBTqjBQyTLs62a0iHJN
	 t7Pz+iKZvwZcRzPWDggyy6wsr8IB4WopAwF1modcVMRT53lBv9J3tHvGrV5Ogl8lcw
	 2ZUMLXa1JvrG3XRR6N8CF1BQ1o4V04XAxEaqy8G92CTlOCtQ5qcm2aSRJtG9lYywli
	 3e5UWvdXgn+mShgg4PvJpvXx+vb3ud7XcW1vJtpy50/BFcnrzxGZ/wYuBRt83rdrKH
	 gJHyjG/928bzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E62A816E2;
	Sat,  3 Oct 2026 15:56:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A199B476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88A9F606E5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-2Zcf5EpxYm for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 88A6560685
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=noD0IT0yCugrLaEugM7Gz+dWAh8nrx3LUC4YyhmzMBEaxscQAeRQkVdtPMnra5frBQoD
 /EmJHhqWSSYdyQTQJXOJzSzYUJ6CdsQaGeDHJzpVI9K5rqW0yAe9b7uHnBtuzmN1g3IdI
 m4fyQkqSvE1b6lL4lf2GUd0MabCYiy3x9jqKWoLdlS1UXx0o8df6eqjbirQBUDt5qyW6C
 rDfo2/OO14zPwBYIpztVhXGVhyxSHx8g53tjqILEcaceyCyt+jciHayV9zQgcr2+EfI3G
 IVwjmwd3NjEjOFJk8sA5An0JnpVWfXaQMgZIWiqkVWrWDJShn+k06w+oQ2OK0/ceJXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2HLqxA3SMOChAm5dmt+O7cHmPPd/ZjiOrLjP5/emGH4=;
 b=bcpua8Y7xYFlL3DApJE9QI/rjtYFPtqlXrNurUW2/pLHCGPp1GPicIKJdDs1kVtz639C
 FiJSoP3C4E3xM+qgzHtP6dTKC0q6mBHWqBePkpKsMG+zscAYH1q/xn9ibTlgmFRwsa3mT
 o/5KeuggM0z5VsJ2DS6dRismhPgaF0erX5oflCATgauCDkYc3yNSCdtHky/vOb3IrB7ww
 pmFk/LsN4Z80hrHBFzJW7i5NvIS8BxCia7OXUabbZRoAgro6kQ41mK9fJen+LhvNctJo/
 DY5xMzMgQw12U1s9c4peGorX27ExAHfPClgx9QKPVCGhDT0uVk2ns/Umy3KpjK46ltw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88A6560685
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9BB28A574; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffc6cee1ee8171630e285e7cd35c7e3213e860dd
X-Git-Newrev: 105bd5db6b9afea00a6d7874be47e5ac3738bb38
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.C9BB28A574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssselect: bump version to
 1.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/105bd5db6b9afea00a6d7874be47e5ac3738bb38
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cssselect/python-cssselect.hash | 4 ++--
 package/python-cssselect/python-cssselect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
index 9e7f8e6244..e373b88d57 100644
--- a/package/python-cssselect/python-cssselect.hash
+++ b/package/python-cssselect/python-cssselect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect/json
-md5  3aca561a6fe4e51d2993e0a0f604e30a  cssselect-1.4.0.tar.gz
-sha256  fdaf0a1425e17dfe8c5cf66191d211b357cf7872ae8afc4c6762ddd8ac47fc92  cssselect-1.4.0.tar.gz
+md5  465a7b6af9ea95fdefe5357301589b9c  cssselect-1.5.0.tar.gz
+sha256  3cbe82dd7acbee9ba9e5723b5f9e4749826912f1fb31cd7f92aabed5fde15b15  cssselect-1.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index d58aea52a8..283a00947f 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT_VERSION = 1.4.0
+PYTHON_CSSSELECT_VERSION = 1.5.0
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
-PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/ec/2e/cdfd8b01c37cbf4f9482eefd455853a3cf9c995029a46acd31dfaa9c1dd6
+PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/8e/5a/6d6fcf922709391fac986f0a03ad4546f4f45b94d10aeb6c1ee041599993
 PYTHON_CSSSELECT_SETUP_TYPE = hatch
 PYTHON_CSSSELECT_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
