Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B262C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 11:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC8844183D;
	Sat, 16 Apr 2022 11:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVzSRcJFThQI; Sat, 16 Apr 2022 11:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8387841295;
	Sat, 16 Apr 2022 11:31:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA60D1BF59F
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 11:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B64A560B9C
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 11:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=zx2c4.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRU1Jb2EfJZQ for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 11:31:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB6AC60AD8
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 11:31:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7BCB760EC8;
 Sat, 16 Apr 2022 11:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6535EC385A1;
 Sat, 16 Apr 2022 11:31:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="N4mh3yYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650108706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eI442CecrOG5zRQxRib6aqNug397+/tLwWo+QiraB1I=;
 b=N4mh3yYNQHGlzymtSj/IZhZ1wXorcB3gDhcFA2SrL8I05gIgmdAOe3jQtrzUrq/YvlWHaz
 AJeS41eDWqCrOhvjCbY3EWBozd67OFZzapZPmU6BSLCA0OpajnEKfDsggU0uNeysN/59J6
 lcDNsa2xYlB5lSLvKBa43/zVvaUce7w=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a850eecb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sat, 16 Apr 2022 11:31:46 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter@korsgaard.com,
	buildroot@buildroot.org
Date: Sat, 16 Apr 2022 13:31:38 +0200
Message-Id: <20220416113138.72159-1-Jason@zx2c4.com>
In-Reply-To: <87sfqd8eo9.fsf@dell.be.48ers.dk>
References: <87sfqd8eo9.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/urandom-scripts: do not seed if initial
 seed doesn't exist
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
Cc: Eugen Hristev <Eugen.Hristev@microchip.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By returning a failure in the event that the initial seed doesn't exist,
we'd then skip creating a new seed, which means we'd never in fact have
an initial seed, and this script is therefore useless. Fix this by
checking for the existence of the seed file first, and just returning 0
if it's not there.

Reported-by: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Reported-by: Eugen Hristev <Eugen.Hristev@microchip.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 package/urandom-scripts/S20urandom | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/urandom-scripts/S20urandom b/package/urandom-scripts/S20urandom
index c6b2ebd48f..6c6aea9eee 100644
--- a/package/urandom-scripts/S20urandom
+++ b/package/urandom-scripts/S20urandom
@@ -18,6 +18,7 @@ else
 fi
 
 init_rng() {
+	[ -f "$URANDOM_SEED" ] || return 0
 	printf 'Initializing random number generator: '
 	dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
 	status=$?
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
