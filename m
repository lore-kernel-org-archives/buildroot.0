Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25440C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 21:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 978024011B;
	Tue, 16 Jul 2024 21:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIwvb0XZsqf6; Tue, 16 Jul 2024 21:15:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E4D9409FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E4D9409FA;
	Tue, 16 Jul 2024 21:15:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DAB4C1BF37B
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7A3540A1A
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ev1DB_fcw62T for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 21:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.49;
 helo=mail-ej1-f49.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3351D409FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3351D409FA
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3351D409FA
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 21:15:07 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a77cc44f8aaso335385066b.3
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 14:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721164504; x=1721769304;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TQx5e7Xmbn5IRhmRX9Pma1x+cq7AUVWVmf0RmfXCvNk=;
 b=Ef8eJeGzYcA8+GVoqlqwB3Al4sNqEWiCIFwvvJZL2MWLAAfrtv9PvLwwL82r5rUi8g
 M6z9ZXcNzcPVbWVLQqAE/5KdGlPS9HwinfFy2vdgZdhEP7oRZlalW/Zsvw/hepBYphoK
 rYWvkhEbaiB8fm3eSh28i+zPdyB7Mm9aYHKuHzaIpFmZcKlAU0A8egSfSElrtb8orUQb
 e4kqUN1H5HvWZ9qEj8EoOH5c7l9aURScGNQMJ8cqzLhLwBrIP/zRPZ5bj7HJCYdXMNSp
 xJzzmo1GWHmm3ULzmhWKZAL51tDLM7h7nbz7f4QJYNP0YEstPRAI7iNo0PNfC7uV8LqQ
 820g==
X-Gm-Message-State: AOJu0Yw4SquKTnUDwGxzEc//EijeI3gP6w+44uXqOFuV90KbKxmWn6FZ
 K3Hsm9eYgrdoUjDA16WNW6VZtVM2xgi5dcqOafKlFHc5x2G+xo4uAfF6TkA1
X-Google-Smtp-Source: AGHT+IFcRUd8NMbG0Sr4FcKj2xkgAP0vRzcvKOXIUsjtaTsMDT35YQC5wzVik0vIdmq1vQVqtfgOdQ==
X-Received: by 2002:a50:9f2b:0:b0:57c:5f77:1136 with SMTP id
 4fb4d7f45d1cf-59eeec33984mr2514546a12.24.1721164504162; 
 Tue, 16 Jul 2024 14:15:04 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59c1314b798sm4560782a12.58.2024.07.16.14.15.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 14:15:03 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-58b5f7bf3edso3224050a12.0
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 14:15:03 -0700 (PDT)
X-Received: by 2002:a05:6402:13d6:b0:58c:ab6f:8d63 with SMTP id
 4fb4d7f45d1cf-59ef09d20b4mr3296932a12.39.1721164503309; Tue, 16 Jul 2024
 14:15:03 -0700 (PDT)
MIME-Version: 1.0
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Tue, 16 Jul 2024 15:14:51 -0600
X-Gmail-Original-Message-ID: <CADXxVSKBFjoub2ctkeSAzuuw2hbaMKwPw+xC=BG9z5+JJk7vSg@mail.gmail.com>
Message-ID: <CADXxVSKBFjoub2ctkeSAzuuw2hbaMKwPw+xC=BG9z5+JJk7vSg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: [Buildroot] [PATCH] package/connman: Remove wpa_supplicant
 selection for wifi
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
Cc: martin@barkynet.com, Bryce Johnson <bryce@redpinelabs.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Connman wifi works both with IWD and wpa_supplicant.  You don't want
BR2_PACKAGE_WPA_SUPPLICANT selected when using IWD.

---
 package/connman/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index af3e1f69f6..44a3b41fb2 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -45,8 +45,6 @@ config BR2_PACKAGE_CONNMAN_ETHERNET

 config BR2_PACKAGE_CONNMAN_WIFI
        bool "enable WiFi support"
-       select BR2_PACKAGE_WPA_SUPPLICANT # runtime
-       select BR2_PACKAGE_WPA_SUPPLICANT_DBUS # runtime
        help
          Enable WiFi support (scan and static/dhcp interface
          setup). ConnMan detects the start of wpa_supplicant
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
