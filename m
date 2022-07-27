Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA610C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DB01404B2;
	Wed, 27 Jul 2022 10:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DB01404B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WiZs8moZSJwR; Wed, 27 Jul 2022 10:48:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D29A40260;
	Wed, 27 Jul 2022 10:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D29A40260
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00B421BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A806B40260
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A806B40260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLIGAJ_y3hfk for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:47:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A935E40105
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A935E40105
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:47:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 312411BF203;
 Wed, 27 Jul 2022 10:47:54 +0000 (UTC)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>
Date: Wed, 27 Jul 2022 12:47:51 +0200
Message-Id: <20220727104751.2505442-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658918874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vCoKRwdrCyGzIDDWTWYTdkVYKODouHc/I69qR6MdzRY=;
 b=IEnBtjlNfHxoMZQkFyhSzp6dKxD8hTi4cyRrbI9mpsJSOPAVIDX/BEsd1L60rwFYaCS7GP
 gcYp97a6ZXNcb7TZKT7jr1/1sUzWpMJh9gWSGuj7RhUuwa0arancLSNR+CQiy+4u5lndgz
 1FIHaxdqA1krMjMyEic0DTi3IuyxFmFqqLo18GDhIih8W9wmfdAfIEwbzzjBzmiNVRxXZT
 BJLiMq2T4guUCf+WxcHro/vsNHuB7OZ+SsXZsXgVhM+T7y4Vrt/2Nv5+W63Qj8jX7qZQCF
 t3FYgO2shLWaS0D4GQH/7v+Rlub/58Gyuifu7TKbu+eCikRgIjdeJ8lA+9H50A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IEnBtjlN
Subject: [Buildroot] [PATCH] support/scripts/check-host-rpath: send readelf
 error output to oblivion
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Somewhere between binutils 2.35 and 2.37, some functionality was
added in readelf to parse more DWARF information. Unfortunately, as
reported in binutils bug
28981 ("https://sourceware.org/bugzilla/show_bug.cgi?id=28981"), this
feature causes a number of fairly scary warnings to be displayed when
running readelf on binaries built with Clang, such as the pre-built
rustc and rustdoc binaries part of the host-rust-bin package. It
looks like this:

readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Bogus end-of-siblings marker detected at offset 2f in .debug_info section
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Bogus end-of-siblings marker detected at offset 10b in .debug_info section
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Bogus end-of-siblings marker detected at offset 10c in .debug_info section
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Further warnings about bogus end-of-sibling markers suppressed
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: DIE at offset 0x1da refers to abbreviation number 5827 which does not exist

These warnings are caused by the readelf calls done by the
support/scripts/check-host-rpath script. The annoying thing is that
once host-rust-bin has been installed in $(HOST_DIR), this warning
appears after the installation of every single host package, because
support/scripts/check-host-rpath rescans all binaries every time.

To avoid showing those scary warnings, this commit sends the error
output of readelf to /dev/null.

Of course, it would be nicer to only filter out those warnings, but
filtering the error output without merging the error output into the
standard output is tricky, so let's keep things simple. If there is
really an error, readelf will abort.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/check-host-rpath | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index b27cb883f3..f36677cc96 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -61,7 +61,7 @@ elf_needs_rpath() {
 
     while read lib; do
         [ -e "${hostdir}/lib/${lib}" ] && return 0
-    done < <( readelf -d "${file}"                                         \
+    done < <( readelf -d "${file}" 2>/dev/null                             \
               |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
                      -e 's//\1/;'                                          \
             )
@@ -100,7 +100,7 @@ check_elf_has_rpath() {
 	    # false.
             [[ ${dir} =~ "${perpackagedir}/"[^/]+/host/lib ]] && return 0
         done
-    done < <( readelf -d "${file}"                                              \
+    done < <( readelf -d "${file}" 2>/dev/null                                  \
               |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
                       -e 's//\3/;'                                              \
             )
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
