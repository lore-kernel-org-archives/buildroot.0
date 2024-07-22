Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51973C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 13:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 151CF402B9;
	Mon, 22 Jul 2024 13:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XU4DEHdquf5C; Mon, 22 Jul 2024 13:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B47C5402BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B47C5402BB;
	Mon, 22 Jul 2024 13:39:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E60521BF2A3
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3185408C1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCg-tzx9CkbF for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 13:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7A2D408BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7A2D408BF
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 13:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC1A687042; Mon, 22 Jul 2024 13:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 15:15:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41cc0f22722e3fbb2581a4f399c2e304fdb061a1
X-Git-Newrev: 4e4554eeb76e8b516c6cbcd66f15868492aac594
X-Patchwork-Hint: ignore
Message-Id: <20240722133917.AC1A687042@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luvi: needs engine support in
 OpenSSL
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e4554eeb76e8b516c6cbcd66f15868492aac594
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When OpenSSL support is enabled, luvi needs the engine support,
otherwise it fails with:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-none-linux-gnu/13.2.1/../../../../aarch64_be-none-linux-gnu/bin/ld: liblua_openssl.a(pkey.c.o): in function `openssl_pkey_set_engine':
pkey.c:(.text+0xac0): undefined reference to `ENGINE_get_DH'
/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-none-linux-gnu/13.2.1/../../../../aarch64_be-none-linux-gnu/bin/ld: pkey.c:(.text+0xaf4): undefined reference to `ENGINE_get_EC'
/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-none-linux-gnu/13.2.1/../../../../aarch64_be-none-linux-gnu/bin/ld: pkey.c:(.text+0xb20): undefined reference to `ENGINE_get_DSA'
/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-none-linux-gnu/13.2.1/../../../../aarch64_be-none-linux-gnu/bin/ld: pkey.c:(.text+0xb4c): undefined reference to `ENGINE_get_RSA'
collect2: error: ld returned 1 exit status

Fixes:

  http://autobuild.buildroot.net/results/722c767985d75b82baec8c3ac55f8eaf1ed6d07b/
  https://gitlab.com/buildroot.org/buildroot/-/jobs/7391793024

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luvi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luvi/Config.in b/package/luvi/Config.in
index 3a724acebb..19d3307f12 100644
--- a/package/luvi/Config.in
+++ b/package/luvi/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_LUVI
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LUV
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  A project in-between luv and luvit. The goal of this is to
 	  make building luvit and derivatives much easier.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
