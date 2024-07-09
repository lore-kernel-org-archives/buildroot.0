Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14B7C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 06:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88C27606C5;
	Tue,  9 Jul 2024 06:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id slXJrxT8HGDP; Tue,  9 Jul 2024 06:26:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91E6660744
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91E6660744;
	Tue,  9 Jul 2024 06:26:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B65171BF3EB
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 06:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2ED540191
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 06:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoiISp-L7t7s for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 06:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9C4E40181
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9C4E40181
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 06:26:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AC1D802CF; Tue,  9 Jul 2024 06:26:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 08:25:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d611acf8e9f9d598f001fec65c974b0c3f20a1f6
X-Git-Newrev: e954e12de2801d1471472239f8719a5f6428c212
X-Patchwork-Hint: ignore
Message-Id: <20240709062619.2AC1D802CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: enable engines support
 in libopenssl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e954e12de2801d1471472239f8719a5f6428c212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c08/c08c00f52b8f42fd408a1e84e41606d75558c3ce/

The embedded librdkafka copy unconditionally enables calls the (deprecated)
ENGINE_* logic in openssl:

https://github.com/confluentinc/librdkafka/blob/v2.4.0/src/rdkafka_conf.h#L37

Which are now no longer available in !BR2_PACKAGE_LIBOPENSSL_ENGINES builds
since commit 623d3bbe43 (package/libopenssl: no-engine), so enable it to fix
the build issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluent-bit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 53284ee17d..697cb1bf15 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_FLUENT_BIT
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES # needed by bundled librdkafka
 	select BR2_PACKAGE_LIBYAML
 	help
 	  Fast and Lightweight Logs and Metrics processor.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
