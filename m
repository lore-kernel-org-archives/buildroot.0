Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE7AC3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 08:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F3D581351;
	Tue, 16 Jul 2024 08:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbwEgwfzepgh; Tue, 16 Jul 2024 08:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A86881371
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A86881371;
	Tue, 16 Jul 2024 08:58:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B8A31BF3D6
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 08:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 870438136F
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 08:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0S3Ttd2oYVwy for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 08:57:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2960D8134E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2960D8134E
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2960D8134E
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 08:57:57 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a77e392f59fso621259966b.1
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 01:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721120275; x=1721725075;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0vzVZvAyGRXGCxKOFFU2/D+iXVGPpAWU5Qc8IBsSo7s=;
 b=W944/zx1jBd7tJ6F8HMEBvmzB1mkJ1B9z/UuOPi3IrtBoX11iCBAeSEgXksMolr/m+
 FEewoBO8BbVXX9LEUEdUCz2RJX0rQDDD4Uy+ucYzzmKl0doJXMDp9bAcip0KaqE27Z8e
 QBsC45QS8wscAlB1Xf68iFgF7txNzQKzFZ13JxpjrPUneBL9RAlRf89OGkCINwAsD7kS
 Ozb18NE6oDgfcUz+9zrr4pDtm7wpFV/eovDdSTBMpVjVmzUM6lekbnewkgO/69gP+OCa
 66JlbZx4yYUqOqCsKIPhc53sOTtgexhJjPWJnnRfCO3sp7dZfJSvtV2HNyF6Gg70+XRv
 XZgw==
X-Gm-Message-State: AOJu0Yzwe/YHVvUSiuxLh3LHvfByebDuez90nnlMG0OdLZtckcImBcXG
 gZKwYjvn30vm/TLKEjAeQ+97De4dXn9aGam9wzWV5/UdIU4QrWYJMVWDim/v
X-Google-Smtp-Source: AGHT+IFliUM8Ya6hjs2hKZ7qtSx043n1S0wmWhbe8rX14CsZKa/KLpeuRiHxZfi1AKs3fr4xkgBmJg==
X-Received: by 2002:a17:906:eb58:b0:a77:c95e:9b1a with SMTP id
 a640c23a62f3a-a79ea43aeb1mr89596066b.19.1721120274423; 
 Tue, 16 Jul 2024 01:57:54 -0700 (PDT)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc7ff8c9sm282951266b.162.2024.07.16.01.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 01:57:54 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 10:57:47 +0200
Message-Id: <20240716085747.490549-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716085747.490549-1-troglobit@gmail.com>
References: <20240716085747.490549-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721120275; x=1721725075; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0vzVZvAyGRXGCxKOFFU2/D+iXVGPpAWU5Qc8IBsSo7s=;
 b=VkCbEjXeg6xq4xbcYqt57eQc6Lt9VPm5/UFy8DWLS0FFOlEGwGRKllY7V9zvAzHh9G
 hgsiSdCOteRyaBnOHGDCaG4uWEt2UqzeXNLeDb7w97BwHUJbjnuodlIXZycVVZfzKpGd
 uTuM4K67u+VE13HEW7ZC06Ri+mJ+/mH1ccEkGXOOrZuXeghFmQMJVJuAv5g42yRU7p3z
 zi4DNjD5Qby83BycnCVrJmay/uj1av6ioCM7XJ0vTPdbC+NMAlMlKw0hOlmp1qC8UeDA
 HZ1+bor4dTz6Ku4TpfFdZ7Q0c5ohWCfpAEydolS3ePaXSmovHVZz2o4ul5bOmjvkwSAM
 OgWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VkCbEjXe
Subject: [Buildroot] [PATCH 2/2] package/sysklogd: new setting
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

Expose --with-dns-delay=SEC configure option to fine tune retry interval
to match that of the system resolver.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/Config.in   | 12 +++++++++++-
 package/sysklogd/sysklogd.mk |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 3315a6ddc9..c9b9fe8c35 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -15,8 +15,18 @@ config BR2_PACKAGE_SYSKLOGD
 
 if BR2_PACKAGE_SYSKLOGD
 
+config BR2_PACKAGE_SYSKLOGD_DNS_DELAY
+	int "Retry DNS delay (sec)"
+	default "60"
+	help
+	  Retry delay (seconds) for attempting to resolve DNS names of
+	  remote syslog servers.  This is the internal retry delay, not
+	  that of the resolver in your C library or DNS cache.
+
+	  Default: 60 seconds
+
 config BR2_PACKAGE_SYSKLOGD_REMOTE_DELAY
-	int "Retry delay (sec)"
+	int "Retry remote delay (sec)"
 	default "180"
 	help
 	  Retry delay (seconds) for sending to remote syslog servers.
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 7abb830119..59081f2734 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -16,6 +16,7 @@ SYSKLOGD_CPE_ID_VALID = YES
 SYSKLOGD_CONF_OPTS = \
 	--bindir=/usr/bin \
 	--sbindir=/sbin \
+	--with-dns-delay=$(BR2_PACKAGE_SYSKLOGD_DNS_DELAY) \
 	--with-suspend-time=$(BR2_PACKAGE_SYSKLOGD_REMOTE_DELAY)
 
 # Disable/Enable utilities
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
