Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2A5C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 21:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31F9D832D0;
	Fri,  3 Dec 2021 21:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lP_xgaQxI4na; Fri,  3 Dec 2021 21:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC7E832D4;
	Fri,  3 Dec 2021 21:15:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DA311BF473
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 21:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C1FE405B2
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 21:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exZ8QVeUIEyl for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 21:14:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8533540140
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 21:14:59 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id o13so8278517wrs.12
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 13:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OxUCIlEPne2tJOdda2/iUB67ifrppWqWvi9h74FbmVA=;
 b=qgjvgc4EivVXwj6Wtzi+XAIIjsope4n2BLE9G3+9/TlTNRKowChAcvWn/TgaAv/yep
 cQkmqn23izenFzwkRIlUxh//uGouRD1GtpS3OqhlTdlTZSfZ2PGR1qK/g4sD5TQ4d/No
 T5xqNKae/BTmCZui2SFOPDF/3GsLaUt+/7woNUetrdwiBAHqVDTp+GNnb1NgqnRFt98i
 5QsBCC2n82D6oo4I0KjDoZxckYJnrSg3xeGrKHwbZ6S5vMnxH1ayXKSgNiZpYROnAHKH
 E9PkxzelR/zJTkjJdVdN9TuhFBct0ZU5/NAuKKoxfAUpVSfGik8cwEc8Jv69fo0vtkIY
 LZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OxUCIlEPne2tJOdda2/iUB67ifrppWqWvi9h74FbmVA=;
 b=u7PZsxv6DISjpU78E2SQcvF6BOvn9OfZbHHVw/iF0TVFxPjAbi9mxaZ11VgjFMyx+t
 n6gHWqAG2k++JBBXQprXIccSnPFcJFU7aZil5DnE7AG9EmZe/3gZoKrqSYD75LdvbYmL
 oIeYWEAJsCeffpd+fJMgweD1xOvioJTyeTdZXvT3Q9H9Ag8o0QauJqmO17QArRswpduj
 g3r9aQv6kVvTqk1OC+E2quqK20KKRqYeXJpkVCZLECX+3ahmuiVgVR0A/H066/mBmuQw
 FOpmi24rLo/AsTgOtmDJ8EeUhbLALSdg4WbRj+/n/dZ+Jr7Zns9WtM7pX7hnBapVf50c
 1aWA==
X-Gm-Message-State: AOAM5328+yxbAKXVHgbUROgVGmvF4x5JlnkkcboKMHORNhLatRWN7ccB
 8E5JDp08YAF/QrzQtv+BX3elgigZSrDvrw==
X-Google-Smtp-Source: ABdhPJyVojd2jzjZ4dSWnG9PNafYrBQtGY9XPQxvUlls9fTlxF4EoGjB1oLdkRmnn9rewiv5CPfhtw==
X-Received: by 2002:adf:f589:: with SMTP id f9mr23874824wro.505.1638566097639; 
 Fri, 03 Dec 2021 13:14:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id y12sm3563768wrn.73.2021.12.03.13.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 13:14:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 22:15:07 +0100
Message-Id: <20211203211507.1924937-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: add
 FREESWITCH_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:freeswitch:freeswitch is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreeswitch%3Afreeswitch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeswitch/freeswitch.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 63f6324af2..f0f6657e99 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -13,6 +13,7 @@ FREESWITCH_LICENSE = MPL-1.1, \
 	GPL-3.0+ with font exception (fonts), \
 	Apache-2.0 (apr, apr-util), \
 	BSD-3-Clause (libsrtp)
+FREESWITCH_CPE_ID_VENDOR = freeswitch
 
 FREESWITCH_LICENSE_FILES = \
 	COPYING \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
