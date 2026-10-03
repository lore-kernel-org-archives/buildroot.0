Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCF1CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C3B606B6;
	Sat,  3 Oct 2026 15:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVQ521t7o5ST; Sat,  3 Oct 2026 15:55:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 99F0A60601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042900;
	b=EhAgTiasDt+9p1VDbLs+3sXcErORfsSz7gVY+fhOYaffbs0ngt6VJ63muGxcAkPZwFZs
	 c/ebzUQALe01h/tYhilWpGQbtewaK6rwmsRGzozOp1CPaIJgVRdpoSgWTMVTCYAnJ7X83
	 i1pVADXIffXgzwYurpnxVVJaVFBfeugfc+lKC+C1LLRaLjLaglXJvV/X9PGRehE9HT6Sz
	 7r0h0DpVHIZwJyJVe9ppy19YnaLTL0fBz2cPoXMzm9SuquVJYsld/zxReAJ6xJJt8KEbz
	 KS3fMHrs+hpLPYwxvceK2YKhSr1d0VDjpHxmZAc/oe8Yh3Wq9jhf8H7lXk1gwNuU7nA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042900;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RzR6fhLNL7Sd/Z9Rmb+Je4w7VPCDq4lPCIxfsC/Ds5U=;
	b=TB8i/MjAim03UXuVNjavEg1dVgqaxKTYw3/lpnPmj8aP/PZAoQ0kAyJI2prT5XhO/vLL
	 kD711XZcwkd9SovlCtI574RqUJlcYwt8jkqnZOojQKIas8OOrk8+r2RrT8TjuQyBB6ww+
	 iAHolf1BbpsCoDAMzTEVM2QhxzcihmKkYGpKjtRmZ109ukMKEDnbSMa4IdmnHnFAxO9+c
	 trDeDhcQHwI+z+eL1dTnhIRApOC2SFDO6jA3kXrl4NudFJmJ9p46R6KKDLIHqNHPctV1J
	 EjDAyejWTK+cgF+FgH9uN3Sus13APr06qJuhuXbKfpMk1MRiEwu7KC4QDdK/u/1fndA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042900;
	bh=RzR6fhLNL7Sd/Z9Rmb+Je4w7VPCDq4lPCIxfsC/Ds5U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fpYOvZD/7PKtl3iklHfSOaJEX9QDwNlePWGC39eNBm+LWXMTdM6deoG7oqzdp3GhK
	 AL0P/IRRtSQR8jiJh7iSmCXOfCgr9lpt4SPqd3VPoXI8QaUv34wuiZH0S7f8BiqxFq
	 I+jyKkd/vAWJGzRHMIsiso1WpzqR8z8+eJdNsB4BznTEfjt8e0xpq7pMDwfDrgu930
	 WrXWLHI+nZ6YmuIhAQYWDXhEBriBajp+cdaXA2vDYW0ms1QSXJLKu8m6ciUEnra/tT
	 WGkB7FwzxvCPewJHjyWKr3YYCUHPXsLNJqNPIAi2hlEgKCDFpFITVVIqYnnXRUhEet
	 LIS7c9GMguvpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99F0A60601;
	Sat,  3 Oct 2026 15:55:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5967E4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53D13606BB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ms9-A_1PPLkE for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7726760680
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=PGsG1AmsNaLCgyTNb6CStSByOyahMCAxk8SE70l4nukOwrgByC7Sd9tgtJ/MqnsnORt3
 9QmFVtSJb/ZeDe4/gGjIdrWBgvlxTCgtK+EprzyecALS8YNvalGy5cmfKx2oYHud/vV48
 mLfoM41nt13U64hE4qL4+S7EnzF3w+gOEFww207e6W7iAy5lPyvr2ajGzkW0R2Deq+OkL
 yRaWDWwFCffOn1V9uWUqKGr2sTk0ewJqWYXnlpSPeW2knXvIheaaxrgK3yoPGkPupM4tF
 9kuE1yeMD9N3OkGzDAsbLHYk/5dU4WrtnGiWz5tMiV7B5EkgxiUkfQA3mNe6jhAxjhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MDuEnHYm3Z7oUyKGqL4yy2G/Es7gtMY6tih/3pqXWt0=;
 b=cYJNNQccFZ0wm6qhb+dkMkoEtBX7CCyOUfqIGsbWKTNnQz/8ipIxqwQIt5M/dLz2MZWx
 UxWLhiUZxdXDD3JYOrIYsICDeMAaTMZBKV8p+eRbKTLrd9h1SyFMzsG7p1k/4dyWrNc+N
 cBqU/skk5325Tjcd9b6sAULb/P79TUnhB2z6u1bpwPe91gPiPfWGtnHxX2Bx4wegkN6MB
 mMI3BnNgpF6ju/Du++aavu5T59clgcbqbKiV1IQnQKfS5OlSxgUcbfivFM//gOeXM7JOa
 22T5jaei19Ozkvr9d2zMxbvmXw+Fb7P2gRvWUZGz8WFXsRk156Zqe2qnI2EHVMEdfKA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7726760680
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B81AB886F7; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7349e4fd40845fd8cbbdb24c305aa8cc3e70b8de
X-Git-Newrev: 6e793fee963c68721f9907903689f4741a5e5ec7
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.B81AB886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyproject-metadata: bump
 version to 0.12.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6e793fee963c68721f9907903689f4741a5e5ec7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyproject-metadata/python-pyproject-metadata.hash | 4 ++--
 package/python-pyproject-metadata/python-pyproject-metadata.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.hash b/package/python-pyproject-metadata/python-pyproject-metadata.hash
index e107c11327..2f67cd111c 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.hash
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject-metadata/json
-md5  f5f54a0951177667dfd7eefdfaa11372  pyproject_metadata-0.11.0.tar.gz
-sha256  c72fa49418bb7c5a10f25e050c418009898d1c051721d19f98a6fb6da59a66cf  pyproject_metadata-0.11.0.tar.gz
+md5  d44c15fd176128acd9497af2512085a0  pyproject_metadata-0.12.1.tar.gz
+sha256  8809a4df6fe08279b39a8890669506ed3158e0617855ac9aff098fcbe772ae4c  pyproject_metadata-0.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pyproject-metadata/python-pyproject-metadata.mk b/package/python-pyproject-metadata/python-pyproject-metadata.mk
index 8e234f9be5..1be6856bcc 100644
--- a/package/python-pyproject-metadata/python-pyproject-metadata.mk
+++ b/package/python-pyproject-metadata/python-pyproject-metadata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_METADATA_VERSION = 0.11.0
+PYTHON_PYPROJECT_METADATA_VERSION = 0.12.1
 PYTHON_PYPROJECT_METADATA_SOURCE = pyproject_metadata-$(PYTHON_PYPROJECT_METADATA_VERSION).tar.gz
-PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/83/fa/8bf4fa41adfebd95dce360afe3f5fca243a17932089d3d5486e95ca44c57
+PYTHON_PYPROJECT_METADATA_SITE = https://files.pythonhosted.org/packages/4f/76/1cae539918a7b1746d624c2f01560b793c22cd8c081157505bb9bbf0e34d
 PYTHON_PYPROJECT_METADATA_SETUP_TYPE = flit
 PYTHON_PYPROJECT_METADATA_LICENSE = MIT
 PYTHON_PYPROJECT_METADATA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
