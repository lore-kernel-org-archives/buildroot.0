Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D624CA9EC5
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4000881393;
	Sat, 10 Oct 2026 12:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZW3SD-3l520; Sat, 10 Oct 2026 12:11:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 51DBC8134D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634261;
	b=nl6p/EYcJ6Wiyvab8R/sUq4Z1zWrMRjIBdZHeph5MxKliHH/cGbONYDQ+aRU4UjDTFPY
	 hFU3BNsoaBeT2+yVnLElEfor+Tv6w6qzqm4MBsGXFthL09EXbs+xEu5FSSbOmHqmejcXQ
	 6q2P9hkSxFW8h3qFBt1QQP1i4SeKTYAWkXlJC1G5gAn+PKp/Ev56ayg7kev/UKIFYXdIJ
	 RSTBBBOBv3PRt00hZ2k1oyycAa8I6QKEVdvKX4h0GF2u//psgbHUZRwlEHl8yepg4KEZs
	 rX6mAf2qh8P4KU5Mk2DVw4oEwcfpI1InOSuIgdqv7SxL3Zh3WEEKHF6aXI7Tu1I9cSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634261;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=i27CyH0976185XZjamcDKoSwtqwqwnhq6/PWDTwhYFw=;
	b=NX17v8rq1a6mj87K3rIKvjb+suNQ1DGGq+C9loP5xn8puNf6JX1Q6PoStCSLWa83A87p
	 nPMKi+CVWRwdLJcZju6Kfc2EU7fhzT2NvBpzu2xBekZni/gGDFVh028LZ3RAnqemikW+3
	 n5agv4Bz3EUerLSvseGHfc0PDrEzRi2wwiwkNhJ0LTah893V8uWSb+4K5I8QZEtVlCgNF
	 e0uylZ8Gkd9qUiWvmoQfOW93kNboypTuQwxCY8CUCy1Bm4hh7zkkeVdUpcyGFlyCQknHs
	 tksF90rmgkXKnhSJXgStrSVQxzKwIuKkXzr+CceOJWn6cWV2wMHEzepfizXaPJmpfZQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634261;
	bh=i27CyH0976185XZjamcDKoSwtqwqwnhq6/PWDTwhYFw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iIXQiH7ysozOwHyZyl2/nlt+Ze+ipY+oezLVXpyQICO+sn+UwECKh8WNDbGlKp0yG
	 WaRoQTHU4a4GpddJ9JhTHo5v6h6BhNViK1CmfND2KWG5FBapnF3YMmvN1PzSxWWSeh
	 o9LVwWi+jj+eWqBhLKTNoCaGPwFvYqp9/mq16ZvGpNx5cC2GcNp91FMCJwDF6vS3Nz
	 dh+BfgqKRcdJvXYHOztZUcD6cR3vqzY0ah51xDvXHNbBhwYPAspvvTWdegwkuxfHcO
	 jku7SJDXuJLdUXtaszjwsk0AK1Cy1fyZu93/UgGbNgK0VoQ406nZWa8j58uayEuz5g
	 iMQJuvujayRUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51DBC8134D;
	Sat, 10 Oct 2026 12:11:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D44F8DE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5F8D4018C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99HukcGTAH_m for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F07154010A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634254;
 b=A5WxQx2Dgc76lrdfRSk73CguVeffLpqyIQHe3zxvIlG7D+NB7cwoWetMRLnLN7P+A8FB
 JmUn03Xp00V+0zs9avfEjK9froQ3hbM5NrbTQ+UsedqZtxVkXJXGFGjxIEISYKvgzRBZc
 t8oMWbNZKS0KgV/QVkYtJjJjgfcWHjuHMG4Ajk/9/n+cEas+LykE0pPkG1PKXgmPMcJkZ
 m82Q91Fv06skugjFrT3TCD2iFweQoLj31LNvubmVdcejPOAHK76rrLW5SNPiuQba49sll
 GA9Xf3rRzZyNm9fq9YsmmRKrC/sLTS0V1r0eXTAw3rNBW+mKE0n+FOTC6UaUPPXEG7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634254;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ljREQaX4kCKKrQDcdWZlKh21XDR4C9rBDGKd3qotVC4=;
 b=f+Y3GAwqBdkZtmXPYmATtIalMEIvdetjThkMrWv+6JuvXON68kWsjK68MyZ7C2CFRb9a
 jekjz6WDySiU6XvojQI2Gt0UkYW7XnukvnK2ZGbjLBc0sWjRamk3lVSSO4/1d3U4oCzp8
 VnXTSW/sx0k/5ETiie9ZAdoPAQP9AAwvIG4N8/RfRtFyytr60Ba2bpHf0ZrzteewRQZnQ
 pR/kavsZ6y1R8N/IvGU0L1hkVaIbpYrob985c+rGMWa49R9FgWw5Bi3kZS1M6bjK/VLNK
 ovO74JFd32Pe0sDHxyf0vxdxh7HSnj8hazahow4yMQ76fWN813gyTwQmednNTGxTIVw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F07154010A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A75FC91A66; Sat, 10 Oct 2026 12:09:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:08:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 061af7e44741d13c54b4022c4261e90737a37f04
X-Git-Newrev: 1d8170227e6a89dac0e1dbd716cb32ef5752f38c
X-Patchwork-Hint: ignore
Message-Id: <20261010120935.A75FC91A66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysmi: bump to version 2.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1d8170227e6a89dac0e1dbd716cb32ef5752f38c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/lextudio/pysmi/commit/170fccec8ca124c581cb0f9cb5d07c41da98b5e4

Add the python-lark runtime dependency.

Drop the no longer required python-ply dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pysmi/Config.in         | 2 +-
 package/python-pysmi/python-pysmi.hash | 6 +++---
 package/python-pysmi/python-pysmi.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pysmi/Config.in b/package/python-pysmi/Config.in
index d30e24afd1..8c398a2435 100644
--- a/package/python-pysmi/Config.in
+++ b/package/python-pysmi/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYSMI
 	bool "python-pysmi"
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
-	select BR2_PACKAGE_PYTHON_PLY # runtime
+	select BR2_PACKAGE_PYTHON_LARK # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	help
 	  SNMP SMI/MIB Parser.
diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index 856f59baaf..0d7854a4db 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5  406818a9bb351e665e2eb9e9352a57fe  pysmi-1.6.2.tar.gz
-sha256  abed01673113886d10f0f336426859238fc13b5383c7e28e13dbcd5af0443ba1  pysmi-1.6.2.tar.gz
+md5  c790e3c8d1f825d7557889ee40b94593  pysmi-2.0.0.tar.gz
+sha256  9eeba85ed59c5de38f512fe9858ce3332864526f7efc8135b3e3f552666cf79b  pysmi-2.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  ba934e538c4116c2d9209c14256778b9a8a246234a3bd9256c62f396187e80d4  LICENSE.rst
+sha256  72bf37e11cd6e07ea46ac80eec46f2d72dcea5956bf0e1482816dfdfb7e40c4e  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index 2288f04e88..cbed8167ff 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 1.6.2
+PYTHON_PYSMI_VERSION = 2.0.0
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/a7/80/917111aaa4bf931bbd4d9a6c89864de2304b79cba8ce49639a6440ecd5ba
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/ce/69/5666ed49ca34b418c3fdd9a6d7754566193ae0b9d2bc4b695ade7ef85b77
 PYTHON_PYSMI_SETUP_TYPE = flit
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
