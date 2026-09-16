Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87777C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E28460E57;
	Fri, 18 Sep 2026 13:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5UZ1AJ-WM3H; Fri, 18 Sep 2026 13:07:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 13D0860DE8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736835;
	b=NFGz7Z97FwYV+yu3S99AWm0jVhLfeG7n6KEfSWGQ6dinIk4pZrCBojAL5oeHgsMtRRGc
	 ajtxMacDrAu5x88BmtHG1sPiQWdMS2hqcJfBoLlJGXdmjrpAKEuDFQKKy6hXZEQ0J3Vj+
	 DFJo/VBthsrZpwEG7b3o/LtODEBWn9xC/gS2RmPJ5XiiyXplK2g8bSXTSpb9y7U30Jkpc
	 yuNJkoyI+Ea1bLfhA0Avu1y5Ez+VOAhSMy3Xi5Rm7zvyXOBDiMD0XPGzWTmpevX/rZ5ww
	 eaMe1jsQZwH/gpF684Xi4Cv+LfZUAIyuYfe5q+SIOk0ctllpcyGJDCdgGv7yS5+E0RQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736835;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=M0sElm93HAKTbZUc50i6ChWkoh4UzE9mrHPJtt+/93s=;
	b=aCx/+0W9h7ouiUvAuD2kjbAbHmEkjktCk5lEFVJ3v8htgyJF7u/OXMykQvThIkuBl1NH
	 w16cw4FdDNciICaoNp6yqXxlZGqlZeoQ+Cxwxe1f1pAv3NYnf0qza4TvRC3ps7wl/jzFF
	 r2wOPCyGRDK3XeKdFAxFCOj/iOGcsFcRfINSWYsrnFnI2Mutis0P4YpTtXMNWli7uXlUy
	 qY3B42Wxf+lyA9PYDfd0Jb+gxjrcBsYiegbAR42d9+CgNZz8LMmhoG8ViKS5ZEZClh6RH
	 CJrLBJLlAs6tMGijbUJBPsHIbLPmZept3QIvFDo/4rMek7/UKmhh8HWTvOkxW9PoX5A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736835;
	bh=M0sElm93HAKTbZUc50i6ChWkoh4UzE9mrHPJtt+/93s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y07PccO/al1t/33gR4Ir0yYbHqaStPXgo2ns4Yv1/bE1MN7ZKz/8cgiiPriz5Ut1Y
	 qQAz6K1tnRbC+1TdRDxRgbNSGpYxkuJo0xbjNAjIK6vRKuYUF+JtT4vR6IIIIzmPBw
	 L3YVPvsLCcPlwtUhhn4f1LOQ9adJEEn1uJnDY/CsLkanPjuPZMfwF7jyN2kEbyYowQ
	 sRzXmzzn6Yt4VoSphDfbCJiioifIFG9zyTGqbG1aWm7JjfAZeuzS9RczRv0v4X23VZ
	 ZuYasmJ9ihW3jz+R4LC3CrjOcu9k6fEstkt+bRFdxIJuRXUpcfHxPQV/Ys1IfSGRlH
	 nXp6auhMqKbHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13D0860DE8;
	Fri, 18 Sep 2026 13:07:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED69842D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFC0960DF9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gVJJVfl0gDT for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E20AB60E1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736811;
 b=rAH8O5Ue71Ujpdll2Eh9JXfSgAAihCvEdbTOZLOKd4khdaNlLqntNqpIPs+nfIMYro/H
 hgsJ/bxcX3wa94yaGaLNAVTcqMSjWg1QLF2PGoY+ERiKqmViy9Y8ABOscaOxcpvjmXDPy
 KC/+SnBDz5ckLv8znxQGTKSVSzBQV6s9ENRS3amm48LHavkHICNMY8qqxwVqoLkD8SJRZ
 M1FOEjOwtZLuH7NyZg2hwiHYkPkkbkEb1KRGj5evLo7wdfkH3ZtlEMFK5sL7/axux6ag3
 70bLMPFw+pjjnM32oKK44LedaPTU7z/eSkOyFBmayzO9UQoMspqrqr0/9TLpAa/MyEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736811;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eex1Mi6CoDbmBLIK4EA0p71ivE0jUY1q19e5UEboI7Q=;
 b=QBi01wuTwms7ob0wBqiYRKtFqIbcYer/A0zGEVjAOYcfG3Btx+O+uDJ4JxXATTuynC8Y
 PcCfGPpfQ5mEB/CbVwLzjJiLX9G21FfayFLwtQHFYp1+VcnbL9v3gYx87wDjpBc9M9JWq
 f3OY4xuSLQvIy3ZD49UhQFaUUXG+hDzJeVu9SgCjT3Skk/MHOuAnMl/moXlRQutsP+/Fe
 cDbeggTufLnEkWHAAgqDsaYGeIcGcbd0a0C0O9zE3OGIscZ3qjb9HUNGQxwI6JgffTJHu
 H4rsVK8pQeIZaUjZskuusG8FzKk/SielU096BS3pI30RY7hThfu/qvYBIXnhLadPhgg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E20AB60E1A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AF1A97696; Fri, 18 Sep 2026 13:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 11:56:03 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f9517379d1ab5832350ad0458af2428491e1eb23
X-Git-Newrev: cbc3a7044af98ecd82e0cf06dbb86632a7e231b1
X-Patchwork-Hint: ignore
Message-Id: <20260918130544.9AF1A97696@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/tpm2-tools:
 security bump version to 5.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cbc3a7044af98ecd82e0cf06dbb86632a7e231b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/tpm2-software/tpm2-tools/blob/5.8/docs/CHANGELOG.md

Fixes: GHSA-v7w4-4gc9-qcgv, GHSA-gwfg-w3jr-xh66 & GHSA-qp88-8f4j-wv7q.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 17be3c2dcd33a57e1a606416146e1f110c09bba2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tpm2-tools/tpm2-tools.hash | 3 ++-
 package/tpm2-tools/tpm2-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index cb7e8085d6..a2ce45205e 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,4 @@
+# From https://github.com/tpm2-software/tpm2-tools/releases/tag/5.8
+sha256  1cb73185cae814b4e15c7c2d0b22642d640faf48775f4156a1fd92edf84bef73  tpm2-tools-5.8.tar.gz
 # Locally computed:
-sha256  3810d36b5079256f4f2f7ce552e22213d43b1031c131538df8a2dbc3c570983a  tpm2-tools-5.7.tar.gz
 sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  docs/LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index cdb8931a3c..72b0dbf8c5 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 5.7
+TPM2_TOOLS_VERSION = 5.8
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = docs/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
