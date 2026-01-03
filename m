Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D627AFC6179
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 13:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE8E360AC8;
	Sat,  3 Jan 2026 13:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylp3gN5L8-YK; Sat,  3 Jan 2026 13:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5FFC6072F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767446819;
	bh=rLhK4T5qWf1UCooAJZZXr5xyxFA/dtkgmZPKVHNX4QQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bb8zQkuGkZyEyFWwrVXAcE/SUt+nU7S7bN/wV1QSyzmz4+hJnh/9SJlX1VDnqC2m9
	 KBuIA8RS0dBrD9chfLeTriYjtz76qqsmWtpuoW66LSiaULqpq4UNyDYru+niIbhS9x
	 vHzav3MOteqSCCWfMfWCqSuYEIrcCjriw6POjiZ/1Nw9G1OsAMjE2tg93cjkeTBYf3
	 VPxf0loyUe4xsDmQhOYNVAg3SuqcJD5nmuVOXu3Jb3B2FNhXObqlBrrFJFAm5vQB9+
	 Vd6ivXtHnEmIWH0Os4cnjTND0HMPNy6yrtCkRw6gz9cTfUlHNGidY5b5wrrbPFi2Js
	 3169MMX7UTibg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5FFC6072F;
	Sat,  3 Jan 2026 13:26:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62ACC440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 493CC40520
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvaS5i2cQJ6p for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 13:26:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D1274026C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D1274026C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D1274026C
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:26:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54C01A4C332D;
 Sat,  3 Jan 2026 14:25:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vc1dh-000000000rJ-3mKs;
 Sat, 03 Jan 2026 13:25:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Jan 2026 14:25:51 +0100
Message-ID: <20260103132552.3979708-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260103132552.3979708-1-bernd@kuhls.net>
References: <20260103132552.3979708-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767446759;
 bh=PbXYw0Q1a6UfiiLJsXqjppmSJYOyZ0p5EO8/7OauWn4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DGQb8vOzocBT3KoKiQlNu9ph9xUMa44XgiNtuzAWEdg2X7+7eCDXmfjizRM6J22P1
 nfPgtI0MiW/xeAc+ThLaZ/UPVqEIOgOw/7rIq4jRYziFieYb+7xEeM0ghW0Dvxh9TJ
 mgUMtR9iqpQCcsheCW1znsudZYKkOSAxbrRnxqb/63BRkb+v+xZoOr+i8Epy2Ne/Xh
 RiFokqb489ecjkxc2xojqrCUXuy40kUkXqkfQDAi/2jol4t1JvzIvMVwf873MIDrDw
 UxcAZSSfxf8ONXuPk7QMCuQOS10g0VvwcncwqNH5SMWPlxbvv9feex94VixLU4SHUQ
 YbB+f25gsCQZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=DGQb8vOz
Subject: [Buildroot] [PATCH v4 4/5] package/quota: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

Package quota requires libtirpc rpcdb option enabled with non-glibc
toolchains since the bump of libtirpc to version 1.3.7 with buildroot
commit 3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream
commit:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

These build errors, caused by the forementioned upstream commit, only
occur with non-glibc toolchains:
https://patchwork.yoctoproject.org/comment/30091/
"but I believe it breaks the build with musl"
as shown by our autobuilders:

https://autobuild.buildroot.net/?reason=quota-4.10

Fixes:
https://autobuild.buildroot.net/results/fb0/fb0adbb7687d8db4228e2fc1ce7a7272486fd3ef/
"svc_socket.c:(.text+0x2c): undefined reference to `getrpcbynumber'"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/quota/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quota/Config.in b/package/quota/Config.in
index 051a765570..0b7b5b8946 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	help
 	  Implementation of the disk quota system.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
