Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FB5CA5FCF
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 16:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B21BD8121E;
	Thu,  1 Oct 2026 16:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CyGZQbll-cmq; Thu,  1 Oct 2026 16:48:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 11728811BB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790873285;
	b=jx33lOMbupcC0HpJFYJ0QdWRKQ5XDi3M1i52qwCmpZYtOWZVkHMXzkn2xr4of0FXhZ7x
	 CHY1xrRv7zc+s2cQuE5jFn8zX0tJetC9a8V4ZVbi9roWm/Gvh+J8Q/bRAH+1EEQ+mP3mC
	 E6x5m3adOxf8hSO4HcuGevQATy8CRMG8+3T1/8dOM+dw0mlByc407XKKA7BGlmMJSjOSI
	 od1b+DZGAwDeTxYiRk0AyE/psB/hbHwHvb3oH/yI6yGouvztOxHCX938JSy+bktl9z/Mf
	 ZwlkBKoA0pui2RfcZSR4ZNhHllRxw6jCuh4y5qblI3goDyFAKsmJRBhDj+9NgEPtm7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790873285;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=O+Nb0/2CUpZI0Sy/x+JTO0zZE9uDyWAwC9k7Qjg6JW8=;
	b=pdzE9h7hh6DbNDypLrO8zZOx24QX9mAjL3laaia3/jq/e2VVsC948SyH1m1BOaQAvfov
	 Q1uMLGA4PqbbMfk5RkShslnfVIELoex/li4N1jn0oR7PhGj3pPz29jVzLAL6QH1u+lRFF
	 phebV43kJDEUu5UY5qbt85FVzpleH9re6n0PkX/ZIYaysgjWObSxlmp5gOhuS3Tvuy6Cw
	 MKpM34ABFigzTHtHix2xwUA2ByUJjX7C7BKS/0i7xTV+1bT8HFuEHSc/ADztoHA24K3Oo
	 6qsE5Rj+0xQPYEZEOCfCL2Ux2oP8ZNNbygr3/UBHTCISH3s6E6ND75+C+B/uhJzwh3A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790873285;
	bh=O+Nb0/2CUpZI0Sy/x+JTO0zZE9uDyWAwC9k7Qjg6JW8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DXsj1R+QA/lCTf9Zj/NHlsTnohQ4vllJZ8nui3PNTdy2IHIPgKaXDhgkFFmg847RJ
	 m/LAj3BWyl0UcYNxaw+HR8W/StS9DtZqLpsl18BAaXvVMQ8r+hk+C9VkkvfQ87CE/F
	 URrxXMf/8DK7IbQRPyJRThH9K+IPHo6CPuZ9ncjn7Pb3CXqYlJE4veJbKfUocsysYR
	 BVaf4JLqbbCoOv6RWaKlIo1uuy3r8zY/5/ZQvSVxDeCch4LwfLSBd2mTFl6tCMoa7t
	 KsXtv2tzT7/zPq0JH8ca3sJzqn5T4OhVJ9O/jomqY5C4EWh5/rRY+pF8+A1g8q+7L1
	 cVz+7TCQKIJzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11728811BB;
	Thu,  1 Oct 2026 16:48:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38FA332A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B16240AD6
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBfF4w9ZnK1l for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 16:48:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 08EFA40B03
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790873282;
 b=JSzcRk/tKZIRo1PhsTkZVUHHx4h6QQniGMS8IYYXLvilBzEATIfxF3jqVXU0TXGUJyQU
 KAanokhV2rExMGpLbw5YJ3QJDDh/lwwiLd7QOonDwnuVKmr0zo1OqmfaG5GsW/C3er+ih
 oUKgUgASeVLU3cIwylS1jAuTtFeR78ll3q7cPDjAcTcvL12VAZRIjair+NTFmZkka3IeV
 b1WgUpD3YZh9Xfjm8Y30OLlZvBdF+qY0VmwyxNOexs3O6sHis8wWHyvIIq6ad8QgFBhF/
 7FJ07IatCmODuj34g/BSJ3+ZMatMkFhpfyKfb/ocSxEzZgyudy6bnoBROQfGMaXCy9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790873282;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=b8Steid6eQohQ1JMX0vSle92QxODsI4jJf10WvmDRbY=;
 b=sZI1UCFt6vbhyMoiD2VBHpvG1I6bBIWYiOo3uV6Any+PHCqDpDHIx8QOvP75kEArwBNS
 OTJB29ephy4ocWknwCFrsGAzoY035sV6XNzWnZv8P0N5wCRC/1agfhoFc9mtMd3iwpUAy
 lTRTQyLRjeuwdMffhdGB1ibsNPBaTYgmO8O/ubUYFzmpbHg38R7IQ8qPelhaXc3FXir6y
 FL0rogMgzcf95F6+FOriIIaQbqEdq7k3ibqmBMhsH4IEHFNQY1+v+Q4sy1TlZDC7uceUX
 bRn9Ru6PgsPjoAu7JQP/Vk//KOOuIvrQmmf/x1wUWMF2/loub3imFjyl9gbnTmElfmQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08EFA40B03
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:48:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FB17814CE; Thu,  1 Oct 2026 16:46:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Oct 2026 18:46:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97a94e01efa24d9a9b7a410a42cd0fe312e65197
X-Git-Newrev: 6e0a068475062968db52c102ec2b7185f8a90d1b
X-Patchwork-Hint: ignore
Message-Id: <20261001164648.3FB17814CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump version to
 3.14.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e0a068475062968db52c102ec2b7185f8a90d1b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.python.org/downloads/release/python-3148/
https://docs.python.org/release/3.14.8/whatsnew/changelog.html

Security content in this releases

CVE-2026-19445 gh-156293
Use-after-free of a server-side SSLContext when sni_callback switches
contexts

CVE-2026-19553 gh-156793
SSLContext.wrap_bio() missing validation of server_hostname parameter

CVE-2026-82049 gh-157190
tarfile extraction filters allow file modification and content
disclosure via hard link to symlink

CVE-2026-15310 gh-156002
Memory exhaustion in zipfile in bzip2/LZMA/Zstandard decompression

CVE-2026-19672 gh-155999
tarfile extraction filter bypass allows creation of directories outside
the destination

CVE-2026-15806 gh-155694
urllib.request.HTTPPasswordMgr credentials for one URL scheme sent over
another scheme

CVE-2026-17084 gh-155292
StringPrep algorithm considered Unicode codepoint attributes outside
Unicode 3.2.0

gh-158446
Reject float format precision near INT_MAX

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 97302bc750..ae4a00c319 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3147/
-sha256  3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81  Python-3.14.7.tar.xz
+# From https://www.python.org/downloads/release/python-3148/
+sha256  c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73  Python-3.14.8.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index cb5e1a4b85..788d993d75 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
