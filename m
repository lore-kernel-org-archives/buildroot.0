Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F137C369C9
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 12:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25E986FCB7;
	Thu, 17 Apr 2025 12:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVl19r-j8ET1; Thu, 17 Apr 2025 12:41:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57AEC6FBEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57AEC6FBEC;
	Thu, 17 Apr 2025 12:41:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BB6011B
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 12:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D0754096D
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 12:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzkY5PwVlEpR for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 12:41:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8D0F40584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D0F40584
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8D0F40584
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 12:41:30 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf7c2c351so269355e9.0
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 05:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744893688; x=1745498488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=68xxyt2bW3MZi0xX/JV0OnpHqZsjR5pE6Mw2WsZ9UdE=;
 b=YgfKqtohVCe9iVt+XYWZPhcxhp3NHtTFVfsLZiClgOBE65hPIAo0sTVBBka1bCD5Vi
 7RlkADVCVlCtdUptGCo/uNHgoSIeNvdyNe6IUlVW/SYSf3VBsceISoZtESKCTPZAqCdA
 zWcIDF7m4u5KFpfnCUOhw5oiYNTzcJudKyBSFwaWtBzZgFmRAwQLDZjYnEwxIZu7wjKq
 B9TZRMaBQoG6C0Jd2+eCFgtQFOyXNvRSIcD9ha8CZcfzc64LRT1H5kBt2+eXxX5/6Rwl
 dJcz73hbk4nDYPTdzP7jqyLDNdS9CJEfET28OTD7VttREEs/uJWNsiQLPMmLjRESxdW7
 3BEw==
X-Gm-Message-State: AOJu0YyvoKPwFuV3SJ19ciXa+iWDGQ1CZeyziLdNKPNafmCgsqi21+wJ
 16WMAnpS1E9Uk1ofw5y13bXJ8WcVrreX2bJuTjeRiNIn8hcwPwvzXGsTQdzB
X-Gm-Gg: ASbGnctQ6WmE33KJ2qwh8zsKBn36Vy/y819BXwRTJDV/nwm9IvbcM5AGvAHJgfe61j/
 PkvNSh19zB7fl7SBUPD78rFF0ncE/ihtPcLgOC1gXubtkvC0MJz2Jp2hSMFa5O7TIMdWhBMcR7F
 CuSo31NUvBbgB6FnjqUWXJVqCbuw/nE731ghrwJ5uQ3C+Sd/P4G1RDx/x1aXYENBRJ4t+ERfKL0
 a9VFB43zPa3uREGjLM7cccgD0k6qDTKnpPbLEgUPRuPaeFxlB0R2QURGWcnbYbidM3r+Bjs68Gv
 FfbQ/qsEw/hiUnDiDNkCVIccivJ+6YGecu5XKPfgnKWZXPNEs6crgjapIw/9nQ==
X-Google-Smtp-Source: AGHT+IEKyra3v4PW7srW8GFkEZ2LRuNKoWrC3ouEEgNFPp8cK46Is5UXBzaDvY2PAaKGx2QmtT5vnQ==
X-Received: by 2002:a05:6000:4008:b0:391:2b54:5fb5 with SMTP id
 ffacd0b85a97d-39ee5b9bf80mr1912873f8f.10.1744893687894; 
 Thu, 17 Apr 2025 05:41:27 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b53ef95sm52022035e9.36.2025.04.17.05.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 05:41:27 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Date: Thu, 17 Apr 2025 14:41:24 +0200
Message-ID: <20250417124124.1911199-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744893688; x=1745498488; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=68xxyt2bW3MZi0xX/JV0OnpHqZsjR5pE6Mw2WsZ9UdE=;
 b=SmAXiLZBJBLaBR58Pvdedt1RVWle3hghts7J0TTH/5EKJu/n6spH+DUumIHE1Q1D7n
 2WYhzeddRf74tPy6q4Z8JFEDU7Q9gMK0vHohmz/wDlpmpWHaTKpCfLMhV1IXlpdPiLxu
 XXfN0fNg6ERU7jjnnqgUdx7EFjMhOM6zqKr5l3SSgzg4V0WXXBrVYiUBH/0dPDYvYGeL
 98+dKKUcSTQ3HiL+e8zPejgrB37rblNdqy3Yv8ok32xBerk4pM9RtOBBOCFMXbCRG63v
 YsVeylVT8fzU9LsAsANNmRT+e5SQi6BBlrLhBRGbyrQRAFes/eWYu0JjqX937jQPQzYI
 K7TA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SmAXiLZB
Subject: [Buildroot] [PATCH 1/1] package/rpi-firmware: add note to keep in
 sync with kernel
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGJ1bXAgb2YgcGFja2FnZXMgcnBpLWZpcm13YXJlIGFuZCBsaW51eCBoYXZlIHRvIGJ5IHN5
bmNlZCwgc2luY2UgdGhlCmxpbnV4IHBhY2thZ2UgZG9lcyBub3QgaW5zdGFsbCB5ZXQgaXRzIGRl
dmljZS10cmVlIG92ZXJsYXkgYmxvYnMuCgpUaGlzIGFkZHMgYSBub3RlIHRvIHJlbWluZCB0byBr
ZWVwIGluIHN5bmMgdGhlIHZlcnNpb25zIG9mIHJwaS1maXJtd2FyZQpwYWNrYWdlIGFuZCBrZXJu
ZWwgKHNldCBpbiB0aGUgZGVmY29uZmlncykuCgpTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkg
PGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlL3JwaS1maXJtd2FyZS9y
cGktZmlybXdhcmUubWsgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tayBiL3BhY2thZ2Uv
cnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawppbmRleCA3YWU5ZmY2YzI4Li44MzUwZDM5NWRh
IDEwMDY0NAotLS0gYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsKKysrIGIv
cGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLm1rCkBAIC00LDYgKzQsNyBAQAogIwog
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAorIyBQbGVhc2Uga2VlcCBpbiBzeW5jIHdpdGggY29u
Zmlncy9yYXNwYmVycnlwaSpfZGVjb25maWcKIFJQSV9GSVJNV0FSRV9WRVJTSU9OID0gNTQ3Njcy
MGQ1MmNmNTc5ZGMxNjI3NzE1MjYyYjMwYmExMjQyNTI1ZQogUlBJX0ZJUk1XQVJFX1NJVEUgPSAk
KGNhbGwgZ2l0aHViLHJhc3BiZXJyeXBpLGZpcm13YXJlLCQoUlBJX0ZJUk1XQVJFX1ZFUlNJT04p
KQogUlBJX0ZJUk1XQVJFX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKLS0gCjIuNDkuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
