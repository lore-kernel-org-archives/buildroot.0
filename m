Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E1FC982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7991160DA3;
	Fri, 18 Sep 2026 13:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lP2bnWAlVJdo; Fri, 18 Sep 2026 13:07:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6FFE060DD5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736849;
	b=JwE72IQ9t+UDFsX4UUQIJZnYOoLZpwvkkiS+EdcJkllWV4A+eEZ1MmkRK/lGTRNhgmSo
	 wPMVuJ66IfbGFPIoRspynVBUw80QgYjpjZljVkLA0mHmpYnTbyxIPAYTcnT/6lAwZ/oVS
	 JecYCF3OcmRcEXEJddfiF33wX767W96eF+1hvz8MGXMUzYsxcngbaP9wavmFLyZ5nCyby
	 ZJVz/V6lQl0ohNaMn/te4hnoROGTKPEOOWcZ0grTSeMqpQRjkB055zVWKwA57BPm1Dc0M
	 z33ZV+M6E32g9W3US9dRiOom8RNd+T1H64jtFAbjZaXau02tPS+a27qfDkKayq8+RYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736849;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wodokn/EaRIgOe35MfFw2pWxF0z0EBjAkv55W4CfqTo=;
	b=QeswXdO3cVNUXieVUR+WIL+dCb/QSjIyK+24T1nuNuk9Ell6TTxvpePwgAWh2gSjRTZi
	 z8ujzMmV0F2TdY8gnvZIjfDNNsY8Shi3H9k8e51nytonhx7VWQV4t4b3WHmg2Jf0l6CPW
	 bMulDG1icw9ViBkRG+ILpu7/yCWihBIMPYnsfhOPj7zrbVq3Re0jY+wNwgvAUqNuytpPk
	 p4MsOnYvgxGiBl0A31iNirrKGAUYK/R5hqxrE2sygSUXc8WZLKX7Ca+XN8vwLxXwV0cU4
	 ssgWAcJ1jlqb2aTGzMKcPknOchLApXXEnmQPRNABRaAY2cPtkBy/1iQS6FU+EunZmYQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736849;
	bh=Wodokn/EaRIgOe35MfFw2pWxF0z0EBjAkv55W4CfqTo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VHxYgra08f6DITqKgWfbkI6gWaSM9L7qqNaPiQanOoSiD5aJxxEszVU+zkKhsO2sb
	 RyutEHIVCnbvLhJhEfSQL2/KA3hTQVWBg49pxbiGzpZ2KjVcCqFFarkKZ757CIcAgZ
	 Q49W7//orI53vQcmKyV7fNEdfHQzb9h0zkTU+Oq4bIGBNrSa0r/AqsGhkItG+j9igu
	 wxBMvaL4aVKM2BJnxaw0QVYE2dKwupyt01gvPw9rWolvE5SvOTud6MHhkjomt/MObX
	 tyCM7T43HazAMdXZmho+mGJmFd37+a2rGoxzwkCKR1JeVnTaym3W9SawXw+cEo4xzl
	 30EH6+TcvEuPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FFE060DD5;
	Fri, 18 Sep 2026 13:07:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44ED9DC9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3651E8124D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwIPdZAqyUXl for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 928BD81292
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736812;
 b=lRowAkDrGk+XhWQQkHF9+qKFoT67FnoNaK1sVN7FbNlcz4Kg1355jzFBc/EEVBfv5idk
 4i/s9ZA0QgdCRnafiicSZTZoiOGY4Xrt0RGUKckTR9rWk93ze/VSEUocWq2WoBzYAiznl
 Idu0U0B4+ny8vwOdkO4pazZbZfHSKMNgmilIsUOH0jX4kXikIpsaVNihN+JeoVEyx+pOz
 3N8pePpE46uaWH2s4QCxaUkGDkIgSUMIF0KjM+OVF5ajsl6vKIZH+Uo8EfM7pcOp+2Ylr
 1VscOqkpxGNqi7SfvC/Uv+g5R7n9bfRBKE0+9aXqHsEkl0pJj+x5VtXjFp0b2p8BzYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736812;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rI7udFI53QNV0ysu1qFt/JJDzNVIeJ3Usz2lvsOOH0c=;
 b=EOdydQVwKA486kDswr7Ep5v6Y62sZ6FZ0Ho2a6/+6QpCp+CAMXbOZ5K3rYPLAuvMyd7l
 i6FdovkyZ3J2KCESRV2E2DyyfmBkWCXayR8Yrzz6cyh7cX0EuYPlMhYg8duGwcJ2Ro8qF
 2L575nvOCVPN/82hZlxTXQh5cvRcpNVGMELbp6XH4MTjDkxjDh8JP5Y8VistuD88HRvme
 HMRgluAOYwH+uQ8KpJtvnwCBrcTFwu1X3UWsCQkCUASbryYA5dGN5wZ9uWHNrZeABPzu1
 sz2/MpDEvX1iAUV7vZfyA+0OhQ2SoDnIUFOKFuE6+MddOKRfbLXvoXI3JO2PHx40+nQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 928BD81292
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B8B1976A0; Fri, 18 Sep 2026 13:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 12:21:34 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 94830507f8812dfa072f1b2003537bcb9608f549
X-Git-Newrev: 3e0083751f834fc1edb84ff4cbefb2c625c10bfc
X-Patchwork-Hint: ignore
Message-Id: <20260918130545.4B8B1976A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/webkit: fix
 kernel headers dependency due to seccomp select
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e0083751f834fc1edb84ff4cbefb2c625c10bfc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

In commit
0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to
version 2.5.3"), the kernel headers dependency of seccomp was bumped
from 3.12 to 3.17, but BR2_PACKAGE_WEBKITGTK_SANDBOX, which is a
reverse dependency of BR2_PACKAGE_LIBSECCOMP was forgotten.

This commit fixes this inconsistency.

Fixes: 0e2c958e053fae6e33bc7ca230ac4326a6ac5aaa ("package/libseccomp: bump to version 2.5.3")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ef92929504e842a1798128988eeb4d959a1a8931)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/webkitgtk/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 3a4c3ed792..cfb05fd0d3 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -87,7 +87,7 @@ config BR2_PACKAGE_WEBKITGTK_WAYLAND
 config BR2_PACKAGE_WEBKITGTK_SANDBOX
 	bool "sandboxing support"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
 	select BR2_PACKAGE_BUBBLEWRAP # runtime
 	select BR2_PACKAGE_XDG_DBUS_PROXY # runtime
 	select BR2_PACKAGE_LIBSECCOMP
@@ -95,9 +95,9 @@ config BR2_PACKAGE_WEBKITGTK_SANDBOX
 	  Enable sandboxing of the processes used for network operation,
 	  disk access, and Web content rendering.
 
-comment "sandboxing support needs a toolchain w/ headers >= 3.12"
+comment "sandboxing support needs a toolchain w/ headers >= 3.17"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 config BR2_PACKAGE_WEBKITGTK_HTTPS
 	bool "HTTPS support"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
