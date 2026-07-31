Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C251C5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD90060B7C;
	Fri, 31 Jul 2026 12:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZHaizWjArNd; Fri, 31 Jul 2026 12:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C697560B94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500531;
	bh=fcQOMyuqs9e/knDPsdFKLHUW2b/Ti4bMAWXP1C+KE94=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XRG1HLK656UojleyIgvSccondadn/Lq85MhqHSsRFJwMv3VC+Zeg2a3st+b2Fw/DG
	 R5RZPaHwCHS53/naz0v2dKqM3G4pe0DpXAHoG19ETMPluAOf1uv8qYjketYElQZheg
	 HdEzV3ZCKV+1jGz0ypGpwK5+XzYeYAt11u0On5mxui7NueW/2nWe4L+dNX/rEqnlwJ
	 LGRA4FbEURL7MYbZ4fgYFqum3RzXYldGzE10iTbXVBWrS3qEJ6a/cdoKewRMu7sbSA
	 Vuy5PGGy09xPH1FUT7wdPjl/gJc603h0RnAjm4uyYNi07Yar1eUYx9W3CvFoCN6z0x
	 UpYtD78yNBAgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C697560B94;
	Fri, 31 Jul 2026 12:22:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A43A636E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96A8360B92
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxhbtZvy0CP1 for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:22:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9877E60B52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9877E60B52
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9877E60B52
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47f93b2fe4cso584324f8f.0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500526; x=1786105326;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MOioVn3nbSxuMu+mcJFt4SPc4zkVh19pLNXD7hQHaZ4=;
 b=EGJo2eUx78LKhONfbW8nqfsSauyaJP/4tkhInF5HWhiAraomxkgPs/TI14SHNpr0aT
 TUXvYRdbIByBoEn2kuehDFfT8IXBkr4GEeXFqtuOSt9pk5ylP1dw25wKpy9nyZOA52rp
 bOtiwXkoaJ/QUxOvvELNdkYOJteu9ugF+WlQI0cDswqMllveBPvlYwr5J4pEdQa8dRII
 n/+02UtXoGtG9/z+65TYCMp5iOUcC/E/WeekXQOrCSFyc68mtI+rL0iQyi4pC83193xR
 9bL7yntAaVLxg7v7iMCPOQ1NtvwODVtMetVCXKZrQSs+mFa+UKpLU7h2N+BA9UjD1QuD
 2Hag==
X-Forwarded-Encrypted: i=1;
 AHgh+RqLh49fzLRy1uY1XI64mUtIPwIUVDwp3nxwix81on1xjDbHmzMZpImNVQdnDKJP2AJTx2CBWc/C8fk=@buildroot.org
X-Gm-Message-State: AOJu0Yxm+oeTRWwSWJVYbJwqZY8U38Mj0+Il4qTwJ3DlLYoHRkHGQGD8
 eO92TPS/pD5OTA288EifeCUf9FpgH0H74CGTczwdGQC4tvHdCmFBqFQp/BLkvz4VqVelSWhF0PS
 SrYzx
X-Gm-Gg: AR+sD11CCaQXpwzL3LF0B495uaijbMdMZ+kPaOEUwoxQLq23r+SIGcqUN13wiWdkVVj
 3CaAfWgCfNvWk+EIB1C9jTNDK/PozAzuizSh+dAfWAvZwigjh89k3s3M4FDzFcUH6yzKSR9wqcr
 kTypryN97Y5X/5I5p9bjIICgpY75+I/E/cdkSjvgpj5lStqCQ0VTFmlIoYAnN1VJaLcgi/sCG1r
 vKB8KtJAnW4kmbSN4ge83r23r0eU9KqKTToFRtS1A+0rFr1YtD6Xnu6FRHxUhxfbALpro9emkoq
 bmeohP/5dmsN0BMY62HAx4iB0qAk6CwbzKvU9cJ+MqnCEd077PNOdFAzY8NM6xc9gkeFZCasWIM
 FFkIb6oA9KKRW3LRk+/w8ZNWMpSAuyRnQ766U3t2hm7a1VcrHJz4CX00F5ptUEj5rUEgsSNbTat
 ZhixXxB/fwJlCEB33rMMizsb+kWOefMS2Gi3LI6R/uBArI7mRxP/V28LXW1ZfnDNcdMVIkhppri
 0d/oYXuK3RhMy0pHMxEzw==
X-Received: by 2002:a05:6000:986:b0:47f:93fc:2d24 with SMTP id
 ffacd0b85a97d-47fd2b40e87mr3910704f8f.32.1785500526506; 
 Fri, 31 Jul 2026 05:22:06 -0700 (PDT)
Received: from arch (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd45a1abfsm3867562f8f.37.2026.07.31.05.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:22:06 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:22:05 +0200
Message-ID: <20260731122205.155827-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724172124.319019-1-bernd@kuhls.net>
References: <20260724172124.319019-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785500526; x=1786105326; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MOioVn3nbSxuMu+mcJFt4SPc4zkVh19pLNXD7hQHaZ4=;
 b=XhQhyq0Ldtnm62M0V28qs9lnixg5xAjlV/MTyXD4hWMfaMnWnu44eC4yHZj31SNLAe
 3qBb0kAswldJDis4dCg9TGRTdWrwKMaOzmsEByDJWR8WnHYqk/mg3ZnGrS+TdTJLU+w1
 mmpj7tWTjSHY9OGVrqZQqv8CuX0//VVMwxh6O0rsEcsbBdMrhW3Md+MnF/M+0OAViwDW
 JAu7Qz+xjnH1PN7RnEcTSmI4kYQKpb/aSZWFZzELcXk9yptObps7l6B4LxclkZjq4Ivo
 GLad+HlxkTNCO+KaoBxi6SiyucmA1KzWm6os7aJExQoe4hvVbWmdVQ6jxiofVf4q9Y3b
 Hcrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XhQhyq0L
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.23.1
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

SW4gcmVwbHkgb2Y6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3N0cnVrdHVyYWcvbGliaGVpZi9yZWxl
YXNlcy90YWcvdjEuMjMuMQo+IAo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgQ1ZFczoKPiAKPiBDVkUt
MjAyNi02MjI4OSAoR0hTQS1qYzhmLXAyM3AtNWhqZykKPiBJbnRlZ2VyIHVuZGVyZmxvdyBpbiBG
cmFjdGlvbiBjb25zdHJ1Y3RvciB2aWEgZG91YmxlIGNsYXAgdHJhbnNmb3JtCj4gYXBwbGljYXRp
b24KPiAKPiBDVkUtMjAyNi02MjI5MSAoR0hTQS14cHczLTlyaHctNDgyeCkKPiBIZWFwIG91dCBv
ZiBib3VuZHMgd3JpdGUgaW4gbGliaGVpZiB1bmNvbXByZXNzZWQgZW5jb2RlciB3aGVuIHdyaXRp
bmcKPiBpbWFnZXMgd2l0aCBtaXNtYXRjaGVkIGF1eGlsaWFyeSBhbHBoYSBkaW1lbnNpb25zCj4g
Cj4gQ1ZFLTIwMjYtNjIyOTIgKEdIU0EtNzNwNy1tN2dnLXcyanYpCj4gT3V0LW9mLWJvdW5kcyBy
ZWFkIGluIHVuY29tcHJlc3NlZCB1bmNpIHRpbGUgcmFuZ2Ugc2xpY2luZwo+IAo+IENWRS0yMDI2
LTYyMzc3IChHSFNBLTl3dzQtOXY0Ny1tN3BqKQo+IFJlYWNoYWJsZSBhc3NlcnRpb24gaW4gSGVp
ZkNvbnRleHQ6OmdldF90cmFjaygpIGFib3J0cyBvbiBhIHZhbGlkLWJ1dC0KPiBlbXB0eSBIRUlG
IHNlcXVlbmNlIGZpbGUKPiAKPiAoR0hTQS00NnJwLXBjcTItcnBtcikKPiBIZWFwIG91dC1vZi1i
b3VuZHMgd3JpdGUgaW4gdGhlIHVuY29tcHJlc3NlZCBlbmNvZGVyIGZvciBSUkdHQkIgaW1hZ2Vz
Cj4gd2l0aCBpbnRlcmxlYXZlZCBiaXQtZGVwdGgg4omkIDgKPiAKPiBTaWduZWQtb2ZmLWJ5OiBC
ZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoKQXBwbGllZCB0byAyMDI1LjAyLnggJiAyMDI2
LjA1LnguIFRoYW5rcwoKPiAtLS0KPiBHaXRsYWIgcGlwZWxpbmVzIHBhc3NlZDoKPiBodHRwczov
L2dpdGxhYi5jb20vYmt1aGxzL2J1aWxkcm9vdC8tL2NvbW1pdHMvYTNkOTAyOGFkMWE4MjRlNjJk
M2EwYTU3M2NlY2E3Yzc5YWRkZWViZAo+IAo+ICBwYWNrYWdlL2xpYmhlaWYvbGliaGVpZi5oYXNo
IHwgNCArKy0tCj4gIHBhY2thZ2UvbGliaGVpZi9saWJoZWlmLm1rICAgfCAyICstCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpYmhlaWYvbGliaGVpZi5oYXNoIGIvcGFja2FnZS9saWJoZWlmL2xpYmhl
aWYuaGFzaAo+IGluZGV4IDc4MDA1OWZhY2YuLmZmOGMwNWM3ZTQgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9saWJoZWlmL2xpYmhlaWYuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbGliaGVpZi9saWJoZWlm
Lmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9zdHJ1
a3R1cmFnL2xpYmhlaWYvcmVsZWFzZXMvdGFnL3YxLjIzLjAKPiAtc2hhMjU2ICA0YzkxODJiMTg4
OTc2MTcxODJlZWQxMmFiNWViOWY5ZDg1NWIzYWEzYTczNmQ2YmRiMzFhYmMwMzRlYzdkMzkzICBs
aWJoZWlmLTEuMjMuMC50YXIuZ3oKPiArIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9zdHJ1a3R1
cmFnL2xpYmhlaWYvcmVsZWFzZXMvdGFnL3YxLjIzLjEKPiArc2hhMjU2ICAwZGUwMzI3ZjYwZmNk
NDdkZTkwZDU2NTRjNmZlMTUyMjMyNzM4ZDYwZDg0ZmUwODRlYzNlMGYzNWUwM2IxNjZhICBsaWJo
ZWlmLTEuMjMuMS50YXIuZ3oKPiAgIyBMb2NhbGx5IGNvbXB1dGVkOgo+ICBzaGEyNTYgIGZhODFj
ZTY1MjMxNWIwMTMzNTlkNmU4ZTQ3NDQzMzVmMzFhNTBjN2MxOTI5MDcxNzZkMzYzMmY3OGEzYjQ1
OTYgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJoZWlmL2xpYmhlaWYubWsgYi9w
YWNrYWdlL2xpYmhlaWYvbGliaGVpZi5tawo+IGluZGV4IGJlOTdiMThiZDAuLjEyNGRiYTdjMjQg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJoZWlmL2xpYmhlaWYubWsKPiArKysgYi9wYWNrYWdl
L2xpYmhlaWYvbGliaGVpZi5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gIAo+IC1MSUJIRUlGX1ZFUlNJT04gPSAxLjIzLjAKPiArTElCSEVJRl9W
RVJTSU9OID0gMS4yMy4xCj4gIExJQkhFSUZfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9zdHJ1
a3R1cmFnL2xpYmhlaWYvcmVsZWFzZXMvZG93bmxvYWQvdiQoTElCSEVJRl9WRVJTSU9OKQo+ICBM
SUJIRUlGX0xJQ0VOU0UgPSBMR1BMLTMuMCsKPiAgTElCSEVJRl9MSUNFTlNFX0ZJTEVTID0gQ09Q
WUlORwo+IC0tIAo+IDIuNDcuMwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
