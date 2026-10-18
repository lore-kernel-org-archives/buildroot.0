Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2566CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B27E407C0;
	Sun, 18 Oct 2026 14:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id insnmw3VbMN2; Sun, 18 Oct 2026 14:24:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 87A82407B7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333489;
	b=S+O8EAd5DHPOlWx4kZ1WmlXwopD1IU8QDlCzVhoLxwHNFg4QDPq3mBmx9JH3f0t2+5Oc
	 KnEFfrj/eOcQRp5k+0XtBBcyGZCiJ2i9dr2S6jTjji5ibQdyBj2ehgDidwaiAtPDLV/d2
	 bTKAeLYpVT3+JXgYCKfM0C/IHOAZ1zz21rWxmwQnJUDgUizXbgpKD1ygwueSp4ZFd+VJM
	 OGAIZWyzqU6Ge/2Ai80PMNPUpwCqF7Qo1KppZ32TLcvU3XMxUvijXRyJv/Slh6MTU+mxK
	 xDXRi3e6kMn63pwXkAR3TdbqX3iOLibAGJkWIU2JWbSdChtsFCn+WSAnhkTOBG3fOVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333489;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZDqlf3jVKKU1xZTc6ZRjxLqmOm2YLoN3OVQZiHeNQWQ=;
	b=L8mVKgzM7dtdANvz2VZlSuFSABps1bNg1Y3wGqeC8ZIfpAsjYxSREgNRVorbjMTqVIKX
	 DgB7EXWxN58YHyoutVgpacCwGvso/KK3K3eNDmbhEcngMP3ZetfHEyDso0WN80w9P8a/P
	 iO1d4J8cHVrqlHbvpGuMJGmVjYvgQdbHcIt8EsaXXXFcpfJS5iWOwOfY0+rNeESZ9+wS1
	 iajHmuJpWoUf4MCu1GR7oGRAuLDvpSbYNgF7J9nWs14qShRWfORWaTXami60tGuEt2Gne
	 RilnpSpunGUHSoJ/uo2+G+Oqqnz5/1wiNfuE1Bfck9+8i+KhOJiCVjU0xwRX6b9QGIw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333489;
	bh=ZDqlf3jVKKU1xZTc6ZRjxLqmOm2YLoN3OVQZiHeNQWQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MPAEQwD7eKwCBB1h+J7VeULITFdEC/VBgocE/Didspy9wkyOsOwL2+2+tFWRST3ci
	 wICo1yaXnKRfiAfbWtQbXhm54EP+1pXbvDnio7Tss81HiQyz9FAiVGjOwywvORRZEN
	 7kBsfxo7i3oPNih7a1EfoYZku4JgQCfteoux1/mTe0iwsfQ0XvE3MFaEaKTJsc45Rw
	 P/2JAOhxE1w4w87Ty0P4sjkXT87ojC+eyJ04b+8qhXYZo/TMIRqwSkDwcODWKLevzk
	 d7lDZ3V6GqWH0ICVLuc3tEwlU25kAxr3JqH0MxAPLdkM8ajwPMXX4mJ4X+4NtCu2cK
	 cVxbjcW6DAURQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87A82407B7;
	Sun, 18 Oct 2026 14:24:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9552DCF
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AADC2401D5
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRMhk9c-Q0Sq for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8DDAF4020B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=E1xcL5macf7/RpivTbRt5mcBWwh7dj8NBUAFUl68I5j4Yw3+n7kvp5LpHAYvXkHnTfSG
 1QT1sT77ryodv43m5d1hMNuaqZbo3veI7hhDQ2o/JgMowxttMS+r2yX9m//arl85vNent
 6PWZjVI7x0fhJkj/kyR+ia/yrkpQrz/mxFO9jjpArjkovOzXfV1luyh4pf+HFNWlu3GGQ
 cybTmBNDIMIjUDAHNVm9CfVcXfwrMLX+Dz3/vV+ffsjJCZbRbzkH7iiMayWlFj6AbMQYW
 UTinHZ3GrMICV4iSTVZw5cdBEjuvObkLcBLI84CEonFvvegsvCJvqwPQAkyFXeWhTXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=L1J7PqNRTUMC3VnHcRGSXm+nDzJ5j2h2AKzMFZR4jtw=;
 b=L8qp0I0HZs40TGaMFP1o+JvNZfC6Kh8CD1aMvP0y0DvCFj4J+9Uum9J1PYRoSf8LFYTr
 vjLtLzcmnTQ3g1qMKAdAKttiXEXdJgDjPVy/3gpNkl1TUKluIAR0orbpoiVPHWkiySu0s
 sN4oZRMnc8REjqvTNljbcXN0R3Yf3AmTCtlkkC3svjXY5KIvHk1B8qjyZNS/D1YfG+zOQ
 17qYJcoflC+nGY5x17Nz+4/tI7mIYVPfZPieLyjh3IxbMXgWtdDsjTQPEJa9ji6DRHM6b
 3AjNH8A6jCZU03TVOOmxuzzLhZy02rqvUMjdqIs90WTJ8Z/k6cOhPGKFbKhJzndGQAg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DDAF4020B
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D8BF98283; Sun, 18 Oct 2026 14:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:58:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd0af3779b00c04d2c30a7e776e6d0a49f342c2e
X-Git-Newrev: d2948891d071509337e91126aafd061c9ea246fe
X-Patchwork-Hint: ignore
Message-Id: <20261018142304.7D8BF98283@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zope-interface: bump to
 version 8.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2948891d071509337e91126aafd061c9ea246fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 73a4c7992e..b8bf10518d 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  f430c7c2cd576867a9908a5ae13328d0  zope_interface-8.6.tar.gz
-sha256  b40ef9b4873afb5d0dec02b8d2dfde1cf18c72337b60c99cb735961e0bac05c0  zope_interface-8.6.tar.gz
+md5  d73d384affc6ca657c14abe048d8aee1  zope_interface-8.7.tar.gz
+sha256  0b47b62e8d0d99b24bcdd32f4f2120425e5019c3bee2ad69a0e1d75737487a96  zope_interface-8.7.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index 59255ec906..2934485640 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 8.6
+PYTHON_ZOPE_INTERFACE_VERSION = 8.7
 PYTHON_ZOPE_INTERFACE_SOURCE = zope_interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/26/39/a8481b926e42c44a6fcc670904f8251469ec42edbff1ba066719ca1e7fb4
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/de/ff/a1f0021a26033da0df223fd05a7455d6d2881b67daf2c6dc897b4fe0a427
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
