Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E70C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 14:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BC7380E48;
	Sun, 18 Aug 2024 14:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zKkwJp9jlLk; Sun, 18 Aug 2024 14:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D68B80E49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D68B80E49;
	Sun, 18 Aug 2024 14:53:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A756B1BF3E1
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 14:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F94280E49
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 14:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjYAEWRlz2x0 for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 14:53:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADE2080E48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADE2080E48
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADE2080E48
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 14:53:37 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id F10F53536302; Sun, 18 Aug 2024 16:53:33 +0200 (CEST)
Date: Sun, 18 Aug 2024 16:53:33 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsIK7ZE/nzzxu4ab@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723992814; bh=zu9Qc9mWLPKm3d2x9NrQcGR7Cqz1ex8FjWbguGMMJzo=;
 h=Date:From:To:Subject:From;
 b=A+Wcarlko4oY6yrUBuEK2TjChYzs/fExIqG1cXKelvPgrFcVkGtoocXvR+Jw7+w9A
 84LbIqdLAuGewgrTxgbHGU6+geIGy0QfgLnytl0tNPwRqgpeC+AlMpFV4VtBNWxZqB
 w36Gh8W7vhUnTsa2xWDnQeqgg0ZCNx+gOwXnExM/lMyq0P1Dk4BGIAtER351pEmMyy
 e5jxhbR4ZGiCbbFA7E76/rcyk5wMVjSoxVmyfs91dZH1z5zxCMfLhScCTA1XcZaFuo
 ZqDlBy3hg/zMe9FXNOMb/y0LUewMrQWJ0bChAku49GtFgGsnfMeI0ZMASGZfEbZNA2
 X2lRzXlakB1Lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=A+Wcarlk
Subject: [Buildroot] [PATCH next] package/libssh: update to 0.11.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For a changelog see here:
https://www.libssh.org/2024/08/08/libssh-0-11-0-release/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libssh/libssh.hash | 6 +++---
 package/libssh/libssh.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index e5eba219b5..2931c8357d 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.10/libssh-0.10.6.tar.xz.asc
-# with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256  1861d498f5b6f1741b6abc73e608478491edcf9c9d4b6630eef6e74596de9dc1  libssh-0.10.6.tar.xz
+# https://www.libssh.org/files/0.11/libssh-0.11.0.tar.xz.asc
+# with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
+sha256  860e814579e7606f3fc3db98c5807bef2ab60f793ec871d81bcd23acdcdd3e91  libssh-0.11.0.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 8b995c3555..932ab2de83 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSSH_VERSION_MAJOR = 0.10
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).6
+LIBSSH_VERSION_MAJOR = 0.11
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).0
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
