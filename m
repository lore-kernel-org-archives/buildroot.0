Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92905C43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6578682BE5;
	Fri,  3 Jul 2026 14:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73cKSQLkV5WP; Fri,  3 Jul 2026 14:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C0FD820C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089193;
	bh=QEVOhbxAIBBRQ1qolFpReA3m8z93tW0j5z3JRXWPNrI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aSAOQyMMsaPfCBEIXwXLfUZjbpMLqL5OxvxGIThGcp9cQANZo8xbPl0BDX1Mb12Sp
	 x0jeY1JAaKmLM/mvcFOq4VBpXoZcP9mxFwyqWkG2TDuzitgPnN41w1cEgit4SlRNIe
	 JcMpFM1M6FT45mqsAuGAJKxyoVcAU4WSXMqMNOERIXezqvf6Ki6DpfhqBeld5Ac6Gl
	 kxiYxbjr4L0AzDO0hR6cmuH1YIHJ+1NIVcP5cO61I2/6gUnLnzi3xLNAvELr1ar+bG
	 kTJTqJ8d0mlTHNSIB/HcBCFSzNgKwH1k8XWeHpZcQjtedt55LgkIx8ljDNTTQk8f7V
	 4nAHPkSqA6B/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C0FD820C1;
	Fri,  3 Jul 2026 14:33:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2BF8363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4DF340556
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4wjfmS4bVxv for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A02B4008F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A02B4008F
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A02B4008F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47122683cf3so464841f8f.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089188; x=1783693988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=11ctl4eGinyO36Ft8s2DimeDerKORYfuvLcfanDElkU=;
 b=VDFTaS8RT+Qq06EKX4wbL69+s8QFjfCIFBaPR98PEEFmEcnV3yuyueUPupDF6S48fX
 Mh/Woc+KqjwjBGfbn+IGUzODrgc16dY5AynDV/F+h5/BJgQK6IQia1s7szAZIaixyHdI
 8+IgxG1NJbhyULXtI4rfo0te5lPRtunDkVbZw6Tw21ydu5AQx6MUkrm+fV5TC7gxqlJl
 WYKHLGyeQXwiX9H6NcBvfKcVYvSBGhWHUZ8EExV9JjOtuQMAx6wwDCe/eE58VhyMBJB8
 Xk5qKeqFhCiRCR59dQwRroqLBrvW9uyKwtJ19veKIu+HzoKs7P3YgEi5gNdg+609lziD
 Dg4Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RplRLOvMgBCDIJqyyIqA9wZHCqqyw0z7xGiKd0P0Dql0sk9grTLZ8Ce89+J3iWbZ57bQZRFUYebO+o=@buildroot.org
X-Gm-Message-State: AOJu0YyrzOO9UuOZChl/LGYVE6RHzaj7KaJ253pcwcrqwN2q/Irg+cqH
 S76IfrYNPM0q6zXkUak3Ec0dVhCkgoWsWkBdX/3iAJmS02Z1/Kff3Ck1DnQIE90JEy8=
X-Gm-Gg: AfdE7ck93pfBrpPBIFLS0gYOZ5P11Gc1Btb800/D7h1VzrSS66pGNHn7B79O3oSjhC8
 MWLo33VINRTWQBB5YQQ9pETq1OYWZjCdykWdlyAb0BP3tMZWmt1ZjUKVzAjGdyASTYsugGzSZZi
 ngiKVogzMwS34x8pn5p6lvyfVy8ItRRjuh5dEpiUXbr2pcIU5ltF+Tbwd0nCRykJ9VJ8k3CCt4M
 6YXTa69rkK+EpYFJIqdeFbCmfRbiCY27hmT5/Xk3xfIdjvnZdh+RsXrTsKVsKN9fvKyerRzCVSS
 eeqA8KHlDpSw5ps56YyA+jTmzH1J6oV9pS9FG114LqLxmctCCT4/a/KEdSjtrKlJ/7tgPL9zwiA
 ni8PO+ijK8KEpej2J4rwsEOE5ynwqoamjalbCsDxdpxHfEdR22hx1xPmk3pVnuTx09mFuzB82DP
 Ou/Oxa
X-Received: by 2002:a5d:6e65:0:b0:463:e582:a4a4 with SMTP id
 ffacd0b85a97d-47757f4c44cmr11945523f8f.10.1783089188404; 
 Fri, 03 Jul 2026 07:33:08 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477d766e0b4sm17726203f8f.0.2026.07.03.07.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:33:07 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:33:00 +0200
Message-ID: <20260703143307.275485-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260624204324.368967-1-bernd@kuhls.net>
References: <20260624204324.368967-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089188; x=1783693988; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11ctl4eGinyO36Ft8s2DimeDerKORYfuvLcfanDElkU=;
 b=Qw4Xh0F4YC7EtBBi6gOHgfFhAEkrwhhQwe43B4uZkwbJTmT7DM5A+B1ctGciABEe5r
 8kwZ6NRz4eiRwNXw10xg1Pwlc/2S3V804EqttQ8gwx3aH+JRCM07gPMDjtBx5yc5z7Kk
 CdBAqtiz1IHc3x8eOqFcC7uSU1K37Vbpgoek+LqSeLH+W5kMhg5fsT49ALGfyPzN2NtM
 k5HHrjqT5yDgV/sW7Q2fvL3Qu0oVPum1Gcbax/rNQqYBQYNE+cqGTQN+jgD72TAhmb1i
 DSOBz1Xu24bDUbf4wJ7U/+cdsFCXUxSFimvaSaZNk53/RPh0JXjQuZHQO+qEBeVG/5g7
 Uwcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qw4Xh0F4
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump
 version to 3.8.8
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

SW4gcmVwbHkgb2Y6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9y
ZWxlYXNlcy90YWcvdjMuOC44Cj4gIkxpYmFyY2hpdmUgMy44LjggaXMgYSBzZWN1cml0eSwgYnVn
Zml4IGFuZCBtaW5vciBmZWF0dXJlIHJlbGVhc2UuIgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5k
IEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgpBcHBsaWVkIHRvIDIwMjUuMDIueCAmIDIwMjYuMDUu
eC4gVGhhbmtzCgo+IC0tLQo+IEdpdGxhYiBwaXBlbGluZXMgcGFzc2VkOgo+IGh0dHBzOi8vZ2l0
bGFiLmNvbS9ia3VobHMvYnVpbGRyb290Ly0vY29tbWl0cy84YzY2NTBkMmQzZmU5ZGQzYWM4ZTk5
ODUzMTM3YzcxNGU5MzY1ZjFjCj4gCj4gd2l0aCB0aGUgdW5yZWxhdGVkIGV4Y2VwdGlvbiBvZiB1
Q2xpYmMtYmFzZWQgdG9vbGNoYWlucyB3aGljaCBhcmUgYnJva2VuCj4gCj4gZXh0cmFzL2xpYmMu
Yzo0OTA6MjU6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDEgb2Yg4oCYaWNvbnZfY2xvc2XigJkg
bWFrZXMKPiAgaW50ZWdlciBmcm9tIHBvaW50ZXIgd2l0aG91dCBhIGNhc3QgWy1XaW50LWNvbnZl
cnNpb25dCj4gCj4gd2hlbiBidWlsZGluZyB2bGMsIHRoaXMgd2FzIGZpeGVkIHdpdGggaW4gdUNs
aWJjIDEuMC41OCB3aXRoIGNvbW1pdAo+IGh0dHBzOi8vZ2l0aHViLmNvbS93YngtZ2l0aHViL3Vj
bGliYy1uZy9jb21taXQvMzI4ZTE0ZTU1ZjM1ZWUzMzNlNWExOWM1NzE3Y2I0YmJmNDI2YzNmMQo+
IAo+ICBwYWNrYWdlL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS5oYXNoIHwgNiArKystLS0KPiAgcGFj
a2FnZS9saWJhcmNoaXZlL2xpYmFyY2hpdmUubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGliYXJjaGl2ZS9saWJhcmNoaXZlLmhhc2ggYi9wYWNrYWdlL2xpYmFyY2hpdmUvbGliYXJj
aGl2ZS5oYXNoCj4gaW5kZXggNjY1MjU5ZjJiNi4uZGNjYjJjYzRhNyAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS5oYXNoCj4gKysrIGIvcGFja2FnZS9saWJhcmNo
aXZlL2xpYmFyY2hpdmUuaGFzaAo+IEBAIC0xLDYgKzEsNiBAQAo+IC0jIEZyb20gaHR0cHM6Ly9n
aXRodWIuY29tL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9yZWxlYXNlcy90YWcvdjMuOC43Cj4gKyMg
RnJvbSBodHRwczovL2dpdGh1Yi5jb20vbGliYXJjaGl2ZS9saWJhcmNoaXZlL3JlbGVhc2VzL3Rh
Zy92My44LjgKPiAgIyBBZnRlciB2ZXJpZnlpbmcgdGhlIHBncCBzaWduYXR1cmUgZnJvbToKPiAt
IyBodHRwczovL3d3dy5saWJhcmNoaXZlLmRlL2Rvd25sb2Fkcy9saWJhcmNoaXZlLTMuOC43LnRh
ci54ei5hc2MKPiAtc2hhMjU2ICBkM2E4YmE0NTdhZTI1YzI3Yzg0ZmQyODMwYTJlZmRjYzViMWQ0
MGJmNTg1ZDRlYjBkMzVmNDdlOTllNWQ0Nzc0ICBsaWJhcmNoaXZlLTMuOC43LnRhci54ego+ICsj
IGh0dHBzOi8vd3d3LmxpYmFyY2hpdmUuZGUvZG93bmxvYWRzL2xpYmFyY2hpdmUtMy44LjgudGFy
Lnh6LmFzYwo+ICtzaGEyNTYgIDM4NzNhODg4MDFkYTA2N2QwNTI4YTk4OWFmMDY4Nzc3MTA1Mjlk
NTBlZThmZTZmMzk3MGNiYjQzMDJlZmI5MTggIGxpYmFyY2hpdmUtMy44LjgudGFyLnh6Cj4gICMg
TG9jYWxseSBjb21wdXRlZDoKPiAgc2hhMjU2ICAzMGU1NTZiMzk1OWUzOTg1ZDY2ZWZlZmVjNWVh
YWM1MWQ0OTk1MDUzY2FhMWQzY2ZmZTZlYjkxNmYxNDZmMjI5ICBDT1BZSU5HCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGliYXJjaGl2ZS9saWJhcmNoaXZlLm1rIGIvcGFja2FnZS9saWJhcmNoaXZl
L2xpYmFyY2hpdmUubWsKPiBpbmRleCBmMTFmNWQ4ZjZmLi4yM2NiODJmN2I1IDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvbGliYXJjaGl2ZS9saWJhcmNoaXZlLm1rCj4gKysrIGIvcGFja2FnZS9saWJh
cmNoaXZlL2xpYmFyY2hpdmUubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+ICAKPiAtTElCQVJDSElWRV9WRVJTSU9OID0gMy44LjcKPiArTElCQVJD
SElWRV9WRVJTSU9OID0gMy44LjgKPiAgTElCQVJDSElWRV9TT1VSQ0UgPSBsaWJhcmNoaXZlLSQo
TElCQVJDSElWRV9WRVJTSU9OKS50YXIueHoKPiAgTElCQVJDSElWRV9TSVRFID0gaHR0cHM6Ly93
d3cubGliYXJjaGl2ZS5kZS9kb3dubG9hZHMKPiAgTElCQVJDSElWRV9JTlNUQUxMX1NUQUdJTkcg
PSBZRVMKPiAtLSAKPiAyLjQ3LjMKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
