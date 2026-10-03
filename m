Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E926DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABA84411BA;
	Sat,  3 Oct 2026 10:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQC3DOBUHmpm; Sat,  3 Oct 2026 10:07:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 508EA411D7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022066;
	b=qGWB6UWSQ4WSnpivF2Fvfhhq0qJnH6nwA9Kr+DPb6RHURdp0du2dGsYFqaly6CIwG2LH
	 t8OFQuhvnzK3tIxNu0kzlWs8cWRy6kCm4J+Z0o/wlCtXShgHstEesiPStoq0L9QwnbOjL
	 DuK8iU7QJ/8fNSAOcP8IofQya0k9y+ifwfwSCPHCV82DYlwxWgEYA7L+FYor97NgjtGVX
	 mSAwYYC7YV/iYiOY+teUWLigP55v2jTgyhJVjaEvVbKuPNvS1bJlV+GUxOvnoM8XN555h
	 P2RMN9eUro4eivqqIEShOPk7mf7OrLbNUHjf52NdM8WXudZhWlULVOoQk3bmJHmsFlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b4HHAu8a7nOgYIADANQmOqRS2UYCi+RGhRmxXQw/L9E=;
	b=kTR0i5uaO7NBhhAP35JQGLnzB26kNWKIdv2KDoQ0gh7GAHbWG3gsG237CRlhS8LWkvKK
	 TFzjDEGvUIOIy0b8924a2pHejpJxnCczN6aSmX4kmP2k0DHjgP//ZEAgK+qmYiUKlhteD
	 So6GruW03KoWYi/zXPF4Pig4lXRi2JnN/Qo4MdkeG0xoBeG9G5c6sx8KZnEf/syeO4pqd
	 YVMlxQlCs+v7lVhLR/U6wUZcBa0H/eIhBrDyo0G+AmUTkf/7ySoJ0VV8hUAB/rX+j91pJ
	 0l8RJnSdsnL0fFQ9pa/CcHBYBRNGb28OyFwiJeaLhpHoR2Vy1/Ym5c4DqZ0IFu1Mfxw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022066;
	bh=b4HHAu8a7nOgYIADANQmOqRS2UYCi+RGhRmxXQw/L9E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qDdSs4F2xakUZrtAMI/54Eu62PbsYXJ++3g5hMiZYNTLVDex8W5yleNIiIlX9DF+L
	 DhrmceN+ortYZ8txgNzTXFlG0VnuNd1l3s8y3f7jF/V0BAlOQqw8aOU7sjwJ4K/WoC
	 Uh3rt6RT7stItADj62Qmy20qNgHodbQXFQOG9SJGbbzOYDOGSIkWA3eUBJG6/pXjx+
	 DHY95SFeUZEhxH8HbXeazempzlOArdaqU4Xi/FfUyuJoYbGYYkGHwcV9lGW3LWV0kY
	 V5hjdJshTEJQWmgN211DHvwBx+ffu4UlZGx6L17YWvY/zV+8xCE925efqmrZmHBvwi
	 qsy8ryjbWJ3xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 508EA411D7;
	Sat,  3 Oct 2026 10:07:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2031A476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0421F60E88
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1muunULQJhje for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1C80760E8B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=ImVZq6b10oXT++/Ou1g+QqsNDWMOd+dwumLO7lTeAQGox3wrTvar/fEb/bEtsfyzAPm/
 DPZnRKl7wUd5qQdXXJGRj3HAyIDteJYGI+gvOw4d+l/5WdiV/mOtlrlYFgeM2wNdwwOq8
 T87cAUuZdi7JLtsv5kEeYJdklTr+q60MD3GuKEtAPQqHmPtXBIhDrnu/Eo1iY+TMsq8+G
 yambs1UH0R1h0lyv8I4CjAEg4v1Uj2IThfSYlqJu4TyT5we1HF5KeD/3XIkt27cH27RYr
 e5YvN3DkLB/yCkiC21e7qHxvgXFMfUoyJ/FM7fldIzimFqGg46ritxS1YXObRO1F9pA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Vj4ODVmYFH7YAPaWEraEr2wsuiLol7X20t/PmtXFXr8=;
 b=pvcp7b8y6ZR6WmKm7qKlD1RIEdmdq6U8A8Lro8TXBi2i0LUDvNUtYTlfkmI/UgpML28l
 PCce3WjZh4Q0iihTPscVQyv2/a5hRo+luXjX9/k1L6a/JFv6Blnx/OZQ/hh5N5UumMMSv
 7GVgVor1HZWpx1iDcIk6iadhv6dsrkv4M17KErK+UK1VYsQpgjws8Em6lJrXUd/jaDomm
 3ksQNNMLN+zBuLeBB6fUGraCqLpqG5FPM5doMs9Pv4mTLS37ix6Vdn3mWOEjsuU8WABKk
 3wJ/slhD0f7w2XZIuddCrVnyE4TmvRcY1qDmtl8tWvDSpCbKQqMQHYyNp1DsV9EYEhw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C80760E8B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B7408875A; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b894d68617e8a780fdd50ae54133b18cc4683cfd
X-Git-Newrev: 19b3c32de0491c0f83497327ab2021a3e750af84
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.7B7408875A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markupsafe: bump to version
 3.0.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/19b3c32de0491c0f83497327ab2021a3e750af84
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-markupsafe/python-markupsafe.hash | 4 ++--
 package/python-markupsafe/python-markupsafe.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index 639a8c10e0..1c10d4f268 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markupsafe/json
-md5  13a73126d25afa72a1ff0daed072f5fe  markupsafe-3.0.3.tar.gz
-sha256  722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698  markupsafe-3.0.3.tar.gz
+md5  7c70b0284d3733795287d8d67e7164e0  markupsafe-3.0.4.tar.gz
+sha256  2e9ad7dd851bf45fab9f75cbff4cb493fee9979e8d8c7c9c3ee119022518edd6  markupsafe-3.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index 7732b9a7e1..4e81938ab9 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKUPSAFE_VERSION = 3.0.3
+PYTHON_MARKUPSAFE_VERSION = 3.0.4
 PYTHON_MARKUPSAFE_SOURCE = markupsafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/7e/99/7690b6d4034fffd95959cbe0c02de8deb3098cc577c67bb6a24fe5d7caa7
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/38/9b/e422a865e1d5d57d0e509b4e0bf1c1a70a7f6382c29a5aa428df994c8bc8
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
