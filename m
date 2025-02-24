Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E692CC021B6
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 21:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D8238183D;
	Mon, 24 Feb 2025 21:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2HOxouM71oZ; Mon, 24 Feb 2025 21:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEE9281858
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE9281858;
	Mon, 24 Feb 2025 21:22:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B13B1531
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F5CD40BE1
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SG8FEU4fxq2f for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 21:22:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1989440BE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1989440BE5
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1989440BE5
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:25 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso49370165e9.2
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 13:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740432144; x=1741036944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X2Q3DMWgtpMLDT1czfkUrSVmlPnYryktAyfnVWLP4D0=;
 b=sGPqjUfcPcMXRtjPWu/5eVKiyAEvFVNY8+nVRlxyqM2GZwBubhw3wmY37uEAW6h2J3
 2zfDjKAZ6l9zxXLcDLeIuxprwwt2wMVwFPVEwAeySSIrsGVbJumQxU2Bz6Pln15aLHxc
 CBCMqjlYaAv8Drs+oHJxylxfsfUKH59JMbRWWMtsNPD3G3fJ11B/LYtmkyUfqIIcS1ej
 swnjVvFI0C6pzeIeakT28TaFpUWCoVvkXBgdVNiRfZFtphbi87/9HGZYUODdfibhi8tM
 FJjczghn+2oc6gS0byVLwlcewj8SRgTYAAEJCbWvSExyITlM4JFh/01AZOjpTnAFFSOt
 IzVw==
X-Gm-Message-State: AOJu0Yw7Ax3r8DP9Mr/RazSpsrB7NJawTU4VgCzIcHTlg5cxeL6Xe1VP
 kelDiNh4ZmnNbTmznGomViZRGcxihYXWUOB+nq4nOM2PUZoDOdmb0q96aQ==
X-Gm-Gg: ASbGncsVtj4FtXtA+0njQbabRcdtkIQBRn8M0Sn5xaWJ/epcHJI1xTZYycVkhgmFPNt
 jB8fGEbhcZ31vK9z55UOLl4liDdNhLMNraY65e1x8ZcZAF4IVVhV5/Y6q32A4a+Iq7oPZKh8vOn
 V8s3+9hWuZZyPFCPf437+xVgjABJpKq2Gi77seXFrniLZ1uiqSPyIS6ACbS9mtrnFfcV/RqYbFM
 vMD/cVZu6naTgHZJ2/qoAhfVVJosqAB/yoOa481FtNMR5jcdvvq6nUZPwqY0BUsMjv7hjZqrqKt
 sXerB1rETyfu5S4vceUY9Cb0khvJ1E3xr3UX
X-Google-Smtp-Source: AGHT+IG28gBJQAA+Wv0XkCopn/7rmpcE/DMaxWM+xqKkTeIX3PVhVQHiG6RSO7lE33dHjhPHQ9/i/Q==
X-Received: by 2002:a05:600c:1f90:b0:439:8544:1903 with SMTP id
 5b1f17b1804b1-43ab0f64430mr7679405e9.20.1740432143823; 
 Mon, 24 Feb 2025 13:22:23 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b01346d1sm119875635e9.0.2025.02.24.13.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 13:22:23 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Date: Mon, 24 Feb 2025 22:22:16 +0100
Message-ID: <24b4f94c50db5ee1a7bd006d59cf2d0d4e875321.1740432132.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740432132.git.yann.morin.1998@free.fr>
References: <cover.1740432132.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740432144; x=1741036944; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2Q3DMWgtpMLDT1czfkUrSVmlPnYryktAyfnVWLP4D0=;
 b=jcacckOTXo7f0uEkY8M/o6n1XzfGJfs29RUqP1HtmkUd9AM22CKV6bzF/lMIDeSyG4
 HWsmpJZuq275QvZDV6HcqaI47avL1JeKyDMimdVO6u3MJ//sImPFma58oIt3huybWt32
 dxTzJWevHg1YjMoe67jLYoD+vmRT4zsqL0HkxCbuana8Fjcp3jqyMJv18Zj6sHpdcrFL
 fh/DwzfnS58ixB3RBUwKbf9aiXvfw3k2Himp3Ph/uneZtIMTXo1rqHSWiLvFTXDrZF+k
 EUVl1u7XFjrcsHn2r8745BhG4msSAezxXRJ1LyRO45Y8JajH6tsB0wyxDQqw93hbp++T
 T75g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jcacckOT
Subject: [Buildroot] [PATCH 3/8 v2] package/conmon: depends on systemd when
 enabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When it detects it runs under systemd, conmon will want to log to the
journal. However, it needs to be linked with libsystemd to do so and if
it is not, will error out:

    Feb 22 11:10:03 buildroot conmon[199]: conmon 3b462ce6f2cc64f75c42 <error>: Include journald in compilation path to log to systemd journal

This prevents starting any container.

Add a dependency to systemd when it is enabled.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
---
 package/conmon/conmon.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index 1e57786686..ed1a2554fa 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -18,6 +18,10 @@ else
 CONMON_DISABLE_SECCOMP = 1
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+CONMON_DEPENDENCIES += systemd
+endif
+
 define CONMON_CONFIGURE_CMDS
 	printf '#!/bin/bash\necho "$(CONMON_DISABLE_SECCOMP)"\n' > \
 		$(@D)/hack/seccomp-notify.sh
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
