Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B8BD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C31AC60BFB;
	Tue, 13 Jan 2026 19:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsIGSZ0iX_1D; Tue, 13 Jan 2026 19:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B40760BE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768332991;
	bh=KZrdBjnUdk59W8BnebAI+z5B5GNgDkAOocKeK9DzVZ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XBq+Rxtw79zOinmH561bwQOun/x6EVBj+UDIzeH0xvakZcm5IET0CscJ3QqWfg3wC
	 KB9TwF+jwgancrQ7WgLuU/G7hQWGwZYAsC3idd44ev4LkXqvDYqNQKnRdWByeiVlzl
	 zhrQD0dtT7SQxrSduSHnlsaZLiW75fYc3dRkKq2OlVkmsp5trsWHG5vG1TJQFSi/3R
	 /X5301TeD2qmMvZ7QYsF4o4WGiC8Yuo/ScYhPY+pssRnL++Ff0leJ8HfJdRvvWCrGp
	 88bQyh9tZnN+KVF0KBn1SR9O1npuiNTXtXUvP0YJNa/OAILU9cMkEuA0yUL/ldtKwl
	 19YNVcj7uJzDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B40760BE6;
	Tue, 13 Jan 2026 19:36:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11FC01C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 424EB40541
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z23WUuoe_Fhp for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E96964037A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E96964037A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D985B8854B; Tue, 13 Jan 2026 19:36:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:00:32 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dbdae1cda2e5136fe4d820b1e002c320834ba191
X-Git-Newrev: 4374b541aa4937dee4d57f8fad5a4a8f84c56593
X-Patchwork-Hint: ignore
Message-Id: <20260113193616.D985B8854B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] packages/linux-tools:
 perf: enforce PKG_CONFIG_LIBDIR
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4183413791397267372=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4183413791397267372==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4374b541aa4937dee4d57f8fad5a4a8f84c56593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For kernel patched with 440cf77625e3 ("perf: build: Setup
PKG_CONFIG_LIBDIR for cross compilation"), if neither PKG_CONFIG_LIBDIR,
PKG_CONFIG_PATH nor PKG_CONFIG_SYSROOT_DIR are provided, the perf
Makefile while try to set some default value for PKG_CONFIG_LIBDIR,
which will not point correctly to buildroot staging directory. This
issue will lead for example to a failure to find libtraceevent even
if it is correctly enabled and installed in the staging dir, and so it
will make perf fail to build.

Make sure to call the perf make command with PKG_CONFIG_LIBDIR variable
set and pointing to buildroot staging area to make sure to properly
detect perf dependencies.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f784c823ef8357aa36828342f83d5fd59995937e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linux-tools/linux-tool-perf.mk.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 1e19ee7f1c..3238948d76 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -23,6 +23,7 @@ PERF_MAKE_FLAGS = \
 	JOBS=$(PARALLEL_JOBS) \
 	ARCH=$(PERF_ARCH) \
 	DESTDIR=$(TARGET_DIR) \
+	PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	prefix=/usr \
 	NO_GTK2=1 \
 	NO_LIBPERL=1 \

--===============4183413791397267372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4183413791397267372==--
