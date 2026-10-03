Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174D8CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA8A5816F5;
	Sat,  3 Oct 2026 15:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAv21LsWBCOS; Sat,  3 Oct 2026 15:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E953A81749
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043003;
	b=Da3NNqG2VeZ6rUEWjazv3hSYv1WaEtfZNa4tiS8U4rmxT/ZwJZzVCJ1J9yB1AV1uXTj6
	 zre4cKpVg7uoZRrZFiCI8DLqXZrjh7g0pss8JuzyHb0n1ei/QSzphUlddNGlySLmTOBO2
	 Zpr7Ml1L2xvG77Rssrb3lJ4KuOxVngE9z3NATKYcIFAOK31KyWo092JZm9uFTr6J0Zxru
	 plh2+cwbqSIMrbYvtcS153/zwhDIf5nwnwX0gCqzi5WG+rA32s71GA/uN3NHOTt5fgbQy
	 8C+upOEAbLm7gW8v5r36fMfnsnXvBRvWT/sV1HRD/dcaDL8piyBQwj4RQGCG2qk31pw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043003;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Lu/0KSi6nGPy7vzmL2cCPxKv3E61xGjdgA7YyEQOhWM=;
	b=KYeyymNnVAcutqllMyJrgwIY5CXURJGuSlfRbT6MFSRZhcffDDWmQq9Bofypx2516FXU
	 rBqNpWlmV+3/HAfs179Oe5wBENPX20DR1xgFMQVhk6AGmceb/EVjpRm8ud15bkVFWdN7E
	 mo5MfrWfZ0oaf1rQln/yxquni/fnG7YQr5j43UD13PCoo8j5kn/yoBkLP33aO2dMtwP+y
	 XxZcGpHT4Xao7zt5pvL4Pr1w23XYQTPBnwbgHkcAE1pt0kQP5T8CeLPFLrdNh80WHRGGp
	 mH6vF66rrhypvZuBjXTbBv5cSY+8fCKPyKFFzX9Gg3ns2JIeeYfJ/vuToX1ghr0mLzQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043003;
	bh=Lu/0KSi6nGPy7vzmL2cCPxKv3E61xGjdgA7YyEQOhWM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dh/tvwXuYVpwOWwFqDsDWiKRqbq8ZmaQLhA5G/u+r2k2TXGvEJ84SzNYQqyd1fdbq
	 tl9AUoyGgZ8vjZErkvKiSAgpcquuqoguWcvbgwv9Fde4Nq3gWaeta5xJJrX3JSWLhW
	 CW5sdOjQmrUajYcz0S1kfzFnAoOFi9OQcRISt6raG55yJeVNUtn+a3R8xTCw/x0DFk
	 kgwQWUvm71nMWNk3WvCU464V5v0/7vFEoOK0Ls0QBPwfm2PGxzJKBwqrwXOrb5n9GW
	 ztAa9MeW0tEuO0Dj3vjXNLeNeoV3wg7O1gQRrKNLvOofYZNZD/44OnKmr/RXYzXOxG
	 AkCwfHOqFe6Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E953A81749;
	Sat,  3 Oct 2026 15:56:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E3DE476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9AF860666
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2FSITDMBWDC for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7E3BF606C0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=NNVg4SOLhAUMhgabn9ihmQsdOpOpr3E0WLpeXM53W14eDxGJ9o6Pd2flzXdtQb4PdcwK
 hzxVqkN8TX0kiXCgGELAD9WmfE9/9tUJiBoTyExTlW24e+AO5KsnghrfkPkiHCe/Ih7Ue
 rurCdwXi2TrGZgjwTKnbzl60Cv/zRD1OwH9JG4XzTPNFa/C5dddnJhqe/tVJexg3OfAR6
 L54fU8S1nnJuJ/Sq1Mm3XbMO0E54aX/DwyAYfVzRBWO5o7Yi+Nxhv8QEtL4qJ2z8B5EgN
 RUdGtWpv4Yteq1gByaInM92vhlNFSaswl+Rj2BRkmQlF9PAXbOX9m/4jedxD1UZdvEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=o6co5dnH5kLKc2yZTS6I2/gBOk3RdJzn3qgTYXq8yKc=;
 b=Uq1P6f4nn/lOuBuZ9snRkaxjQo0INo+6HFl2XrPln/8tXYNB2GytqikV1e3pA+G74UAd
 EAV1CeJhwV2I296+zAGifB/WRBlBCJS9RG2Am+aFu7yP3ZOeB7Yu77j+20V1DAb8TDVeS
 5T1RX+vTFkkTM8yxp77lPSY1dw1F2yMNt5w06hJc+reWwS1vgBAuEXQQCmW7KARUVSIBo
 zmARgwh+HiNPuGGSZYM7jCoyHB60wcwDh5chl3C2wd0qVtPofw8UgzXcpHNhm5fI+G6a/
 qYrYVcOx9zjoOXOVGE+wzxF7wWyCXlg0nS9xDtzGoBC8KXngWBntz4rq/SL2H4619bw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E3BF606C0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C00918A39C; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce869b9cddef81e45bc80df36535ef203eb1bd02
X-Git-Newrev: 06c22b977a56bc0f09c4028950bc85076024b659
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.C00918A39C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-api-core: bump
 version to 2.39.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06c22b977a56bc0f09c4028950bc85076024b659
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 5e4050fef8..c080165c33 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  e76b31eab2af8b172449ce786f37333d  google_api_core-2.30.3.tar.gz
-sha256  e601a37f148585319b26db36e219df68c5d07b6382cff2d580e83404e44d641b  google_api_core-2.30.3.tar.gz
+md5  0b8a8deefc55775475642b4a6799e912  google_api_core-2.39.0.tar.gz
+sha256  824ee414a10adefefae33fc5e2ba28dc6f0f7089d011c9cc98ea9178e61299e9  google_api_core-2.39.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index f77548efd4..3aed7f06b6 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.30.3
+PYTHON_GOOGLE_API_CORE_VERSION = 2.39.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/16/ce/502a57fb0ec752026d24df1280b162294b22a0afb98a326084f9a979138b
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/44/8d/cbdc715cdfb7acd7ccf1ce2869b103734c6a3cf124afd021f56c10c17522
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
