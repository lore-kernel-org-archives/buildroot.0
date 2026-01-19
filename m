Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84334D29C2E
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 15:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A18E61217;
	Mon, 19 Jan 2026 15:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIJdbb_-Xvzt; Mon, 19 Jan 2026 15:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A80D61205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768835814;
	bh=OA2vQG7SG+71f+6HCNcowBLjB4EqFz25hMc+h/OmxOI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=knFS6cx/5q9xfwv2Z7nS4E6qEe3Arv29jjHtGGl5m9jeMg/YekKliOfTfAMAZ4t3P
	 FgEnhdw50yeJKjrXQqPCsZmwKu6+ez2ZpmI2qYaNtiyuPiKKlyWG8XcQ+BVAIwqVnc
	 TqLZj9GJOwpUUJc5b5X3COXWZngoTGdji9i2T2fNntumBsJ3v2EjMp0/y4rYcc1KI8
	 +xIDKoakixdbRTwOlGnNkV80yWEBjKjLyjQGACeH0lMYbABJI8DaYTo1ducHmiOuTl
	 81jfoKTsZQ+FPcP4xdcIGx6VA1PUf7dymQLi8O2yV4q1SVSkcx5T4yoKxv71AhlKRV
	 G8eeNFVux4LWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A80D61205;
	Mon, 19 Jan 2026 15:16:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97712160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87BCF83B84
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZdFVxQFvXo9 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 15:16:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD53D83B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD53D83B83
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD53D83B83
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47ee3da7447so27642195e9.0
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 07:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768835808; x=1769440608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f2MF5BAj7MNeJP1RE9uLcIomh8UXj9pfgWfGb+H9XEE=;
 b=QkT82Ve4dSQ7a1E9IfO/+gCvRdHo9P2e8VO08ZSojX5qbAr4BtwwlEPqXWC5Qzvs5R
 v/yvCZXVxkN+Swlmu9uv965orBbjAM9dcMku132Ukw4UglrvY+tHS13DtcYySyouHaUK
 IPROxeMjtqsu4ZEZlH4BgA0Pzd7n/VH95tsdkOjAqOtbM8ZSCnLmfAwFFNgkkvmWDlc0
 4sWixo0CD8wAWErjDApFedqO3k6BSjknDeJ3g3kTemqM4/MjURxU3kAKQlhw81l+f5PW
 X9jksLUDDb5fXomLrnIplFHMqyI+aGSk0HZ2q4XGfQSf/RqktMBZG2qM/qFjrEafHr95
 AwOQ==
X-Gm-Message-State: AOJu0YxWaRnHhVnxddVrjqpWfJWh6N26ecvidWn678vSupVtnszTcIcR
 O6YaBbsirsRfHbdCJlNpQlwq5doeY692UjtLuuOsmyM19FOtyqcsGfq/C5ETQ4/9x23ia6W5SuN
 80h5i
X-Gm-Gg: AY/fxX7+Rae8CKtCef9lJQCD2vb5d32uASFYmMMf0YHLWjMriPz9p+8A+R8a/Ct2/ii
 4BwRDkzsdXp5BIgFIfGlSbBYHGq7R3KC/CN9k9L9xuPi/QE+u3TEuF1NRUTglkJl+U5T4xU6H9J
 WjajuIKoGvU2Z0iLIizPisgawR1IExxCu8pyeGjnekStt7mBSnbvZL1wx1y9P6oEJmQtxqbh6gU
 yqA7Rxm3ICNaWPjKp+VxulpKBttGkCxr7evRtCzIMyshDHIwpsibit6ny1QO8VaEDK5UM/+iHHg
 f9DL7ZT+evfYzTGSQB+D/kWJnxRtaXifz3b48kA3UAJG04/m1fz1NDJd25izRqOCe5lgnxnwjcA
 jsjeAAgCNaWazQn/lU5VcAD6VRPEqhwMZZelBUpMUsDCIZeo6GSiiSAmSoqwuw1QxitaedmVYB7
 rbOwGozAAEZhGhZpFSRvGqDv/vNbXT2f90rvyCAMfWmNeQsg8g
X-Received: by 2002:a05:600c:3483:b0:471:1717:411 with SMTP id
 5b1f17b1804b1-4801e334248mr142592355e9.24.1768835808464; 
 Mon, 19 Jan 2026 07:16:48 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428acd0csm253324295e9.6.2026.01.19.07.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 07:16:47 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon, 19 Jan 2026 16:16:41 +0100
Message-ID: <20260119151644.100529-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119151644.100529-1-thomas.perale@mind.be>
References: <20260119151644.100529-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768835808; x=1769440608; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2MF5BAj7MNeJP1RE9uLcIomh8UXj9pfgWfGb+H9XEE=;
 b=PFUnndW+T8gYTProUE6+bzV3GnKmmSxlAidiRUsiMVjIQOn5jXQfX9WDNOFHxBpy8/
 luzEEEGE3cWiwd/VtfYDlHTMCEpOdBnI0YmPgtxgygyhPrAsAlfuInTMB+1x8WaNB6eF
 Znj7189ZtQH69Tb2F48qiCN/zk9bDqCHkcFUL+whixFKpTMrQ5hS00R/v8+eIXEeZeJ4
 oLGlsuECX7tLLU8GWQsGYVaWcYwruF+8pmBaoHkdCCErVzqPNvcjsjnEvA3y4UIBn/F7
 ChHnmMXZk+3emkik3/n+G4hcE7eH4/4HIlPDIZOyL14nt17EesAOjlk30jqHp4aIj2Px
 DlBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PFUnndW+
Subject: [Buildroot] [PATCH 3/6] package/pkg-utils: add 'provides' to
 show-info
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the list of virtual packages a show-info entry provides to the
output.

For more information on virtual packages infrastructure see [1]

[1] https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_virtual_packages

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-utils.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 288a202230..211e681e8f 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -201,9 +201,16 @@ define _json-info-pkg-details
 		$(foreach patch, \
 			$(call pkg-patches-list,$(1)), \
 			$(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$(patch)))$(comma) \
-
 		)
 	],
+	$(if $($(1)_PROVIDES), \
+		"provides": [ \
+			$(foreach provide, \
+				$($(1)_PROVIDES), \
+				$(call mk-json-str,$(provide))$(comma) \
+			) \
+		]$(comma) \
+	)
 endef
 
 define _json-info-fs
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
