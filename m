Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F736C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C82E340B20;
	Sat,  5 Sep 2026 17:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rRVoUdlxF1s; Sat,  5 Sep 2026 17:07:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 74E8B40B12
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628028;
	b=ZGeB72KcgLGeF3ZCQz4Ko8hHBQ19/TnnwhRo/PSKz7w3lH3ly0VZzbuFt9ykQ9QicHhs
	 qXuKcb7VdNY3L5fnxL6jqzIi2oEdzuR7XT9QAqhxXpXYGx85rhwU+hHGmmV6Eo47xFC+8
	 WpPVIeZxSbTd23bfQcD5r64a2kc04za2fSujqBnHu64hZkQLgljEgajnZyvrpjzxojslj
	 B7PdKTUJFXTWRQI66ssjfRjEUs/99xJ++xhM+vGVfNRUkA8OqfeWOLt3mks2DBFfME4zd
	 1csyEPIbfjx9prWjVXN/4PJjoerG2tAqPRkh7OAccULs26d8lQj2gQn/r+3v1F/RS+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628028;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oeufkUGqDGhzT7U1MdVlbUpovwHoGGyfFHGXLvUUWfM=;
	b=g6YXp0e54KYIVqzkO/+Y18GSUzkwg+ZUn1WyUEwPWSMpcviVPLtK57lK8nuWXWWf8SzA
	 bJEb/pQiKTv+fPSUnMqzFZdFHiuQUpC51xqWqESrXCvdQba4BtoE62x2fUwXjbfYJ6+wW
	 6Gs1g0GF5381FUrtCHPzObKQMuJi7EzDb0zcf4N54p81XhyeMNkAyZi/b/9Gt47As/vqv
	 YbJavWYSyjiYperWUcvu56vkXWziB4X7hvv6Y2Zsy7+fZjufY7jom4bRWD7AFFm4GOOzT
	 dG/7j3a4Q2YBzFKf7V5/aggJL9mPJLDDUqlCd5Ldy2I56E8NvX+SsfBA+rVqxoVPmeA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628028;
	bh=oeufkUGqDGhzT7U1MdVlbUpovwHoGGyfFHGXLvUUWfM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bvt6W9lYFcEEFlUnu4kqwQTpK+WzZNmMkj6IWTRPaEaVEdXQoFeoII9Adyyr+0ykD
	 eOOQ+C+JQX4TS0gTmmRM19EXOtJm0AusuTeJPe+FLhV6x4yc9GSZMrd7k2Dp7jWQN6
	 kK6Isi1ZxRXVS/k1Ce/R64xWrx+0vm+PZR49F7GtGcd+49lIYcBunWbrRCLt6JN0Lv
	 UshM6+P3oK5XyuCu6/dy8F9tJtxbNMZDqzOuX1ttH76zRQOMX1clAMZUznWrx2EKyp
	 iC74l0brAl1LUOBB6vmrzwmmB6pPmSQeRpaBgVD8CPaqeDbAxWA2LulsQBj6RvLzsw
	 mDTUzjj1YXulw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74E8B40B12;
	Sat,  5 Sep 2026 17:07:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D1A2136A
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DC04810B5
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YP7GdMu3lXV for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0F4FC81099
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628025;
 b=BpGi3DwtNqctt7BJSortvvgoR/yYMriTTb4qNiWK9BS2yxD19Vfbs5WO5aeWZtcWAwbN
 aeP1PiMrMLA88N2YJB50kV2Buz7J5CCaWfGx6/tsgppsLPXiHbggH5cOCeVNnsguKl1vj
 gQcQvAdPqrbobnarb5Bycs6xov4xSzCr9YmsLcUsmy3o0IQODSEzwWU/gTViRZIR2dwBO
 M35sHG54AbOQ4cBSzdNz+pHhhXdrTKIN/Osh3h+Al4fHv2UsDMv4zNHROPIbRkqSHOzzc
 UALbujpeuADbXy/GA78atBY15PvPm9LaSasxLMzmfLf2LbCjQsXQC8DGR3AohEjvDKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628025;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=I9rrxmL7fKQiRXCisu18ntvrO8rc5OKco0os2jOOi9s=;
 b=Us3buerQG416l2gDrxFc1E2IxeXHCV55LmpOdBJ/p71N/aujdCC0rY4I8p5d7xga9uy4
 8UVHAbqX2Oe42B6rJqHPkAiMqbBsAQrbhvltEmtNVWqee/tCgS1CLdPgbh9dVagYkC/MF
 XyduLSTy0uZMgToGb1cFnaM9oRaco5mMRUZKS8z4HlGsMZrKH5pGTxEOCDijjFjNAJDiI
 l3/b3g1TgAj+B9h9AfAPXHggJCcsQZK2hUtpANV1nppVltSu2FG60fVfSnHRRYoMx5pWx
 grmi+zPI8nzSGPwDguVMldCKCRXXwFdioZlC97cuOGlDYi0sVfeKN8yyKxN3Ww1dFZg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F4FC81099
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05DC495263; Sat,  5 Sep 2026 17:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64c94ae8846a586ac18762084a2a026e7ecd3c5b
X-Git-Newrev: 196f186837ba5a2a0ac622b1b10875ded18230c7
X-Patchwork-Hint: ignore
Message-Id: <20260905170604.05DC495263@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luabitop: bump to version 1.0.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/196f186837ba5a2a0ac622b1b10875ded18230c7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luabitop/luabitop.hash | 4 ++--
 package/luabitop/luabitop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luabitop/luabitop.hash b/package/luabitop/luabitop.hash
index cfbf2b6516..283c903523 100644
--- a/package/luabitop/luabitop.hash
+++ b/package/luabitop/luabitop.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256  fc7a8065a57462ee13bed7f95b0ab13f94ecd1bf846108c61ccf2c75548af26e  luabitop-1.0.2-1.src.rock
+sha256  7117260eccc04cb5bd2f2148109d5c56d5a562ba82a62d960e51b9a5e5e88629  luabitop-1.0.3-1.src.rock
 # Locally calculated
-sha256  25e331120d0c2f95fa2ac6e439ca920f0a4362c366a4c7382d843113743a3ba5  LuaBitOp-1.0.2/README
+sha256  9a0ce7818d769ea3de40be3f8a8d7a39742ed5a6eb0b89de6fb8df3978a8fb10  LuaBitOp-1.0.3/README
diff --git a/package/luabitop/luabitop.mk b/package/luabitop/luabitop.mk
index a36a2feaf1..956e90030f 100644
--- a/package/luabitop/luabitop.mk
+++ b/package/luabitop/luabitop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUABITOP_VERSION = 1.0.2-1
+LUABITOP_VERSION = 1.0.3-1
 LUABITOP_NAME_UPSTREAM = LuaBitOp
 LUABITOP_LICENSE = MIT
 LUABITOP_LICENSE_FILES = $(LUABITOP_SUBDIR)/README
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
