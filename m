From: hartleys <hartleys@visionengravers.com>
Date: Tue, 11 Nov 2008 20:09:06 -0500
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <20081111183231.E74AC3C989@busybox.net>
References: <20081111183231.E74AC3C989@busybox.net>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909CEAAE5@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, November 11, 2008 11:33 AM, Thomas Petazzoni wrote:
> Fix external toolchain build
>
> This patch is a new version of a patch already sent several times
> on the mailing-list, committed and reverted a few times by Daniel
> Laird, due to several imperfections. This version is a new try at
> finding a solution that works for everybody. Hopefully it'll work :-)
>
> The original problem is that external toolchain builds failed
> because packages couldn't find their dependent libraries at
> configure time and could not be linked with them. To fix these
> two problems, two things are added:
>
> * The TARGET_LDFLAGS variable was exposed as LDFLAGS at ./configure
>   time thanks to TARGET_CONFIGURE_OPTS. The TARGET_LDFLAGS variable
>   contains -L options with the path in the STAGING_DIR for the
>   libraries. It allows ./configure scripts to properly compile the
>   small test programs testing whether a dependency is properly
>   installed.
>
> * The TARGET_CFLAGS contains a new -Wl,--rpath-link option for both
>   $(STAGING_DIR)/lib and $(STAGING_DIR)/usr/lib. It allows library
>   depending on other libraries to link properly. The TARGET_CFLAGS is
>   exposed as CFLAGS in TARGET_CONFIGURE_OPTS.
>
> This new version fixes a problem encountered by hartleys
> <hartleys@visionengravers.com> when building the kernel. The
> problem was that the -Wl,--rpath-link options were added to LDFLAGS,
> while there are options for the C compiler, not the ld linker. Moving
> them to CFLAGS seems to fix the issue.

Grk... Well, the patch kind of fixes my problem. At least the kernel
builds ;-)

Each source file hit with CC produces a warning message. Everything hit
with LD is fine. Here's a snip of the output:

...
  LD      lib/zlib_inflate/zlib_inflate.o
  LD      lib/zlib_inflate/built-in.o
  CC      lib/audit.o
arm-linux-gcc: --rpath-link: linker input file unused because linking
not done
arm-linux-gcc: /home/bigguiness/buildroot/build_arm/staging_dir/lib:
linker input file unused because linking not done
arm-linux-gcc: --rpath-link: linker input file unused because linking
not done
arm-linux-gcc: /home/bigguiness/buildroot/build_arm/staging_dir/usr/lib:
linker input file unused because linking not done
  LD      lib/built-in.o
  CC      lib/argv_split.o
arm-linux-gcc: --rpath-link: linker input file unused because linking
not done
arm-linux-gcc: /home/bigguiness/buildroot/build_arm/staging_dir/lib:
linker input file unused because linking not done
arm-linux-gcc: --rpath-link: linker input file unused because linking
not done
arm-linux-gcc: /home/bigguiness/buildroot/build_arm/staging_dir/usr/lib:
linker input file unused because linking not done
  CC      lib/cmdline.o
arm-linux-gcc: --rpath-link: linker input file unused because linking
not done
arm-linux-gcc: /home/bigguiness/buildroot/build_arm/staging_dir/lib:
linker input file unused because linking not done
arm-linux-gcc: --rpath-link: linker input file unused because linking
not done
arm-linux-gcc: /home/bigguiness/buildroot/build_arm/staging_dir/usr/lib:
linker input file unused because linking not done
...

Regards,
Hartley
