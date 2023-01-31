Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F72C636CC
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 14:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6493E60B36;
	Tue, 31 Jan 2023 14:20:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6493E60B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0MiE6Pn3nEP0; Tue, 31 Jan 2023 14:20:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACD9660B2C;
	Tue, 31 Jan 2023 14:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACD9660B2C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C67B1BF48C
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 14:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25A224161C
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 14:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25A224161C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJgIZab8zQDa for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 14:20:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 234DA41625
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 234DA41625
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 14:20:09 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id qw12so26130946ejc.2
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 06:20:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQYBwsmid34AIEgl0R4iNIFoK2eSBYSehAgUp3I7Gxc=;
 b=QrqA9giL98argvNYYrMrA6YHEQM2Uoau0C0qB9YESEt+abSgCD9pZFcXyyDGw8hypM
 1NlcWj10j8lSERu5eP4YxYhSEsT5BaN3LG8PavZmfgFSJ8LrpbotOqhr/Epj8QqpRchi
 hxVtwOwGjPrtQa/kZXkNcVPcXvo29bxnqV+lXrYnOw8HIM4DEKP7XobvSSaj6fouyIJi
 462xG/nbyRA//235NtApdUV7TMC4bQzRYGCeNgF1she7fXOCgVvHuXCzsRCzeKRMOBvX
 4tAj7DquL6MOXJhjIGln0KhdffqBYrjftnJ/mQI14FbGCmsLzZ/FRrMOCiigvshvbbQA
 oo/Q==
X-Gm-Message-State: AO0yUKU6gqnaKuOedWCe1ossh5kw6JzWpp7O5A2UlVIrp2hjS3m7/zRY
 TaQBo0EqRjrNMcjTurn4cWkfYlYgp8E=
X-Google-Smtp-Source: AK7set8bQf15e7kfUI8m6OyBL1O0ysN3OKCNkddkNHHks2gB47obAhjwIscV9NtgXmDfT5mBhdsetg==
X-Received: by 2002:a17:906:da19:b0:88b:4962:b72f with SMTP id
 fi25-20020a170906da1900b0088b4962b72fmr4121748ejb.20.1675174806940; 
 Tue, 31 Jan 2023 06:20:06 -0800 (PST)
Received: from gimli.lan ([2001:9b0:21e:3500::af3])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a17090651c100b008787c8427c1sm8036016ejk.214.2023.01.31.06.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 06:20:06 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 15:20:03 +0100
Message-Id: <20230131142003.1354787-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OQYBwsmid34AIEgl0R4iNIFoK2eSBYSehAgUp3I7Gxc=;
 b=CRuGOMOxfKBPxwBrL7cew9wUwj6jA6fxj18MRwQG2s0Jgw22MWihs1JUspsLWtUwe4
 DAQtbdbvdtINlxICHwEEPXr1ObARLLUkRN68h7/GMPIc2ZKCH1OkhsqgVLdusLRedsp3
 4Wv8OVFG8jVAyKR1rj8xrKNFuCRDNDtYXtaaQSSDulF9x1sdp1Q/mRGvDGJUxQCIxO9Z
 XhJ/Xz/w4Di/7MK/Cf+XxQcUVbC65V6gOX9+OsmwOdOajBenJWBsEJc2tNkPYBPFa/VJ
 63F44wzkD2kUTNZVY9QkXdFvpkJu8LMSEjGUtsUvr4sSRG26uhWJ8PFwGMtSdyAuwjTh
 2XDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CRuGOMOx
Subject: [Buildroot] [PATCH 1/1] package/netopeer2: fix sysv init script,
 does not start
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - The netopeer server forks to background by default, no need for '-b'
 - The path to the daemon is /usr/sbin, not /usr/bin

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/netopeer2/S52netopeer2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netopeer2/S52netopeer2 b/package/netopeer2/S52netopeer2
index cf53a8f109..cadd6b9feb 100644
--- a/package/netopeer2/S52netopeer2
+++ b/package/netopeer2/S52netopeer2
@@ -8,7 +8,7 @@ NETOPEER2_SERVER_ARGS=""
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 
-	start-stop-daemon -S -b -q -p $PIDFILE -x "/usr/bin/$DAEMON" \
+	start-stop-daemon -S -q -p $PIDFILE -x "/usr/sbin/$DAEMON" \
 		-- $NETOPEER2_SERVER_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
