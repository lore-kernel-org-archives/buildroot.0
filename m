From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 22:25:04 +0100
Subject: [Buildroot] [PATCH 1/1] crda: fix build failure for nios2
In-Reply-To: <530138C2.7010109@frajasalo.de> (Frank Bergmann's message of
 "Sun, 16 Feb 2014 23:16:34 +0100")
References: <530138C2.7010109@frajasalo.de>
Message-ID: <87wqgs3yhb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Bergmann <frank@frajasalo.de> writes:

 > libgcrypt depends on libgpg-error and this isn't accounted for in
 > crda makefile, but it is in libgcrypt-config script (in the correct
 > order for linking), so set LDLIBS calling this script not only for
 > static linking.

 > Fixes http://autobuild.buildroot.org/results/156/15656ef0187b0a8db6c66fc7a7fcb58a99999fa1

I know both Samuel and Thomas added their acks, but I still don't get
how this can be a nios2 only thing.

On ARM, I don't see libgpg-error exporting such a symbol:

./output/host/usr/bin/arm-linux-nm -D output/target/usr/lib/libgpg-error.so
         w _ITM_deregisterTMCloneTable
         w _ITM_registerTMCloneTable
         w _Jv_RegisterClasses
0000abf8 A __bss_end__
0000abdc A __bss_start
0000abdc A __bss_start__
         w __cxa_finalize
         w __deregister_frame_info
0000abf8 A __end__
         U __errno_location
         U __glibc_strerror_r
         w __register_frame_info
0000abf8 A _bss_end__
0000abdc A _edata
0000abf8 A _end
00000d20 T _fini
000005fc T _init
00000c14 T gpg_err_code_from_errno
00000c90 T gpg_err_code_from_syserror
00000bdc T gpg_err_code_to_errno
00000844 T gpg_err_deinit
0000068c T gpg_err_init
00000848 T gpg_err_set_errno
000008f8 T gpg_error_check_version
00000a6c T gpg_strerror
00000ac4 T gpg_strerror_r
000009b8 T gpg_strsource
         U memcpy
         U strerror
         U strlen

I don't see crda explicitly accessing a _gp symbol:

grep -rls gp output/build/crda-1.1.3

And libgcrypt lists gpg-error as NEEDED, so the runtime linker should
pull it in automatically without us having to explicitly link with it:

./output/host/usr/bin/arm-linux-readelf -a output/target/usr/lib/libgcrypt.so|grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libgpg-error.so.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Are we sure we're not really just pampering over some kind of nios2
binutils / ld issue?


 > Signed-off-by: Frank Bergmann <frank@frajasalo.de>
 > ---
 >  package/crda/crda.mk |    6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/crda/crda.mk b/package/crda/crda.mk
 > index ce87d44..c7e9b2d 100644
 > --- a/package/crda/crda.mk
 > +++ b/package/crda/crda.mk
 > @@ -16,12 +16,12 @@ CRDA_LICENSE_FILES = LICENSE
 >  # And library order matters hence stick -lnl-3 first since it's appended
 >  # in the crda Makefiles as in NLLIBS+=-lnl-3 ... thus failing.
 >  #
 > -# libgcrypt needs -lgpg-error if linking statically, which is correctly
 > -# set by the libgcrypt-config script (and in the right order).
 >  ifeq ($(BR2_PREFER_STATIC_LIB),y)
 >  CRDA_NLLIBS += -lnl-3 -lm -lpthread
 > -CRDA_LDLIBS += `$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`
 >  endif
 > +# libgcrypt needs -lgpg-error, which is correctly
 > +# set by the libgcrypt-config script (and in the right order).
 > +CRDA_LDLIBS += `$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`

 >  define CRDA_BUILD_CMDS
 >         $(TARGET_CONFIGURE_OPTS) \
 > -- 
 > 1.7.10.4
 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
