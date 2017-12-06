From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 5 Dec 2017 20:05:42 -0600
Subject: [Buildroot] [PATCH 2/2] kvmtool: bump to f77d646ba0
In-Reply-To: <CANQCQpaQzSj_4cKDAnGViSySBFgWmywc2mjdWgEiG2WfW7eLXg@mail.gmail.com>
References: <20171203033321.13460-1-matthew.weber@rockwellcollins.com>
 <20171203033321.13460-2-matthew.weber@rockwellcollins.com>
 <20171203145407.78bab7c2@windsurf.home>
 <CANQCQpaQzSj_4cKDAnGViSySBFgWmywc2mjdWgEiG2WfW7eLXg@mail.gmail.com>
Message-ID: <CANQCQpZF8+b7PyYLmw6ZZCX=CTv=rQQmtkJj0ogF3wdPF+unTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Sun, Dec 3, 2017 at 8:05 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Thomas,
>
> On Dec 3, 2017 7:54 AM, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Sat,  2 Dec 2017 21:33:21 -0600, Matt Weber wrote:
> > Commit used:
> > 2017-11-03 16:19:58 +0000
> > irq.h: fix compilation error due to missing bool type
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> This breaks the build:
>
>   LINK     lkvm
> x86_64-amd-linux-gnu-gcc: error: elf_x86_64: No such file or directory

Gustavo, the latest kvmtool switched to doing the final link with gcc
vs originally ld.  I believe this is the right fix.

      3 --- a/package/kvmtool/kvmtool.mk
      4 +++ b/package/kvmtool/kvmtool.mk
      5 @@ -33,7 +33,7 @@ KVMTOOL_LICENSE_FILES = COPYING
      6  # If more packages need this (unlikely) an ld wrapper might be a better
      7  # solution, using gcc -dumpspecs information.
      8  KVMTOOL_EXTRA_LDFLAGS = \
      9 -       $(if $(BR2_x86_64),-m elf_x86_64)
     10 +       $(if $(BR2_x86_64),-m64)
     11
     12  # Disable -Werror, otherwise musl is not happy
     13  KVMTOOL_MAKE_OPTS = \


> x86_64-amd-linux-gnu-gcc: error: unrecognized command line option '-m'
> make[2]: *** [Makefile:384: lkvm] Error 1
> make[1]: *** [package/pkg-generic.mk:250: /home/thomas/projets/buildroot/output/build/kvmtool-f77d646ba01d04be5aad9449ac00719c043fe36e/.stamp_built] Error 2
> make: *** [Makefile:79: _all] Error 2
>
> With the following defconfig:
>
> BR2_x86_64=y
> BR2_x86_steamroller=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_KVMTOOL=y
> # BR2_TARGET_ROOTFS_TAR is not set
>

Matt
