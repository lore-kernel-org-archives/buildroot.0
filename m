Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C341BCC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96C946081A;
	Tue, 13 Oct 2026 20:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQ77wPMg3WLc; Tue, 13 Oct 2026 20:57:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A8BB76084B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925069;
	b=k/8AZraKz4beiz/Af+FQAd5oxhQ3M1R78zA2+BPw5097i2zmbfMI5K4obeyO14/EEYJa
	 Yq8SCDMeQ8F+IEjbvLVf0DNvZjObz79CHwmrBiG7UhkDHtwCzncmt8JejglwhwvsB8Jec
	 zZ02oEZbFXSAcRfQv6OiOM7cv13xsEZIgx9HhI+nuf179VsvPqzAe11B9JtxjyvT7i25q
	 cfnOwNIwbfuWiXsNOO7ZPWFcFPngg1KQdI7iypICdvP8qyf9MleAsjXzugUA12IA8xZ5m
	 IImcXCu23kDYgdlSkTiRp+T7CO91Lp5iSChHFrMMPb2Hjbz6EWP/wAVtQUYCNlASM+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925069;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GxQYbamNcAmexu/fnzzI5Bh1/SohL/uBYV4xMK/g06I=;
	b=eYwh58rCjyD4Akzp4AZcPLMm1Mg95yDwc0sXBhGH3ORIE4LDPl65FGWZLTOxF5FPwU2P
	 t1xTUtU033jVlAlE5Ff2QyGU7yqIF6p7/2NDo3+MgQIHjGA3rewh0mv8T9jv6h44RTmG/
	 rQYSdbAWsmv873FN0ekFmfkEau4+jzjUHY7zAXQ6+LR6k99YAEMrZpA42eoYyWsX2sSKX
	 d3lYLHUBCUkV6BXOVnUU4eHkqr6ERdcqTQ8nO+RIl1puqQ9l9Nxwc/p/NGn6yrJasd/O6
	 2R/T5TofG83/GLIw/SLb/HGIxBhK7LkTIt1spsfXBP6Bra71jxs8an3AQxTGNHNdNtg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925069;
	bh=GxQYbamNcAmexu/fnzzI5Bh1/SohL/uBYV4xMK/g06I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nAanareUZ09kKkmvU4ekXcO8dAhuz/TUWN1cZj/Ms7Ws9svmqX6rco/gHvNnRnhKd
	 fdQnuYuDIOrleIH/96vUN+kyldZ/8J5bSBMAjDgtA1NN4BdVEkD0PzLo5iPMOPisjx
	 MJTA9yRc9BLwVcjYk/hjsJNm1hC2p/+IzSq34aU+5rGtb1LlCjuja9GLHqRvx1+ggb
	 shaD5Chvfw3ly0bwIMQb4LmFb0XQamffd3X+8PR5KGqAHNz3Zbw5Fgi2RDORKCJ7PZ
	 rBzJBS62H8tpkY1s9qDYstzWi7PgxA1ehJSnbTw8kStlTE5BqHo31R4j2bR8VbPPxJ
	 b7RrkqacOTMIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8BB76084B;
	Tue, 13 Oct 2026 20:57:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0389B13A0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D793260816
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUtxR45HqI5U for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 32A8B6081A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925055;
 b=fJrHwHiXBCRDf+vkVVTovTBPvqDTjeO+J+LUJp6x4iJ5CoXHc8uX4fDN9sAvrwfDtpaq
 RHMMKuuf69pmQeCIqQylK5Xaiiof5EfAtPHRii77X0nnPioOpJaQCcs77/wgTt60l1QB+
 jXgmKxHaZGy8lii740eOxYvC+gUZP22Xdvizuly25fyp1SSgCaqA+pvzUumvyBIwEQUsF
 7TDF70onClb4Jlv/4kvTQ/CvDYgc+43FcCbTag8HdyI8vH3euZEmRdhFeeIZR1NEnST4z
 AGpw9XubBSpM3yTsUNUtrEkooVDKzPCMIxMtqwyVS6aBSX/KcEAzFYpjtzId+zQBuqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925055;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=D3SLj+Y96UfPjknev1y8jozquus9NXsPq32IvcE8dO0=;
 b=KHeMlJFX2xh4ZkDDn0CX5FzBiig8IwNRjDCcsHRREDNlRsZsgkw7F/sFzYpjyzr7IQDq
 CebabNwBpEWfG9Z/LmOvdfZT2vCb1uSWHua6XiMHNgEmsRzd2VjrOgHbcMGJKevwm6AFB
 5YFbmD3p2PeKobpSWnlGQVEgXvUertbfcnAmZXWTv0QWuVzfYPanbwNy+3Kc69gF23uEn
 8Rri/Fzo5saXkVj4yhkMNUPYb6vGcIuHqx6KclifrX6S6+6aAwixmFT0RtRa/SdMM9cSS
 MCQIRj3Da8r6obXpdsIDLmJ+pF3td/qobgE8xrjTT51B8A0tREQfRMD06Jeh8Ubfwww==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32A8B6081A
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 694FD95B63; Tue, 13 Oct 2026 20:56:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:55:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 464c445a4d7f401cbc2fcc48a5698029998c16b1
X-Git-Newrev: 86cf0d32ddbfab7ed066df3bcf6d72eca2a43afd
X-Patchwork-Hint: ignore
Message-Id: <20261013205615.694FD95B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-truststore: bump to version
 0.10.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/86cf0d32ddbfab7ed066df3bcf6d72eca2a43afd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-truststore/python-truststore.hash | 4 ++--
 package/python-truststore/python-truststore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-truststore/python-truststore.hash b/package/python-truststore/python-truststore.hash
index 6c18984eeb..02fbb00b0b 100644
--- a/package/python-truststore/python-truststore.hash
+++ b/package/python-truststore/python-truststore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/truststore/json
-md5  d66211e2bd37f6852bd6009728170313  truststore-0.10.4.tar.gz
-sha256  9d91bd436463ad5e4ee4aba766628dd6cd7010cf3e2461756b3303710eebc301  truststore-0.10.4.tar.gz
+md5  022fe1e2fa8e41e8f336466ba395af86  truststore-0.10.5.tar.gz
+sha256  30d36967ccaded5cbb38d602c433f53600036c79d502f4533a49b60a03bbefcd  truststore-0.10.5.tar.gz
 # Locally computed sha256 checksums
 sha256  33be7b7e8fa4fd19b1760e1a8ed8a668bdab852c91b692dd41424bcb725a9fca  LICENSE
diff --git a/package/python-truststore/python-truststore.mk b/package/python-truststore/python-truststore.mk
index 5ac2a6b563..5267880814 100644
--- a/package/python-truststore/python-truststore.mk
+++ b/package/python-truststore/python-truststore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRUSTSTORE_VERSION = 0.10.4
+PYTHON_TRUSTSTORE_VERSION = 0.10.5
 PYTHON_TRUSTSTORE_SOURCE = truststore-$(PYTHON_TRUSTSTORE_VERSION).tar.gz
-PYTHON_TRUSTSTORE_SITE = https://files.pythonhosted.org/packages/53/a3/1585216310e344e8102c22482f6060c7a6ea0322b63e026372e6dcefcfd6
+PYTHON_TRUSTSTORE_SITE = https://files.pythonhosted.org/packages/ee/9f/c5201d42a484c061e528825fc8e2d565f5abd50a4ced6fb7d29c4ec99b2b
 PYTHON_TRUSTSTORE_SETUP_TYPE = flit
 PYTHON_TRUSTSTORE_LICENSE = MIT
 PYTHON_TRUSTSTORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
