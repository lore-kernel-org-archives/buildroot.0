Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77815C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21117600B9;
	Tue, 23 Jul 2024 21:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCo6pxs_kntx; Tue, 23 Jul 2024 21:20:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D61F36079D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D61F36079D;
	Tue, 23 Jul 2024 21:20:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B9D61BF2F9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6647180A00
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jjnp7QHj270q for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:20:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3255A809E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3255A809E8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3255A809E8
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:20:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4279c10a40eso43885585e9.3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 14:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721769626; x=1722374426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HPlPAVM+gvA5o+7g0BXsjcHc6I/qTAKLCluWFphHdyA=;
 b=k+FKhweL3M54yQa2pPoGWfHpIeJJPL3rXATsR+FqZviminzx799QLCDaKfdB807Rd2
 G4bfxkUvsF0AS8bfVgCJ+y58DHdvoWsNfD1CAWQ4XBhiKjurZLF5MlEWC08L4HDmH+AQ
 Rr32H0qmUH22QE2MhxQNJKB0isFGenJtj5QCCyrRnorRkAxPBn8zBz4K32Vl2ZOf3PQ8
 XwFKKZ0oSLuJnx4j/XWRJEqA5spwDnBJDWtTIOgjTOv+BUJuPZJleo4xcLAZ68tJ7V+K
 NSYXHt3o7Y5uno1Dowep9n7bUtICQXsq9AnVI3ZCWDcibHlbDzIKOTqyi+XpEeSkx+e8
 UaXw==
X-Gm-Message-State: AOJu0YxQACZhYZeQ7vZBqmIhwPpvykJ0TI/uF2lrRnauKNNufUw4Hm8A
 7nidenoR56KmRbZR3PT3UAntxJLUMHNHXUw5B0EB4FZXkFCI+PywJSljDFRocYM=
X-Google-Smtp-Source: AGHT+IF3HJlRWt8pr3Rn0SjCGv4XuQS5wzRQ6aYF831NBqdqNDmzGzfAgHcBhYwJavm0wsy0+SbjBw==
X-Received: by 2002:a05:600c:5246:b0:426:686f:cb4c with SMTP id
 5b1f17b1804b1-427f7a93768mr5510115e9.32.1721769626232; 
 Tue, 23 Jul 2024 14:20:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f937348bsm1575705e9.18.2024.07.23.14.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 14:20:25 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 23:20:10 +0200
Message-ID: <20240723212011.23048-2-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723212011.23048-1-gael.portay@rtone.fr>
References: <20240723212011.23048-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721769626; x=1722374426; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HPlPAVM+gvA5o+7g0BXsjcHc6I/qTAKLCluWFphHdyA=;
 b=eV0hYgk/u9tqlND7n0zdnwfPzxKCI6XyLzncHe+VuJEyVa8fPGiRunTQJqtcBFtDJG
 H6MS6ZzKpOIExOcDZ0sIOCCDGeILSQfIw3kyKD0ek6s6IvCHkE5tkC6U4MdF0w3NvGPr
 u1pZEDnjxSBa8Oy+d9k5Lp2ayScOjJHCbN5MThBenSWdoGQSfcW0ogT55bEhUR4uG9h9
 eMev5Jf3E4Wp/4nxvpPJeUPHGJD5Rk2qL29kp/4jHdslEA9tk3ItmNGGhUNM0aqYAkFw
 rok8w0KyCxfxA8Kf2H2khg4mcE57JLBk9UzovG9WQX/o/vGbqNBzTLN7M38MephuLs6X
 92mQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eV0hYgk/
Subject: [Buildroot] [PATCH 1/2] package/rpi-utils: new package
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhY2thZ2UgcnBpLXVzZXJsYW5kIGhhcyBiZWVuIG1hcmtlZCBhcyBhbmNpZW50IGFuZCBk
ZXByZWNhdGVkWzFdLgoKVGhlIHVzZWZ1bCB0b29scyAoZHRvdmVybGF5LCBkdG1lcmdlLCB2Y21h
aWxib3gsIHZjZ2VuY21kKSB3ZXJlIG1vdmVkIHRvCnRoZSByZXBvc2l0b3J5IHJwaS11dGlscyBz
aW5jZSB0aGVuLgoKVGhpcyBhZGRzIHRoZSBuZXcgcGFja2FnZSBycGktdXRpbHMgYXQgbGF0ZXN0
IGNvbW1pdCBhcyB0aGVyZSBpcyBubwp0YWdnZWQgY29tbWl0LgoKWzFdOiBodHRwczovL2dpdGh1
Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQvY29tbWl0Lzk2YTczMzRhZTlkNWZjOWRiN2FjOTJl
NTk4NTIzNzdkZjYzZjE4NDgKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0
YXlAcnRvbmUuZnI+Ci0tLQogcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluICAgICAgfCAgOSAr
KysrKysrKysKIHBhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5oYXNoIHwgIDMgKysrCiBwYWNr
YWdlL3JwaS11dGlscy9ycGktdXRpbHMubWsgICB8IDE2ICsrKysrKysrKysrKysrKysKIDMgZmls
ZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
cnBpLXV0aWxzL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcnBpLXV0aWxz
L3JwaS11dGlscy5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ycGktdXRpbHMvcnBp
LXV0aWxzLm1rCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluIGIvcGFj
a2FnZS9ycGktdXRpbHMvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLjRhZTgyMjU3YTAKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3JwaS11dGlscy9D
b25maWcuaW4KQEAgLTAsMCArMSw5IEBACitjb25maWcgQlIyX1BBQ0tBR0VfUlBJX1VUSUxTCisJ
Ym9vbCAicnBpLXV0aWxzIgorCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIGR0YworCXNl
bGVjdCBCUjJfUEFDS0FHRV9EVEMKKwloZWxwCisJICBBIGNvbGxlY3Rpb24gb2Ygc2NyaXB0cyBh
bmQgc2ltcGxlIGFwcGxpY2F0aW9ucyBmb3IgdGhlCisJICBSYXNwYmVycnkgUGkuCisKKwkgIGh0
dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS91dGlscy8KZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cnBpLXV0aWxzL3JwaS11dGlscy5oYXNoIGIvcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLmhh
c2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYTY2MTIzNzNiMAotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5oYXNoCkBAIC0wLDAg
KzEsMyBAQAorIyBMb2NhbGx5IGNvbXB1dGVkCitzaGEyNTYgIGMzNTkzMmU1MDFiNDNlNWZiNDhj
ZmM0ODhhYWRjNGE4YmJjZWIwZTllNmRhZmRmNmM3Y2QyMDY2YjU4YWNkNjEgIHJwaS11dGlscy1h
MWQ1MjJmMGYxYjUwODU4YTQ0ZmFjODA1MjNhMmJkODAwOThlNzg5LnRhci5negorc2hhMjU2ICA3
MzFkYTk1NjQzMWQxYTdjNTA3M2U3ZWU1ZWJlMDFmNTRlMzU5YzUzMzkzMTBiMzJmMDg5M2M2ZmU2
NTA3ZDVhICBMSUNFTkNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMu
bWsgYi9wYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uMWM3NDk1MWU0YQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uv
cnBpLXV0aWxzL3JwaS11dGlscy5tawpAQCAtMCwwICsxLDE2IEBACisjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIworIworIyBycGktdXRpbHMKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1JQ
SV9VVElMU19WRVJTSU9OID0gYTFkNTIyZjBmMWI1MDg1OGE0NGZhYzgwNTIzYTJiZDgwMDk4ZTc4
OQorUlBJX1VUSUxTX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHJhc3BiZXJyeXBpLHV0aWxzLCQoUlBJ
X1VUSUxTX1ZFUlNJT04pKQorUlBJX1VUSUxTX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKK1JQSV9V
VElMU19MSUNFTlNFX0ZJTEVTID0gTElDRU5DRQorUlBJX1VUSUxTX0lOU1RBTExfU1RBR0lORyA9
IFlFUworUlBJX1VUSUxTX0RFUEVOREVOQ0lFUyA9IGR0YworCitSUElfVVRJTFNfQ09ORl9PUFRT
ID0gLURTVEFUSUM9U1RBVElDCisKKyQoZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQotLSAKMi40NS4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
