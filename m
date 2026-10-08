Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC45CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6338E6067C;
	Sat, 10 Oct 2026 09:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJGgdqbPx-YE; Sat, 10 Oct 2026 09:21:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BFE1E608DE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624118;
	b=KyLfLaCegyMOQEy7Fh7bmXqxOysEiz08Aqrtkq6xPKJ96d6PPOlXaJHNEIIfMKToCl7O
	 mVkG1j9bpGxDwN5hprOyPtYmz6fAOI6pIqGxmaHnQdkGPaH07udDJi1xu6MAYAjbDfE7w
	 wTOvzw6q5cpKlSX5HWupr+duZXwMwnYWpUS/OpM1IoIAe/XxFrswngX8zno+KwGl5fAg1
	 ObYyf6xaQ/uZeExzEmA+f08LWR3Ew66roR4K16BlIgRIJOZc4shhaKt5yhPT4uymVXSb+
	 i8M4E3xB1bUafAO1J+Dppf8mf/fqiyhBD/+cY71+TEPhB2krHyrhjpoybNXO4eUh01A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624118;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=QgdO66eFxIkYdLJA2fT7gqYVgWyB2GRCWpFowbiafm0=;
	b=BWlxLx7eBxGAa2Hj+6FMYfzADPaHVerJrgWrGsvLSUW7j3+f5QyepCuy/r8zZfa+GLAz
	 ZMg8JFScwP52pyNmJilSyWaqxo6x9ai0E2xjP5i70jZwd+qRX/h3nPAGy2v8T3eSz3Hd1
	 7y/VFwa+GSUgw+cHXnI29H3pBYpxzoWDfZSnOb5RnNhRkOiiTGREgl/a/FBJAseJ3VX+t
	 /EjQfWcwxX/I0xEIp+5kPYIhGa/Ec+wFtuRQfjy4RHQFk5CkpmR6a+/Cq9sIpBfFxpBWj
	 62rSg/nGksIyM3pBne8iRDQaOTVMjAgjy+1paxgDDoNaVkYHFwK2ROvdBKJodbN+Zkg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624118;
	bh=QgdO66eFxIkYdLJA2fT7gqYVgWyB2GRCWpFowbiafm0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fnjfrq1dInX5FMACxft6Qhdddv3dGrjXhqCKrUoci4ynsVfGx+Ytbm41mQfSGeNcP
	 GvW7Yqm+ew1KYYgtvqTQBdtmsdG2w4tilFgwdOi357LDBYBe2vY+ewr7St1u7g7OJP
	 G+nBcnrqCrpLpBJYTl6GrojxsgX82HFscBtVcFs9HIBr8OmfQl0VNUK3kGH3Kv06Iv
	 T4bQACA45rVqRN7m3Uw0UHl4iq5DJtV/XX6VudGzGJWMGtxvq85zzcYWwNq8wbGXrF
	 oMUEUIoTQq9GkY0YV7VGsCuBiXOMOPo9y4wXD0EDRyDGZmLw7nkxjBghLZX2e+Gvk3
	 DYlZeeau76GEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFE1E608DE;
	Sat, 10 Oct 2026 09:21:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6402FA64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D15608B4
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsbDHk--9y5h for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 697746066C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=nrIAdqWWuFqqxirMBV6ujl7thviXY2lKBHY53MU0rh+OUCEztMyTkoxGHZ5NqFZLpvRM
 +kiDKoLak5iRxPbpuJtWUU7ECd7UDK0j8N37hpzVMWWfkSvedJKJkw06PFmrwkpTwkMJ6
 H8oQXyaijFvu9nL/TFIcCFXImV/tDJ0nM1KzU9BWN8ahBhOvYe+QqQ06yt8ex+cBt75Yh
 4xodQtXWEqNAH92wZYNkjmG3rp7RCaiDwfPWrSswnyZ+t0CGk5h2sM0lZeCvh7LKXlxF0
 ht1qWve70jjBl6fSpFL7RYD4EIYpdpCaLjSQ09nXxhJ2qPafWNaaa4KdmQG40zxXNxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hGmAsHSEMUpAKHjpAsBHkRZJbaOLLVK2AbZTqyXT08o=;
 b=MlImaemR32Gv9j5iV1NUkiboF+VsarM8SfQJqSEjOvvUw/N1rXvvg4WYz1wPqNlxpcr9
 xzRmR9jUCX7lrFmtwjxF9vmaOTTgNlWIMtHe1bQeFXtjAJCVoMTZrCeXZd4REFfSZCmfe
 g6RFqQS0XRxOORlDxTZWWJc1zB62marTUOdOvkzlzYN/ZokV/peHFfbZpOa4QNb1XwzkU
 saR3i9fz+jo5rKmhvld6IGmCBqvwq+3TiZcOGlmraxxSfDOanZSha3aoT9MGbqYltzr/c
 6oDk9ude6O/zuiEpDII66i5Nc6IWCujvdQmSnsqRAsmacsjKf6cu8bYAhDA8K3b8TNw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 697746066C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53E1E8F065; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:26:20 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 6d271094e808ab66f1222845896b63aa2111038d
X-Git-Newrev: 0679bed2f647a89a747125c98a0af9ba599fdcf4
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.53E1E8F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/gnu-efi: fix
 license information
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2246025644560909990=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2246025644560909990==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0679bed2f647a89a747125c98a0af9ba599fdcf4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Split the confusing "and/or" for gnulib, so dual-licensed and GPL-only
parts are clearly noted, and add the missing LGPL license. Lines in
GNU_EFI_LICENSE are ordered the same way as the information is given
in the LICENSE file.

The license situation of inc/subst/elf.h is curious: The file itself
is licensed under LGPL-2.1-or-later, and used in gnu-efi under
LGPL-3.0-or-later (accompanied by the appropriate license files),
which in turn allows using it for object code under different terms
with certain conditions (see section 3 of LGPL 3.0, as noted in the
gnu-efi LICENSE file).

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7ed738bf5d3cb7a3184a2c4e4ac61258fbe6d012)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gnu-efi/gnu-efi.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index f615df91bc..f979b65c31 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -9,8 +9,10 @@ GNU_EFI_SITE = $(call github,ncroxon,gnu-efi,$(GNU_EFI_VERSION))
 GNU_EFI_INSTALL_STAGING = YES
 
 GNU_EFI_LICENSE = \
-	BSD-3-Clause and/or GPL-2.0+ (gnuefi), \
+	BSD-3-Clause or GPL-2.0+ (gnuefi), \
 	BSD-3-Clause (efilib), \
+	LGPL-3.0-or-later (inc/subst/elf.h), \
+	GPL-2.0+ (tests, some IDE & CI files), \
 	BSD-2-Clause-Patent (EDK2 routines)
 GNU_EFI_LICENSE_FILES = \
 	LICENSE \

--===============2246025644560909990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2246025644560909990==--
