Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956D4CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 611FB60643;
	Sat, 10 Oct 2026 20:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33IOepwMX85L; Sat, 10 Oct 2026 20:28:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 97CBD6061D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791664108;
	b=BvmOPs3bPMej5Gy68hoxmHewMZYeNXG0peehUpoZU9zQyQd0mtffRfE1RleS/pt0pcKj
	 c5wrige/RSarjxUmHHnDeYYLhBbxPxJ6I2gvyh5TbPNUDSkx6fgfiR4EfgJRm1JOFr6Tv
	 lxgbSQbFjRt9RJeFWlFN46u3AVzQOIzuZH8WbIibUM5s2daVW1tmlubWvdix3f3ARnApM
	 dVSBxiITIzUajvgFeabvup7UOWVWEWGamvaIsNuWgWBH7g1DoKdddThI5q7qSE85Wmai+
	 hYeqNKKdfhpC1KSFevPH++e26r0SpuJKQaqty6VCjxlnNcV4Q6u7abraRTBhDrOXN4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791664108;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oAtXC0neawx4ekRMAM0u0amngwU1PBgu+DNkOlqBpoY=;
	b=AB4sKSDiDMMca88yK1rOI8wCvSUUAqsqNl/mZoTyH9f5A9u9RBlDTi3pqj2BHV2Yw/6a
	 LisXXROWIgMeCPh/RDE17DEzC7JuXflKOE3gqvvDyp4BLXOB4YRb8EX6J9sYXycfqosOi
	 COIu9r0dnuhxudJQLy4oJCvc/Q70ypP0CFjqWpCQWiV8Igao3swDLn0p/C3aYrpwzw6Ol
	 YmfRjNxX2olvTanEU4rG11z6GcoHHyiTfijdBM9QQ4ezrY+FG4LFvwfR+FrXKXqmESqpp
	 z7RFxCPLp986LSlJ01tlMAWGjuF48D54UVAUR3LENBdGzUu9oZfGlGNIN4Jk3fLyLcw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791664108;
	bh=oAtXC0neawx4ekRMAM0u0amngwU1PBgu+DNkOlqBpoY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cqbPfH/FuHv7ndjwqylcc298Qs1AimCTwQaupLYcZo1MvDYl8i6W7AjzSJjxw49Pp
	 jHOYcgsDKryaztCdu3n1DntFicIIMfc8B08VDn6IL9hKBonym8qLXKA31U3jxb3Ltd
	 kilQRYsAZKZsvAjHY6LdlgpTcDIFCoIDiJ/XQ4gkXwaIDzTcIaZy3nqHcXZxj+Oo0U
	 f9DmF1L3OAigHEhL+l/hvNX964gZfIL4UeTwrxusakTzcqn3o1RI4xvRnxwgI6qpOZ
	 a/QcWqPtPIN3rYbcXxDlvlOdcXZu5UFKE0n7DmuDBVH1vTZ2bp7XYcte/REBFfVGDG
	 doY0EDdHvGMQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97CBD6061D;
	Sat, 10 Oct 2026 20:28:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64B0C156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56F0B6061D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9o-Vp0U3qGv for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:28:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5001D60617
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791664106;
 b=cDVOwjX6uIozjyvEsgn1Pz8/Phhqlcn7ceN2qVLZuoGuy113YvHuV4uRFgcyLIGzj8Pg
 PpULDWSdFYFDt4xRzuTkkcwxsesdGaEOMupqJ7kgM04/6rnD5ZObSrxRINc4iN5vyqRUn
 R9NTfLbV3J7vfsUCa/f5h1gobw2wxLEHl6tzAGtzg3CWcAiR9B0YNWbitzFc4isdwyKDW
 7V074aQksS8GNe3BIwoSjwYmSvgZ8SMJIFGx4rxcIRZQ1t4IuUozA4QKmlE4OxzMrseIq
 TlMPj1w5hRxoZAzA07vQUsWU62N8mzBZunNv9EeGuoLPSSIPe3M42VAJ2g4xdnWguUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791664106;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dtJ7c3T7e90dPmcV/mPMSxIg7g3zWpmAnLFDgRpTTvA=;
 b=oqo43lEv3M/cKPTAe44SS3rX8tzfJ7hAW4dSpEzU2cvfw4Bo1ERL0Wo52AbqOZ4hnQEk
 TPaPgwNallu8ZLfFLAve7UWqQHy0OtdkPeJuDm94V8EOEtiN8lWrRfJxsenrwUVqg3dmt
 MXgppSiBQve4ym2GvnApsuKC1OoW+v7MPwIiNzyGxATZGBSyxRN8rCIXe/Amb9GZ542/d
 RAkqT9qt+0EClMAzgWftx4VNlb+w0FYlcAacghFyldJRHv9kv0Wi4x/1O6LucEtjIzjEG
 H1QLBNyqG44Nar4k2VBxreMQOqbzot69NaIekcFM5S9bXdAbiCDsVahRhZExftSzNqA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5001D60617
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:28:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F12269353B; Sat, 10 Oct 2026 20:27:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 22:28:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03e9ac7d9cc87f825b62208488abd40a4b7df175
X-Git-Newrev: d42fa9122749979e4e4226f85eca517fb64eb780
X-Patchwork-Hint: ignore
Message-Id: <20261010202707.F12269353B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: fix non-MMU build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d42fa9122749979e4e4226f85eca517fb64eb780
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped the
package from 2.40.2 to 2.41.1. This bump includes upstream commit
https://github.com/util-linux/util-linux/commit/a3f1255f1891ddbaf3bb6a32af28569c0e6f3b91
which was added to version 2.41 and includes the usage of
pthread_atfork() causing build errors on non-MMU platforms:

libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
libuuid/src/gen_uuid.c:629:17: error: implicit declaration of function
 'pthread_atfork'; did you mean 'pthread_join'?
 [-Wimplicit-function-declaration]
  629 |                 pthread_atfork(NULL, NULL, reset_uuidd_cache);

The oldest build error of this kind can be found on the 2025.11.x
branch with version 2.41.1:
https://autobuild.buildroot.net/results/87c/87c74435be14956fd45f730269eac102e70d56da/

The issue occurs because uClibc-ng is not very consistent with its
pthread_atfork() definition: it doesn't provide a prototype for it on
!MMU platforms (causing the build failure), but it does provide a stub
implementation (causing the configure script to believe pthread_atfork
is available). This issue was reported to upstream uClibc-ng at
https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/WEA7IQC3YAWTSFDHCLYRQJZTC4IUIY7J/.

A backport of this patch to the LTS branches should be considered, but
probably not 2025.02.x as it uses version 2.40.x.

Fixes:
https://autobuild.buildroot.org/results/a21e81e64eccc866b575a4f3b1376c50f2ffd837/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/util-linux/util-linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b4175024c4..807a9fb828 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -136,6 +136,11 @@ UTIL_LINUX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
 UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LINK_LIBS)"
 UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LINK_LIBS)"
 
+# pthread support uses pthread_atfork, which is not available on nommu
+ifeq ($(BR2_USE_MMU),)
+UTIL_LINUX_CONF_ENV += ac_cv_lib_pthread_pthread_atfork=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 UTIL_LINUX_DEPENDENCIES += libselinux
 UTIL_LINUX_CONF_OPTS += --with-selinux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
