From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed, 7 Mar 2018 13:26:47 +0100
Subject: [Buildroot] toolchain-external: ld.so* vs ld.so.*
Message-ID: <20180307122647.GI8100@australia>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I have a question on following commit:

commit 32bec8ee2fb00c6750fa842bbb0eb79b0c081fa2
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Sun Jul 2 15:14:17 2017 +0200

    toolchain-external: copy ld*.so* for all C libraries

in which the base value of TOOLCHAIN_EXTERNAL_LIBS changed: (snippet)

+
+TOOLCHAIN_EXTERNAL_LIBS += ld*.so*
+
[..]
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
-TOOLCHAIN_EXTERNAL_LIBS += ld-linux-armhf.so.*
-else
-TOOLCHAIN_EXTERNAL_LIBS += ld*.so.*
-endif


The question is: did you intentionally remove the . before the final asterisk?
I.e. why is it not:

TOOLCHAIN_EXTERNAL_LIBS += ld*.so.*

as was the case before, even for the glibc+eabihf case?
I could not find a reference to why that specific change was made.

Background is that I now notice (after upgrading to 2018.02 coming from
2017.02.x) that an extra file is copied on my target system: the system used to
have just '/lib/ld.so.1' which is also what is encoded in the ELF files as
dynamic loader, but now there is also '/lib/ld-2.20.so' which is not actually
used and is non-stripped (due to an exception in target-finalize).
This adds about 150K on the root filesystem, which is quite a lot for an unused
file.

So I wonder what would be wrong with following patch:

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -108,7 +108,7 @@ endif
 # Definitions of the list of libraries that should be copied to the target.
 #
 
-TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.*
+TOOLCHAIN_EXTERNAL_LIBS += ld*.so.* libgcc_s.so.* libatomic.so.*
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*



Thanks,
Thomas
