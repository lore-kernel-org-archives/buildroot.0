Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C802C982FF
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 13:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 217A6607A6;
	Tue, 22 Sep 2026 13:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1K4lUgv4q1Me; Tue, 22 Sep 2026 13:19:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 559226074F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790083160;
	b=I6H/1hsRcIDTWPa/ABCORKULbq5iQZzKMzbUgM6VuqxWBIhflMEf3hPpiwORZ7OYSrmc
	 aGJGD3nJstcPnxI7NRyeMJWzCkbrkVBqC9zfrSneOhh/Jp5cY6InP153oLGoCEr8TtACi
	 IpPj1XN8MVTWYSNfb49Jn56oHOSloGwWwkKfV+Uh7FOXeixVfO9AsA0xQqU3Pp5XMml9B
	 aH02ChPxWp69Ib8WPhGoptb+aISI55an9UGnVl6Lcrdzx5ZZoJQTQSLceSN5SrhAUpXNm
	 kbGmSuz73n9SebSfOXPZ4hHY3JLAjdD5MSCp68z4oDs/ITqBP/0iPL3zT5njUVugfyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790083160;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=QrzKBE0O03BoPaoIoLwYo1OfGqTZYHC1aVZfKwjvzkY=;
	b=D4ENyaL+xnxHuWhV91nKxJbSlQq3nNS7ZSms33VQpsK0WYgMb5EBwHg2Da3OhldrvlYW
	 BpTcGOrok9e1OIGVFF2Pd3pxmrAvmtMxPCgCu7QKlXa4KhD2uzYp0aTAywIWcMhUMFPa5
	 NKY5zptf+A2PEm/zOXsn30WPEtqPa3/q4eEPxiM/9BLKnj7XaiMoofXZs1BhwrJqElGnu
	 CsPAXZ5uH8C4Vop5hZKY1omnHS3SWHhxdhR3zjLqrI39jrRjXrnnu3fVTwBWb9xIKhva3
	 k3FC28kbklGilD/bzS45Li1EVFCt6htGka5shBjcGwQ0hLRVIAQnvcknpmhRIVMq6Mg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790083160;
	bh=QrzKBE0O03BoPaoIoLwYo1OfGqTZYHC1aVZfKwjvzkY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c6NnuiVgssZ9iBSjjSOOIN274VfwycLQfYbz7hzlxp2wWeIyOBkIbbv5Iu/LJF7FH
	 79q9LUc1oGAcPc7juWnInCBkSy/p3/wq+givfaLEaG8z+6+daJgFk+8lCif1FvwMf9
	 uC0U0D0zQwMsivyUHsTOkDwD4Jxg0uCRfecvdqTonWGUeMc9cvs1a/OAqGQgg9zZin
	 6wRMzIc0tdkm4jQ3gtf3Ky81LGIbu3ucnFpEHoZ7zmBx2HGqKfNGH5OACCOmGCdemO
	 uGpMlR14f+xul82NJcu+4mvb9NCCcaH7kc7p92cDgMUeNZ2/ONpmsP6TUV7EEDfDYK
	 7VtgtQ9HLv4Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 559226074F;
	Tue, 22 Sep 2026 13:19:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B41B352
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 13:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 014B740797
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 13:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCEY2QgoElL1 for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 13:19:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E447540799
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790083158;
 b=oq0LsmYlCn8axYbMV5Ydcgo7r+iT1IoJslxh9wf1xI4HH531mk9qJ0QQWz5yGTBtpvV6
 U+++RehLBhpLmMmTJiPW4pJiJnlPPQbUWsTxqzC0sTykwnmZjkOtLOJrgxQg5N+UqLGZO
 7gXCY4uwdnHAuZgchT6ovJZK7wtsqxGm5LKwBLFKMxW+7zKUCpEn/xLVhkm2V+AgU/N8b
 PSa1ff7Hkadq7juzJlkMNUXpSnE437RthjEFBR5Yb8P76YayA+ndSAjXcJHyJCwShQ7RW
 CljQmoTsKrGBQy0wCtIVT37fD9Xh7JZ7Es0YmCWrvuWFeYQwhRKkqkKF47sed0n0Gtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790083158;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=XjnQayAXifXGFmG9JRFg2tfacQSwF421ektU8Q3FEJw=;
 b=oXeFdHcXdKOJSYdfZic8z92uxIM+LAHePUL/UapXULgF4TvTg1kdHJX0OfPKA4Ccy3x4
 k1iz6a45fkuqXCItH4fVowGPaRqiyomRYt61LzMUha5ea4+csIEAAkKUDW+ao87bMX88B
 l2oNe5q3F+q1BDQa6kSJ9CXg9CZpFzyWv5oZx+We/FvWaTs2Jbhq9B3kdDTgPOGz0G2U0
 OxN8a+OXRZRve6R+d8Zk6Rpx0Yq6VqrUZj+WttwZrWE4xoE8mnj/tL6iOEVhM9ACVtnWn
 DXn58/6oiMCR+KjyqcX+8W+RtHrOzXMWlxJ8c9Tf80v6fpota0dDegmcESLG7ibMcrQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=cSH2JLc7; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=cSH2JLc7
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E447540799
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 13:19:17 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cc9f581c4so17792075e9.0
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 06:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790083155; x=1790687955; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XjnQayAXifXGFmG9JRFg2tfacQSwF421ektU8Q3FEJw=;
 b=cSH2JLc7HrQpjG+GfZFO/EdDM0i3mG60VG9H/9LkKL48QneNoejGGjGZjGcuyZzNSX
 En1eHg/YQgpOqjL9W8b8o3PGQ5KMRX9GsSQYyCoql3cYf/4LsbeM9BVLTUd4avbcVc0L
 ueoHVTioKdHMTrup6pP163/ZFOZxonMHFM121oNxEEFaFfV4UIk07SZK86poxEylOxQZ
 CgPTr1OK/koU2kHzfYFXctESMtg6sdhM89FtzKCW5gZPLZ2TYnyO3wc6iT/dkLUeObY6
 i1uwiL23nWsgq9mT4sajrIJBxph4qkbMWmViDo2o/jrzBaLfAJzVM0Zbvr8WdYhcVeCu
 T1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790083155; x=1790687955;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XjnQayAXifXGFmG9JRFg2tfacQSwF421ektU8Q3FEJw=;
 b=RJVVpERvXWEvxKZbzkQPNSuDoAZRxIivnsatYWDNeHSQRTeI06S9l92x0ffF5hUeXp
 CyXxqQQS9153+3GmiaXG/ZEYb+C4aqDGw073DBrbh124noeyBKfSsFodItdfMuT4ZEPd
 SaUUDeSo+fRFaYnTUvb5c8PH4VzqH3NUOnzNyNRfB875hJ0kwVgNO/7J8+se2eyS9hP8
 sSWEknFaQ2kiXUkL6w5PbLcDNsn/bTMQmYG5yY63MlHn3WbFisc3FrYgbtOvZc8yQhha
 xjFXY9gsH89G+6099SlNDu0vkm1xJ6favxoZ9aoesl5VlcQJ9cwheVZRqZqupyGbNzU0
 kOUQ==
X-Gm-Message-State: AFuF++lM+CnKSjVGPHv1mZckj+JPSqtgtrsN1m6HwP3bYtMSXOCvLMFv
 136Ds2KYqsgfD5ZRDOJ6/SLzMWIyQmuGMwWgCkzc7Cm0+RnnXyJg3QZmQp0d
X-Gm-Gg: AYBFou2dYwA6aqioX0I57FA52HP8jsy9zlQU1D7d0aeX/srxoa1OfzcsTXb5yhyZi9p
 MeIi1bBM8Mhe14sf0LgBMMcOEfUFFBmQDNZxdXGg5UZnNRtwEnyhvaXHjR/91Z+ySMvhznXicuA
 aXVpikDWI6lPOt0xDeVgehsCX7uiKP/wf6NcsHUsjbLTKAroNAEu1hpp0mO1iUke2Wdxki/pcuL
 chJGTxn1OJRiieq8MxXrrd/KM1mnUIQHT9eYXnVRP+2XTcyrp/vWf1udrEteahAQzjA+rJST0ZV
 txpNTH1g0aPtU8t47KFgTKyFucdE6+hxVL3U/MokVNQzRmLZC+V7+e5jFMgFD+ZUQT/UFX5A5fg
 VCAE+Epx0OzdJ8/SIHLFmtfGctz5kDVJNgoHPQkyB0zdbWPTJYJyFVo9sk5K5gEbBzTypB4C+WW
 TJ//71qZnt2G0PuKGt1TrV1lOtCGdjqInrpq8etHmy30Fhio818KdOhXujXeMEIuwUApWsNwZoG
 QU=
X-Received: by 2002:a05:600c:620f:b0:49e:8222:3451 with SMTP id
 5b1f17b1804b1-49fd8a6cdb7mr38205745e9.14.1790083155194; 
 Tue, 22 Sep 2026 06:19:15 -0700 (PDT)
Received: from devhost1 ([2a02:a319:a1e0:eb00:f133:8e97:2009:ce5d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fd8cc061fsm73847155e9.4.2026.09.22.06.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 06:19:14 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: shirokovalexs@gmail.com,
	thomas.petazzoni@bootlin.com
Date: Tue, 22 Sep 2026 15:18:57 +0200
Message-ID: <20260922131858.103751-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aq_C_jltc2dsvVi-@windsurf>
References: <aq_C_jltc2dsvVi-@windsurf>
MIME-Version: 1.0
Subject: [Buildroot] [v2 1/1] package/nnn: add BR2_TOOLCHAIN_HAS_THREADS
 dependency
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

bm5uIGxpbmtzIGFnYWluc3QgcHRocmVhZC4gU3BlY2lmeSB0aGUgZGVwZW5kZW5jeSB0byBhdm9p
ZAp1bmV4cGVjdGVkIGJ1aWxkIGZhaWx1cmVzIG9uIHRvb2xjaGFpbnMgbGFja2luZyB0aHJlYWQg
c3VwcG9ydCAoZS5nLgpici1hcm0tZnVsbC1ub3RocmVhZCkuCgpGaXhlczogNzg1NmU0MTY4NWEx
NzlmZGRhN2IyMWExMDQ1NWU1MmZlNWZhNWNiMCAoInBhY2thZ2Uvbm5uOiBuZXcgcGFja2FnZSIp
ClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTaGlyb2tvdiA8c2hpcm9rb3ZhbGV4c0BnbWFpbC5j
b20+Ci0tLQogcGFja2FnZS9ubm4vQ29uZmlnLmluIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL25u
bi9Db25maWcuaW4gYi9wYWNrYWdlL25ubi9Db25maWcuaW4KaW5kZXggNjRjZmE4ZTBhNS4uNTU1
YWI4NjRkOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9ubm4vQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uv
bm5uL0NvbmZpZy5pbgpAQCAtMSw2ICsxLDcgQEAKIGNvbmZpZyBCUjJfUEFDS0FHRV9OTk4KIAli
b29sICJubm4iCiAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIGZvcmsKKwlkZXBlbmRzIG9uIEJS
Ml9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKIAkjIEJ1aWxkaW5nIG5ubiB3aXRob3V0IHdpZGVjaGFy
L1VURiBzdXBwb3J0IGlzIHRoZW9yZXRpY2FsbHkKIAkjIHBvc3NpYmxlLCBidXQgaW4gcHJhY3Rp
Y2UgaXQgbGVhZHMgdG8gdW5zdGFibGUgYnVpbGRzLgogCSMgVGhhdOKAmXMgd2h5IHRoZSBXQ0hB
UiBkZXBlbmRlbmN5IGlzIGhlcmUuCkBAIC0xNSw2ICsxNiw2IEBAIGNvbmZpZyBCUjJfUEFDS0FH
RV9OTk4KIAogCSAgaHR0cHM6Ly9naXRodWIuY29tL2phcnVuL25ubgogCi1jb21tZW50ICJubm4g
bmVlZHMgYSB0b29sY2hhaW4gd2l0aCB3Y2hhciIKK2NvbW1lbnQgIm5ubiBuZWVkcyBhIHRvb2xj
aGFpbiB3aXRoIHdjaGFyLCB0aHJlYWRzIgogCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBmb3Jr
Ci0JZGVwZW5kcyBvbiAhQlIyX1VTRV9XQ0hBUgorCWRlcGVuZHMgb24gIUJSMl9VU0VfV0NIQVIg
fHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKLS0gCjIuNTUuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
