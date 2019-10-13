From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 13 Oct 2019 15:48:41 +0200
Subject: [Buildroot] GNU Binutils 2.33.1 has been released.
In-Reply-To: <87eezim2ho.fsf@redhat.com>
References: <87eezim2ho.fsf@redhat.com>
Message-ID: <be5b0885-b1cb-875c-2fdc-30ee3078358e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nick, All,

Le 12/10/2019 ? 17:01, Nick Clifton a ?crit?:
> Hello Everyone,
> 
>   We are pleased to announce that version 2.33.1 of the GNU Binutils project
>   sources have been released and are now available for download at:
> 
>     https://ftp.gnu.org/gnu/binutils
>     https://sourceware.org/pub/binutils/releases/
> 
>   The md5sum values are:
>     
>     56a3be5f8f8ee874417a4f19ef3f10c8  binutils-2.33.1.tar.bz2
>     1a6b16bcc926e312633fcc3fae14ba0a  binutils-2.33.1.tar.gz
>     f4e7e023664f087b3017fc42955ebb46  binutils-2.33.1.tar.lz
>     9406231b7d9dd93731c2d06cefe8aaf1  binutils-2.33.1.tar.xz

Thanks for the release.

I tested this new version using toolchain-builder project [1] and discovered
some regressions on arm cortex-m4 and SH4 architectures.

See [1] for the smoke test results (please ignore aarch64--musl issue):

- armv7m [2]: (arm cortex-m4, GCC 9.2, binutils 2.33.1, kernel headers 4.19.79,
uClibc-ng 1.0.31)

There is a segfault in elf2flt while building busybox:

"ld (ld-elf2flt):
/builds/kubu93/toolchains-builder/build/opt/armv7m--uclibc--bleeding-edge-2/arm-buildroot-uclinux-uclibcgnueabi/bin/elf2flt
terminated with signal 11 [Segmentation fault], core dumped"

The build succeed using Binutils 2.32 [3].

- sh4 [4]: (sh4, binutils 2.33.1, kernel headers 4.19.79, Glibc | uClibc-ng |
musl, Qemu 3.1)

The system doesn't boot under Qemu.

The system boot using Binutils 2.32 [5]

Here is my Buildroot branch containing the patch adding binutils 2.33.1:
https://github.com/RomainNaour/buildroot/tree/binutils-2.33.1

For now I didn't investigated further.

Thought ?

[1] https://gitlab.com/kubu93/toolchains-builder/pipelines/88475734
[2] https://gitlab.com/kubu93/toolchains-builder/-/jobs/319395300
[3] https://gitlab.com/kubu93/toolchains-builder/-/jobs/319412583
[4] https://gitlab.com/kubu93/toolchains-builder/-/jobs/319395346
    https://gitlab.com/kubu93/toolchains-builder/-/jobs/319395347
    https://gitlab.com/kubu93/toolchains-builder/-/jobs/319395348
[5] https://gitlab.com/kubu93/toolchains-builder/pipelines/88482917

> 
> 
>   This release contains numerous bug fixes, and also the following new
>   features:
> 
>     Assembler:
>     
>     * Adds support for the Arm Scalable Vector Extension version 2
>       (SVE2) instructions, the Arm Transactional Memory Extension (TME)
>       instructions and the Armv8.1-M Mainline and M-profile Vector
>       Extension (MVE) instructions.
> 
>     * Adds support for the Arm Cortex-A76AE, Cortex-A77 and Cortex-M35P
>       processors and the AArch64 Cortex-A34, Cortex-A65, Cortex-A65AE,
>       Cortex-A76AE, and Cortex-A77 processors.
> 
>     * Adds a .float16 directive for both Arm and AArch64 to allow
>       encoding of 16-bit floating point literals.
> 
>     * For MIPS, Add -m[no-]fix-loongson3-llsc option to fix (or not)
>       Loongson3 LLSC Errata.  Add a --enable-mips-fix-loongson3-llsc=[yes|no]
>       configure time option to set the default behavior. Set the default
>       if the configure option is not used to "no".
> 
>     Linker:
> 
>     * The Cortex-A53 Erratum 843419 workaround now supports a choice of
>       which workaround to use.  The option --fix-cortex-a53-843419 now
>       takes an optional argument --fix-cortex-a53-843419[=full|adr|adrp]
>       which can be used to force a particular workaround to be used.
>       See --help for AArch64 for more details.
> 
>     * Add support for GNU_PROPERTY_AARCH64_FEATURE_1_BTI and
>       GNU_PROPERTY_AARCH64_FEATURE_1_PAC  in ELF GNU program properties
>       in the AArch64 ELF linker. 
> 
>     * Add -z force-bti for AArch64 to enable GNU_PROPERTY_AARCH64_FEATURE_1_BTI
>       on output while warning about missing GNU_PROPERTY_AARCH64_FEATURE_1_BTI 
>       on inputs and use PLTs protected with BTI.
> 
>     * Add -z pac-plt for AArch64 to pick PAC enabled PLTs.
> 
>     Utilities:
> 
>     * Add --source-comment[=<txt>] option to objdump which if present,
>       provides a prefix to source code lines displayed in a disassembly.
> 
>     * Add --set-section-alignment <section-name>=<power-of-2-align>
>       option to objcopy to allow the changing of section alignments.
> 
>     * Add --verilog-data-width option to objcopy for verilog targets to
>       control width of data elements in verilog hex format.
> 
>     * The separate debug info file options of readelf (--debug-dump=links
>       and --debug-dump=follow) and objdump (--dwarf=links and
>       --dwarf=follow-links) will now display and/or follow multiple
>       links if more than one are present in a file.  (This usually
>       happens when gcc's -gsplit-dwarf option is used).
> 
>       In addition objdump's --dwarf=follow-links now also affects its
>       other display options, so that for example, when combined with
>       --syms it will cause the symbol tables in any linked debug info
>       files to also be displayed.  In addition when combined with
>       --disassemble the --dwarf= follow-links option will ensure that
>       any symbol tables in the linked files are read and used when
>       disassembling code in the main file.
> 
>     * Add support for dumping types encoded in the Compact Type Format
>       to objdump and readelf.    
> 
>   Our thanks go out to all of the binutils contributors, past and
>   present, for helping to make this release possible.
> 
>   Note in case you are wondering about what happened to the 2.33
>   release, it is stuck pending the resolution of an issue with the keys
>   used to sign the release.  Once this is resolved the 2.33 tarballs
>   will be uploaded, even though they will now be slightly out of date.
> 
> Cheers
>   Nick Clifton
>   Binutils Chief Maintainer.
> 
