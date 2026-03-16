Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14B9F46453
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 11:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512C260AFD;
	Mon, 16 Mar 2026 11:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDn637bYXxrf; Mon, 16 Mar 2026 11:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B5DE60F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773661047;
	bh=XoGj9WOZxOWj6K9jEfmowUiOsBw3UGcWP9EmLwzvoBE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p03exxhtMNOhwj6h4IO3dA7O8R10KQs7N8gKcFFHSnNKdBfapBkrVfTAY6nNJ23rq
	 nYnocDtkRuuA+u0wvoYk9Jecw0guelinO33K6tN7qUHBqXXxN5aKX38xxRb/WxKM+L
	 Z6D+N9XlPsNIPQfW26Nplw5kmF30ljg2j04NAQEFmXgWQQdo/buWI1sQcgoXDxbEba
	 pl0wwbb8Myr6meTyF+mFO8agkQTrwQAfCXZyqllvQzH6Ad+JX+xPyii82VBVFzwlg4
	 g0115cxkw4adbp53QCdqupX7E6zBYhtBnmCs/cLS1iGJCFAkszLMTKGaS0hevXJBGV
	 oIYfEKHHC5xTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B5DE60F83;
	Mon, 16 Mar 2026 11:37:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60AC4D3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 11:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4445F40366
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 11:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0xOl6TkcYLQ for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 11:37:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C52540414
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C52540414
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C52540414
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 11:37:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-439c6fc2910so3424204f8f.0
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 04:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773661040; x=1774265840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b6LfJtqDcPn9ue17VvI8UXRCYXlFqMkpqLHVQb/Ue34=;
 b=K1JpLi/Ggq+jIHuyyRywjUyPPfSevMY3tgbD5h76KgTvVx30BR8fZA2nFAc6ww5fVt
 JW737XzZ79nuNnb6fRo3REB2GwS6vLeWF8sk4J+uOlNvTUpW5FXNtUC0yOYZCCpdERyG
 7LZHXL2W8RetUK/dfL+rlzgivbksHed/am1bkr0crQNK4EHcqBeVw64VLbHhwa5bUh9q
 MSR4a8zfpH55ZE3D3i2jclFzE+93JnmrHkwF/gN66ko6sF0kY8Yf3ypNCO+d1IPKFJ15
 93WvE3KDFM0u3amDduZ60kv9RNN0fOR0Rfmmu7vS8BDkn2GL8PpFV3FqqMAJChWwi3J8
 oPxw==
X-Gm-Message-State: AOJu0Yw3RPHlUOg0j91jvW3OWJC7MxsYa1MsFPNey/7yU+sY853pr1eQ
 rhh91Ju/DDX3FlN7HaveWMmM8CV3+PiHHzS1SPtG7QQMfGRbIT/o5LOSNqqDLboE3usCGRAZHQ+
 dww7mROU=
X-Gm-Gg: ATEYQzwcDD3ZedLCoYLQjIqHmqTrrxJ01TCmOSSNgRRT5GErSiaR6/XnO+rDLAvbDK9
 Gd+Z4ZlJK/Bo/CGGfBfsRGNamcxUO/cA6i/FBDsWOLnAQjnapk4tHC0QQe+ENEawMxa3M+aDEH5
 7dDVP0/2nQraKIogZCWpIJ10UMKz53miZVgiPnCFdUVtfUv/0CTTvQQa5gGXpJqCsK5HCHwUQUZ
 HO+Uh4472M98aIk9FNNPtuLO9GHXMHAMs3R/HL6Jh1jVnyTxtXuu5m5Esph6lVEJ8r315p1OxBH
 mj+xkgqItnBu3CbK4PiyuKXQmA/F8ntQENF9snH4ClFWbr0PpKYPY1mMhoNIwJnz6mpFEo8A2tb
 bXv8G8Fn+EWOnel87EiY8nwffJYKIJsbXtL9Pr6DTGRJ44H+rQBatwNrxwDHHgo1mJ8/+IeuCIg
 0YlbKjMf5K1b8hOIWK1/b/Kaj29vdGfuOt1hYbunM024UU6fhxQnvaM11Sq5vm
X-Received: by 2002:a05:600c:4583:b0:46e:4e6d:79f4 with SMTP id
 5b1f17b1804b1-485566f923dmr221204595e9.15.1773661039632; 
 Mon, 16 Mar 2026 04:37:19 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b3a09e453sm19809750f8f.0.2026.03.16.04.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 04:37:19 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Mon, 16 Mar 2026 12:37:16 +0100
Message-ID: <20260316113716.208738-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316113716.208738-1-thomas.perale@mind.be>
References: <20260316113716.208738-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773661040; x=1774265840; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b6LfJtqDcPn9ue17VvI8UXRCYXlFqMkpqLHVQb/Ue34=;
 b=FZKmDbrjXjO+uJ8yq9CCG2UZ0XOEOEsA+AFg4GIrUPOrNsFLyQuPYm69OjUZ2QsMgW
 LQmWk+t3TRVNwyDcj9FCFS+rUKQQChuVAYTXwT8zNlHktwnL1Oxnz6jlQA2NUJNDkrRg
 lnx2wV9GIMPqvJR0CVSWod4sXz+ybA7qZYmJ90Pzo/NX4EFQ60TZxa3NJvIuhHcWs/0J
 Ty9w9QvgbFyCJbocSFEdB04uccDkcVHTvFrXQFHK9eNXmRgQ9e8iQRE9d1Lnw8wq50qh
 dkmUYwLFhj0dV3O919UvsWTRTV2PvPNGQmMzPCVedx3FIxIEqt6ez6ZXOu4dizexMYQZ
 nW6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FZKmDbrj
Subject: [Buildroot] [2025.02.x,
 PATCH 3/3] package/wireshark: security bump to v4.2.14
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

For more information on the version bump, see:

- https://www.wireshark.org/docs/relnotes/wireshark-4.2.14.html

Fixes the following vulnerability:

- CVE-2025-11626:
    MONGO dissector infinite loop in Wireshark 4.4.0 to 4.4.9 and 4.2.0 to
    4.2.13 allows denial of service

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-11626

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index f1f2f58442..521fea662c 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.13.txt
-sha1  e5a08396a98d5dfba4078c66677aacd50d47ec90  wireshark-4.2.13.tar.xz
-sha256  2454aa650276264d23aca28e1b62eb5d4bd12b64aa261d38c06b33f97b8fa3dd  wireshark-4.2.13.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.14.txt
+sha1  e972062abc0d15db34c3a0186c39511efb29ea34  wireshark-4.2.14.tar.xz
+sha256  098177f021951638f5bdca5b01f284c14fcc3f6c804f7aa2ca00fdcb99c7a166  wireshark-4.2.14.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index bd81224ae7..3a92c4cfa4 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.2.13
+WIRESHARK_VERSION = 4.2.14
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
