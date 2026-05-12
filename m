Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932A7CD4851
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 09:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68E3B821E5;
	Tue, 12 May 2026 09:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cn4XBd2F7mPS; Tue, 12 May 2026 09:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A52ED821E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778578285;
	bh=VW22qS3lqJ5bQ59xugpX4oyS10oxzjoWRhrI3pduZz0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FkF6ZBpSyFtZHLh5Mpo820dNRRAF/SaaoHSml9AZ4YgHyKFVDMeGgSZ4IzTjfn317
	 91oiK4fC7WNc62XNG3vPvnHNaai4YngWqmzLi88//WiFXhR6eUXUUqnpsNRx8bJyYZ
	 zgzchsiEU//nx+qD/tjDkcsFINLFmdn3fAQG959kuvxbQFbasiF6sowoUigUvNVyfL
	 Qpx3yt8Mnu7pBGczkomuPFJxQ1GVnnETzOE7f+jJt6Y1ob/i72lJ6+vtCWCe6WlMfs
	 MnXjToGZLxF1Wtb959yVYi150ZRGyfZ74kxGXOkyYOZjoZov+MEZrRqTUsfIe/GjpC
	 Z/pWcoHN14zYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A52ED821E1;
	Tue, 12 May 2026 09:31:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 634D7398
 for <buildroot@buildroot.org>; Tue, 12 May 2026 09:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5420A40BE4
 for <buildroot@buildroot.org>; Tue, 12 May 2026 09:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLK9_l6cUNhu for <buildroot@buildroot.org>;
 Tue, 12 May 2026 09:31:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 710C140E44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 710C140E44
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 710C140E44
 for <buildroot@buildroot.org>; Tue, 12 May 2026 09:31:21 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488b0046078so44032915e9.1
 for <buildroot@buildroot.org>; Tue, 12 May 2026 02:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778578279; x=1779183079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dHwVDQRWZru2oEFgmm5u9+5ELJ4Dgq4rv46peRdvW0Y=;
 b=O4Z01/XTOVk6R826QwmD6mZAWUNwvr+00m6cb8mZ6PYCVbY7mT30tckyFEP8QOKYIY
 9CST8ynfj7hQttRPMgaNOb71qlsqv4UqRSaOB14hI7Aw50My97LhEkilIS4iyWzMBmet
 ETkPGuyH9qNOlz6vgUFp2EL4XB+qS25izE8pTvhiZNUwcPZXumySC033YtI2G3AjopNi
 F7TcgcYJfS1Wyp30eeAJQiScKQNwBQUthwcwE3GqfKHyfqe6b7bJNz4efch7zQsRVukV
 0S1gITx/xuIWSPSfWmiPYGfliFy9Nd0OGl6EU2KvQvNW9UTYpNIUD+q/u4MTEYLY9A+q
 3HeQ==
X-Gm-Message-State: AOJu0YykDEztZlS+Z6MQE4krI6VvI+zQXsBKVAZZyUXxHBrAqWeyRu9Z
 2SloeVHEOpJA88KY3zRFB+LDi3XG5TMDe4fPgQGUt12bDfYRlAobKfZoD777iY6h52McCGznbbj
 VaPxD
X-Gm-Gg: Acq92OEZoVmVwRAT+GQu8e9YuODtDNSON4huc6wd6GOjZhyRDDJuv9XjYMVRTivze/9
 2+D8OFOKsrsJQ5t8Is+HfkcSj2jU1xOhiq3eLRBd9rRrfDeyyE67IT3MEgdsVCr36dV+IDmP+6D
 y3UWd4tVcv7qqdzUfs7RMK3yiE2wlRPdGkpk5QNxpvThADe0DWFRRvgQujG6bbgYtVL/tWFL/VF
 G6um/fu+KRCUN4+oDfqo1Q9s+Ka69oW0uV7UelDtKwd26JdHscsCfggrVCLa1syfx/1nyRVUI/f
 TPnjt6Z1C6zkLziDgiYB9GRwbwBh2os8JO5/l0Z9rDSxrHTX36+PD9a1HdaYpNNnlEBCcXieiN+
 ufialDK+oSjakrqQctvt1sIj7eCYJiiTnGLcrB5HTsKcAN0UdCd/VCd5v6jR5FYWm+mwrksSGT+
 HAE6OaoyLRSUhgLbV8GF3dTHUTSco7haA3qz3LW/EgkVyv
X-Received: by 2002:a05:600c:8486:b0:48a:6fd4:d3d3 with SMTP id
 5b1f17b1804b1-48e706be062mr221659725e9.20.1778578279250; 
 Tue, 12 May 2026 02:31:19 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48ec8184114sm1881135e9.36.2026.05.12.02.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 02:31:19 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 May 2026 11:31:15 +0200
Message-ID: <20260512093117.154895-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512093117.154895-1-thomas.perale@mind.be>
References: <20260512093117.154895-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778578279; x=1779183079; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHwVDQRWZru2oEFgmm5u9+5ELJ4Dgq4rv46peRdvW0Y=;
 b=PuW0ypx94ZkFtqIRwL4HLfZCN3ltxaAB6rPFH8BvYOSQkCyu/9PYa+D8uXh65mLinK
 5BPXcyGcLN94o2f22fl7a+//bPaNcWMotIOKXg6Cm1UxoQWTR5q71whYRx7XG7jeprf2
 4TBpfWdZyEpEp/yZxUeZ1sztgBKoXd2cjXmyvYYccKbB5F0Jo2pIdAEd2jz60qgONgiO
 WRpsUFPVTT6+9m1msw1QFuw4qWcy3KMKzfs7lLqOVlIUm/y5V0n27pGFuHtXQLCZRBEf
 1bqs1P0WdJtt6yiRzEdhU7dn3KC2lFD014mW8LUl0fobP3Y+m+m9A/5rUiA2kcz3VeE3
 o23w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PuW0ypx9
Subject: [Buildroot] [PATCH 2025.02.x] package/libinput: ignore
 CVE-2026-3509{3, 4}
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The vulnerable code was introduced starting version 1.29.901 & 1.30.0
[1] and thus doesn't affect 2025.02.x version 1.27.0.

For more information, see the NVD entry [2].

[1] https://gitlab.freedesktop.org/libinput/libinput/-/commit/9e37bc0cfa4d975291e5a2899e148fb83526d4a2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-35093

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libinput/libinput.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index ee15b781e6..1930a8cea5 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -15,6 +15,10 @@ LIBINPUT_CPE_ID_VENDOR = freedesktop
 # Tests need fork, so just disable them everywhere.
 LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
 
+# Code not present in 1.27.0, see
+# https://gitlab.freedesktop.org/libinput/libinput/-/commit/9e37bc0cfa4d975291e5a2899e148fb83526d4a2
+LIBINPUT_IGNORE_CVES += CVE-2026-35093 CVE-2026-35094
+
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 LIBINPUT_CONF_OPTS += -Ddebug-gui=true
 LIBINPUT_DEPENDENCIES += libgtk3
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
