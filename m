From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 29 Dec 2015 01:55:04 +0100
Subject: [Buildroot] [PATCH 1/7] toolchain-external: CodeSourcery AMD64:
 support only one version
In-Reply-To: <20151219135757.30f09e4d@free-electrons.com>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
 <20151219135757.30f09e4d@free-electrons.com>
Message-ID: <5681D9E8.70308@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 19/12/2015 13:57, Thomas Petazzoni a ?crit :
> Romain,
> 
> On Sat, 21 Nov 2015 17:36:14 +0100, Romain Naour wrote:
>> See the conclusion about external toolchains during the Buildroot
>> meeting [1]:
>> "In the future, we stick to a single external toolchain version. The
>> Kconfig symbol should not encode the version (avoid legacy handling)"
>>
>> [1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> I have applied patches 1, 2, 3, 4, 6 and 7 of this patch series. Could
> you send patches doing the same (reducing to one version only) for
> other CodeSourcery toolchains as well ?
> 
> Regarding patch 5, I don't really like the hacks needed with the
> dynamic loader, and would like to see if there is a way to avoid having
> those hacks.

Well, this CS toolchain defeat (once again) the Buildroot toolchain-external
Makefile code...

I removed the hack from TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
but I had to do something in copy_toolchain_sysroot() to handle the special
case.

if we use a 64 bits toolchain we also look at "lib" directory to see if there
are some symlink to libraries belonging to "lib64". If yes, we create the
corresponding symlink in STAGING_DIR.

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1452ec6..f6f769b 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -142,6 +142,18 @@ copy_toolchain_sysroot = \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
 	done ; \
+	if [ $${ARCH_LIB_DIR} = "lib64" ] ; then \
+		if [ -d $${ARCH_SYSROOT_DIR}/lib ] ; then \
+			mkdir -p `dirname $(STAGING_DIR)/lib` ; \
+			SYMLINKS=`find $${ARCH_SYSROOT_DIR}/lib -maxdepth 1 -type l 2>/dev/null` ; \
+			for i in $${SYMLINKS} ; do \
+				relpath=`readlink -f $${i}` ; \
+				if [ "`dirname $${relpath}`" = "$${ARCH_SYSROOT_DIR}lib64" ] ; then \
+					ln -sf `basename $${relpath}` $(STAGING_DIR)/lib/`basename $${i}` ; \
+				fi ; \
+			done ; \
+		fi ; \
+	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
 			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \

I don't think it's better than TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP.

The same kind of change should be done in copy_toolchain_lib_root() to copy the
dynamic loader.
In the common case, we expect that it match this pattern: ld*.so.*
But it's not the case here because the symlink to the dynamic loader
is in another directory (lib) and we are looking for it in (lib64).
So the LIB_EXTERNAL_LIBS += ld*.so.* doesn't match any library during
the copy to TARGET_DIR.
That's why the system doesn't boot at runtime.

Thoughts ?

Best regards,
Romain

> 
> Thomas
> 
