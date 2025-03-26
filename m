Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C67EC36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 13:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D77684084C;
	Wed, 26 Mar 2025 13:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZtkmzXXnqqt; Wed, 26 Mar 2025 13:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E34E40852
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E34E40852;
	Wed, 26 Mar 2025 13:27:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9692DC0
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 13:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 885CA40852
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 13:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hboI49V5Rutv for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 13:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E08364084C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E08364084C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E08364084C
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 13:27:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so47968485e9.1
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 06:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742995626; x=1743600426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DnHIqz4OoRbyVQU0B1C4eYgtMX2k22TrOuxA3ZZkXnE=;
 b=TwVYL/4+2CMviEmCg+mNwe5qkr8jRysLcflIgyGmJAHQHary1oHShLLey2AO2Z1Kp4
 BOQKgE3MiWtgh+NQtPZh6EouU5FY28TBQZdDoqqPViwm8/eTk4wREvI0KWKUjoH5k2w9
 TZpPt78RqZEpBbgCYyORHeQ/Ytz+o38euZVzGgeFxl6rWhBIXf/WhIOPIDNCroCjJNNw
 D6d3evkjXksK/LrfIIzUGdZhiCqURt7tViIDwDcuE7vKSGjU6X7SLe11HKtRJdsNqifQ
 cnHxB9j3OYsHjVu4z72KlaPt0w6pelscNhLy3Je6WM23VgGAUl0xXpXeL3GfGHCbFB71
 M8nQ==
X-Gm-Message-State: AOJu0YxoMgKAW9+5dNygud4K1JclmkqApHS3N/Y2g2pLOJr+dBb0gnKl
 WJL/6piT372r/twLKZIVMEs6sKd1Mf7NmajTolNvCW0c17K2MElypfWM0mKZgHk=
X-Gm-Gg: ASbGnctBf4cEaPYN05S9i/6tTrkhPOiUROXtkks8ungRGRzTBuZKSxxG8UZlympTzNe
 Rt6rSyenLnWjdHhdCXrQgohKk8G7PuvbijxCv3+iAqPlo3kVt5lULu2jRd7CXaGuj1+hWWpvrTi
 cgw6uWASiuvfoKnfJUJGudb24KxtW2+S5kCO64pWZKkaWfiQRsiOv0owYzjGLUmKlLZGN5oPfXw
 uPmQgvANWLndZQjTDgDshYVa6wAICVVbmD1EuWktruZMP0UUWge5RKT2uqOGLZxUzIn0Sxb3CrC
 SGMkUjjDXZfhVZgculLXmvI0LbqV3GcM7Bb4DZFX+YglPSS/beqpsXMbEOX8/cL/c9gHZ61/3zR
 xa60L611D
X-Google-Smtp-Source: AGHT+IEi3QGW7hFPXGdPrc+A1a8/Y8KrylSyMbDHC98XYSAUEzl55HDYWXP8PaL55Y3SZx8gOCnBMg==
X-Received: by 2002:a05:600c:1c9b:b0:43d:82c:2b11 with SMTP id
 5b1f17b1804b1-43d50a31c16mr177692535e9.23.1742995625599; 
 Wed, 26 Mar 2025 06:27:05 -0700 (PDT)
Received: from freepad.iliad.local (free-reseau.vlq16.iliad.fr. [213.36.7.12])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e83482sm2175715e9.14.2025.03.26.06.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 06:27:04 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>, Robin Jarry <robin@jarry.cc>,
 Julien Olivain <ju.o@free.fr>, Maxime Leroy <maxime@leroys.fr>
Date: Wed, 26 Mar 2025 14:26:53 +0100
Message-ID: <20250326132655.35729-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326111651.23707-1-maxime@leroys.fr>
References: <20250326111651.23707-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742995626; x=1743600426; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DnHIqz4OoRbyVQU0B1C4eYgtMX2k22TrOuxA3ZZkXnE=;
 b=dKQZ58QiyDX8lwPgKIEGV9YlNSZmBDPwbeSrE9kZypIwRH/FCxMWI4Xtj/i0as+J1b
 jIOXMbC7xgclxtKTnD8hCqMPzMieT8/9JMQQrEWJ2ZN96mHOVxwj0q57LM2/NIa2IkAy
 OyUmfqyaviL9r1SVmIVnT4Kzt0sFRKmqg+Tm2LJGIdjukH4UxOg6XWrQ/W3G8VaZgrVM
 30EG21kWnGDQ7FXPskiIFdS1y/v0wbcGiB+Q/M67r6Bm7gji9vQOLVbkV+B+VO82TC6N
 n7vHqmlFprRfMJ5eidMCM2QEuj31ULVUKoJSNtuf1iMg3qVlYaHcbDuffwbft1MZvrpx
 ULvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dKQZ58Qi
Subject: [Buildroot] [PATCH v2 0/2] Add grout package
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

Changes v1 -> v2:
  - Add LICENSE hash

Maxime Leroy (2):
  package/libecoli: bump version to 0.5.0
  package/grout: new package

 DEVELOPERS                     |  3 +++
 package/Config.in              |  1 +
 package/grout/Config.in        | 13 +++++++++++++
 package/grout/grout.hash       |  3 +++
 package/grout/grout.mk         | 24 ++++++++++++++++++++++++
 package/libecoli/libecoli.hash |  2 +-
 package/libecoli/libecoli.mk   |  2 +-
 7 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 package/grout/Config.in
 create mode 100644 package/grout/grout.hash
 create mode 100644 package/grout/grout.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
