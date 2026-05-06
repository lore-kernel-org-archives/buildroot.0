Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536A3CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B103833A0;
	Wed,  6 May 2026 22:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fOWMvjYIRbA; Wed,  6 May 2026 22:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 339E0833C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106835;
	bh=1iBkQ3DKn/oF8bFcILqqqzomg56OfiBL2GX+40V547k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=an+vA7WI3f/x1ZiTCuFWACRqE5BUS0bAyUP0Mw7zmyL59o1La2u8wAePAI44gkDl9
	 tlOxCa9h2wSsy052/9h2w705klSMFGpqlNpUP2RxsPd8tnFxp3peQD3CPCs1ujvU+a
	 5SlPgU3hti84vBLzIkNTU9uQ3QAVITGAILf0V3yxSRQj0sT7nS+StIYf5zH8tazsP6
	 thkvtfFzrNUoPb/g9+WqfM6q/NaS+XepY1Z/d2kaPSS3u1WstM0iKpQbioKXHPx8yQ
	 0W/EnVdmqdKgaWN3ZO1UyHJEVRhmSbSKdrri7iNvGNp3DoNWFUmw6HhY8+mg+b5RrW
	 DTsBt2aMvDYFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 339E0833C9;
	Wed,  6 May 2026 22:33:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5068C280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36EAB4101B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_etixqW5DPZ for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E4004101A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E4004101A
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E4004101A
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:52 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7d1872504cbso202766a34.0
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106831; x=1778711631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VpafDzrzLSVVmBiqM9aNtajLr0dVXhgscIwIP1vuxDk=;
 b=gjHGXkCc4P+/VbXj6kedKYIgp56Q4yx/m2cp8njEg9WnkNYeiW3r3uGuPghifgRqbd
 39IwCam41uye0je2YGOLZpqWDG3ey3STib7CxVaE9MXHwJWnzuArFj/Zv98OMShNOByL
 PL4wTHhwf4p+hWIczaBl4bpd9847G2b5415Vyz6vDvN8G9CZmOPp2plZdWDzIUVpN811
 ojBxLeguu/zYyy+Gu9oYb09eNIT/UBLHQHbPT7L6t151gclIRURHyp2R7ClCktebKoOs
 ijXvhscumJt9J1cVSYDoVRV8tE9AP77GIuhSX1FPLR9nvavB22ZlOBszwYcS9rQF11yk
 xBLA==
X-Gm-Message-State: AOJu0YwLQAi+cBx72pheYhoM5BT3RU0rTkJEehtZjwTdwB7rwV6FzKp0
 njEUnTht1tmezhBr9JgRt+ZghWKhQBDeg27ecoyT0oW3WA4GPF/vuRkn2siTrVZ3
X-Gm-Gg: AeBDiesSiAClVB4rJhkIx/Sq8C6JzKpVg2jPSdKimoBq21rTsBkcS7PXHFfgNyPEJgr
 gH+jYPyGwMP9dhQx2QJCNxT8Ur58tmPomu3zj0nUokSdteW9eP2NMXTbddj4OQFrtZZHztDJcDT
 QpRtYMnsm/dSjIPatgG/F0Qk3EAk7iSYyYyLQI0h0/QsU/yO7kkBLOEAtgpg+styawlzh/nBfc0
 j3ZmEPE+H4q7NOpepVMsQuVvdqWBBt1bAGaSiVw+0n3gY1wMgrgzloc1/SxyRgnWDGhjeIOFgLL
 Trwg+x3qQdVdPqps1yArtOSZ9Rye7RPCQGlbIAnG8XDreYTCHT8wfMMX/anMAbeu7gYfme2XTwt
 X8PCW9PVHDQM4T956pACwiWmBFM7YhAeJAopruzAoa6Os9y8Bdp2rQUqW3gkbuCeMIeGT6eF7He
 xkpBrPSzHL+ioLGKZPp8rJ8HlU5ssbmH8acQkmY7NtJdxd+LorgV989flHeO7ICWsRlISIVQOLH
 NonFgkE84WcyFirqckQ1xGxdH9l7LeANLFSZSXLoLU2mg6iLELHsWxmDId3YRtU9naHMZ+ouHL1
 wPWyuHM=
X-Received: by 2002:a05:6830:7103:b0:7d7:e3d7:e200 with SMTP id
 46e09a7af769-7e1fd052194mr283544a34.6.1778106831206; 
 Wed, 06 May 2026 15:33:51 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:33:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:04 -0600
Message-ID: <20260506223341.1759760-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106831; x=1778711631; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VpafDzrzLSVVmBiqM9aNtajLr0dVXhgscIwIP1vuxDk=;
 b=Owj++jsMWfwi/zKjiTzwLDIIuyWSbPBhbeBXzti5XJFseXN44526x11jxXwXJ1tAQd
 hkEzCqIdWRKBzwzuKHmAlC1Pg6ZvL1mReFCMM9jOa+OuvxEMxPROzZ3aKDTzm2uItqB9
 GV+W7p36O4MM81jdxeR7oXRb9JSirrdpcdu8J7cfqfhy4rdLItIC1YxH6a39JgYHv3Tk
 x8199BxjrUAYxmwI/UnF2IwR8ugU30ojOMPFAb98Xc1DOql2+CfHwdlZLEDyGIEgM0hC
 V2P0+K9QR95oTkBI3pPsa74OFehUELNUokKsypkU3lxL3pZPQE4Szl5RTg7XQhQ6bHv0
 SY0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Owj++jsM
Subject: [Buildroot] [PATCH 03/40] package/bonnie: preserve /usr/sbin symlink
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
 package/bonnie/bonnie.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
index e5c8640d39..6f48f38cdc 100644
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -11,8 +11,8 @@ BONNIE_LICENSE = GPL-2.0
 BONNIE_LICENSE_FILES = copyright.txt
 
 define BONNIE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/bonnie++ $(TARGET_DIR)/usr/sbin/bonnie++
-	$(INSTALL) -D -m 755 $(@D)/zcav $(TARGET_DIR)/usr/sbin/zcav
+	$(INSTALL) -m 755 $(@D)/bonnie++ $(TARGET_DIR)/usr/sbin/bonnie++
+	$(INSTALL) -m 755 $(@D)/zcav $(TARGET_DIR)/usr/sbin/zcav
 endef
 
 $(eval $(autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
