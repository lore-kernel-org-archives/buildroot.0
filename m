Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025D4C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 16:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2B4B40199;
	Sat, 27 Jan 2024 16:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2B4B40199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-CcjcgYbQkL; Sat, 27 Jan 2024 16:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F314018C;
	Sat, 27 Jan 2024 16:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72F314018C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DCC71BF23B
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C63460BAF
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C63460BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fI7MgBReS69E for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 16:47:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58F0E60745
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 16:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58F0E60745
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42448864F2; Sat, 27 Jan 2024 16:47:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 17:46:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52f3793d46e4185951ce0e7254a35fba23959346
X-Git-Newrev: e53a8593b4edf5df1771692df6764b3bc385c6f4
X-Patchwork-Hint: ignore
Message-Id: <20240127164746.42448864F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/syslinux: carry fix for build
 failures with binutils 2.31+
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e53a8593b4edf5df1771692df6764b3bc385c6f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 boot/syslinux/0018-single-load-segment.patch | 313 +++++++++++++++++++++++++++
 1 file changed, 313 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
