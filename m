Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F8EFC9EEB
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 298F0840BC;
	Sat,  7 Mar 2026 10:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ppwyqw3yr4b; Sat,  7 Mar 2026 10:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DC5984062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772879713;
	bh=1sFIsYBSmDZ6QLYHfBDt6fJPIyHQbSRrhx/NkqqraFA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nCXs930kzMN+/YGsLGJObnqLWBjZkeS7cWB582PVkqCjL7tAmNHZgzs5D6PeEqaj9
	 9S4Cc1DI/DjigfXEIj1dhaSPW9/UuXEkDsfJAks+FiNaM0Rhvd0GD7HRhJuFP2+S8H
	 jHltwssnhB8KL5qy9vwX3aAUsOaLgKGkNfJ/RXZBIdeQqXNbgnYr0hYQSGw+MfGlmp
	 CiHKxGtsge6Qf3eV/P+evV0gbAY24bb8a4hx8S9ubdPjGuitsNBr6ryNf4jINhNj2u
	 0nqx/iQSb6/thPqZB0LhFLYuKWlcwBffEqFjh32N0y8xXRxW4bxRjrt2F/qgUjvFkA
	 h3q8kjh+Q57MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DC5984062;
	Sat,  7 Mar 2026 10:35:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A5525B
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC568409F2
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzAon_eFp-1L for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F55B40068
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F55B40068
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13C4C85018; Sat,  7 Mar 2026 10:35:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 11:33:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7e8b0d2375ae70605e02426ab3d9ed9b10b82cb
X-Git-Newrev: 2e6c4f0888fb926c63e41e18ec2bdabafa8390be
X-Patchwork-Hint: ignore
Message-Id: <20260307103511.13C4C85018@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnfs: fix build without libkrb5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e6c4f0888fb926c63e41e18ec2bdabafa8390be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit a035a0f99fa3bbeca776d741bbdeb6c04b3b35c8 bumped the
package to 6.0.2 which includes upstream commit
https://github.com/sahlberg/libnfs/commit/e806051f400d6f98dac08c04cff7c2219e9abf63
that adds optional support for libkrb5, enabled by default.

When building without libkrb5 we need to disable its support to avoid
a configure error:

  configure: Build with gssapi_krb5 support
  checking for gssapi/gssapi.h... no
  configure: error: You need gssapi development files to compile libsmb2.

Fixes:
https://autobuild.buildroot.net/results/166/166fb283ef8830930ce191b4418d01e6c82176f5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnfs/libnfs.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 4ba6690951..12afb7c697 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -16,6 +16,13 @@ ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBNFS_DEPENDENCIES += gnutls
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+LIBNFS_CONF_OPTS += --with-libkrb5
+LIBNFS_DEPENDENCIES += libkrb5
+else
+LIBNFS_CONF_OPTS += --without-libkrb5
+endif
+
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LIBNFS_DEPENDENCIES += libtirpc
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
