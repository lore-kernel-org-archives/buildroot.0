Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178C2CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAF9C60AE5;
	Thu,  9 Oct 2025 14:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vt368vBQyNxt; Thu,  9 Oct 2025 14:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD1560E56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DD1560E56;
	Thu,  9 Oct 2025 14:55:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10C4F21B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02D3C4113B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2s4UPmr5Uwlz for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:55:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7A5B4049F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7A5B4049F
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7A5B4049F
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:55:44 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e6674caa5so6306245e9.0
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021743; x=1760626543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Mw1XEIxtpRKDDJ2kUFME4y+1vUKP3cRIlm5SJKKqLw=;
 b=f+zEf45Ofi8eeTkJaSVKcZv8MiMatU4+TTMkBvITAT9vKWXdpJkgvsCN3gdzxpwYdZ
 66P0xOYwUpy5d8wBDld5FGwHXJMRUde5RTQVunGQGjex/LHxF+fRx53prxCht3IPvdA2
 cNHlnMcJ6DVy2gp/tixvT1oDpirtgceTVsT9xR4IyEXUIGU9pt++PwIqkOrCnW15sCOT
 Z/z2M5x6h679DbNNmHzgYMLHBIW6lG0XOTShGgNpcx6ETsNDZT/QOv4qBR0bAzdj46FD
 34e383rpNjtw3FCWNxyFX01ZFdsPjZzz1wG51nwQx0hcUAUFOW7yYlPYeOjdLv129gPb
 sb2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRs7PsSfXk7J+FrRHEcMMIMPqm1Kk5suebCAv+z8NZ4XWZlBVXch99n6U9EosouC65EG1Z6L8xQYM=@buildroot.org
X-Gm-Message-State: AOJu0YyncIbbuTSo7TsfOS2WEHb/jGAPppVVwHtsCYA8bTUVJlPj0CQv
 cYc33uFts89oQIupa8LepnhBh+AS+wKZFy77U0HiosmsWpOwmpcfwGGnHxXD5D+3wcE=
X-Gm-Gg: ASbGncuR0TytCVZkVfFF2YOj+thXcL3z6XZHQdsRFpVrYWCdpSCcjocuCJXfBMHdtCx
 wjJFF5Lo809LL9cGMW/iRCbrHH1clrcjZ8aibMPlQwm5KNKBSLsvDAFa75PNEpLTeNRKVZxEkub
 VtDRhSVZtGqCkNfayjyzjyblJq34Pc/zLDETzAJcqP/dDBvdPZd95BctUiDQIV/dRyOJ1owYErv
 VHBTf0zc5OjXLEi9bE4sX7AHiJfIMOhzP7eqt5D8MWFlqdbbqWCVsR5/nJFNvW122ttSv7fNFEd
 jVKIdAUIgRf9u25694u81E2wrEaoHJWa3etfcTF2m3R8JGrgSvhbXd65FU0pXMg70wzhtgnqDkv
 v27B/VhmNmQGt/5flChozi+r2lir6if4PAJAE3lYzPZy2HWL656nittaA7sjngQ==
X-Google-Smtp-Source: AGHT+IE3gbb+LPqisPxq8TQyF3KgnV74jGDgiHLFzrqANb0hU2bE0MEmJ3T481V67V0lqkAowtu9bg==
X-Received: by 2002:a05:600c:3543:b0:458:b8b0:6338 with SMTP id
 5b1f17b1804b1-46fa9e98805mr59397275e9.6.1760021742894; 
 Thu, 09 Oct 2025 07:55:42 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3e3520sm41512145e9.2.2025.10.09.07.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:55:42 -0700 (PDT)
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:55:41 +0200
Message-ID: <20251009145542.483474-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925-fix-pyopenssl-v1-1-dce0a1fc2644@bootlin.com>
References: <20250925-fix-pyopenssl-v1-1-dce0a1fc2644@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021743; x=1760626543; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Mw1XEIxtpRKDDJ2kUFME4y+1vUKP3cRIlm5SJKKqLw=;
 b=cW21iq9NUr/zqAXojVgUCl71DiDrCVYPv5XV5hPZRM0i9t+TBj9gdUTiS/4PE63c1u
 jRWyIfMmlV5EUF06Bp+gX9Ta0mfyBZjx88Jfir0F4kFAsPZcjbHmH2NSYaKUyHu4YWAR
 rzRyFr/GV3KWrfhAfV7d0opeymk/S1jW2qSg/bsuPf7QapeKua3ap4hkzmMLWLwfH351
 0GiDLgLhmaG74OhbX9QJznVB8+Sjw5SwdpHemY4NyQoJIAoQsD8Gxtwy5MY2sRA0+uo2
 wNs6sYkj3yoSxkBEpvEgCPeY4SQ+M92tyJZTme/XSS4SsWqiZibsk/srOeTPqEJwPT4l
 01vA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cW21iq9N
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/python-pyopenssl: add
 missing dependency for deprecation handling
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gV2hlbiBjb21taXQgYmJkY2I3NWQ3ZjE5ICgicGFja2FnZS9weXRob24t
cHlvcGVuc3NsOiBidW1wIHRvIHZlcnNpb24KPiAyNS4wLjAiKSBoYXMgYmVlbiBhZGRlZCwgaXQg
aGFzIHNpbGVudGx5IGludHJvZHVjZWQgYSBuZXcgZGVwZW5kZW5jeSBvbgo+IHR5cGluZ19leHRl
bnNpb25zIHRoYXQgaGFzIG5vdCBiZWVuIHBvcnRlZCBpbiB0aGUgY29ycmVzcG9uZGluZwo+IENv
bmZpZy5pbiwgcmVzdWx0aW5nIGluIGZhaWx1cmVzIGF0IHJ1bnRpbWUgd2hlbiB0cnlpbmcgdG8g
aW1wb3J0IHRoZQo+IG1vZHVsZToKPiAKPiBNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUg
bmFtZWQgJ3R5cGluZ19leHRlbnNpb25zJwo+IAo+IFRoZSB1cHN0cmVhbSBwcm9qZWN0IGhhcyBp
bmRlZWQgaW50cm9kdWNlZCB0aGUgZm9sbG93aW5nIGRlcHJlY2F0aW9uCj4gaGFuZGxpbmcgc25p
cHBldCB3aXRoIGNvbW1pdCAxYjJiMGVkMjE5ODYgKCJVc2UgdHlwZS1sZXZlbCBkZXByZWNhdGlv
bnMKPiAoIzEzODkpIik6Cj4gCj4gICBpZiBzeXMudmVyc2lvbl9pbmZvID49ICgzLCAxMyk6Cj4g
ICAgICAgZnJvbSB3YXJuaW5ncyBpbXBvcnQgZGVwcmVjYXRlZAo+ICAgZWxpZiBzeXMudmVyc2lv
bl9pbmZvIDwgKDMsIDgpOgo+ICAgICAgIF9UID0gdHlwaW5nLlR5cGVWYXIoIlQiKQo+IAo+ICAg
ICAgIGRlZiBkZXByZWNhdGVkKG1zZzogc3RyLCAqKmt3YXJnczogb2JqZWN0KSAtPiBDYWxsYWJs
ZVtbX1RdLCBfVF06Cj4gICAgICAgICAgIHJldHVybiBsYW1iZGEgZjogZgo+ICAgZWxzZToKPiAg
ICAgICBmcm9tIHR5cGluZ19leHRlbnNpb25zIGltcG9ydCBkZXByZWNhdGVkCj4gCj4gVGhpcyB0
aGVuIGJyZWFrcyBzeXN0ZW1zIHdpdGggcHlvcGVuc3NsID49IDI1LjAuMCwgcHl0aG9uIDwgMy4x
MywgcHl0aG9uCj4gPj0gMy44LCBhbmQgd2l0aG91dCB0eXBpbmdfZXh0ZW5zaW9ucy4KPiAKPiBG
aXggdGhlIG1pc3NpbmcgZGVwZW5kZW5jeSBieSBhZGRpbmcgaXQgZXhwbGljaXRlbHkgaW4gcHlv
cGVuc3NsCj4gQ29uZmlnLmluCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxh
bGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54LiBUaGFua3MK
Cj4gLS0tCj4gVGhlIHNwZWNpZmljIGJ1ZyBjb25kaXRpb25zIGRlc2NyaWJlZCBhYm92ZSBhcmUg
b25seSBwcmVzZW50IGluIHRoZQo+IDIwMjUuMDIueCBicmFuY2g6IHB5dGhvbiBoYXMgYmVlbiB1
cGRhdGVkIHRvIHZlcnNpb24gMy4xMyByaWdodCBhZnRlcgo+IHRoaXMgcmVsZWFzZSBicmFuY2gs
IG1ha2luZyB0aGUgZml4IHVubmVlZGVkIG9uIHRoZSBvdGhlciByZWxlYXNlCj4gYnJhbmNoZXMg
b3IgbWFzdGVyLgo+IC0tLQo+ICBwYWNrYWdlL3B5dGhvbi1weW9wZW5zc2wvQ29uZmlnLmluIHwg
MSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3B5dGhvbi1weW9wZW5zc2wvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tcHlvcGVu
c3NsL0NvbmZpZy5pbgo+IGluZGV4IDU2ZjM4ZjU4ODgxZmJmMmIwY2Y1OTQwNDgyMzhiM2MxMGNj
NDA1NTAuLjE4NGFkM2M1ZjViYzE5MGQ5NTVkMzg2YjE4MTZmNjYwMWM0YTcyNGEgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9weXRob24tcHlvcGVuc3NsL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uv
cHl0aG9uLXB5b3BlbnNzbC9Db25maWcuaW4KPiBAQCAtMiw2ICsyLDcgQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX1BZVEhPTl9QWU9QRU5TU0wKPiAgCWJvb2wgInB5dGhvbi1weW9wZW5zc2wiCj4gIAlk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMgIyBw
eXRob24tY3J5cHRvZ3JhcGh5Cj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0NSWVBUT0dS
QVBIWSAjIHJ1bnRpbWUKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fVFlQSU5HX0VYVEVO
U0lPTlMKPiAgCWhlbHAKPiAgCSAgUHl0aG9uIHdyYXBwZXIgbW9kdWxlIGFyb3VuZCB0aGUgT3Bl
blNTTCBsaWJyYXJ5Lgo+ICAKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogYzU1YmVkMjYzZDM4ZGRh
MDIwNDg0NjUwY2Y3ZDA3ZTk0NzdhMGQ1Ygo+IGNoYW5nZS1pZDogMjAyNTA5MjUtZml4LXB5b3Bl
bnNzbC01N2U4ZDhmMTA4ZGYKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gLS0gCj4gQWxleGlzIExvdGhv
csOpLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0
dHBzOi8vYm9vdGxpbi5jb20KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
