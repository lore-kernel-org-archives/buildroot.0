Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56079ECAAD5
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 05:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A288B8144E;
	Tue, 30 Aug 2022 05:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A288B8144E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PrjyYHT1impV; Tue, 30 Aug 2022 05:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D15D181435;
	Tue, 30 Aug 2022 05:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D15D181435
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0C91BF328
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 05:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC7AD40913
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 05:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC7AD40913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DiVC0cWbtWqR for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 05:25:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00121408F0
 for <buildroot@uclibc.org>; Tue, 30 Aug 2022 05:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00121408F0
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 3DA7087F4D; Tue, 30 Aug 2022 05:10:07 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 30 Aug 2022 05:25:09 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lars.george@biotronik.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14976-163-cVrte0Y80t@https.bugs.busybox.net/>
In-Reply-To: <bug-14976-163@https.bugs.busybox.net/>
References: <bug-14976-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14976] Ghostscript package can not process pdf
 files anymore
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

https://bugs.busybox.net/show_bug.cgi?id=14976

--- Comment #1 from Lars <lars.george@biotronik.com> ---
I digged into the problem a little bit and got a fix for myself. First of all I
patched the mk file of the Ghostscript package:

 define GHOSTSCRIPT_REMOVE_LIBS
        rm -rf $(@D)/freetype $(@D)/ijs $(@D)/jbig2dec $(@D)/jpeg \
-               $(@D)/lcms2mt $(@D)/libpng $(@D)/openjpeg $(@D)/tiff \
+               $(@D)/lcms2mt $(@D)/libpng $(@D)/tiff \
                $(@D)/zlib
 endef
 GHOSTSCRIPT_POST_PATCH_HOOKS += GHOSTSCRIPT_REMOVE_LIBS
@@ -43,7 +43,7 @@
        --enable-freetype \
        --disable-gtk \
        --without-libpaper \
-       --without-pdf \
+       --with-pdf \
        --with-system-libtiff

 ifeq ($(BR2_PACKAGE_JBIG2DEC),y)


Furthermore I do need to have the following BR packages:
- BR2_PACKAGE_JBIG2DEC
- BR2_PACKAGE_OPENJPEG

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
