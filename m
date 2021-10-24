Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CAAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:00:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB00F60F21
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB00F60F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF68D80E76;
	Sun, 24 Oct 2021 14:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CGeTJFZ_j9ov; Sun, 24 Oct 2021 14:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AADD80E79;
	Sun, 24 Oct 2021 13:59:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 433F11BF2A2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31AC740124
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iozhxe2YsrKe for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:59:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D7B6400B5
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:59:53 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r4so6096300edi.5
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 06:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XV/vaCU2NAYQtyICc2j44rUTv4NnVJQVOk8J24n01OE=;
 b=WGZO+NmJBfH7ZvpELcBeM/FXynHluXVQ+wBEXnmT7jJLLBQnSsi0LWqwTkCKVpdUtu
 JNUmlwHNHwJ16PGENbjql105aMvx7VMAUtN1sUCMrgqXfKJGXVDlqOfAjJa9GRnsnm+H
 YftR1KNXQiJUfrZIskljaTMxY/aRii/BIjKZm2fxjU3RJVCXt/HmeLLWE20TP+pzziRG
 X/itBYGnu9SDo+0ixwEgeMXy2I/dHr3LZcgJCpP4Uu+tN0Y3QmpIw/6v0HFEyf7Jxg5f
 EZFy5jNQBBQjeRdxyxk952vrPWekp+A6uKFRNHok3zRwWLNNnquHqeHMTCebKC1cJRxh
 1XXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XV/vaCU2NAYQtyICc2j44rUTv4NnVJQVOk8J24n01OE=;
 b=Kp4gNZLUu3yTHwQlFsP1C78Ox7TfEJcg0/wBy1CZVax+C5nZDXbXYkqc1pQV5qaqH2
 7kcby11Ait+kjs7vM8XDSG83oh734WnV4rjvCfkvcCSsVenLRFsGlHTZgZAA7sxpuTLW
 fxR/3eqJiNvZQqiHPw/WAJnhrdhzSbItRyDMwq7N40JfmII0HtdUEZlfEchtgGC5sQly
 qpKoDzXP0jm6UOoM3xoERUseEB8tA5b9m3Dy6R0NcjO4OTYQnDgDjyT7hwJzc9vLSsO0
 TFWtDp7sTShSo7nuU//9agu8u1Nks4ujB8Oj6RC3JZZ9NerhMyTBwWE1+nVwk4tOopUY
 Lmjw==
X-Gm-Message-State: AOAM533VfVhDN5qlb5ruoueHT2Yi7bQLWhOb6xMemPAESKCDCm0nCuPA
 W/1OPbNBqBHBbTRXlcittMxltf3DbVQ0FRo+
X-Google-Smtp-Source: ABdhPJyhoedcS1s0zjqiFBAS93wRTCTRF7GR2pUTlQ2+e60+C3Pr1zBjEoS/51Rz+W5HsNl5mJ0ZTw==
X-Received: by 2002:a17:906:645:: with SMTP id
 t5mr15179664ejb.163.1635083991989; 
 Sun, 24 Oct 2021 06:59:51 -0700 (PDT)
Received: from localhost.localdomain ([109.130.26.5])
 by smtp.gmail.com with ESMTPSA id f12sm7765684edx.90.2021.10.24.06.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 06:59:51 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 15:59:29 +0200
Message-Id: <20211024135929.1385089-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] docs: contribute: fix typo
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIGRvY3MvbWFudWFsL2NvbnRyaWJ1dGUudHh0IHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9tYW51YWwv
Y29udHJpYnV0ZS50eHQgYi9kb2NzL21hbnVhbC9jb250cmlidXRlLnR4dAppbmRleCAxNGVjZGJk
NjZjLi5lNThlNzVkOTZkIDEwMDY0NAotLS0gYS9kb2NzL21hbnVhbC9jb250cmlidXRlLnR4dAor
KysgYi9kb2NzL21hbnVhbC9jb250cmlidXRlLnR4dApAQCAtNjEwLDcgKzYxMCw3IEBAIGJlIHRo
ZSBtYWludGFpbmVyIG9mIHRoYXQgdGVzdCBjYXNlLgogV2l0aGluIHRoZSBCdWlsZHJvb3QgcmVw
b3NpdG9yeSwgdGhlIHRlc3RpbmcgZnJhbWV3b3JrIGlzIG9yZ2FuaXplZCBhdCB0aGUKIHRvcCBs
ZXZlbCBpbiArc3VwcG9ydC90ZXN0aW5nLysgYnkgZm9sZGVycyBvZiArY29uZissICtpbmZyYSsg
YW5kICt0ZXN0cysuCiBBbGwgdGhlIHRlc3QgY2FzZXMgbGl2ZSB1bmRlciB0aGUgK3Rlc3QrIGZv
bGRlciBhbmQgYXJlIG9yZ2FuaXplZCBpbiB2YXJpb3VzCi1mb2xkZXJzIHJlcHJlc2VudGluZyB0
aGUgY2F0YWdvcnkgb2YgdGVzdC4KK2ZvbGRlcnMgcmVwcmVzZW50aW5nIHRoZSBjYXRlZ29yeSBv
ZiB0ZXN0LgogCiBMZXRzIHdhbGsgdGhyb3VnaCBhbiBleGFtcGxlLgogCi0tIAoyLjMzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
