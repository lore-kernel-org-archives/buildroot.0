Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B263CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 231DE81461;
	Sat,  3 Oct 2026 15:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tW_PKJEsLal7; Sat,  3 Oct 2026 15:54:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 31A1281434
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042884;
	b=by22pA9FmsiZKtjtHBbQQEoRcMeYn/1w1bb5hto53zBfmcwXWhs6ZeXlbFLIKEwk6P3D
	 32MhNAqHTnfT2zr3W0NNnMTdwSnkFLnJNY/AyByuEZBaUI74Ks7yjbP2t9e/MgXIb8Chn
	 7LDGo4zHOQSEWdRZgyZKW3OqSfaXkk/ENO+OWkVXmbHXcWJ+zW0KZ6puBMCzukrS1GPD/
	 6xxqGBBY4VFOBiSn04Sv1tl5c6LRbFZf9CWuqqv/Q8Q4KUH/rCtALsDKMpSyccpCE76fz
	 gxyDyMjH8Z/8NXJLbUGRfIZOsMBRqtNM4llmxUrfk1cSNBojksdW9NzbyjaoyTF1M4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042884;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NRVhtzDhGRPwV0+gCCXoGXxa58TCfzw+Wm6UWWTUM0c=;
	b=h79KT0CYePKbacB0ieZoXqyMyPqO/HfoWnPxL1DYCjV0iiPqIIg29imV1uzoJ9gYn0FA
	 nEISfZIspufismeAm3pobKIANfSojZ9evuyl+2YgRXZBB9/PFOIAB6vOEogqblmcU4sH+
	 NR0SETpQZ/Ezlws5FFMgUcRqPJ5kPfvW8Wa6hokr853djtyCF57VBYIwk6AOeX+tal/uM
	 hjAysQYIXdQw4OnkNgJs2nBprKmMnZ33kLThmPHii9yBfHwZ/OQumuW3GmgHMcejVNE6J
	 1MPiidBsVC2JEOu/0o4QeI/+5XqkSH97VQvZcI4xuF2MljE08yi/OzDql+HguzG4Xdg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042884;
	bh=NRVhtzDhGRPwV0+gCCXoGXxa58TCfzw+Wm6UWWTUM0c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f+gsum6C/og3o5VL+fx5PnqvTCYcLFKfBQVUc8yLhKo767fX9HSKk38r4keabEbAz
	 WDQ3yEbh6+eXdM/RKXeh1NnLGpbx4ziMm+UnqjEZu2RPzT4nDhA8QXd7Hd1T3aPr4y
	 q+Tb4zgO7aEV03lV1NlHKu2iutCgtqevKLnZBARHnzWXXD6m/1Gvzr4M/a57uJlYMg
	 WCoRJXybDAdS7Nx94Pw7HPpFF0tZhV4d1TSAufBEGwPR3M02ifiojaMdL0XUPix5Ju
	 Zhfkxi4JwDAck4MLG4IoRQoVwzS3rhd4l6N641f0v9yJ3/gzICNTYHuppuSy+JuXCh
	 ZjsIDGG5eBObw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31A1281434;
	Sat,  3 Oct 2026 15:54:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A49911D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A24DD400AF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MO3pgnllo22X for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EF3A640024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=n43tNcpj4x14wYg5U5x+qmUEqcKOSGyBfqeyTgOZ69ZxNJt1zLHpGuGKTXACZo6MqsKG
 XneKsqRozhh9px1LCv50B4aT6t/QZRHnr1BgWwp+xMSfaVrzOre/RlGa9KYv5CehJaZvH
 T7IuI3PdNq3KoYi0boeSRD3HiEmWp3mMiFMcqkCuYoWVV67L2VIuQxFOiLvjC1JG35J9W
 nt4JXCLXqb4s6zxGHVyva379fY077Pb0kIebtTaQIGynjL5vjh1fg4BfLERfl3aLfjmPI
 f+0BLlG2Fr80Z/FNfMEUartZdoDJqcrLSAt334eyjqRntg5eBaQf+N+qI2DCzOjZS6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=91igcxbL5l5I9eaelGylLcowjhT6V6MNSD1XXhjsmcM=;
 b=XGSm0ZmOl7ldGyM36hPpr+vytD5WjdK18oa61qGPKbZtTlmXgXyXGes0tS3r+TGilPWY
 /Nx53JLUX1PRqaKi1ClgAtB/lU6rfX8xqBq0mqR7vqeGfVgUx7biKOTb1Bfvk3yuOPhip
 F56rW6KhFHYMoTX8VZAH3GCTWRwoUluTwwI8zvxb3gSx5t1b+anUxUVtdAYPWJVzurK5x
 3iewW5RgxYYVEJ14dQMpmyKTSQ1U4/WUJvuoMiSVHYAuCU8BMhBEc4PHIszo7uai87AOY
 k9Dwlrgb5JUq7kFze5HNkxd8N9LBqKd/PlAjUoSidZebxbnmrpQaZ1O5Mf1oxiPVPcQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF3A640024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CD12886F7; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5d9c6be18b1ca30caa5000642942e09a2c5d579
X-Git-Newrev: 241aacd97ba874feb2869f50488b979681087227
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.3CD12886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-requests: bump version to
 2.34.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/241aacd97ba874feb2869f50488b979681087227
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 4fda8ea71e..323aabd959 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  ebc3b42b51c6245524345d170e5d4c50  requests-2.33.1.tar.gz
-sha256  18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517  requests-2.33.1.tar.gz
+md5  611e438d0803e962500225f9807a475e  requests-2.34.2.tar.gz
+sha256  f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed  requests-2.34.2.tar.gz
 # Locally computed sha256 checksums
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 3af00a7b9b..8e28f39a09 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.33.1
+PYTHON_REQUESTS_VERSION = 2.34.2
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/5f/a4/98b9c7c6428a668bf7e42ebb7c79d576a1c3c1e3ae2d47e674b468388871
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/ac/c3/e2a2b89f2d3e2179abd6d00ebd70bff6273f37fb3e0cc209f48b39d00cbf
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
