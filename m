Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730E8CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C7D7814AB;
	Sat,  3 Oct 2026 15:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2InSkecSOWtU; Sat,  3 Oct 2026 15:55:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 53B788143E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042918;
	b=rxOSY0VaslflWL57F4xCPnIGBIWiRaPeYgMsn65Jtb5eoZ2S9oSotRWggYxTGWRN/NkQ
	 LSGj1fo/eTVeUXaXk5HMag5ItJ9huMWN9CDhXJI3gd+BREzVIXZQ51MG4opGSLLpPX6f8
	 AJvgnqA7uLEPMj5PxJMSlHovVXJ+O3IVdhbqGomCn6A5pmd4O9wjR1XVZLBCprThErV8h
	 I5ZrIAKwbgM0ctqoXdzOxZsUtuTym15DQqMWak9tIrNXq71OPfcJGha3QfUOZxi5dHLPL
	 NSQzf87Byg8RZg60TQLNSz3mMPdiYr104N2S0NyY/O+izIuUzrAQcIbMBSeo6Q0ARIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042918;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=80wlFZvBqjLH8rHKn4UXXa4d4Mi77fC2p41QInpILH0=;
	b=bGw93QR7CMaQ9R0aPSNgHSddkmj68g0rEV+UQ5rTb24egMHntv0PgBmTlbqLQf01vQ+d
	 BfOeDm4tslYRdgg3ll2Fn3VZXl1BuU8aPZXBLU8aUdiiQmJvB8EdId22FHkbBXXqkpMy3
	 tnSVqDouqRlGtpZuI/ztJDGcV7NNbX8xJ0ncRQLnxBJi5mEUSw5rO7Jcn7XeSm03wrZZ6
	 Jal0iFFaP8lme4avvjki+OSdRXYp2u320lx0iVAlLltPNA5q3jGRdtkyGHWZiAAFcWhvD
	 eGZW6FvN2gCdlSnyn8O9vDFZ3zRNIarnNlGAhWc7eucegIjGnOiiFp5Tgt/OS0CwWCQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042918;
	bh=80wlFZvBqjLH8rHKn4UXXa4d4Mi77fC2p41QInpILH0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pGwX0XU2r3kMYFmL0iBJnAFg13Gw2bqZYeiJ6pRUolh6TZZJ+6ibCXEfOUdVSKHBv
	 Zxv8KW0+KN4WbonOKSb0V4WUqmgfUQXhSxo8/xaO6J4Z6EbuOVdFvIfUsOIu+Sd6m4
	 yvmXGZ5jfZvWzw8lLasaCO2HodytvoxKehtDG5mIy4V4Ifzs7/SyS8CL3iQhGTkS+/
	 TaDOxjulePvT+QIojmBIQg2yyJE9WpdjEyzyScDIfyDoFHMzB0J6ApL37yekOX79N0
	 V7y8QrUmzOOcHS3T0EPBukVOJD90q7pUSsEo40PZnbwlKLiidi4SoDmB0E7M8JKgRh
	 D5SUKQWJjbmWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53B788143E;
	Sat,  3 Oct 2026 15:55:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE377335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F9EA40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWqfkRj_QMF9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E1DD9400CB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=gyHDWzNefvJkAkVUsf4BE0cuofFQgbw1dmgbuGqbo5DpTXJzT2qxt27iHyJms7aqpW2g
 FgiwVMex2Df92DcWyFSVnVaan4ENXcf1ZNvqWLPP0wkRGdFiUgVDsCUcS4LVEfbreeVjx
 PTgsxBPHqNVujilfHnHQ6oDR1BYBjXQy50tX/z+A7f8uNbnOu1QHCuyLAxRT56ZnpGjRf
 QF1CZnsM/mEtZHCbwzVk0VVZCqHeRi00jTsaIe0XwrEknAKV7HakrK0Z884p59xiecJQp
 5d0xto2XQ4hxwt4raoGWcez1SALpcqQz3kco5/J1zlezEM9ESVbOQZovzihm8F8Ur9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CbDofmQYidmF6xVIbtL9k3C5i+65dlDgglLXHeQ6FRw=;
 b=svsuUizSKPMfppMjT3vHnho+firx5fApVeQ2F9qa5MxahhQXT7UlctFiQ0aogvdtBjyT
 bCKwrFmgW6EM91u9SXtzYWq0NfPsUTlJUDXAX5H9CVSTFLUT+938h+QjrgSP0lcny6mLM
 SzANQJxoQK8YzzHPRH0D3OB4eg4Us5YazJ3n5/J8Z7qx/1+/ciIaZ9H8RiT1/wwvatTLq
 ZM8YIS+KAlvDW9b1lO0qCF3l1VtiifD1mgZlcbW/XgkrbcYCBL8svxf4uXXe5IYgtTygA
 qM86GGnooUMLdvNOw8EMpUutdiLJ36n14gSsCdpWUZ0VOLcC02uScTnPgFbc51XawsQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1DD9400CB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EF308A58C; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71c3bc921997cdbac3a83fe838906e9ce0c02c35
X-Git-Newrev: 3b4d72a38cdcb307c52097a168b636d2b2c48f02
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.2EF308A58C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-txtorcon: bump version to
 26.6.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b4d72a38cdcb307c52097a168b636d2b2c48f02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-txtorcon/python-txtorcon.hash | 4 ++--
 package/python-txtorcon/python-txtorcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index b322eac23f..7e8783afe2 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txtorcon/json
-md5  c3e9d8fe545effa09c0e43612c91ca17  txtorcon-24.8.0.tar.gz
-sha256  befe19138d9c8c5307b6ee6d4fe446d0c201ffd1cc404aeb265ed90309978ad0  txtorcon-24.8.0.tar.gz
+md5  18326bcfb2b9af1746ce4154bd67c0c7  txtorcon-26.6.0.tar.gz
+sha256  0408f063a9fcb8df529daca57bb7373ea0f5b4ebaffcd5103754b7c561773f68  txtorcon-26.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index 13a2454d6a..8d910798b8 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXTORCON_VERSION = 24.8.0
+PYTHON_TXTORCON_VERSION = 26.6.0
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/b9/9f/7815b07d8bc775d9578d9131267bb7ce3e91e31305688736ed796ae724d1
+PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/0c/59/9b868727e8a41b6b5be4c0dad15b8188b75cb9ca3162aa7cdd20b7cfa808
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
