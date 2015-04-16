From: Nathaniel Roach <nroach44@gmail.com>
Date: Thu, 16 Apr 2015 09:40:47 +0800
Subject: [Buildroot]
 =?utf-8?q?Analysis_of_build_error=3A_ffmpeg-2=2E6=2E2?=
 =?utf-8?q?=40bfin_on_Nathaniel=EF=BF=BDs_autobuilder?=
In-Reply-To: <XnsA47DDCE7A4440berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <XnsA47DDCE7A4440berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <552F131F.8030801@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/04/15 03:42, Bernd Kuhls wrote:
> Hi Nathaniel,
> 
> today this build error happened:
> http://autobuild.buildroot.net/results/d13/d13488a43f6e034623104a36c07114db99
> 325b8d/
> 
> I can not reproduce the error here but I think I know why it happened:
> 
> $ grep -i ^ranlib output/build/ffmpeg-2.6.2/config.log
> RANLIB='/home/fli4l/br3/output/host/usr/bin/bfin-uclinux-ranlib'
> ranlib_default='ranlib'
> 
> compare this to 
> http://autobuild.buildroot.net/results/d13/d13488a43f6e034623104a36c07114db99
> 325b8d//ffmpeg-2.6.2/config.log
> 
> RANLIB='/home/chroot/media/code/buildroot/autobuilder/instance-
> 1/output/host/usr/bin/bfin-uclinux-ranlib'
> ranlib_default='ranlib -D'
> 
> output/build/ffmpeg-2.6.2/configure in line 2722 checks for ranlib
> 
> if ranlib 2>&1 | grep -q "\-D "; then
>     ranlib_default="ranlib -D"
> else
>     ranlib_default="ranlib"
> fi
> 
> Maybe this check[1] is done on /usr/bin/ranlib instead of bfin-uclinux-
> ranlib. Here /usr/bin/ranlib does not support -D, maybe your?s does...?
> 
> Regards, Bernd
> 
> [1] Added Jan 27th, 2015: http://git.videolan.org/?
> p=ffmpeg.git;a=commitdiff;h=f8716d1e56d5019d070b30692d144c30a18fcf23
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
Hi Bernd,

The autobuilder is a Debian Jessie chroot, I can't test it on the system
right now, but testing it on my Jessie laptop shows that ranlib does
support -D in debian:

nroach44 at poseidon:~$ which ranlib
/usr/bin/ranlib
nroach44 at poseidon:~$ ranlib --help
Usage: ranlib [options] archive
 Generate an index to speed access to archives
 The options are:
  @<file>                      Read options from <file>
  --plugin <name>              Load the specified plugin
  -D                           Use zero for symbol map timestamp
  -U                           Use actual symbol map timestamp (default)
  -t                           Update the archive's symbol map timestamp
  -h --help                    Print this help message
  -v --version                 Print version information
ranlib: supported targets: elf64-x86-64 elf32-i386 elf32-x86-64
a.out-i386-linux pei-i386 pei-x86-64 elf64-l1om elf64-k1om elf64-little
elf64-big elf32-little elf32-big pe-x86-64 pe-bigobj-x86-64 pe-i386
plugin srec symbolsrec verilog tekhex binary ihex
Report bugs to <http://www.sourceware.org/bugzilla/>

If you need anymore help, just ask!

Nathaniel
