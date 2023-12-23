Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D75C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E29DE82232;
	Sat, 23 Dec 2023 21:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E29DE82232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ldhcEonxhdm1; Sat, 23 Dec 2023 21:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E329982226;
	Sat, 23 Dec 2023 21:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E329982226
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 968F91BF406
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AF5A40395
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AF5A40395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qafCiZQ2FXHQ for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 21:38:12 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA4FB4010F
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 21:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA4FB4010F
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d53297996so3149595e9.2
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 13:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703367490; x=1703972290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SG9a6J2GyYMkYvEU0J5uTmYB4QKKD1Z7ALdRc0bWhPY=;
 b=q3+xlD9azdY4mv1LQbXBA4VhmQ/kkpLQE1B/UHdG3rjLnR3kqnVYvgaAHJ9Hjrm5zs
 XO4zkwTRMnJrpXXBTc3FWEnp9MZDBCbbzuVUJbgujsbKqcss3mqhI7lFrXWdL6ihYweS
 rdsAu1j0RbTIV0NfJ/QRDjYj9FVSaQRNfiQD9J980Rw4WX7DpZgQFr5eKXWbeMmZSg/n
 TN9SbChYgLjOF0kA1eOnyViaKw7dPOIWJtjaVC5K2qUq2eJf1SNWl0/U2nPrP416LjL0
 vSFtxt7eN6blKZ7dXpz2VFSf1UghzpH3pTgILd74cFmSrRFomZsZKMZNN5wGK2ZbVCSs
 ZNbQ==
X-Gm-Message-State: AOJu0Yx9ZPjNVdoyGN815iW2yw9ETu9kEV9Ov4RmRqkNFW6T+iGqNWcF
 +6QI9h3S/oeGmB8XtYA1661ERvrsFfM=
X-Google-Smtp-Source: AGHT+IHVzXnD0GEDUbAP/PydEvGtz3q+wkhIrSNftt5L275WDreKDnZd5ruemX2mU9pOLDroKzV3rw==
X-Received: by 2002:a05:600c:4fcb:b0:40a:3750:46ff with SMTP id
 o11-20020a05600c4fcb00b0040a375046ffmr1924063wmq.11.1703367489359; 
 Sat, 23 Dec 2023 13:38:09 -0800 (PST)
Received: from localhost.localdomain
 ([2a01:cb19:8290:3800:4f89:5708:1633:580e])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a5d558e000000b00336471bc7ffsm7143018wrv.109.2023.12.23.13.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Dec 2023 13:38:09 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 22:38:00 +0100
Message-ID: <20231223213800.348426-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703367490; x=1703972290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=SG9a6J2GyYMkYvEU0J5uTmYB4QKKD1Z7ALdRc0bWhPY=;
 b=ZmUbX1InJiJz0pgrI3f93IRWoWzEamA9FdWjgoXXKtF7NzHhkPb3E8JymiYp5x/toj
 hzilSCp1Ch4uLtt0y9GQVELQrU53fYursHXNt6CPZtV5UTF8b9KjCIDSBfwSV5VC6HT9
 JDop6khUDzNREErRzGhC4lEeadGTEIrfccAsehTrOfBmFVuaYGfGHmoBQy4X8ambYG1o
 BwzCl2QDyrYMcbHs1ELXoGk4lkbXjIDDE64frvHd3xr1oXlhOfjwWsyaTpWtcggnnOvm
 hL2URInmLynMMpxqFpxixc6q0xTWkzVBrOgmkS0K1UtxPXwoFu+gi6FLeXzpygqFmOwj
 1wWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZmUbX1In
Subject: [Buildroot] [PATCH] boot/syslinux: carry fix for build failures
 with binutils 2.31+
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
Cc: Meliodas <meliodasren01@gmail.com>, Sam Lancia <sam@gpsm.co.uk>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From a report on the syslinux mailing list [0]:

    The GNU linker now writes two segments of type PT_LOAD into the
    program header. However, this is not supported by the wrapper
    script that converts the shared object to an .efi executable.
    As per comment in that file:

        (...) Although there may be several LOAD program headers,
        only one is currently copied.

    A simple workaround I've found to work is to ask the linker to put
    everything into one PT_LOAD program header.

The issue is ackowledged in the syslinux wiki page about building
syslinux [1]. This page refers to various resources, of which a Debian
patch [2].

This information is also referenced in #11861.

Fixes: #11861

[0] https://www.syslinux.org/archives/2018-August/026167.html
[1] https://wiki.syslinux.org/wiki/index.php?title=Building
[2] https://salsa.debian.org/images-team/syslinux/-/blob/debian/master/debian/patches/0017-single-load-segment.patch

Reported-by: Sam Lancia <sam@gpsm.co.uk>
Reported-by: Meliodas <meliodasren01@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Sam, Meliodas: I have no test-case to validate this change, so it would
be nice if you could report on whether the above does indeed fixes the
issue you reported. Bonus point: it would be even better if we could
improve on the existing runtime test: support/testing/tests/boot/test_syslinux.py
It currently only does a test build, so it does not catch the issue; the
grub2 test we have does run, so we can catch failures. It would be nice
to also have a runtime test for syslinux...
---
 boot/syslinux/0018-single-load-segment.patch | 313 +++++++++++++++++++
 1 file changed, 313 insertions(+)
 create mode 100644 boot/syslinux/0018-single-load-segment.patch

diff --git a/boot/syslinux/0018-single-load-segment.patch b/boot/syslinux/0018-single-load-segment.patch
new file mode 100644
index 0000000000..11d73c31a4
--- /dev/null
+++ b/boot/syslinux/0018-single-load-segment.patch
@@ -0,0 +1,313 @@
+From: Lukas Schwaighofer <lukas@schwaighofer.name>
+Date: Sat, 18 Aug 2018 16:56:35 +0200
+Subject: Force the linker to put all sections into a single PT_LOAD segment
+
+This is required when using binutils >= 2.31 which writes two PT_LOAD segments
+by default. This is not supported by the wrapper.c script used to convert the
+shared object into an elf binary.
+
+Forwarded: https://www.syslinux.org/archives/2018-August/026167.html
+[yann.morin.1998@free.fr:
+  - grab from the Debian package
+  - https://salsa.debian.org/images-team/syslinux/-/blob/fa1349f1f8e5f5d6307e589f02c0a679031d1c7f/debian/patches/0017-single-load-segment.patch
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+Upstream: reported https://www.syslinux.org/archives/2018-August/026167.html
+Upstream: acknowledged https://wiki.syslinux.org/wiki/index.php?title=Building
+---
+ efi/i386/syslinux.ld   | 37 +++++++++++++++++++++----------------
+ efi/x86_64/syslinux.ld | 37 +++++++++++++++++++++----------------
+ 2 files changed, 42 insertions(+), 32 deletions(-)
+
+diff --git a/efi/i386/syslinux.ld b/efi/i386/syslinux.ld
+index bab3fc7..19c1647 100644
+--- a/efi/i386/syslinux.ld
++++ b/efi/i386/syslinux.ld
+@@ -19,6 +19,11 @@ OUTPUT_FORMAT("elf32-i386", "elf32-i386", "elf32-i386")
+ OUTPUT_ARCH(i386)
+ ENTRY(_start)
+
++PHDRS
++{
++	all PT_LOAD ;
++}
++
+ SECTIONS
+ {
+ 	. = 0;
+@@ -31,7 +36,7 @@ SECTIONS
+ 		*(.text)
+ 		*(.text.*)
+ 		__text_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(16);
+
+@@ -40,7 +45,7 @@ SECTIONS
+ 		*(.rodata)
+ 		*(.rodata.*)
+ 		__rodata_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(4);
+
+@@ -49,14 +54,14 @@ SECTIONS
+ 		KEEP (*(SORT(.ctors.*)))
+ 		KEEP (*(.ctors))
+ 		__ctors_end = .;
+-	}
++	} :all
+
+ 	.dtors : {
+ 		__dtors_start = .;
+ 		KEEP (*(SORT(.dtors.*)))
+ 		KEEP (*(.dtors))
+ 		__dtors_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(4096);
+ 	.rel : {
+@@ -64,7 +69,7 @@ SECTIONS
+ 		*(.rel.data)
+ 		*(.rel.data.*)
+ 		*(.rel.ctors)
+-	}
++	} :all
+
+ 	. = ALIGN(4);
+
+@@ -72,14 +77,14 @@ SECTIONS
+ 		__gnu_hash_start = .;
+ 		*(.gnu.hash)
+ 		__gnu_hash_end = .;
+-	}
++	} :all
+
+
+ 	.dynsym : {
+ 		__dynsym_start = .;
+ 		*(.dynsym)
+ 		__dynsym_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(4);
+
+@@ -87,7 +92,7 @@ SECTIONS
+ 		__dynstr_start = .;
+ 		*(.dynstr)
+ 		__dynstr_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(4);
+
+@@ -104,7 +109,7 @@ SECTIONS
+ 		KEEP (*(.got.plt))
+ 		KEEP (*(.got))
+ 		__got_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(4);
+
+@@ -112,7 +117,7 @@ SECTIONS
+ 		__dynamic_start = .;
+ 		*(.dynamic)
+ 		__dynamic_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(16);
+
+@@ -122,19 +127,19 @@ SECTIONS
+ 		*(.data.*)
+ 		*(.lowmem)
+ 		__data_end = .;
+-	}
++	} :all
+
+ 	.reloc : {
+ 		*(.reloc)
+-	}
++	} :all
+
+ 	.symtab : {
+ 		*(.symtab)
+-	}
++	} :all
+
+ 	.strtab : {
+ 		*(.strtab)
+-	}
++	} :all
+
+ 	.bss (NOLOAD) : {
+ 		/* the EFI loader doesn't seem to like a .bss section,
+@@ -148,7 +153,7 @@ SECTIONS
+ 		__bss_end = .;
+ 		*(.sbss)
+ 		*(.scommon)
+-	}
++	} :all
+ 	__bss_len = ABSOLUTE(__bss_end) - ABSOLUTE(__bss_start);
+ 	__bss_dwords = (__bss_len + 3) >> 2;
+
+@@ -161,7 +166,7 @@ SECTIONS
+ 		*(.hugebss)
+ 		*(.hugebss.*)
+ 		__hugebss_end = .;
+-	}
++	} :all
+
+ 	_end = .;
+
+diff --git a/efi/x86_64/syslinux.ld b/efi/x86_64/syslinux.ld
+index 450641c..a2c124f 100644
+--- a/efi/x86_64/syslinux.ld
++++ b/efi/x86_64/syslinux.ld
+@@ -19,6 +19,11 @@ OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64", "elf64-x86-64")
+ OUTPUT_ARCH(i386:x86-64)
+ ENTRY(_start)
+
++PHDRS
++{
++	all PT_LOAD ;
++}
++
+ SECTIONS
+ {
+ 	. = 0;
+@@ -31,7 +36,7 @@ SECTIONS
+ 		*(.text)
+ 		*(.text.*)
+ 		__text_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(16);
+
+@@ -40,7 +45,7 @@ SECTIONS
+ 		*(.rodata)
+ 		*(.rodata.*)
+ 		__rodata_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(4);
+
+@@ -49,14 +54,14 @@ SECTIONS
+ 		KEEP (*(SORT(.ctors.*)))
+ 		KEEP (*(.ctors))
+ 		__ctors_end = .;
+-	}
++	} :all
+
+ 	.dtors : {
+ 		__dtors_start = .;
+ 		KEEP (*(SORT(.dtors.*)))
+ 		KEEP (*(.dtors))
+ 		__dtors_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(4096);
+ 	.rel : {
+@@ -64,7 +69,7 @@ SECTIONS
+ 		*(.rel.data)
+ 		*(.rel.data.*)
+ 		*(.rel.ctors)
+-	}
++	} :all
+
+ 	. = ALIGN(4);
+
+@@ -72,14 +77,14 @@ SECTIONS
+ 		__gnu_hash_start = .;
+ 		*(.gnu.hash)
+ 		__gnu_hash_end = .;
+-	}
++	} :all
+
+
+ 	.dynsym : {
+ 		__dynsym_start = .;
+ 		*(.dynsym)
+ 		__dynsym_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(4);
+
+@@ -87,7 +92,7 @@ SECTIONS
+ 		__dynstr_start = .;
+ 		*(.dynstr)
+ 		__dynstr_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(4);
+
+@@ -104,7 +109,7 @@ SECTIONS
+ 		KEEP (*(.got.plt))
+ 		KEEP (*(.got))
+ 		__got_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(4);
+
+@@ -112,7 +117,7 @@ SECTIONS
+ 		__dynamic_start = .;
+ 		*(.dynamic)
+ 		__dynamic_end = .;
+-	}
++	} :all
+
+ 	. = ALIGN(16);
+
+@@ -122,19 +127,19 @@ SECTIONS
+ 		*(.data.*)
+ 		*(.lowmem)
+ 		__data_end = .;
+-	}
++	} :all
+
+ 	.reloc : {
+ 		*(.reloc)
+-	}
++	} :all
+
+ 	.symtab : {
+ 		*(.symtab)
+-	}
++	} :all
+
+ 	.strtab : {
+ 		*(.strtab)
+-	}
++	} :all
+
+ 	.bss (NOLOAD) : {
+ 		/* the EFI loader doesn't seem to like a .bss section,
+@@ -148,7 +153,7 @@ SECTIONS
+ 		__bss_end = .;
+ 		*(.sbss)
+ 		*(.scommon)
+-	}
++	} :all
+ 	__bss_len = ABSOLUTE(__bss_end) - ABSOLUTE(__bss_start);
+ 	__bss_dwords = (__bss_len + 3) >> 2;
+
+@@ -161,7 +166,7 @@ SECTIONS
+ 		*(.hugebss)
+ 		*(.hugebss.*)
+ 		__hugebss_end = .;
+-	}
++	} :all
+
+ 	_end = .;
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
