Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB3ECA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69C8981509;
	Sat,  3 Oct 2026 13:57:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sr6uJ6JBB77x; Sat,  3 Oct 2026 13:57:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6D8A08153D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035848;
	b=kZkbFJZ1jefNqJlHx0txKtzQsr0KG80Yiv8tQUZrywX9kVSdw5GEYCAD0NaQKyvqssFD
	 IcROVVINOCcZ0tQOlR40DGu+F029HUlRbsn0RlP/ZReAQmYTWnZ64Iz7QaFmrdeMAWMF7
	 WXphxgddKscw+FNE1VGrtBKdW/ILWvzCVbp3fvUyfEOgKdvPZ6b0RlO35ClAwNeYUCOD2
	 9Hbu9fFKzmhUEUE6HL3WxaiT7svYD4+Im1TUgxY4HZFE+6S2Ij1yr4Tb9uCFE2gkLHI7y
	 rUV5ScanhLR+EwEN3ENeDMJ3RVkn7cZpCTBfsI59NaJX+pGGq+JFHDcQSmaYew1O4rQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035848;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jRTVazGxNVGL5a2+bT7lxwGlWoLGmCveFNSpUt343tc=;
	b=ACTBfrr3wXLmWfpUp4tGfLU2pEZDhbBmcuueGrXV/nkjXnYzMaRj1YNNpTceJS1U05Ul
	 0Mr3KQIPQwW0CJEbh9IB9noDJz01Hw0Q3Vq9k0sFGEdWZcL+5hUunjgY3uepO2m9MXM8l
	 gTNYC9ifMQVyzjK2NuBfN5ILKHPpnauaOQsDRZzozYVkhDMoOg0L7pt58maaL0jYW9NcK
	 oTz2DufjzbqxdnApti3281BrzOjIXE9XhCCnnOPpw1htoF/Usy288XDjKet7lQH8/WZEB
	 mgo8T2GGzT6MoMEgR5IU2cpZAyzVQoCmzctK8hEMNYUtxR5p8Wl3PkDTtjfj+N4NS4A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035848;
	bh=jRTVazGxNVGL5a2+bT7lxwGlWoLGmCveFNSpUt343tc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X2zsGAYbVuzYzLbr3pH/HQtQsiVutUfujbhVKrBn2uwOhNxax6oiJedu8rtVQuNro
	 cKbBUK3b1Cs+myeiHLzhjlsm2IbDiLMPHs0jDFfdc96L1NwIBDSVgTJboTdA4G+uu/
	 AN3pcY+jcN4Q2vaH8hkx6UX4dXWoAlyze0cyvUdl7nLmDDu6YO13tdtctPWCbcuqED
	 k8RC5tgwSkbW7U5o6BHOK0Y82PrnBVb42icBlSMU+XVv21eBDDtFd0Z3i7k2BJMi0H
	 jQ3htGhp+xmTbVWhV2Am94UMvEcJTp1XHFkzn6CR05T5s5heOFOAToB/qqxplhkTHc
	 0UyF80neKzxDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D8A08153D;
	Sat,  3 Oct 2026 13:57:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F37F89DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFB43414E5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3yRtdKG5pys for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DE969414D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=p5pqJE1Llh1rK/ROOisLAJqo4qqu/Aco1rMkXR6Tv5iE3AxnNsVGdnycHo2HeBp1T1S1
 R9gTTrmzdq5JAoQmyiZBoNx/JwQsW9ooVn7lNhaephODdWi2J1cZzYOK+o1Qc5hKpozUn
 2kScmtipabxfWhbjwVmtDrpbupFigisU+SjRFgoY6UJ339tiubTJ4w7FRGpCOOWBcjIPh
 jYXgy/jnI00sFazrn7UycA3Gm4Ia6lVej/PCKkpDq2sKsGTw+9qCvUc48zzDjrAVL+1jY
 DKn9TH1WUKj9IClT3ql3XJH67bTbDVrFFQKVEqnS9mbiz6P/EIkv25X4eR2LP5PsIbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VxkHDIJiVioNm2B6/qUJOMXhSJaU8mHup6o3g+Yk0xg=;
 b=Kx7FeffsIhNq57PfNQIoDNADM8cBOqvgJkn9z59PVNBiuRv1+V+k5onH60tLf7npT9CE
 RuTp3aWxuo6E8778tDp7lQLbPFLc+Wu8jOfALWGU05KKHuX0gHIpVw7PwXXrhk0dlUzAT
 jVFXpu0M6OHHTnUFchuI+/aj9EnM4WhLfYmwNESjZJm9Cakw384+Tb3Xldsf8eM8B2Vqr
 rH3q7GKDUDE6L9NDfTUFXHMGhz8+QCqxUp2fV6xdKn/i7umms4t1txxB6RL7CcPRk0xdY
 7FZkjwK2RECGgHM6RuXV38O/PWeCfIrSkhqIjyFTvF0FWFwONA2j4MNose2Nb04L9Jw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE969414D3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35D1488FDB; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48d92e556ac55fe6cc8540ca00498870b43c7c29
X-Git-Newrev: 6cb474811953b3e69d9a338d92f613cfba7fec8c
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.35D1488FDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymodbus: bump to version
 3.15.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6cb474811953b3e69d9a338d92f613cfba7fec8c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 7da0adf9da..85eaa0e103 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  d2db6a8e9ae1688a6ddf227a4c9e5ccd  pymodbus-3.13.0.tar.gz
-sha256  da4c87afe772787620594c564cd8aa8a4c58ff9786382aba9550fe0ce8879f32  pymodbus-3.13.0.tar.gz
+md5  fc14238eed9f8d3ae4287e82911f9111  pymodbus-3.15.0.tar.gz
+sha256  4c5f715128bfeba59f4c9fb3542b0c32a8afd4b90081111e39c12f7af0c89aae  pymodbus-3.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 2d969b0f65..40f0e14c3b 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.13.0
+PYTHON_PYMODBUS_VERSION = 3.15.0
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/3d/55/eee0782c2ca9fa8e7c3218caca22fe30e850cd6c0c0d475c10b8c19e5a36
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/e5/b8/03dace16e0e5d1c3eb16e8b9bcce9885f5e8a38db34345ec375cd70ed2e2
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
