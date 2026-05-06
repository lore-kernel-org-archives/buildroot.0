Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9073ACD3444
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AE8E83478;
	Wed,  6 May 2026 22:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQ3_oFWDheSX; Wed,  6 May 2026 22:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 164A483720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106871;
	bh=nStTpD2WnsBi6MfZ3uY3iRuPSmt5d8OItrs9dPJvbOQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kGiIPcDFk0Hg28TzmjuaMonXdRjGGtAdr1kDOxvzXy6TG5IlRAptnrRmyIy0FwWXP
	 HUfhSHx6USpUWzaPvUspFzPBhtTd1tT3/hMmo7B14qptz8KrfsVXuL/+CIh8KRBOFj
	 hk7pIfBP4pE7PiwjABXJKQvW32KeXEpXbDFWbrr0US9I83nJdu3Bsa6diSvrdS5Q2I
	 A/0jraVjBDgDcSc32weSMA1SFaRhp3KvP+Akp0wjJWKTVGhW+1V//Bz5VO6MylFO07
	 Jg90qqKvwhRCTvlnqb07GbYqPby316t/XCxYXUYvKCKR7zlPe7vk74etfh/RJwyn4t
	 Uw3SdcHUCd/lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 164A483720;
	Wed,  6 May 2026 22:34:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F2A4317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85049406FD
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUCBNaAxIS8S for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 836E1406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 836E1406F3
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 836E1406F3
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:24 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7de4ed0593fso123839a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106863; x=1778711663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vhunqalpAqCW0JAxSfYzVzP41mxv4tdwG00KHZUSUmk=;
 b=WUHSjFChQk3BhfV8/EXmGwAM38KtJXMWzCoQjIiNvAtkIh6MZt2CUftyOKfrK0RJiQ
 oGqY8FC1LxVOuw1yJXJMoTb8LWBe0oTr2Bh/MquZx94amOTGRXQ7Pr66p3AGqkUnKj6s
 gY0ZMKBpS9wQFzH4IkvC+qrWptMTjdxXwM0k5hwPRoo5BOsdKE+KEx9ZUxUZHtcViySl
 i17ul+l7G02S2D4pVN7Cj4rlNUVoepPSgESiGpPQ1CmrKmpZBbFIsQllZLUxVzuCOJgh
 dqrdJZFNgJXT+iLeMtEFXWdWLzaJmJc/2b0WogIt38K9Uow/pan5i+sAlEx6LIxUHQKY
 v34g==
X-Gm-Message-State: AOJu0YxHtcAi6m9c0NJYjhzbMMqGL6A8QKlMVmrbiqZaE4DImM6GrMC0
 4rt7Qnzs3/980BFg2qpKT8KZnv3L+PYr72lBp8DR228BjZ8wtFXH9P9Rzds1FYRL
X-Gm-Gg: AeBDieuY4qEd+0qGL6FzTXM6GFYbWiU7NY7DDrF5K2D1ewQPS/ciwlztTHRDSy+2Qeo
 ivDgPLkqnmwtnN3SIqRP3Mq7Td5K9IUq+if5HOiyS9qvZD3btYCDjwr0O1RyqgvgnSVDfgaDh68
 dPQOxPhY6/sbhqCuwktqaiPc7HsCPT8YNKwSWC9rGboCWXqD7AmDuWnjntPkQwSceScbnrBjA2t
 tR6fIzzuc45QFHpGC58EhqdwCt10fCJAplKXXxmiJwwFglDORntCOSuBIEBHjqUDHx06QhNqfxn
 lFMXm8D0dU435+zLWKdZxUTd1KmLfRK/GcmWv+NbMtT2Z5h8iFKj3MFNRS2sN53xCUmbhzW8TNw
 zBF3mx4vgKNqOHMRSIii9yAfzC+jda9jPR+X+cmV/YNuK2WWCslsKikf0HHFtZJYlsSg2ttcg38
 vT5DUlin5O+m+jEqyvtG4zMFnPUkgH91vsEkaALEK/aVVCvdJwfOK+VCJ7NXIS3LkTy7ZYGvidX
 Td1PDI0D/ZLYV8eU8Y1b3YxS203BGe1ObazhLj4q4E6q2j9D65Mj4jccfJbILTFak5xCm+8ORvQ
 0xnKNZo=
X-Received: by 2002:a05:6830:6f86:b0:7d9:f50f:96ad with SMTP id
 46e09a7af769-7e1df0b1725mr3028243a34.24.1778106863167; 
 Wed, 06 May 2026 15:34:23 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:35 -0600
Message-ID: <20260506223341.1759760-34-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106863; x=1778711663; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vhunqalpAqCW0JAxSfYzVzP41mxv4tdwG00KHZUSUmk=;
 b=q6dJlFZDlXybRbUuOPtpdgGlZbPfSRL/HgltbSW2wILnJ0AxBPrcN03UIFxn3PtAVB
 iUoBKDuUFS+38K6KSvqI4mz2012ejvMjGOtusSVyJTBbOrgj/3uvILc7/Jt5xzArSrHk
 +6mWT7DZ+plGRdAPPOLEJhxNZ4iSe6Nnuea0habTI5wPjFB2/uKVIXorZveqMEZk/MLR
 FPos+ot+bYKjiF67I6Mo5Pq2je+YAywEEikgGDRR1MMgFmFU8fGeaKzj5iIADJfk8IsF
 ZvlqncEDT4N+430luSMcWw4mCB3P121ni88TFQzPv5GN/93Jsl2ZtpuJPcD+2rmtF2Zu
 At6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=q6dJlFZD
Subject: [Buildroot] [PATCH 34/40] package/tunctl: preserve /usr/sbin symlink
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
Using install -D for files below $(TARGET_DIR)/usr/sbin can create
the parent directory path and replace that symlink with a real
directory.

With per-package directories, this can later make rsync fail when a
package target directory contains a non-empty usr/sbin directory and
the skeleton provides usr/sbin -> bin.

The skeleton dependency has already created /usr/sbin, either as a
directory or as the merged-bin symlink, so use plain install and let it
follow the existing path.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tunctl/tunctl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tunctl/tunctl.mk b/package/tunctl/tunctl.mk
index 0d7b88dfa5..28db576fef 100644
--- a/package/tunctl/tunctl.mk
+++ b/package/tunctl/tunctl.mk
@@ -15,7 +15,7 @@ define TUNCTL_BUILD_CMDS
 endef
 
 define TUNCTL_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/tunctl $(TARGET_DIR)/usr/sbin/tunctl
+	$(INSTALL) -m 0755 $(@D)/tunctl $(TARGET_DIR)/usr/sbin/tunctl
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
