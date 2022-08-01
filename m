Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E0BC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7CC2812E2;
	Mon,  1 Aug 2022 20:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7CC2812E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2FISEe0IM1E; Mon,  1 Aug 2022 20:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 478C681268;
	Mon,  1 Aug 2022 20:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 478C681268
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D16B1BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAEB2408D0
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAEB2408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ukZSmv8AHJI for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:42:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CE88408CF
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CE88408CF
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:42:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j15so7445469wrr.2
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 13:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=eCr/yGc5tBk2XfxpIRk+hNeRsNNADu+N4woGrmqK6Fg=;
 b=nEdWqz+tGsCkeyNC1LanXJ1QRamxwZoQlPmMWJl8ZF78ty6/wdrujEB3okRRY/K0N+
 z08/e0qbnXBt7s0212nUMY69Ac62n/CjQEpYX9fmMz/lZnsFXXgomJTk4zpXBPUxUhwy
 GjMkyGwewWKXkIpB16VegWqozCNAFiZViRWAqVoGVb7qYGkS9wGwCrldZC5avyBozqOt
 OfBK5I290D82t5Wix4jGKx+ac1CGw88KgtGQN+wH46YbD9Wtest3S3QPCjg3UY2Slg2x
 n/dY8Jr8ncnRTcjt90/rGxIohc/D4WR2ZvR1rR21B5X3NyuotTchgUiAGS4FQKAvQlQa
 usmA==
X-Gm-Message-State: ACgBeo22KP2VbUxJZfq+Lsp67U/0s+JjqR7genLzC/5oZcR3sCE/vRZB
 BwjprXbIGG2y7JTifPylQxh1a2wV1uQ=
X-Google-Smtp-Source: AA6agR5UfdmOEL9/ZoClLqT0dTmRiRDlxsBHhwpfQRBp6kPCE9A4i8eMdCLV7HYeLlmWROtySSy2xw==
X-Received: by 2002:a05:6000:1d98:b0:21b:aead:9b6c with SMTP id
 bk24-20020a0560001d9800b0021baead9b6cmr11333709wrb.531.1659386548133; 
 Mon, 01 Aug 2022 13:42:28 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:a573:58bd:e1d1:c541])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfe10f000000b0022062459ce5sm5093819wrz.30.2022.08.01.13.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 13:42:27 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon,  1 Aug 2022 22:42:27 +0200
Message-Id: <20220801204227.2993126-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eCr/yGc5tBk2XfxpIRk+hNeRsNNADu+N4woGrmqK6Fg=;
 b=EFtBg5aSitiUR9BMep8vkgZ5rnjoXBYpOysXWi7oLNDxFQ17gdPDXDbvcMbrcjOiuh
 G/UoPJATag3IjbzNmWfWrPmyAHTAGyCm7z/JJmIkbXCazGj8vOzfRwPdmUyXUjyEr/Wo
 VRUengRTihH7PGCBRk8nRzUDHqV/lerDyzX6iTFtzapGPRQ/cc0xK82e+umPL9BmndAW
 KivUhl1qaBKzoGcuay0G2fAby1wIBu8y6xaxML65svdliRh9ogiXm1Mf8jscVEBqSub4
 PyYfHDDjWYSgJLbG5KJD8j3Mvl9/4rWSZRb7GiJamhs0/nB0K1Pl9FQtxx7MHe4Hhoby
 onGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EFtBg5aS
Subject: [Buildroot] [PATCHv2] Makefile: fix show-vars for good this time
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
machine-readable, so we do not care that the variables are sorted, so
we get rid of it to (slightly) simplify the code.

Then, we currently iterate twice on the list of variables: the first one
to filter-out the 'internal' variables, and the second one to filter
only the variables matching the pattern. We can do away by iterating
only once, and applying both filters at once.

Since we now have an 'and' condition, we can take advantage of it: when
none of the items in $(and) are empty, $(and) evaluates to the last
item, while it evaluates to empty if any of the items is empty. So we
can coalesce the $(if) and $(and) together: $(if $(and a,b),c) is
equivalent to: $(and a,b,c) ; this gains us one parentheses depth.

Finally, the cause for the segfault is an overly-long call to $(info).
Reducing that is not easy: we want to call clean-json on the whole of
the JSON blurb, so we can't emit the individual variables one by one, or
the trailing comma would not be trimmed away.

So, we go crazy: we just output each word from clean-json with $(info).

We can do that, because mk-json-str transforms all spaces in a string
to an escaped UTF-8 sequence, so we will never have spaces in values;
the keys are the variables, so they won't have spaces either; spaces in
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
Changes v1 -> v2:
  - coalesce $(if) with $(and)
  - don't output a trailing $(space) when calling $(info)
---
 Makefile | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index a743e42f91..07b594ea8a 100644
--- a/Makefile
+++ b/Makefile
@@ -1073,17 +1073,24 @@ printvars:
 show-vars: VARS?=%
 show-vars:
 	@:
-	$(info $(call clean-json, { \
+	$(foreach i, \
+		$(call clean-json, { \
 			$(foreach V, \
-				$(sort $(foreach X, $(.VARIABLES), $(filter $(VARS),$(X)))), \
-				$(if $(filter-out environment% default automatic, $(origin $V)), \
+				$(.VARIABLES), \
+				$(and $(filter $(VARS),$(V)) \
+					, \
+					$(filter-out environment% default automatic, $(origin $V)) \
+					, \
 					"$V": { \
 						"expanded": $(call mk-json-str,$($V))$(comma) \
 						"raw": $(call mk-json-str,$(value $V)) \
 					}$(comma) \
 				) \
 			) \
-	} ))
+		} ) \
+		, \
+		$(info $(i)) \
+	)
 
 .PHONY: clean
 clean:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
