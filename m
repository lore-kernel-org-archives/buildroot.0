Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605F2C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED7F860BE8;
	Sun, 13 Nov 2022 21:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED7F860BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJmPRZWLWjza; Sun, 13 Nov 2022 21:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 104ED60BE1;
	Sun, 13 Nov 2022 21:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 104ED60BE1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB29D1BF406
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5EBF60BE1
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5EBF60BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1p_1GwIDgwc0 for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:01:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C32D560BDF
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C32D560BDF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF48E83797; Sun, 13 Nov 2022 21:01:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:00:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b44f6c2f303ef03f563edd159b1c88d1cf118ed5
X-Git-Newrev: 9cd084b54e2223e49c37962b0cbefae7bea26ef5
X-Patchwork-Hint: ignore
Message-Id: <20221113210108.AF48E83797@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: fix build with -Ofast
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
Content-Type: multipart/mixed; boundary="===============1765801656290884396=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1765801656290884396==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9cd084b54e2223e49c37962b0cbefae7bea26ef5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd does not build with -Ofast (at least with gcc-12), leading to
build errors like:

    ../src/shared/condition.c: In function ‘condition_dump_list’:
    ../src/shared/condition.c:1227:33: error: ‘%s’ directive argument is null [-Werror=format-overflow=]
     1227 |                 "%s\t%s: %s%s%s %s\n",
          |                                 ^~
    cc1: some warnings being treated as errors

It is not really clear what the reason is, but it smells like a compiler
error.

Indeed, the failing format is passed to an fprintf, and the parameter
corresponding to the failing %s directive is a call to a function
which prototype is defined but the implementation only comes later in
the same compilation unit, but is the result of macro expansion, which
yields a function definition like:

    const char foo_to_string(foo_type i) {
        if (i < 0 || i >= (foo_type) ELEMENTSOF(foo_table))
            return NULL;
        return foo_table[i]
    }

(where ELEMENTSOF(x) is a macros arounf sizeof(x) to determine the
number of elements in the array foo_table).

However, in the failing case, foo_table is a static const array indexed
with constants from an enum, and foo_to_string() is only ever called
with variables that are only ever set to one of those enum values.

Since -Ofast is also explicitly documented as breaking otehrwise
conformant programs, we're not going to debug further the reason for the
build failure.

Instead, just revert to the best alternate optimisation level. We chose
-O3, as -Ofast is based on -O3 with breaking optimisation flags.

With -O3, the build succeeds.

Fixes:
    http://autobuild.buildroot.org/results/3ffaa9b3ecacc6ac326be78196af1ad613f195ed/ (sparc64)
    http://autobuild.buildroot.org/results/3f6ae2e503dd1539e4240f344865da4881879204/ (arm)
    http://autobuild.buildroot.org/results/68c17056490d441c7f862349e9c7e471b4570162/ (ppc64)
    ...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1d7452de19..b42f6a502b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -90,6 +90,11 @@ SYSTEMD_CONF_OPTS += \
 	-Dumount-path=/usr/bin/umount \
 	-Dutmp=false
 
+SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
+ifeq ($(BR2_OPTIMIZE_FAST),y)
+SYSTEMD_CFLAGS += -O3
+endif
+
 ifeq ($(BR2_nios2),y)
 # Nios2 ld emits warnings, make warnings not to be treated as errors
 SYSTEMD_LDFLAGS = $(TARGET_LDFLAGS) -Wl,--no-fatal-warnings

--===============1765801656290884396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1765801656290884396==--
