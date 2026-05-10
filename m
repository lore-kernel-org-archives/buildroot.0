Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2BECD37B5
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 19:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2039F41764;
	Sun, 10 May 2026 19:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8SIRRhxzz1N; Sun, 10 May 2026 19:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E99241C20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778441929;
	bh=03L70nXBUuat6q2RdHcYh9tl1yRFKb4621c7O0+2SN8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UpWE0TnKvuIivsuYVfUjvE0RsNjYaPYo07VZJk1Yw0suId/aGgk+u7PWcC6zhTezW
	 uqEjtxji8iKD7Ag4ebu/TZmpyU5tL1PGIHysJ1dBDHN9PNmqYUuiIFDFUDEUt7Z4wd
	 D+ZqvmiJzLiMeHIZYwk3XZRAqYtiSoKkbxJnPddXfTXs+0XctoGJPfHd/v33ME7qMd
	 QOLklkXUblyIiBW+W1iIwi6OBA7V8tDQanIZ455H5S8RFDp+t/3qywdMNYrpaOrvnE
	 15dP1CmhxRK5L8KmP+XkzaCJHCkiQ599cjHAY6K74IbkIvgjEorKtMsJMR66Ff1icZ
	 MZBeCjVrTgJaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E99241C20;
	Sun, 10 May 2026 19:38:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12699173
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 037B741C10
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZrz1cxN_twM for <buildroot@buildroot.org>;
 Sun, 10 May 2026 19:38:46 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7AC041C45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7AC041C45
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7AC041C45
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:45 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5a40d02b58bso2622292e87.3
 for <buildroot@buildroot.org>; Sun, 10 May 2026 12:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778441923; x=1779046723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lXMVRBTUw3UNaSYeP9avUfQfrgvZcYX+sXRLH4Xs7GY=;
 b=oQQwij08kQ/aUhVIrn1TG/8CCfse5ElaTjESbPngLG7Dz/A1gRzoWAX9tCxwxioRYf
 zg2aMNT5VRpoNyii4EB9q+YwFKhO2xaFjyrlwW/hRs3etHj1EEYcGNyfmukBEoKsOjNa
 HHnVq1lEkHxP6ebeuMTlS8wp/rPeaKUjA7pWkh698rCZSugQ0xlAPR6XvNlVJzSBq+OW
 IkZzpzFc6RFflK7dnPF9Qd35Fy8fWS24qKaQet8auh/cF+w8Er4xpTZ9O63j9NJ+t55Y
 NLQthygvSNRRkdy/eV5wVfUDcWfKgUCgFK4b/l7meSnHPLRgKlA1YZBxklcUh7GCEUrc
 mKKg==
X-Gm-Message-State: AOJu0Yw/nPB9fBVTS/PHED/OntYpDdU5SFzJ71/wK1BBW0ysNFw+QIB0
 3qxJWOYr4fENZEZYdaXG7LEHrTO4yDwmslpa5dSI32Qgaugh6cADAEMe4mpyA3EUkXagLF1HKwK
 PJr8goC9BGQ==
X-Gm-Gg: Acq92OE5eNIUE4IcdhZaQTsD7Xh8GRV0Vuig0DWbAVJkMqJfbF0JXBYbSolj0aPPdVR
 q6jlu0+m5ntKDp+VP4gUr0WgFP8HD9f0hj8GCYWOUNyXClbdkKOylYniPoAJWqibKSh26ab7ob1
 9+Xjtey6BYimBoeYhcXDU33LfYE/cHPEdMtkuJqrw38Hfsco4+FF8I+YiZKzE6enoUpg8bw6h8W
 mu6OExNQ0fs94MMHBHmgDeukk5lgEXWw/eO/nt/DBqRE7amLFINWbZZXrreWmY6QEFbg4o2rmS6
 EZzmQRFEA0k+NW6Rarw0pKCYCH4A0iMjIi/Kk6+u2XMWCYZLlCe3lRKvGkPsqhZEyfcBbky9Pkg
 pyVRhcmzcpez7VyHo01Gda1kfoG2cR/WDZr+UNdB/PB5p1yc5fATlKYIhKH1objRtSDISJ/aKb4
 E/X0CoI/cOqCehbvag0P0ve0rYEZkvG0MOwsEPpY2v+C6S9Vgjbgk=
X-Received: by 2002:a05:6512:1242:b0:5a8:96cf:c8c4 with SMTP id
 2adb3069b0e04-5a896cfc961mr5344724e87.15.1778441923538; 
 Sun, 10 May 2026 12:38:43 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5a8a951d160sm2090108e87.19.2026.05.10.12.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2026 12:38:43 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Date: Sun, 10 May 2026 21:38:25 +0200
Message-ID: <20260510193826.2846038-8-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510193826.2846038-1-j@j-ernberg.se>
References: <20260510193826.2846038-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1778441923; x=1779046723;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lXMVRBTUw3UNaSYeP9avUfQfrgvZcYX+sXRLH4Xs7GY=;
 b=kbWPPVd+S54DFHU5FDF5ZCW0aQjVuMr+CjP9iv9MnmCUdhfmOfPnVSZrVzZU+CsITC
 VAlY3XixpA9CM6IQ6q4lBP7Gy5iOjM0D9tE05VojqHmT4l+ds5nSHIjzf9LTDnPdfAFX
 vl6MRqCpFVjFMUx+DDcFzrx3DNecXSpGIC8/N7VR4wbyDUNRJjeIXfA/Lk+EtJRaIvLn
 3PAwnGrdNgwUVOWiwSpKcR7Nfc0O8SJXx/irwtUCz8Bud/L2SEBWKrwH56RaoBUikuSe
 XNVHJ+Q+8QZHz1OZdSkV82Xubkj2I8NAqMw3KzexbUp0ED/KHq5pR2duwW1kbq7aRCcw
 nP5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=kbWPPVd+
Subject: [Buildroot] [RESEND PATCH 7/8] package/poco: Do not unpack
 libpq-fs.h
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
Cc: John Ernberg <j@j-ernberg.se>, john.ernberg@actia.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The file was introduced in the project when postgresql support was added,
and has since never been used by the project internally.

They already depend on postgresql when the option is selected, so
let the postgresql package provide the header.

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
---

RESEND:
 - Forgot to subscribe this e-mail to the list

 package/poco/poco.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index fe1dd29855..40dcc1c502 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -11,6 +11,8 @@ POCO_LICENSE_FILES = LICENSE
 POCO_CPE_ID_VENDOR = pocoproject
 POCO_INSTALL_STAGING = YES
 
+POCO_EXCLUDES = **/libpq/libpq-fs.h
+
 POCO_DEPENDENCIES = \
 	pcre2 \
 	utf8proc \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
