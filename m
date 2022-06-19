Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A42C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 19:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C19AB82503;
	Sun, 19 Jun 2022 19:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C19AB82503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5riJbOApQHQ; Sun, 19 Jun 2022 19:41:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB4282444;
	Sun, 19 Jun 2022 19:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB4282444
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5F71BF328
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 19:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07278410D7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 19:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07278410D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-4dOQfraYlj for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 19:40:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17D8C40994
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17D8C40994
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 19:40:56 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i10so8226927wrc.0
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 12:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Px9jwpxQP1BcUokR+R31OjDYYQzZx4YBjnhNmhcUkag=;
 b=LSBE+L5OMA8noGO9IA16oJGp71dgaBPG64sBHPnlTafucOYbI8IDppRCDO6Mr1z48D
 KO53Nhv1bonGDYio1Vp2CeJPgokGJXS3So/jsGYH6UUp1eA0UIbNOrAYDnmU4eC+qStT
 axLWQvqX70r8lNvj8bDf+A2tas+9D+60XoJAPT57jg5a+/Jp0s++QrYEQWb6YUNwCOM4
 DNCOAGOtkXALvg0xxmSK1tjhzZ8ORiWWYo0DvYq958S3YRzKJNbO2J4ZoN/JXMUOuuQK
 y/GI58ripov/pKP2wKmg8RYg8+ArXPE0Vs4f7gXK1Wfq+0R5oD/NTIjN2WwI62s9FBF3
 R1Mg==
X-Gm-Message-State: AJIora9KLu+cbOHWGQBaE8D1oTX92nwVC3PmKbPlSh+vfAl3w/G/AkNd
 HNK49gU8S5cY7FX15I0JLtkpQT+PV8k=
X-Google-Smtp-Source: AGRyM1scuWED2p4KQmGDGsTpXK22MaEoULw7ldY1cipd8+4wzQKdEpRAnXboMz3sWCtykm5NA8fKUQ==
X-Received: by 2002:a05:6000:691:b0:21b:8d0a:6035 with SMTP id
 bo17-20020a056000069100b0021b8d0a6035mr3285130wrb.230.1655667653964; 
 Sun, 19 Jun 2022 12:40:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c155100b0039ee391a024sm10325768wmg.14.2022.06.19.12.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 12:40:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 21:38:12 +0200
Message-Id: <20220619193812.837258-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Px9jwpxQP1BcUokR+R31OjDYYQzZx4YBjnhNmhcUkag=;
 b=H3B/cfC30MKjXoITJLLYpzGnAuWJnykHdCjL9b976jTSloFRVDYA4xyZ08HrkFdIlp
 LXidhskyjvyvBrUG8sat1X5MMZAcMHybZQ6J+zjriEutkdD1K0kPU6pl6a8gD+C+Iaqn
 V1NcWwIpk3dCNWKa+TdT5fBkyWjO79ma0DzBDu/H6s9gsiQlYLrs1ndTA6DslmiFPefz
 vQlW0zPfb4moLOOPU+mNgstIyCAbzbizA1VtgNCkdnBk1mCEz+thaidg8gOdIXXI3pZG
 tly21WOEWz+uhnRFq5oYip92HQPE2F4nvmhksbzR43fyLHFr1Q7rEzbFUl9Orbam45oG
 /AXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H3B/cfC3
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: fix email of Dario Binacchi
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix email typo added by commit 776385d645b37cfc43479b37e106244aa9ab2e85

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 460a28c96a..e004927f0b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -654,7 +654,7 @@ F:	package/lua-cjson/
 F:	package/luaexpat/
 F:	package/xinetd/
 
-N:	Dario Binacchi <dario.binacchi@amarula.solutions.com>
+N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
