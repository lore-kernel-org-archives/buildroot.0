Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96221C0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 18:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0C024265F;
	Fri, 31 Jan 2025 18:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhOEwRD9vMhH; Fri, 31 Jan 2025 18:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A40FF42665
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A40FF42665;
	Fri, 31 Jan 2025 18:39:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49AAF16E
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38F1F83FC3
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2YBu0jOPUcP for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 18:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12EE983653
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12EE983653
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:38:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1A5C866E2; Fri, 31 Jan 2025 18:38:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 Jan 2025 17:21:44 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 97aa1f9a9b913b78168dff7320cb7d7a49af6911
X-Git-Newrev: 279673a33780296a72ade3655ae9e07af8cf8c78
X-Patchwork-Hint: ignore
Message-Id: <20250131183856.F1A5C866E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/gnu-efi: fix
 build due to short-wchar
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2679582780667378990=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2679582780667378990==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=279673a33780296a72ade3655ae9e07af8cf8c78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

The gnu-efi code base is so far built with -fshort-wchar:

‘-fshort-wchar’
     Override the underlying type for ‘wchar_t’ to be ‘short unsigned
     int’ instead of the default for the target.  This option is useful
     for building programs to run under WINE.

     *Warning:* the ‘-fshort-wchar’ switch causes GCC to generate code
     that is not binary compatible with code generated without that
     switch.  Use it to conform to a non-default application binary
     interface.

However, this is highly incompatible with the definitions of wchar_t
by musl, causing build issues:

/workdir/instance-0/output-1/build/gnu-efi-3.0.18//lib/console.c:84:68: error: passing argument 2 of 'ConOut->OutputString' from incompatible pointer type [-Werror=incompatible-pointer-types]
[...]
/workdir/instance-0/output-1/build/gnu-efi-3.0.18//lib/console.c:84:68: note: expected 'CHAR16 *' {aka 'int *'} but argument is of type 'short unsigned int *'

These have been addressed upstream by simply not using -fshort-wchar
anymore, so we backport the relevant patches.

The patch 0003-Use-char16_t-literals.patch was directly backported, it
was "redone" (it's a very mechanical patch) as backporting the patch
and fixing the conflicts was more effort than redoing the patch from
scratch. But in essence, it is the same patch as what is upstream.

Fixes:

  http://autobuild.buildroot.net/results/8b2f5b38284e70dde8c5619e5050e7f201a0bcc3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: fix patch 0003 EOL modified by the mailing list]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d4fa17f44128929970632e6703a49bc40eb0492f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gnu-efi/0002-Make-CHAR16-use-uint16_t.patch    |  164 ++
 package/gnu-efi/0003-Use-char16_t-literals.patch   | 2103 ++++++++++++++++++++
 2 files changed, 2267 insertions(+)

Patch is too large, so refusing to show it

--===============2679582780667378990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2679582780667378990==--
