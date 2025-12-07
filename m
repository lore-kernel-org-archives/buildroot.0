Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8B7D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 21:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74ABD407D0;
	Sun,  7 Dec 2025 21:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q819oSvYL1Wy; Sun,  7 Dec 2025 21:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9847C4056D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765142874;
	bh=5HO/4n6iSDfQ6yC/7ElXiXppX85XwwGcewfEzuK/n1I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FCM/aB/fhWBNOWaUkQxxDfg1CtG3epF6tOoFTb1f5pNn+muS/48Otn+ma4SmDI2K9
	 9JLzfs2AcPpxz2zBsmJksWAArCp0WmnZH1cAXNOAPYe4F66vMYZYe7uzEKbec7ts6/
	 T2m8Nh3TCfFRe0nIBWk27UdeXqZl7JkCXRvryG8hYrkxs7Arae05Q+YpYhZxafBtZf
	 HaHMPY5ZVbSqLyOsQsR44iJcC8mjH9tiOtKwRK2o4qov0nb6WzagiBMbif6tpTA+7P
	 /1HTrYOU5E9zpyCW1jm9S4BvLFg1MKu3eVhGJMKFDUfe4r8QP24bhFupNFd8pSV9em
	 pxzlDMX/0Zeww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9847C4056D;
	Sun,  7 Dec 2025 21:27:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93CFC2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86C6540516
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mefYccQZDi_I for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1B1A4056D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1B1A4056D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96E7C86890; Sun,  7 Dec 2025 21:27:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 21:29:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d016a1d98f7cf850ee83d5c2003a2b66c72675b
X-Git-Newrev: 3ce3e04d02aa6b8f1841b6faafa14260085fc350
X-Patchwork-Hint: ignore
Message-Id: <20251207212751.96E7C86890@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: use DESTDIR instead of
 install_root to fix build issue
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ce3e04d02aa6b8f1841b6faafa14260085fc350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building a simple configuration such as:

BR2_aarch64=y
BR2_FORCE_HOST_BUILD=y

Under our reference Docker container, as an out-of-tree build:

./utils/docker-run make O=output-test

will fail during the glibc staging installation step with:

/usr/bin/install -c -m 644 /home/thomas/buildroot/br/output-glibc/build/glibc-2.42-3-gbc13db73937730401d592b33092db6df806d193e/build/libc.a /usr/lib64/libc.a
/usr/bin/install: cannot create regular file '/usr/lib64/libc.a': Permission denied

The problem being that the install_root variable is for some reason
lost along the way. We definitely pass it during the staging
installation step, but then glibc calls a sub-make and in that
submake, install_root is empty.

Observations:

- Building the same configuration inside the Docker container, but
  in-tree, doesn't exhibit the problem.

- Building outside of the Docker container, but with the same make
  version as the one we build due to BR2_FORCE_HOST_BUILD=y doesn't
  exhibit the problem.

However, it turns out that glibc sets install_root to $(DESTDIR). And
passing DESTDIR just works. So we drop our custom
GLIBC_INSTALL_STAGING_OPTS to rely on the default one, and this fixes
the problem. It's not extremely satisfying to not fully understand
what's going on, but after spending quite some time on this, and
having a trivial and actually pretty nice workaround, we simply
propose to use this solution.

There is no autobuilder issue as we're not using our Docker container
to do autobuild builds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index b0fa66218a..a7727cbad8 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -60,8 +60,6 @@ GLIBC_SUBDIR = build
 
 GLIBC_INSTALL_STAGING = YES
 
-GLIBC_INSTALL_STAGING_OPTS = install_root=$(STAGING_DIR) install
-
 # Thumb build is broken, build in ARM mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 GLIBC_EXTRA_CFLAGS += -marm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
