Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2873CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E8860BCE;
	Fri, 16 Oct 2026 13:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIShKaf4l8Pf; Fri, 16 Oct 2026 13:10:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3CEAC60FF1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156240;
	b=fr49sL78tIWMZCmOqIbvr9jjweERUS3ya5VB21+iVInHY8CFVz+3qJNAEVHGOZ2VoLJW
	 038tVOJiSklnJhB5bT5YOCtDou9Zfy6PqrMSsITVgEa07ii0oaQb1byDcP0Ksdgs83DAx
	 edoBOrMj8i1YkC47DEHmnFBC8fMtDbPn4FqeJpYkikHPy2a/pDHR6JlBoZkAL6cUDxZnT
	 tQ6Z8azYs3WCP5MvNvvGhgruJGHVi5OU+rYH/bIfpzdZL4ltfNzzkRYYPBjqdnBNnyxwx
	 fmyVSYYzNaopoqJpRBr4YYmkbnyjTXcj08cW4l3U+/9CfPvSlOV+G3JOPa6bQAu0LqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156240;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=x0lQnWHHZrcsESc1KrA1juqmxinmGrsOPl8n40MaIJI=;
	b=hG1b57e+aP5LgfxXMgYJUiFEtvZ63T0c0/8yskyK2zZa0M7AgQTst4RLpIxZAV6FxFGH
	 FFqY4FRSSvvrKni2/uW1XrCwiBf4O/7njBCKyjwTmVg71XimYqBzL2B7PutNVcWC+PHiy
	 cpgDNn9bS0hAjZu+AElg/iZbMtyguLVMrmXp8nxkse0CORYd+cG3xb4hmJju8nklKtGFn
	 HkYhyhVNGwyPRxYygweG4BQsNSBLI1DxOipKhE7RZO8b+4U54tmJUh7eElZJjhXZ3c1Y8
	 hOyn4WWU107QxD56TIJSEfzq/A1SYnuwq+EE2edNh6/r25ksMe/0ASYP8/u4nDTzWIw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156240;
	bh=x0lQnWHHZrcsESc1KrA1juqmxinmGrsOPl8n40MaIJI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r2Fa0QpgLJiuzutzXnxlHO9t6KsefuLe//TCcsW1O39Hy30kqn+hH0KdDZH/y8Xk6
	 /lsU/PKzHiygRSAU3Hol+Gs0hamTsUatRvOF5nv1EVhJbPDNgJ6YwRXVMs84MMzuD/
	 oIhcB//njFb+Ft6ot1qJS+w2JDXDpkP1sUb6IiueqdVznbrkfpGHYg60lbGIODNshG
	 aIbE83GmWjN+R5akPOEvlZGBBtzegTmSidIN8EeBF5YwKBw6JpUqjheH4gaxGN2Fug
	 wZLFSRjxgbaraap/6XSFlPoaN69htVEWhFQYfXjpPDeCbAqLmXj+YtH6zoZAKMNAhE
	 SswlPaimnaF0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CEAC60FF1;
	Fri, 16 Oct 2026 13:10:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19912920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1750F81489
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LNyfgvINw1E for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D55F881511
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=fEbXOQYknuechk8RdMgIaDK8XvuZQG2D3B92fcBbB6tHEnOgolc+rLvoqmB8j3veGI6z
 tZsaEocd4ozMx65eyXwxP5spOxJ2WIwzc890wTB2kpWTpKAZbamBAFuLzc78H8QkTS5cJ
 t306N3GYeCY7SRaPmoh2ZUuszTXAueyZbDNyQowzWIBqAGspRU1sv1KTgI4LeL7ysOoqJ
 cs5IpS3ZGZatLNaJAZ1IGqZxWZEc3yk9G0oRKdZtHM9B2wcJUUoZahNilhtYWaMGpRgsk
 YuH2hX7YAA0Asbas1/rURKA9fhunL4DkX0bktOJ6pP96IOkfen3NyKjoN2sImM+3K8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QFQG+uI8KEQnlimrp5zujotqiU9bERHwFI2YWow0TCA=;
 b=DeMy3Jgerkw1v0drePWIfpUbLnePZX1uRfeZHru/RzRtqSNKUh7pJoSxPSiphtBaaf+S
 1GQNM/wObTOFufChVCI3cDe24OTVqW/3kLpFd+USksMnD3AsQvHQbMk5jAI5T+SLW0EZ/
 vs2sdpcPIXK+t0hxkdJHNWevTmLbINS9jYMiVUZQwZLdJ3ubCv/Jgv0u692RELP5czRha
 pPUiidvAKPEMybgq5BGh2PaO9KuilxdAIlwPGbbOBh6lONE7fgP0bY6WDwwT9f/i2mN3/
 V8yWPFLlmrHF41XOoHyIc1tKGiwkP6pWcT1MhuN5kZTXDoFQxKY7ABrEMumCFoMjYXg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D55F881511
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C68A8960D9; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2193520d9bd1e7595a5407aebbcdf37d626d622b
X-Git-Newrev: f3fbc82d9db3febad1699205c8dca806ca4f2cb5
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.C68A8960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/checkpackagelib:
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1232054872270101600=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1232054872270101600==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f3fbc82d9db3febad1699205c8dca806ca4f2cb5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============1232054872270101600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1232054872270101600==--
