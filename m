From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 07 Nov 2016 23:24:46 +0100
Subject: [Buildroot] [PATCH] ubifs: Fix regression in ubifs_readdir()
In-Reply-To: <1478556490.1776.1.camel@embedded.rocks>
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
 <1478556490.1776.1.camel@embedded.rocks>
Message-ID: <1478557486.1776.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2016-11-07 at 23:08 +0100, J?rg Krause wrote:

[snip]

> > 
> > ?Since version.o differs, it means the version.o doesn't end up in
> > the zImage...
> > Again, can you check for the intermediate files what happens to
> > them?
> > E.g.
> > init/built-in.o, .tmp_vmlinux1, arch/arm/boot/Image. Maybe just do
> > "mv
> > output/build/linux-custom output/build/linux-custom.orig" before
> > rebuilding and
> > do a full tree compare to find which files are identical.
> 
> I did the following:
> 
> 1/ checkout linux-4.8 branch
> 2/ make linux-dirclean linux
> 3/ move output/build/linux-custom to output/build/linux-custom.orig
> 4/ checkout linux-4.7 branch
> 5/ make linux-dirclean linux
> 6/ diff:
> 
> # diff output/build/linux-custom/arch/arm/boot/Image
> output/build/linux-custom.orig/arch/arm/boot/Image
> Binary files output/build/linux-custom/arch/arm/boot/Image and
> output/build/linux-custom.orig/arch/arm/boot/Image differ
> # diff output/build/linux-custom/arch/arm/boot/zImage
> output/build/linux-custom.orig/arch/arm/boot/zImage
> 
> Weird, the Image binaries differ, but the zImage don't. The zImage in
> output/build/linux-custom/arch/arm/boot/ is exactly the same as in
> output/build/linux-custom.orig/arch/arm/boot/

After running the above steps I did the following:

7/ disable compiler cache option in Buildroot
8/ make linux-dirclean linux
9/ diff:

diff output/build/linux-custom/arch/arm/boot/zImage output/build/linux-
custom.orig/arch/arm/boot/zImage
Binary files hbm10/output/build/linux-custom/arch/arm/boot/zImage and
hbm10/output/build/linux-custom.orig/arch/arm/boot/zImage differ

10/ re-enable compiler cache in Buildroot
11/ Binary files hbm10/output/build/linux-custom/arch/arm/boot/zImage
and hbm10/output/build/linux-custom.orig/arch/arm/boot/zImage differ
12/ diff:

diff output/build/linux-custom/arch/arm/boot/zImage output/build/linux-
custom.orig/arch/arm/boot/zImage
(No message)

No idea!

J?rg
