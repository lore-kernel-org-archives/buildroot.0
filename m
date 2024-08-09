Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03B7C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 22:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6151E80C16;
	Fri,  9 Aug 2024 22:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNADyaxngpA8; Fri,  9 Aug 2024 22:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB5728136E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB5728136E;
	Fri,  9 Aug 2024 22:03:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B7481BF286
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49BA3403B7
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 22:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVYbOTM7ugTg for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 22:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0B924038B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0B924038B
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 22:03:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB68884F81; Fri,  9 Aug 2024 22:03:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 00:01:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33557477c06bbbb24754210b7606c186f1e8a31e
X-Git-Newrev: 3a39e706a91ad6191e499e46bdcaacbe590a144a
X-Patchwork-Hint: ignore
Message-Id: <20240809220313.AB68884F81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Makefile.in: work around buggy
 buildsystems wrt LDFLAGS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5283426859778353967=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5283426859778353967==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3a39e706a91ad6191e499e46bdcaacbe590a144a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some buildsystems (or their use of it by packages) will cause flags in
LDFLAGS to be re-orderded, or even dropped, causing some
incomprehensible mayhem... For example, gpsd [0] has this in its
SConscript [1](typoes not mines, for once):

    591 # scons uses gcc, or clang, to link. Thus LDFLAGS does not serve its
    592 # traditional function of providing arguments to ln. LDFLAGS set in the
    593 # environment before running scons get moved into CCFLAGS by scons.
    594 # LDFLAGS set while running scons get ignored.
    [--SNIP--]
    611 for i in ["ARFLAGS",
    612           "CCFLAGS",
    613           "CFLAGS",
    614           "CPPFLAGS",
    615           "CXXFLAGS",
    616           "LDFLAGS",
    617           "LINKFLAGS",
    618           "SHLINKFLAGS",
    619           ]:
    620     if i in os.environ:
    621         # MergeFlags() puts the options where scons wants them, not
    622         # where you asked them to go.
    623         env.MergeFlags(Split(os.getenv(i)))

So, when LDFLAGS (our TARGET_LDFLAGS) contains "-z text"  (without the
quotes), that gets turned into a command line like (line-splitted for
readability):

    [...]/buildroot/output/host/bin/aarch64_be-buildroot-linux-musl-gcc \
        -o gpsd-3.25/drivers/driver_rtcm2.os \
        -c \
        --sysroot=[...]/buildroot/output/host/aarch64_be-buildroot-linux-musl/sysroot \
        -O3 -g0 \
        -z \
        -fPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
        gpsd-3.25/drivers/driver_rtcm2.c

Notice how there is a lone "-z" without any following keyword.

This then causes a build failure that looks totally unrelated [2]:

    In file included from gpsd-3.25/drivers/../include/gpsd.h:36,
                     from gpsd-3.25/drivers/driver_rtcm2.c:65:
    gpsd-3.25/drivers/../include/os_compat.h:40:8: error: redefinition of ‘struct timespec’
       40 | struct timespec {
          |        ^~~~~~~~
    In file included from [...]/buildroot/output/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/sys/select.h:16,
                     from gpsd-3.25/drivers/../include/gpsd.h:31:
    [...]/buildroot/output/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/bits/alltypes.h:237:8: note: originally defined here
      237 | struct timespec { time_t tv_sec; int :8*(sizeof(time_t)-sizeof(long))*(__BYTE_ORDER==4321); long tv_nsec; int :8*(sizeof(time_t)-sizeof(long))*(__BYTE_ORDER!=4321); };
          |        ^~~~~~~~
    gpsd-3.25/drivers/../include/os_compat.h:48:5: error: conflicting types for ‘clock_gettime’; have ‘int(clockid_t,  struct timespec *)’ {aka ‘int(int,  struct timespec *)’}
       48 | int clock_gettime(clockid_t, struct timespec *);
          |     ^~~~~~~~~~~~~
    In file included from gpsd-3.25/drivers/../include/gpsd.h:33:
    [...]/buildroot/output/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include/time.h:104:5: note: previous declaration of ‘clock_gettime’ with type ‘int(clockid_t,  struct timespec *)’ {aka ‘int(int,  struct timespec *)’}
      104 | int clock_gettime (clockid_t, struct timespec *);
          |     ^~~~~~~~~~~~~
    scons: *** [gpsd-3.25/drivers/driver_rtcm2.os] Error 1
    scons: building terminated because of errors.
    make[1]: *** [package/pkg-generic.mk:289: [...]/buildroot/output/build/gpsd-3.25/.stamp_built] Error 2
    make: *** [Makefile:83: _all] Error 2

Although undocumented, neither in gcc not ld (clang unchecked by lack of
a clang toolchain here, and by lack of clang knowledge), -z accepts the
keyword to be snatch-glued onto it, like -zkeyword, rather than be
spearated with a space. So, use that to pass -ztext.

Fixes:
    http://autobuild.buildroot.org/results/c03/c039989947b960ac6af17c87090366abc26dcb6d/
    http://autobuild.buildroot.net/results/bc35d3e7b0e8c59c776652070650af3c749250ee/

[0] Our other scons-based package, mongodb, does not build for another
reason that probably hides the same issue as seen with gpsd.

[1] As explained in gpsd's SConscript (se above), Scons does play tricks
with variables:
    https://scons.org/doc/production/HTML/scons-man.html#f-MergeFlags
    https://scons.org/doc/production/HTML/scons-man.html#f-ParseFlags

Quoting:
    Flag values are translated according to the prefix found, and added
    to the following construction variables:
    [...]
    -Wl,                    LINKFLAGS
    [...]
    -                       CCFLAGS
    [...]
    Any other strings not associated with options are assumed to be the
    names of libraries and added to the $LIBS construction variable.

So in our case, it finds that -z is an unknown option that matches the
'-' prefix, so it is added to CFLAGS, while 'text' is a string on its
own, so added to LIBS, and thus it would try to link with -ltext
(supposedly, because we do not even go that far). Funnily enough, we can
se that "-Wl," is a known option prefix, that is added to LINKFLAGS (to
properly be used with gcc or clang, not ld).

As a consequence, gpsd's buildsystem does drop -ztext from the link
flags, and only passes it to the compile flags, which brings us back to
before we banned textrels in a1a2f498d7ec (package/Makefile.in: ban
textrels on musl toolchains). Fixing gpsd is a task for another,
separate patch...

[2] I spent quite some time to look at recent, time-related changes in
Buildroot, especially due to the infamous time64_t issues... Alas, that
was not related, and only a git-bisect pinpointed the actual issue. Poor
polar bears...

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: J. Neuschäfer <j.neuschaefer@gmx.net>
Reviewed-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 43a5c279c0..808b71a93e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -155,12 +155,17 @@ TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 #
 # See also: https://www.openwall.com/lists/musl/2020/09/25/4
 #
-# NOTE: We're using "-z text" instead of "-Wl,-z,text" here, because some
+# NOTE: We're using "-ztext" instead of "-Wl,-z,text" here, because some
 # packages pass TARGET_LDFLAGS directly to ld rather than gcc, and ld doesn't
 # support -Wl,[...]. -z is supported by both gcc and clang, so it probably
 # won't cause us problems.
+#
+# We're using "-ztext" instead of "-z text" here, because some buildsystems
+# (like scons, for gpsd) will reorder and/or drop LDFLAGS, causing a lone
+# "-z" to be passed and the "text" keyword to be dropped otherwise. Both
+# gcc and ld supports that, so it probably won't cause us problems.
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_STATIC_LIBS),y:)
-TARGET_LDFLAGS += -z text
+TARGET_LDFLAGS += -ztext
 endif
 
 # By design, _FORTIFY_SOURCE requires gcc optimization to be enabled.

--===============5283426859778353967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5283426859778353967==--
