Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3027CCF9C5D
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 17:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9595A42AF3;
	Fri, 20 Sep 2024 17:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYrq50YC58dR; Fri, 20 Sep 2024 17:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6504642AF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6504642AF5;
	Fri, 20 Sep 2024 17:39:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82F7D1BF4E4
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 17:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 719C640475
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 17:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WltQv_bTTs09 for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 17:39:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1F364017A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1F364017A
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1F364017A
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 17:39:11 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:c90c:9552:4b4a:e20c] (unknown
 [IPv6:2a01:e0a:12:eba0:c90c:9552:4b4a:e20c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 1D14BBFDDB
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 19:39:07 +0200 (CEST)
Message-ID: <01e6af64-ac5b-464d-aa50-7e950f75b6f0@grenoble.cnrs.fr>
Date: Fri, 20 Sep 2024 19:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1726853947;
 bh=J48mQF/JJfWh9ijtpngfN4JpSYp6MmP9awdATOGPbjc=;
 h=Date:To:From:Subject:From;
 b=eEsGYIFFmP+5FgXClYAqOg7xhxfafeuW5aYAwxN4RfajBb+w18dutQ+s9fRa3jwj8
 I+1Tp0l2Y7n7rec9i0wcGUPhILRGqhEgUsWb86ljR8DxVZQ3KJL8mhbsNerB4yF+GS
 EqnVejtHtzmH87XFSxgyt++/44+r6tBVP1WB6dWIU3V8QdSzDZdxnIcNqO2l9fqVQ7
 EhoTnzkbHSK8ko8GO/FTU1wkNDvuPumoaTDxkmN5ac6yIrIKuhoehJt+Uj6M2G3Q8a
 u5qKdEbD/s5rC9nZjXsHbX7Z+KDqGvXPwgXzlahjmR1oz9VXY3HfYqmQGKriphA19M
 7cAkhGsTB4C4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=eEsGYIFF
Subject: [Buildroot] [PATCH 1/1] docs/manual/configure.adoc: fix location of
 Busybox inittab
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 89d39fc7a392 "initscripts: new package" moved the inittab
packaged for Busybox init from system/skeleton/etc to package/busybox.
The manual, however, still points to the old location, so let's fix it.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 docs/manual/configure.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/configure.adoc b/docs/manual/configure.adoc
index d27cdf3eb9..e0358aa0f9 100644
--- a/docs/manual/configure.adoc
+++ b/docs/manual/configure.adoc
@@ -399,7 +399,7 @@ can be chosen from +System configuration+, +Init system+:
    BusyBox +inittab+ syntax is special: do not use a random +inittab+
    documentation from the Internet to learn about BusyBox
    +inittab+). The default +inittab+ in Buildroot is stored in
-   +system/skeleton/etc/inittab+. Apart from mounting a few important
+   +package/busybox/inittab+. Apart from mounting a few important
    filesystems, the main job the default inittab does is to start the
    +/etc/init.d/rcS+ shell script, and start a +getty+ program (which
    provides a login prompt).
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
