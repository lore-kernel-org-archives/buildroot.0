Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B281CD4F3C
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 11:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0052B4136A;
	Wed, 20 May 2026 11:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQYDIjn2MrzS; Wed, 20 May 2026 11:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA10F4130F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779277967;
	bh=pPOd8yU/TUI635OPs9j8l5Q/zXVykOhSpqYK/OwI0JI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=eG8v+XJUP9FGqOJ5MCdBa6sxuGouDLRDTj8Dd0twhYhgcp88uri440z7A4JPI59zK
	 1k08fCxLZDQtQQOWmt5/qCXhz1+Zvlx43tdCyRzVZNmpzWiu/VxrZWj7I0tqKamCV2
	 gM5AV+tLyv/yerVW7nZrL6SnNp+GWo7TN3o9wWmVYTmvYJ8k3gbAtPPnZ1gfrdT5ZO
	 +/NlHNHZP0N8YDQnBJy47QFw3mEdCCFYjoML+jH9NL4IuTOKGQK3Fm0dNKiYpRWIjh
	 fmXmqrMOLZhIRa2YwSBppNm9AgZ8LTeJCnZK/XVuz/vcHj6eGuA+tP6Z73IAzMsTa3
	 IW9Avr03TPUqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA10F4130F;
	Wed, 20 May 2026 11:52:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 097C3282
 for <buildroot@buildroot.org>; Wed, 20 May 2026 11:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2F6C4130F
 for <buildroot@buildroot.org>; Wed, 20 May 2026 11:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEXVjkdd5Cv6 for <buildroot@buildroot.org>;
 Wed, 20 May 2026 11:52:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=jonhenrik@qbee.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3B21412EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3B21412EC
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3B21412EC
 for <buildroot@buildroot.org>; Wed, 20 May 2026 11:52:45 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5a8f9841616so4147796e87.0
 for <buildroot@buildroot.org>; Wed, 20 May 2026 04:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779277962; x=1779882762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kam80sY8azfh2DXdmjECSd2vtJ3DeM3d+0smrigQxUs=;
 b=J2PM3s/cY5OoASzyNPbTsSE7UeJPmrC349OK8JMNt15lEDKGdVQKjeM79Wt1JQW02D
 I2pqdafFKVydn/OSzHJu+rESBcxB/fYpkz85gYBcCHritkr+ULcdRAR1D3kkv+jiyVGR
 oztkK07aMALGfpMnF+XCFP48iiGQg/1LBUvFQREV23wqJmUCDMbMgwoiPDTXlXHCibxe
 waHPgyXsNK+7ryjBbQhvPHmJ2p8LrtBJH4cUrk3ovwsY3MTqJnC1B7Zn8lZGkM7VaqlM
 gSYxUpxTlCR4U/YXUro6/yoY8qtKppz/13NkqOmxCqT1pxBHNRcuY7KSa8KgHi+c2wrW
 k2Sw==
X-Gm-Message-State: AOJu0YzY+f+n7dHBX3AmreIw7aURZ2K4pok7BIMWU7igTzoOEsVPJ4cV
 7K22nBvd/smT+eg/Ijsy/nSss3lUIapk0BGUSw5T6yeK0fgs3sc2/drDV8yTROiSSN4rHOio9u9
 9wFjAFJw=
X-Gm-Gg: Acq92OG5E7Ql5Fj2Qn0zF1hIvgvcAUxms3gvOyXo5My17T9p5MZU/1u5OZdn70wShuH
 Sq3/ruTVecfWgauAPkCj6AeUPQ7l/kOTtgzLy0NTOnQrOp/zRH+Bm3WH11qpjSmsdKVRBie4H/n
 hQQ37/O0YKEdL8tTa+H7XSXPETuBg8TtlbJ563gniynfOcmcBow82pYAdEx0R3RDbAlph4AxQSp
 3VVd9qZ1xUcCqqgRjVdRQNN+hGwwD+EOylrsEYkXHRGaEFNq4w+J50AKbvqKL/y0+9rXnz4ojsu
 UwvmFtZpFrkOsnlS70xfEDsS4gOwOt3aq+QbkKpsANuzfOmCmexiEacHTPbm+u4N4VeiCasWPUp
 ij86uKz3llnrFTdT65mfgPnZFCrRuQHnvot8Ai4zfpUCxa4OgCbD0fpzyzNo8nLcI84E7kl8fqJ
 A2rH8YIRjmex0aLzLzuSdAmUsBciscYE5L
X-Received: by 2002:a05:6512:3c97:b0:5a3:ffc6:6600 with SMTP id
 2adb3069b0e04-5aa0e73c26cmr7825221e87.31.1779277961940; 
 Wed, 20 May 2026 04:52:41 -0700 (PDT)
Received: from nola.getinternet.no ([2a02:fe1:410c:a500:cc94:a9a5:3b7b:9bfb])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-395887bcea5sm27629171fa.38.2026.05.20.04.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 04:52:41 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Date: Wed, 20 May 2026 13:52:37 +0200
Message-Id: <20260520115237.1843693-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1779277962; x=1779882762; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kam80sY8azfh2DXdmjECSd2vtJ3DeM3d+0smrigQxUs=;
 b=CDi7s+QczsLZwskhktAoNkjskLErVVCQh7TLgKRr4rsx1DE3t2JEdp+MvTxQMuSTKF
 u1JMrtmYLqzc4J5fuh0bsTgg7l4i9GsawCwXknn5NBM6rVBmwWPrgxzNAbjxwvt7gESB
 tObCalQNEVhotkDqQ6vwEKe8cRjdRxuLQh+jk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qbee.io
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qbee.io header.i=@qbee.io header.a=rsa-sha256
 header.s=google header.b=CDi7s+Qc
Subject: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to 2026.19
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9uIEhlbnJpayBCasO4cm5zdGFkIDxqb25oZW5yaWtAcWJlZS5pbz4K
LS0tCiBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIHwgMiArLQogcGFja2FnZS9x
YmVlLWFnZW50L3FiZWUtYWdlbnQubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaCBiL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2gK
aW5kZXggMjA5MGQwMTY5Mi4uMmY3ZGExNDM0ZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaAorKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgNWYxY2E3
MzNhZjU5NmFlYmRlYzQ5Yzg5MGI1OWU1NDA2YjQyMTdlMjhkYTAwZTYxNmI3MTcwNmY3ZGU5OGI4
NyAgcWJlZS1hZ2VudC0yMDI2LjEwLWdvMi50YXIuZ3oKK3NoYTI1NiAgZGU3MmM5NzU0ZjQ2ZDYz
YzNkNmRkMjg2ZTRmYTk2N2M0YjU5MmMyNjc5YjE3MmZmOGNlOWU3ZTZhZTEzYTRkNCAgcWJlZS1h
Z2VudC0yMDI2LjE5LWdvMi50YXIuZ3oKIHNoYTI1NiAgMDJkMDdkOTZiZTk5ZWIwNDJiMDFiYTY1
MDA3OWE0NDBjZTI2YTc4YzVlMGUxZTgwNjBjMzNhOGM5ZTIwMDQwNCAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawppbmRleCBjNGY4OTFiMGZhLi5jY2JmN2NhYjQwIDEwMDY0NAotLS0g
YS9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5taworKysgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawpAQCAtNSwxMiArNSwxMiBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAogIyBrZWVwIFFCRUVfQUdFTlRfQ09NTUlUX0lEIGluIHN5bmMgd2hlbiB1cGRhdGluZwot
UUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNi4xMAorUUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNi4x
OQogUUJFRV9BR0VOVF9TSVRFID0gJChjYWxsIGdpdGh1YixxYmVlLWlvLHFiZWUtYWdlbnQsJChR
QkVFX0FHRU5UX1ZFUlNJT04pKQogUUJFRV9BR0VOVF9MSUNFTlNFID0gQXBhY2hlLTIuMAogUUJF
RV9BR0VOVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogCi1RQkVFX0FHRU5UX0NPTU1JVF9JRCA9
IGNmZWVjOTkxYjk3NjQ4YWFlY2I4OTRkNGM5Mzg5ZmZkZTc3MTFhYTgKK1FCRUVfQUdFTlRfQ09N
TUlUX0lEID0gOTlhMGI1YTU2YmIwYWUyZDdkZWMyOWFiY2YyNWQyOWJlMTZmMmMzNgogCiBRQkVF
X0FHRU5UX0dPTU9EID0gZ28ucWJlZS5pby9hZ2VudAogCi0tIAoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
