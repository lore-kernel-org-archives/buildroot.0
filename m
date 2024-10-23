Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65CECFA463
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D10DF4074B;
	Wed, 23 Oct 2024 19:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkHZXZ2LsMux; Wed, 23 Oct 2024 19:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED53940731
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED53940731;
	Wed, 23 Oct 2024 19:41:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A5CD4988
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 078D7608A1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuEFysHBMCcs for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3156608DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3156608DD
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:41:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9D7B863B9; Wed, 23 Oct 2024 19:41:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 21:25:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d17d1b6bde95d46376c4fe93e8ca1a1f9da6c179
X-Git-Newrev: 7b43e248180ad3b3dd1804687bc4457f29a88137
X-Patchwork-Hint: ignore
Message-Id: <20241023194103.A9D7B863B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: force shared build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b43e248180ad3b3dd1804687bc4457f29a88137
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We got following error with --enable-static:

checking whether to build static libraries... yes
configure: error: Static linking is not supported as it disables dlopen() and certain security features (e.g. RELRO, ASLR)

Fixes:

 http://autobuild.buildroot.org/results/b55/b553898381ff0fdf5dd705fbb11b469b7564c6e6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bind/bind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 217c9916fd..d594ab5e39 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -33,6 +33,7 @@ BIND_CONF_OPTS = \
 	--enable-epoll \
 	--disable-doh \
 	--disable-backtrace \
+	--disable-static \
 	--with-openssl=$(STAGING_DIR)/usr
 
 BIND_DEPENDENCIES = host-pkgconf libuv openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
