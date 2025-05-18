Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD79C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37616849AD;
	Mon, 19 May 2025 11:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2RBVAwIQ0A9; Mon, 19 May 2025 11:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 636F4849AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636F4849AA;
	Mon, 19 May 2025 11:04:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19641E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 068A341E44
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BYyfhtXeI84 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23BBB4203C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23BBB4203C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2227881E90; Mon, 19 May 2025 10:40:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 11:53:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b98e2ce2c54c228c13d5ac50168fc4fa66fc15e
X-Git-Newrev: 7acb00cc1ada4a59d7a755922fa78e264cea9254
X-Patchwork-Hint: ignore
Message-Id: <20250519104009.2227881E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dhrystone: fix builds
 with GCC 15
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
Content-Type: multipart/mixed; boundary="===============3101817915730762676=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3101817915730762676==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7acb00cc1ada4a59d7a755922fa78e264cea9254
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

GCC 15 defaults to -std=gnu23, which handles function declarations without
parameters differently from earlier C standards leading to compilation
errors:

dhry_1.c: In function ‘main’:
dhry_1.c:176:19: error: too many arguments to function ‘Func_2’; expected 0, have 2
  176 |     Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);

https://gcc.gnu.org/gcc-15/porting_to.html#c23-fn-decls-without-parameters

As a workaround, force the build to use -std=gnu99 mode.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dhrystone/dhrystone.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index d54c8d94e8..f00553d566 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -14,7 +14,7 @@ define DHRYSTONE_EXTRACT_CMDS
 endef
 
 define DHRYSTONE_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=gnu99" $(MAKE) -C $(@D)
 endef
 
 define DHRYSTONE_INSTALL_TARGET_CMDS

--===============3101817915730762676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3101817915730762676==--
