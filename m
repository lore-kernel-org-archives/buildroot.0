Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8239C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 15:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8882F83AF3;
	Tue, 15 Apr 2025 15:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3mVUWd8Tddw; Tue, 15 Apr 2025 15:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8584883FC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8584883FC7;
	Tue, 15 Apr 2025 15:31:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B9A9200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D912404E2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9JxNpbspwO0 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 15:31:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C95240536
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C95240536
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C95240536
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3912622c9c0so416858f8f.3
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744731100; x=1745335900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vXIdNG6LWI6z7F698v+CwyUsJolczZHk+vVQKw9cscI=;
 b=wSHc2xtZhxjwk/DQujY8GXO6fKjuHO8CaFJZ71wBd4N9CtvFdPLZfNWWxQ/Iqja0GB
 dT6uihN11otjeX6Eqnqtb+Z72LFf8fvoocv9zSACt9ZTVHLOpd+hUDnZFk04farsUSPb
 yfORqS6GyrBIAw4Wq+kjlx6/cmrEeQl9pU/SI+MhuZ41BObho9R943tfxzgf6Tn22jug
 c9cv0MZlULsMct37Ki6k/NmJF0OHJIrun9iSZYmeRjYH8z5yhooFvUNNtZyQ2g32vLqC
 jqAvVcqEIXBNqYVesBytt5F5nDr/qWxFj/2z2n6Oo0IqmNnKWdkANpH71sGsVRhPtBva
 /j9w==
X-Gm-Message-State: AOJu0Yy05Egqhudvh4mFFi6eCUwaRHIO6B5SYUzfc8slQDqR9AYwwRRL
 IqwaQJd61Io08Zel9Igjtklys1lDiMbSnsAmyB4ybQqFOhd/pwpknqugrsKs
X-Gm-Gg: ASbGncvDy/CNvGN2PmT5VNhBplgpmn8OnhD0t0v2BwyhhYxDe1b1oeeydf2oRaxSCcg
 UdQ6fzqgwo0JHpg6eoR5PnPgzhMdgymuvvmrIFk6kywv4GJxNTPCX8NDCF7tG1CfKxBGZ8DqLS5
 gCjOjfbwMArXRiqNjrSjh41F5BMS4t2JqQQaaw6seG2BRW+3gPqR7lPzs21lOD/OiDwnvmzxNr7
 V6uC2da8GzM6zl6oCzYKqbt4LaAA9IKpAs7y2OpTnD9JKF3RQHd/9wqwIk7o3/WzTI0XNU6slxQ
 a2zibk1TGv3eVAKg3/XPH2pW1MTqpOPLhMefXRYrIBlkRnA/xmjNlBPgs2cnXA==
X-Google-Smtp-Source: AGHT+IFs19h2bmerlxlFR3VzRFLKVeRFBu1SaKLM6hz+Dr3PdvqdEiVNiS1lrcEygz+S/w/VDeo9Og==
X-Received: by 2002:a05:6000:250e:b0:391:277e:c400 with SMTP id
 ffacd0b85a97d-39eaaecfaa5mr4986845f8f.13.1744731099581; 
 Tue, 15 Apr 2025 08:31:39 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae963fccsm14458950f8f.3.2025.04.15.08.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:31:39 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Date: Tue, 15 Apr 2025 17:31:27 +0200
Message-ID: <20250415153127.1868025-6-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
References: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744731100; x=1745335900; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXIdNG6LWI6z7F698v+CwyUsJolczZHk+vVQKw9cscI=;
 b=cAAOUQ5xfgPGCK1elxBpM8ZMJpZvgFcIVE1bmXJm66NXW65HcBiikJnI5vFGhSQHf+
 hWdWQgtARIGpIrQL5gDw+bh6X9djjYdUx1iQHAPJn/JnL3T2MMZcZGWCIZy0PFN4FTIo
 /TY+1P5woUEe7FcYmuTfczn0T2tC+mwCKZ1ka0pxKzAuBAEGFzlOMMyr6zoD1Sb2HjWw
 k/Ag8qakmBA+sjJluRQCuA94Nd3Al+inEURD0qgUs039fZOiXX/xJktjQUuwJYF/YQRE
 DxeO/Q1Ik1nrinmX0RtTBEJW9y5c0trdVy3V7lbEK8Q/AFY9P1f0gkW53PskjaMKItIU
 Brlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cAAOUQ5x
Subject: [Buildroot] [PATCH 6/6] board/raspberrypi/readme.txt: sort the
 device-tree
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

VGhpcyBzb3J0cyB0aGUgZGV2aWNlLXRyZWUgYmxvYiBmaWxlcyBieSBTT0MvQ1BVIGZhbWlsbHku
CgpTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNv
bT4KLS0tCiBib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFz
cGJlcnJ5cGkvcmVhZG1lLnR4dCBiL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKaW5kZXgg
NDcwM2QwYWRiMS4uYTExMDkzNGVjMSAxMDA2NDQKLS0tIGEvYm9hcmQvcmFzcGJlcnJ5cGkvcmVh
ZG1lLnR4dAorKysgYi9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CkBAIC0xMDUsMTIgKzEw
NSwxMiBAQCBBZnRlciBidWlsZGluZywgeW91IHNob3VsZCBvYnRhaW4gdGhpcyB0cmVlOgogICAg
ICstLSBiY20yNzA4LXJwaS1jbS5kdGIgICAgICAgICAgWzFdCiAgICAgKy0tIGJjbTI3MDgtcnBp
LXplcm8uZHRiICAgICAgICBbMV0KICAgICArLS0gYmNtMjcwOC1ycGktemVyby13LmR0YiAgICAg
IFsxXQotICAgICstLSBiY20yNzEwLXJwaS16ZXJvLTItdy5kdGIgICAgWzFdCiAgICAgKy0tIGJj
bTI3MDktcnBpLTItYi5kdGIgICAgICAgICBbMV0KICAgICArLS0gYmNtMjcxMC1ycGktMi1iLmR0
YiAgICAgICAgIFsxXQogICAgICstLSBiY20yNzEwLXJwaS0zLWIuZHRiICAgICAgICAgWzFdCiAg
ICAgKy0tIGJjbTI3MTAtcnBpLTMtYi1wbHVzLmR0YiAgICBbMV0KICAgICArLS0gYmNtMjcxMC1y
cGktY20zLmR0YiAgICAgICAgIFsxXQorICAgICstLSBiY20yNzEwLXJwaS16ZXJvLTItdy5kdGIg
ICAgWzFdCiAgICAgKy0tIGJjbTI3MTEtcnBpLTQtYi5kdGIgICAgICAgICBbMV0KICAgICArLS0g
YmNtMjcxMS1ycGktNDAwLmR0YiAgICAgICAgIFsxXQogICAgICstLSBiY20yNzExLXJwaS1jbTQu
ZHRiICAgICAgICAgWzFdCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
