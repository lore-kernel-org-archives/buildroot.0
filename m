Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F30C77B7A
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 06:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91AE941325;
	Thu, 29 Aug 2024 06:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBsJoz7SIyEQ; Thu, 29 Aug 2024 06:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84D634132B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84D634132B;
	Thu, 29 Aug 2024 06:22:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 510391BF98E
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BD2C8144B
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aq6KzP4G50D6 for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 06:22:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A41D81456
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A41D81456
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 06:22:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05F3E8661C; Thu, 29 Aug 2024 06:22:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 08:06:49 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 3f0b87bf31154c5e93bed52a1a1d1d1d2d9a8fa1
X-Git-Newrev: 40c35798dbd588c682d08544f79c081f105a13b3
X-Patchwork-Hint: ignore
Message-Id: <20240829062206.05F3E8661C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/autossh: fix
 build with gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=40c35798dbd588c682d08544f79c081f105a13b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Include stdio.h to avoid that __progname check wrongly returned that
the function is unavailable with gcc >= 14 which enables
-Werror=implicit-function-declaration
(https://gcc.gnu.org/gcc-14/porting_to.html):

configure:5231: checking if libc defines __progname
configure:5249: /home/autobuild/autobuild/instance-7/output-1/host/bin/sh4-buildroot-linux-musl-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c  >&5
conftest.c: In function 'main':
conftest.c:73:27: error: implicit declaration of function 'printf' [-Wimplicit-function-declaration]
   73 |  extern char *__progname; printf("%s", __progname);
      |                           ^~~~~~
conftest.c:1:1: note: include '<stdio.h>' or provide a declaration of 'printf'
    1 | /* confdefs.h */
conftest.c:73:27: warning: incompatible implicit declaration of built-in function 'printf' [-Wbuiltin-declaration-mismatch]
   73 |  extern char *__progname; printf("%s", __progname);
      |                           ^~~~~~
conftest.c:73:27: note: include '<stdio.h>' or provide a declaration of 'printf'

resulting in the following static build failure:

/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/sh4-buildroot-linux-musl/14.1.0/../../../../sh4-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-7/output-1/host/sh4-buildroot-linux-musl/sysroot/lib/libc.a(libc.o):(.bss.__progname+0x0): multiple definition of `__progname'; autossh.o:(.bss+0x120): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/5d80a8096d0f5529cbd86903a74f3bab3d230f4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 65672b9cd099b71dcfec1d982af1f35824b851d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...igure.ac-fix-__progname-check-with-gcc-14.patch | 52 ++++++++++++++++++++++
 package/autossh/autossh.mk                         |  1 +
 2 files changed, 53 insertions(+)

diff --git a/package/autossh/0001-configure.ac-fix-__progname-check-with-gcc-14.patch b/package/autossh/0001-configure.ac-fix-__progname-check-with-gcc-14.patch
new file mode 100644
index 0000000000..a517328110
--- /dev/null
+++ b/package/autossh/0001-configure.ac-fix-__progname-check-with-gcc-14.patch
@@ -0,0 +1,52 @@
+From 3a74eff481f37975e04f00db4923b1c16f93497d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 20 Jul 2024 16:06:37 +0200
+Subject: [PATCH] configure.ac: fix __progname check with gcc >= 14
+
+Include stdio.h to avoid that __progname check wrongly returns that
+the function is unavailable with gcc >= 14 which enables
+-Werror=implicit-function-declaration
+(https://gcc.gnu.org/gcc-14/porting_to.html):
+
+configure:5231: checking if libc defines __progname
+configure:5249: /home/autobuild/autobuild/instance-7/output-1/host/bin/sh4-buildroot-linux-musl-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c  >&5
+conftest.c: In function 'main':
+conftest.c:73:27: error: implicit declaration of function 'printf' [-Wimplicit-function-declaration]
+   73 |  extern char *__progname; printf("%s", __progname);
+      |                           ^~~~~~
+conftest.c:1:1: note: include '<stdio.h>' or provide a declaration of 'printf'
+    1 | /* confdefs.h */
+conftest.c:73:27: warning: incompatible implicit declaration of built-in function 'printf' [-Wbuiltin-declaration-mismatch]
+   73 |  extern char *__progname; printf("%s", __progname);
+      |                           ^~~~~~
+conftest.c:73:27: note: include '<stdio.h>' or provide a declaration of 'printf'
+
+resulting in the following static build failure:
+
+/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/sh4-buildroot-linux-musl/14.1.0/../../../../sh4-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-7/output-1/host/sh4-buildroot-linux-musl/sysroot/lib/libc.a(libc.o):(.bss.__progname+0x0): multiple definition of `__progname'; autossh.o:(.bss+0x120): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5d80a8096d0f5529cbd86903a74f3bab3d230f4a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/Autossh/autossh/pull/9
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4bb9380..dadb523 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -132,7 +132,7 @@ AC_CHECK_LIB(socket, connect)
+ # ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ AC_CACHE_CHECK([if libc defines __progname], ac_cv_libc_defines___progname, [
+-	AC_TRY_LINK([],
++	AC_TRY_LINK([ #include <stdio.h> ],
+ 		[ extern char *__progname; printf("%s", __progname); ],
+ 		[ ac_cv_libc_defines___progname="yes" ],
+ 		[ ac_cv_libc_defines___progname="no" ]
+-- 
+2.43.0
+
diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
index 899e5cdb52..fbb525bcca 100644
--- a/package/autossh/autossh.mk
+++ b/package/autossh/autossh.mk
@@ -10,6 +10,7 @@ AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
 AUTOSSH_LICENSE = Modified BSD
 AUTOSSH_LICENSE_FILES = autossh.c
 # Fix AC_ARG_WITH code generation for --with-ssh
+# 0001-configure.ac-fix-__progname-check-with-gcc-14.patch
 AUTOSSH_AUTORECONF = YES
 
 AUTOSSH_CONF_OPTS = --with-ssh=/usr/bin/ssh
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
