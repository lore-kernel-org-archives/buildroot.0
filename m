Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DD8CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A74A160E1C;
	Sat,  3 Oct 2026 17:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmVZojmhBtZ3; Sat,  3 Oct 2026 17:36:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A1005606D9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791048960;
	b=X7QDFpNvJTv4nqQRtD6+YAzSOiwP7mAEIlnXWH9XEmFI4znLJm1/7+i3PrnO+OK4mmkO
	 T/XITi3GlpymJz2oDDxYFFbtU/wPVyP5xGO+RXZ+i9z1Eod6/hOmdAX7+qrZ2LWfW2yoL
	 Gkb58zEASiXIxrS9sc7v1Qf4p8WxT8CP9b3FnRKRqD9ItIpk0GcrC6fgjlKglmbcbSkNa
	 7rVIps748ljAl9i5wT1HJBaWw19uffxdAecVWGmJDd4tqIwyM1kFYOmkHlD8wbw4Cyvpk
	 dmL531eE+gWPL3m3zG8pTNVNwAmRapKQXPV0iUmFdD5IVAhRcDjOvxrbFOV6XkFkBEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791048960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mu5trnJ6b2dssDHqEKbSKpTgX9F40bFbN9aW+2vTlPg=;
	b=aWo+Yx1o2Pt/8YwR36i0tp9XWn2Omtp7NUMsXpjr837PRyswO8WKvMvekAfetissgihH
	 kx4lOwxkKxpFij1sWRnNrTgbqcJub7jymQ1n3J8zsC+h/RhgHbTGPGsuWmsXPuAb8b6Lr
	 +IhHoK7QOw8PV8ZmT5M/Q/1up9Jl6waE7kVhvuvMaFyA1l8SddFuRqNVW28ixnaSGj3QM
	 dt+9SYGigaP/Th+zgK7XQ12Bxr9MhzWSY8owYTt8/7u/VIq5y3yonRNTuPMlq3VF2DGZX
	 M5t796TP/MBRNHX3uacsAsRyx9kk9Q5NyJN1D6bw98NVWbhNhssxJBzEtppI8jgz92g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791048960;
	bh=mu5trnJ6b2dssDHqEKbSKpTgX9F40bFbN9aW+2vTlPg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oGglViRJr9mitDQX75JIZPza0+XZr5JlkDTrZbg1q/aywTcUrbpMNS6kAMvUYltJE
	 cqWcMEtHpk7K3bheQnOODqdDYYgOshStLWVzUtpUVQNhT4kyNOX+p+bk4Efi6nVfsy
	 MQeZUo1haUHOJ8aDn8pAvy09n6/z68n3sMxnvZWcjrg1RLALFIzgautLQoULOGj02g
	 OrAr2kXN662ym3w6Ayesyo/sLremXqIsPcg1NVshrZzkiC2UykjKgtWZ6U1+QYnCPk
	 KZHSSYJzM2L4LAzo5jCElQQuR3itcPn1m1b1MBC7oDhYLJUw4+MDrQSyynWn5VQ+GB
	 JsQ4V18Y9cbaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1005606D9;
	Sat,  3 Oct 2026 17:36:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED68A1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3E3960629
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mSgCq2r2n8k for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:35:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 35AA660623
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791048957;
 b=gMEF8AL5yTaJ72oajxELlBIT8hRWTZD2nokvVpUb1hOfBbtSng5lN1GpthFawGe0fsFU
 vOcM0h6lh8ZGlIXZRXT+vVtF/oSND1CMNSIUh2ex5Zv9d0VRMXcIfUTNh8iA2JBUEYoy3
 9HZ0gl//7wjjtUivcNBPP0s4/GSVSdLr2AI6tsJDsJIRrkGc94zLC2JeghJ1zxRhHpPUg
 EKQhgfSDVMoT7qGJjMpANuBZQxVZXJTzgwEBHg3Bexonn/0bcYTDQ3dsBe5eSyiVZiCqH
 bhA+vs50dBtwDxuEqQbOF7vjmVF2t2Rl3zliXpajxKoo9ej7qOaWQ7f+CMMPFzFhbnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791048957;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SXeiBNYdvUmp5ejIkoPJnekAXUFzOFMRwP7YEBLyyBM=;
 b=OMT1TEJXFCt2oKf6IkBFlW7JxKbEafKJk5qbSYo713V9xZYKtM4QZe+yZ3225DwLmt3E
 rmU3XZGPLTFcjS4HMCySn3Yy+0hqYqkhlIeOdKCKd4MfKJA9ZxKWjSoiXjrOn7RIz9rg4
 3kq7AH5eR3IteaUwE7kX1pNA++iUoq+TAM8lrphZBws7ctdqvspkjvpt5blUUxTLYqA8x
 iA1ya165tthQj6vyGdUdnARbAzeKmizxLQI21jBhOcmFLASrar0mUx1sfZSsMjj3ySsXC
 j8PRlOiXFbE/6GcGEByGbsKmkK5zcLJPtLqWfdVy6rBpoCxRDnMb859VZmsWxI7rYgQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35AA660623
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:35:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FF2C8B530; Sat,  3 Oct 2026 17:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 19:35:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e493982138e1ad726dd07e2832d40a8bdfbb59d1
X-Git-Newrev: 6d9b83964763baa14169e625a5d8022f0621061e
X-Patchwork-Hint: ignore
Message-Id: <20261003173442.5FF2C8B530@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acpica: bump to version 20260930
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d9b83964763baa14169e625a5d8022f0621061e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log since 2025121, see [1] and [2].

The Github project URL [3] now redirects to [4]. The CONTRIBUTE.md
file was added in commit [5] which mention this new URL. This
commit updates ACPICA_SITE accordingly.

Upstream commit [6] (included in this 20260930 release) added
actual license files. In previous versions, Buildroot was using
the source/include/acpi.h header files which was including license
terms. This commit updates ACPICA_LICENSE_FILES to use those new
license files. Note: the license terms are not changed, so
ACPICA_LICENSE is not updated.

[1] https://github.com/open-acpica/acpica/releases/tag/20260930
[2] https://github.com/open-acpica/acpica/releases/tag/20260408
[3] https://github.com/acpica/acpica
[4] https://github.com/open-acpica/acpica
[5] https://github.com/open-acpica/acpica/commit/0d90f9616ade4a70acd050c0b52aba1cbea71923
[6] https://github.com/open-acpica/acpica/commit/58b9cab48f3f00d8f31da9f315d00f97645ad549

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpica/acpica.hash | 5 +++--
 package/acpica/acpica.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 75a3fcbd90..768e7b194d 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,4 @@
 # locally computed hash
-sha256  486423245f8154dd0bb5ada9ae057d670210dcbbc4386e62aeccdf5bfdad5f19  acpica-unix-20251212.tar.gz
-sha256  dbfa87ff77586ffd8da1185981a9695e80db09b114b3b00c194a9bcc2292a95e  source/include/acpi.h
+sha256  aa18901b92e30749be0edc3081c8d550c61fce4fa37546fc6a65d367a4ae71a5  acpica-unix-20260930.tar.gz
+sha256  dcf670273dd9dc86a59d0f493d26034ac58a20860658fe3f8f49ddf687b01ba2  LICENSE.BSD-3-Clause
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  LICENSE.GPL-2.0-only
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index cab0693ef5..c7346ec58a 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20251212
+ACPICA_VERSION = 20260930
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://github.com/acpica/acpica/releases/download/$(ACPICA_VERSION)
+ACPICA_SITE = https://github.com/open-acpica/acpica/releases/download/$(ACPICA_VERSION)
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
-ACPICA_LICENSE_FILES = source/include/acpi.h
+ACPICA_LICENSE_FILES = LICENSE.BSD-3-Clause LICENSE.GPL-2.0-only
 ACPICA_DEPENDENCIES = host-bison host-flex
 HOST_ACPICA_DEPENDENCIES = host-bison host-flex
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
