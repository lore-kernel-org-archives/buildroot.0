Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D33CCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C94CA60612;
	Mon, 19 Oct 2026 08:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRuHAgJ48RJQ; Mon, 19 Oct 2026 08:37:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CE2D96069B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399053;
	b=gXNZ23MbuoHNItKoG4cLKl7J8FUTOjhhUifxfrwUvc6Y9e8zU95+yrdQgIlToF+0MRSM
	 SgZU91adOjUJODTWHQPkjzml6PiFbHtDa/1DLJnnL7FJxYrEgdEcA15Afn3ceWCl9j/uW
	 yXbM29ZQkRJBdVixhNws/h+MVhquFZd3/f9+mMB+su68I6A/Iz5pKKfdiDn1JF+twDxE8
	 IiXRnLMvMIoKjjRN3bbumVyUu1Guj3qylaSQBelubKkAzbYxRcrQ8Jkvq/69yymW+mX3X
	 5sbHb6JTyV9Jp3+doXq8mHIALJ5nM15KXOUYY895CwM5YHrqs5DBNtXBLxhHhY87qcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399053;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ziqntWiGC3KtV1JNLkLsIZuV20AlJF19Z/aSMync+bI=;
	b=VxWl9QlhrtmJBRAxH1VJ283yt/qkkeocUB/ELLKu1RN2nCzVM9VZKdcUPzln9/cMN54m
	 S+pfv1tE4Rol0ZOqHAFW1+d+eGq6KR35DJPLYUGIQALDT+4EnlmA+ebjY9g6sp5LTKBBm
	 Oz2oP0KYqsJyblVQJ5HNMIW5ZYJY4aEadCHmBUlhv/7I7B323hQ3KC5lRnxg4ssK/k4bQ
	 63hjugHfDo1oQBI4HUGfB6L+SmXzH7/HRL6LdfzND5iYyLn0u5bD7DqKtbBBgqxaPsFi0
	 lmrhB2XI6FKsDmLBoq23ssYKV0LN3OdjG34b4kBFkcKCSVoMXvYfIlIUJQxzyypF28Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399053;
	bh=ziqntWiGC3KtV1JNLkLsIZuV20AlJF19Z/aSMync+bI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BRzqosGv7im4wtCXuO26B+aRh5Bed3ekKKTMmGkIgLo8jk6RsN4OA/99WtAuj45H9
	 8HmW3FoCf/F/O6vBfc+XZxnyfEYXyeuQa4qJm0n505TsXI4cpBw2/xmUp95l3k1edZ
	 rfx+PpZOOJzhs4T62gUeoudnHXbBYyr95Q0fsQPZjMacv39VSfDxtKRvOUT8qtOYdc
	 Hx0lnwE/K0WwlCMj+N5UauRTLFhw7HtUWXSLnc529SD/1rV+fvgaDrw73Ah0ORX81W
	 2hUSCZgIsjjYY+YU8HrNyFOaqb7e/nP2Woxj/i+DJxjHHvx9T0ew0OViqbo/G8AOXF
	 vdIjvUltCyp1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE2D96069B;
	Mon, 19 Oct 2026 08:37:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8578A263
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7720B60735
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQ9lLbIpWnHU for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:37:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C667F60612
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399051;
 b=dTZ/Hnd0EPwtqVtFjsbfvOEtAYiEj13W8KQLvt3OpESk2CFR+aUWyT7VHOZnuvpATX8l
 fOhrPH7TL3FcbzZA1g2u+yLRIuPXmOl1UiOsRqSJKS4+voL5t/gwpdZUQ6sWpYReu+unk
 V+t53Mzui7vVjLRepICwGJ/nzWKG/+9R9CThuVVWcXZWtrV71TWgJXkFtq7hkkiOHdRyt
 kaVGStxBw2xoZMP+phJjID3cVrPBPiUBctEUtCA5pJw973QetOlFJCowR4YJ4I+nqsfTm
 abGg0ttgHDiHaIV30qJ8KUcjqdf3C+WxO1NfiaEMUVKUKsQP+StaDvkXHS5yADNuObg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399051;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4Lv6IKNDR2rewsqLMYwN3ARLw2dfMYBmfnRCbEcZd28=;
 b=b682whwWBawo8Z+GzoKk87k5E8566lq2nVgYcKp1BcNaaYKTP/xlCggYI7fFvj+5XE+U
 /qAf6vb3oEpIc5/nTAeMLtFqbO0BF+GCBcmweXekvNl38V23nJ7aVIIHR98DznAhVustU
 EF/fKqjI2ktCutCPmjOj01QMxjCZnuZDnN38tLhk0Jfi/z1EPfYARjMNRAWsAQwW1FzYE
 MkyhzPpKITkX60QjDJvp38hSHPwDljzv6hUr5PAJdqu7A3BHWRkRcMdi1f6pC8UUfYicP
 gFqFEbD8buhtV6FKy3O8/9IQFSE+imJ1uoQqj70KJfD9ossb4L3J0Np6zu3OXQqRE5g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C667F60612
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CE6A98451; Mon, 19 Oct 2026 08:36:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 10:28:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3deac2f6d4ea2ac7dc5b4f8ce61cfede745386f4
X-Git-Newrev: 4557cd6597076c7fc1d76c430b252b09f1cb895e
X-Patchwork-Hint: ignore
Message-Id: <20261019083609.4CE6A98451@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-chardet: bump to version
 7.7.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4557cd6597076c7fc1d76c430b252b09f1cb895e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-chardet/python-chardet.hash | 4 ++--
 package/python-chardet/python-chardet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
index 154986d735..463c29413a 100644
--- a/package/python-chardet/python-chardet.hash
+++ b/package/python-chardet/python-chardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/chardet/json
-md5  728517f43e9a435a3239d60d1ab35270  chardet-7.6.0.tar.gz
-sha256  93d9df6089ded42ed1fe9f57e272c0b74bd0464d45c0c7d50f09f26f31105c3c  chardet-7.6.0.tar.gz
+md5  00b60e5cf4156308dea5b742a89e31de  chardet-7.7.0.tar.gz
+sha256  0ba38a05201b0abf7570c12d8af45c30b2af835bd5cc52bfc7105082eda82c1e  chardet-7.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0d4cf67e7a26e9957b8948e7dfc0e380e61b427a94b061e618889aba89bb9616  LICENSE
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
index 4087c1cfc6..ff0aa8cb32 100644
--- a/package/python-chardet/python-chardet.mk
+++ b/package/python-chardet/python-chardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARDET_VERSION = 7.6.0
+PYTHON_CHARDET_VERSION = 7.7.0
 PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
-PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/b1/51/cd61c567092a6cec796144510a68aff158ebfc1df82950a45bae65f28413
+PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/47/92/3d893ac5d338b9a9af34c5b517d77492dcea8a10254254eead4215a96f3f
 PYTHON_CHARDET_SETUP_TYPE = hatch
 PYTHON_CHARDET_LICENSE = 0BSD
 PYTHON_CHARDET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
