From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 15 Jul 2011 11:20:59 +0200
Subject: [Buildroot] Buildroot ext3 filesystem
In-Reply-To: <CADfuMF6LHMTTVunskwU3hxcFgqa3nWi=V3rLUs1CSWcd9hdqhQ@mail.gmail.com>
References: <CADfuMF6LHMTTVunskwU3hxcFgqa3nWi=V3rLUs1CSWcd9hdqhQ@mail.gmail.com>
Message-ID: <CAEYzJUFAEuYQJ_Q+tsBZR7hf2t27-M7k=FCAN-SeWBAvDD5etQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 July 2011 06:20, Vasanth Ragavendran <ragavendra.2007@gmail.com> wrote:
> Hi
>
> I am new to buildroot and hence my question could be trivial. Plz help. My
> question is Is it possible to create a ext3 root filesystem using build
> root? because during makeconfig i couldn't find ext3 only ext2 was present.

It is not possible at the moment. But it's easy to convert an ext2
filesystem to ext3 or ext4:

# ext2 -> ext3
tune2fs -j image.ext2 && mv image.{ext2,ext3}

# ext3 -> ext4
tune2fs -O extents,uninit_bg,dir_index image.ext3 && mv
image.{ext3,ext4} && e2fsck -fDC0 image.ext4

(I found this info at
https://ext4.wiki.kernel.org/index.php/Ext4_Howto#Converting_an_ext3_filesystem_to_ext4).

We should probably integrate this into buildroot.

> Further, i read in the manual under "Using an external toolchain" that an
> external toolchain like glibc could be used. However there is no option for
> downloading it from the internet and it only asks for the path of the
> toolchain. What is it that i am missing? Awaiting your response.

CodeSourcery toolchains are the only pre-built toolchains that
Buildroot knows about and will automatically download from the
internet. CodeSourcery toolchain selection in buildroot depends on the
target architecture (ARM/MIPS/SH/PowerPC/Blackfin) and is not
available for x86. For example, if you select Target Architecture
"ARM" in buildroot you can then go on and select Toolchain ->
Toolchain type (External toolchain)  and then Toolchain ->
CodeSourcery VERSION. Buildroot will download the toolchain for you.

Best regards,
Bj?rn Forsman
