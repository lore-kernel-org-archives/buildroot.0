Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4085E668B8
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 17:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33B0260DD5;
	Sat, 20 Dec 2025 17:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UP5fogZUsXWl; Sat, 20 Dec 2025 17:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41FD260DCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766252073;
	bh=qAxDdXMCA2mNpSxGE592iTU7qyEZ6Se71oGQITPqJpA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X2lYJeZ/iTl/ITOpO9IuiMm/c4bv7K9Yq6nvajAqWtnhzV77rI8EyrYkIOQNeK5Fc
	 Zbh6FRAVeoLEt0bN+B0b+v8nb6H7WZLjDCNxbfCaTBL7pUeGrIemaZ1kMQU8kUVd/t
	 Rj5BMP8Ud8PVYnaK37RBgeyR9lqju/K/0/nhsTqt9l8Et0UvUFe6qBKWiNY74oFI51
	 YOxrP9uVOsctfTSu19HyAQZy9DFrXN6UrXz333i6rSgx1rC9rllvAEB7yQ06E9oGjj
	 lHPs/BtZnnI5+cCnhZ4/0SWMt0/VrqvWNQG62CmClju4R4IrHRU0P+YyLAjeFXSu1H
	 BIaAjKh88Rg5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41FD260DCA;
	Sat, 20 Dec 2025 17:34:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CC59119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19D15810E0
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RE3gH3su8IeG for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 17:34:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2733880FA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2733880FA1
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2733880FA1
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 17:34:31 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42b3d7c1321so1607847f8f.3
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 09:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766252069; x=1766856869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZaqTTiqCO+pMIcOJFjMQa4NwoysPTdG/vxkyFtteo0=;
 b=oogAFE93BtHr80tHUOJQKYpokj0WXzLZbqIxbswOwWw301nUmmHYxYR3yiU98jmgs9
 zsGi/zTR1TO4NY7uMeb5cyV0QCRI1dQYXHEkIz/YGFnNLVOxvt7spPgtwWO0BBE/1GtJ
 VQL96l2xkqiSIsl/1gy08w7f9ZFJbR7jysz2nMELAhBbPsYR+uyvkMRXFc+Rrn2fK3iP
 UxhbYDU9BTfSoUFJnS9EEcGJWHUIkEFgPe8RE8+euqOZN/EuQJi9as03bhGtMOuDQu9o
 tdKn8l6hTORXroxYnSrJCUpd9KkqWcRTMZAPRYUbGnP11VBQSdeV3Gx2BGJSx+yuZBek
 Nr4Q==
X-Gm-Message-State: AOJu0YwoW3kpVKV10f4XvduVZRn+u5qFG7XvaFM/0UaGM+ZGp0ieOhBQ
 B+DwkxXf8lE4t73x4oW6SWVa2x+b4f17WpBUWG0r2kUyULAqZyV2qyMpoV/Tfre1HG2S0w7Tf/i
 C/CKiUA==
X-Gm-Gg: AY/fxX7B3HRMo78RXfCPsWhgAf+NRLILKPmpDoy6nCoMmZsjv8t1o/wk9fBS/cbx1M1
 erPXKliEcFkL8ARVUmnB4nJ6sLBZdEvDfphwVtNF9/CeLpsWvkj6jOSwozwpz3iMSIPJV7XsVTt
 vVRk7afOxM0Kks6q3mS6hYOIQHnIWpipP2aajTrrR9XttHtotok5U6YU54+maHmczFrbMcId0UB
 oiwt6lljkPbxMBhPM3cO7w0/19cCqCMoXA9R+EYEbcqS+s4E9hwimeUJNQIqqfQgfzrNEbMWTJ9
 9YyT3Ccbo5XOR1eVdd9LKs/u4Ahbx+Z6IdAw54OlHrz9GaGsPQWkCUOxaOdNY5idRbLmVY3kfxZ
 D90MGZHfsS6KfJAho+KpwtOoMz6tcHINb18ooRCTcrWjDVKoOVJbSDnu/7B4opxwZ0UcObXO/D5
 /4+bkmpgqXiIYG5MAXMkhq2jcstEbBiBOBsnDPVPjLV96Cfg==
X-Google-Smtp-Source: AGHT+IHOQCvIDC8GTbpnJQba4IjKIE0scemENrPihkd1wIrZieQ+PsbUC1r7vxiA+d/gdaXuDOMtlQ==
X-Received: by 2002:a05:6000:4308:b0:431:808:2d56 with SMTP id
 ffacd0b85a97d-4324e4c730cmr6461096f8f.1.1766252068857; 
 Sat, 20 Dec 2025 09:34:28 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4325dbc522esm1036447f8f.11.2025.12.20.09.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 09:34:28 -0800 (PST)
To: buildroot@busybox.net
Date: Sat, 20 Dec 2025 18:34:09 +0100
Message-ID: <20251220173412.433583-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1766252069; x=1766856869; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AZaqTTiqCO+pMIcOJFjMQa4NwoysPTdG/vxkyFtteo0=;
 b=fSYseJ6NCHBAyYusIY9yyYnylBpd+v6gmXTn7Nto6ysNNHpdfD5rriYajlakZSHtZ9
 b8XHfjn771Xl8sM7NvNwxuppGdSWc+jp/qDSLQtjW/LtV5h2cHYithtpR98kCt3I3iGJ
 VzcK6E60ua8WM8sCmSbRszpMsMWtKth59AVGSTg/h5LafO64B4y1oTOXifqlWvM/CTZ0
 Qg4tXy6K/cwmpuHTgDJXcWyFflihpOHdciluAKVgSLNAPCv/I2bmXfLR28XOlO8/C4WV
 3vDLOvnMQxEPlXBDXyTLjTHSIIfh2t9/ovGnmC4NorQb2RZ282YhxzY3bkrDxF5LGnD5
 8+kQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=fSYseJ6N
Subject: [Buildroot] [PATCH 1/4] package/janet: add host variant
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/janet/janet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index cf4113fb1..4e904e7b0 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -28,3 +28,4 @@ JANET_CONF_OPTS += -Dsingle_threaded=true
 endif
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
