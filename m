Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C89C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC2CE410C1;
	Mon,  1 Aug 2022 17:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC2CE410C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id glI5HzBkkRvx; Mon,  1 Aug 2022 17:29:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75CD3410C2;
	Mon,  1 Aug 2022 17:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75CD3410C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E43311BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD03B410C2
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD03B410C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBe2joARFYFe for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:29:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1F71410C1
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1F71410C1
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:29:49 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id z16so14930828wrh.12
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 10:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qYs6J5qO4afoHHy9RMxYfhkea86bBx92Qf0R7U3CxVo=;
 b=gmY3+DbLBWXG7SUoM8I9cNS8nNqfa8+s+PLH7CNOxMouo4NNsfV8ztCdEucL1R3D72
 2ALzchzomUqB8fyFQ9iWaqO9YYCxfFzorkblNz3KDWQeo8bZluMJ5gpwMI8gYLozC5MK
 u6VcdOEWdVfSAYdlF9WRh3mIKsNYVQbDtVk5dBi5/IJ1e05LRLlUP9qbwdLI26wbbyRH
 65WfE1iTS+qOcq5t4ODHPoFJ27XSIrwN9KhTrql9EDYO/h1rNFXeY9Me5lMe8OFP5svD
 +Fh22WxLmlBJeSXHPlz2dPx8STMD1fRs5nSAaeHf2SELK6fCGOhXiU5zLQwYpmFzmBh3
 FTPw==
X-Gm-Message-State: ACgBeo2+L7Zj8Pa9FSpGdv8b18jndowK/eUaA2tvWoCGIGjU+vtu0ZWP
 sV6KILmQnbJ+phfHkDgBHUGBVIeSWHM=
X-Google-Smtp-Source: AA6agR5wT1LZmq6nCmZm1Bljxta6zMj15DlutgHpjOmD/qYCNvAf9lNr/7VuvM6dMjiwBT0M4CbmZQ==
X-Received: by 2002:a5d:6c63:0:b0:220:5e4d:c6e9 with SMTP id
 r3-20020a5d6c63000000b002205e4dc6e9mr6036002wrz.250.1659374987937; 
 Mon, 01 Aug 2022 10:29:47 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:a573:58bd:e1d1:c541])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a056000038b00b0021e4829d359sm13282407wrf.39.2022.08.01.10.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 10:29:47 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon,  1 Aug 2022 19:29:46 +0200
Message-Id: <20220801172946.2926040-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qYs6J5qO4afoHHy9RMxYfhkea86bBx92Qf0R7U3CxVo=;
 b=HeTKSS/zAb0vI9FkO4T7vnzLmXmkSjd6V7uc7dgRZ6/B4g1t1OyEkggMI7rnFpZVlC
 akZAHABRCUD9Nw8NDul+cr+UOEUTWJAIvoTsrwGI8wONb4bHhn+zNLCXculHqn40PNuh
 kWBuGr+nTNYWzVjDZl9aU73XG6ep97VuE8g68lzl74hQv81aCbUIHJHf7REWv7olBSnD
 9tRPaPxETazN8hzod/JOGW5KQITx0RWTZMScB9hDQK72W0IVLcfjdjHPFWIkLJ8OeHIg
 xZ1kgdCfNcxh2ofWJT8cDukAVnRfEorcNxSDF1hbZvOF1YnfNuSmYpaWocoeTlivDSuD
 JI6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HeTKSS/z
Subject: [Buildroot] [PATCH] Makefile: fix show-vars for good this time
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Roosen Henri <Henri.Roosen@ginzinger.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 5c54c3ef3db2 (Makefile: workaround make 4.3 issue for 'printvars
and 'show-vars') did not fully fix the show-vars case, which still
segfaults.

Overall, show-vars generates a JSON blurb. That is supposed to be
machine-readable, so we do not care that the variables are sorted. So we
can gain one level of method call by not sorting.

Then, we currently iterate twice on the list of variables: the first one
to filter-out the 'internal' variables, and the second one to filter
only the variables matching the pattern. We can do away by iterating
only once.

Finally, the cause for the segfault is an overly-long call to $(info).
Reducing that is not easy: we want to call clean-json on the whole of
the JSON blurb, so we can't emit the individual variables one by one, or
the trailing comma would not be trimmed away.

So, we go crazy: we just output each word from clean-json with $(info).

We can do that, because mk-json-str transform s all spaces in a string
to an escaped UTF-8 sequence, so we will never have spaces in values;
The keys are the variables, so they won't have spaces either; spaces in
the rest of the JSON blurb are totally optional, so we don't care how
many there are. We know there are spaces, because we explicitly
introduce some (after "expanded" or "raw", for example), so we should
never hit a too-big word for $(info) to print.

Thanks to Henri for the suggestion to push $(info) further inside the
macro.

Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Roosen Henri <Henri.Roosen@ginzinger.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index a743e42f91..c419e2ade2 100644
--- a/Makefile
+++ b/Makefile
@@ -1073,17 +1073,21 @@ printvars:
 show-vars: VARS?=%
 show-vars:
 	@:
-	$(info $(call clean-json, { \
+	$(foreach i, \
+		$(call clean-json, { \
 			$(foreach V, \
-				$(sort $(foreach X, $(.VARIABLES), $(filter $(VARS),$(X)))), \
-				$(if $(filter-out environment% default automatic, $(origin $V)), \
-					"$V": { \
-						"expanded": $(call mk-json-str,$($V))$(comma) \
-						"raw": $(call mk-json-str,$(value $V)) \
-					}$(comma) \
+				$(.VARIABLES), \
+				$(if $(and $(filter $(VARS),$(V)),$(filter-out environment% default automatic, $(origin $V))), \
+						"$V": { \
+							"expanded": $(call mk-json-str,$($V))$(comma) \
+							"raw": $(call mk-json-str,$(value $V)) \
+						}$(comma) \
 				) \
 			) \
-	} ))
+		} ) \
+		, \
+		$(info $(i)$(space)) \
+	)
 
 .PHONY: clean
 clean:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
