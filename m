Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AEBC79FBD
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 21:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6841607C4;
	Wed,  9 Sep 2026 21:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyQ5dIGCwcqL; Wed,  9 Sep 2026 21:35:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BD52F607F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788989700;
	b=SVqK5mXcncDWjL4WEelTopIb8K1zH/RL1VdyXEKyjjfk0SyjSdHBEedFtZYLC6S4W4Cb
	 tzm2Bh+NshikawkX4xnkpJSwX7N1GkzTCrw716xcffcc1QVoH1j0DbXCsyUJC0aiC+WRJ
	 GyxU33EdCyv2i1XxinyMneoWmtfv9uyAEMdJ9ywXPIw7OL/lYLLi15VnFyF0k7iN24ghA
	 M9MiupRXqXtj0SjH1i1w6i2Te3hiKvyrIeLyOdpHP5csH4OQOkgpnpkD4X60akC7SRytu
	 rJTo4gsZyf0Y5SGEkN9tPZ02ypFg/qcLrVdJT1DhIqH6X8NU0OVkwHvvHv3u0BJeZPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788989700;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NOl3qyh53Uv67DuKVKUjrXiWl6ciodNnATj8dFJiHQI=;
	b=RQFE8gv6lmeQ6dQQTkrED9Dc7LZxKTSTudZW2gDZlRGeflpD1ueCtdLWRyphz9K5DOGW
	 +aiyEefntQWP+V+45FnFSo/Gq25RKjOoB67RMH2qWfoIA+A6IOFT6Gh39p+M9xgicaONT
	 1J3ZdjsR0sumitsP6muGcJYlECv5i9tT+miVUwB7B1xOB0Jxz++YyfeHfcEoQpfGG+nyH
	 Hha5IUsWh8EhRbXyQNAoPD39qdYs82ytHct8BXT39L7PSU1DplBQc6oejuYqSxXrmKfgv
	 iFBczTT7aEvwk7Xg0DbPnZhSO6EBjtvLEKx2KDBZX4+ckbMrcFi/611Pp1CHqJCzrJA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788989700;
	bh=NOl3qyh53Uv67DuKVKUjrXiWl6ciodNnATj8dFJiHQI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OGQhOmDhD0e8R+JKgmUMiGdtGXgkgMB7xsQ6kDeO4G7bFsqr2v/vmfiKwntDP2obE
	 wXsYoOJfUWb0v5JOweRJnX8FbsP6OtxY6O6LAwYOLjP3jZA92m4u88+TzuNYG/y/AK
	 9FYsocRmZJTf4Dn4z8r+BsyXrsFqjH2izivKzBYihX5naUWfORcY1O+U56Urgn1rtT
	 /xw71K4y9qEn+F+52LHsBGUDxgjDjgZaTnAjTm4AdQkKE0nBhxvbEfvQzjpnFBlpIs
	 M4NmZqyzyk6WZAqMQ+2IgUyrSlU8iv4yEeDkMIV40f6HotGCOZqYXK2fz1ehp43fvH
	 OhKb3I+kElN7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD52F607F0;
	Wed,  9 Sep 2026 21:35:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 226EE724
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0864C607C4
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocmRsnQdAecH for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 21:34:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0BD8A607F0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788989697;
 b=M+DEO8mzWxntUiAtQxfhzW/PaxUtHt4KX2+zwNVZR9Foj6b5N9pz9oSPk615Qol+adYw
 d2LjP3nexkWNWNQ2Zi4AXaRIUjHAbFlsnjHIZTg7EglNRAwS3jbANbiqyOar6jeZ5y6NV
 /T5Yw7/Y1+FXCyfMcZJKdNmBfgXnkdKrOxWni4ptM1kF3COzu4IduBz+XlwGjItbgkv/3
 alrqZXycq6cgppJnFFYsuJvAUcBVlG9IXBcpDJgWj4rWcg5C8IlTmOvxhvQHZYS5t/HuD
 qVezngicQQU5WX/Ymy1WjI+wAN5WoHGn2NGgmy79dTGAPBzp84vm+12Ln21MEBVbDwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788989697;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FDIFoOnoP/l24RKdbezd/Bc1yNEMXChjTmlpkJbYH/Q=;
 b=AuC5WmNS+V4J39OuyKwrpCwN5k4JxIRJ4X0pNZBCsDcOepoYRwsd2rilQgX7I6Luun+w
 A0PVWhHXTyaja5p/VYAEdNQ/hgGM5liSOIY9frIf/RHi7zLCnxMFPOH9Und5P1CdHA+Ut
 rpkrk9LgyT25ijpBpou7/sDx8hFkDQIcMzkZatVw04szfE3rzjS5jz4r1pJMagGxMH3tN
 YISRLs+3JRamD2vfOo2mWHJdLHZgBaAFkBwTKcaoexU4HGHhSHV4QYIoCuas6nZf6Ag/X
 +Zwd/dRbAS63HRmGZRlMIMvOQVCQ4uHMGMFV5O0Do2kBpFW5CfMcQwxFlYLCzwz2GWw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BD8A607F0
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:34:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBC5A9550C; Wed,  9 Sep 2026 21:33:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Sep 2026 23:27:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15a422cee13237b61a200c20f2a969ffe4d1bd33
X-Git-Newrev: 95649c547b178837852bb3a34227e15f6aa37cda
X-Patchwork-Hint: ignore
Message-Id: <20260909213353.CBC5A9550C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tor: security bump version to
 0.4.9.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/95649c547b178837852bb3a34227e15f6aa37cda
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.12/ReleaseNotes
https://forum.torproject.org/t/security-release-0-4-9-12/22096

Fixes TROVE-2026-032, TROVE-2026-033, TROVE-2026-034, TROVE-2026-035,
TROVE-2026-036, TROVE-2026-042 & TROVE-2026-043.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index b888270f14..f0ebf5d909 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.11.tar.gz.sha256sum
-sha256  2e6c1720118c812acf0079fd47cf91b6bfaba5d766c321c4d3d2a28d6a11a8ed  tor-0.4.9.11.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.12.tar.gz.sha256sum
+sha256  c0d307c9dcdaee4848a8ca53e9d6c4ec92823e4f30be12790b0fbddfc6515f5b  tor-0.4.9.12.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 3e63fbacac..3fb4f52973 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.11
+TOR_VERSION = 0.4.9.12
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
