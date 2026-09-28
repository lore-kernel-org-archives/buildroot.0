Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532CACA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C76F80A9F;
	Mon, 28 Sep 2026 21:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85pIzxLXM33R; Mon, 28 Sep 2026 21:20:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2E9D580A8C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630429;
	b=Y1zl5ts6BFNu33fYyJivGGv0FhC7hQWjC8tcjTJQ/hJ3Fv3jUIW4WSic0gTExaH7dtF5
	 Idtu6cNeWwRW+0NsQtcPXfi1beq6nwL4AaNRw1jbXL7aC1nJEhnS1gyCtKcKQLjZTnAmF
	 HG+YrRtGvm6fiKE/LtozfsmZTOsers0dEo4g7SZFOLJnpj2T/Sw1HSxDGgB0q1VOvv2pM
	 uugb1IEUNyZRRIA8n/UtjPke5zHJLz71AIyzqavy1+eOmVjcgPWmaeXLkJpxdVLMKrAxH
	 /exK2Y3dKtR4VoGMWCJIGMQHe9KJLH2LcfkAVUHIGS1Ip+jBilyuDfTAwwaxMXmnaxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630429;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=024XUdDNe8WS0RwsBX3DT8+9AaKW7NixeYMdeAduN28=;
	b=f3pMncG6vbFo7Leeic105zRbht05pYLUT/+R08NY3v/6t2p6HI3bc8Yh7tE3jUHtWgoE
	 oKt4xSgIatbuhhbUpawiny7U2cVXLEQC2HuTe056SYxo+gZkcpSKN10IonIJe5QwpVJcT
	 rZxJoZRYnwh84lJ4/TlY84XJHYOVh2Vu3lAgzmARBO3THEugES6qokp2/5WYJ8tg0se6S
	 HB94JFDtz7+ZkZ1xrBEhFgU2ftktTbTICUtEe9mVxusRHN/z8AzBd7JCPseRj3hyJoFVG
	 0ZdbE1AWCTAtwFFPNW5FS7sphUBYOfN14oZdAjZzZVypL0mj9vgTfizCK+0JOydRpFg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630429;
	bh=024XUdDNe8WS0RwsBX3DT8+9AaKW7NixeYMdeAduN28=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iLgUlUC8rlCVFcplDl51s29Y37pSlMBw+PjnusYWTTSTCAo6QyyL2nUdUNBkf5YVF
	 /wfRJmAH07xlAxGfZc8YQ2yUXnXsk/egDp/mLWxIaVsdAL2m+gSQik620NZVdlxghS
	 kaByRhsXZz3EcuD9uZ6WnP92uQ27UnWLpQpYp56TUxg59v8+tymPw4eablCceeNlTR
	 Hp/PH+Q/PuENyRncCo6wH6rAPZ0deoBA/vtV/pb/ugdENpBH/c5s4ejBPhz0GUrhgY
	 rNETi3f5A9UT3T0z8DsE9nGtYTnvGNLDWT+1Ps6gGZdgXzCG9Zm37kbqVoKX2lx4bv
	 Xm0kFc5Lx4V9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E9D580A8C;
	Mon, 28 Sep 2026 21:20:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B4C8335
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 214734050A
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnWaXOcuX0vF for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:20:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6B46140509
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630426;
 b=WhLmJp8JDcWcfyfacaEidMXcoEUzXTdC/N6L/rPqj4CuuR6iJr6RUHPsWQ9/qIH/PQ9d
 4jEPeSr+MZzwQ5Bs0SEXLH9G4MlPYZqEyjaovMi63HyAqKXsznhQm9c82+0GzfOEQZUh6
 QPp/IBRbVvYXujySP+dBcLC2JgtyH4G75L0XEmmPgQG7A6POd/LH5LxzWqMcezbS4IHtp
 qx/LXCUyXoXDIrc1gYgpMbYzxBGUAFSurpuuaXK+IKHq7my/Q60//KAT3u7dQYBLt2zIl
 putAim3uvFdI8hssC94bs0r53l2/T15bUhch3aV40S2hVK9abqq5ygxsq9YkLN76FLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630426;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ivABPETzal7kbb2fB0ecnRbyw/QanJeLbg+tKq+1ZU4=;
 b=R+ZL8pEAtSCg3n6t5D80DShSedVN8j8lSvRxD2C+oTjTjeyIKLHyzF4VF5ZQeN/c0A+B
 S6GZdGYnVngxv2IioGTDUFBqRTSDcXd4yOw6ZD47YB/Z7ra1mb2lkQSwhSTmLtrfkAUYw
 pq51s5wZi/p+ZnNv+x5JoLfROYXd19t9DR9UOac6/LscnpDoWV9G+toBiV+FvQmCo3K48
 Bk+CIXE1hN+3IlU2zMOvK5V1KCQlH8QSRh2Z1zpy4Ecin7iSPoqC9QQC5+M3xS94aYsr3
 NFRPvtAtxxXnWPSVwuPFvnkOOqCf01H12b6viL1fPZ6gy/UuamUJ3/9/NwMYZ0iF8fQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B46140509
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:20:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0DB8983EF; Mon, 28 Sep 2026 21:19:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:18:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79e6e2d88c52fe421205b6829e73a76ff964b4ad
X-Git-Newrev: a2b5b7371b4ae5460bbaf0ca8c2cfb523f865556
X-Patchwork-Hint: ignore
Message-Id: <20260928211913.F0DB8983EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bubblewrap: fix build failure if
 kernel uses localversion
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2b5b7371b4ae5460bbaf0ca8c2cfb523f865556
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bubblewrap expects the value of the assume_kernel option, if set, to
be exactly three numbers separated by dots, nothing else [1]. If that
requirement is not met configuring the build fails.

Buildroot sets assume_kernel to $(LINUX_VERSION_PROBED) since the
version bump to 0.12.0. However, the expansion of
LINUX_VERSION_PROBED may contain additional suffixes, e.g. if
CONFIG_LOCALVERSION is set, or localversion* files are present (like
in CIP kernels). So filter the version string to ignore any suffixes.

[1] https://github.com/containers/bubblewrap/blob/v0.13.0/meson.build#L94-L104

Fixes: 4cb6193d2eca39b1bd79ff4867c842f507f692b8 ("package/bubblewrap: security bump to version 0.12.0")
Fixes: https://autobuild.buildroot.org/results/e7513e4730000e46b13bb9cf25955ebd3ec5fb71/

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bubblewrap/bubblewrap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index dcc3c23d7c..a58d7fd143 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -18,7 +18,7 @@ define BUBBLEWRAP_LINUX_CONFIG_FIXUPS
 endef
 
 BUBBLEWRAP_CONF_OPTS = \
-	-Dassume_kernel=$(LINUX_VERSION_PROBED) \
+	-Dassume_kernel=$(shell echo $(LINUX_VERSION_PROBED) | grep -o '^[0-9]\+\.[0-9]\+\.[0-9]\+') \
 	-Dzsh_completion=disabled \
 	-Dman=disabled \
 	-Dpython=$(HOST_DIR)/bin/python \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
