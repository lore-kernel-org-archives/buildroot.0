Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD0AC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64B8D811AE;
	Fri, 25 Sep 2026 14:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrPIkeMaOgSl; Fri, 25 Sep 2026 14:44:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 60F1881322
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347465;
	b=gQTMBMDES2za/TMqJtRMppo462PmH3QJcDPXHWfXzqmemQh5+MUgxuLtzybbAyMrAR16
	 yDrysrl8hCPtRBxMWxtmqnWpg65VE0f/yosFcOlpiYgC59YIhlYi/smGv4xjinzcQ9r4G
	 7UljNJVjV2JxIQte8mGIk+tib8T1d/EFelw+r0wfOvtOULTRihFYkSyRJYiv7BLn1JmuK
	 Se9RTJx43B/FyWUYHRrszQT4brYj+jU0m1N+JhVnVrMEXaSIlGtUWZeGVNM49tumBgUmJ
	 blhM2mRkf1VxMc7PaRKo41bBiX/OR/oV+rglQkY+ilMBpEOoFNXhvGZM5GcMrY6PK+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347465;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+oPbQ1bh4Oqzl24osOhe1QXUCp0efV1j6Do6CzyVBQw=;
	b=Q11MxCSkTpq949btF9CXAm9PCixfE/EZV+TSXV0vZpQ8eTJkOEe/QBRmTSm98Qot2iyx
	 kNiE7WLieujbQimyT4clNMI0YIOWSrIwM86/xygBybdXPImpHJPDu/D2VLNPxWZN6cw2A
	 BBS5OoS8qIg31gCC+laPuFsDOxQWfhqiInmCkBntGsudmrv/bM6k//Nq9oD3UZd1v/h4x
	 B/+xXbD34+xmuVpLF5kWUwRYi20WJYAH+5KMSsGgyVeN1L60jFURmQzH3aXnbBY7JPd8y
	 HI0cAQEtEK0dSessOI1RVZk5PvmOP6tsc2QjZ+p3GVYC8riPQ4tcij+f4g3fGRCknJg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347465;
	bh=+oPbQ1bh4Oqzl24osOhe1QXUCp0efV1j6Do6CzyVBQw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fNwbLfUd4A1Dy3JLWWo+kLpEDV9zil+0Zt0zOAxKJ73uQVQhIqplLmwQEbrkstQmQ
	 5yF8t68qX/Bwwq29q0VsCETdML85hdGdde7y5fzgFPA8jribX7b6Obbxh+WA+bNgAy
	 FLkxT/dUxxKEBBDVCBIes+7F1N9ot3SOlcISSDIln6ooxdNRqIEq2T1arYybSTYHwb
	 LWRZJFZOt78529Q8bC+hgPzxyrkyuwhoYzSqYpq4syCVGc/LQta0Mv158PCOcwwNV1
	 DH6bLZl/loKJzUCEvtdIE1sObNpG+cZcF3fUGszeqldnCoTKF+BHzAP6BYgaTMIfWb
	 /f38dvRf3JZOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60F1881322;
	Fri, 25 Sep 2026 14:44:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0696334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B69E540790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJZo44MuZj_S for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 93C49407FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347460;
 b=KZ2kznU+/p1Huw0XfzxxAGLeybmPPVwdPvBoDIjaJh9Wj01nV1II7P8HwJdo7t61NXCl
 Hwv55sVR/yQqIPmFZ9dLM8yMbQJn0/qqq/57qE6AHvShaUdh7pP5DJtmlc0PTtmodLoXE
 uGJIisuCpK70Pj5h8xg64nAkaKo8ftXiG5ajgl/rKdvkmJ6JmmSbEt0PgqIIkydqZpFaK
 3ToOAmFSQKf9FdLco6o4bI8VAvVu4WIKIgT9/mHAd/yhw9b3ifyhsTQ5yalWWFY0LvFfA
 5i+CbWppaIKypRu6V3wyW89qyO84BR3G0qvg+ZK4w/byR//1KLpY2EDPbFsgRH7WTfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347460;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=Rx85Eov4GpWaMGXmU1nNI65zLprtH82OaIZHkwkWBqE=;
 b=cuEu03U/8CtzqDHnzFuQ5U6TdQ4rDT+YxI+JVjQBZcOEImKm/S/ZKx6stNC+dm/QLdEN
 YmJ9jzD2ufGBqnZaVMU6PyleNclAkQLDc+yo/KWgPjlBXMCEroW6QrPv9keI+C7M/zEyC
 mZqIXhcHVMlfFZp4yFHLDqU8LEfqDwyQ5Q74Yu8Ab1hFSA2ZCGfWKecsNgQWtNVkGuH2l
 PGdEw0tgJLF16ZWh3+psw/ZI4F80QjhEG8J96tA/av+ZhUM7hjsZn31HUWB8kNkrUTl/o
 EEYQOyJqNYuNhL6ik7WYkk2E5y5zhLYbUMSDVZ18j6VhAdeV2f7T0eit4YhXqBleHzQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PXF8xfjq; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93C49407FC
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:19 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843c3ea1f6so541952f8f.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347457; x=1790952257;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Rx85Eov4GpWaMGXmU1nNI65zLprtH82OaIZHkwkWBqE=;
 b=EoJzLb02qMHSBfFmJqKEUbZPM5U70QPBTgEw1Hhfi4LFrhWTks3ynmV2KS4kJd7O+C
 UK4MrcwLijGnSKXM3HyDbBk497g5/NyxxD5uPVsMhe4NSBJDltea+vXdvnFFBSwDI2Hm
 EGiKeeVDIw4sF8cZSVBrWp/iH4XNbCDRdOarYdXywHQ6GkuPQAUhASb8xO5tfQUa+z1H
 /ofq9eyRqVV4yhl+DRKdMy6FtwlM7ZQ30VJaNFRmtWuYFgJZqBk0Yqi4n2/S+tzWNk2f
 mclg9NpS57Zz6OaePvBFmILRRTSkD+y03GpNMWy82Jj7cflmEsBoCCw2MgHVBVFU+WvH
 n2Jw==
X-Gm-Message-State: AFuF++lIEcRyMXxkPOXw9PtLdkh9HH9UR6uqpOYTNGAVUIv5IoNNd52o
 iRL6ZkU7KCJLLYIGVzH/P798E/YLVHxyBZRRUtce8CId20A1ESIdYAjLIx42lc31eJa0PKCGZuE
 o4WMroIZIAw==
X-Gm-Gg: AYBFou2kR9xNYkcw0JCZyi/V/Y6FjM3wNhPTjv8ih+qMf1oKcjkB/9lAhyWJ5l19Zmv
 yJZxcruaWb5MmD/SQK90nCkWMkn2N3S9kEZ9V7A2X+XACZ3ViwWziT30y5K2AkOc1ASndG8Cc8S
 n+u736PnBzQk4Mgv97KdcCrI/eP1hN1ChzmzGH4omeNDqHqwE9PRM3u3sy1binh1lmFqCadwFd9
 PT77Mdh/kskGXNe1VVuKX355Uwv3daVZPy4RCwCFyt9hWnCMprCBXVx08x3NU3JELiGmI7s1Q8F
 65Kf7s2ZLIjMnQMGyVsvuvYcWsN2126gLaeR8JDvU7hYC3L5sg6Rm/+EbTyzOTbckTv5HCG/O4c
 Tig6kznezqsR5fCuZlP8xFXcX05jeJ3lkYbN93m/xELFJtQaoSW2VTDAYJhflArmJj1JTu78pn9
 i0tiYmFhDQrgSXKLN7IuT65NzEPYaSDPnjuflqw7nXAzix440ioSGthT/vpDXyEq1YjW3VAgpz8
 U5JB1vmmog6HcI+xcE4CI1VRPOVD7Sfg4axsLhbl1rx0OjMvZ/7
X-Received: by 2002:a05:6000:2504:b0:485:ac3b:4a79 with SMTP id
 ffacd0b85a97d-488716a1af1mr11502649f8f.43.1790347457644; 
 Fri, 25 Sep 2026 07:44:17 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a355c65sm7770635f8f.19.2026.09.25.07.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:17 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:12 +0200
Message-ID: <20260925144416.4095911-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909182214.935730-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5webengine-chromium: fix
 build with glibc >= 2.43
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

SW4gcmVwbHkgb2Y6Cj4gTm8gYXV0b2J1aWxkZXIgZXJyb3JzIHdlcmUgcmVjb3JkZWQsIHRoZSBi
dWlsZCBlcnJvciBjYW4gYmUgcmVwcm9kdWNlZAo+IHdpdGggdGhpcyBkZWZjb25maWc6Cj4gCj4g
QlIyX3g4Nl82ND15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gQlIyX1JPT1RGU19ERVZJ
Q0VfQ1JFQVRJT05fRFlOQU1JQ19FVURFVj15Cj4gQlIyX1BBQ0tBR0VfTUVTQTNEPXkKPiBCUjJf
UEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfU09GVFBJUEU9eQo+IEJSMl9QQUNLQUdFX01F
U0EzRF9PUEVOR0xfR0xYPXkKPiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VHTD15Cj4gQlIy
X1BBQ0tBR0VfUVQ1PXkKPiBCUjJfUEFDS0FHRV9RVDVXRUJFTkdJTkU9eQo+IEJSMl9QQUNLQUdF
X1hPUkc3PXkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0
PgoKQXBwbGllZCB0byAyMDI2LjA4LnguIFRoYW5rcwoKPiAtLS0KPiAgLi4uLUZpeC1idWlsZC13
aXRoLWdsaWJjLTIuNDMtYW5kLWFib3ZlLnBhdGNoIHwgNDEgKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9xdDUvcXQ1d2ViZW5naW5lLWNocm9taXVtLzAwMTAtRml4LWJ1aWxkLXdpdGgtZ2xp
YmMtMi40My1hbmQtYWJvdmUucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xdDUvcXQ1
d2ViZW5naW5lLWNocm9taXVtLzAwMTAtRml4LWJ1aWxkLXdpdGgtZ2xpYmMtMi40My1hbmQtYWJv
dmUucGF0Y2ggYi9wYWNrYWdlL3F0NS9xdDV3ZWJlbmdpbmUtY2hyb21pdW0vMDAxMC1GaXgtYnVp
bGQtd2l0aC1nbGliYy0yLjQzLWFuZC1hYm92ZS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMC4uM2MzYTIwMmFkMQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9w
YWNrYWdlL3F0NS9xdDV3ZWJlbmdpbmUtY2hyb21pdW0vMDAxMC1GaXgtYnVpbGQtd2l0aC1nbGli
Yy0yLjQzLWFuZC1hYm92ZS5wYXRjaAo+IEBAIC0wLDAgKzEsNDEgQEAKPiArRnJvbSBiZjhiZDU1
MTI5MjBiMjg0NjhkOTliOWNlNTUwZjA2MTdlNTdkN2Y0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQo+ICtGcm9tOiBQZXRlciBWYXJnYSA8cHZhcmdhQGluZi51LXN6ZWdlZC5odT4KPiArRGF0ZTog
TW9uLCAxNiBGZWIgMjAyNiAxNjoxMjo1OCArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIFtzYW5k
Ym94XSBGaXggYnVpbGQgd2l0aCBnbGliYy0yLjQzIGFuZCBhYm92ZQo+ICtNSU1FLVZlcnNpb246
IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVu
dC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiArRml4ZXMgZXJyb3I6Cj4gKy8vc2FuZGJv
eC9saW51eC9zeXN0ZW1faGVhZGVycy9saW51eF9zZWNjb21wLmg6MjE4OjM5OiBlcnJvcjogZXhw
ZWN0ZWQgaWRlbnRpZmllciBiZWZvcmUgbnVtZXJpYyBjb25zdGFudAo+ICsgIDIxOCB8ICNkZWZp
bmUgU1lTX1NFQ0NPTVAgICAgICAgICAgICAgICAgICAgMQo+ICsgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ICtlcnJvcjogZXhwZWN0ZWQg4oCYfeKAmSBi
ZWZvcmUgbnVtZXJpYyBjb25zdGFudAo+ICsKPiArU2VlIGh0dHBzOi8vY3JidWcuY29tLzQ1NjIx
ODQwMwo+ICsKPiArUGljay10bzogMTM0LWJhc2VkIDEzMC1iYXNlZCAxMjItYmFzZWQKPiArQ2hh
bmdlLUlkOiBJNWYyZWE2ODI2NjUwYjllZmY2YjRkZWZmZjY5NGYyNGUzMDFmNzY2Mwo+ICtSZXZp
ZXdlZC1vbjogaHR0cHM6Ly9jb2RlcmV2aWV3LnF0LXByb2plY3Qub3JnL2MvcXQvcXR3ZWJlbmdp
bmUtY2hyb21pdW0vKy83MTMxODEKPiArUmV2aWV3ZWQtYnk6IE1vc3MgSGVpbSA8bW9zcy5oZWlt
QHF0LmlvPgo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9xdC9xdHdlYmVuZ2lu
ZS1jaHJvbWl1bS9jb21taXQvYmY4YmQ1NTEyOTIwYjI4NDY4ZDk5YjljZTU1MGYwNjE3ZTU3ZDdm
NAo+ICsKPiArW0Jlcm5kOiBiYWNrcG9ydGVkIHBhdGNoXQo+ICtTaWduZWQtb2ZmLWJ5OiBCZXJu
ZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+ICstLS0KPiArIGNocm9taXVtL3NhbmRib3gvbGlu
dXgvc3lzdGVtX2hlYWRlcnMvbGludXhfc2VjY29tcC5oIHwgMSArCj4gKyAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPiArCj4gK2RpZmYgLS1naXQgYS9jaHJvbWl1bS9zYW5kYm94L2xp
bnV4L3N5c3RlbV9oZWFkZXJzL2xpbnV4X3NlY2NvbXAuaCBiL2Nocm9taXVtL3NhbmRib3gvbGlu
dXgvc3lzdGVtX2hlYWRlcnMvbGludXhfc2VjY29tcC5oCj4gK2luZGV4IDg2OTBhOTZlYjAxYi4u
ODk4ODgzNjUwOGM3IDEwMDY0NAo+ICstLS0gYS9jaHJvbWl1bS9zYW5kYm94L2xpbnV4L3N5c3Rl
bV9oZWFkZXJzL2xpbnV4X3NlY2NvbXAuaAo+ICsrKysgYi9jaHJvbWl1bS9zYW5kYm94L2xpbnV4
L3N5c3RlbV9oZWFkZXJzL2xpbnV4X3NlY2NvbXAuaAo+ICtAQCAtNiw2ICs2LDcgQEAKPiArICNk
ZWZpbmUgU0FOREJPWF9MSU5VWF9TWVNURU1fSEVBREVSU19MSU5VWF9TRUNDT01QX0hfCj4gKyAK
PiArICNpbmNsdWRlIDxzdGRpbnQuaD4KPiArKyNpbmNsdWRlIDxzaWduYWwuaD4KPiArIAo+ICsg
I2luY2x1ZGUgImJ1aWxkL2J1aWxkX2NvbmZpZy5oIgo+ICsgCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
