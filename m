Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6D7F99C60
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 19:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C43CC81E95;
	Fri, 17 Apr 2026 19:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ye9NdXvSfV8C; Fri, 17 Apr 2026 19:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5430681EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776455867;
	bh=u1K8/ucp7E8ezYujTKSTHE6pL058+a0aQKC9qDoN/Yo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W42qEiWzMrCWVWLShLOmO5DVMLENdy8kHZkbexa9+Iv4kfo8wkbtRo3rmVzYZpnc1
	 Tny5zfBuwB9QPgq6tb/keNf1rAm427FDM7k/QhEmxeQBcLXEIkqjeVMTdwbceHhykp
	 CawVeuct33XRjp36KAewD2OAy95UQUeFbNjC3yHJ9/Rhm7g4e5pc2VgApcJrrE6+3q
	 xFBjWE+xNeDFMjHVnKPEGoTtzg1CQlQ+8qALJ8VznMKD9+ebN09Axzg5KvB2V3o7Ew
	 Uu11r741aWP1HF4ze5qEvtvIraDLBlYezIJi8cqBkN6sQK7WfbI/xK3djKlAcZonuu
	 rRe2EyF8zyYKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5430681EA0;
	Fri, 17 Apr 2026 19:57:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DB2D4E0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B82B60F47
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7qEIyqvZjVQ for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 19:57:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A4E960F46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A4E960F46
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:57:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3340081E35; Fri, 17 Apr 2026 19:57:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 21:35:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a818f62fa05c734599b5aca53b6d8d4626ce6f88
X-Git-Newrev: 2965d8af98ef9e881c8d76f076d44a9b68956674
X-Patchwork-Hint: ignore
Message-Id: <20260417195743.3340081E35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ghostscript: Fix brotli build
 failure on ARMv7
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2965d8af98ef9e881c8d76f076d44a9b68956674
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/9e3/9e3435752d50ed3db55b0ff03e412bf42728f73a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ghostscript/0002-brotli.patch | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/ghostscript/0002-brotli.patch b/package/ghostscript/0002-brotli.patch
new file mode 100644
index 0000000000..55915cfef3
--- /dev/null
+++ b/package/ghostscript/0002-brotli.patch
@@ -0,0 +1,29 @@
+Fix brotli build failure in ghostscript 10.06.0 on ARMv7
+
+Downloaded from https://bugs.ghostscript.com/show_bug.cgi?id=708831
+
+Upstream: https://github.com/google/brotli/issues/1415
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff --git a/brotli/c/dec/decode.c b/brotli/c/dec/decode.c
+index f8d550cf4c..07da1fb44e 100644
+--- a/brotli/c/dec/decode.c
++++ b/brotli/c/dec/decode.c
+@@ -436,11 +436,12 @@ static BROTLI_INLINE void PreloadSymbol(int safe,
+                                         brotli_reg_t* value) {
+   if (safe) {
+     return;
++  } else {
++    BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
++    BROTLI_HC_ADJUST_TABLE_INDEX(table, BrotliGetBits(br, HUFFMAN_TABLE_BITS));
++    *bits = BROTLI_HC_FAST_LOAD_BITS(table);
++    *value = BROTLI_HC_FAST_LOAD_VALUE(table);
+   }
+-  BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
+-  BROTLI_HC_ADJUST_TABLE_INDEX(table, BrotliGetBits(br, HUFFMAN_TABLE_BITS));
+-  *bits = BROTLI_HC_FAST_LOAD_BITS(table);
+-  *value = BROTLI_HC_FAST_LOAD_VALUE(table);
+ }
+ 
+ /* Decodes the next Huffman code using data prepared by PreloadSymbol.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
