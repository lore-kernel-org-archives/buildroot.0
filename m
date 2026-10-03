Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C90CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A1B160EB8;
	Sat,  3 Oct 2026 10:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id av3u9ulRhyaE; Sat,  3 Oct 2026 10:07:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3246B60EA8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022068;
	b=jQC3lDxo9XuTOMNthpk47scPcrXkAvAkhViPKypsZbz0I/Nc9uCUXDz/b8KysHjGSM+1
	 c7pJv6P9h14sap6Y1MLLU0D1FiczyCV1D4+ikgv3Yd842/cwbz8VMzLupfTqJSYdJAdbu
	 Yp5cS/EAkPXld4UPLN+d6+5K1dH4W3HC1iLIOLCftiCdMEeQ6lwzZI6neGNB0pVlMn4aM
	 LsQWMGu9uF0eM0Vem+QorCV4KkdCCicyNGhKhAJqs54tsEBTpcMTyDnxYmUEp7his8N0K
	 kKCySOHyPhQIO5KN/NSF1KMLZNKePOockALUfXjuESW1ZOtJA/DWDaW6w6oXY26A6wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022068;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zIKQyw0RD43zbmIRY/fx9Y9skJL55f9jxRgKAUh7W3E=;
	b=IF43THkjYXXaUXETTmrc79qqoz+FbGLD+JVL7IP9efaQc3fplW3+th6zfMTAnDiOZEQS
	 Cik24wiyX3nyNNrbEgtpPFpvIn6MIOQFwVH90XKIKxSeH0R61rGCwCh7J8Vu75uz1GL4P
	 d/CMljhrAqlX5985uqe+nUYm+jlGDyUMSrZgDypyskRZENBlye8NEcVJUa50TE5h4xeDR
	 LeJyWIEmwwBrnmKbteYQR3N4xujUMEBdfzHgzrmA9SOAq6sc/c1xFCJiSFoJCuW11FSpg
	 DL0YHvWRZoz0SXba+eWNPiu+DFtkBwmFosX2WOr3vNV3FFjFJqVqufocy463hpCVpLw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022068;
	bh=zIKQyw0RD43zbmIRY/fx9Y9skJL55f9jxRgKAUh7W3E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kv2H1c/wdnIyvvhjtNHN7VwuXG85JaCgIDjUx3z3dEZaS+tehbXmdu5Rkg0kdvOWL
	 UqZ+AUMslTzoFC8eNh5LIvha3j+IP4ylLX5mfJ1zQaLKLLaigQG7LTr/H4TXEoqz6+
	 9zH2ko6UUMPY9urg9sUya+sxfyjryRE1wbWKpnz5F40FFy9a87aarNhtTOmZo2wvXM
	 DDPJaO76b4VlrkxvmWt8laRPumY7frGe3167Nbn/e5+ewT4wYEBpjXBa9b405o0nzP
	 3Mvcn2FST3+Z+cYcGWZ8SY0da1/RY/zEJQGMaA/EaJ8gdT6fo20RMIjmrXsgqR3ej2
	 YmQ1aaBasQmOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3246B60EA8;
	Sat,  3 Oct 2026 10:07:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F827335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0263860E82
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NIgKoomJQgw for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B779F60E84
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=M3OndtalWnmpZPCXQ/QYE8Dotlymmj0lJ/97hfj4ms7HxjA7vIbfF2mnuhjBmM+T7Lhd
 U75i+tGf8jzH0NruXb50/YHNIORXrqkcP0czNCCk/+nXZJ6ZNqDbZOipPP4Jz997XDa+C
 5k5Vzou9pJDaZt0BErT9vSSyneirn4MOU6Nhh+smiKrDyX1ikwyExqcvXrztwhRqScPOB
 hdcY47z5HpfxehQIZ/gu7NTZtWRTXSNMXPdfjgrFXVQeYCXP50e8nxaCebQMLXmadx/ni
 tVHzTO5TTI1hLT6V7Sh5eHSVG/16L4oUkebI4BgHfi01JoWjBtCdxbRrtwdjdH1vP6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=N8UTTTvhM9F7627m+sLRlwXCo5AhpuvI6Ts6ZQY1juY=;
 b=MsOrySU/xrSnMSXzvBKz018hA0BgfsGflQo55YK/Y2AKmxATvKO3sV77epSK2aogBspC
 Q0THwCKtUSk6fz7CF/8VIPssRGogHh63oDrSVvmKAmDUqn4OjSFM7n+mk4jEFS73DA8iS
 6I0mTzbqteMTrhhh3ShySzBDIPI+ZRkvyNBUq9CFvToQUzY57dMSPx0Wjv6Qu6BogRgYL
 80RQeTfIBtF8ZrCEQqY+HqhykMqUazPBtP88svrX2kvXARok85ln8AeAprAs738MfNqAT
 AnwOnHuJ6cwj+HALrvNdZBcp1h47DGMycP9JTJeBwN6HdfOdObMlMSv5r+BTg15FK3w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B779F60E84
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21AE188762; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6c2223f0fd8ac4a88f323ac7c34f8fed195720d
X-Git-Newrev: 1d48aa711e2e2ae6794f65e0ccdaa31d821b6eb9
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.21AE188762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gnupg: bump to version 0.5.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1d48aa711e2e2ae6794f65e0ccdaa31d821b6eb9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Skip the dependency check to ignore the upper version bound on
setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gnupg/python-gnupg.hash | 4 ++--
 package/python-gnupg/python-gnupg.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index 5b0c450a76..13094024f4 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-md5  faf076013aa2e25a8424f29b49c1b75b  python_gnupg-0.5.6.tar.gz
-sha256  5743e96212d38923fc19083812dc127907e44dbd3bcf0db4d657e291d3c21eac  python_gnupg-0.5.6.tar.gz
+md5  bd6ac6330980ff56960afca0c18de7c9  python_gnupg-0.5.7.tar.gz
+sha256  73ea46219f992b361eb1ce54cb0968101670654454916a3ee5df8bb9bf0cc8cc  python_gnupg-0.5.7.tar.gz
 # Locally computed sha256 checksums
 sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index 55c57cb702..52a3f3e363 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.5.6
+PYTHON_GNUPG_VERSION = 0.5.7
 PYTHON_GNUPG_SOURCE = python_gnupg-$(PYTHON_GNUPG_VERSION).tar.gz
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/98/2c/6cd2c7cff4bdbb434be5429ef6b8e96ee6b50155551361f30a1bb2ea3c1d
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/bb/d4/47aa0f34b6a06a976063e3e0bf1512b140ec1e6efda83bc717fac58071db
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
 PYTHON_GNUPG_SETUP_TYPE = setuptools
+PYTHON_GNUPG_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
