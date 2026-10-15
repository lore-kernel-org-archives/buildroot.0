Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37748CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBC95613B6;
	Fri, 16 Oct 2026 13:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDKGNGtOAfC9; Fri, 16 Oct 2026 13:13:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9ED1760F81
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156422;
	b=eQgz/Ox72TPYtFj/FQOdAdYm0H/wRly002rjaYuCs9tCAJQVaY/jWWEIX2yXsqY6DGHm
	 4i+K15XY2tGZiyM2u+cjifG7LR8phuclhjL3f11y/fljoJcCq0PLUlT5deNW/cN7+mmnj
	 IIo8oR+HhpmleupZbhdJ8h8dWlF7b4/c+b2Kg1Bppw7aJyAgGrJnBN+/QKIVhKLFeetMG
	 eTALokEIc9wiZRwlYWAzB+iwxY/ovH95iBLmjwDFelmZhU8Eez+vc8mgy5MCmHAEkoAVZ
	 760/TM7yozWCOcAMJTGJCFuJEtnErFpUouMA3s7sqtFqYsXGikat0pimo5vfIlAHTXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156422;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=12ssGQI3emkB0JSSP9olwlYy0YbHFq8j4AKX59bBFJo=;
	b=jM8j4tB7V6Pvw2s8g2FdSS8PAKGMkORz1NvAgcHO/xJbF1AnqI9VOz7CLdbm10a/PN1K
	 gz8k6GvL49ngypTQ4jIo/hGM3gYssRKm4pkOa1qiYuq3XKJyFv22jkxA8QfB3hzKb7SBQ
	 6qrw945bURw1elkN1za5OSyQxY58gGi/LuJzU4LqebGYX8B5vq6GSFwMneq86ovRFLeDC
	 yFPIZLXqpPOt1OXmAB3nnhj33D/t7mfM3qyogZ3EQDTahTyZ5TgJGoR6sbq2wmXHNZQuF
	 +omr79a3J+4gRLsEKeK6Xkzfl1GhtWPmqo1zZMrYXD751SEyO5fGC4Duz5FYt6bTZiA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156422;
	bh=12ssGQI3emkB0JSSP9olwlYy0YbHFq8j4AKX59bBFJo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DVo1dRGMkpSflAyoDRBbsait5eWdRHTrDf3y8N6PAdeLAHXOLNk36cQMUK0tv4Diq
	 xxsaEOgZv5EyRd2a+Spo4YwALf+nrSCFrxvS7aAo9OhKALeFdKeU3zt6KvpwQUj0ou
	 52N/a80/5HIm2QTlB4MVfRVTY2uaux5ATVyIU6tCHEF1/XjItpC8h7hhkg9n5WBqw2
	 OdKBCKajXI7FXk1dGBoojCzviofxJOQlXQkmzqvRRFGAGD9zf9PV33pRNzrKwGUPJw
	 c2uRP7MHBk68rYJgnzuaXJCIiJ4d+xvKQ6IaAG1Wjcm2lnvUblDw1Ho1usWRTqzSTI
	 bBNeKK9PvZodQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ED1760F81;
	Fri, 16 Oct 2026 13:13:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C9BD105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B88A60F1D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbiWg9TBC9-P for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7A9EB60EC6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=pP1TKwodqQyQyGS35TgEWEM/Sw46Stm0JaN3SzLv22v1scroel+UscgHtsgSNf/lFWzo
 hhYOoDCf6jZUZ1rKLLb9z/DYjMLAjTURqk8MbemvqbVZddUlz8kRc0ec5b+hQj2RA8RbL
 GUeMFn25qN8FUSgKnD01eIEnjzyAE9Fq6K9cQBZOH93qrJmV4LA2zGCOmakZX7QXnQDSz
 o/vPf3NyldNVaYrkU+RzYPQ9oUrki5i0NrXXF7LprOU/rZ2IYD9Wp7j39EaEV6+g2Eddb
 I4vlu1Dm5ElRs1mJsaWwCvhYA+S8lix73j3bQBRYTLz1Wr4Bnh9kBwR5Do9J9zxNdeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5z7amIqKwaPIoUJ60sP9Irr5dENoi84w7dmKqEtqfFs=;
 b=DfZLMnJ4vI1l/2zB0M6eMs4GLf04sb5fM/7P/sXxDlZLj4GHs+MVVhfuzTEyf9v6IT3h
 aC3s+tj3usd8OHe4atx8QSASWAlyj0rqp5JRQV40YjoMWXO0EihG+N7f1dMi49IJImlXg
 b9D4QZWpHqP6kBPRodNYmD/uWHJRcrlFKnNf/84B8g63+vfLk3pHn6kZvEMT+VP6g2vwF
 Zrz1aeT/FrGZkBKHRPcZeTx2mkBqRxgqMo9olGnBsyai5FmdlKsIfYDAUFF5heDiZWXrf
 OrYmRjHmN8Vq7lJhfCbLowywC2AM8sgY89nx8cRS22IMt4mUf0WlqBwvLQ8VMhy7ZMw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A9EB60EC6
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A9D4960CB; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:15:09 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 26723c2fd1198d2dd9e370a80a63709b6a6295c5
X-Git-Newrev: 99ad4d705901cc9086f414420a9de46cb5922905
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.6A9D4960CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/generate-cyclonedx:
 mark host packages as excluded
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
Content-Type: multipart/mixed; boundary="===============7536852375750907358=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7536852375750907358==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/99ad4d705901cc9086f414420a9de46cb5922905
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Mark Buildroot's host packages as 'excluded' with the scope
property [1]. The excluded scope is defined like the following:

> Components that are excluded provide the ability to document component
> usage for test and other non-runtime purposes. Excluded components are
> not reachable within a call graph at runtime.

This fits the usage of 'host' packages : a package without a runtime
purpose.

See the mailing list discussion around this property [2][3][4][5]

[1] https://cyclonedx.org/docs/1.6/json/#metadata_tools_oneOf_i0_components_items_scope
[2] https://lore.kernel.org/r/<de0bb761-ca88-4bc6-8d7b-6bd14e9d1cbe@cherry.de>
[3] https://lore.kernel.org/r/<20260409204208.302842-1-thomas.perale@mind.be>
[4] https://lore.kernel.org/r/<bd0f43c9-ebdc-4717-b8d4-783ec712bed2@cherry.de>
[5] https://lore.kernel.org/r/<176c5c42-50bc-4b39-a7b3-845b085f010e@rnout.be>

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit d8d02d28fb64f69e97d2169740687f761f93667f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/generate-cyclonedx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 098f62bf2c..44b9b80847 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -371,6 +371,9 @@ def cyclonedx_component(name, comp):
     return {
         "bom-ref": name,
         "type": "library",
+        **({
+            "scope": "excluded"
+        } if comp["type"] == "host" else {}),
         **({
             "name": comp["name"],
         } if "name" in comp else {}),

--===============7536852375750907358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7536852375750907358==--
