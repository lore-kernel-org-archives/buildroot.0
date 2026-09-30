Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AAECA5FB1
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 10:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7EE440A65;
	Wed, 30 Sep 2026 10:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLfX_Hdb2-x8; Wed, 30 Sep 2026 10:58:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3DF984085B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790765924;
	b=DiUFjCvQYLgpFAvWxEOHQUm6CSVbiV2zVIl2C7fmRd148wI5VxQ00jLsnb3ibQOtkDvL
	 Pt5ifKeJT+JnVYUZm1Onl/ICxXjU9tRem5N/stHxnT61ThLc3eu447BKQbUzXQ1pRFBnN
	 X0F/INWH7Ba+ruUOHQvOQBxeL7ddQGTvPvFNb6mjvR57Md5YZItxiDCcqtYMl9mptUmk/
	 bQxJi2v5puzTP3RIm9lfhsEEgvyUwXxZxZ79CG1S/m+yD5tiaXVF3Q0ETt8Djs2XT7QNq
	 In6o8fbAdqxdYyxAd1kg3g+gsASYIfQBUDCPsNpVhYLzc5g8PMRBK1CpRM95y73a6Bg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790765924;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ClJdoec+9SKtuxtLPKqbq0tEGsaE7kSPZb8ZOrDRsX8=;
	b=egJ4ldJyvDy8W9LriUy8baZ3wK3WDQRPyc++NQOGd9KvT80/5bKzXuhgE2pjD2WOv5LW
	 cjdYTJ26QwQcaTdMgUHJ2K196a+Ze3wOQmKqizNcETUCMc0ChnxzT5IGe374ld723/yKj
	 6ot34xaYEDgqR1FnZN2lrTt87ziQ38+nvkTVUgLSqNkVxo/p3l4CPzpOdCIX9dmKPQkss
	 eYCH47aitsKCi3X5OgLjTM974/PvkU1Zg9z64MIc2Ob40pmv2Mg/kV4xhHCmFSBxBRb6t
	 sxLnVQfSDZzKAgLyenYxFY6FVh8y5wDJWDcogPbQUSc9BE7FQFvM6aLSzBIpBItXX+A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790765924;
	bh=ClJdoec+9SKtuxtLPKqbq0tEGsaE7kSPZb8ZOrDRsX8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=sCFYmXDLU0vo8epnWYzT9/j0uNmV/gPxugjBWiJB1T9jSWrzU3vx39XKQfShWoQI1
	 fAK1jIWVY/BXcMldxLt8C8Gkl7CJeqdC4vwaWqR185uKt6ULG9mtCvDdTMnl1vHYir
	 3BjtKXHb4SqirdmHuEcKtKgbArFCy6JWE6t0hU4D/98NYOUe6Ei52RXnuSy2UTh6h7
	 zJWZmGGZTB6yLEUrOc0v3/r63Nt7T8yic7z9o3aDMqHY2ia/9XO4NGk1QJi+M4XFm1
	 EpxRjBM+7Wahwp+zmob0STtAJwbYwRufvVxipjxI3bYPMPcGquF69t8KL5FWl3p41u
	 yKDvSLu+SgbRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF984085B;
	Wed, 30 Sep 2026 10:58:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12D0924E
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 10:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 043BF60814
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 10:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YY1Y0iSO4uJ8 for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 10:58:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2212760678
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790765918;
 b=cLr4I4AQxzRZaIep13p3F6+8djfNXMipIeSzf+OLXRTsYENLh8jItXf8LZEqQPx96N+L
 1Ys3fyGr5zwSmc6WY0eFSeIXn2b+1xnJ+EAfw1R+P5fjjfFKaENkxpmq6acRnPW59ZsA+
 0TbXC9d0sx0C1rjDoamlgvqlsvV280W6nI4wngRGCTQKLHbiLPTCft6EAVMHVu/RU2eQK
 oK1VGu0wJONGK6zbLin3/ISurmMobGvX/cJNXvs8Q7I6UgKxFJysLi86Ryh6tHK4CKvme
 IdfSFKmQGwh7BGm3g3P+1x5mdNiy7wMTBnDnj3aZuzqY/BGCH77a0OrzQhbONYVffLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790765918;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=InBLylC8R0AMryoyiiQadp/7o4GUMZL1yfyzfRpuT/0=;
 b=AuLgtbDdFq9lIDglkiOsXJ5r5IcorXD2p01Wti2W3Z5r2QXsZoCwDgsbCP4KRbzeFVU6
 cHzZk+CJNMOSsE5vGQZ20VFLOFQzcpLOtoCNOkRm1XjWSOWL3on6iUtg06ZPMRucZEmSC
 HDqaNYGlDDtPrxCogiaiZvKfHrypq9YOYKN+pZudMDgkPkPSSAuFlFtH22db6ft7zQm6D
 LBzzK9qWWg/qMI1JOHWs6/Ky8TkQSWxZWcdofW5u2wlKQ8sp9vXuF1tEAUzhA6GKrA0Fs
 qEyOv1JQd6QjUtVeowxDLU5hrIX7XLfTO8BLaVT/ZxhchaT9ymhKhoTujhx2qwssAEA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HELUZOHZ; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2212760678
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 10:58:36 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e721b5503so48465255e9.0
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 03:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790765914; x=1791370714;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=InBLylC8R0AMryoyiiQadp/7o4GUMZL1yfyzfRpuT/0=;
 b=Rjo56TA8Vm5/DbWx2vqqsfmGGBK5lP68tvaaJJoGktT4wPP2ZZVamsXCPf0yKjtWTz
 KxpEkogZNlfbsCP9S4zcqH9j2XwYRMZAI8Tf2/1AjfbRfFMKTlCv7o+yzW4WxYZ/ft/Z
 SXogh2b5XCvhD3IP7jEMeOXQmu3Z7MQIBzXc5C/6njCaKXHqUHUT9bcKPhuxJZLkHIHc
 nkqt7TotkiD5WY96RHK/Nue5R9TW5FJmluOyTp1NXDvcUao0EZPEROnNh6ijsQfuOqMB
 uci7LtoZTqDfQbLkAPWSJK2QpukGn2RtXeXcD9upREmcK1ow9uc6z1zcAtLm30kni38E
 wIYg==
X-Gm-Message-State: AFuF++niYdzGXD9gJjOVbz+A+U61fFqhc2RjEV97cqeTUmq8pqBegK8b
 HpBMRN5RQN8p0dxYMNfvtsQdr7jWh5IRVdCoNxaUTRbohdGQFKBDNTrKu5SqX+/7rGha7JgUZUd
 AEpl71OI9ZA==
X-Gm-Gg: AYBFou07+yjT07atO5Ty9Tm8yAOc9O/oiHELDfdK/WQ/+0whbCgnCKzZQZEL7lrFxIv
 7Lxy1PsOqM8VGcZc2euxQlLo3TO5aKRgcGLJqmHP0vtV11qbicDpXgWGoPIh6ZHxvHfKBV2RiV8
 1I7XeXG0JkX6pys7fokevl3e9zJ1+Zmph6XOoWxzBqCqkMA7X6dQM+0shiM+++RpGJuNw6RaH7B
 8CSMhSprm/9g/vLdLynsdK1fDPn4PYpPEOe1oYSrkHJ3Uxot5hYsBhP8nX9CJwei6imxn9ZomO6
 mjQl54p6kMT4VrC1e66IehxYzklydN7v5Ii6KhaiKIT/GQDicOQiYJwc3gnWxoxPYfSIqeQFUgr
 xl58poleyrxBFzOHMYzOmf6kfbflNEkb/WrZYb10A3vcWgIQOS/lMw1+/W7cZa+2hsAZU4+2Iwf
 QlM1fm4Se5pY3rxu7VqJcjAnjPn7bLBzArQ3HJ2DExDg43WtIVA1u3wxrQ5CVRWRCrwMV8gnzym
 xtHd58PIlcMUQ==
X-Received: by 2002:a05:600c:45d3:b0:4a0:98c:e082 with SMTP id
 5b1f17b1804b1-4a01affdf1emr16131095e9.13.1790765914309; 
 Wed, 30 Sep 2026 03:58:34 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029e575bsm2946050f8f.21.2026.09.30.03.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 03:58:33 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 30 Sep 2026 12:58:23 +0200
Message-ID: <20260930105825.462957-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: add upstream patch fixing
 builds with old gcc
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVpbGRpbmcgd2l0aCBhbiBvbGQgZ2NjIHZlcnNpb24gKGZvciBleGFtcGxlIHdpdGgKICBib290
bGluLWFhcmNoNjQtZ2xpYmMtb2xkKSBjdXJyZW50bHkgZmFpbHMgd2l0aCB0aGUgZm9sbG93aW5n
IGVycm9yOgogIC4uL3NyYy9ncmFwaC9ncmFwaC5oaDo2Mzg6MTI6IGVycm9yOiBjb3VsZCBub3Qg
Y29udmVydCDigJhn4oCZIGZyb20g4oCYZ3JhcGg6OmdyYXBoX3TigJkgdG8g4oCYZ3JhcGg6Omdy
YXBoX3Jlc3VsdF90PGdyYXBoOjpncmFwaF90PiB7YWthIGhiX3Jlc3VsdF90PGdyYXBoOjpncmFw
aF90LCBncmFwaDo6Z3JhcGhfZXJyb3JfdD594oCZCiAgICAgICByZXR1cm4gZzsKCkFkZCBhbiB1
cHN0cmVhbSBwYXRjaCB0byBmaXggaXQuCgpObyBjb3JyZXNwb25kaW5nIGJ1aWxkIGZhaWx1cmVz
IG9uIGF1dG9idWlsZGVycyB3ZXJlIGZvdW5kIGF0IHRoZSB0aW1lCnRoZSBjb21taXQgd2FzIG1h
ZGUuCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1p
bmQuYmU+Ci0tLQogLi4uMDAyLWZpeC1nY2MtNC05LTQtY29tcGlsYXRpb24tZXJyb3JzLnBhdGNo
IHwgNjMgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYzIGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2hhcmZidXp6LzAwMDItZml4LWdjYy00LTkt
NC1jb21waWxhdGlvbi1lcnJvcnMucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2hhcmZidXp6
LzAwMDItZml4LWdjYy00LTktNC1jb21waWxhdGlvbi1lcnJvcnMucGF0Y2ggYi9wYWNrYWdlL2hh
cmZidXp6LzAwMDItZml4LWdjYy00LTktNC1jb21waWxhdGlvbi1lcnJvcnMucGF0Y2gKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZTNkZTg4MWU5YwotLS0gL2Rldi9udWxs
CisrKyBiL3BhY2thZ2UvaGFyZmJ1enovMDAwMi1maXgtZ2NjLTQtOS00LWNvbXBpbGF0aW9uLWVy
cm9ycy5wYXRjaApAQCAtMCwwICsxLDYzIEBACitGcm9tIDBkMGI2MjU3NWYyYTUyNzEwZDFmYzNk
NTllZDM3NWNiM2E1MDcwMWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBLZXZpbiBI
ZWxsZW11biA8MTc5Mjg5NjYrT0dLZXZpbkB1c2Vycy5ub3JlcGx5LmdpdGh1Yi5jb20+CitEYXRl
OiBNb24sIDIxIFNlcCAyMDI2IDEyOjU4OjAzICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIGZpeChn
Y2MgNC45LjQpOiBjb21waWxhdGlvbiBlcnJvcnMKKworVGhlIGN1cnJlbnQgYnVpbGQgZm9yIHYx
NC41LjAgZmFpbHMgdG8gY29tcGlsZSBvbiBnY2MgNC45LjQgd2hpY2ggaXMKK3VzZWQgb24gZW1i
ZWRkZWQgS29ibyBzeXN0ZW1zLgorCitSZWY6IGh0dHBzOi8vZ2l0aHViLmNvbS9PR0tldmluL2Nh
ZG11cy9wdWxsLzEwMDUKKworQ2hhbmdlLUlkOiA3YTRiZWM1YjU0MThiZDA5MjFiMjczZDhkNGEx
ZTc5YgorQ2hhbmdlLUlkLVNob3J0OiBzcHZvbG51b3V2eXIKK1Vwc3RyZWFtOiBodHRwczovL2dp
dGh1Yi5jb20vaGFyZmJ1enovaGFyZmJ1enovY29tbWl0LzBkMGI2MjU3NWYyYTUyNzEwZDFmYzNk
NTllZDM3NWNiM2E1MDcwMWEKK1NpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBo
YWVsLm1lbG90dGVAbWluZC5iZT4KKy0tLQorIHNyYy9ncmFwaC9ncmFwaC5oaCB8IDIgKy0KKyBz
cmMvdGVzdC1yZXN1bHQuY2MgfCA2ICsrKy0tLQorIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvc3JjL2dyYXBoL2dyYXBoLmho
IGIvc3JjL2dyYXBoL2dyYXBoLmhoCitpbmRleCAwMzk5ZjdmM2UxZi4uZTBlNzMzZTdlNjEgMTAw
NjQ0CistLS0gYS9zcmMvZ3JhcGgvZ3JhcGguaGgKKysrKyBiL3NyYy9ncmFwaC9ncmFwaC5oaAor
QEAgLTYzNSw3ICs2MzUsNyBAQCBzdHJ1Y3QgZ3JhcGhfdAorICAgICB9CisgICAgIFRSWShyKTsK
KyAKKy0gICAgcmV0dXJuIGc7CisrICAgIHJldHVybiBPayAoc3RkOjptb3ZlIChnKSk7CisgICB9
CisgCisgICBncmFwaF90IChjb25zdCBncmFwaF90JikgPSBkZWxldGU7CitkaWZmIC0tZ2l0IGEv
c3JjL3Rlc3QtcmVzdWx0LmNjIGIvc3JjL3Rlc3QtcmVzdWx0LmNjCitpbmRleCA5ZDQ4N2Q0MDgz
ZS4uYjdiOTNhNGNiZTcgMTAwNjQ0CistLS0gYS9zcmMvdGVzdC1yZXN1bHQuY2MKKysrKyBiL3Ny
Yy90ZXN0LXJlc3VsdC5jYworQEAgLTQzMyw3ICs0MzMsNyBAQCBpbnQgY29weV9tb3ZlX2NvdW50
ZXJfdDo6bW92ZV9jb3VudCA9IDA7Cisgc3RhdGljIHJlc3VsdDxjb3B5X21vdmVfY291bnRlcl90
PiByZXR1cm5fdHJhY2tlZF9mcm9tX2xvY2FsICgpCisgeworICAgY29weV9tb3ZlX2NvdW50ZXJf
dCBvdXQgKDQyKTsKKy0gIHJldHVybiBvdXQ7CisrICByZXR1cm4gT2sgKHN0ZDo6bW92ZSAob3V0
KSk7CisgfQorIAorIHN0YXRpYyByZXN1bHQ8Y29weV9tb3ZlX2NvdW50ZXJfdD4gcmV0dXJuX3Ry
YWNrZWRfZnJvbV9sb2NhbF93aXRoX3RhZyAoKQorQEAgLTQ0NSw3ICs0NDUsNyBAQCBzdGF0aWMg
cmVzdWx0PGNvcHlfbW92ZV9jb3VudGVyX3Q+IHJldHVybl90cmFja2VkX2Zyb21fbG9jYWxfd2l0
aF90YWcgKCkKKyBzdGF0aWMgaGJfcmVzdWx0X3Q8aW50LCBjb3B5X21vdmVfY291bnRlcl90PiBy
ZXR1cm5fdHJhY2tlZF9lcnJvcl9mcm9tX2xvY2FsICgpCisgeworICAgY29weV9tb3ZlX2NvdW50
ZXJfdCBvdXQgKDQyKTsKKy0gIHJldHVybiBvdXQ7CisrICByZXR1cm4gRXJyIChzdGQ6Om1vdmUg
KG91dCkpOworIH0KKyAKKyBzdGF0aWMgaGJfcmVzdWx0X3Q8aW50LCBjb3B5X21vdmVfY291bnRl
cl90PiByZXR1cm5fdHJhY2tlZF9lcnJvcl9mcm9tX2xvY2FsX3dpdGhfdGFnICgpCitAQCAtNDU3
LDcgKzQ1Nyw3IEBAIHN0YXRpYyBoYl9yZXN1bHRfdDxpbnQsIGNvcHlfbW92ZV9jb3VudGVyX3Q+
IHJldHVybl90cmFja2VkX2Vycm9yX2Zyb21fbG9jYWxfd2l0Cisgc3RhdGljIHJlc3VsdDxtb3Zl
X29ubHlfdmFsX3Q+IHJldHVybl9tb3ZlX29ubHlfZnJvbV9sb2NhbCAoKQorIHsKKyAgIG1vdmVf
b25seV92YWxfdCBvdXQgKDQyKTsKKy0gIHJldHVybiBvdXQ7CisrICByZXR1cm4gT2sgKHN0ZDo6
bW92ZSAob3V0KSk7CisgfQorIAorIHN0YXRpYyB2b2lkIHRlc3RfcmV0dXJuX21vdmVzX2Zyb21f
bG9jYWwgKCkKLS0gCjIuNTQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
