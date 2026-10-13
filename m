Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66723CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF7760818;
	Tue, 13 Oct 2026 20:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOxlaFvuan8r; Tue, 13 Oct 2026 20:52:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4844C60819
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924756;
	b=CUIP7Yvaeuweg8X9g7aPPgyeBMmzNpsiZqB8/G85LSulvxBFHNHlPOQIUK/ahTz5DlaK
	 KlwYsHWMj91HQE2YKoSa3UM2WExW9ZPVScuEoCe9ThQtOUupEMnjKsYAUj4ZTX/PNa2sP
	 VmxiZdQtQif6gIO3Jgfqfs3UNXGPFzRXXJ2lhRI7Bot2er5+T4j0XVfIGZywp0hG26ykU
	 6aOLtIjs3BQ7iJwTLJJOovYAfiUd94MRxuluOLpqTTBtkr2zc5SButSfst598OFG2344w
	 YJHBr2+MGMK2A5URcODyfisOyO39zlM5TPwZlVGsJ8QazCIYZ84fhbz8OZjecFj3rwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924756;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=r8SodOCKWTW3EHav53iuStdQqleTstTdNxOXX+zh1Cs=;
	b=fHIoVhtB/eeRpyEEDgZ9CUaoUgmkufPHcNIeg6elJYLIsnHJTzIcSf/qTSSzX99yuRlC
	 OAao/X6hWfWqyOn1lLQky7axJDbBlsd1XTdu9wAfib+503gyVCg3nGeQkjaWGaveES3+5
	 KrzjCmC7bbwLz+HEEcQvooywCGOP4t9Zum51he6zVg1fhdrNj8/Ciehmrf4XRwrljdm5c
	 GkEomBFTgb6jkWciXZREB379ajLfWC0RgqLixP+eUqdsMUbYzMm9IXUNtoux8v++t8ING
	 X9uaW8URwo9T5hkrEAg6jVaVYDa5WNfpI2lu3g2dAJ6LDKPIQrWxl14iD1ymmwhj9gw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924756;
	bh=r8SodOCKWTW3EHav53iuStdQqleTstTdNxOXX+zh1Cs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=alPoS+0lyCsn9dNB4MkFjs/8/GIdSRZIHNiswWyFKi2PiMbfsCHYb6HUx3Pyxl58t
	 vx/CRc9PXn4IY+QaREkIcx3sIwhL6wlI7k8bWIay/+f6/cZILSJ6kkibGrr4wppHv9
	 LwsRqEVG/zgE9xlChBhopDm17odl6RBhNS9awz42rlGSLpXYJhr8/fitXyvPoeodR9
	 PtO/zsxUCvwH/7tNCNng0KJp7yrPBKi2ojtrc2nPZ9r61KrFbZGzbESvWzTakaA1aj
	 ftvET/OTmdePQOnywWVTAQXjYWGpbU+6/nk5QZceMuu7ghbRgjXhhew6C0ibLND8gb
	 s4g79i1qOYA9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4844C60819;
	Tue, 13 Oct 2026 20:52:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A1A6788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ACEB402AA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mw_QK0rxTxPn for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 95F844008F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=p/3JbsC/DzZakRbxSxS6cE/XWi0tY898GFk6lDh/F3gyQGmjEYPD3bYcIrv++XfON2FU
 esRqxhSIjhCYnU+SigndqsY0ueifLWS8bz79uBIeniHvpGR910Rd29QCZ9YPWmuL/oDjU
 Lrfm1D+lvgKV6kOfPARyww0zkVTugNY1rpHdBBRGAV7BXDHL1kcsK6FMxssNxn/lT31wR
 L5qQmwy+JA0LT/iK+HB95yBynf4wjOddTNhhUmMtsoPvlAEzAHB0gi+r745Hh98exlZGG
 QLMfJa0XFQ78ZKDB2U6BwTqyb07ju74G/mOlhPCv4z62DF28KOBtCgqoXhVOpAWAulA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SueahecvoP0Sy6zR350HfRd83PMrrx+CUU3K/nApyuc=;
 b=DM1ApVtSV0PTEo4vnzmxshVJuSEko0H78E2qnPYZUZQDcvvQiraHMFHrGnh5oToSfSk2
 rNaDVHg3EZQXWio3TWycnvNd2YVtvU++oihDgyiWZe6oLNM+qmoOHtCxcSU6ka0YheGJU
 rsVSy+45DGdbHoj301rNg5jlM9v4rGu77dPvQdbF2YYo/SrXl8KpHNTWw/qOQeOKi/sqw
 7hH8696xRcVodSAgJaZOC12GGMNG1/8yUCrI8qN/qlCGRXlAf152dwutmNnnv9TiF7Bfo
 u9QgENHYcJFmv0uQKMQqHCn3EkmV8svCHf4Ycw3dwCGWTVn37bolzqAKoRU6zegD6AQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95F844008F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACE95956CA; Tue, 13 Oct 2026 20:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:42:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b15f3804dcad33e9b1ed1e4f72c1708d2def38e
X-Git-Newrev: 6f8c9fa81dd39d1e426aade20ebbf11f2677d161
X-Patchwork-Hint: ignore
Message-Id: <20261013205105.ACE95956CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-contourpy: bump to version
 1.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f8c9fa81dd39d1e426aade20ebbf11f2677d161
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the license hash for the copyright year change:
https://github.com/contourpy/contourpy/commit/df247e3ff3102d2db3cbe861580fb5957ca9781c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-contourpy/python-contourpy.hash | 6 +++---
 package/python-contourpy/python-contourpy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-contourpy/python-contourpy.hash b/package/python-contourpy/python-contourpy.hash
index 2d5acb2375..13cf8b67e0 100644
--- a/package/python-contourpy/python-contourpy.hash
+++ b/package/python-contourpy/python-contourpy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/contourpy/json
-md5  3592ea8e491e04fc7a87721e0beb7b0e  contourpy-1.3.3.tar.gz
-sha256  083e12155b210502d0bca491432bb04d56dc3432f95a979b429f2848c3dbe880  contourpy-1.3.3.tar.gz
+md5  e44efbc1575ba21c84e7e925130119d3  contourpy-1.4.0.tar.gz
+sha256  20156f5a1ac4f8ce02656e39a61e82164a3d359796dc8026f75b062783d500e1  contourpy-1.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  34170979fc64f4f5e6dfa66ef27dec314ffffc5852000c60f4836ec1dfbf156e  LICENSE
+sha256  11401c428c7014a75728e8679f9c000aacf262015aaba65a760d41aa1130b3af  LICENSE
diff --git a/package/python-contourpy/python-contourpy.mk b/package/python-contourpy/python-contourpy.mk
index 4fe04f5f71..92f91e164e 100644
--- a/package/python-contourpy/python-contourpy.mk
+++ b/package/python-contourpy/python-contourpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CONTOURPY_VERSION = 1.3.3
+PYTHON_CONTOURPY_VERSION = 1.4.0
 PYTHON_CONTOURPY_SOURCE = contourpy-$(PYTHON_CONTOURPY_VERSION).tar.gz
-PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/58/01/1253e6698a07380cd31a736d248a3f2a50a7c88779a1813da27503cadc2a
+PYTHON_CONTOURPY_SITE = https://files.pythonhosted.org/packages/83/5a/a55177dd22553a277388e8a1b3220e92de91bacb28356cdc73caa240121d
 PYTHON_CONTOURPY_LICENSE = BSD-3-Clause
 PYTHON_CONTOURPY_LICENSE_FILES = LICENSE
 PYTHON_CONTOURPY_DEPENDENCIES = python-pybind host-python-meson-python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
