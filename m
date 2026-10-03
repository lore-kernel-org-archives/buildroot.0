Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC1ACA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B8A5411A7;
	Sat,  3 Oct 2026 10:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqwwOGEfFVc7; Sat,  3 Oct 2026 10:08:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0A9884120A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022081;
	b=SfUjQ0a30/MNVdfwtWNvuGaTogfrdSfrUymRIlhArRxt7uuvqHTL8upTXrBMRDUs+Fkq
	 FXlvvIvX1Xwi7Z34wO1yMi+wL5lPicqyVGCjOdjr4RjUY6E805Kw74ygR+q35rOsYTdwf
	 MIC5f/2zdE28NQSc+pNuJBUtvYfxC5X41XQ/2G72nWRA4Wppzl743JLR40OoZI5lbPcJ9
	 JOyn9rJG+bb4mVQHauevARbc6eBcv0JIZ1zZXlqHSy8KIPs8avZluB7pYGb5OAQHtoDBJ
	 CGFpw4gOqk16KRbqz+MEAWpkHL6ApZy1IegQb2Y5uUJBmELZ5uyCCtAD5zgVRn1GRvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022081;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JYg/NPcdzBw+wRIQfXC2mxgcWX7UG8MZvE8wnxLextw=;
	b=oS4BxbjFdxSleA5jjtQo/qYISLd9/v29upaSYHu+VIwwBRc5kx4jW3cCWWokKRHBzZjI
	 heaDeqlbfrFSZN1JU4Pm7cpw5PlhccmlybiwpGkNL+s5uMkXWrSw0f9inzKerr+iSvZC8
	 3Lj1RnShaWm5Y3UluryKflKd6Kc/pXsBXcpAG5In5K3nE14wOUCUyX1l+YxkCQK3LzqT/
	 MuM2ZwEkLu/X1OK9hV6i4UqOENskhFD3DeY+pCLmPZYYb2gXhui/ATyhEKix+Z5BHculB
	 xeWJo8xoOPUPeeilTGpKuC3GwPsOZjU7mJazbJGpFTwnNXwqYytLfeiAVvnFDJ4u1PQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022081;
	bh=JYg/NPcdzBw+wRIQfXC2mxgcWX7UG8MZvE8wnxLextw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lWUl8xX6byLXpHDc+GureKAEAx3iFTt7dgM8XlPeherhajBnGdF7waYquBLmo24D1
	 eIm0mhYDwxL2tF8X/zoPOHtYuXmdUJ0R7I835XviIBOlgm4q2+iezvDzCk77wJOB4v
	 cHVL/oAcalhmjAvVscjjR6IELXOir54ncVuqxxlUrmnog1lxpIwPMVP9G0SS53CUVY
	 Ut0akqf1GRCdVZmSazr7Ftb+5M4FSV8n6ILAcQySeTr8DUY9O1QRB5tpExJ2s6ERng
	 RTVJk6o19aZJD9xEd9XTHQVOCTQZV0KTl8xrzcoV98nFbtk5NwMqTLr7g179c3m65w
	 pgmFwGLOJ+7fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A9884120A;
	Sat,  3 Oct 2026 10:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30FAE179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DC3560E82
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4h3Vutf5Qst for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AF92B60E95
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=dh6xujtJemKFKOHng4S/lTtH+fo8JqMM94uoYJ/e49syZ2O1jidCcbaF6eH5VnmcmDqh
 TYbMx3ELjPGSDgSR3Go9482FPyzXFXhWqm6X+5RckNyEPg8Cu9s3IYKANZ/m8QRsFaHNt
 uQQP9CdaFuqiOHdhQohPjLv3I5YFVXt7KAG8gHwEsvnMd/HoPFEES743tDW2TWwfbEJrX
 RT2XmaFa2OJUSRaH+gyxctOUy440UaZiJw4+7jeRnBIQhrywg7tbGDoT++KXvT1kfTTz6
 tdWHVoqCifhg0Jj1rFbnnhX3BeuHwFAzZyx6bps72pjgMy1Vrt89WrJbMbK58Q8RiVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VcRYuyh9oUCbDLkbK286js9Gr7wz+BHJ5zJnuy+USno=;
 b=NfzXcRS9XvRTJFEWWH4ZUsPMNHB46F1XwD2dn6lurC+FcSOJW801aOfaC+1viACBZ9Or
 GtDILZZgJjxmYOOK4p3Oi/fqGRUi6y1wveXS2uv2sKd+ocNpr3eWBEQ44iVZFJ5VK3k5y
 //Z+tHw+cjcIcG7kRPJhZAiWQax77OsxWs2DhdxQSTaCxAYnt5/IrYlt7QCD58TRZxgUp
 RzmQRQd6A5aVze1qf2E2/BC0kNxa937EGSOux2ZnjyzCFgpqEPaDtWGZSG2Zz4IX+fzB1
 5fhs0OfrROv+VVT4RXVff1h7gFE7jaksqb4M9ORDifq4kuvcJpjT7bUZCY69/Gf6ASw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF92B60E95
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 199FB8875A; Sat,  3 Oct 2026 10:05:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5eabde2884837ce3733aa1ece7786a47b52bef7
X-Git-Newrev: 203eb431981caf6bf9fabc2593605b12564ba26b
X-Patchwork-Hint: ignore
Message-Id: <20261003100555.199FB8875A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvloop: bump to version
 0.23.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/203eb431981caf6bf9fabc2593605b12564ba26b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-uvloop/python-uvloop.hash | 4 ++--
 package/python-uvloop/python-uvloop.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 78165c2f68..874d37133b 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5  3fdd58ac1b7c2a520ed05e3151a64515  uvloop-0.22.1.tar.gz
-sha256  6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f  uvloop-0.22.1.tar.gz
+md5  1a247fd41018a438b73f89248e1c3316  uvloop-0.23.0.tar.gz
+sha256  28d160f51ab4da3b187063652e643dea6831072add4adc1e6d62afbe73b6be27  uvloop-0.23.0.tar.gz
 # Locally computed sha256 checksums
 sha256  377025287798f9dcd819e1f826fa5fc5e2f382528691ab0528c5cf8c8c282c27  LICENSE-APACHE
 sha256  6dd4c399f26de043d77a2ad7e31db4cb5bf08ea8368b0a42d6e158635cc8ab62  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 419ee33062..6f5767d165 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.22.1
+PYTHON_UVLOOP_VERSION = 0.23.0
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/06/f0/18d39dbd1971d6d62c4629cc7fa67f74821b0dc1f5a77af43719de7936a7
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/fa/42/02c739ce85fb2ee8d99212c61417da8140c6b87e9d97c430bea520d76044
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
