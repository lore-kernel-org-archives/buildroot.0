From: Anton Blanchard <anton@samba.org>
Date: Tue, 3 Dec 2013 22:14:37 +1100
Subject: [Buildroot] [PATCH] toolchain: Allow ld64.so linker
In-Reply-To: <20131202110923.2ac86fb5@skate>
References: <20131202172311.2641462e@kryten>
	<20131202110923.2ac86fb5@skate>
Message-ID: <20131203221437.106b6bf5@kryten>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,

> Can you add to the commit log the specific toolchain/situation for
> which this is needed? The external toolchain logic is full of special
> cases, and I very often read the commit logs to find out why such or
> such special case was added.

Definitely. How does this look?

--
From: Jeremy Kerr <jk@ozlabs.org>

The glibc dynamic linkers for ppc64 and s390x are named ld64.so.*
so modify the check_glibc check to match them.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Anton Blanchard <anton@samba.org>
---

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index a8944ce..faa9d90 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -204,7 +204,7 @@ check_glibc_rpc_feature = \
 #
 check_glibc = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if test `find $${SYSROOT_DIR}/ -maxdepth 2 -name 'ld-linux*.so.*' -o -name 'ld.so.*' | wc -l` -eq 0 ; then \
+	if test `find $${SYSROOT_DIR}/ -maxdepth 2 -name 'ld-linux*.so.*' -o -name 'ld.so.*' -o -name 'ld64.so.*' | wc -l` -eq 0 ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
 	fi; \
