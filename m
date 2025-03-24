Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA733C36005
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 12:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87B7D81FE9;
	Mon, 24 Mar 2025 12:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dV_ekq0Z0w7n; Mon, 24 Mar 2025 12:21:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AFC881FC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AFC881FC7;
	Mon, 24 Mar 2025 12:21:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C372D5E
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 12:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA26360BB0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 12:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kz_Pu6pYyA2x for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 12:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC3AE60826
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC3AE60826
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 12:21:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7F12882E6; Mon, 24 Mar 2025 12:21:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 11:05:09 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cf0f2ae539fceb9fa69fe602460a9831b57a6e4a
X-Git-Newrev: 2c20dbc8f8823ab99826ecd21b17dd1fddcdd6eb
X-Patchwork-Hint: ignore
Message-Id: <20250324122132.E7F12882E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/fio: explicitly
 control libnfs dependency
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
Content-Type: multipart/mixed; boundary="===============2655099723618734922=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2655099723618734922==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2c20dbc8f8823ab99826ecd21b17dd1fddcdd6eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The upstream uses pkg-config to detect and enable libnfs usage if it
is found [1]. This can get confused by the host configuration so at the
least we should disable detection if we are not planning to build with
it.

Note: the fio configure script accept both --enable-libnfs
and --disable-libnfs since upstream commit [2], first included
in fio v3.31. In Buildroot, this is supported since [3].

[1] https://github.com/axboe/fio/blob/fio-3.38/configure#L2360
[2] https://github.com/axboe/fio/commit/98ab12629c6a98fb53e28a4a70f53ce594cca858
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/256395d8e5e7258df830dc19b47dc9ef19e48535

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[Julien: add extra info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fc690631caa3f061adc22c1f7dc4def226a80194)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fio/fio.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index f6e7b036bb..f90643cfd1 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -16,7 +16,10 @@ FIO_DEPENDENCIES += libaio
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNFS),y)
-FIO_DEPENDENCIES += libnfs
+FIO_OPTS += --enable-libnfs
+FIO_DEPENDENCIES += host-pkgconf libnfs
+else
+FIO_OPTS += --disable-libnfs
 endif
 
 ifeq ($(BR2_PACKAGE_LIBISCSI),y)

--===============2655099723618734922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2655099723618734922==--
