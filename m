From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 07 Nov 2016 23:08:10 +0100
Subject: [Buildroot] [PATCH] ubifs: Fix regression in ubifs_readdir()
In-Reply-To: <d5f41448-c95c-54e3-69dc-ad3615580042@mind.be>
References: <1477648432-9543-1-git-send-email-richard@nod.at>
 <1477671544.8927.1.camel@embedded.rocks>
 <c542e099-0404-be8e-ebeb-d4265d3204d6@nod.at>
 <1477693395.31471.1.camel@embedded.rocks>
 <20161101232215.5bf7cabd@free-electrons.com>
 <1478116619.8549.1.camel@embedded.rocks>
 <20161102214927.30b0d74f@free-electrons.com>
 <1478126967.8549.4.camel@embedded.rocks>
 <87f68565-765b-4e9b-a3f0-34dae0b45e93@mind.be>
 <1478157814.9853.1.camel@embedded.rocks>
 <d5f41448-c95c-54e3-69dc-ad3615580042@mind.be>
Message-ID: <1478556490.1776.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2016-11-03 at 11:22 +0100, Arnout Vandecappelle wrote:
> 
> On 03-11-16 08:23, J?rg Krause wrote:
> > On Thu, 2016-11-03 at 03:46 +0100, Arnout Vandecappelle wrote:
> > > 
> > > On 02-11-16 23:49, J?rg Krause wrote:
> 
> [snip]
> > > > > > Yes, I am. Linux kernel source directory is located locally
> > > > > > and
> > > > > > the
> > > > > > path is set using LINUX_OVERRIDE_SRCDIR in local.mk.
> > > > > > 
> > > > > > 1/ Checkout Linux kernel version 4.7.10
> > > > > > 2/ make linux-dirclean all
> > > > > > 3/ Booted Linux version is 4.7.10
> > > > > > 
> > > > > > 4/ Checkout Linux kernel version 4.8.5
> > > > > > 5/ make linux-dirclean all
> > > > > > 6/ Booted Linux version is still 4.7.10
> > > > > 
> > > > > And this scenario works fine with ccache *disabled*, but
> > > > > breaks
> > > > > when
> > > > > you enable ccache support in Buildroot?
> > > > 
> > > > Yes.
> > > 
> > > ?I can't reproduce this. I've got a nice mix of cache misses and
> > > cache hits when
> > > building a different version, and version.o is definitely a cache
> > > miss.
> > > 
> > > ?Can you double-check the version in output/build/linux-
> > > custom/init/version.o?
> > 
> > I checked the version string in version.o with hexdump -C and they
> > differ.
> 
> ?And the version that is in there is correct, right? (Use strings to
> get it, the
> first string it finds should be the version string as in uname -a).
> 
> ?This is very weird, because version.o gets linked into the
> vmlinux.elf and
> eventually the zImage, and ccache doesn't get activated anymore in
> that path
> because it's all linking and no compiling...
> 
> > 
> > > And the one in output/build/linux-
> > > custom/include/generated/utsrelease.h?
> > 
> > This as well.
> > 
> > > ?Hm, hang on, is there maybe a utsrelease.h that ends up in your
> > > staging dir and that is used by ccache?
> > 
> > No, there is only the linux generated file.
> > 
> > ---
> > 
> > I am not experienced with ccache, but I got some statistics:
> > 
> > I cleared the cache by removing ~/.buildroot-ccache, than run `make
> > linux-dirclean linux`:
> > 
> > cache hit (direct)?????????????????????0
> > cache hit (preprocessed)???????????????0
> > cache miss??????????????????????????1088
> > cache hit rate??????????????????????0.00 %
> > called for link???????????????????????10
> > called for preprocessing???????????????5
> > no input file????????????????????????394
> > cleanups performed?????????????????????0
> > files in cache??????????????????????3250
> > 
> > Then I re-run `make linux-dirclean linux` (without altering the
> > linux
> > sources):
> > 
> > cache hit (direct)??????????????????1076
> > cache hit (preprocessed)??????????????10
> > cache miss??????????????????????????1090
> > cache hit rate?????????????????????49.91 %
> > called for link???????????????????????20
> > called for preprocessing??????????????10
> > no input file????????????????????????788
> > cleanups performed?????????????????????0
> > files in cache??????????????????????3264
> > 
> > Again, clear the cache and run `make linux-dirclean linux`, but
> > alter
> > the linux sources by checking out a different branch:
> > 
> > cache hit (direct)????????????????????10
> 
> ?This is weird, it shouldn't go down... Did you clear the cache or
> the
> statistics somewhere in between?

Yes. Maybe you missed it, but I wrote "Again, clear the cache...".

> > cache hit (preprocessed)??????????????62
> > cache miss??????????????????????????2102
> > cache hit rate??????????????????????3.31 %
> > called for link???????????????????????20
> > called for preprocessing??????????????10
> > no input file????????????????????????773
> > cleanups performed?????????????????????0
> > files in cache??????????????????????6386
> > 
> > ---
> > 
> > Furthermore, I did the following for the different linux builds:
> > 
> > After building branch-4.7.y:
> > # cp output/build/linux-custom/arch/arm/boot/zImage zImage-4.7.10
> > 
> > After building branch-4.8.y:
> > # cp output/build/linux-custom/arch/arm/boot/zImage zImage-4.8.5
> > 
> > Afterwards, diff shows no differences:
> > # diff zImage-4.7.10 zImage-4.8.5
> 
> ?Since version.o differs, it means the version.o doesn't end up in
> the zImage...
> Again, can you check for the intermediate files what happens to them?
> E.g.
> init/built-in.o, .tmp_vmlinux1, arch/arm/boot/Image. Maybe just do
> "mv
> output/build/linux-custom output/build/linux-custom.orig" before
> rebuilding and
> do a full tree compare to find which files are identical.

I did the following:

1/ checkout linux-4.8 branch
2/ make linux-dirclean linux
3/ move output/build/linux-custom to output/build/linux-custom.orig
4/ checkout linux-4.7 branch
5/ make linux-dirclean linux
6/ diff:

# diff output/build/linux-custom/arch/arm/boot/Image
output/build/linux-custom.orig/arch/arm/boot/Image
Binary files output/build/linux-custom/arch/arm/boot/Image and
output/build/linux-custom.orig/arch/arm/boot/Image differ
# diff output/build/linux-custom/arch/arm/boot/zImage
output/build/linux-custom.orig/arch/arm/boot/zImage

Weird, the Image binaries differ, but the zImage don't. The zImage in
output/build/linux-custom/arch/arm/boot/ is exactly the same as in
output/build/linux-custom.orig/arch/arm/boot/

J?rg
