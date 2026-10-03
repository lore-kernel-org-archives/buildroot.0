Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3A6CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 197A0816F0;
	Sat,  3 Oct 2026 15:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gc4ExpfsVcHI; Sat,  3 Oct 2026 15:56:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2E42F8175B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042993;
	b=VERvFoVbVSGRrmO20psD/yi/JfMq3WgPEUnd4ri7oepMYYccwr90Djz+RKmFxVgAaAvu
	 +/XHhRkepp8j6U6sAsHDJgiF7xVIvzSn73/SNxARxLSpkNd/M0CNPoT4QyvcoCWcrqgqI
	 M+oZpRxcHh0im/xrbzsWCAWGNXxMuJSFUXfCMoeiXos8dYYf/OXF9pQn+50dcxhxKr3OE
	 ABSTjDMkl3Ef/kQWYPNbWrC5iW0IQ8wHDTX0GU/3t/btu7AkLI21XW8qgu1OwifpP1DSg
	 gVkFjS3mT5fpo1dF7E0dh90G0I8cQ60TUEYm1jwCwouoOLblFdeKBBeLKO18jdkzLAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042993;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7MXnJAisQbsWh5htSoO1/DYxTOF/pCRqjDmA37Z6nfY=;
	b=mZ3Ah6V65L0EGlxfyShlTjKfl5K7ckmfU3+rOlRqK010akRvMBOFoQ5B6bqee4SJABgQ
	 cgKLSrl8hFfCI2pRqIiY/c2o9wXoXGdp4zb4gpwsEXQ64VpGbODODrl/0n6Z2mUjbupiB
	 DObDgY+tc3qpLmdHTG7IBYDUTGVn6TPUt5xbadBcclYf+0hsw+QMy6G93eIhO8f76Hmsa
	 28huRPA9LguUswp5sgq8Kx9UD0IJTbXB915VfOdEj0PO0vyK1DMnSS50OMFlFOWpYfpxE
	 eaJvc3y3vrCMNzkn80bUIc7BrhGGKehQNOnuPDrUcR4ACg8CnJC1jj8X5rZX+eApEBg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042993;
	bh=7MXnJAisQbsWh5htSoO1/DYxTOF/pCRqjDmA37Z6nfY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D5/l0n3nQloD+GlhLLJW8dwo9T/yN/rYtkyfsPhBCU6Lan29oOjXHZcZEHuJF4kDK
	 7bE6hgTaY9RMG6UMoUOxGr43rzazxdLKtwJaiOBryHJ7Ib5lRPb0nPxaYqeql2Icp5
	 j6w72Xeb2f9TfhSO7F4mzlC0sfT/s/R0G97O+XvGH03Sj8wbPMNpFbKVAuYiM43Kce
	 tqKHzgLrUT0R/C9fcLy+y7wzGaUDINzx4kHQ36kVvD5vkv9rgpCzo4BonC+7I6vbnY
	 iTrsQmOtcfA9TCHLcNqsm74gHE6/IgcCAB/VaRKIXTTO41GFWJN2KhwliS34evS9G1
	 gwg2Ud3LwNzsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E42F8175B;
	Sat,  3 Oct 2026 15:56:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5274476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E7CC60680
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkkWkrGaDbmb for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EDD1A6064E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=gxbfoxJx1xqxGjZ3XxhzNcyXdIIiLMaUZAaAz+ORgUTYli/iIcmw0rLZ1Z5GnzvBASFo
 LRbAcJ33kOgAVpKTC96ix9uS72/eLt96DX7IThD8LkLGZD7TphpMrH/zxi3k+nDvH6Lyy
 Ba8d0I1E8e+QHQUQ+9A5zv9xCS5m8ayKDSpMzjFelFQjfYIC1YY/2W+BESgw1ITLIOdvH
 RA8W0/7YJYl6eRIHE398hwb9/O2Mmibm2zUAG/QnGiS+ZNXcXAjeezmXQnHD4fCoxNNZS
 LCdOqxoGoRCOwxdp3twKCTxvpOQr9ERQb3BgukgnjHG5y0AvBWOfh81FUTWiBXnhx4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rbaLXDTJQobMzXx9AspzDCc2/mzv8IqLr2XxTxxjzgE=;
 b=fPiYlgTCFhagtrU+mYnxLlk3O7vnLbTApDIsSS84E94XHRA/ThfT4YWnRHjr4SMpU7Gx
 WT+IjXz8oNueSbTjVR2eL8/XjsJGRBU6WynOEHqcIT/s1jMu1Eaf080Bl1GL78boJQflN
 9Rm2qsBo/pPeP3phOJoSnrfpaeDCqn4oaB2/2HUJinv2gf59aUIn7D833lMFupBiCcZfo
 +ep5YSV5X4GY5GmZRPecVmpiJpd4Ic3YuKiWH63nrX9iXu6wp1Rx1PrLx2Lw9WVQwbRJB
 YZGoGJwFiMwtYlTKuQ/ZR+tvmxxi8n5zc7orjHGP3D9ffQQ/LJRtqIIN15OLE1PfE6g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDD1A6064E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3ACF68908D; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8809a9459f746053520e6f73bb6d3f81e21c4181
X-Git-Newrev: 43c6cc430226224db3e8eaca374931f6337627c6
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.3ACF68908D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-docutils: bump version to
 0.23
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43c6cc430226224db3e8eaca374931f6337627c6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-docutils/python-docutils.hash | 4 ++--
 package/python-docutils/python-docutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index 7393c029a5..fc3ae0ec80 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docutils/json
-md5  58f718cd60a87725d4dac56ae427c9f8  docutils-0.22.4.tar.gz
-sha256  4db53b1fde9abecbb74d91230d32ab626d94f6badfc575d6db9194a49df29968  docutils-0.22.4.tar.gz
+md5  39d10acfd1fc81b87f5de84418b88be9  docutils-0.23.tar.gz
+sha256  746f5060322511280a1e50eb76846ed6bf2342984b2ac04dc42caa1a8d78799e  docutils-0.23.tar.gz
 # Locally computed sha256 checksums
 sha256  6ab4f27c76c74f96e5e692da5944a6f82968f3bddaac5660a4aa723e70eb5d8f  COPYING.rst
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index bad9ce56af..9de630d786 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.22.4
+PYTHON_DOCUTILS_VERSION = 0.23
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/ae/b6/03bb70946330e88ffec97aefd3ea75ba575cb2e762061e0e62a213befee8
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/39/a4/5180d9afc57e8fca05601dd652bdff19604c218814037fe90ffc7625a50a
 PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.rst
 PYTHON_DOCUTILS_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
