Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A493AFA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 23:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41C8F406D0;
	Fri,  2 Jan 2026 23:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTizJ9VlUxnj; Fri,  2 Jan 2026 23:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7204E4070E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767396566;
	bh=qZWTuLTPCHeOvKAifIwoN27IbpxWAIaFoJV506DPtm8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RQ/IRhyx3xKm8kfVQd7GpPUDhH8GvaIt63w0eKUO+ZFsjOWf2VpdYaMjp3n5Sg3XO
	 vWrcHT5OwtUUMeh2pi7NPuyOMm+puwoi+5aXG0rNlbiCi/T8q7MiQyM8ygjf6wjfFU
	 OJvojbzsb5pMyHWc5f78fnsvDbu25ENwWG9XmB1PKbZo3dceITruKn3w1KkubaZE+i
	 MMdfaflDXa1OheWpA6rhHy2c92ZH8H6gGrrP4eKeNNelkBHMBVmGvdnSS1/LYWfRqT
	 xe4cjGZ9i+O2I7kyd/kRy3tKi1bFE/aeAO3a0r886ew7yLaOqZieLDvONUC8V8PWOX
	 yhm6RmBoXLzoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7204E4070E;
	Fri,  2 Jan 2026 23:29:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CE8A249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 784DC60905
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6T1nSVY6HRzB for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 23:29:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F1EB608FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F1EB608FD
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F1EB608FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 23:29:23 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-65ecd7fcf36so3786784eaf.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 15:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767396562; x=1768001362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WV8x2vGMrVjoOpiJ7vgTLXLA9Y2AilhkWoOSQt/k5Ns=;
 b=pmXCWayfCtxnwL3gsIHbLj2C6MMbn9K3yPxkwQjcOTLEdlevlpVq3VBcBDNDQ2JHDs
 q/akUKH1WMUwHGdXhvysseIFQ5m/1MKZgsZ5AKMPH3mN26/yPjVR724XCXIonzmdCBxk
 i7UTkGvO0wVMf9xl2hQqICRx3SphILBW7tyX4YChjAc7QIBB+2YfqwjxwoKeJHcZohe3
 VcT4a/hzxdYCdrkXvQZe1ci1AOgr1ESrDh1bptp4FzFPPHaYQpGeRXFF24ZAvEAKXzf7
 wRGwTvkSbQrKrM4srxY1g1vOlr+fJEuZ5rM92I2Dc8Xt3JJsYnpXo5lyQnT/XTiZMllw
 a3LA==
X-Gm-Message-State: AOJu0Yy1p0vjZekf+dq5KM87el0Bi0osF9fymQpLUeiuD7BOID1KWsU4
 7ry9fKA2Ozw10+E8c5bY6ZJjczddHrYyRbhJet7nIZ1wKWZFWldJ55e3pHSIJRlMmNk=
X-Gm-Gg: AY/fxX5jS45ukr0tXqQzh7KXiHix+xv3WjUfmontRgHn7au39h8qjpExKsSSCPhh9P/
 OqV0WTRdZINGBPYk5iQ5oKys++Sba0FNDfKKY3kD+2rF7+uCVEgKEc/2BwT0kW2iMFjnaz6UUD8
 e7/qu49T1PTbT8T8HjoEqW8Rnb8u7ATgGCKJsGOa5JB8DabmqlKD75FJGPZbWqnJ39NKHGbHeOo
 nhLVe0dR+nfG06vqUP9jUS1mtmcUZq+2XQw4mBpfpsSuK0cToxK2JiWkOxr8bNXkQSxZnMiyqs7
 /F3yLLiq3UN5MqclUuN8/4PNvIEMLmpFZx3f+nPCD/XTRWFeag7JO7YtETka026cxgtUJNvrbEp
 Rncbgmu4mQjQLb62FX7u5m8m+56GposC9K56w1Kg5Rgxsp4/aRA5oSqU3kVFitvmvIc7MK7GZrl
 6K918g3/HIKlbyo0wY/2Grcl/3pF8bk38tpwdD4Tu4KWOJuQteS/Fgmiw9d2azrYklXwklYr0kH
 QOyBL/F+LCJVdpjweAVw+z6vc0h/eRFsGYoFARDFsY6K4joXmmEnC8=
X-Google-Smtp-Source: AGHT+IFPGKNgoHelpwQu6xukoGFqrszdDFUoR5rXN8ewwpTYKX0X/4ljLInCYJa8BQw2+rnazfZqqQ==
X-Received: by 2002:a05:6820:228b:b0:65b:3797:6536 with SMTP id
 006d021491bc7-65d0e932cc1mr19841879eaf.3.1767396562228; 
 Fri, 02 Jan 2026 15:29:22 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-65d0f3f9d15sm26855501eaf.4.2026.01.02.15.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 15:29:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 16:29:19 -0700
Message-ID: <20260102232920.573658-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767396562; x=1768001362; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WV8x2vGMrVjoOpiJ7vgTLXLA9Y2AilhkWoOSQt/k5Ns=;
 b=nagV/WcUM5PMi9bwVl20FPqov0SNFtil2kD1/L9R5Cyp1IqgeKX7zQwNJ2Xk73fxWk
 TSkBChUb65xYQ7/mrDoCUDcI9rusE6/rc7laRTnWFDUlwtDTdvyYsTgKzHUPvRzzPXHd
 rLBWuQTbmPkCDiLo22JoHSIpun/LlXMUIJtpNqngbF4tJHAF27i5ebkG0I4B+gD3eueK
 bE5LhdZBONfIL7k5ZdTXBPJQP6wMcXU32Ykp46NXWUJ+uZ2cWUlGL1J6gxt0iDnVN/o1
 I2mV+yhm6gw6uW1zf1sMcNV6Q4MOjNG1AxetTGVD4oW1noZ6g8JddNQVz+FyDxxxptKu
 Dj1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nagV/WcU
Subject: [Buildroot] [PATCH 1/1] package/python-humanize: bump to version
 4.15.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-humanize/python-humanize.hash | 4 ++--
 package/python-humanize/python-humanize.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index 86dfd80b78..f1ed743cc4 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/humanize/json
-md5  acac6b2378dd0d9b1d9d1ffefb08e00b  humanize-4.14.0.tar.gz
-sha256  2fa092705ea640d605c435b1ca82b2866a1b601cdf96f076d70b79a855eba90d  humanize-4.14.0.tar.gz
+md5  65cf3c77127d6ef9159e56c4ca728c07  humanize-4.15.0.tar.gz
+sha256  1dd098483eb1c7ee8e32eb2e99ad1910baefa4b75c3aff3a82f4d78688993b10  humanize-4.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8ba6c18112a431400ad3c743f70670079b302545d98884fc2f28a91c383a0380  LICENCE
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index df2e99043a..e314fa5f78 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUMANIZE_VERSION = 4.14.0
+PYTHON_HUMANIZE_VERSION = 4.15.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/b6/43/50033d25ad96a7f3845f40999b4778f753c3901a11808a584fed7c00d9f5
+PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/ba/66/a3921783d54be8a6870ac4ccffcd15c4dc0dd7fcce51c6d63b8c63935276
 PYTHON_HUMANIZE_SETUP_TYPE = hatch
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
