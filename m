Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AC8CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 136F885707;
	Tue,  9 Jun 2026 13:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7l6QEBUVCoj; Tue,  9 Jun 2026 13:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EBEE856E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010126;
	bh=YPTNy9aPb+/op5sUVxzCtdv9xkB5+d+9RsbkMvdnqec=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AdDOzk66GyYXPsteYbSUX/0yvisfw4N3k5tR2VV4LA4levCz6wB8R6C5/D8/twnjG
	 zLUfKejO38jJ2mYKZmqmyNt5dcoxsEQVELBUBTMhhSYbjaF9JL9nfbpnFueVwTtlvR
	 gSvge2ikDCQazsFZY/e7+dGIHMefn1EAk3jBazV9JDRvsrziMlkmUlCLVYRVJdB7jo
	 v6mOZEywHic51vPzPDi1rUCDJGvDH3tJjR0/Jl+Rezu/oX9DBVdT43XFV1ZwZ7MUwD
	 GpZV1dB48D2cggtyHchxpUmLGj8C7d9JxbF6S6nhPgyP+CZijTd8iB8RY9TLfjYoPH
	 Q3CrEU0LWbvuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EBEE856E8;
	Tue,  9 Jun 2026 13:02:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93208196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 853EA455DD
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IzbzSwKpVnp for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D503411F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D503411F2
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D544A87E8F; Tue,  9 Jun 2026 13:01:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 21:09:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a1fc8176e4808551f9501f0ed8b5745deb28e59
X-Git-Newrev: 418ee5a2b6cce22bfa9560ca0289fce728a2bde0
X-Patchwork-Hint: ignore
Message-Id: <20260609130116.D544A87E8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: Only run depmod during the finalize
 hook
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/418ee5a2b6cce22bfa9560ca0289fce728a2bde0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 82e765640095 ("linux: Allow modprobe for out-of-tre modules") added
support for running depmod as part of the target finalize hook.

However, it also originally set DEPMOD to /dev/null, a hunk that was
removed upon apply. The kernel depmod wrapper script uses `command` to
verify that whatever is passed into DEPMOD is known to the shell.
These days if the DEPMOD tool is set to something incorrect the depmod
script will just warn [1], but there are trees where the depmod script will
stop with a hard error. [2]

Running depmod as part of out-of-tree module installations causes
unnecessary files to be generated and installed.

Since we're already running depmod in the finalize hook, stub this call to
`true` as it's definitely a shell callable, and it will always succeed.
This is what is done for other packaging scripts in the kernel tree. [3]

Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/depmod.sh?id=914b087ff9e0e9a399a4927fa30793064afc0178 [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/depmod.sh?id=934193a654c1f4d0643ddbf4b2529b508cae926e [2]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/package/PKGBUILD?id=8bdd53e066012bed431667393676d1b5e8cce153#n70 [3]
Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c61089bfe0..3c7ebe7e9a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -164,7 +164,7 @@ LINUX_MAKE_FLAGS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	WERROR=0 \
 	REGENERATE_PARSERS=1 \
-	DEPMOD=$(HOST_DIR)/sbin/depmod
+	DEPMOD=true
 
 ifeq ($(BR2_REPRODUCIBLE),y)
 LINUX_MAKE_ENV += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
