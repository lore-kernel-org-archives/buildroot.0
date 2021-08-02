Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68474C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:12:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E8461050
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28E8461050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0ABF84467;
	Wed,  4 Aug 2021 01:12:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2NjroZ3-5KL; Wed,  4 Aug 2021 01:12:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41D6E844A8;
	Wed,  4 Aug 2021 01:12:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 785721BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6313940653
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AinxXrudg5yG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14F12414F1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5C23985E9B; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 16:00:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 594f5218e757e4f5aa92c0206efae78e94fb6568
X-Git-Newrev: 03c148c8dec4e8c3fa13fcde4a730b3ab97f3f10
X-Patchwork-Hint: ignore
Message-Id: <20210803211027.5C23985E9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bird: needs autoreconf
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=03c148c8dec4e8c3fa13fcde4a730b3ab97f3f10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since the bump to version 2.0.8 in commit
f5906644b45269b1a5fe109cb64fad837e4fbff2, bird uses a home-grown "GNU Autoconf
2.69e" instead of standard autoconf 2.69 to generate the configure
script. This fork seems to generate incorrect code: it uses

ac_test_CFLAGS=${CFLAGS+y}

to remember if CFLAGS was saved, while standard autoconf uses

ac_test_CFLAGS=${CFLAGS+set}

The configure.ac code itself, however, uses

if test "$ac_test_CFLAGS" != set ; then

to check if CFLAGS was overridden.

Thus, Buildroot's CFLAGS are not taken into account and this leads to
the following build failure:

checking for glob.h... no
configure: error: glob.h not found.

This build failure is raised because -g0 and -g are both passed to gcc:

configure:5207: checking for glob.h
configure:5230: /data/buildroot-autobuilder/instance-0/output-1/host/bin/mips64el-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -pthread -fno-strict-aliasing -fno-strict-overflow -flto -Wall -Wextra -Wstrict-prototypes -Wno-parentheses -Wno-pointer-sign -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pthread -flto=4 -g conftest.c  >&5
/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccDboxph.ltrans0.ltrans.o:(.debug_info+0x2a): undefined reference to `conftest.c.0943dc99'
/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccDboxph.ltrans0.ltrans.o:(.debug_info+0x2f): undefined reference to `conftest.c.0943dc99'

-g0 is passed by buildroot and -g is passed by bird if
$ac_test_CFLAGS" != set (since version 2.0.7 and
https://gitlab.nic.cz/labs/bird/-/commit/cc95b4594ac924b40325a4f1adcae5312179db40)

To fix this, we can simply run autoreconf and generate a correct
configure script.

Fixes:
 - http://autobuild.buildroot.org/results/1d2acc9f6b8830adc8b62d6b2e55837abae561a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bird/bird.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index a8b9b18b50..7d7002d5f2 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -11,6 +11,7 @@ BIRD_LICENSE_FILES = README
 BIRD_CPE_ID_VENDOR = nic
 BIRD_SELINUX_MODULES = bird
 BIRD_DEPENDENCIES = host-flex host-bison
+BIRD_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_BIRD_CLIENT),y)
 BIRD_CONF_OPTS += --enable-client
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
