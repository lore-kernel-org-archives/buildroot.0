Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9DECA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C835F61018;
	Sat,  3 Oct 2026 15:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzXi2GoQyCnx; Sat,  3 Oct 2026 15:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AEA646100A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043005;
	b=H2pQbmkY15Yy9VK52va+A54zJ9DtIGbTO6Tvfxzh3iIlTKy44aiJO3r/Q6j3DL2zLAwD
	 TLLxSU9x5nzI/za2pSBFfLFfggsOR/LlK6P8sV8UrLY4QeIxDFwKE3MZS21BdH1+eP+dO
	 5iUI/eskNsK0b16rWmvV43yF0KpVIJkpgQDbMmJd3Z+Mvj7HgumWqytMC1roQUuofw1E4
	 kpv6QuAo9TF+IeZxnk7xf36RZVs64sH9n5IXoaku9datWa6DmEv+tEWKuYqre0BjzagrF
	 RhvYE4WmFT78vLLwQtVf8gnunihG73vBR6vYrClHq3X6OONR92auUxkeeHVgsf4YFLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043005;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sr4ATCwu7SVY6589WP/9EX0l0iOvTUJ+Nie9XHWTK50=;
	b=SOYDbsH5GlT/l0vej5Rl1tjSR6b/oFFgSGc6jSbngXSh/9z/CuN9RgCxd9WrgrsWQuIG
	 ywpCFf0IWB1a2b3C23WdqjnI+4F6wez7w3bf7rE9w41W0EMIWEHfuku0N3RCmwf/4gwNx
	 Dbe5nefdAE1HLMRldWPK3zurA6N6iw2znm5d6b/lz9A66DQ7JeJUXz1mOqBuuTPvSnLZH
	 B++YxwXlwln/wiRS7YXXitBQT0scZ1Q1/HNwOgUvmQXY8olG9qcNwN1cwSI2RFvbMK0N+
	 +9MzWiMwkqZMvgSAnTj40jNDJ8BuwJdOxNSU8FPxGnzecu43ERg9/1bvAJ7mV8SS2hg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043005;
	bh=sr4ATCwu7SVY6589WP/9EX0l0iOvTUJ+Nie9XHWTK50=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B+9JtKwJTF2RN6vfqnKgKqHeJFOja2lM4DrGXlvrPXMA5Vxvc3Cq7uHN+o/4DY4nV
	 TeTvuc/ZK639OZ8si4j54V6r3NCMCRQu/LlxScrjFnNrUJzS0rETSSKqC5IQYBdqRJ
	 Td+zOxV+DpJH+XMSGWtYsJ5z6S+luConSB3QDbXQMAQxVZlCq8dGQwgCEfH05yG/Wk
	 jWHGPyAkqguNlbcbEmmoKJWkHnWcj/9BC/kOZwEZFOA888IIIqB5AUp53uRFWWTD2M
	 y097lcYyzmfwGT/fE1yqR1a+0fY/DN0DlJB8VquXq802WJz5z0pJKzr4urZO/k+jml
	 gD/GNx592WzDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEA646100A;
	Sat,  3 Oct 2026 15:56:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B39A476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED55960680
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NCVSkrY_Fl7 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B2C1E60672
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=J47/yDvG1YTaAk/XnPqlh7CddfkQNXDgcnEujWGJNlMc70rZK62+MJT1H3pKDd+rMJdl
 O/dR0dWwlJw8drUgDZ2JDihnRff2uOwaGHFPBjPuW4v0RfZLiaP9Uo5LUTr+bB1R4tqPP
 c4+R15/4EcqBriah/lUJTYeLfXjAjw1g0Jd4DVOwUd/fy2ddbwsvljKzVbuUZ9RiMfaGm
 9llYd8nucAtI4Tjs0hnvxJMidzLgfcAblJB/roke74t6zj6c4t8PR36cdTN+DRwCssJXM
 SXEFEKGgV5lH/CfJo5i6DJYOYZNhI5Oxv5YI1h3ThCV9/YtgQGYF0CHhYb3CUqt82Yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2Kl69OMjhpHTnYaCYpL2S3roOhXnu9cxw0Lf1qB3XqI=;
 b=dy/LjBLzJyJPOcfaTE3hp8W6sA6A3rgzLqe1hoACnvp/oBF1cUWlxXP57aaxMI+ffwrL
 2hWqOTk/6CxzZGaOM+17QVhC0QDWIqBJJq5XI+Nn9wSK1G8O5Fv6jr6iMu9cRq64mQ497
 2wNBy5JWNggCX419ZfsjKVDRt+6o+U9wKnYGx4EafYpSR3VQoU0MANngEwfjpt7DLxZWg
 gxQEiui5SxAqmTL715cIOSCCKBAHnz1VjM7EJt4nPVde7DOTd76fsqTTHwMFivCLMEQFE
 Q97sDFlZ2UMIVVtMW1qhVdPv+ibm1iL3mMYQOhQ2MUDL8uky9HWpwaR0AEeGWLBTzMw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2C1E60672
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F28C48A574; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bb6d02085b76fcc2c3f8c85bab0caa53cf340c8
X-Git-Newrev: 4407ca0af959c450a81f2342c4f63ae3c5e09533
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.F28C48A574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hiredis: bump version to
 3.4.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4407ca0af959c450a81f2342c4f63ae3c5e09533
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-hiredis/python-hiredis.hash | 4 ++--
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 8804a47b8a..786c9d206a 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  ac8a2fa2182ff57c5fb5650d71e85b59  hiredis-3.3.1.tar.gz
-sha256  da6f0302360e99d32bc2869772692797ebadd536e1b826d0103c72ba49d38698  hiredis-3.3.1.tar.gz
+md5  af5fa7a3efd797b3cf705a347eb54a20  hiredis-3.4.2.tar.gz
+sha256  9a566dc70e9dd84be3550babc56a8e109bb65cafcac635aea027fa425196a7d7  hiredis-3.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3256b5b77e98aa34ff31a4d2c2c10f7f177b0f3058753a6044430a168987353b  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index a722f2eab9..bf6d8edcf7 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 3.3.1
+PYTHON_HIREDIS_VERSION = 3.4.2
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/97/d6/9bef6dc3052c168c93fbf7e6c0f2b12c45f0f741a2d30fd919096774343a
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/38/da/41b341ebed1eb6f1074112936af98bb52880724737887ae9bade9d7ce107
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
