Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D20AC2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09C2B60673;
	Sun,  4 Jan 2026 10:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xVUHFbVZa2l; Sun,  4 Jan 2026 10:12:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88E4B60716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767521533;
	bh=yYB6N/maHk163aV5OwJdQYfCFPBL3RIhOogIqQbnbpE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e3jAVr7pyj8j41K53s+MsbZTpkhEy6RGbcv3MJGxVgx840DC2EJ//x3Bpk7rCkpDX
	 LhGNbJKZ8DqPHZgjkOihxaxe9FdgHPKLIL8TUdCKmDyUSUagYkUQkE6xjwzkjEsXmY
	 YAeqJuDu4IHEZy7U4xv+hyW0k5xmEuMRkMKmyyn4QNYqc4faKWhQZUgCZItf6ee/ly
	 ED7p+7l4FeheagTUP6/fniAOn68zmuh1ylIVd2YHWAIH4FXdSQvL6GjdMWTO+lL/x+
	 NudFIQJSkOjMoihWQjrMzsR0RfFSHr1dkRri4KAmB32IEXE7hL5ZaqTJIaubjCftLJ
	 ph6rZNR+cCxVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E4B60716;
	Sun,  4 Jan 2026 10:12:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF9042DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5DF080E05
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWiOwfDT6lz3 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:12:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FC5680DFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FC5680DFE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FC5680DFE
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:12:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62561A4C3142;
 Sun,  4 Jan 2026 11:12:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44732)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vcL5h-000000008V7-3GlJ;
 Sun, 04 Jan 2026 10:12:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Sun,  4 Jan 2026 11:12:05 +0100
Message-ID: <20260104101205.1381959-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767521526;
 bh=jLA77EjaIAYX9UId9iLSO/Ws+CT0LFXjHmynzXxX3eQ=;
 h=From:To:Cc:Subject:Date:From;
 b=HWREybQmtBiJefUW+c+BtoqB8ctWQZ9q31HuCIu1NjGDnJKfkE2eD4I84/8A1qwN7
 GYh+k2roxipPQ2l4ZPf/tv0mTsQjHn7xjrI6UGtbNwjwlvey+T7oJasUcgSTxZeSlK
 HNEcie472Mwx1pPxBUBFkxv4TdA6SABwN+NqGvir+JrPqMC4PUCOE3/lgtmy/e7hc4
 7ZyoA/EiKb3R2rZVo//r9sbQMYAN6eOEEArGepnFZGGQidjLZK45YoUdbSmO6NiLkx
 bSD20btdIyIXEgiSrhL5TibiJSPLZbuUUayJPeGvQo1ddf5omcCd0vtTb9KowoWnrj
 RYo68BqYmOaRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=HWREybQm
Subject: [Buildroot] [PATCH 1/1] package/babeltrace2: needs C++
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

Buildroot commit cea219e5180e7117a6002c4a784995c9dad48176 bumped the
package to version 2.1.2.
Upstream added a mandatory dependency to c++ in version 2.1.0:
https://github.com/efficios/babeltrace/commit/c20049fd0678f462f621c80f9e91c1ba16e6b656

Fixes:
https://autobuild.buildroot.net/results/a18/a18f8a5561536d0ae649d73e5871d9a7f88275db/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/babeltrace2/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/babeltrace2/Config.in b/package/babeltrace2/Config.in
index a020d4a7cd..f8db47b354 100644
--- a/package/babeltrace2/Config.in
+++ b/package/babeltrace2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BABELTRACE2
 	bool "babeltrace2"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
@@ -24,6 +25,7 @@ config BR2_PACKAGE_BABELTRACE2
 
 	  https://babeltrace.org/
 
-comment "babeltrace2 needs a toolchain w/ wchar, threads"
+comment "babeltrace2 needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
