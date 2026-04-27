Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B259FF8850
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 06:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83BA88538A;
	Mon, 27 Apr 2026 06:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUsSYAieQLQH; Mon, 27 Apr 2026 06:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E0FC85386
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777270184;
	bh=aFrXe9el7MW+TiGLsskJpaT8QTc/RozyWmov/4DddcM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pHs/P9/oQ/B/KkTF8QhOA/lBM+PgWz4Qd05iNxYeXT/KO9Y5VDLLOxsq9Uqc+8jbJ
	 BDakuQcwIS4MX/JQrsJ2fWKmGWtEhw9DqjEwFPiqtQLLpcfxCwuyKltCf13QNhJfzW
	 xKganOurQqQHEomrcbFXJEWW4KrRIYEKtJUztOp9JvKkgW1uHaSc9FyRoLBQdk6K2J
	 zx0oxpkz4TJB1GtkefKKlCcCxIFp7YuZV5SS+h8Zqh01n2PREap05lHOQ4ZOZYvDee
	 0mFKqkUjSHXgSubSbgBXzz0MpIyoAL1bGqZMUJqpd5ULDAfmHYLz96pI0a90gQhLrp
	 OOWvHENBE85eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E0FC85386;
	Mon, 27 Apr 2026 06:09:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C9719231
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF6EA4256E
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYM1n50hT6oE for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 06:09:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BB52400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BB52400B8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BB52400B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 06:09:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6C0BA4C084C;
 Mon, 27 Apr 2026 08:09:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45632)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wHFA3-000000008Ja-49k6;
 Mon, 27 Apr 2026 06:09:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 27 Apr 2026 08:09:40 +0200
Message-ID: <20260427060940.267367-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777270180;
 bh=EP6qx0YYuJvjRn92/qYJKfEp+++XraKr4jtSNGt4Pwc=;
 h=From:To:Cc:Subject:Date:From;
 b=HxXZyZ1bYZ52rtEcO6A3/WudrXegep6RKP60vbZBYGgOOnmQta/fSYIyHzE2oNbWl
 G/iH4JRx57bJvGDdsccEmL6WKY1Uq59YQXevso1bJSXd6oLYgGqQV5hvznvFnFsJIr
 rUDEXkn5DZXjOZ+JaSanC9bLiJwb3RylcU9NRKSzS2RyUEM6pCPYp+1iD2G5GxFroo
 S8/dEim6TtKROOhrSwkP3JhwaH64BQecgqP3vxDVmmYe+E0h1+Pux7vtgbxJoun+cP
 nVFlJznRqxKIRSlQUyuOxWQL8pOFP23o5HcwyACOS3DgPkTy921JqqUPYb2CLvxKvb
 ksoAewg63M8pA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HxXZyZ1b
Subject: [Buildroot] [PATCH v2 1/1] package/lcms2: security bump version to
 2.19
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://littlecms.com/blog/2026/04/17/lcms2-2.19/
https://github.com/mm2/Little-CMS/blob/lcms2.19/ChangeLog

Fixes CVE-2026-41254:
https://security-tracker.debian.org/tracker/CVE-2026-41254

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added CVE info

 package/lcms2/lcms2.hash | 8 ++++----
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index e2277ba610..0ff881158f 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.18
-sha1  3917db04b8d19b62ea6c9d8f4ff0404d145aca4a  lcms2-2.18.tar.gz
-# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.18
-sha256  ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347  lcms2-2.18.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.19
+sha1  bedb39ede32b76bc2cb24ee531d7433cf787b319  lcms2-2.19.tar.gz
+# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.19
+sha256  49e7e134e4299733dd0eda434fa468997a28ab3d33fa397c642b03644f552216  lcms2-2.19.tar.gz
 # Locally computed:
 sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 4ffad41014..32a78a4f35 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.18
+LCMS2_VERSION = 2.19
 LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
