From: Lionel Flandrin <lionel@svkt.org>
Date: Tue, 1 Aug 2017 09:54:56 +0200
Subject: [Buildroot] Patch: new board Socrates Cyclone 5
In-Reply-To: <20170730151502.6e99d720@windsurf.lan>
References: <aafbf1fc-74ab-1be4-5c58-76a2db9b97e3@gmail.com>
 <20170730151502.6e99d720@windsurf.lan>
Message-ID: <20170801075456.ir2ubcdo2h3n5r5l@ed>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 30, 2017 at 03:15:02PM +0200, Thomas Petazzoni wrote:
> Hello,

Hi!

> (Lionel, Jan: see below, there is a question for you.)
>
> On Sun, 30 Jul 2017 14:51:25 +0200, Micha? ?yszczek wrote:
>
> > This is my first contribution so please correct me if I did something wrong.
>
> Could you please resend your patch with "git send-email" so that it is
> sent as the e-mail body and not as attachment? This will make reviewing
> the patch a lot easier.
>
> > I attach patch with new board support - EVB SoCrates based on Altera's
> > Cyclone 5. I had to add a single binary file - preloader.bin. This is
> > uboot based SPL from Altera. Problem with altera is that boot images
> > must be signed with mkpimage tool, that is bundled with Quartus and it
> > is not possible to sign SPL from buildroot. Yes, supposedly there is
> > option in config to create signed SPL, but it doesn't work for none of
> > my Altera's board, hence this binary SPL. Good side is that this SPL
> > loads uboot that is made during compilation, so there is still place for
> > customization and patching if someone needs it.

What do you mean by "signed" with mkpimage? As far as I know mkpimage
can't sign anything, it just puts a simple header before the BIN file
and then adds a CRC at the end. Simply looking at the help message of
Altera's own mkpimage:

> mkpimage version 16.0 (build 211)
>
> Description: This tool creates an Altera BootROM-compatible image of Second
> Stage Boot Loader (SSBL). The input and output files are in binary format.
> It can also decode and check the validity of previously generated image.
>
> Usage:
>  Create quad image:
>      mkpimage [options] -hv <num> -o <outfile> <infile> <infile> <infile> <infile>
>  Create single image:
>      mkpimage [options] -hv <num> -o <outfile> <infile>
>  Decode single/quad image:
>      mkpimage -d [-a <num>] <infile>
>
> Options:
>  -a (--alignment) <num>       : Address alignment in kilobytes for output image
>                                 (64, 128, 256, etc.), default to 64 for header
>                                 version 0 and 256 for header version 1,
>                                 override if the NAND flash has a different
>                                 block size. If outputting a single image, value
>                                 of '0' is permitted to specify no flash block
>                                 padding (needed for SSBL image encryption).
>  -d (--decode)                : Flag to decode the header information from
>                                 input file and display it
>  -f (--force)                 : Flag to force decoding even if the input file
>                                 is an unpadded image
>  -h (--help)                  : Display this help message and exit
>  -hv (--header-version) <num> : Header version to be created (Arria/Cyclone V =
>                                 0, Arria 10 = 1)
>  -o (--output) <outfile>      : Output file, relative and absolute path
>                                 supported
>  -off (--offset) <num>        : Program entry offset relative to start of
>                                 header (0x40), default to 0x14. Used for header
>                                 version 1 only

Buildroot uses barebox's reimplementation in package/mkpimage to have
the same functionality. They should generate a valid image for Altera
bootloaders (both Arria/Cyclone V and 10).

Now on top of that I know that the Arria 10 supports booting signed
and even encrypted images, however I'm not sure if the Cyclone V has
this functionality. If it does and your board is configured only to
accept signed code maybe that's your problem?

Can I access this preloader.bin somewhere? I could check if there's
anything obviously special about it.

> I've added in Cc: Jan and Lionel who added and improved the
> BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC. Hopefully they will have
> some ideas.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
Lionel Flandrin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170801/68f68ca7/attachment.asc>
