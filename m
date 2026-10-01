Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D8ACA5FCF
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 16:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D86540BF7;
	Thu,  1 Oct 2026 16:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXnSUpzWe72D; Thu,  1 Oct 2026 16:55:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7DCED40C00
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790873713;
	b=SByq9w805mHEvjGhLYkn1meepuI4rl3zfB3ixNAY156vnLyCQNF1qw6ML5VJ2HDCazIS
	 NLtx40M69WVqDZsRlhZfyiAniPCYYP1Xh5bjmQ+HHyV06vSjWbkfC64SDS5wnH2SBFhEz
	 7hgLikQFyUyAuRFYyx+YfdgPeQo/4GJP133rKq9lZrI2sywWiaFmkgdEJDHck2KgVukx+
	 QfALq/dmzbxJTXIWW235gq8nskgH3GTXzJVLPRXAjPYAJEjUEvQa+evD85GbPkOABrUv/
	 UK5+FF2ieO2rXbx/4ySU8W9S62Wlfgc0o5mFhAsLUhxTNX6epiXDZo275EdbdQVwZMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790873713;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rgE2eD7tpSvEBhZBgV9/huB2trS3eQtAKpmlyGvUaOc=;
	b=RQCd3Kw1HDv2bdvS93ifkk6qpYfPSjbTsPBtHAyJfN1kYGjOhHMBd14V1BNKktUXZ03T
	 eS9+7yIy8ywQi2fvYxYJEMq84B+jFjxluWP46yWGB8Eft1eqbg2kabPCvEk9zEA9RthW9
	 WIrsmkwpNV6MlXEG6XOZa0UP+ne4VaOdRbwl136baiGrRy2HgAgzUaG0/r6yVM3NTRfnf
	 k9+lfiSICLhIR+s25yV999RR0O63U/9h9HUJC6cbsIi45RUPhU9rouqSFqnzAH+VsITNQ
	 T//TDmpzRV7ZAgS2P1dyHjGUhsxBkqO3Yw7qpUHared3fHNP3nDVOp7W9e6RHYMhOrw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790873713;
	bh=rgE2eD7tpSvEBhZBgV9/huB2trS3eQtAKpmlyGvUaOc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ApdltI6cG8elNjNLpn1cHgklcd0DPMmIS2xHyIq8WvEwyTcGC8WIxPPaVLn2bjHsk
	 35xdYZ5xR6hXAjtswtiqfHzIpX+/JED7Kpqs0uVlGFhUglbAWFjNa6bgMeW8CFU9cN
	 eLnbykMD8yM0/Y/9jnSG1djb59XPghWRkjlA+sW4WV+pRPmg034jQsYD1grYnZsXJp
	 FVnEDQ1Ya0MWMUNGKELdYzeUJtneVTVBinS/GYVVvbnSuGBGG7YxIKPXymVWjSPfxi
	 J/zDpzMdbqCLNnwW1JDU+HOm3peEWWqilBZ9t9gwMA8j41TGZaajkCtWPn7Tn7yFk7
	 BfgpbHWIrZsXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DCED40C00;
	Thu,  1 Oct 2026 16:55:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A716A32A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9893F40C00
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mShjiUa2M-It for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 16:55:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EC51940BF7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790873710;
 b=BcShGXm+QPcTzIfR2cqiXWsWovdXSo6xbpnVoBYUYx3gi+vPlV1l2iqfi6WfwPcK3zHr
 bz15ioW5RUQz7ZABp0OS6WQHShAZGLINgXn4nR/D1tIeD2IAVsfYLkHknTKUGd1MHOO5g
 +PO2kX5HRsETa/4UGtGP6LyN/oIKvHrMfHdryFwGylQtiX9Pz2Tc4W8emDtOaQ2JdCmkE
 4U9uKkB1JwQFeC10Qm2R27IeSkZYhEak1jlTxSG2TkZeaKKGHuAGhPYbm8SzrSiGyQa+V
 2VVZ6vkxwjHQyJhNg4CvU2IoyBd/EsE1G8DbFLu64pYloCWnweTnrPN1eewyJkt+szg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790873710;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3mITM+vGBVsrT1R8ZjlK+Uq2DQO93FhA3t3O1iScCEM=;
 b=kWvL7D61pz7O39qCCTIf+ihQxiGPEkMQGUDgGaSVkPO01412EnXb/xFF06gzUi7xwWnx
 hbPIAJ0qxOIC5lFlqQ5TcVEuVF0d3dFUUqDOL4s0GsqMz7e+70jNB0tWWLhWvxE0qBRyr
 NBDd1fHJUsaHZHVI9ZnFyWQaQKG6xPTs9YPvie772u5Ux1XutJt+XRaujcETpf6XjBYmJ
 4g1jDCDzoxjUEAsB/Z2LVnXpVj/NXJG3bvuKo8YGMTNdRBy0TQfXtTZyUexEiozXWMkD4
 ZJCSXwY15FQV9Ztbdxca4utzPBgLCYt8v23o89F/+YVbl6XxlLIWfFCc27kuAPDja1Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC51940BF7
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:55:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 100A0814D0; Thu,  1 Oct 2026 16:53:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Oct 2026 18:53:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1eb8b44822fd97b5addde3c293fa804af88ea435
X-Git-Newrev: 850e5de7ea327ad8abc1258e0b0fa9a5c4054a17
X-Patchwork-Hint: ignore
Message-Id: <20261001165356.100A0814D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: add upstream patch
 fixing builds with old gcc
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
Content-Type: multipart/mixed; boundary="===============1487309675811170456=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1487309675811170456==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/850e5de7ea327ad8abc1258e0b0fa9a5c4054a17
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Building with an old gcc version (for example with
  bootlin-aarch64-glibc-old) currently fails with the following error:
  ../src/graph/graph.hh:638:12: error: could not convert ‘g’ from ‘graph::graph_t’ to ‘graph::graph_result_t<graph::graph_t> {aka hb_result_t<graph::graph_t, graph::graph_error_t>}’
       return g;

Add an upstream patch to fix it.

No corresponding build failures on autobuilders were found at the time
the commit was made.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0002-fix-gcc-4-9-4-compilation-errors.patch    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/harfbuzz/0002-fix-gcc-4-9-4-compilation-errors.patch b/package/harfbuzz/0002-fix-gcc-4-9-4-compilation-errors.patch
new file mode 100644
index 0000000000..e3de881e9c
--- /dev/null
+++ b/package/harfbuzz/0002-fix-gcc-4-9-4-compilation-errors.patch
@@ -0,0 +1,63 @@
+From 0d0b62575f2a52710d1fc3d59ed375cb3a50701a Mon Sep 17 00:00:00 2001
+From: Kevin Hellemun <17928966+OGKevin@users.noreply.github.com>
+Date: Mon, 21 Sep 2026 12:58:03 +0200
+Subject: [PATCH] fix(gcc 4.9.4): compilation errors
+
+The current build for v14.5.0 fails to compile on gcc 4.9.4 which is
+used on embedded Kobo systems.
+
+Ref: https://github.com/OGKevin/cadmus/pull/1005
+
+Change-Id: 7a4bec5b5418bd0921b273d8d4a1e79b
+Change-Id-Short: spvolnuouvyr
+Upstream: https://github.com/harfbuzz/harfbuzz/commit/0d0b62575f2a52710d1fc3d59ed375cb3a50701a
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+---
+ src/graph/graph.hh | 2 +-
+ src/test-result.cc | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/graph/graph.hh b/src/graph/graph.hh
+index 0399f7f3e1f..e0e733e7e61 100644
+--- a/src/graph/graph.hh
++++ b/src/graph/graph.hh
+@@ -635,7 +635,7 @@ struct graph_t
+     }
+     TRY(r);
+ 
+-    return g;
++    return Ok (std::move (g));
+   }
+ 
+   graph_t (const graph_t&) = delete;
+diff --git a/src/test-result.cc b/src/test-result.cc
+index 9d487d4083e..b7b93a4cbe7 100644
+--- a/src/test-result.cc
++++ b/src/test-result.cc
+@@ -433,7 +433,7 @@ int copy_move_counter_t::move_count = 0;
+ static result<copy_move_counter_t> return_tracked_from_local ()
+ {
+   copy_move_counter_t out (42);
+-  return out;
++  return Ok (std::move (out));
+ }
+ 
+ static result<copy_move_counter_t> return_tracked_from_local_with_tag ()
+@@ -445,7 +445,7 @@ static result<copy_move_counter_t> return_tracked_from_local_with_tag ()
+ static hb_result_t<int, copy_move_counter_t> return_tracked_error_from_local ()
+ {
+   copy_move_counter_t out (42);
+-  return out;
++  return Err (std::move (out));
+ }
+ 
+ static hb_result_t<int, copy_move_counter_t> return_tracked_error_from_local_with_tag ()
+@@ -457,7 +457,7 @@ static hb_result_t<int, copy_move_counter_t> return_tracked_error_from_local_wit
+ static result<move_only_val_t> return_move_only_from_local ()
+ {
+   move_only_val_t out (42);
+-  return out;
++  return Ok (std::move (out));
+ }
+ 
+ static void test_return_moves_from_local ()

--===============1487309675811170456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1487309675811170456==--
