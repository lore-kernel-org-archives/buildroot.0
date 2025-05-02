Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C085C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2021D84132;
	Fri,  2 May 2025 11:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5eQn5ulYK_0; Fri,  2 May 2025 11:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA1D84138
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA1D84138;
	Fri,  2 May 2025 11:13:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 181D122D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5258B6121A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_1X9PKHbjfj for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D377C611D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D377C611D6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF9E7864AF; Fri,  2 May 2025 11:11:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:12:54 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d6fb51826f081cb5175f467a0ba64f27f3abdc9c
X-Git-Newrev: 79f62092fdf478e23a4ee43f7d86d5326ae8b6b5
X-Patchwork-Hint: ignore
Message-Id: <20250502111136.CF9E7864AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/lmbench: fix
 build with recent gcc versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5316030383268909034=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5316030383268909034==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=79f62092fdf478e23a4ee43f7d86d5326ae8b6b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

lmbench dependency discovery relies on implicit return types for
main().  This causes compiler errors when -Wimplicit-int is enabled,
which has become the default with recent gcc versions. The failure of
the dependcy discovery causes lmbench to redifine typedefs the
compiler already has in an incompatible manner. Add a patch to fix the
discovery.

Fixes:
bench.h:81:13: error: conflicting types for ‘socklen_t’; have ‘int’
   81 | typedef int socklen_t;

bench.h:85:15: error: conflicting types for ‘off64_t’; have ‘int64’ {aka ‘long long int’}
   85 | typedef int64 off64_t;

Fixes:

  http://autobuild.buildroot.net/results/33cf97a79125c20f67f620eb6a7b5ad2206b2503/

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fd914e9e4c23237fc7681eff86889916f81d478e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0006-scripts-build-int-return-type-main.patch  | 204 +++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/package/lmbench/0006-scripts-build-int-return-type-main.patch b/package/lmbench/0006-scripts-build-int-return-type-main.patch
new file mode 100644
index 0000000000..17a4517f72
--- /dev/null
+++ b/package/lmbench/0006-scripts-build-int-return-type-main.patch
@@ -0,0 +1,204 @@
+From 3340c9552cc6e7d77adf39becbc6be52233d80c0 Mon Sep 17 00:00:00 2001
+From: Charlie Jenkins <charlie@rivosinc.com>
+Date: Thu, 10 Apr 2025 13:25:07 -0700
+Subject: [PATCH] scripts/build: int return type main()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some compilers (such as the bootlin riscv64-lp64d glibc bleeding-edge
+2024.05-1 toolchain) fail to run the dependency checking scripts and
+error at "return type defaults to ‘int’ [-Wimplicit-int]". Add types
+to these main() functions to allow this dependency tracking to work.
+
+Upstream: dead
+Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
+---
+ scripts/build | 42 +++++++++++++++++++++---------------------
+ 1 file changed, 21 insertions(+), 21 deletions(-)
+
+diff --git a/scripts/build b/scripts/build
+index 4820d80..2c8a50a 100755
+--- a/scripts/build
++++ b/scripts/build
+@@ -51,14 +51,14 @@ fi
+ 
+ # check for bcopy (optionally set the SYS5 flag)
+ echo "#include <string.h>" > ${BASE}$$.c
+-echo "main() { char a[256], b[256]; bcopy(a, b, 256); }" >> ${BASE}$$.c
++echo "int main() { char a[256], b[256]; bcopy(a, b, 256); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	|| CFLAGS="${CFLAGS} -DSYS5"
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 
+ # check for valloc
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+-echo "main() { char* buf = valloc(123); }" >> ${BASE}$$.c
++echo "int main() { char* buf = valloc(123); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	|| CFLAGS="${CFLAGS} -Dvalloc=malloc"
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -67,7 +67,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <unistd.h>" >> ${BASE}$$.c
+-echo "main() { off64_t off; }" >> ${BASE}$$.c
++echo "int main() { off64_t off; }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_off64_t"
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -76,7 +76,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <unistd.h>" >> ${BASE}$$.c
+-echo "main() { int fd = 0; off64_t off = 0; off = lseek64(fd, off, SEEK_SET); }" >> ${BASE}$$.c
++echo "int main() { int fd = 0; off64_t off = 0; off = lseek64(fd, off, SEEK_SET); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_lseek64"
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -88,7 +88,7 @@ echo "#include <sys/resource.h>" >> ${BASE}$$.c
+ echo "#ifndef RUSAGE_SELF" >> ${BASE}$$.c
+ echo "#define RUSAGE_SELF 0" >> ${BASE}$$.c
+ echo "#endif /* RUSAGE_SELF */" >> ${BASE}$$.c
+-echo "main() { struct rusage ru; getrusage(RUSAGE_SELF, &ru); }" >> ${BASE}$$.c
++echo "int main() { struct rusage ru; getrusage(RUSAGE_SELF, &ru); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DRUSAGE"
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -136,13 +136,13 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 
+ # check for OSs that have S_IFFIFO instead of S_IFIFO
+ echo "#include <sys/stat.h>" > ${BASE}$$.c
+-echo "main() { return (S_IFIFO); }" >> ${BASE}$$.c
++echo "int main() { return (S_IFIFO); }" >> ${BASE}$$.c
+ if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+ 	true;
+ else
+ 	rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 	echo "#include <sys/stat.h>" > ${BASE}$$.c
+-	echo "main() { return (S_IFFIFO); }" >> ${BASE}$$.c
++	echo "int main() { return (S_IFFIFO); }" >> ${BASE}$$.c
+ 	${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 		|| CFLAGS="${CFLAGS} -DS_IFIFO=S_IFFIFO"
+ fi
+@@ -151,7 +151,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ # check that we have uint
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+-echo "main() { uint i = 0; return (i); }" >> ${BASE}$$.c
++echo "int main() { uint i = 0; return (i); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_uint=1";
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -161,7 +161,7 @@ HAVE_uint64=0
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <rpc/types.h>" >> ${BASE}$$.c
+-echo "main() { uint64 i = 0; return (int)(i); }" >> ${BASE}$$.c
++echo "int main() { uint64 i = 0; return (int)(i); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_uint64=1" && HAVE_uint64=1;
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -170,7 +170,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ if [ ${HAVE_uint64} = 0 ]; then
+     echo "#include <stdlib.h>" > ${BASE}$$.c
+     echo "#include <sys/types.h>" >> ${BASE}$$.c
+-    echo "main() { uint64_t i = 0; return (int)(i); }" >> ${BASE}$$.c
++    echo "int main() { uint64_t i = 0; return (int)(i); }" >> ${BASE}$$.c
+     ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_uint64_t=1";
+     rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -181,7 +181,7 @@ HAVE_int64=0
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <rpc/types.h>" >> ${BASE}$$.c
+-echo "main() { int64 i = 0; return (int)(i); }" >> ${BASE}$$.c
++echo "int main() { int64 i = 0; return (int)(i); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_int64=1" && HAVE_int64=1;
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -190,7 +190,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ if [ ${HAVE_int64} = 0 ]; then
+     echo "#include <stdlib.h>" > ${BASE}$$.c
+     echo "#include <sys/types.h>" >> ${BASE}$$.c
+-    echo "main() { int64_t i = 0; return (int)(i); }" >> ${BASE}$$.c
++    echo "int main() { int64_t i = 0; return (int)(i); }" >> ${BASE}$$.c
+     ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_int64_t=1";
+     rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -209,15 +209,15 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <sys/socket.h>" >> ${BASE}$$.c
+-echo "main() { int s; struct sockaddr dest; socklen_t len; getsockname(s, &dest, &len); }" >> ${BASE}$$.c
+-${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
++echo "int main() { int s; struct sockaddr dest; socklen_t len; getsockname(s, &dest, &len); }" >> ${BASE}$$.c
++${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_socklen_t"
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 
+ # check that we have drand48 and srand48
+ HAVE_RANDOM=0
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+-echo "main() { srand48(973); return (int)(1.0E9 * drand48()); }" >> ${BASE}$$.c
++echo "int main() { srand48(973); return (int)(1.0E9 * drand48()); }" >> ${BASE}$$.c
+ if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+ 	CFLAGS="${CFLAGS} -DHAVE_DRAND48"
+ 	HAVE_RANDOM=1
+@@ -226,7 +226,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ 
+ if [ ${HAVE_RANDOM} -eq 0 ]; then
+     echo "#include <stdlib.h>" > ${BASE}$$.c
+-    echo "main() { srand(973); return (10 * rand()) / RAND_MAX; }" >> ${BASE}$$.c
++    echo "int main() { srand(973); return (10 * rand()) / RAND_MAX; }" >> ${BASE}$$.c
+     if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+ 	CFLAGS="${CFLAGS} -DHAVE_RAND"
+ 	HAVE_RANDOM=1
+@@ -236,7 +236,7 @@ fi
+ 
+ if [ ${HAVE_RANDOM} -eq 0 ]; then
+     echo "#include <stdlib.h>" > ${BASE}$$.c
+-    echo "main() { srandom(973); return (10 * random()) / RAND_MAX; }" >> ${BASE}$$.c
++    echo "int main() { srandom(973); return (10 * random()) / RAND_MAX; }" >> ${BASE}$$.c
+     if ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL}; then
+ 	CFLAGS="${CFLAGS} -DHAVE_RANDOM"
+ 	HAVE_RANDOM=1
+@@ -247,7 +247,7 @@ fi
+ # check that we have sysmp
+ echo "#include <sys/types.h>" > ${BASE}$$.c
+ echo "#include <sys/sysmp.h>" >> ${BASE}$$.c
+-echo "main() { return (int)sysmp(MP_NPROCS); }" >> ${BASE}$$.c
++echo "int main() { return (int)sysmp(MP_NPROCS); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_SYSMP=1";
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -257,7 +257,7 @@ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <unistd.h>" >> ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <sys/processor.h>" >> ${BASE}$$.c
+-echo "main() { return bindprocessor(BINDPROCESS, getpid(), 0); }" >> ${BASE}$$.c
++echo "int main() { return bindprocessor(BINDPROCESS, getpid(), 0); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_BINDPROCESSOR=1";
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -267,7 +267,7 @@ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <sys/types.h>" >> ${BASE}$$.c
+ echo "#include <sys/processor.h>" >> ${BASE}$$.c
+ echo "#include <sys/procset.h>" >> ${BASE}$$.c
+-echo "main() { return processor(P_PID, P_MYPID, 0, NULL); }" >> ${BASE}$$.c
++echo "int main() { return processor(P_PID, P_MYPID, 0, NULL); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_BINDPROCESSOR=1";
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+@@ -276,7 +276,7 @@ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+ echo "#include <stdlib.h>" > ${BASE}$$.c
+ echo "#include <unistd.h>" >> ${BASE}$$.c
+ echo "#include <sched.h>" >> ${BASE}$$.c
+-echo "main() { unsigned long mask = 1; return sched_setaffinity(0, sizeof(unsigned long), &mask); }" >> ${BASE}$$.c
++echo "int main() { unsigned long mask = 1; return sched_setaffinity(0, sizeof(unsigned long), &mask); }" >> ${BASE}$$.c
+ ${CC} ${CFLAGS} -o ${BASE}$$ ${BASE}$$.c ${LDLIBS} 1>${NULL} 2>${NULL} \
+ 	&& CFLAGS="${CFLAGS} -DHAVE_SCHED_SETAFFINITY=1";
+ rm -f ${BASE}$$ ${BASE}$$.o ${BASE}$$.c
+-- 
+2.43.0
+

--===============5316030383268909034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5316030383268909034==--
