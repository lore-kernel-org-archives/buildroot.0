Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AC7C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1820780DE8;
	Sun, 13 Sep 2026 09:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxtQwmHpmVQ0; Sun, 13 Sep 2026 09:53:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1D09180DE9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789293225;
	b=am7bj2+X9eMd7d/Vaj2tX0OQckEELOAnlNkR9Y6xIkq2GnfCCJvn2fjvPRmdNoOYpGnV
	 gGojTBqaWvZdNa9EwvKmWUtzpVVnAFQwulsmhKJUEyTGWCLKNv/FTqXL+Rro8DEWtSdl1
	 m0d9XMFN+DG4LjuHBgdiYj/9ym2RN8lBpKFNFVOXlMEuoBL0Gb2du5ndX9kIs69myii29
	 ZoFDcuyajmxcJ2YyocxCWDzLHkHZY6qVXgpbiYrreYfLMaGU74chro3eE7QzDRoubrd30
	 +rX3xbe9KQNS59VbLAqGb/2vNpRUkXFiaajPN9JkAgzsQw7szgrzFnhqUgolU06L/QQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789293225;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tCL+AbVymKjrjR3rWxEJT2QPIV4Rxpb6s5F1YldeOoI=;
	b=WkVBv1pe8t95cnN7/x4uQhKVbbAbNLZFJ9/61GNIKLKksPtgLXuaXShraSW/MpHk85st
	 7VOYVD7P/k4K+KgX/V6Gljzg8sV9OcYL4Z5unetD9DUnJbzkjVnuaUsX3o7alRNK2uG7K
	 D4/1v5OfgpdmMmjjiquZ7/kMne7wEY8ilk5wsZ9525WtnL9YYUxYvpLS7uUSk862Pyds2
	 mGHJhEPQONoqyeA4ruhweYBGjf3G3KpYpoFo/SsK56yYzcOC+qmU1yVxOjDTwSV9V3Gxg
	 J58/AbYAWLgdm1eIrFu8/MurjdhOFrj2WuqZhjwHDEDR5mBD+Dn4w8Tro2CpSQ1Zy8w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789293225;
	bh=tCL+AbVymKjrjR3rWxEJT2QPIV4Rxpb6s5F1YldeOoI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DjrsHKILNexbl7PidPXeAoxM6u/LJrZwip/DHQ468OE3+llCSxsniFq4fk9S2vPTQ
	 DX6//e3tPoTApIAwRjD+ewGGkAMhMHG/QHxK0akDIKrCIrPVGwvKjfsoJWZmvEqYrV
	 EkYs89P5Bc1ZM9wv+X5CpeKnBozlQ8zkyRbH38lyFTX60fGfbvKNs20Q8kljjNQd7I
	 79yh46VtoIRSNwHDlPT9y4AXFeEpB8tjEjoF4eQJM/6MGvIsbc/F/S19+vmJ4t9dCJ
	 ca1THyzopcmCyjluXcNe4A0oUDjeaaJ1DfIZBJlbUFLZOvzExxRuxT/nrcXpPavFlm
	 5UwvSWOno/Wpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D09180DE9;
	Sun, 13 Sep 2026 09:53:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B245F49D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9568F40049
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERdyqIZVcBe9 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:53:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A135E40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789293220;
 b=Cjp0Y8fS+Rxw5I0En5VO7N3nLcFC8cHQeEQyNBGSXKDTdH7D5kDjLSa741dLXkWU/3Qc
 piljiTweQBieJVO4xUYRPhtWjasyErGu+y5iv468llRx0UawKw3Ag9DVOgc+RlpekpmWX
 Z0DZZ8dyq22UwT81LYoQ14YFqvCkIbajVc0hbOMgPYdhTP8ly/kQLw+733kW9lmLNcUqT
 Ik4butc7ye6tlriu6oaw6dKodeFd2CnfQnDi9N/Xlquhd26SG0Czpn93kUIZtUeBmu/G1
 AtWi6sTk3ydfZdy2Q91E9Axc4GZt9BVfcIycNQgt8O5ZM87VXladRygclnX5gDcPN3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789293220;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GLvMQ8lWIYvEfkk0znNs/vWNcjxdOXvA03U8q/l2IiQ=;
 b=quATAvz8mWACiMVYjt+B6wB2UIM/euz8pAUOJ2hXehxjOmpLQsWZFVRqGEsTqvQi6xoE
 7TlFbyluIAS2UUHOhKOoTvTHtKIQ3/+YkBk7q8pfk7EM+lh5C5FJjXT1365WY/G9p9g9R
 KG5MmIjPLeHF33qt8KFG0dLg0jxYbFwNBYWH/VRHqNyB4BbnNj0YgD9eaOTM5siUaJl6J
 Ec6ocHhpVqc/dSN657dy+9xZNlLu2cXf91xkpUXljp4F6FG0Zxe5i1Gb5mYBDMcxY/0cH
 3d1DUjcKhjXSS6GuCgonkANvPoC/SpuoS/5Q8IfHp+w6IpX5TvqNyqvxmVLshCt/UBA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A135E40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:53:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB05A95B84; Sun, 13 Sep 2026 09:52:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 11:31:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1799bf3680e3f50ff50b299d64c3c8ce533cf038
X-Git-Newrev: 4cbe7861def8efe24e08ed734c6828bf713af86c
X-Patchwork-Hint: ignore
Message-Id: <20260913095235.BB05A95B84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cage: bump to version 0.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4cbe7861def8efe24e08ed734c6828bf713af86c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This minor release fixes a crash that could happen when a surface
requests to be fullscreened right away during startup. Release notes:

  https://github.com/cage-kiosk/cage/releases/tag/v0.3.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cage/cage.hash | 2 +-
 package/cage/cage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index 4b05602822..34585cda28 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,5 @@
 # Locally computed, after checking PGP signature
-sha256  cd2510f83bef3e08e660d99492ca7761b218ecb53ee01cdbbeee3d6aabc7734e  cage-0.3.0.tar.gz
+sha256  edafc173b6f56a3e1564933e272a54aaa9fe158d330e6a415d57b44ab880fe2b  cage-0.3.1.tar.gz
 
 # Hashes for license files:
 sha256  e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 4495c59b4f..4372c4667c 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAGE_VERSION = 0.3.0
+CAGE_VERSION = 0.3.1
 CAGE_SITE = https://github.com/cage-kiosk/cage/releases/download/v$(CAGE_VERSION)
 CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
