Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07203C4321E
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 07:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8DDD81ECA;
	Wed, 30 Nov 2022 07:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8DDD81ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_ihT3ZA9f6Z; Wed, 30 Nov 2022 07:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AE8481ED3;
	Wed, 30 Nov 2022 07:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AE8481ED3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A5851BF853
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 418B541737
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 07:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 418B541737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nvDfDVEFN2LI for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 07:55:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F64A41722
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F64A41722
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 07:55:10 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id y16so5986345wrm.2
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 23:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gp0FpIzBu8o6b6s5iqZoP7MKzGw/l7MlqhgOsWo5JV8=;
 b=PUkqo/ZTnZ+cdtqgA5+mRiUuCxHXsNWC/20XZc0sswW1adOWEx0rqI5IsjBi14KbVg
 btGrGDSAzMzSuMpH9RqZ18cqSnurwREyBvUlosrv7Q61/Jp52pWrdKg4vVRxn6AmFLkj
 /hNfvrU71HPfTaHJ1n65PIRAiRI8UeAd5i3lZxb3PnrGtpOw0u3TkcOG4LOzIrha0IK2
 02abnlF6fafhQzUIPv93eh2h8yndeRUHrdjiJ9GZ+f/tQR1NBMi20Ga1QRwporv6kDTS
 rvx4+J1qvJEg1nI1DxO8RnRGKtLA9gB6BzE0if8WSY2AS5uRbOEq387EhaGNHAijA22R
 CrRQ==
X-Gm-Message-State: ANoB5pmNDhB0YSlvn3Y+YyvDC+31wZV8bNsLGW3Ld4PzrfotDfHOgo6J
 NlK+elMrSR+2B3Ab9jnChv3eQ269NhJJiw==
X-Google-Smtp-Source: AA0mqf780ipcgphKJLlOK0z4g/+8l6chUOQFOspWk5gwnEbPJx9+EM14KhquDR6JY7oEq8UWhYVbEQ==
X-Received: by 2002:adf:dec9:0:b0:242:26ae:6790 with SMTP id
 i9-20020adfdec9000000b0024226ae6790mr2897688wrn.171.1669794909012; 
 Tue, 29 Nov 2022 23:55:09 -0800 (PST)
Received: from lmecxl1178.lme.st.com (87-88-181-79.abo.bbox.fr. [87.88.181.79])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a5d5649000000b0022cdeba3f83sm677511wrw.84.2022.11.29.23.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 23:55:08 -0800 (PST)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 30 Nov 2022 08:54:52 +0100
Message-Id: <20221130075452.2507453-7-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130075452.2507453-1-etienne.carriere@linaro.org>
References: <20221130075452.2507453-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gp0FpIzBu8o6b6s5iqZoP7MKzGw/l7MlqhgOsWo5JV8=;
 b=B2HQR3JckjOlF6VR1WTLhfOlAuIZrjTYHjwNkmrOveAm/I94zKmiLHVy2hk5zy9d3V
 wuOoOZPpLPYeBFJuKiFV7GJLYFSaE6BREhX6SzDhITre1CkmBIVVLxBJ9uZ8QyRXBhzB
 0oAyuoH0+61YhIA8NOI2/QD5ClnHxTvLesk5TNMTlmLW6UPQD3swHJ+KKrd35uhVYpfb
 5jiGpa4oek1vj9ct9iwDT8nFdOR2o38h71XOedF1cL5qOoAlY/WE8n/QkV5pRthAZ297
 ENjaVKJz8dUdFZgbn9nWnbRAlRtT9bjlADTqa7Mr/r3l+38wkPM9tYvlAXUcbCYPySRp
 ePBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=B2HQR3Jc
Subject: [Buildroot] [PATCH 7/7] package: optee-client: fix identation issues
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix issues reported by utils/check-package:
package/optee-client/S30optee:40: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
package/optee-client/S30optee:46: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
package/optee-client/S30optee:47: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
package/optee-client/S30optee:48: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-client/S30optee | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/optee-client/S30optee b/package/optee-client/S30optee
index 17e6d6d2b8..abb7e77afe 100644
--- a/package/optee-client/S30optee
+++ b/package/optee-client/S30optee
@@ -37,13 +37,13 @@ restart() {
 }
 
 case "$1" in
-        start|stop|restart)
+	start|stop|restart)
 		"$1";;
 	reload)
 		# Restart, since there is no true "reload" feature (does not
 		# reconfigure/restart on SIGHUP, just closes all open files).
 		restart;;
-        *)
-                echo "Usage: $0 {start|stop|restart|reload}"
-                exit 1
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
