Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCB7ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 03:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 630F140AFC;
	Mon, 19 Sep 2022 03:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 630F140AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9V7VC1YjHDXi; Mon, 19 Sep 2022 03:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7271A40439;
	Mon, 19 Sep 2022 03:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7271A40439
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 319E91BF414
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 03:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C6FD40439
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 03:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C6FD40439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7GY-027fVPq for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 03:46:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CEA440424
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CEA440424
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 03:46:28 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id z20so32414264ljq.3
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 20:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=c0qNlBC06gpJF5cRtXiKmA2BI51uzcJBm0Ykp5wh6Ug=;
 b=kiPD0eLN74zLTx4d9I+abQBjZtoQ/78P4A0C9RdB+qhNM36HrJLR21H/k2XgbuhbxF
 r1rYbYURJNgC0J66sv3lPBtsueDdN9TLNE3okSaexgJD/R5yR08yeOy7nZJSIP/HoOsc
 fcfynbC+VGERLi1LKHa5T5wcZiGplqGdXtxfcIDAVbMuEhvbNIXOXtCWc9jKsD7bC3xy
 3oIcLJDGQVUTLwIM43cYJnOYDt0b+CHiskfMlrFh7RKZOTH4a2Pod9C+HFwMTBSVO96d
 x+nF5vO0UdcJ8niTdFD+dMQBEvrF8zyCSS8arB8NzRB8JDMNBLKKkCT+lOo7BfJUkPaf
 Q5cg==
X-Gm-Message-State: ACrzQf2RwkZngokrBYewPNHyi1fT1ykVCeLLQoQPysotnybtL9OaKG33
 IXLw28JScnwpUObh+VcpAZXIBqGpCP8=
X-Google-Smtp-Source: AMsMyM42RTwbvDI7etaybh3vPch+wWKlCcHZuldHKOcXuD/C5EFdr8IPnW5dWmCYUF2OtYALqvDw9Q==
X-Received: by 2002:a2e:9e11:0:b0:268:c7d0:9662 with SMTP id
 e17-20020a2e9e11000000b00268c7d09662mr4347825ljk.309.1663559185642; 
 Sun, 18 Sep 2022 20:46:25 -0700 (PDT)
Received: from gimli.lan (h-176-10-137-51.NA.cust.bahnhof.se. [176.10.137.51])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a056512104700b0049c86ca95bfsm3559696lfb.52.2022.09.18.20.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 20:46:24 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Sep 2022 05:46:22 +0200
Message-Id: <20220919034622.306672-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date;
 bh=c0qNlBC06gpJF5cRtXiKmA2BI51uzcJBm0Ykp5wh6Ug=;
 b=R78M6euANLwF+Nlw1wdCU8zKmBxhTumFrllIhyrS3QyswPvztb3+8qODU+Nh7CNfGm
 XpCEcQElFCW8oRrjBstA8thCddIW98xaSDd/WEcLgpZaOnCNrmA4tf9Qg+cJJaypaYMg
 09mnu4ngyDZwsFKjaVuFJ6sbK4hDQGu10hWkYfR97lTWntPApFr13dK/deeUtrTIUwQo
 SIkI1Hcb9TSNcvy7Bv3cK1uAjAmaaToXjAs3ZvyKAPTHcWCcz/o1Ai8CnICXhUYgeRGZ
 /3HnanqqTvUyyVAFxgoBmRVnodTWvyVJWQ5lr1rg/ErwJpVwS98t2eKoQLzymB4mHS7y
 9O9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R78M6euA
Subject: [Buildroot] [PATCH] Add myself to a few projects where I'm the
 upstream maintiner
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e8626341e..14b91fca8d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1481,15 +1481,21 @@ N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
 F:	package/inadyn/
+F:	package/libconfuse/
 F:	package/libite/
+F:	package/libnet/
 F:	package/libteam/
 F:	package/libuev/
 F:	package/mg/
+F:	package/mini-snmpd/
 F:	package/mrouted/
 F:	package/netcalc/
+F:	package/pimd/
+F:	package/redir/
 F:	package/smcroute/
 F:	package/ssdp-responder/
 F:	package/sysklogd/
+F:	package/uredir/
 F:	package/watchdogd/
 
 N:	Jochen Baltes <jochen.baltes@gmail.com>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
