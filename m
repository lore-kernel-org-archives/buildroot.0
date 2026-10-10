Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D81ECA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F103B40967;
	Sat, 10 Oct 2026 12:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUK58MR017H1; Sat, 10 Oct 2026 12:11:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 209774097C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634268;
	b=NERaITJoRT+pBAufClO994kY/XCL3ITl9ayERvYIqfuYO82978W9GjXY8iekmaDREqoH
	 t9RnnDJpq2YaI5scgOiDVrfnMY/ZkKmY9m0v9bDoO2xKTDh+RJ4Jf1vU+/SATEb4TEbh0
	 HiCbY7rFKBsYoHs1We/lirDhbXRBvuUcCYJcirv6A3YOL3PU6NiqBeVMGPYgsAn65Gj9/
	 KmAjPNrYvCW69yRiFrkcS6bnSXOEzEK2amkjMmoqLoQptXN53TUD4lcD1uqqbzc1m9c5+
	 MY41WehIcTS7iuVuyBsqym36SL66wYthxfdnkOexDzr/SeeLed7ykdKMYd9oBpUWVnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634268;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+bb18TR4+hnMGH/tqIb4k3xb31a65OWPt8L9GVS8OQE=;
	b=ogyivx43zg5koNN/vTT1oWaY/ei9y7bdlhEbuh2WHnrd65HPigZcQc38eSIYHSJN8eO1
	 XLyuyo0tpPVvJVs2Q8sfjAUkIMo8UsSZDBgyinfm3cxeZw+qfYMPEahVOLbkppNKNrvYx
	 j/NQgFhnSfSf3YaW4crSXUKexMu/XTUie0n4yt5bvXfenAXv0CdO+CrahDOm7rZaD0+1K
	 31tujnVGKr43Ms2C0CLLRKSClKbK+k1t2dwaWaEY63c6VruGJFDkgQl6/hC2ObNBE7DQx
	 /U1Wn2GXaOrC+oXHojFpoSjim4/mkCa+5mcEScr7q9Iy2A0vnLHJ6MHXuLInnEODoAg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634268;
	bh=+bb18TR4+hnMGH/tqIb4k3xb31a65OWPt8L9GVS8OQE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KIKnHSijmeOdZOJyvL5/3hiKUl/GZuEWfi80VACls7hBNTHkqpXDPY7d0S+RRuiL0
	 +p02vI0MTRxMBwFNT5r/g2vSmpYDJUXC42eB5pInq/dtgciXn/aPveXeUzvS+19Hf5
	 UNRe1P/FmIx4erEao1CqYSDBA8rCpJYeE8ebM+RGJnFjNno5rwxw1MzHT2V8jhPUWK
	 zZg4x3GjnUovKB9vDDh24uyRFk/pkLWuydnYY2dY/l/DzXQjOLIQ6vwxBlaoK2xNWQ
	 zS4qdezBTjqQDNRzd3mVG+SuYSPeXp7Sz4JLi1D3uyyGR/1tEWhmpSsEx1kzBihrrc
	 Fok5VwyzVIxzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 209774097C;
	Sat, 10 Oct 2026 12:11:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7BD022B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD9174094B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bh728xwpM1dA for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0304740884
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634254;
 b=prTq+3xDUHSyhG4nRnc3CuMXjym4RlMPVOTCRLmMwzg1pjX3ll2sExj0qWBPXw3QR5/e
 I0sB8QmD2P+BmZy1Ek9tx4GZJgpUFK1unhxRZYIfs/BOJNrA7CmPmjJ+PMmEshyfPhjyv
 zwy47gqCKezwBQc0VFhTTQN0FieM4b4kae9/zPT+9y7mGJHyjg/pz9mSByXgIKreI9l3J
 ektQw/Gk6IXfhRYdc1PYkkRBBMTgLrQNTSJIBRgfyxyf9NHN4MZYg4D2zPSADSgybDcoh
 +jpHa8dv/oNqMc/bQdk9k7xET8q7rkw2+vD3826gR9Re9FCO1UTG5ctVaHBmkU71Qdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634254;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=bbH55F5CotAWfGLam6xjr1PquywPI+gervzV6hf6yFA=;
 b=f4r2vpz6kc/YGxbuwky3NG5MZDERUU3cQjhc/KR6K0XZEp7rFW/7H16nk4Hx525fHaLU
 rjQYqngXTjlev9vnUFWA6YSZvCmgNKTIg9FGZcjnHsqC55GOVSQ8LKybVa1gfwa8+C/SA
 Gj/dizkOlyfD+6Lw80NsjpZrbsZB6ZPAG8uLGHk+yAKFogyT4Qcqm0Jx8ux0c1ErRLrEO
 OCSLEt4HEpbDLVvjCTMDHIwmdTWHfYHf1ak1polsUIwjeQ8oIG1zPeG4y5wcZiwXMPzpD
 MFvlQCVOTP2ab7eVdcESW1yaNswaz8wPJ1lGCfTwmYVk5VC7070Ax6zklDy9QUjvXng==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0304740884
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C799D91A3E; Sat, 10 Oct 2026 12:09:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:08:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f32262ad1316884246b3f1c0479624ed1ac159a3
X-Git-Newrev: 40172529d2524f82c7a8503dd6871736b1071d38
X-Patchwork-Hint: ignore
Message-Id: <20261010120935.C799D91A3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-chardet: bump to version
 7.6.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40172529d2524f82c7a8503dd6871736b1071d38
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to the hatchling build backend.

Add the host-python-hatch-vcs build dependency.

Update license to 0BSD:
https://github.com/chardet/chardet/commit/64eac3b1824913a001ce255f766a54d423fed5c6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-chardet/python-chardet.hash | 6 +++---
 package/python-chardet/python-chardet.mk   | 9 +++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
index 87a5567636..154986d735 100644
--- a/package/python-chardet/python-chardet.hash
+++ b/package/python-chardet/python-chardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/chardet/json
-md5  cc2d8cc9a751641463b4f7cfecad2ffa  chardet-5.2.0.tar.gz
-sha256  1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633b2dd092ca39c1cf7  chardet-5.2.0.tar.gz
+md5  728517f43e9a435a3239d60d1ab35270  chardet-7.6.0.tar.gz
+sha256  93d9df6089ded42ed1fe9f57e272c0b74bd0464d45c0c7d50f09f26f31105c3c  chardet-7.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE
+sha256  0d4cf67e7a26e9957b8948e7dfc0e380e61b427a94b061e618889aba89bb9616  LICENSE
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
index 16e5f303b6..4087c1cfc6 100644
--- a/package/python-chardet/python-chardet.mk
+++ b/package/python-chardet/python-chardet.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CHARDET_VERSION = 5.2.0
+PYTHON_CHARDET_VERSION = 7.6.0
 PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
-PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/f3/0d/f7b6ab21ec75897ed80c17d79b15951a719226b9fababf1e40ea74d69079
-PYTHON_CHARDET_SETUP_TYPE = setuptools
-PYTHON_CHARDET_LICENSE = LGPL-2.1+
+PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/b1/51/cd61c567092a6cec796144510a68aff158ebfc1df82950a45bae65f28413
+PYTHON_CHARDET_SETUP_TYPE = hatch
+PYTHON_CHARDET_LICENSE = 0BSD
 PYTHON_CHARDET_LICENSE_FILES = LICENSE
+PYTHON_CHARDET_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
