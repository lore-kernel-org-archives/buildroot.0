Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AED5C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA8394066E;
	Fri, 28 Feb 2025 17:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nb6vgZyESYJi; Fri, 28 Feb 2025 17:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B7B40595
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B7B40595;
	Fri, 28 Feb 2025 17:01:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1791C68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 042B242E52
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmDkHE5IAmLp for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E36694199A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E36694199A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE55184109; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Jan 2025 13:04:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a311245ff7cf432de861ff095941ef53fc16460d
X-Git-Newrev: d4fa17f44128929970632e6703a49bc40eb0492f
X-Patchwork-Hint: ignore
Message-Id: <20250228163015.DE55184109@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnu-efi: fix build due
 to short-wchar
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
Content-Type: multipart/mixed; boundary="===============0610195647176390915=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0610195647176390915==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d4fa17f44128929970632e6703a49bc40eb0492f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
---
 .../gnu-efi/0002-Make-CHAR16-use-uint16_t.patch    |  164 ++
 package/gnu-efi/0003-Use-char16_t-literals.patch   | 2103 ++++++++++++++++++++
 2 files changed, 2267 insertions(+)

Patch is too large, so refusing to show it

--===============0610195647176390915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0610195647176390915==--
