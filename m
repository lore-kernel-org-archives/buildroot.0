Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E82CCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 439D94123F;
	Sat,  3 Oct 2026 10:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YlM-ocEzq3l0; Sat,  3 Oct 2026 10:08:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DE67641231
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022086;
	b=MDKsLMkikJoOG9dxj25Gu2kZteMxU2jsMQ8bCkAy70MwhSV0PMeHATt5FyNV2op9EQjl
	 gMkqWCuCZ5GPVyCcaiJEU5DUvWewV8StB3N2q6KOSYJX7ViDIxkHWe3qf9FrOZi5iYH2n
	 sPnr5s+f/cETMoj8Vq6QGmMRpDnEJnhgxNFHmWdfsvXd3qw2L6LBfmH9jfMGCKV78DxcK
	 v3HV4ZFrdiSIl70LbFkNH7IYuJ2Kny7INCl9P0lwwFCbzlPyIX1XTRAS+zr7YXjzx1NUh
	 A+XJbt4KnPEe/znS58nZrCuaIeMchSoZu16Dr8pU1i4x16Pc2CAwxGTZY7qj9rdYfbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022086;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ejkG2iX/uaEAe9C6b+sVgKMV678SwCSmdgBs4RbyR5Y=;
	b=mfDOn+9D5OZr1nLhWzd/Jb83kesXop3RYFvmxRMq/0fj8s7jQ9B97Xk3gQ4DBK/+Yxg8
	 GEUWZ0A4yj03PV/+I614vuVJC0BfehJ/pUIeo5f5XIjJieken2AiMkRpxtAFaiVYwWvMI
	 9tmUYl2jS3imMiy2xnU9mzfwlTefqIjdy8ejxuWXInyScLoEr7J6xDZUS8n2OUVqxOyfh
	 dtdvz/IsX19zTHuTizCt/JT8UN/5igyHzXMACWvwDwli2r9K5NSEsHPJyQIn+5pjI5Zin
	 WZNDX7i3ZTRZjuIAfEKaGEZVQ2n4GwMCoamHavPItvNWPb5t2ixKr/Y305um6Tk2yZg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022086;
	bh=ejkG2iX/uaEAe9C6b+sVgKMV678SwCSmdgBs4RbyR5Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NcZDs5davIX0ocOYqbv5rTxLWDQPDqo+BLF8LSDRQepz2Notv+rTBLxBoEq4fyAb0
	 W3RbQybsP0bONT1oUriuo2YZ1TOV9hBTT1sLdyUYjr+TclwWiGRhmNPXGWTkEOu/5v
	 /+u72lcSsfewqoNAlZn4WIoxT3DoACxp5WUYayf5xdJ3L19XZPZr+2I2jdFmWw5hmg
	 PDd7z9kq1bKDebROyy6BT1L0L4uO7wUDlnELv3xVe7e7vOWrwylsGH3m+01xMJAlS0
	 M0qzTYJ4eswRXZVBQPeJpjZnsAaDzg/rrRIy9HntB8eZdglwUvgBfoLZH7/6lOZ4tv
	 uLDTdXn6kddcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE67641231;
	Sat,  3 Oct 2026 10:08:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 459A59DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A33060E86
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gARGxZWJqwwX for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9989260E94
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=Y37OJnLFmq8k0san08uOzAutBfhcpXhg/w7PgWxGmVV9XHgEjRUJhyzqUDm4MhC3V97I
 zGCcpTFSnM7B+PA8uLrw05rrJL3zubgymHUfvNe4+Hq+d3DM2H6zNbIWxgFXrJqUxbuNZ
 +x2CtVQRlA33OvvC6cvY9YiGUGZOPmnI6dPIJX7xo7BmCx9CiEercN6nY/2fs+3qNHN5z
 NVMHOlfij5rDbgwdE0gGHiXWCvbUXNsL3iUY7WLI3ygItFWAodBTPH8+lOB+ZCRDkfd1D
 47bzi41a4mGHqrvn7EC+Q3BQzpUWPMW6DNTKCgIzLE5I7rYggnRFMhHJ6AOPEHW+aew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cDCMpOh7vQMrDt4YEaKmPaRlc+naPmclz4pThb3vblU=;
 b=d2VOLUAIoyYnXlSszkfS7xzxv+0ozZLCINlMCjAz4N30dzurxPdBmhNVjkJl2n7SVKCm
 8vRy3KQ91DgWN8wo6IJVcN19Zp3LEu09400WuY4fWj9yXdXt6B1rwsj0JVdVVai6lpACj
 rOzWPRvRfzVxm4bhGH4UZQiGBOg12ZWtMwhJV5xySUQmWmlnceqp0eNwcShGM9CxHofsk
 5jKXOLdELqmyL/zTE+m96TENokrWTcD33b00l9MCnRZ1hPIR7Cb1cwfCw29tDzwTNcr8S
 T0cZKQR+eBqzRpCCiEYZk15VeZtDhZ6/vve+sYZgVHjEm+7PdcsrH0k4M9oTZOSej7Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9989260E94
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0436C88762; Sat,  3 Oct 2026 10:05:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d4a361263ce4fcc06392f30fdb6679ce4b95328
X-Git-Newrev: ef347d2bd156e7b6cdd984dd7b3d888cf78f8e5a
X-Patchwork-Hint: ignore
Message-Id: <20261003100555.0436C88762@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tpm2-pytss: bump to version
 3.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef347d2bd156e7b6cdd984dd7b3d888cf78f8e5a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tpm2-pytss/python-tpm2-pytss.hash | 4 ++--
 package/python-tpm2-pytss/python-tpm2-pytss.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.hash b/package/python-tpm2-pytss/python-tpm2-pytss.hash
index 0e73f6d460..c6f3aa35f6 100644
--- a/package/python-tpm2-pytss/python-tpm2-pytss.hash
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tpm2-pytss/json
-md5  241696dfce31c539ae418a5d3587b945  tpm2-pytss-2.3.0.tar.gz
-sha256  20071129379656f5f3c3bc16d364612672b147d81191fb4eb9f9ff9fbee48410  tpm2-pytss-2.3.0.tar.gz
+md5  d68827bda582608b698e2478c5cc2d3f  tpm2_pytss-3.0.0.tar.gz
+sha256  c193cf1908b482f93c4aa464132920fe3a37d4b9d802e267974ff2dfe37d4433  tpm2_pytss-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.mk b/package/python-tpm2-pytss/python-tpm2-pytss.mk
index 9a192fc7ca..81efb5be04 100644
--- a/package/python-tpm2-pytss/python-tpm2-pytss.mk
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TPM2_PYTSS_VERSION = 2.3.0
-PYTHON_TPM2_PYTSS_SOURCE = tpm2-pytss-$(PYTHON_TPM2_PYTSS_VERSION).tar.gz
-PYTHON_TPM2_PYTSS_SITE = https://files.pythonhosted.org/packages/07/1f/0f2521440e330342ef757a6605b61e1dbf5fe47fd97397c6e5f02791d520
+PYTHON_TPM2_PYTSS_VERSION = 3.0.0
+PYTHON_TPM2_PYTSS_SOURCE = tpm2_pytss-$(PYTHON_TPM2_PYTSS_VERSION).tar.gz
+PYTHON_TPM2_PYTSS_SITE = https://files.pythonhosted.org/packages/39/47/7d7089c88e5c73bdef6ca85d6bdb00cdfd655fb59f9cb2b1011557ce7533
 PYTHON_TPM2_PYTSS_SETUP_TYPE = setuptools
 PYTHON_TPM2_PYTSS_LICENSE = BSD-2-Clause
 PYTHON_TPM2_PYTSS_LICENSE_FILES = LICENSE
@@ -17,6 +17,7 @@ PYTHON_TPM2_PYTSS_DEPENDENCIES = host-pkgconf \
 	host-python-cryptography \
 	host-python-pkgconfig \
 	host-python-pycparser \
+	host-python-setuptools-scm \
 	tpm2-tss
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
