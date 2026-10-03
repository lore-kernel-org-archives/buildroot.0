Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740F7CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CB306067E;
	Sat,  3 Oct 2026 15:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQ9tmXFrbP_J; Sat,  3 Oct 2026 15:54:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 64626606B9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042856;
	b=mo8mAgjSOBjcUOSvQNeuo5vbrlUYqhCMt7/rZYRgsKZJI1naj4VErfsGfSPV7LXa6vhg
	 TAENblynRkcoHLCRfAiiOW4x0pIUGfmk4yP98p1D60UGzTDcAty4BvwEUSCLz6vSgVpxP
	 HzWNShdUt7WmyzlIczsAaDX4lHgUdRmXv6IAngYa/ZaFcmuccEOGAXYWEsbQ9ECCCy/2b
	 8szi3kA2wtziM+gl4FX+JR0qiIy0Crt2l9v7rMrc9FPhzTlnGpjj39mE5o+iHBLZnNmMi
	 3oGsrmg9OXWxK4SiIIfWUqRaexHUgNMDAjsvJFA0zNc8qljbTjkd2E1aoZ+VLPAEC3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042856;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H/Xwy99Z9K9DzFCNJFHg+PTvld/t4WDq6RVgyDfb/Ek=;
	b=njNad+WSbXeJVQ7c3NpKzIbOIuj1kzFWf+Ql1Pph+kIRbDaL6vW0LIpYx8TxUqg3CeWN
	 opMYkv/5eYT/gAKrcCE4aLw0onicht5Xw5dsrD7mhmlCRbCLylktZxSGypP/OCuoXqLTT
	 1mSJKyFVfsPXCQIfCIHgKyAcg/geviDFfBrZuWaTg0qrTTB4Jgr88/qBZqg8hfuse2/EM
	 w2d/2hsDdu+843ruASZIidUV5VQmBnDf9IHBCQja+PDA64Q2tc3RKrOpI240ekYP0J6M3
	 nRZDNPgRhgtUdknWe1om+yPE/1h3VlkZF2VkJ1o+x92Ln4ceeja4h7H/h50ADR0SlJw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042856;
	bh=H/Xwy99Z9K9DzFCNJFHg+PTvld/t4WDq6RVgyDfb/Ek=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B3VAcMsLdWzXV3XCzX9kBmSOx7mWKgHyNFHa1zbckfL/Ec5OEwlSHoeQdRrlvKFzP
	 VQRL1POa039NmqqJmH3BDV+ktvXGTnzWOoW88tc4cPjay5PagRVtd1yhcDUNMPhOBO
	 CCKr6JITI+KD9gEqEm9rze8UXxjY/JfyWWrU/ThlNLxzw+tS3i+ZP2/UDBdT/2IQxm
	 IB8D526rpX/T/Lm7v/iGT6lSGKqpVGIKx2tM3c4FrveZyAfICQRGV6jg8nGGpfEwY+
	 crhF6xi5o9cSL+SurzCpO2d78Q+hbATrNkwDSclEApw0vGkF5BKk/B76pyUDTSAfJV
	 IGbSKTbZf5ehA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64626606B9;
	Sat,  3 Oct 2026 15:54:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40E304B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2582860684
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w79bCvhzfEZi for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4D68060601
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=e583dac1VFQ68OulBiI+TxjXq/igxF/jYx9dyvQGvXAIxiMxm63eYTy8tJmr0tl+kM5b
 jLzdJhW7wh9AbG+glup9G1ZNiYegl36v/lBwJITKxd8fVOYVCziLk/5TyY9LFwR3tfZfb
 33AiIOvKEyvB+AqUyf86nmDM4qRMEPjt20oCMJGajSk4yAI9+PNbVGKX1EYrpY/cg3dme
 VpdJMav1KNO9Rzb1p1uf0beFMG3u/K/XFwSfQr4GPl1blbLRZnZPcLRWgHHeU3jfc2RdB
 Zl16Mgw6oSeRdHEoCxJd3sfd0ZMe5v0k3OcLk0V9SPLg/rXYXUeOBzYQ2uDLiXzYqxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jnuaNMwRoBaPqhAFf+JzIMlGrSMEsOArdaQvl4y5SSk=;
 b=lAo0wNx0e6HYSATB1zrYo+hTP/G4QFGuYHx181yeqNHtWZFrkLGAEGj3ajVT0maRzruX
 XQppWDUauUFmvPlGiRC6rMlotaFC8DZSKN8ukAycPd+7BNBA8kLOZVYiqca/KZcGzprv2
 cMm+LQnI27Fyq4VZayVmDqsg15dXihXx2vr4tP+VXWRNJ039gXabVdPrAT6tHLVi0V/MD
 ZVcuYY95l3jc4JJqKCuDDgkzaFLLsq/pII7cEfX2d5Kjka0nkf4m+oI1g3saNAYy/qQ49
 9D/U2DxgC6nqmAtjfSEYaUB2XvZ6eNhFAiRA66iXIT8WwJJlsyKUW8nSgynVMFdvuTg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D68060601
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BF2B8908D; Sat,  3 Oct 2026 15:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:10:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d85cf95077f0f450dadde6e9d5e44e7b2121023c
X-Git-Newrev: 7a954f61af649d32c7d02f8d83da7995439f88e4
X-Patchwork-Hint: ignore
Message-Id: <20261003155248.8BF2B8908D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-parso: bump version to 0.8.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7a954f61af649d32c7d02f8d83da7995439f88e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-parso/python-parso.hash | 4 ++--
 package/python-parso/python-parso.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-parso/python-parso.hash b/package/python-parso/python-parso.hash
index 17e3cbe4b1..021e53e2c6 100644
--- a/package/python-parso/python-parso.hash
+++ b/package/python-parso/python-parso.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/parso/json
-md5  10fb3883e4c595ec7333b722e3ad30b5  parso-0.8.6.tar.gz
-sha256  2b9a0332696df97d454fa67b81618fd69c35a7b90327cbe6ba5c92d2c68a7bfd  parso-0.8.6.tar.gz
+md5  ffbae6a466724074ccac6a2823cd1afe  parso-0.8.7.tar.gz
+sha256  eaaac4c9fdd5e9e8852dc778d2d7405897ec510f2a298071453e5e3a07914bb1  parso-0.8.7.tar.gz
 # Locally computed sha256 checksums
 sha256  fa67973073753d17624caf8684d5ee816d70c89d912c5bca7ca0f08e7b150edb  LICENSE.txt
 sha256  9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
diff --git a/package/python-parso/python-parso.mk b/package/python-parso/python-parso.mk
index 9457fcde6d..3622c9bea2 100644
--- a/package/python-parso/python-parso.mk
+++ b/package/python-parso/python-parso.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARSO_VERSION = 0.8.6
+PYTHON_PARSO_VERSION = 0.8.7
 PYTHON_PARSO_SOURCE = parso-$(PYTHON_PARSO_VERSION).tar.gz
-PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/81/76/a1e769043c0c0c9fe391b702539d594731a4362334cdf4dc25d0c09761e7
+PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/30/4b/90c937815137d43ce71ba043cd3566221e9df6b9c805f24b5d138c9d40a7
 PYTHON_PARSO_SETUP_TYPE = setuptools
 PYTHON_PARSO_LICENSE = MIT, Python-2.0, BSD-3-Clause (flask theme)
 PYTHON_PARSO_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE test/normalizer_issue_files/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
