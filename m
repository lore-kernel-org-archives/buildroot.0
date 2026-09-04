Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F15C79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 22:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3CF440B28;
	Fri,  4 Sep 2026 22:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcjBZuE1iQp1; Fri,  4 Sep 2026 22:24:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 600B840A58
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788560684;
	b=RO7lwZndFUm9boaHf8EXlGF85RYzEJBpk/czThHJdZjrV8yGzYapxRiWCsBjGZFNKjKE
	 7pH08GpuD8IK3SnEaupQTaOAVWwPSrQ1BwQPWdRJOlbK6Sfatj0Wh6bryXn7aY8FIFUDE
	 IIyb5DuN3bXtUHFReeb0kzZ9bWu3OYTGblo3Xxb+r+u6JObGTsniLZ5JBjAFN9az5mNv+
	 Prm5Y+sixjqf7Ktaa2IYWgLCWlazC2Ox+ACP5icEHVJvdx06sJ9/VHl6IzfZaSFMv966q
	 XCCSyVQhziD78I0Qfjv5RnVb66WAXuhU9Ksc/P5Yhc78Yd9ja0ocZksHmnUYfTTkfag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788560684;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fEKEV7mo834C18I3ULf2VFkAV/KCKaxLD1clEv2X4gw=;
	b=EbgOlj8RUDWHaF3zxKr6oGOJvEieVRqONh8QWXIYHqt/N5DozqqLtvWwuxOg7vlwOi3o
	 0UBw+nCbVY0UQETw/Ppof6muhjdgLRIa/+vInZulGdr1/a9jrztTlXRrVRw1FilNp4mQb
	 spcYkVDWpsixP02WAylyPISCPqgRPpAL9a+olfP7zMjg/RrnJSxvm+mz8b1Dhk2XhCbVP
	 XIP6wioNTA9q9GGZNg5pdrbrsLtRP8IYv77qsLK9044vxGxYdGcIWfQLjJj+zYuyA5REH
	 IhjCIsGFs9/peP7dWmmZKFFrRBrBW0DpAlD1N5ogaCBNc8fHdeDSQVbs7jS7vrtIu6g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788560684;
	bh=fEKEV7mo834C18I3ULf2VFkAV/KCKaxLD1clEv2X4gw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D3k6EviVps5ORndLeooM1dnjs3k0EDUb4ltyAvAT4CP8R5Hbq+bsnnrEcCmc3f1n0
	 9NHWZ0RlAECZ0ffCles7zQ3Mu0CE9Z2emHP6O+5QnPUueeM8uxk+f19OYNrnZxRAGk
	 HYpm9Ll+09HPlbtEbp85mpUF98mJvw9T75LwRx7thISe9kC4RZwXWaFjebDJ0w5ehW
	 XDbnfZLuSJI2HMRrumgxMnn9pfg2OECWnDibPoR9JBp+jE8P/Jl50Zk+1BeEj7Mm3E
	 ufxyHUg/w05DMnM1QFtbZQMHeeWz/CbMOdUB1I2W5wn7EAMrgx/RMuG01xQkX/mozv
	 io3jAX9oT9Wkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 600B840A58;
	Fri,  4 Sep 2026 22:24:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D564E136A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 22:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C748D40A58
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 22:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NycTbW_X18wg for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 22:24:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6CA0540A34
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788560682;
 b=j278zCHrv1vTJVVlmfNkIKTc/+tlzNY7iAhF+gDAcOEOZZ37iNYr6OwqGlHchdcFxhLy
 hNcUZz8sk5nCEAftXFVFM9c4QibqFif9WbAH/eTFgJGmRtG3+1AsgywTk1vV3dooOoUGi
 T9wEj8y3FihlO7gWuSq9KwkwkZpnHus+POA9yqxu38xSrPIfAqc4vIaCwj627j7p7Ivuo
 gQvZmaSliyUaJz5HJEPrcHYOxhZvIoOjf95tpKVKIH8KD8zUlSA8bqtZGoDyinAVQeRrz
 WwA7hU5kGUXT6biraqYujdk7+6CAOdNxjOK43Bpprf5hum0rVrSVfk/d7PsXtia7+4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788560682;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Xj8F/crgFkYhBY9mee6KEi1xTvBUF1nyLk6bHolcg+Y=;
 b=NSzB9nxGcmdEamxikTgNFfLbizBMmImivF5BalkJVnEbMbr1HclIouT1+iuZa32fbz14
 egoNCZab99yEUhJ3XEbj8He5gUCD5+Fcf+n/FEmrduHxUVskFe2B3BS1kBg0OOvR2MDw6
 y15VoyTZoxIxUa09mC3OKyVaszKtGOfObPOTTDMGr8dhxWEKhDFHdS2xJ0yBCWGDzr4qV
 CCRDIYNc5ctdiJzhydVEDP86mnj5ztZSr6P6IB/W7lSTMLcDc/d++t8rLhLzCGefYPzt8
 5p/5IsKSGvtbOkpLJIuhAcI4pGOLPiyy9Zq00EveLZEfq9pm61EBZzJ8fvnUD1roLVg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CA0540A34
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 22:24:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B54E394DB5; Fri,  4 Sep 2026 22:23:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 22:43:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df61b7e9bb460ed0fa017394af4eec7da4f82a0d
X-Git-Newrev: 47c45f7f62b60ac24b65c06022f66e0ee8be4b24
X-Patchwork-Hint: ignore
Message-Id: <20260904222341.B54E394DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireless-regdb: bump version to
 2026.09.03
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/47c45f7f62b60ac24b65c06022f66e0ee8be4b24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.infradead.org/pipermail/wireless-regdb/2026-September/001953.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 4c6b3bec78..7e2bc57dfd 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993  wireless-regdb-2026.05.30.tar.xz
+sha256  b22e0901227b820cd1c280abe681a15b773a5103a5e10dc442e94ebb34cbf58d  wireless-regdb-2026.09.03.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 9761afc243..469de2acc0 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2026.05.30
+WIRELESS_REGDB_VERSION = 2026.09.03
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
