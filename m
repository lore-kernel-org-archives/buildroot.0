From: Frank Bergmann <frank@frajasalo.de>
Date: Tue, 18 Feb 2014 23:20:16 +0100
Subject: [Buildroot] [PATCH 1/1] crda: fix build failure for nios2
In-Reply-To: <87wqgs3yhb.fsf@dell.be.48ers.dk>
References: <530138C2.7010109@frajasalo.de> <87wqgs3yhb.fsf@dell.be.48ers.dk>
Message-ID: <5303DCA0.4080706@frajasalo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18.02.2014 22:25, Peter Korsgaard wrote:
>>>>>> "Frank" == Frank Bergmann <frank@frajasalo.de> writes:
>
>   > libgcrypt depends on libgpg-error and this isn't accounted for in
>   > crda makefile, but it is in libgcrypt-config script (in the correct
>   > order for linking), so set LDLIBS calling this script not only for
>   > static linking.
>
>   > Fixes http://autobuild.buildroot.org/results/156/15656ef0187b0a8db6c66fc7a7fcb58a99999fa1
>
> I know both Samuel and Thomas added their acks, but I still don't get
> how this can be a nios2 only thing.
>
> On ARM, I don't see libgpg-error exporting such a symbol:

But on nios2:

./output/host/usr/bin/nios2-linux-gnu-nm -D output/target/usr/lib/libgpg-error.so
          U bindtextdomain
00004278 S __bss_start
          w __cxa_finalize
          U dcgettext
00004278 G _edata
00004280 S _end
          U __errno_location
000012a0 T _fini
0000c190 A _gp
000010ac T gpg_err_code_from_errno
00001154 T gpg_err_code_from_syserror
00001050 T gpg_err_code_to_errno
00000b40 T gpg_err_deinit
000008f4 T gpg_err_init
00000c88 T gpg_error_check_version
00000b44 T gpg_err_set_errno
00000e3c T gpg_strerror
00000ed0 T gpg_strerror_r
00000d54 T gpg_strsource
000007e8 T _init
          w _ITM_deregisterTMCloneTable
          w _ITM_registerTMCloneTable
          w _Jv_RegisterClasses
          U memcpy
          U strerror
          U strerror_r
          U strlen

> I don't see crda explicitly accessing a _gp symbol:
>
> grep -rls gp output/build/crda-1.1.3
>
> And libgcrypt lists gpg-error as NEEDED, so the runtime linker should
> pull it in automatically without us having to explicitly link with it:
>
> ./output/host/usr/bin/arm-linux-readelf -a output/target/usr/lib/libgcrypt.so|grep NEEDED
>   0x00000001 (NEEDED)                     Shared library: [libgpg-error.so.0]
>   0x00000001 (NEEDED)                     Shared library: [libc.so.0]
>
> Are we sure we're not really just pampering over some kind of nios2
> binutils / ld issue?

Not really. The binary starts but I have no wireless device and infrastructure
to fully test it on a target.

So drop the patch and disable crda for nios2 ?

Frank.
