Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D32CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80F4960E80;
	Sat,  3 Oct 2026 15:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KF6IzaFDppUu; Sat,  3 Oct 2026 15:55:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9F72460E65
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042919;
	b=S4QHea3D4WFvh5AAWQAicLwb6Qz8bBNaub+6xGuGwsnOT8MQqrfCJ13gUOXEd0cfPPr+
	 QNvk/ENbAnKQxHByS4oe8jDAIRH56kJMFo9KapucS2K/KZ5bPBp2I/XdNb4rhGxS2jIhp
	 XFMf8XkWlBDULU63fHTVlEOfQtZSQFg655tOhSRlhHS0RD1oEVeTevflHN9NbYq1w8vhE
	 mQtCgmp54lLIToYwuIMPMXk39bFaa8Yt1AnzGYtIzPS0z5Q71EX+h1i24Ut6JpSS3kmpi
	 fDcyJjcEonQa8kqUJAoJ6oY08OwMrD722eggEIJkuRAr9zZceUuekkADACGpPruyWOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042919;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HG/92DuEgu7y5a4Xt8+lIJG+QXsVFMHYYrbdAl6SGMg=;
	b=pml0S2PM7Dt4C2C5OO/JCL7Oi8AiS2G3gZz/AvLXM7S7EGoG/SUauqQHhh+6pGecJ4em
	 nFG1HCx/oixzq6olSW8xW+DWitxFO1ErV7uuouYoeDjSFYqWrylO670VMC9nG3Dzbb1LD
	 CdE8cZ1YtJ/DfmEwkAI/oAnPUw2ILXFnt7TUdnEdxWY3PqmBR16CeYpBk7wh0evhArJK7
	 U2mondeu5Vu/4yI6twkz6Wy66BuYnBI/+Y3XqsgOZs40ymNFyFfQID56cC0IinyIntn3q
	 v0EF4aBGWu9YBj+FsYI+4N+M1xLTb46y1fPv+zIlJku/DxFrjfGvlb19laPu1aDZpBQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042919;
	bh=HG/92DuEgu7y5a4Xt8+lIJG+QXsVFMHYYrbdAl6SGMg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=po2AXEG+gXm+uTRUWqsrmS8UxuwGgk+sIVBQW5ddFs9ffdUYQsBBfeb8tIbPYIaRw
	 n2i5bZ5TqulQyxo/2GhphZPpwo3C/PZZYMFi7maj9zVGbDS2nYHje13m39u+33hSY1
	 aeDifhUR7W1LdLv5Ns4egJgdvu+elToqZVIp3QiMDePRaQ4R4cQCjqzY2nVDOLFP2X
	 ML+HntsHZSWjtbfMu7srTpn+ISGFeN8WyvnWj07MUgC6IBlc4DHBuHGJOl3tbhGoo/
	 zZgImgmMTd7aa6lejEFSNXqplVWoS7R4Di97THQ/4ZARfDTe5WMkgFBqCIpshNrn1w
	 KN/lbZTZcGRfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F72460E65;
	Sat,  3 Oct 2026 15:55:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D112E476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB75C60689
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uby-Cw5Pz3Lo for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DA20D6064C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=ovtPfc2LGSmmTMVcM473r4UZvLBEfbZXtLzAdZBJkPOuUauMRyJ2R133rHB23mV5NP//
 bC4eTMbkCfrv9QI4rbKuJnObC6CJM+v7aDfdcx0xlZfzc79D2hGXq9tiHqtGe1FLgB7j/
 C1P58cvpYFXbT/4I6WWX5p8upnnbb7NNm7VRxZlfm4POY3VVAo3F1J4DdS/UMf+HmVyQm
 Wc1CR+iBwhBgR4CgOj7yP1pHeMlBBP0alaBglJauhy9GUdo05kT5b0LMdcX6pjymViTf3
 jGdI3hd4FQcz7+L9yfna16H6vnWMVuYB+iFa0yYm1eq8d1oVIWyRzTzYUHoecSPy2bQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PWjxldmmeqaTTTsmrnvtnBYNgeY4iWFIYR5AuyH+uig=;
 b=pYxlAdHqLg/2az7RnErD9dZYR9y9+kroy59G5c55iRXwqS68qYTB47RvdLkO5br/+zB7
 g1HHmKzSMSXvlkAyc/SXP0NcpVL6pvla9OiF7aS5dvJlcvaYW9LA+uPRNgeeIrFuPab8+
 pY0phUylix3v4UZxr2iR7ba9R+V5x1vNJdtrztF0Q72FeMDW9eB3sFHnyzg7wk++aRd5s
 L2WkaEtmiKEAHFNAP6GtdEKc7LlnOYbgQKtkW2f5uQ9a4WahiBP9JgpxoVp3CIDOYO6bE
 9GR0sntHHpRBWQOUpISQnjhjubrTna3JBly0aH9MA4z5iqtpfMpRBesxnSNWiCpNr3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA20D6064C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2737B8A31E; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a8cf83373456772ab619146523caefe01ee6ad5
X-Git-Newrev: 8d3f78cf91762f62718160be68931a8de0b8d671
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.2737B8A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-redis: bump version to 8.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8d3f78cf91762f62718160be68931a8de0b8d671
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 583cb74bfd..9df2a4f3e0 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  f7c1c7b3f4d163d2d424150d0498a35b  redis-7.4.0.tar.gz
-sha256  64a6ea7bf567ad43c964d2c30d82853f8df927c5c9017766c55a1d1ed95d18ad  redis-7.4.0.tar.gz
+md5  582678e33dbcaaabc7b0e54acd99632f  redis-8.1.0.tar.gz
+sha256  6e1a19beef9225c83efd689c7e6b7da2d5215b1f42cd13b7fc3714d0a09c7b25  redis-8.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 21dd6f1994..6695b65f62 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 7.4.0
+PYTHON_REDIS_VERSION = 8.1.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/7b/7f/3759b1d0d72b7c92f0d70ffd9dc962b7b7b5ee74e135f9d7d8ab06b8a318
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/a8/99/604f0b666d4c616d891cf77ebb9db6bb21601344c051aebf1b72b9ff915f
 PYTHON_REDIS_SETUP_TYPE = hatch
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
