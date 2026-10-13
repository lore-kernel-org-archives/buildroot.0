Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC1ECC6B1D
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA645406C0;
	Tue, 13 Oct 2026 20:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8rAZxMiB2c8; Tue, 13 Oct 2026 20:52:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D471D406AF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924776;
	b=ewFLISyeI6CVmVVYyRqm3Xqchm/kogMFpQUBGlVB1XlrN32ZqN1u9Y//JegGXm9P1pL3
	 GZ+nFBxvtxJvYV9F3rBqFwk1AjYhbm1+yj9yyoIPd+9ZijkK+FPWQwDF+gcxFyHJ+cCJx
	 OQD/BrICfb33/SGGFRUIAI3ram3RunVYMPfilMtnKorf83a4yODmUuzeV7lUDRplFA0e/
	 ewO6hCwOnZKpWioc98kYdj05vyq7z0lxYmk8o7MZd7YVjpA8HaJUejUP4WvQBUr7DGF93
	 OJDajUWpsB4DMw8jZlKm26C5ix8nSMIyE+WoM0eidpthNaS8Je6wN06S5wMKcPju6eA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924776;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w6bo3XqYGnCR1h6A6WwJ+vUehA97u/rF0ihFqjjNLv4=;
	b=MdefdLsoT4d+3GPxBDIi7ujyNrOfbmPkEildz5RJHxR8wpck2XtyHGiSrtYJRwSk1JQM
	 F0cBlsLQWQGvLZWm+n28HsGQIuFvX03HTxk/Ipsz7xgaDkZBfv5jRw0dLV5aQUV41Dd/T
	 ezS/lH+S4Bci4vgWuc0egcrQjlq5F8SUuVMf9JfHY7Ecaba2EFZzxIkrHyCCAfHdO0Tx4
	 adOkHwoOm7vjWqGPISBJLw7vf8mlvGTO5+bDddBaVHFEByUu8L7Z+qGK8xP9u4Lw8dO7V
	 GI3MNsCnUI4kGfwoZPDIXeoZBA9MJOGOX+XjxxiUe26SH9FeIXkJusuCznLEECh/J5g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924775;
	bh=w6bo3XqYGnCR1h6A6WwJ+vUehA97u/rF0ihFqjjNLv4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LMXgghQ3DqvgXvLCj0eQ/5NNgUGwQy53PrrKh6mtPx+8yItXGnk3uwvbgnvVKwNnp
	 ZFvjLvuQaHywlaTinGLFhI8aruXoKuCZ0P7XxcU0/QcGWmZfyLXMuOK8b1qfuOvNNH
	 vZ4MA0K81ot4vLg7AMAw4wbrKOKX39HL1g+p7/Mjnqlj089Eej3BFPH+2mp25/T1nN
	 SBeEv7+LIEWR/MDpVcZ85EEnGWcmS4C+v+GFtL1f84mWb5essLvg9v1cQ/onTLPTCF
	 RpTH24qvIkTyERjOvPbIGdO6T/sKF2kVFwkw7l0g49krlZDCVhRYX7pKATu4bhc4xn
	 BEEJDt0RBDeIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D471D406AF;
	Tue, 13 Oct 2026 20:52:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DA842AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1364A40647
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id En4avcp8Zt1f for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5FF2C4062B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=bcyeAxMaJCWCwd8nc+wEJYGnQD9Zt9XMjVxhT0NBbpI2aRJgBUsj01kP+3dYwTu2bRJZ
 Lc0VSz0Xs8yCy+RPPsC/0LqczNfD3dZWeRqtAeUUnOoVi4i2GwCpprpmnUQuFCz2Q79Aa
 01DKOp/Jslp4vl1jFBQGWqcUfrDWQeroilLq4XPwKG9Di7HFBeiPSXMlbBMGUXwKbe24a
 ZvF6xgogKTGP6D+zySg/4rlPNc1g1r8nrlFkCyqPhA5YMwpMj3ciZGkTlXCe8ZMAflYPV
 TvsTHtBo5Ln7uyEjG+aqvOB7e8qDxxBe4Gubv7zZLsA0vwXDesRg6ei3QFyeZvetOqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UgY6NhmQL6N0gPnGaq2fLWUtSzrCTDBsEy5Nuwh/n7s=;
 b=RJvAHTAxIoZEWx0TYEiTPNF6GOpJCi3JLClv47YLP5fgmz64WbRq0bdKWO9yvuuRaavD
 HMrAhFNyoDISrvGVY8JVrGq5U5Wsn65DxyvHs9Y/Q+E7LyxKjcdtJB8LW6+vgcQHMjNiv
 F1/a+5+/1yp8Sa48rZwV9gZXTvSaWV+/MWoNneGQGmskqIYnMvDx/MnxwVEAxcCo/AE9t
 7dOiBOw+/g8UCbRaKtDwHste2MBtrNxxl4kAN7L56MZ4rjh4Jd58macaCRMFTHvcOQSOb
 sFSj0ny2P84fu9CHoGyAfZkL17yCPUmKCd5ZIfNdBcHX5ynS0NGpsGouu/uUzyOltrw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FF2C4062B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A087956E1; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73b26ce87e19b24e73ba87e5e912faf3440bde75
X-Git-Newrev: 1e38e780d3f2439213e521f1090a51f153c27d49
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.9A087956E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycparser: bump to version
 3.11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1e38e780d3f2439213e521f1090a51f153c27d49
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the license hash for the copyright year change:
https://github.com/eliben/pycparser/commit/ddc78e180b719a2088df7a2a5801de69e82e5333

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycparser/python-pycparser.hash | 6 +++---
 package/python-pycparser/python-pycparser.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
index b8a15b5e0a..680a4e4581 100644
--- a/package/python-pycparser/python-pycparser.hash
+++ b/package/python-pycparser/python-pycparser.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycparser/json
-md5  56f3a0a82595b0cb04976cc0d3271a27  pycparser-3.0.tar.gz
-sha256  600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29  pycparser-3.0.tar.gz
+md5  57e8f58d1a6aaf5e7f829f5e3874258e  pycparser-3.11.tar.gz
+sha256  d875f09c3507d00e1aba0eecc6dcadc1352f30fff09dc6bff2f1c2935e97c2bc  pycparser-3.11.tar.gz
 # Locally computed sha256 checksums
-sha256  0c846399369ea76ddd7b5c44fe6d16497415fcf015f5cbb508c24bf98b81c5b1  LICENSE
+sha256  0a9e78156ae8b96caf1b4f11ac2df424b83de29736f9e757630548a6272fdf90  LICENSE
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 68b7a1f143..973a063e8a 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCPARSER_VERSION = 3.0
+PYTHON_PYCPARSER_VERSION = 3.11
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6
+PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/da/a8/c5fdbeee588bb8ada9458774f43adf1bdd30bd59157055142183e769a024
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
