Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4EBCD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E6DA4103B;
	Wed,  6 May 2026 22:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOORH1HTzxPO; Wed,  6 May 2026 22:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 756EE40C73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106848;
	bh=0wciKJqqh4gQrYYr6yjbryMIY1KyhOd+JaOtp8x4y18=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LtUgdsOuMf1Enlhq68TbXA5x1qk0w+3E4Gdb8SKFILhCr2dGyFIBs9Ok2U0wd/ZR+
	 uP//gGTXlxt9DnhVySBNwlklqYvW3hQyubQI6Xa0GRU13JMuI46pzXK1X//ezLu+sB
	 ucSLMhZ8Oge6FqAODN79eIRQrbpojTsJm6ZUwNU5iRgiCQKa6kuCd3GsNUJxHFojzE
	 V8rV8H59AFzia7SL2ZVj65B01VIvIJMfQ3NYxSjwA82TqLssFdn7DnQuzMlhaE1BfO
	 SYREDXGDmlfUKSqd3l+54wnAbRUIJHQPoRFzhADUAxMB1m2VauMAcEVnjY+Gp+3p0B
	 +6+zAI8nU3/Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 756EE40C73;
	Wed,  6 May 2026 22:34:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6472E377
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AC0040E98
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Btq4Xi4qDmD9 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A10ED40B70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A10ED40B70
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A10ED40B70
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:02 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-7dca00c1591so86347a34.3
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106841; x=1778711641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U+VwGOuNxOH1vHK/WkMLleYkRUDmR78WRiyA9ltZTaQ=;
 b=THd61Zi1JBgeFS9BOl4c5Pm3zLY9b9lT4O0PRqOMP1MIgJl1wBCVFz1x5raU2h5eEK
 biaqoa9t7nCE3QExNqTbcUmngv3zq3KuXSAwK2gVzG7imtCH6MCKYTehM0m7XWthL2W2
 FxRr01w35jifAiUNnglW+BgCp1AzHVAasa5YmxYcGXves5O4fqciMUE7+qLMOVBUueTv
 YKGg5KsTiqmiqK5oTfrhG0rsLj+FN40fNziZSSjNKjQDBci9AOD1eGcqgQp2kFSeeqWJ
 e8FiOcwVroymu3o0w9tCDeQndLFDY4TfmTeFO++7Rer30E5t3acblTTxit0lZJzOt7MA
 VV6A==
X-Gm-Message-State: AOJu0Yy3Aj1s5zA2mNBr8cu2ueP2De+ziMT74mliVZ2qwAWBFTWMvdXr
 A411irE7R51PMgZ4Rm0zJ8KDZWvvToECi2xjyjg1RbKm5qPHaE891FuhApcL9StA
X-Gm-Gg: AeBDievsF2hbVeqpjkYOGPvcvdDi86NWy6O6OJRdMuaTkBlpRMpohHKhLI61KdOO3bz
 PCuksfXRGXx/6YRsjd9GDAQCQ9yF/xd8RlTAvhpYZYGkGmA3WXlB3DytFTXgvur1XfiHhv7nL5F
 ZWZBf5TDxtbfZYlD+q9vmfjdiLA/EgfmSpXCPDIGhQ7+meHttO7xHEHnEphRvX/gg+hO65z/uEd
 I/vdGDHNtB1BpzBV7xQ8olOBr4cUe0pfxiC4Jma02qHILiAdKFXx2oUQO4Ko6herWQdwkPpCkTj
 IIOiXuqvJHlhj3kHSsOE6nUzdB3hysWtDAsg8kanXnmGRZg4qCGVjtOKq6cWJUfbv6rHB83xPCP
 FtP4SFHlJ4yBoK6jJBoq1edlRrhS7T81dFued4zSefH8R6VWrAlQkJYtzCcAY50IIDEjeSgsRy0
 A/puyvP/+vmpF9IGQhMtaxWHcbgWz8FU+PCXzVaqiLFx3NPLeoLKryU2k30p/IVFNua4sb8JS4E
 BPM929judgt6BO6vjiJgA2UBtQ0pQ1dJB7CCWmoqm2xTlkABeRuC+GVZSj9oz0xkDBuTdSe5QDK
 ERGxaNo=
X-Received: by 2002:a05:6830:3785:b0:7de:a330:ecb8 with SMTP id
 46e09a7af769-7e1defe86f3mr3114150a34.16.1778106841267; 
 Wed, 06 May 2026 15:34:01 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:14 -0600
Message-ID: <20260506223341.1759760-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106841; x=1778711641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+VwGOuNxOH1vHK/WkMLleYkRUDmR78WRiyA9ltZTaQ=;
 b=ePnL80PICk9f+Mt7zaX4QFF8S4pifu9+sjxuR9fReYijDyWFHNJg9JzQ4N4DoeIqN9
 9jyFmkUO+80VYqNfA8IXVbRjgvsBZLwF2vk9pbXwpujyvNTB9WIW6qRqUour+s60DVeA
 OeOciMuy4IXTN22bAtcCLBlvSjoHoiYK21+cxB4LM6WbaowjxFgFcioGT/rja6kQkW1O
 P4II26ppX+71G2k8X+HZNUozsbm0t/HXACdKu7MGXghjPv/Ze6hxF3tKPqPyenkqJlDb
 uQoByO22XljopbHAV6z7NzT18jyRrSyVdskGBAWzrlKfoR5OoV56MH+3UqYm8OSseDt4
 phYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ePnL80PI
Subject: [Buildroot] [PATCH 13/40] package/irda-utils: preserve /usr/sbin
 symlink
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
 package/irda-utils/irda-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index 18a3e58604..031a024486 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -32,7 +32,7 @@ IRDA_UTILS_SBINS- += $(IRDA_UTILS_SBINS-y)
 
 define IRDA_UTILS_INSTALL_TARGET_CMDS
 	for i in $(IRDA_UTILS_SBINS-y); do \
-		$(INSTALL) -m 0755 -D $(@D)/$$i/$$i $(TARGET_DIR)/usr/sbin/$$i || exit 1; \
+		$(INSTALL) -m 0755 $(@D)/$$i/$$i $(TARGET_DIR)/usr/sbin/$$i || exit 1; \
 	done
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
