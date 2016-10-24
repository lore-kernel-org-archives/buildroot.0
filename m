From: Jan Heylen <heyleke@gmail.com>
Date: Mon, 24 Oct 2016 08:00:35 +0200
Subject: [Buildroot] [PATCH v2 1/4] toolchain: wrap 'ld' with
	toolchain-wrapper
In-Reply-To: <CAGszK3gfxms0WsgKByZvrz8KDG+PPFS_7_PQicu2fMCtm72E3w@mail.gmail.com>
References: <1459885521-25434-1-git-send-email-heyleke@gmail.com>
 <20161016120510.55c138f0@free-electrons.com>
 <CAGszK3i9-JcnWFeHaydg+oA8ntPb=Gb+a9UKsHXUNQyV8JUUGA@mail.gmail.com>
 <20161016142837.62bc74ba@free-electrons.com>
 <816e611d-747b-6e15-5aea-1d83f246c43e@imgtec.com>
 <CAGszK3jRhWPP=mxaQTx8kjYjyrymktU4V0NDPp+bxAk40o5zRQ@mail.gmail.com>
 <1f814abc-0446-88f1-7d98-cb309838b060@imgtec.com>
 <CAGszK3iXCpnSiHR5ZkgRJJxY=ZycS32VHpYRpbXdoqQutP8vrQ@mail.gmail.com>
 <b9d595a6-5ac5-7692-742b-03596ca68943@imgtec.com>
 <CAGszK3gfxms0WsgKByZvrz8KDG+PPFS_7_PQicu2fMCtm72E3w@mail.gmail.com>
Message-ID: <CAGszK3gcntz8mHVdJXudwn2kkcxm65qrVcRN1YD27K87XF4WOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

any update on the libdmalloc issue we observe when building for MIPS
(because of no ld wrapper) ? Do you see the same?

br,

Jan

On Sun, Oct 16, 2016 at 7:27 PM, Jan Heylen <heyleke@gmail.com> wrote:

> Hi,
>
> ok, I just realized I won't have time 'later this week', so I had a look
> at this again right away (#GTD it is called in hipster language). Did you
> check the output of the build for dmalloc? I just verified the issue with
> our toolchain, and the result is indeed that dmalloc 'builds', but if you
> look at the .so file:
>
> -rw-r--r-- 1 jheylen we2 849476 16 okt 19:04 libdmalloc.a
> -rwxr-xr-x 1 jheylen we2    593 16 okt 19:04 libdmalloc.so
> -rwxr-xr-x 1 jheylen we2    593 16 okt 19:05 libdmalloc.so.t
> -rw-r--r-- 1 jheylen we2 858132 16 okt 19:04 libdmallocth.a
> -rw-r--r-- 1 jheylen we2 915054 16 okt 19:04 libdmallocthcxx.a
> -rwxr-xr-x 1 jheylen we2    593 16 okt 19:04 libdmallocthcxx.so
> -rwxr-xr-x 1 jheylen we2    593 16 okt 19:04 libdmallocth.so
> -rw-r--r-- 1 jheylen we2 906398 16 okt 19:04 libdmallocxx.a
> -rwxr-xr-x 1 jheylen we2    593 16 okt 19:04 libdmallocxx.so
>
> The sizes look suspicious ;-), if I try them on target, it doesn't work,
> and  readelf -a libdmalloc.so:
> ----------------------------
> ELF Header:
>   Magic:   7f 45 4c 46 02 02 01 00 00 00 00 00 00 00 00 00
>   Class:                             ELF64
>   Data:                              2's complement, big endian
>   Version:                           1 (current)
>   OS/ABI:                            UNIX - System V
>   ABI Version:                       0
>   Type:                              DYN (Shared object file)
>   Machine:                           MIPS R3000
>   Version:                           0x1
>   Entry point address:               0x40
>   Start of program headers:          0 (bytes into file)
>   Start of section headers:          96 (bytes into file)
>   Flags:                             0x0
>   Size of this header:               64 (bytes)
>   Size of program headers:           0 (bytes)
>   Number of program headers:         0
>   Size of section headers:           64 (bytes)
>   Number of section headers:         4
>   Section header string table index: 1
>
> Section Headers:
>   [Nr] Name              Type             Address           Offset
>        Size              EntSize          Flags  Link  Info  Align
>   [ 0]                   NULL             0000000000000000  00000000
>        0000000000000000  0000000000000000           0     0     0
>   [ 1] .shstrtab         STRTAB           0000000000000000  00000040
>        000000000000001b  0000000000000000           0     0     1
>   [ 2] .symtab           SYMTAB           0000000000000000  00000160
>        00000000000000c0  0000000000000018           3     2     8
>   [ 3] .strtab           STRTAB           0000000000000000  00000220
>        0000000000000031  0000000000000000           0     0     1
> Key to Flags:
>   W (write), A (alloc), X (execute), M (merge), S (strings)
>   I (info), L (link order), G (group), T (TLS), E (exclude), x (unknown)
>   O (extra OS processing required) o (OS specific), p (processor specific)
>
> There are no section groups in this file.
>
> There are no program headers in this file.
>
> There are no relocations in this file.
>
> The decoding of unwind sections for machine type MIPS R3000 is not
> currently supported.
>
> Symbol table '.symtab' contains 8 entries:
>    Num:    Value          Size Type    Bind   Vis      Ndx Name
>      0: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT  UND
>      1: 0000000000018030     0 NOTYPE  LOCAL  DEFAULT  ABS _gp
>      2: 0000000000010040     0 NOTYPE  GLOBAL DEFAULT  ABS _fdata
>      3: 0000000000000040     0 NOTYPE  GLOBAL DEFAULT  ABS _ftext
>      4: 0000000000010040     0 NOTYPE  GLOBAL DEFAULT  ABS __bss_start
>      5: 0000000000010040     0 NOTYPE  GLOBAL DEFAULT  ABS _edata
>      6: 0000000000010040     0 NOTYPE  GLOBAL DEFAULT  ABS _end
>      7: 0000000000010040     0 NOTYPE  GLOBAL DEFAULT  ABS _fbss
>
> No version information found in this file.
> ----------------------------
>
> from configure log and config.log, you see why dmalloc decides to link
> with -G -o:
>
> checking shared library link args... <buildroot>/output/host/usr/bin/mips64-octeon-linux-gnu-ld
> -G -o $@.t
> checking shared library extension... so
>
>  <buildroot>/output/host/usr/bin/mips64-octeon-linux-gnu-ld:
> conftest.a(conftest.o): ABI is incompatible with that of the selected
> emulation: "elf32-ntradbigmips" != "elf64-     tradbigmips"
>  <buildroot>/output/host/usr/bin/mips64-octeon-linux-gnu-ld: failed to
> merge target specific data of file conftest.a(conftest.o)
>  <buildroot>/output/host/usr/bin/mips64-octeon-linux-gnu-ld: unrecognized
> option '-all'
>   <buildroot>/output/host/usr/bin/mips64-octeon-linux-gnu-ld: use the
> --help option for usage information
>  444 configure:4475: result:  <buildroot>/output/
> host/usr/bin/mips64-octeon-linux-gnu-ld -G -o $@.t
>
>
>
> from an earlier conversation on the subject:
>
> If I patch dmalloc.mk: (to test the underlying issue):
>
> -DMALLOC_CONF_ENV = CFLAGS="$(DMALLOC_CFLAGS)"
> +DMALLOC_CONF_ENV = CFLAGS="$(DMALLOC_CFLAGS)"
> TARGET_LD="$(TARGET_LD) -m elf32btsmipn32 "
>
>  define DMALLOC_POST_PATCH
>         $(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/'
> $(@D)/configure
> -       $(SED) 's/(ld -/($${LD-ld} -/' $(@D)/configure
> -       $(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(@D)/configure
> +       $(SED) 's/(ld -/($${TARGET_LD-ld} -/' $(@D)/configure
> +       $(SED) 's/'\''ld -/"$${TARGET_LD-ld}"'\'' -/' $(@D)/configure
>         $(SED) 's/ar cr/$$(AR) cr/' $(@D)/Makefile.in
>  endef
>
> I found in the config.log:
>  configure:4475: result:
> /repo/buildroot-ngsw/output/host/usr/bin/mips64-octeon-linux-gnu-ld -m
> elf32btsmipn32  -shared --whole-archive -soname $@ -o $@.t
>
> which is what was expected.
>
>
> Can you verify this in your referred toolchains and dmalloc builds?
>
> thx,
>
> Jan
>
> On Sun, Oct 16, 2016 at 5:33 PM, Vicente Olivert Riera <
> Vincent.Riera at imgtec.com> wrote:
>
>> On 16/10/16 17:19, Jan Heylen wrote:
>> > I'm using a toolchain coming from Cavium, so you're saying that either
>> > the toolchain is the issue or it is no longer an issue? It's been some
>> > time ago that I tested this, let me come back to you later this week.
>>
>> Ok. Just for the record, no problem with the buildroot internal
>> toolchain either. dmalloc built for mips64r2 n32 little-endian uclibc-ng.
>>
>> Regards,
>>
>> Vincent.
>>
>> > br,
>> >
>> > Jan
>> >
>> > On Sun, Oct 16, 2016 at 5:15 PM, Vicente Olivert Riera
>> > <Vincent.Riera@imgtec.com> wrote:
>> >> Hello Jan,
>> >>
>> >> I have just built the dmalloc package for mips64r2 n32 little-endian
>> and
>> >> big-endian without any issue. I have used the "Codescape MTI" external
>> >> toolchain. Are you using a different toolchain? Please let me know so I
>> >> can reproduce the problem.
>> >>
>> >> Regards,
>> >>
>> >> Vincent.
>> >>
>> >> On 16/10/16 17:00, Jan Heylen wrote:
>> >>> For our platform (mips octeon 64 bit but with 32bit userspace:
>> >>> -mabi=n32), and indeed because of the usage of LD, the compilation
>> >>> does fail, that is why I added the patches.
>> >>>
>> >>> br,
>> >>>
>> >>> Jan
>> >>>
>> >>> On Sun, Oct 16, 2016 at 2:38 PM, Vicente Olivert Riera
>> >>> <Vincent.Riera@imgtec.com> wrote:
>> >>>> Hello Jan,
>> >>>>
>> >>>> have you recently seen the dmalloc package failing because of using
>> the
>> >>>> wrong emulation in ld? Or because using ld instead of gcc for
>> linking,
>> >>>> in general?
>> >>>>
>> >>>> Indeed it uses ld instead of gcc, and that's something that could be
>> >>>> improved upstream. However, since it's not failing to build for us I
>> >>>> think there is nothing we need to fix in Buildroot.
>> >>>>
>> >>>> Regards,
>> >>>>
>> >>>> Vincent.
>> >>>>
>> >>>> On 16/10/16 14:28, Thomas Petazzoni wrote:
>> >>>>> Hello,
>> >>>>>
>> >>>>> On Sun, 16 Oct 2016 13:36:19 +0200, Jan Heylen wrote:
>> >>>>>> So we should fix libdmalloc as well?
>> >>>>>
>> >>>>> Vicente is working on this. Do you have references to autobuilder
>> >>>>> failures on libdmalloc caused by this problem ?
>> >>>>>
>> >>>>> Thanks!
>> >>>>>
>> >>>>> Thomas
>> >>>>>
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161024/66cc098d/attachment.html>
