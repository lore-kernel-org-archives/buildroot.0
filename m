Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D96C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FBEC60ED8;
	Wed, 28 Feb 2024 16:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WVJpwkuGhXmC; Wed, 28 Feb 2024 16:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B987560EE8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B987560EE8;
	Wed, 28 Feb 2024 16:44:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86FDC1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BF91415B0
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eoDGQY6I_oC8 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D8EB41667
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D8EB41667
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1686687BD6; Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 17:37:11 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 54be12aaed13dc1e1ea7eb8c7c1173c47ba6a9cb
X-Git-Newrev: e8f374db5c7c9df6190f3014b49e4839acb8eb09
X-Patchwork-Hint: ignore
Message-Id: <20240228164338.1686687BD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] boot/syslinux: carry fix
 for build failures with binutils 2.31+
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8f374db5c7c9df6190f3014b49e4839acb8eb09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit e53a8593b4edf5df1771692df6764b3bc385c6f4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
