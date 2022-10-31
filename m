Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F63ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 17:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BF27405BF;
	Mon, 31 Oct 2022 17:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF27405BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RR5ZtNjp9Ine; Mon, 31 Oct 2022 17:47:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBA0640562;
	Mon, 31 Oct 2022 17:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBA0640562
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DF531BF327
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5839C415B9
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5839C415B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HW5OkRpctVnt for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 17:46:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EDC540020
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EDC540020
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 17:46:45 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f37so20373633lfv.8
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q7vZYhXGyMUqxvMV/VsDXfx9YP4NGHFveq53Rrm2NuY=;
 b=bd2OWolAQNAUT3XeSSkMq6qPNs9k0G7kBRHXLYz7pMZLzcj/tBL+0RFzM/fJrQJMM0
 RzZphfu0GST/NOQEQjXz0+Bf8Oi1GZbabDSKL66W3qYrxlH0ql/sCaJvFUVtTSPqmo7G
 UagbXBJpJlnMuatefCTbo4M9Yw+aOw/yS23USjNi7ICnRF3lvoddHDD1KXeBoJtilAyM
 hKKYWDIV2ark7OwOrG2m4KpyBF9OLOnHw9HT5/Gdv/ce3hviM4OKKHXfM8a0s2lrXCpL
 t3cjkPObbMRNVR0dyqx73RzFEXRRwOyLJ095BO0yb71O0ehXf7KpEuI8uZUeBCFd+jQ2
 649w==
X-Gm-Message-State: ACrzQf06vtNqPr27x84RzeCv3eo3vldIpxY1oiQlBYX+lj96lNbwSshc
 3W+Q7p4Kpf8MpD8NAbUfdw4tmS7G7FY=
X-Google-Smtp-Source: AMsMyM5s9r74zMR/qReYk72FoJUjPwJHgDZPNbgb6xlPGXu+/kkEeB4jzGxMXvb7stetPT3T6zepRg==
X-Received: by 2002:a05:6512:3e6:b0:4a2:3a88:51c9 with SMTP id
 n6-20020a05651203e600b004a23a8851c9mr5521789lfq.562.1667238403795; 
 Mon, 31 Oct 2022 10:46:43 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21f:cc00::af3])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05651205cf00b004a9b9ccfbe6sm1362239lfo.51.2022.10.31.10.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 10:46:43 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 18:46:31 +0100
Message-Id: <20221031174632.377586-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031174632.377586-1-troglobit@gmail.com>
References: <20221031174632.377586-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q7vZYhXGyMUqxvMV/VsDXfx9YP4NGHFveq53Rrm2NuY=;
 b=ZCdCj7OZ8CF6Nw+/sAaF4qjwql5Opc37x4f8dYXq19qGCZCldfMMFOQLer2iDz+V+N
 eBxD3L94tysem5Qtcnglav7RiBJ0mR27IFP+QVg1FIzpsmIzrRfZqoLBSVldB2yDPcyh
 wdhyx5Xf+fAlysmrLKkb7k7i4elg/iSVvyEAaUO7yz9WyLaW1/82vtlE5WCjNou6VU1V
 OlUA8UREPFOmnPZB15N4mfUxk+B7um4YsV3xVjyvr2J5aXowV6xgP7pmep7yVBuSQ5JD
 nWb32y9nyvsqq3DgSdO94LpqGvvU0Y/Lseac1B22jc8St4bI9Wq0GF6EstoErLKUmm2e
 Mwnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZCdCj7OZ
Subject: [Buildroot] [PATCH 2/3] package/ssdp-responder: minor update of
 help text
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/ssdp-responder/Config.in | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/ssdp-responder/Config.in b/package/ssdp-responder/Config.in
index df57546eed..8b5dfe67a6 100644
--- a/package/ssdp-responder/Config.in
+++ b/package/ssdp-responder/Config.in
@@ -7,14 +7,16 @@ config BR2_PACKAGE_SSDP_RESPONDER
 	  targeted more at embedded systems that need to announce
 	  themselves to Windows systems.
 
-	  ssdpd is a stand-alone UNIX, no external dependencies but the
-	  standard C library.  It has a built-in web server for serving
-	  the UPnP XML description which Windows use to present the
-	  icon, by default an InternetGatewayDevice is announced.
+	  The project consists of ssdpd and ssdp-scan.  The former is a
+	  stand-alone UNIX daemon, it has no dependencies but a standard
+	  C library.  It comes with built-in web server for serving the
+	  UPnP XML description on port 1901, the XML is used by Windows
+	  to present the icon, by default an InternetGatewayDevice is
+	  announced.
 
-	  Also included is ssdp-scan, a tool similar to mdns-scan, which
-	  continuously scans for SSDP capable hosts on the network.
-	  Take care only to use for debugging since it scans the network
-	  quite aggressively.
+	  ssdp-scan is a tool, similar to mdns-scan, to find other SSDP
+	  capable hosts on the network.  Take care to only use it for
+	  debugging, or quicker device discovery operations, since it
+	  scans the network quite aggressively.
 
 	  https://github.com/troglobit/ssdp-responder/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
