Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F241C4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 371396089A;
	Tue, 21 Jul 2026 20:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzNZZi5LwUPi; Tue, 21 Jul 2026 20:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E40D6089B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784667212;
	bh=8BSP4Wjpm3LiFdtwb5539usq00hZdeqSXQlNXPN2vSU=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=bT24FGs4FvHqD2Fk9KI37i1TkS3szGjDogZRKU+Ik9XdbSgfYsaBbxbta5b9Uh1qi
	 wIpOj0hxmdf4UjvVrp50MhfbGW/7lUYK8skTAytB7bwRTBxaYCX1AgDePJNwBEnlYo
	 F/CqK/Zx4NNK8p7kdZVtpZnf2fnS52+qUwWar4MSiskNPOtKPoE73bE0cPF+ag4cKH
	 QpkBgigibZaRGQPtVVxO+gvishinnrXPTMIponJiLR79xENc+BFcCpiyJ6JemtP+Lb
	 pdGKk11uiP+DRymgcrB/IxcrnWzNwj0TOZWe145gt0Ie1S4aq9wLLTmSMY4oM4nDkk
	 bfg/+8wCmxc0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E40D6089B;
	Tue, 21 Jul 2026 20:53:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBA67109C
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1AB080E91
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tz0alv31eEqc for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:53:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FFDB80C58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FFDB80C58
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FFDB80C58
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:53:29 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4956242332dso20185075e9.2
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 13:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784667207; x=1785272007;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:reply-to:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LQCLCLA9q3ORsqWPJmiqKuWuSNveRZXyr2CEAM4l44c=;
 b=ZCt+Jy4kZfStYD+Pz0KUI4qDAdQVsxVj7npYo39VQVtcTN54Odfy68xqwoKqKkpLwJ
 wZqJGmW94zIQutWXXHyo06GAgfrloNRUn2Dsnhz9Kn8lTMWwJ2LdvGxMCckCt0oodU2O
 7KqP1lVNUAANGtZ71QwbXrotGKo/OG8I98FmBqunyj0GwNjuQRrAm53oUZY+Gi67647N
 SacgYKFfYhHJbbQZcHJ6zDJ6sFpy4yRxFTyds6XQRyO9bjCmf2pIaW17Uv7rxEf/FXz3
 weQlFxHtSIigLYYZfsWWs2kplSQqnAx5AdHDjQY6Il1Bgc9ceEdmBPgc+VZ/ISj91jiP
 RhnQ==
X-Gm-Message-State: AOJu0Yz+bpVs3TpUecJXemEbZlPDlitbdSAnjsunmrq9md8a/Ys7K7oD
 9oj9cROui7d87ncx5zUfx6METGe8kSXGOINJ4xb+RLiwiOPFlHFE3KCw
X-Gm-Gg: AfdE7cktxeLFrWxrqHBuTQWsFwhM/HuEPy9IhXA5BS4ErCenSsYxZSdfi+Q7giiXxtN
 FbFjuyOYM9jhAsYgyfusfDMoEtJGtvM4qCzznU9Iu1DDYfEksz4MnWwA13ru0QwXg8amUnuiyKB
 wmP+s6TFVT7mCci0wNEL9aH8odVVRomE+//+QGQnILHj01h2wxFcMwHYfxlOA8WcAlC/ez2pCRr
 awSAnhbKhazchQFRkReyav9OmmfsVgQJGTGRLPnr3jbB8qXxusqrCtWdqT2kn0BlQrovJHYJytv
 LgSX4qA409ur0F+SZ4jPIoUMPudnApnWxkFIH31S/szPdvtjDtwBMLrIsMdCFVmkukIrS3Gbds3
 +kQOn4uKw3s9oEHmx95lpsNOcebhMTwK50pFP5fFOq4+EH/PYqDhIx8H7+tdpR8cHGcJPuyymRC
 KjbQOV9WzUNC9zCuVfJ5APncm4300MIG6zPelWzNQ=
X-Received: by 2002:a05:600c:138f:b0:495:4a34:16d9 with SMTP id
 5b1f17b1804b1-4954a50ea3bmr245256755e9.31.1784667207131; 
 Tue, 21 Jul 2026 13:53:27 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b4e8885sm2038665e9.0.2026.07.21.13.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 13:53:26 -0700 (PDT)
Date: Tue, 21 Jul 2026 22:53:21 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20260721205321.GC23326@pevik>
References: <20260721125337.2537436-1-dario.binacchi@amarulasolutions.com>
 <20260721125337.2537436-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260721125337.2537436-3-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784667207; x=1785272007; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:reply-to:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LQCLCLA9q3ORsqWPJmiqKuWuSNveRZXyr2CEAM4l44c=;
 b=UZketEGOshNdkVNziFIevVkC8R9vbIIsAGReAM37YhbAwL3m5Ij8ajc5x9dVTz6gE7
 Up2tZ0gEOYpplCAx61OcaXNMKxk4Y+9UST0WtNWrFntXpwcLkpsv8mReDI14eTQqd9Ve
 vz0U4ckjsPtmv93UNllAirAPJdO/3f8l+inkLyjon+y4t/Cb5YZTaGRh3zd0EZXpYrSN
 Jgznzyvv9xVhyjUDN9OkHP1axSHeUYsgEQxgxhrMTmtf62vOaHGG533EK4HKu5oBwE7j
 9uORb/+xOa2rRcrd3Dwx/lCgxxXH5dUDwPivYUUjjUiZFdsydUZDa6DgS3VcB+Du1li+
 MKfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UZketEGO
Subject: Re: [Buildroot] [PATCH v4 3/3] package/drogon: new package
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Chen Pei <cp0613@linux.alibaba.com>, Gao Xiang <hsiangkao@aol.com>,
 Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>,
 Bernd Kuhls <bernd@kuhls.net>, Alistair Francis <alistair@alistair23.me>,
 =?iso-8859-2?Q?Jos=E9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Brandon Maier <brandon.maier@collins.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgo+IERyb2dvbiBpcyBhIEMrKzE3LzIwIGJhc2VkIEhUVFAgYXBwbGljYXRpb24g
ZnJhbWV3b3JrLiBJdCBjYW4gYmUgdXNlZCB0bwo+IGVhc2lseSBidWlsZCB2YXJpb3VzIHR5cGVz
IG9mIHdlYiBhcHBsaWNhdGlvbiBzZXJ2ZXIgcHJvZ3JhbXMgdXNpbmcgQysrLgoKPiBQcm9qZWN0
IHBhZ2U6IGh0dHBzOi8vZ2l0aHViLmNvbS9kcm9nb25mcmFtZXdvcmsvZHJvZ29uCgouLi4KPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9kcm9nb24vMDAwMS1GaXgtRVBPTExSREhVUC1QT0xMUkRIVVAt
bWlzbWF0Y2gtb24tTGludXgtU1BBUkMtU1BBLnBhdGNoIGIvcGFja2FnZS9kcm9nb24vMDAwMS1G
aXgtRVBPTExSREhVUC1QT0xMUkRIVVAtbWlzbWF0Y2gtb24tTGludXgtU1BBUkMtU1BBLnBhdGNo
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjdhOWZhYjM4OWZl
Ywo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2Ryb2dvbi8wMDAxLUZpeC1FUE9MTFJE
SFVQLVBPTExSREhVUC1taXNtYXRjaC1vbi1MaW51eC1TUEFSQy1TUEEucGF0Y2gKPiBAQCAtMCww
ICsxLDkzIEBACj4gK0Zyb20gOWVjZmI5NjVlNmVhMDI1ODM4NzRlNTM0Zjg5MzZlYmI0M2E5ZGIy
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogRGFyaW8gQmluYWNjaGkgPGRhcmlv
LmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ICtEYXRlOiBNb24sIDIwIEp1bCAyMDI2
IDE2OjE2OjIyICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gRml4IEVQT0xMUkRIVVAvUE9MTFJE
SFVQIG1pc21hdGNoIG9uIExpbnV4IFNQQVJDL1NQQVJDNjQKPiArTUlNRS1WZXJzaW9uOiAxLjAK
PiArQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gK0NvbnRlbnQtVHJh
bnNmZXItRW5jb2Rpbmc6IDhiaXQKPiArCj4gK0ZpeCBhIGJ1aWxkIGZhaWx1cmUgcmVwb3J0ZWQg
YnkgQnVpbGRyb290IGF1dG9idWlsZCBmb3IgdGhlCj4gK2Jvb3RsaW4tc3BhcmM2NC1nbGliYyBj
b25maWd1cmF0aW9uOgo+ICsKPiArICBFcG9sbFBvbGxlci5jYzo0MToyNjogZXJyb3I6IHN0YXRp
YyBhc3NlcnRpb24gZmFpbGVkOgo+ICsgIEVQT0xMUkRIVVAgIT0gUE9MTFJESFVQCj4gKwo+ICtP
biBTUEFSQy9TUEFSQzY0LCBFUE9MTFJESFVQICgweDIwMDApIGFuZCBQT0xMUkRIVVAgKDB4MDgw
MCkgYXJlCj4gK2RpZmZlcmVudCBiaXRzLCBicmVha2luZyB0aGUgYXNzdW1wdGlvbiBlbHNld2hl
cmUgaW4gdGhpcyBmaWxlIHRoYXQKPiArZXBvbGwgYW5kIHBvbGwgZmxhZ3MgYXJlIGludGVyY2hh
bmdlYWJsZS4KPiArCj4gK0ludHJvZHVjZSBhIGNvbWJpbmVkIFJESFVQIHZhbHVlIGZvciB0aGlz
IGFyY2hpdGVjdHVyZSBhbmQgdHJhbnNsYXRlCj4gK2l0IGJlZm9yZSBlcG9sbF9jdGwoKSBhbmQg
YWZ0ZXIgZXBvbGxfd2FpdCgpLCBzaW5jZSByZXZlbnRzXyBpcyBsYXRlcgo+ICt0ZXN0ZWQgYWdh
aW5zdCBQT0xMUkRIVVAgaW4gQ2hhbm5lbDo6aGFuZGxlRXZlbnQoKSDigJQgb3RoZXJ3aXNlCj4g
K2hhbGYtY2xvc2UgZGV0ZWN0aW9uIHdvdWxkIHNpbGVudGx5IGJyZWFrIGF0IHJ1bnRpbWUuCj4g
Kwo+ICtUaGlzIHBhdGNoIGlzIGluc3BpcmVkIGJ5IHRoZSBlcXVpdmFsZW50IGZpeCBpbiBsaWdo
dHRwZDoKPiAraHR0cHM6Ly9yZWRtaW5lLmxpZ2h0dHBkLm5ldC9pc3N1ZXMvMzI1MQo+ICsKPiAr
U2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2FuLXRhby90cmFudG9y
L3B1bGwvNDA3CgpJJ20gbm90IHN1cmUgd2hhdCBpcyB0aGUgQnVpbGRyb290J3MgYXBwcm9hY2gg
Zm9yIGdpdCBzdWJtb2R1bGVzLgpBcyB5b3UgdXNlIHRhbGxiYXIgaXQgc2hvdWxkIGJlIG9rIGxp
a2UgdGhpcyAoaS5lLiBub3QgYWRkaW5nIHRyYW50b3IgYXMgYQpzZXBhcmF0ZSBwYWNrYWdlKS4g
QWxzbyBvdGhlciB3b3VsZCBwcm9iYWJseSByYWlzZSBhIGNvbmNlcm4pLgoKT3RoZXJ3aXNlIExH
VE0uClJldmlld2VkLWJ5OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KCktpbmQg
cmVnYXJkcywKUGV0cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
