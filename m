Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E928CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B2D580D7C;
	Tue, 13 Oct 2026 20:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7BtP0B49oyE; Tue, 13 Oct 2026 20:57:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1ECC880CA2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925063;
	b=fcP3SIeLnTKwL1zeQLV7Jj0oIPZEgfRMqX0osBnyFwfBywQDx0wJr5salpZ3YkBFDrav
	 MLnvvUHnXQ6EMZPw/dH7OyQs/YKH1lygQm+kWDPZrEi0hAOFEgoKYT19PsG4UBaVjLRr7
	 f6VIRXjv28AGtQiRrFsyomqOOLbdsfgIa9DpEIIv2/WL9X+0MIdPHUP3DhwCYz1GLkzcj
	 rI283IucSpR6taSqLM7z+3fQ4PK3fruK1VfuIZNJI3oKaJeKpil46kKJDVf2W6t1TvckC
	 uE/SkZcgRB5jF/rVd2DYUZrR8fGEIJnScDNVj+cu9+x+3U7sv0q2Z5w6SNrQHWLfDgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925063;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EdRUlQnGx80PXONHi+W6m4QUfgINu2Ta5rohZjrSX30=;
	b=EpWEDGA+7JNGp5sdjt+1lvFwgwOEsDjYtRY3H+EwFeYNmoSR0BathDpzay+twcYZiHTx
	 cHrr/e7ZSUgA/j3SQcZPNFIxw4cLUatFRdCsvEgyOggLDfygROCec8QvGuJSiifE9KD3S
	 QsgPVSR2z07DwWit36hQXjun/sa8DJoj/6AOQxAYoUuCLYH6f1XE/sIKmwqDCfAFUvtfs
	 Jur6OcX1bcsoh8V02qTTipzoLgCRoR6QFIcEwsCth1BoCVvVQmycbj5HE8sdeSokAfxW2
	 q2GwIxsz2YWMVwKAO3GwOokcenspgaWIdXyX8lIOFZXqe9s3aoxcxmvj/04pIvIOUEw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925063;
	bh=EdRUlQnGx80PXONHi+W6m4QUfgINu2Ta5rohZjrSX30=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CiHQoQjXhaVe0T8FpasVg19a+bdY7v4EaMqs3Qv4KDAsFOAy61G/QNZB817zPd61q
	 90WL73jfv1R4XC73CbD7NdQfoNkoqx+s7pw4dSSm8qBbUSXr0Cxpae1WDnhDJMjHL1
	 XYw1dK3SWLbZ0TRNQtKlqg2RAJjnpLnzuOsMjGyN5zXxuw6lmjS6gAy8l6HEfP2t1p
	 fFEIiGC+pkz2vxFXj4wIEzWCfEshClKa3rgxLWo2LZnvC6e/Nc1jDvdOFvrNE8lgGC
	 RXoIIpiuvxBlgGQWkizHIWcT0h+wLccs01SFZMMbHTy2OgVkwcBSeTRCmXc5Lxf2X0
	 HKZR3RadfCU8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ECC880CA2;
	Tue, 13 Oct 2026 20:57:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B256B2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3FD240448
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ecY4YmdcyLD for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 02769405B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925055;
 b=B9cUwUKciA+/r1D8RUhfNhsNnW1CUrxUptYTGqw74DU0YszTbN8GRc8z7gPz2iEOYLdF
 pOBHmKYVvAeSPrdtvglKihBvBKLPH1xdKrmjHWoWBLSM8d+j1M9iDfR3i5WF+e53WRh1x
 M/7Hwd/paIonotZc5AzCPMK+hwzaFdBAIDHnwDqQmaoXp4/hKC3+P0FakT7kFwaLrffIq
 zxrWvwHyNhzx5emPD8XSuyv12MzCY3xCpW5dEumlsCz4shlcfg7uNJv5aD6h6dCd8Ms3V
 FdIk7DIeb6Ywkk97dbRXdudwvgdmR0vUpK2wSatSC0QjdWYSZWr+9ZWXUw2cYxOf3sw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925055;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2x/mIxIQZ2uUWI2DvBjZNIFaFRioPjdliw7xpEvMoE8=;
 b=HxCU8qGG9Z7jAlDosYZYbV7QYaBo3JnqTv1LsxxhbWbJRL9eJ1/Pvc0NJTFM7Qqr/1o6
 txmkd1npWvh+tfE+B399dMsLiTe+crHDFQSCHdWHZ02Uv3BLsU5ZlB8ojLnZQAw0JFJTL
 Ykun74gqjcuoCbttjZ8h/e3bvBWuzzxpUqoHAkrb6U6NyX6tm/9ixBU+lGPNDgNoR30Fp
 K+LukgFvtKVOJ1FnUFxKle6UrrSOx/Q3O0sdKFMATaOdTlP41K7MBFSFe6hxLkJrXheKC
 C/R/1oP4B1SE6ZMa6Q0Z8CxsvfRXXdsNvIq1qyOMf+AK4GdCE4EEjUaat6+sDOBkMLA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02769405B4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D0C7957C8; Tue, 13 Oct 2026 20:56:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:54:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65db6968c110bd9af42226b71519052a8e05d546
X-Git-Newrev: 39093c7ee42f0b97b33ae7a350567491a26af9c8
X-Patchwork-Hint: ignore
Message-Id: <20261013205615.1D0C7957C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-librt: bump to version
 0.16.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/39093c7ee42f0b97b33ae7a350567491a26af9c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the mypy-extensions runtime dependency for both target and host
packages. The vecs module now imports mypy_extensions unconditionally,
rather than only when the experimental vector support is enabled.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-librt/Config.in         | 1 +
 package/python-librt/python-librt.hash | 4 ++--
 package/python-librt/python-librt.mk   | 5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-librt/Config.in b/package/python-librt/Config.in
index 1e29629680..fefc32acb1 100644
--- a/package/python-librt/Config.in
+++ b/package/python-librt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_LIBRT
 	bool "python-librt"
+	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
 	help
 	  Mypyc runtime library.
 
diff --git a/package/python-librt/python-librt.hash b/package/python-librt/python-librt.hash
index 30ab711042..850d8cc3a5 100644
--- a/package/python-librt/python-librt.hash
+++ b/package/python-librt/python-librt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/librt/json
-md5  25cc9fb4e0c47582ff60ee5985cacc6d  librt-0.9.0.tar.gz
-sha256  a0951822531e7aee6e0dfb556b30d5ee36bbe234faf60c20a16c01be3530869d  librt-0.9.0.tar.gz
+md5  d5f38ab06cf4e27cc33a94ba86553d57  librt-0.16.0.tar.gz
+sha256  ac38d6d8d66bf3d744148dbbc0b8e193e195a51e364ed55e224631f5721891fc  librt-0.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88f9e379c684580053c58e75e296ca2eb243b6edcc6e5357f247310e96eeef8a  LICENSE
diff --git a/package/python-librt/python-librt.mk b/package/python-librt/python-librt.mk
index 264fe83281..09b7c32697 100644
--- a/package/python-librt/python-librt.mk
+++ b/package/python-librt/python-librt.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_LIBRT_VERSION = 0.9.0
+PYTHON_LIBRT_VERSION = 0.16.0
 PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
-PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/eb/6b/3d5c13fb3e3c4f43206c8f9dfed13778c2ed4f000bacaa0b7ce3c402a265
+PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/04/f5/9dc696772d241814bacac7880bac32f2930b5a6ebc1f85317b83161a011c
 PYTHON_LIBRT_SETUP_TYPE = setuptools
 PYTHON_LIBRT_LICENSE = MIT
 PYTHON_LIBRT_LICENSE_FILES = LICENSE
 PYTHON_LIBRT_ENV = MYPYC_NO_EXTRA_FLAGS=1
+HOST_PYTHON_LIBRT_DEPENDENCIES = host-python-mypy-extensions
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
