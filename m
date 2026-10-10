Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF1CCA9ECC
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B29E60BB2;
	Sat, 10 Oct 2026 09:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSwu-LTYppMu; Sat, 10 Oct 2026 09:24:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9690160AA0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624270;
	b=ZasHitRYHlxd8ZoEDQrW0ObLRsXOhfeeojeLrij2jdz//x74pcC0i23TPn/2Uv+lRP8w
	 wQU0o1baC1McmYq2sX7IGKMdlaHqP+AmwWQfKnne4mAKTIhgADMxo+6s5Pluq+ieXVCYO
	 /ZXk9Yvj0a2RSjqs1aLd71CX0MpZ0jrcXWk2xx/cdwmElE0V+UHNjAnXgwc1hCzVLlYa7
	 BtGq3XVT4lKWGBYXfgVcJSWfq6mHThNn4fgdylOnxd3q3JkyGivL+C8z74e/vpPff3Fex
	 u8KaFC2fbCrNPr9aiX4paiRpPEQ8HSpGHKB7FLe8V5gRazC6StaxQcSXJwggr4dCZcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b+mnD02XV1ashxDXiu2I75ErLqwZPZTqC5kb/e6PYng=;
	b=cB/L/aud/MWx8ZIgLt/oR/tPVynPisT5xMfQLnktbKKUZix0VuE7V1VXItJcsrthGdlL
	 jKXxQzkRI5150/wazQmrx9SyRcfFdU3sNf06M04K9/8rQt767O1rGoGjC3IZlbgoV20ro
	 Hs0DrF6ZuqPDPM7Lza61M8qmtnOyD5rIq6WnI4x981ySeVUrM8EVwA61DzCGqwtthcKxM
	 63jWQBk5kI5ABjfjwY4MCQB6Yr1pLoK4tT52kk+utLbti5qm2v+Zn9vEZTTYG3+yKn8Cj
	 fGWzGltztLrPXGqNwHbyu+D3zUcd/eZxm8G3y52z5r3zTNXz5RVSDtnt+4Q5OzOi9uA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624270;
	bh=b+mnD02XV1ashxDXiu2I75ErLqwZPZTqC5kb/e6PYng=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lMgMDtwPd8y+/o4ojbKf5gm1k9iA2uuLqUqrtvFsB2qPtvNISA4u1pVV5hZ5pC+Jw
	 OhpFN7lHW4ROi2sHpG83uz22zNngfyTc8GWtLwa80fVXBGTaOb7B8TsnPaoa9uqlvA
	 zj1m3Z4+2hCf1+uO3qQqH8tjMPDaQSSTf7uarV3M5PjL7OZVH2y+pmgMLpULWdEiGq
	 IQstSRP9bpglJu3oaram6qQqsyG5r/A3U2Rokk68OGYFwwZ+Y+YgsOqW20pzodTA0L
	 EyM6SvoYB+/Cu6RMwNX4QJ5uP1FuP2upWgwEro4s2OL5H5FKy8zGwV0UC3WuNJ2A0E
	 I2rDwSmSJKEug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9690160AA0;
	Sat, 10 Oct 2026 09:24:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D02DD75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C275C400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYwIfv7p5t5z for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A03EF40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624266;
 b=LoGJLBhr/7she0lOEt9EruSld80xu+QHROvusbidil+LXJyv+Xgo+qA+y3GAG7UAs2ym
 WX+7KUB2KJwFAY3k3gQX4fmQMtgpvcxj96KSYRntOjIGFASK1KrQO+92YmsBigRaPtyKe
 baUVNa4uJenADVtjyTUIGtn9A0S+aHxVDg9uwrh89ErI8xLHyJvr6EdvAzStvCyZE+9l0
 DEF0A6hPiF2rKoXHErn8IxeTZULobHIttvQOyh8GQUkHO1o0SDWHzwblQK+ZkJsV/5eET
 Icd/+7wDpLNQvdju/Vd/Cb6CYhWAvPmNqHePmDyOX4Ii1CVBYXfuBhv9Emfl8BFGrkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624266;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=GFF5FxNMwgsGqlIJg7izAN49XHcEQ3sq3d1ntmIqJcc=;
 b=GmA+/Ubu5m/gbPiK435GLoGoYc79vD8PyxFHGRvbDUUrlHvGN7v/7prscD3xG0nl6svS
 plR0uf/HI7DUPgfUsjzPFjmWa7QI6twNzLvFWl9uq+4gUVTHsiJftf2W5DxLBshpI0dl5
 VezdJeLJIH/1SJ2nlg6PrAk3JmQ1Y+qeSkLd8onJFDnfUNydVtdFZaFn5r1HXLMPVl68t
 EPxyuLzUWIPuf5Ov8QetNbcg5ZSpZ4swS3k2X9yPHz0ZNAkTen7XnMZnqseQ6leVwpb9L
 fbSW+BBj3wYG/cWK6WylJ9Yrnr6XzFgfK20T4LfcbxoG8Hi6FC9WtoCPMjFBB+ajLgg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fykgIzhs; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A03EF40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:25 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso6999455e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624263; x=1792229063;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GFF5FxNMwgsGqlIJg7izAN49XHcEQ3sq3d1ntmIqJcc=;
 b=k692TanoE1mO2FKenLIFZcxBbv8WwklPd51bzZtjPM8jlLNnJZvpwaG5g1WwyIL9Ud
 Usm8fjXUMHso1tFFhQ3PrGFCsc0WhgWGjgBn9NwfALlOTZ8FxNx7Efy1OpHF/ZMZrzZ7
 QLjwj1wO3Xvj8zWVYit2Ofwd2Q7aBLxCXBPV8qq6Q8s9jHMR3eJt9ffZf/i+XROWAH0f
 sGwjZcSmVbJ+HMduYDe6l5KfzFDvDZQmYGCOHIxok7Ekfn8dyWED746Otr9TgYVVk1gN
 gLgAjOdCj0cVOLTbA1X57pzw//cPg0eZ1U79niOV6YSMEhWF1HkXsA5CMtg3xr6oDqrr
 F+TA==
X-Forwarded-Encrypted: i=1;
 AKwUvByzfcR8uBG9qqb1YPhB8Ko3radmWANq/qwzDwAYPITgQoJqwVst0e0EE4nQLSbWcGMCOJIxHl8AvDg=@buildroot.org
X-Gm-Message-State: AFq9FYK/VgMO3klKxeKh44VR+yzFnPlNtunrA0JE3sfklezGmaf18Tk9
 3f7ABGdzXUa1/QbDnouEtkOy5KWzFmXG+LWM3EDYhykolgzzL4w3TihP6UaCEB9sqpU=
X-Gm-Gg: AYBFou2O0iS2nOTnqju1g0D4m5vc/whhe03HwNKCY4SjAsvsRoXnF/cmwPeqvkWYVYF
 n17PPyG8gm0dp7fnnzwWBgTVQKPSw7tBWKwbYppNeqkmob8gXVlU+yZwp5DKoWD4qaWC1ZhBubV
 21gT9jdjWAU8cp/hrrK97r5YFkX5Hmm6mjlNYLxxMxvZjsTmluoer0gzNEang+0PcZSw0pNhdgZ
 jU38OhGbKW8tSNh1cuAJxAOdDOMBeXighyX7tQBPVqG3396v9HJ6Uq6SwUXL7PR+rB9129ktZX5
 gcvFS1Ruhpca0+VA6EkdA83ZTMZaSSKV3JldCztu+hfzYgHfL98rnWLfxAcImckw2/gzciFQDH5
 ETOQkuHTN3rkVR/IGhOpmfJQhWSrJ+jqm8WgED7Woi7iXiTVqIlGQmdixfJcTkpeb7/GRmb4mOB
 Tq2Ro5xV+kqLxiF+zmriIH+AP6Od4Iga0PHRwealaW8GpV+loGy9j6bY7+E2bI6Jq3uWymZ41Ln
 G/AdOdlKzN4aWSFbc0NFVSx1CJUsxC9/P0xtpiUCcmkksZBpS6TwY7B
X-Received: by 2002:a05:600c:3e0b:b0:49f:fbad:29ae with SMTP id
 5b1f17b1804b1-4a18e4b1311mr80407515e9.17.1791624263294; 
 Sat, 10 Oct 2026 02:24:23 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be8c601sm118236715e9.3.2026.10.10.02.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:24:22 -0700 (PDT)
To: =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:24:21 +0200
Message-ID: <20261010092422.140179-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003173657.1235590-2-contact@bearware.dk>
References: <20261003173657.1235590-2-contact@bearware.dk>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/openjdk: CPE ID for openjdk
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

SW4gcmVwbHkgb2Y6Cj4gVGhlIENQRSBJRCBvbiB2ZXJzaW9uIDIxLjAuMiBpbiBOVkQ6Cj4gaHR0
cHM6Ly9udmQubmlzdC5nb3YvcHJvZHVjdHMvY3BlL3NlYXJjaC9yZXN1bHRzP2tleXdvcmQ9Y3Bl
OjIuMzphOm9yYWNsZTpvcGVuamRrOjIxLjAuMjoqOio6KjoqOio6KjoqCj4gCj4gVGhlIGF1dG9t
YXRpY2FsbHkgZ2VuZXJhdGVkIE9QRU5KREtfQ1BFX0lEX1ZFUlNJT04gY2Fubm90IGJlIHVzZWQK
PiBiZWNhdXNlIE9QRU5KREtfVkVSU0lPTiBpbmNsdWRlcyBhICcrJywgZS5nLiAiMjEuMC4yKzEw
Ii4gTlZEIHdpbGwgbm90Cj4gYWNjZXB0IGEgdmVyc2lvbiBudW1iZXIgd2l0aCAnKycuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQmrDuHJuIERhbXN0ZWR0IFJhc211c3NlbiA8Y29udGFjdEBiZWFyd2Fy
ZS5kaz4KCkFwcGxpZWQgdG8gMjAyNS4wMi54ICYgMjAyNi4wOC54LiBUaGFua3MKCj4gLS0tCj4g
IHBhY2thZ2Uvb3Blbmpkay9vcGVuamRrLm1rIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuamRrL29wZW5q
ZGsubWsgYi9wYWNrYWdlL29wZW5qZGsvb3Blbmpkay5tawo+IGluZGV4IGZiYzg2MDAxOWMuLjk1
ZWZlMmJhMTkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9vcGVuamRrL29wZW5qZGsubWsKPiArKysg
Yi9wYWNrYWdlL29wZW5qZGsvb3Blbmpkay5tawo+IEBAIC0xNyw2ICsxNywxMyBAQCBPUEVOSkRL
X1ZFUlNJT05fTUFKT1IgPSAxNwo+ICBPUEVOSkRLX1ZFUlNJT05fTUlOT1IgPSAwLjE4Cj4gIE9Q
RU5KREtfVkVSU0lPTl9CVUlMRCA9IDgKPiAgZW5kaWYKPiArCj4gK09QRU5KREtfQ1BFX0lEX1ZF
TkRPUiA9IG9yYWNsZQo+ICtPUEVOSkRLX0NQRV9JRF9WQUxJRCA9IFlFUwo+ICsKPiArIyBPdmVy
cmlkZSBhdXRvbWF0aWMgQ1BFIElEIGJlY2F1c2UgJysnIGluICQoT1BFTkpES19WRVJTSU9OKSBp
cyBub3QgYWxwaGFudW1lcmljIG9yIC5fLQo+ICtPUEVOSkRLX0NQRV9JRF9WRVJTSU9OID0gJChP
UEVOSkRLX1ZFUlNJT05fTUFKT1IpLiQoT1BFTkpES19WRVJTSU9OX01JTk9SKQo+ICsKPiAgT1BF
TkpES19WRVJTSU9OID0gJChPUEVOSkRLX1ZFUlNJT05fTUFKT1IpLiQoT1BFTkpES19WRVJTSU9O
X01JTk9SKSskKE9QRU5KREtfVkVSU0lPTl9CVUlMRCkKPiAgT1BFTkpES19TSVRFID0gJChjYWxs
IGdpdGh1YixvcGVuamRrLGpkayQoT1BFTkpES19WRVJTSU9OX01BSk9SKXUsamRrLSQoT1BFTkpE
S19WRVJTSU9OKSkKPiAgCj4gLS0gCj4gMi41My4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
