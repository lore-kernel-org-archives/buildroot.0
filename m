Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB43C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B1681FAB;
	Sun,  3 Mar 2024 16:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sn7eqK0D43fJ; Sun,  3 Mar 2024 16:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AC3D81FEA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AC3D81FEA;
	Sun,  3 Mar 2024 16:24:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0221BF575
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF6D860827
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7GRw6ccjupkb for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:24:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAABC60843
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAABC60843
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:24:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9524A87F90; Sun,  3 Mar 2024 16:24:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 17:18:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d74e5af7189a50d891b5ffc3acc55ff795abdf1
X-Git-Newrev: 02df2834155aec4c74149b1aacc4d56babcc9325
X-Patchwork-Hint: ignore
Message-Id: <20240303162401.9524A87F90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: add libreadline search
 prefix
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02df2834155aec4c74149b1aacc4d56babcc9325
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU Octave changed its detection of readline library in [1]. This
commit was first included in version 8.1.0.

GNU Octave was updated to 8.1.0 in Buildroot in commit b36e4b10f3
"package/octave: bump to version 8.1.0".

Since this commit, Octave can fail to find readline automatically in
some specific situations. For example, when host system is Fedora 39
and the host "readline-devel" package is installed (see detailed
explanation below).

Octave is now using a m4 macro from gnulib to detect readline.
See [2].

This macro is calling AC_LIB_LINKFLAGS_BODY([readline]). Note that
this macro will look into $libdir and $includedir by default. See [3].

Buildroot is calling target autotools configure command with
--prefix=/usr and --exec-prefix=/usr arguments. See [4].

Autotools derives libdir='${exec_prefix}/lib' and
includedir='${prefix}/include'.

Finally, gnulib will also search automatically into alternate library
directories (i.e. lib32, lib64). See [5].

All of this will make the configure script searching the readline
library by default (i.e. if the library prefix is not provided) into
the host "/usr/lib", "/usr/lib32" and "/usr/lib64", when configuring
for target.

This issue is not happening on the Buildroot docker reference image,
because the package "libreadline-dev" is not present in this image.

Even if the package "libreadline-dev" is installed on a Debian based
host systems, the issue is still not happening because libraries are
installed in the path "/usr/lib/x86_64-linux-gnu", which is not
searched by gnulib macros.

On host systems which installs libraries into one of the
"/usr/lib{,32,64}" directories, the Octave configuration script will
fail, because it will detect the host library and try to link against
it with target architecture and compilation flags and will fail. Since
the --enable-readline configure option is present, the configuration
script will fail because it cannot find a working readline library.

This can be seen in the octave configuration log, in file:
output/build/octave-8.4.0/config.log

    configure:73671: checking for readline
    configure:73705: /buildroot/output/host/bin/aarch64-none-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -pthread -fopenmp -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lpthread -lm  /usr/lib64/libreadline.so >&5
    /buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/13.2.1/../../../../aarch64-none-linux-gnu/bin/ld: /usr/lib64/libreadline.so: error adding symbols: file in wrong format
    collect2: error: ld returned 1 exit status

This situation can be reproduced on a Fedora 39 x86_64 host system,
with the "readline-devel" package installed. Note: uninstalling the
"readline-devel" will work around the issue.

The issue can be reproduced with a Buildroot configuration such as:

    cat > .config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_OCTAVE=y
    BR2_PACKAGE_READLINE=y
    EOF
    make olddefconfig
    make

In order to avoid those host/target readline detection mix-ups, the
readline search prefix need to be explicitly passed during octave
configuration. This commit adds this search prefix to fix this build
issue.

Fixes:

    checking for readline... (cached) no
    checking for readline/readline.h... (cached) yes
    checking for readline/history.h... (cached) yes
    configure: WARNING: I need GNU Readline 4.2 or later
    configure: error: this is fatal unless you specify --disable-readline

[1] https://github.com/gnu-octave/octave/commit/3645c78658c4c66f2bc346fdbc5c7c77d8d8dd12
[2] https://git.savannah.gnu.org/cgit/gnulib.git/tree/m4/readline.m4?id=2cdc1bafb20b187ad067056e090fcb4396ed9099
[3] https://git.savannah.gnu.org/cgit/gnulib.git/tree/m4/lib-link.m4?id=2cdc1bafb20b187ad067056e090fcb4396ed9099#n190
[4] https://gitlab.com/buildroot.org/buildroot/-/blob/2023.11/package/pkg-autotools.mk#L175
[5] https://git.savannah.gnu.org/cgit/gnulib.git/tree/m4/lib-prefix.m4?id=2cdc1bafb20b187ad067056e090fcb4396ed9099#n276

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/octave/octave.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index cae0de7620..f240a5057c 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -20,7 +20,9 @@ OCTAVE_DEPENDENCIES = \
 	pcre2
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-OCTAVE_CONF_OPTS += --enable-readline
+OCTAVE_CONF_OPTS += \
+	--enable-readline \
+	--with-libreadline-prefix=$(STAGING_DIR)/usr
 OCTAVE_DEPENDENCIES += readline
 else
 OCTAVE_CONF_OPTS += --disable-readline
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
