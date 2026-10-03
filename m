Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D12CA5FEF
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CD5A60E4C;
	Sat,  3 Oct 2026 15:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILMTk0P-yhGG; Sat,  3 Oct 2026 15:55:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 75EB660E38
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042916;
	b=MXLedDX7l050Gt0yvpy4ydJVEkPv8vQDgITjnNEdg2av2JhdscA4koDRQwozKGsYqJFC
	 fcZ3Nd8Pv9trpr+zsnpeUlt0XlTNJ3OFJICwxhuLX7B8XWwcYCY6vKr9NyCjHkUnfsmjm
	 cSlJpyZ07BgPCH8yhIBpAuZtrJJ9jrgd0Xrg0A9OfF9u2DUqiLYSwUswZvrTXL8hhD7w3
	 0fAw4PMqFGsoMtZpdG8Q9ykNmoovecrpnPONBmdTfxvKXlmacBVstjeO5S5ohTk2cF5zG
	 /GcDLlalrrzjpSpTwUYMgFtNefMTRmF3IDoxaV+1wy3HSPIc+t3lFbyW8NE1kl6keiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042916;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RN0aSQrj9ticEKjRS5GqIxnXpB1DvTzJTLaTWARlWQ0=;
	b=PPvtsc/LxGZFegoTbkGZTSXL2FI9ZEnkGrrhNFSh7+K8flO7ry/Ur7X5cYp963osLOtS
	 yDV954NLYugF7Y6TnWAaj/+mA1SCD4S1rhAm1dXXg8o8GkDSTKstI6b69iAQ0kuD6VG8Q
	 oM0RgmhsKRBgVrmuIuqT1GD2LjFuaKAQo/+e51JMmORWaNS6i0AIghDS/vIKsp7HFFiDv
	 mkMdybBDChuKdbTqHg1SMmk3kR+el+M7gWTcBDEh/9Ye+QwGUMGWcsVrITBOCOmsH1n7p
	 2sN4icIexVunQiRzNcPrihUN5v0czevoD/So2FzNhyU/kZ1TEFl+pGqmia3/LDuBnMg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042916;
	bh=RN0aSQrj9ticEKjRS5GqIxnXpB1DvTzJTLaTWARlWQ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gwwNFurD0eCnIAZ4kSDYvfZna6DX4X88t5OoJ1v8dq2mfKeTwAD7l5abpW9fX2k1B
	 2TyJGa+EJ/2YyCVE9wVCy4Xk/z9IzDJZZHWXWcXF6iCGHhgy37HxP0WsQe3KkbC9xc
	 DXCa+7j0da9RYlgNdcFTTl2M8Zt0/Z+kCR5UFMsSLZUP5fy0jKB7+GiZ37kB3ix1vU
	 fMargaBZaYGvcCVS/aabapbAzQT2YAdtvdvQVupjvVWJeYAv3g/VjpURJxpgCY1PIG
	 Hb9/pYuQ3CWPlHPjmblYyzTvT5cllbRvsqeQk4Ufm/j2vjKfHXib7H7kmXfCY5evNS
	 JKJXv/sKOKeOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75EB660E38;
	Sat,  3 Oct 2026 15:55:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A07FFA11
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81A9A6068B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftsR41QewaPw for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9A4F760685
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=LYb3hSjogk497WeR/uCM6Pbh5NbMOageOIELmpCObhgpiyMZKhuwA8IXsv5953ZIjrSH
 mtkbVPJxK1N486xRJY3dekwM8e12IXzkoeH6YbM1wI/G/GlUMkrYcsHHbSkF66t/s0P65
 Yu0mwF7QcKTgqkISrQ6VYRx3RujuKNlU7N1TLv0g9pyLjGT4NWAOSAphP2HaS1Y9F4bFK
 nn37EmQtF3AMbGUR+187uyBvcOSUuJ1R60dGfU7xrwBwiKq9OJ6Sr6S4kKOVKaGcfQekp
 4hDezhRi7VX/tf/1oV9+ro/xSo+JZoh0yUFyd8IlJswLiMSQlz4rVYnTj+QFwgE2k+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LHHiNY5NjvEIEVOq3nARS5iM8fP85eIDl1IlVgAPEoQ=;
 b=pfXC02v/aTFjC7hX3tFpiBBmSYpyggbGup+JuCpo20jHOfHwxd7kmtWEtJHvoT+tf1kP
 w4CxSbLD5472ufSkYCcaeVyxsHeQukkNim85NDRvqO9cR6k70Sp2OR+ZY5ysxoupAM3Kl
 eVFWWEGf3hkMpwv1yuhs284BnF1KwH4UX1hp5VvPcESt2jg/nM07nwj3zK8u0o+Ws5Rtg
 5NA/kZ04ppj3HFnyV/BXf2cVvrPmVtrM/UjZbGnY+8uUt6HIqbFaXwv4m5Xi7e4vAQ54Z
 fTAkEzTph0rbEZFpZZ1MhNGD+ksiD9XDTY4Gfh+KvoBbUp5y5z3BN4IbxcYP2d3BmRw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A4F760685
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB489886F7; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49ede56b2999921a7d6df77bb54d27c370891b42
X-Git-Newrev: a22cfe30c4cf6c1eaa35382a9bd36aa6615c090d
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.DB489886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyspnego: bump version to
 0.12.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a22cfe30c4cf6c1eaa35382a9bd36aa6615c090d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyspnego/python-pyspnego.hash | 4 ++--
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index f74e9c2aa5..4b8763a73b 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  bdbd0013e9f7bd8d076c339af9c9a73b  pyspnego-0.12.1.tar.gz
-sha256  ff4fb6df38202a012ea2a0f43091ae9680878443f0ea61c9ea0e2e8152a4b810  pyspnego-0.12.1.tar.gz
+md5  2af96f8b2faaa4c35026332382c1b5bc  pyspnego-0.12.2.tar.gz
+sha256  448a491a9bf0e5fb957567fe46e6809fa836aa40dfcccebcc740bb64acb1be1c  pyspnego-0.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index ebe74bd879..7592eea3ba 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.12.1
+PYTHON_PYSPNEGO_VERSION = 0.12.2
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/7d/84/58577bd1b14293650879de0579ec263a1d8350f1d6d227226cf776b5a6a6
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/03/c4/790211e7a2180509dc29137c488c7b038ef89bdf83db0ce4da802f64f9d4
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
