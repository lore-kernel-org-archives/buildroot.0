Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7E7CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BEFB6139E;
	Fri, 16 Oct 2026 13:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNUbbGOlalHX; Fri, 16 Oct 2026 13:13:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E9CED613DD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156426;
	b=BlP+86iEgsb3tvCpE/ttxRYGm/vUBXEVFBe2PGFwFqziRW7+QGBKWFIa3MNpvDrvYWGk
	 +uNIxb1HJnpE/YOVmQRLWvBT3JDlVcvRkNkjJSRHHE1ZWnuHzaw9nvfyM4yeLlvwA3VLG
	 e7RJ3gDkgjdMKqspLUI4DP78E97gtNTqBelFhQNJtpPg1zmA2lfYKKFNBGY42yekzoVZL
	 39wrKYf3wAnV7nqIGyecmqrkvRCpUnbA5D60WVwKqP6iquENr3VBaDwJG8VRxn8A2d97V
	 +NNaY3cXC5gcNnH5HrabXGNfb0/FeaOoey0mgca+sUpvysIwrZQ379Bk79jiwSH34mQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156426;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ZqqiTVtNabPM+xa/UueZfqS5pydDbNvk4cYfWFA6b8o=;
	b=O06NHfMBYkQfsi0tighXW8zqGESzGv5kgTRzzCjxf5RNtxGKJ8TIwRA2ogL5DKgfsyHY
	 9m2KHKj8Fiw1TfdRaHZcGM9BLadTlC/mGkW6iHYgz6Gfr2xspRiq3BqyLF+0jwGNsvlie
	 akPO5Lw4RL9NloNSyYdQWqxqLtt+CbtrE6mtdzAVA/VSu/cNbkVqoWHh+SiRu2W2ukqPT
	 0T/mgArtzKv8iUPofhTgzVSGGBQ7bWEFSTq5nFqslZvGV1FuPgVw9vCxHqZea9xcJyP6K
	 PtwBhireFv33h+zYXObEX2txuwNcNQNy4uWqSd9+vEj1scbhKdsNjgb5WbvUUY/Ikow==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156426;
	bh=ZqqiTVtNabPM+xa/UueZfqS5pydDbNvk4cYfWFA6b8o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rFjfvmsYu+MjrF4tl0mmMrq2zO8Heut70t5urcBUW22e2Q2AgMeqeEohTIzwyoZnv
	 CI1heios4Dz873ypCut33B413SBvf0gXGt46SLR1aWcJjXbP42xL/xcuUHJU7e18fm
	 71OzUdpQzGSSt1hsQjVnAASdfuvlBCpgeg5hTQKBQWirqxtTHcsyTmwHu0OjAkk2ye
	 puX9XEQsVwKGXQQIGLJV+PxW0+//D4FKphAkcqxpcYvBSPkZOiOxniwJj/hvTukVxK
	 ZKjvTsG7n4Ikc4d18rXlQ4nbcFWgnahbrvWNSGzyWHo9tiF011UmOUj4wibp5zzp0Z
	 f3S+ufPBFKbRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9CED613DD;
	Fri, 16 Oct 2026 13:13:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC48D920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBBAE60F1D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzXGXtihb7zj for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1A95260F54
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=mm7ca4Cvi/ik/vlArKOqPyhJb7MyvtaPhV2F+P5DblctpGeDsv/6RB1Vt5Tps43ts9T7
 T4mPuNUxJ9lEXOfhCk+A1o2fl4WufYrubyTaeFBnWyYUltfLyEujU/3vVtPfDh0zt/a3l
 FeBeF+qLvg3rxTxFhoz4EmB9ckOz2pNV4by9C2FBWNjeBV16tod4YzxPbmkKpwnHguRob
 dZR5xxcZUImtWmcpeMqkjHOMyqAwvbqPhV2qOxFY+QytGh6nONrxkthdGpViHdeIUs2ip
 Cj0tn8JC9hvc//qoYV8JQvD5s3hiI8hKgokpoU9mD9qRNNDLutoreQE5imGF8qUU8BA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7WyFPtcpu5WHj4Ge+8qdXV79sJzUbqMpEZxiZVvRUuc=;
 b=Zgj1pj9HSL0I/Ba1Q7M3fdterWrbWP7eucEd96QOxfXYeNDTzgabXUd4JsQ04xvOhe4k
 YNAceKhdmnIossSqL2+5t5pa9UQKOwo8hIvf72hurrrRyWpLVjax0SLzU93pgZ4jlSPct
 pKsVcE3YlBQoQDLY0R/tfoeWtjb++lOhYI9uGxDkhlt51ZyCMpOcPPClgYlwIq2q3cT2l
 EVokhY8uxn0ax0b4ZyeqeNCU4BDdqOHJIr/yw9GyS6ekAylL3z/jQasTYM1mHOHP8KaRn
 dqAkq9BX0UUGIsMxAWEJK5zyqXV/hEDo6xh579KRZLCjKMsgAAvMyE4XNeo0Q4LuS/Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A95260F54
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A8E1960CB; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:46:05 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a682d7e1aaa650c42a8505538118c6ae250e2b08
X-Git-Newrev: 949aebfaa6b03aa1cb795c5626895fdf9c4b037f
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.0A8E1960CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/checkpackagelib:
 remove unused variable
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8320014640856565257=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8320014640856565257==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/949aebfaa6b03aa1cb795c5626895fdf9c4b037f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The `self.pending_patch` is set but unused.

Fixes: b00ac4e346 utils/checkpackagelib: add new check MissingCVEPatch
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 3ac595bdd199a2abfaf792cc5ce33d08fa9cd63a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/checkpackagelib/lib_mk.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index eb5fbf474c..065733d464 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -130,7 +130,6 @@ class MissingCVEPatch(_CheckFunction):
     def check_patch_files(self):
         for patch_lineno, patch_name, patch_text in self.pending_patches:
             patch_file = self.package_dir / patch_name
-            self.pending_patch = None
 
             if not patch_file.is_file():
                 return ["{}:{}: patch file '{}' mentioned for ignored CVEs is missing"

--===============8320014640856565257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8320014640856565257==--
