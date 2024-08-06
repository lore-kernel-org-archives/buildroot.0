Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41838C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 14:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCFE460837;
	Tue,  6 Aug 2024 14:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHcoynhvKpNW; Tue,  6 Aug 2024 14:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7E1D6084A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7E1D6084A;
	Tue,  6 Aug 2024 14:27:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3A71BF2B0
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 14:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7542F40362
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 14:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zg6gvG3HpRJL for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 14:27:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6100D40232
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6100D40232
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 14:27:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B07F8419D; Tue,  6 Aug 2024 14:27:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 15:50:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc7fb688b06fd67c7fff6dfea0fae33c740f9dbd
X-Git-Newrev: a05038831e7b35b7c0349b847ed9e95bceecbe1e
X-Patchwork-Hint: ignore
Message-Id: <20240806142728.4B07F8419D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: avoid cicular dependency on
 autoconf for host builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a05038831e7b35b7c0349b847ed9e95bceecbe1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

autoconf has an implicit dependency on HOST_XZ due to extracting a
tar.xz archive. By enabling XZ_AUTORECONF we create a reverse dependency
for xz on autoconf. This is fine for target builds, but it won't work
for host builds, as the two packages now depend on each other.

This problem only occurs if host tools are being built by Buildroot. If
the build relies on host tools provided by the distro, there is no
circular dependency problem.

Fixes:
4703a7ae9176 package/xz: fix musl static build

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xz/xz.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 9fb93ff4d6..3329d302ef 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -68,5 +68,14 @@ HOST_XZ_CONF_ENV = \
 	CC="$(HOSTCC_NOCCACHE)" \
 	CXX="$(HOSTCXX_NOCCACHE)"
 
+# We need to prevent XZ_AUTORECONF for host builds or we end up with a
+# circular dependency. Since the autoconf build needs to extract a
+# tar.xz archive, autoconf has an implicit dependency on HOST_XZ. By
+# enabling XZ_AUTORECONF we also make host-xz depend on autoconf,
+# which we can't do. It is also not necessary as we're autoreconfuring
+# the target package to fix static build with musl, which is
+# irrelevant for the host package.
+HOST_XZ_AUTORECONF = NO
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
