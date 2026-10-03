Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92323CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B89A61057;
	Sat,  3 Oct 2026 15:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18zfWIsmLz9X; Sat,  3 Oct 2026 15:57:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6DBB26105F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043028;
	b=IZsT+wEFd+1C40bACsZJjgI/2ji8puY16zuWxd6fTTk6HF1+iCKr/ka2trLwxbHfonDu
	 EVjHj1piWfg0l+FKiJKuT1OoBrbYHw4PqljaUYpzUv3wI73o/x3voLryJVTseslzi0c0y
	 WHVORJAGj4KG8rDrb/KwSa+ClM7EJiQl1i0hCvPaMaaKnwQlcumbIOPPgGh6UbsiUSLOU
	 Mrfe+Tndonr0Y+vP57Yy27J5/YDBBw9XqaRdZILvjS4T3QVBU5b3f3KaCt6/KRTsMBhDR
	 chkIw0x5ef+1QD7/wYW82XtSKRwaxd2QGoiA8jIUWOfRWlQRGGC2mCuPJyR6DQJwMZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043028;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WpPYXKcUiWRB9H1p5MWQxASmJqjBfR86nK6+T1hMVMk=;
	b=JtB+JTeuHhl5GgKuNbEwJN+y0r2VsbRTXHBxYrY6r0fqfrGN80RUpRJx2jBG0sCfABIv
	 NRuY2jAtxXYnOFKg/KVObDrLkf4q80irmUoeoPQvI4Fk/m0IlerBfD6iwpHeOTqC2C4IL
	 Mk4Op4OSeR9/dLpqwNL9RwCZcLkWIr8B54oREbtp55yyTswtR/QBOupnwJT2WWf/22Dfy
	 gml4NywqqKnbH68+mY0hFgwo8S5kfGa8T1HvZ2GR5Y1Tm7TGqPCpc+o2ecav0S0EH1ANR
	 +Mhfv4BS3rah/PVSHuUTjQu9nu9EPGyL3OydNO0JtFypsiQmYXLbmBjN6hvptI2tBnw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043028;
	bh=WpPYXKcUiWRB9H1p5MWQxASmJqjBfR86nK6+T1hMVMk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WEFyOtsqz6FbvDdYTVY5RUSihrbm6mOE39FeNOcx7v9YQ3pOjvcP+oVDatKRGhFHI
	 NANv1iQznF3gZqdArcaNz/DedWyu8zh12WPtyNG33YnOoIE337u6jkpxzKv1gqTlSU
	 HnF5bTHLaN16q7VMNC9Tt5oiBemAPXC1ZjsncGUuxGEqRUpXk837CffWakIUegRHy5
	 Zgw3C17Qii65JHmnXww2H5pf/GCgzERNNkHR9AAtEMoV2DzTLNcAu2JYpstguVdxoC
	 6upVzjKiVtpQizg/OLW+OshkAwCRupzQIRnV3QwX6SMEoEcq003Ypc4a8ecMp7zi3+
	 VRLwJlD1upo3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBB26105F;
	Sat,  3 Oct 2026 15:57:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 805619DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7841860685
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1h05p1TXHIun for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EAB45606C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=N/h0PJLKp8cS2cQQs2dFStuywHPHUKDwpDTf9NYxYkQlD/I2tfdFCFXObi10+eN7EAbr
 IFvUMcXaS+BG4ALqljL6b8fVeNwOAuKrdNAKyhMxDQvYiS5DBnEF7c5ef2G2U96NC7nG9
 muodB1+/fSwdo3mxQy998WZS/o08OCBVmL+n6h8kBvo1GN1iFeqxu0pBgUqABr4R+QhkW
 iCxycL1yJCe8J7Wc50oJb2BpSlCtSV3B1vsxipZ5sQEuY2ssArSi7UcoOG4x4nZn/NkGF
 GsQMOBvj1QVUiYdj8lHfzeq99X7T0NPG68Kvq3baxlMQk9uusytlwCA65emWT2zaJ8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Xerwo3nVIt+7sto824YzUj2Z++TM3GbnsKKySsTHm88=;
 b=qGibWB3oQw06QAjj8vBA0Co+1GT8uaxxjRn++K+2JzTmpgORXDYh1a9sdCKTO1RSEeEL
 DvOd47Q6TEEpDqYOCwNGrmqKkfWljK0lU/lFSPUbzert3tqsQG+1laMMIPads90o7DaWh
 k6LEVdai/ObDp6/9vv1NLRtceJXjSJoAT8xTPytx9TAKbXwZhYV2jSg7XPwv2IlgqL60V
 0/Yd9v2uopCMFQ+rMaNy0qGznZDfcNRulW6iCZcnqkmT0/DRrUJPSb3GQoS7YYiOiyM6o
 Dqp/zSZu+4GbpJ+1P7RwEaTjpUAAzVjLReTeIC+nmhLf/QjpfvEJq7gsSeChsusuE7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAB45606C4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3731D8A342; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d01ff11ed9a5db050fe6514a4c79b6b3e2b4c97
X-Git-Newrev: 034373fb70bfac4b4b65152f4d30704b21cfb2aa
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.3731D8A342@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iterable-io: bump version
 to 1.0.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/034373fb70bfac4b4b65152f4d30704b21cfb2aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pR0Ps/iterable-io/blob/v1.0.4/CHANGELOG.md

Upstream switched to hatch:
https://github.com/pR0Ps/iterable-io/commit/07fc1f02298ad9aec22da3e65382c6c7cf6673d4

License file hash changed due to unrelated modification:

-This package contains extensive tests. To run them, install `pytest` (`pip install pytest`) and run
+This package contains tests. To run them, install `pytest` (`pip install pytest`) and run

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-iterable-io/python-iterable-io.hash | 6 +++---
 package/python-iterable-io/python-iterable-io.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-iterable-io/python-iterable-io.hash b/package/python-iterable-io/python-iterable-io.hash
index 1407153935..c51610cc9b 100644
--- a/package/python-iterable-io/python-iterable-io.hash
+++ b/package/python-iterable-io/python-iterable-io.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iterable-io/json
-md5  242753419dc0cfbf09bd0fc0fa09e322  iterable_io-1.0.1.tar.gz
-sha256  55db222c5914097a8508dc722f8db6112f636a04a8acb94ee6589d9b14bd4bb7  iterable_io-1.0.1.tar.gz
+md5  107eec70d227ae73ae6d285a6396550e  iterable_io-1.0.4.tar.gz
+sha256  63b5b394aedbc61b4409a0d213130a4d153c602d1eac9dcff860a43ae0340405  iterable_io-1.0.4.tar.gz
 # Locally computed sha256 checksums
-sha256  1965c87639963d053bce1b662b86e04ce22f53d2c39f39ee416745b1fa9e6b2f  README.md
+sha256  c4f4abfe995a0cae92ba76ac346493b6ca76f86fb406ba8b65038c71f37886e1  README.md
diff --git a/package/python-iterable-io/python-iterable-io.mk b/package/python-iterable-io/python-iterable-io.mk
index 485dcc9231..96c4712265 100644
--- a/package/python-iterable-io/python-iterable-io.mk
+++ b/package/python-iterable-io/python-iterable-io.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_ITERABLE_IO_VERSION = 1.0.1
+PYTHON_ITERABLE_IO_VERSION = 1.0.4
 PYTHON_ITERABLE_IO_SOURCE = iterable_io-$(PYTHON_ITERABLE_IO_VERSION).tar.gz
-PYTHON_ITERABLE_IO_SITE = https://files.pythonhosted.org/packages/9e/ad/cc53869e3357520033e3ab9a7d6043045bcdd666da427583678efdbb446e
-PYTHON_ITERABLE_IO_SETUP_TYPE = setuptools
+PYTHON_ITERABLE_IO_SITE = https://files.pythonhosted.org/packages/0f/c5/c3578d4ebc1f0e80c1a321b9f81a74c4486a6ad48e2a3dd1d228e3ba6199
+PYTHON_ITERABLE_IO_SETUP_TYPE = hatch
 PYTHON_ITERABLE_IO_LICENSE = LGPL-3.0
 PYTHON_ITERABLE_IO_LICENSE_FILES = README.md
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
