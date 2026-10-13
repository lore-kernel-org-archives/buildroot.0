Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AAACC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BCA56081D;
	Tue, 13 Oct 2026 20:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9LVzEHmSlcw; Tue, 13 Oct 2026 20:52:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9951C60833
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924760;
	b=iMsWGA2vtOCu/WkIwPL8c8aQO5NFV1VRd3eGW8ZeJ2iycBOENmJ8VoUGEz1jq+eEuI2p
	 i8J3UetiTPbJ3bGCoOLb1Nbzao6gnVjNHNt2gSBFldPnQpTgDcgls6Dx5FwWEkByR8od8
	 5K+Jp5LnWteWjCQCctTRqRRZZevfThx8Iay6Y3aejJSXjMCdymKUAeu0hfyReIjyD0uKC
	 E5G6v21V/5EXdSQ99dQ8TVuXHR2lXDlHLf6TEaci1JJJEQNuIZ5YyJB2q7O6rbNNPzJeM
	 7yy7dLuMAg9tCb3HxriPO81k3lHJGWEZVwpV+LSqx5P/JVUYShQ2NRAY3PvuBjMlYpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924760;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yaFKRiXF8pE5yXUl5v+ZC4MpvP9h15+m9mRX8Gr+6DM=;
	b=Mi0HQblilOL2cU0y7pqpWk8zt3xiqdwkb+nczq5VWl5yrajRg1VHPl8vPUUlfQIMlhaf
	 hukw+RaMzrLtDH/WMRD2FmAm3PY520mbXA/z+sWyc/OEEY4SThT7FhgxV2Wz3FTaCJm6x
	 20Oio1S+2yvu6EgCME+XG5uUrtugc/5yvR8DwBtp1tiRrRSguvZtXuBfO2Kxlt9sZDMtZ
	 HuZzGJyCnuHZx/qVzeIhp1BZRnfmJ8e5zXerFRlayTzLfY7aW6wUTF6D5CgeFoI2RWJz+
	 VILNn/c3ZIHuEGTysgMR/7KjylrGcWRdH+z32Ri4VRyTLEOdSceYJBRXrdPaSlY12Tg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924760;
	bh=yaFKRiXF8pE5yXUl5v+ZC4MpvP9h15+m9mRX8Gr+6DM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c+Y7fx1i3OoOYbkLBUpV6TZ9p5cpZ/u3LNRw0mR3iPAJTIcO99QH5la0McNW9c0v0
	 xacRNSM0RDEC2nY22unV8+qnvDiP2PiHOaKtQbBawySLnKS3CbGrzZPdSPwuuhNxsz
	 AOAFCptUOiRUhrvc0AyIWt55XBSfseXh7zHcyiYGLaypvSBfPQCVo/9ZNnnhPwL8iQ
	 fJEilDu7pJHk9IRLPwTh1HCEjGQf0UexDFZ2ODKkkv27I7OQW3g7yCWK0lCVFXuhxX
	 +FYtnPYtd5xYsHztfTmzXVMbKr+24QEQ8X248ba1Q0yArp7MJtoc+7GQjssB7RQc37
	 c3760VkJis/4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9951C60833;
	Tue, 13 Oct 2026 20:52:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 852C01495
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7599F60810
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aS_YlApM2ld5 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B854F60705
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=c7VQ4Wn/I9h6M0TegT0uduTO8OLTK+M3QxlDswizUtYQDEQEw9gBbwMKvHkHpyxyJi9j
 ugQVB1lkI3K2yAh2vV1ZeiW48/DAerDJNCDl2MqieGthYfW8yqveKjsrzlszrSlMBlB5O
 Pvws6zZ+g4GH2AcqFQhKtp4fjHPIcX58ll7hv9mOG7lo4Q9CbqTVmw/JesA0+Xpn+PLyE
 sPiI+yNqmMuze+1b64UGW8ppZuBz1ZmpbSEw5ryPSiX4FVMOwMl2TxP8QkM8uMGesEE3k
 24ICRqsms37mpEmuage5ctjZfBZrBuNTBFfeSPGH/PC6Nw/UcqAyfjA/5PFV6BTkpdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=63g6/uhtr66ojz8A/UD0DyDHTrH+XDgEMp2/EUA1I4E=;
 b=l5ZNkBndmYwuMldf7LGHpn7hs0b3/w3JEYq6hM2JFa3EZlxnChaVYWUYaPAxxFHU4Kqn
 SS7kzUGLagNuZw6HkhBNjn9ZO+LmUcd18N83P2UXflfpRPAFy7NG4PEPqxpb/taLklXQf
 Zz92n352qNVkxpqvTmXiLJpXNqCIrtdlEzSr5islLOh/xlRBkyz1l578OQK3iqrATT6AT
 fEp3HhV1Xa8Mom6knSiKAAuVM+rK/6n49YNkOHmdeRrGT5QvfOLK0u+q8jgHCnP/ePfsr
 ZU28NgnD93nfNU68IM9gVMUXNlTXBt1HT9yzUU2LP5Ix1q8CWO7OWNJV28mrbiHmFTg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B854F60705
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F227F9550E; Tue, 13 Oct 2026 20:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:42:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b75d5857d8aaf40e0187f33616fb332d8cb64c71
X-Git-Newrev: c4e596db61a3a28572b8aba14483098fe3e5e4bd
X-Patchwork-Hint: ignore
Message-Id: <20261013205105.F227F9550E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump to version
 4.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4e596db61a3a28572b8aba14483098fe3e5e4bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 23472337ed..80be2af490 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  2441f82b97ae84b4dd06f6f183c1c19f  filelock-4.0.10.tar.gz
-sha256  00d6a81f976a6332551c2c10f39e12b4abb7e01c64d4c497b81a615bc9186f1f  filelock-4.0.10.tar.gz
+md5  1cd0ee2e9db394c77d013ce31435c200  filelock-4.1.1.tar.gz
+sha256  7ba0927482c5a814b0a7f391d029ccdb8010f576f0a74c0dcde1811e8bc4c1b6  filelock-4.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index f24b309787..376ab42dee 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.0.10
+PYTHON_FILELOCK_VERSION = 4.1.1
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/4b/51/a182494d1d8dde1240bff84dda57d48165d982e59582ce8f167e8e3d7628
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/35/c8/1d457d9150ff948f2ce6ada7715e0eeebbe5d3b58a45271a1e222474bcd3
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
