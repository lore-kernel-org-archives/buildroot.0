From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 22:49:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/elfutils: security bump to
 version 0.176
In-Reply-To: <20190803093408.31776-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 3 Aug 2019 11:34:08 +0200")
References: <20190803093408.31776-1-fontaine.fabrice@gmail.com>
Message-ID: <874l2y7z58.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes CVE-2018-18310: An invalid memory address dereference was
 > discovered in dwfl_segment_report_module.c in libdwfl in elfutils
 > through v0.174. The vulnerability allows attackers to cause a denial of
 > service (application crash) with a crafted ELF file, as demonstrated by
 > consider_notes.

 > Fixes CVE-2018-18520: An Invalid Memory Address Dereference exists in
 > the function elf_end in libelf in elfutils through v0.174. Although
 > eu-size is intended to support ar files inside ar files,
 > handle_ar in size.c closes the outer ar file before handling all inner
 > entries. The vulnerability allows attackers to cause a denial of service
 > (application crash) with a crafted ELF file.

 > Fixes CVE-2018-18521: Divide-by-zero vulnerabilities in the function
 > arlib_add_symbols() in arlib.c in elfutils 0.174 allow remote attackers
 > to cause a denial of service (application crash) with a crafted ELF
 > file, as demonstrated by eu-ranlib, because a zero sh_entsize is
 > mishandled.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This unfortunately fails to build on older machines:

http://autobuild.buildroot.net/results/105/1053e2b4b51bc225c4a1a29c93946101a7a53be9/

libelf_pic.a(elf32_updatefile.os): In function `__elf32_updatemmap':
elf32_updatefile.c:(.text+0xb16): undefined reference to `aligned_alloc'
libelf_pic.a(elf64_updatefile.os): In function `__elf64_updatemmap':
elf64_updatefile.c:(.text+0xb67): undefined reference to `aligned_alloc'
collect2: error: ld returned 1 exit status

Which was added in glibc 2.16 (this specific autobuilder uses
2.13). Could you take a look at changing it to use posix_memalign()
instead? Thanks!

-- 
Bye, Peter Korsgaard
