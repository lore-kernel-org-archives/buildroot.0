From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 15:41:05 +0200
Subject: [Buildroot] [PATCH 2/4] toolchain/helpers.mk: re-evaluate DESTDIR
	in copy_toolchain_lib_root
In-Reply-To: <20170702134107.11488-1-thomas.petazzoni@free-electrons.com>
References: <20170702134107.11488-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170702134107.11488-3-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

copy_toolchain_lib_root copies libraries from staging to target,
resolving and copying symbolic links along the way.

The most inner loop, a "while" loop, starts from an initial name, and
if it's a symbolic link, gets resolved to the target, and the loop
iterates until we reach a real file. However, the destination folder
where the symbolic link or real file is created is computed in DESTDIR
only once, before this loop starts. Therefore, this loop works fine
when all symbolic links in the chain, and the real file all belong to
the same directory. But it doesn't do the correct thing when the
symbolic link and/or real file are in different folder.

An example is Crosstool-NG musl toolchains, where the dynamic loader
is in /lib/ld-musl*.so but points to ../usr/lib/libc.so. With the
current logic, we copy /lib/ld-musl*.so to /lib, but we also copy
libc.so to /lib instead of the expected /usr/lib.

This currently doesn't cause any problem because the musl dynamic
linker is manually created by the TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
hook. However, this logic has a number of problems, so in a followup
commit, we are going to put the musl dynamic linker in
TOOLCHAIN_EXTERNAL_LIBS, which will cause it to be copied by
copy_toolchain_lib_root. But we obviously want the link and its target
to be copied to the right place, hence this fix.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 90834f4..fe2b4b9 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -13,10 +13,10 @@ copy_toolchain_lib_root = \
 \
 	LIBPATHS=`find $(STAGING_DIR)/ -name "$${LIBPATTERN}" 2>/dev/null` ; \
 	for LIBPATH in $${LIBPATHS} ; do \
-		DESTDIR=`echo $${LIBPATH} | sed "s,^$(STAGING_DIR)/,," | xargs dirname` ; \
 		mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
 		while true ; do \
 			LIBNAME=`basename $${LIBPATH}`; \
+			DESTDIR=`echo $${LIBPATH} | sed "s,^$(STAGING_DIR)/,," | xargs dirname` ; \
 			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 			if test -h $${LIBPATH} ; then \
 				cp -d $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
-- 
2.9.4
