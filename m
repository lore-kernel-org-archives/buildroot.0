Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F556CC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 119F780A76;
	Tue, 13 Oct 2026 20:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwqGZMBhn8nZ; Tue, 13 Oct 2026 20:52:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3A4E580A8C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924753;
	b=OPXHUx3bDq7A0em1w6l0syEmHMe+zjnVWWEoorrUhOBTvM+OD8zG6lmCougf2V7ora7f
	 OOfpVeYJyrVZZQJrDAeQ34ILPfFhy+D1LiABoIwcQ1jowMCSyhCSugt4sdN15Us7z2Ng1
	 UExK9M3Q1bEBqmAVTrMp3XYM+ZyKjdFrKbeu17Ci+YTqMvB4YNPFif2dZ8LSdh0KCz/dL
	 8xsGmOoUocsPZA2gWHaHUxToTykvEHYfUF/0jyBNiREscV7KN0WJHpjJ5zlO//35Tl/Gy
	 PcOJPo0MdbMX9dYG5fQrRRVO0ldHcWKKVxIplFgUWIoLuXDp0TvOOQM0Eb01TUuIVIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924753;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mf1xF7/jd7QhSQCn3VefANQMw4eY0AatoXqEZJ+6Dj4=;
	b=mlLNVkcevm6Wq24eKswgiDbYxOWSo5o7OQ6L5qr8r8GcGyyM5yHqbvjJK4pWQR75vFlk
	 5Xik3pydK4maakEmGj+2leyMgdDHdLd+ulkuxWGtJkGcsj+obfoGeD0S04haTcSglbgEK
	 u0aeay91Om2T1mnzEWUkgVFIChMQBu/XFMb2obGMsvgjRRAH3v8NN39IqkqHPiDPjfAHA
	 IpZdfaZSqOgZlr4fBpIus4aJptv1hdTGOcB8zpGh9tIHzgKB2MWgRYTnMJ1rjVxGbqb2N
	 ivuB9BpoTGRVreGAG2MKheg286POD5/PisAhHHUvKPLWYoY5HvymCAE9E32vSI4rfkg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924753;
	bh=mf1xF7/jd7QhSQCn3VefANQMw4eY0AatoXqEZJ+6Dj4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SDp9IY7D6E/cn3SRyktNkRl8v8A440jl0YT1G9G8ezKGDsOcFfPaNmO2+uiKEayyF
	 R/rx0FwpT6d1+oFI4Z/CN7LB5rPm1pPkX4cdDP6icEn5s3puslQ6C/0yoxhGlDo2Ye
	 Lnjhr9Uawms9eTg8ZcfkN2Bl1I5EnJiqFfM3I/UhdWIe8auadin4za/j/1sQL4bnL+
	 TEc9Oc6sS4WBgd/AVa7yhcNldbkHGfqa/Wg4VWbtAAMaVrhVQIB1t0MaDBSBSaDzHN
	 qxQOxmSHi6rv9FT+gIgYTt2GWvYBBK1fvuJwXdVpYhBxMb6AWRbo3PfxVR14dng8m8
	 X0i7K+zXidKHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A4E580A8C;
	Tue, 13 Oct 2026 20:52:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 735A92AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 595D0809CF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-5dhLoOE-vR for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A7C8280A56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=bkLWAIYDCx3JK9gB0uLNJpoZj1q6ZjdBiWRlBP8D19RFmRCErTPNtPk50s7FVMq5vDKU
 0IZuRYXOLI0rz5ZAzKAYf5rcMVDf2UMlLHKh/my7NvFgeUInJR2Y2y+rIl4CpKq3t9Lqi
 VActoqOGvmqDgq4V8AE5qYo42Pg1AjVWByhOIhHjTJ+xLRmiCtw0Skw9+Qeq9CPkLPyyB
 bMrOgPz3Zkl2px+xOtkZ50cSzTrtDI+oA9g79vdDby8BkVhahjFrBgLcLXZ1x6ZjJuvmd
 OeTFLyDFnOAS9/kIP2CpvMSXW08woZphFWkkHYgz8Z3iK+1K6SoRyGpBcsYZyhs3wOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WxJw3EQv1Ks3tK1SzPAxhvpKxbACP9YG0Kc5V1VfgQ0=;
 b=P7QDzv1qL3MPrKQw402q46zFdZ6TAROPEZ9qeETkvnwnM4x5gGHRp04XG1t983nGqSZx
 W8AYjVkLtKnXsu+q3xxwKajvsVSdthTB69HBFFHjH0Kyr4E0S4UWy1gfpHhm4mebU+RoB
 lyE3T70lPQ/1L2B6K3cCeLCzGEWLuP0sQuXdeH93oDUyzHYm0caDih00ZhKtNtMhRlXoD
 ObuWmzBi1sMB1u62yNEGaEdJPdUTLjGC0agKvkWzCgGIHcPEu3X6a0X9RzOndU6d7hseG
 Ytd1+igrfltGQX2OBT0hQec0e0TmZWH0FXvINyu3Rlgt7f/5piL7mtASZYIHiufLo9Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7C8280A56
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5B71956E1; Tue, 13 Oct 2026 20:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:42:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbf237d4b5c55c249bbda61e425d0381966f7dfb
X-Git-Newrev: 1872f6de96fcf1ea0fee4f5a7cec4b339b271c37
X-Patchwork-Hint: ignore
Message-Id: <20261013205105.D5B71956E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-executing: bump to version
 2.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1872f6de96fcf1ea0fee4f5a7cec4b339b271c37
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-executing/python-executing.hash | 4 ++--
 package/python-executing/python-executing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-executing/python-executing.hash b/package/python-executing/python-executing.hash
index d9220c224d..48e0a110e8 100644
--- a/package/python-executing/python-executing.hash
+++ b/package/python-executing/python-executing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/executing/json
-md5  02588d10820c930874def80b2fb60c4e  executing-2.2.1.tar.gz
-sha256  3632cc370565f6648cc328b32435bd120a1e4ebb20c77e3fdde9a13cd1e533c4  executing-2.2.1.tar.gz
+md5  b5db783d29fa2002f6eae5996e1cdb3e  executing-2.3.0.tar.gz
+sha256  15919cb5d667e5cb4e099511971d00d659573fff2dd5c4e6cd8b71636c7858d2  executing-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-executing/python-executing.mk b/package/python-executing/python-executing.mk
index 0545941d5e..e182dae5fe 100644
--- a/package/python-executing/python-executing.mk
+++ b/package/python-executing/python-executing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EXECUTING_VERSION = 2.2.1
+PYTHON_EXECUTING_VERSION = 2.3.0
 PYTHON_EXECUTING_SOURCE = executing-$(PYTHON_EXECUTING_VERSION).tar.gz
-PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/cc/28/c14e053b6762b1044f34a13aab6859bbf40456d37d23aa286ac24cfd9a5d
+PYTHON_EXECUTING_SITE = https://files.pythonhosted.org/packages/52/92/8a611141e42930c0f194f7504063ab87dfe970cf1a5af28e7703df448734
 PYTHON_EXECUTING_SETUP_TYPE = setuptools
 PYTHON_EXECUTING_LICENSE = MIT
 PYTHON_EXECUTING_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
