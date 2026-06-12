Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478BDCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05E84613AB;
	Fri, 12 Jun 2026 11:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NHQVN9NGNSn; Fri, 12 Jun 2026 11:38:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02409613E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264318;
	bh=B3JUXBhoEh4WdMIVs5xrIBZ91FZ9ah0gvSxusdBuQVo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fa0ljejIkNpRHmSEZ6QXX/HrDbtcj7/Y6b8psIBt+MpCwwOTVvTS8RbL797FfItcS
	 38kh5gXzW56uSFd3MMTdDwQZO2uLSyxY3/FR5vLp1VKGE7BhPxHjoxaDMm3u5Juyky
	 yG4jAwJq4gMNrUghF/ncsGEALFGQqd1WbRoe4YEx4fjPCmYN1j9WdBPsNXWYg9BkK9
	 xjX3QyHX+W0jn4Ob7vlZnWghesiP5iRsWsvZ5ax/hL3Xm+EcHnTPwAK6W5b8xSTO0P
	 fkEJ5kKKqcE2sAFl4WrLBR9Kis7KQ2DYFnN+W5QsY9g/HIShUpSfz9Sv2REbhmvu0t
	 in5YzoJ4xCjuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02409613E2;
	Fri, 12 Jun 2026 11:38:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7629237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA06E8330B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqMCqZsaJ68s for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE83E832FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE83E832FF
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE83E832FF
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so7878465e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264314; x=1781869114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=re365miKH7CJ82Bh35HgLgpt5NHCR9wGyh0PlCuAuDA=;
 b=gxMF8qPmQ7DQRWC5naCgWkFrEAtsrBICtn4swORRciFkDraay9+sUbbnBAb9WfCQvf
 ZOD8P9pM+e8Vesa5ZSGQ5cLfszJu8tMginJzowWxgcGdNHQH6dcmkmfZRv3jxX5m668a
 S55iu+rRy+UZy3cxmHlOWy03/niyBKDFuySPXvY9XmIk3Xt4nIZci0iutebd+fx3AyS+
 sTeTrRvklGYlkr7e3LpJQYcadwZQPk0ZPnNTBlNg75abBVXAoy1Smtm1ObFr1+3hTwVU
 qRF0yTkyn4GDS9JVGdPkHpIRrZ+SgC9hkTVJq7SdWkCyMrNZIBYbDOgd+cEEo1gv8IbG
 v9fA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9fZxz2n0pvNGQ9yHouUVAOeH8hM8WJ0ivEl0RPCr/MYbGJqojopYRAprEbNE6dZuXRU2tcMEiIVCc=@buildroot.org
X-Gm-Message-State: AOJu0Yxb2+10rVRxpYBjuKTWowK/DQehzncg4DpXUMEpzqMpe25uI0rj
 ZZ5x+hfUx5F15JwQGAmu1y8zbXy6UcDkSES9kFAWCeZ7gydUpwdfGutSf8WuSPrRQwE=
X-Gm-Gg: Acq92OE0ky2i3nGuPAhq5zkeFa4PxjNm2upE1L5CfWVB7LcBIoAru8sRDxPk8IKXLrS
 rl/0BJsVU2uzVVZfQIcQg6f555s74pE8y2Z1seWGw6VFBZOO9Um9IfWXo6kgJTyKHD/PcTdIr7g
 NHzb3m2gQi7S0GO3H8kveLDSzttkARlaUrK5FojmJ/Ege854enIjVHa+ihhczHuhGM0BLz/itg0
 rIJwf7KCqJpmyCoT7iAy4C8Vy1EWAz5HRbBelJZn6KB5vGGjnrurKt1Uo3h0jOEvFmDMGw60qiu
 U22T9AlBEKmkBKDWOwDYCIdn9PBkw8IHulrGAxYYGnJUuKFr97AA61DbSg9LFc0nEzTh2XK5spm
 s7mAFMVZV4eqTxLoQpS6d+dJq8ebvFYiPElQWhjzVUWrodNvl2glFBzNYHJrD6vWvc1LzdNvZiJ
 OxVMZqD61K276+1Z8=
X-Received: by 2002:a05:600d:8498:20b0:48f:d612:3c59 with SMTP id
 5b1f17b1804b1-490ec4b5ab6mr22552135e9.9.1781264313690; 
 Fri, 12 Jun 2026 04:38:33 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c9057bsm162180005e9.5.2026.06.12.04.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:33 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:16 +0200
Message-ID: <20260612113832.253456-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604185341.2155576-1-bernd@kuhls.net>
References: <20260604185341.2155576-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264314; x=1781869114; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=re365miKH7CJ82Bh35HgLgpt5NHCR9wGyh0PlCuAuDA=;
 b=GiGjd9vpvXcyAWXo+iEYFjBVKuLMwLgRbVDA6/VgC/MpNHxP8IneF0SX8HOeSwa/iE
 WR0zSh2b2NqKh6RF5pQ8hMiiueMR7e9sQSJrbpwBFRORQK6q4uWXkqV2ChS3x7cQRj7o
 lXyXqcqZrWMQMOmCoHGhpREwgN1AT2kolwGoDJaL0QNBSTHk9K+d208PfbknwU0Iw1Ww
 Hg7MM7V4gsLn2b/IrPobF/8l5soCVlwLWEgKi0OpdHLVDQbHP5GSXREO6Ggp4MnXFEoH
 nyYEoYaBY1Q6gKQijRhqgSQzaeNYfhG3RIRDRk630yf9hZL/dissQM56GsN1hcZIcWJ1
 ldsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GiGjd9vp
Subject: Re: [Buildroot] [PATCH 1/1] package/libde265: security bump version
 to 1.1.1
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

SW4gcmVwbHkgb2Y6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3N0cnVrdHVyYWcvbGliZGUyNjUvcmVs
ZWFzZXMvdGFnL3YxLjEuMQo+IAo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgcHJvYmxl
bXM6Cj4gCj4gQ1ZFIFRCRCAoR0hTQS1jY2Z3LTI5eDctcnJ4MykKPiAtIFBpeGVsIGFjY2Vzc29y
IHNpZ25lZCBpbnRlZ2VyIG92ZXJmbG93IGNhdXNlcyBoZWFwIE9PQiByZWFkL3dyaXRlCj4gCj4g
Q1ZFIFRCRCAoR0hTQS1qMnFxLXgyeHEtZzl3cikKPiAtIFNBTyBzZXF1ZW50aWFsIGZpbHRlciBo
ZWFwIGJ1ZmZlciBvdmVyZmxvdyB2aWEgc2lnbmVkIGludGVnZXIgb3ZlcmZsb3cKPiAKPiBUaGlz
IHZlcnNpb24gYnVtcCBpbmNsdWRlcyB1cHN0cmVhbSBjb21taXQKPiBodHRwczovL2dpdGh1Yi5j
b20vc3RydWt0dXJhZy9saWJkZTI2NS9jb21taXQvOWRlZDM3YmRhNGU5ZmJjMjU3MGMwYmQ3MTBl
ZTQwNzYzNmJjNGYzNAo+IHdoaWNoIHVzZXMgY29uc3RleHByKCkgYW5kIGNhdXNlcyBhIGJ1aWxk
IGVycm9yIGNhdWdodCBieSB0aGUgR2l0bGFiCj4gcGlwZWxpbmVzIHdpdGggdGhlIGdjYy02LWJh
c2VkIGJvb3RsaW4tYWFyY2g2NC1nbGliYy1vbGQgZGVmY29uZmlnOgo+IAo+IC9idWlsZHMvYmt1
aGxzL2J1aWxkcm9vdC9ici10ZXN0LXBrZy9ib290bGluLWFhcmNoNjQtZ2xpYmMtb2xkL2J1aWxk
L2xpYmRlMjY1LTEuMS4xL2xpYmRlMjY1L2RlYmxvY2suY2M6NTk0OjE0Ogo+ICBlcnJvcjogZXhw
ZWN0ZWQg4oCYKOKAmSBiZWZvcmUg4oCYY29uc3RleHBy4oCZCj4gICAgICAgICAgICBpZiBjb25z
dGV4cHIgKHNpemVvZihwaXhlbF90KT09MSkgewo+IAo+IFRoZXJlZm9yZSB3ZSBuZWVkIHRvIHJh
aXNlIHRoZSBtaW5pbXVtIGdjYyB2ZXJzaW9uIGFjY29yZGluZyB0bwo+IGh0dHBzOi8vZ2NjLmdu
dS5vcmcvcHJvamVjdHMvY3h4LXN0YXR1cy5odG1sI2N4eDE3IHRvIGdjYyA3Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgpBcHBsaWVkIHRvIDIwMjUu
MDIueCAmIDIwMjYuMDIueC4gVGhhbmtzCgo+IC0tLQo+IEdpdGxhYiBwaXBlbGluZXMgcGFzc2Vk
Ogo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9ia3VobHMvYnVpbGRyb290Ly0vY29tbWl0cy9iOGFkNjIz
MTI5OWI4OWNkOGEwY2NhNjdiMDI2ODUxOGM1ZDA3NDJjCj4gCj4gIHBhY2thZ2UvbGliZGUyNjUv
Q29uZmlnLmluICAgICB8IDggKysrKysrLS0KPiAgcGFja2FnZS9saWJkZTI2NS9saWJkZTI2NS5o
YXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvbGliZGUyNjUvbGliZGUyNjUubWsgICB8IDIgKy0KPiAg
MyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGliZGUyNjUvQ29uZmlnLmluIGIvcGFja2FnZS9saWJkZTI2NS9D
b25maWcuaW4KPiBpbmRleCAyNDM2YmVmZjQxLi5jYTkxYjBhMjI2IDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbGliZGUyNjUvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9saWJkZTI2NS9Db25maWcu
aW4KPiBAQCAtMSw2ICsxLDcgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0xJQkRFMjY1Cj4gIAli
b29sICJsaWJkZTI2NSIKPiAgCWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQCj4gKwlk
ZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcgIyBDKysxNwo+ICAJZGVwZW5k
cyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTCj4gIAloZWxwCj4gIAkgIGxpYmRlMjY1IGlz
IGFuIG9wZW4gc291cmNlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBoLjI2NSB2aWRlbwo+IEBAIC04
LDUgKzksOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTElCREUyNjUKPiAgCj4gIAkgIGh0dHBzOi8v
Z2l0aHViLmNvbS9zdHJ1a3R1cmFnL2xpYmRlMjY1Cj4gIAo+IC1jb21tZW50ICJsaWJkZTI2NSBu
ZWVkcyBhIHRvb2xjaGFpbiB3LyB0aHJlYWRzLCBDKysiCj4gLQlkZXBlbmRzIG9uICFCUjJfVE9P
TENIQUlOX0hBU19USFJFQURTIHx8ICFCUjJfSU5TVEFMTF9MSUJTVERDUFAKPiArY29tbWVudCAi
bGliZGUyNjUgbmVlZHMgYSB0b29sY2hhaW4gdy8gdGhyZWFkcywgQysrLCBnY2MgPj0gNyIKPiAr
CWRlcGVuZHMgb24gXAo+ICsJCSFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8IFwKPiArCQkh
QlIyX0lOU1RBTExfTElCU1REQ1BQIHx8IFwKPiArCQkhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVB
U1RfNwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmRlMjY1L2xpYmRlMjY1Lmhhc2ggYi9wYWNr
YWdlL2xpYmRlMjY1L2xpYmRlMjY1Lmhhc2gKPiBpbmRleCA3MWEwMjIxMDg5Li4wMzg1MzY0ZTJl
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliZGUyNjUvbGliZGUyNjUuaGFzaAo+ICsrKyBiL3Bh
Y2thZ2UvbGliZGUyNjUvbGliZGUyNjUuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+IC0jIEZyb20g
aHR0cHM6Ly9naXRodWIuY29tL3N0cnVrdHVyYWcvbGliZGUyNjUvcmVsZWFzZXMvdGFnL3YxLjEu
MAo+IC1zaGEyNTYgIGFmYzE5ZGQyOGUyZmM1MjNkZTU5NTJiYmE1MjI0ZWUxZDI4ZTI4NmM3MjQz
NmQyODQzZGYxMjZjY2ExMTgxZmQgIGxpYmRlMjY1LTEuMS4wLnRhci5nego+ICsjIEZyb20gaHR0
cHM6Ly9naXRodWIuY29tL3N0cnVrdHVyYWcvbGliZGUyNjUvcmVsZWFzZXMvdGFnL3YxLjEuMQo+
ICtzaGEyNTYgIGZkNDhhOTI3ZTk0ZWQ3NGZjN2NlODgyOWQyMjJiOWQ4NTk5ZmNiZmU4YjY0NDhi
YTY2NzA1YmFiYzU2YWIyMTkgIGxpYmRlMjY1LTEuMS4xLnRhci5nego+ICAjIExvY2FsbHkgY29t
cHV0ZWQKPiAgc2hhMjU2ICAwMmNjMTU4NWEyMDY3Nzk5MmUwYmE1NzhmYTY5MjYzNWRjMTkzNzM1
ZjI2OTFkYzgxZGU5MjRiNTFjNGU4MDIwICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGliZGUyNjUvbGliZGUyNjUubWsgYi9wYWNrYWdlL2xpYmRlMjY1L2xpYmRlMjY1Lm1rCj4gaW5k
ZXggMmExMGRjZTZkMC4uODFmZmIzOTUwMSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmRlMjY1
L2xpYmRlMjY1Lm1rCj4gKysrIGIvcGFja2FnZS9saWJkZTI2NS9saWJkZTI2NS5tawo+IEBAIC00
LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1MSUJERTI2
NV9WRVJTSU9OID0gMS4xLjAKPiArTElCREUyNjVfVkVSU0lPTiA9IDEuMS4xCj4gIExJQkRFMjY1
X1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vc3RydWt0dXJhZy9saWJkZTI2NS9yZWxlYXNlcy9k
b3dubG9hZC92JChMSUJERTI2NV9WRVJTSU9OKQo+ICBMSUJERTI2NV9MSUNFTlNFID0gTEdQTC0z
LjArCj4gIExJQkRFMjY1X0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gLS0gCj4gMi40Ny4zCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
