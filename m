Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259D0C7619A
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 19:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 977FE402F8;
	Tue, 11 Apr 2023 19:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 977FE402F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnbceZ7UPyxN; Tue, 11 Apr 2023 19:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BCCE40304;
	Tue, 11 Apr 2023 19:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BCCE40304
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93E4D1C3AFA
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 19:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D31961486
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 19:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D31961486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbhZXnN_C3sE for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 19:43:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EA44613F7
 for <buildroot@uclibc.org>; Tue, 11 Apr 2023 19:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA44613F7
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 8D98383FDD; Tue, 11 Apr 2023 19:43:30 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 11 Apr 2023 19:43:30 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-15531-163-vlrVtQpakz@https.bugs.busybox.net/>
In-Reply-To: <bug-15531-163@https.bugs.busybox.net/>
References: <bug-15531-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15531] shim doesn't provide hooks for signing
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15531

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998@free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Jonathan, All,

> Shim is supposed to provide a signed UEFI bootloader for secureboot.
> However, it is intended to be supplied with a key at build time (make
> VENDOR_CERT_FILE=<path.to.cer>).  Perhaps a menu option could be added
> to Config.in allowing the user to specify a certificate location.

As far as I understand it, this is two-fold:

1. shim can check the signature of the files it loads; this is what
    VENDOR_CERT_FILE is for, and

2. shim can be signed, so that the EFI bootrom can verify shim against
    known keys; this is what ENABLE_SHIM_CERT, if set, is for.

However, it is very possible to build a shim that is signed but does
not verify the signatures of what it loads, or the other way around.

So, we'd need two options:

1. BR2_TARGET_SHIM_CERT_FILE, the path to a .cer file, to set in
    VENDOR_CERT_FILE; if BR2_TARGET_SHIM_CERT_FILE, the generated shim
    will not check signatures of what it loads

2. BR2_TARGET_SHIM_SIGNED, a boolean to drive whether shim is signed,
    in which case the *.efi.signed should be installed, along with
    shim.key (so it can be enrolled into the UEFI bootloader?)

It looks like they are independent each from the other, and so can be
done in any order, and it is OK if you only send a patch for the one
you need (you'll send a patch, won't you? ;-) )

For 2, I am not sure if one can provide their own shim.key and shim.crt,
but looking at the Makefile, it looks like it should be possible (one
does not want to enroll a new key for each build!).

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
