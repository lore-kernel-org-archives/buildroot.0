Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED34DC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5928407F2;
	Fri, 26 Jun 2026 14:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hj5yoxnxcz32; Fri, 26 Jun 2026 14:56:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D058741259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485815;
	bh=/60nxBfrR6Bj6ts+vhjtM/0Tk6uwC5pLc2lw3dwCtrI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LMIzjrIS0JX9TShyr/HGKFyWAwea7ue05MFCkDR/KsP+p/9ai+gZ9ia0RH6q+yGw5
	 Lv5iDx6ZS2Z6+f3NzmUTO2Et5SAAZUEnX79/SFlnAvnASuKHduTqnWt03u34WUaGvy
	 7gFIKYZFhl2rl9p8Di0wLjO9cXcQsBUjgGS+/QKqOSBfgqxb0fFL6f5JwpVnKk19SX
	 p7SyhY2o67Ne7k76CfNZeauj6y4n8aEIYyMD3B911oAH6e8i6j5RGRKMluooh4djLr
	 mAHIulH3pBOuWzFKYmxzq345WXxl7QZLW/6LZogNrt/V+phIj2ginxz7vBeQj8u9Ue
	 CM+BUq8MyMl+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D058741259;
	Fri, 26 Jun 2026 14:56:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B25D231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E518F40720
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwbVYe1E1hwP for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBA2840702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBA2840702
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBA2840702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:53 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-46e335379cbso667507f8f.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485812; x=1783090612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9uy7sNRFGsXdjFu++Owk2FVrEOveV31XmDVGCCtx4oE=;
 b=EawBhN5LNOAqHFfWbQlvIQqafl0YKX0IIBF9OP61clrxw+t4wV+IBnth7x2yEjxX/M
 5v2bWnDogFL2vUnA3XszsXgPPMiS7ZHW4wRWqUGum3V5cIgBeIiYyMYcpYta1Uqv+w4s
 d8UENLrXbvRtXOfWcDFGQW8A3dSd1QrPjwIHXHqBkhqUQJFTVTul1C9USqjhmC74Drl7
 ZHOXipnTdnaqtdGTSMvQx++BTOcDYsDe2JwCC+eSgEypKFr+SHBlSJm2iu9ELRp1mnEq
 eCXoqdelgGXFpklVTUzYInqAdnlP7UJ51SyA3Cz8ATHMiyqJPTUNsyI3yV/DnRK5wcs3
 XAgg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpl3o3NPaOsKlKoQjqoBmPoiHs4mDfN8a8Tgk/pfWsP5uI5rQMBLXICk0Qtb8EAuKbitJs6lT73BHI=@buildroot.org
X-Gm-Message-State: AOJu0YyLJ7wJ9HcwzU+0XwXqsfIjrSgZq9V6Izl7+eqTPC5SMk4OsDM3
 LMo+4GE/z7H5w5sk4Oau2VAK8ePAlM+ZcoqGy/dlaJeLgNmo8RhKTuxpXRx4mH3o9LE=
X-Gm-Gg: AfdE7cn+ekxaHKa0jh4eNX35rzSx8v/MGhp/qU0/n2LLzPMuMcPA4G7u+sLrqlfVQ7a
 +5sLoovRKyzF79iQj+O1tjEFdgmfNiPlAE7UkXQAYrCiHnj4K/RAltf7pQkUWr/fz8TFouqgTxe
 KvSY4gbk8+nRr1YS02rDGsXbZQL9KeKnoRp7DNMC/Ms/772iFkjLizfLl3cpU66ZfMelo4E882w
 IwYdOvx1l0FpO3jTBSgULY0RWkRzKLQVTzhGu/ibv/wkK6QqvugF4L6mZ2qHHI3VT+dH4QBwP7g
 LrzS9CUJMspQhWgD19fzyaRVb9HLZrzkbv+7xpeicCnNK6XBqQxUGi/ej0XvN0XfpQ2+m3duB1r
 fcHKIzgRYym9ivZ3uVTFpkQfdXq+kJfTWxgDrIhdmpseQ56UIPZDtui05xdCAT9MvlkLKHgdT3z
 FjYFDI
X-Received: by 2002:a05:6000:2608:b0:46f:620f:e5e0 with SMTP id
 ffacd0b85a97d-46f620fe75cmr3514476f8f.31.1782485811913; 
 Fri, 26 Jun 2026 07:56:51 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46f9db29a94sm2644176f8f.22.2026.06.26.07.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:51 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:28 +0200
Message-ID: <20260626145651.345343-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619090027.3145553-1-peter@korsgaard.com>
References: <20260619090027.3145553-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485812; x=1783090612; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9uy7sNRFGsXdjFu++Owk2FVrEOveV31XmDVGCCtx4oE=;
 b=c9x0nFlgGbBrRSb6h36tJEy8VL27hEy8nthLJ/K7Fvh7/FEjbfp2h0SViIPesKcUW2
 jUq8JSLc/yAmYXsakmEM2TuU9VzOMfa+1pWfgFq93gXxw1BGVUHgrJ/K5WfbAD9jWIhS
 9TX7CPj2BGQyh+qptWln1hCPNqhJBaus8fV61LZONToJNaM+93dLcMn4Vn8tYrQbZLSO
 pYdmWMOVNcCOIsKP4d2cHDbRQ+Izm+GgQ3Yypw0I5VRjx9xf9vYlhPhRkC5wpuderwwU
 H+sDQQvjs7U/asYpSAkA05r6LWFpaSKnRAVrXUHbkcG7wvrf+3P1U5+65ge9UCpC6Onu
 LS4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=c9x0nFlg
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: fixup scp-style
 git sites
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

SW4gcmVwbHkgb2Y6Cj4gQ29tbWl0IGU4YzU0ZmZiM2QgKCJ1dGlscy9nZW5lcmF0ZS1jeWNsb25l
ZHg6IGdlbmVyYXRlIHZjcwo+IGV4dGVybmFsUmVmZXJlbmNlcyBmb3Igc291cmNlIHJlcG9zIikg
YWRkZWQgZXh0ZXJuYWxSZWZlcmVuY2VzIHRvIHRoZSBzb3VyY2UKPiBjb2RlIG9mIHBhY2thZ2Vz
Lgo+IAo+IFRoaXMgdW5mb3J0dW5hdGVseSBjYXVzZXMgaXNzdWVzIHdpdGggcGFja2FnZXMgKGlu
IGJyMi1leHRlcm5hbCkgZmV0Y2hpbmcKPiBmcm9tIGdpdCB1c2luZyB0aGUgc2NwLWxpa2Ugc3lu
dGF4LCBFLkcuOgo+IAo+ICBGT09fU0lURV9NRVRIT0QgPSBnaXQKPiAgRk9PX1NJVEUgPSBnaXRA
Z2l0aHViLmNvbTo8cHJvamVjdD4vPHJlcG8+LmdpdAo+IAo+IFdoaWNoIGVuZHMgdXAgaW4gdGhl
IFNCT00gYXM6Cj4gCj4gWwo+ICAgewo+ICAgICAidHlwZSI6ICJ2Y3MiLAo+ICAgICAidXJsIjog
ImdpdEBnaXRodWIuY29tOjxwcm9qZWN0Pi88cmVwbz4uZ2l0IiwKPiAgICAgImNvbW1lbnQiOiAi
Z2l0IHJlcG9zaXRvcnkiCj4gICB9Cj4gXQo+IAo+IFRoaXMgKGNvcnJlY3RseSkgY2F1c2VzIERl
cGVuZGVuY3kgdHJhY2sgdG8gcmVqZWN0IHRoZSBTQk9NIGltcG9ydCB3aXRoOgo+IAo+IHsKPiAg
ICJzdGF0dXMiOiA0MDAsCj4gICAidGl0bGUiOiAiVGhlIHVwbG9hZGVkIEJPTSBpcyBpbnZhbGlk
IiwKPiAgICJkZXRhaWwiOiAiU2NoZW1hIHZhbGlkYXRpb24gZmFpbGVkIiwKPiAgICJlcnJvcnMi
OiBbCj4gICAgICIkLmNvbXBvbmVudHNbMl0uZXh0ZXJuYWxSZWZlcmVuY2VzWzBdLnVybDogZG9l
cyBub3QgbWF0Y2ggdGhlIGlyaS1yZWZlcmVuY2UgcGF0dGVybiBtdXN0IGJlIGEgdmFsaWQgUkZD
IDM5ODcgSVJJLXJlZmVyZW5jZSIsCj4gICAgICIkLmNvbXBvbmVudHNbMl0uZXh0ZXJuYWxSZWZl
cmVuY2VzWzBdLnVybDogZG9lcyBub3QgbWF0Y2ggdGhlIGlyaS1yZWZlcmVuY2UgcGF0dGVybiBt
dXN0IGJlIGEgdmFsaWQgUkZDIDM5ODcgSVJJLXJlZmVyZW5jZSIsCj4gICAgICIkLmNvbXBvbmVu
dHNbMl0uZXh0ZXJuYWxSZWZlcmVuY2VzWzBdLnVybDogZG9lcyBub3QgbWF0Y2ggdGhlIHJlZ2V4
IHBhdHRlcm4gXnVybjpjZHg6WzAtOWEtZl17OH0tWzAtOWEtZl17NH0tWzAtOWEtZl17NH0tWzAt
OWEtZl17NH0tWzAtOWEtZl17MTJ9L1sxLTldWzAtOV0qJCIsCj4gICAgXQo+IH0KPiAKPiBUaGUg
Q3ljbG9uZURYIHNwZWMgaW5kZWVkIHJlcXVpcmVzIGEgVVJJOgo+IAo+IFRoZSBVUkkgKFVSTCBv
ciBVUk4pIHRvIHRoZSBleHRlcm5hbCByZWZlcmVuY2UuICBFeHRlcm5hbCByZWZlcmVuY2VzIGFy
ZQo+IFVSSXMgYW5kIHRoZXJlZm9yZSBjYW4gYWNjZXB0IGFueSBVUkwgc2NoZW1lIGluY2x1ZGlu
ZyBodHRwcyAoUkZDLTcyMzApLAo+IG1haWx0byAoUkZDLTIzNjgpLCB0ZWwgKFJGQy0zOTY2KSwg
YW5kIGRucyAoUkZDLTQ1MDEpCj4gCj4gaHR0cHM6Ly9jeWNsb25lZHgub3JnL2RvY3MvMS42L2pz
b24vI21ldGFkYXRhX3Rvb2xzX29uZU9mX2kwX2NvbXBvbmVudHNfaXRlbXNfZXh0ZXJuYWxSZWZl
cmVuY2VzX2l0ZW1zX3VybAo+IAo+IFRoZSB1c2VyQGhvc3Q6cHJvamVjdC9yZXBvLmdpdCBpcyBh
IGdpdC1zcGVjaWZpYyBzaG9ydGhhbmQgZm9yIGEgZ2l0LW92ZXItc3NoIFVSTC4gRnJvbSBtYW4g
Z2l0LWNsb25lOgo+IAo+ICBHaXQgc3VwcG9ydHMgc3NoLCBnaXQsIGh0dHAsIGFuZCBodHRwcyBw
cm90b2NvbHMgKGluIGFkZGl0aW9uLCBmdHAgYW5kIGZ0cHMKPiAgY2FuIGJlIHVzZWQgZm9yIGZl
dGNoaW5nLCBidXQgdGhpcyBpcyBpbmVmZmljaWVudCBhbmQgZGVwcmVjYXRlZDsgZG8gbm90IHVz
ZQo+ICB0aGVtKS4KPiAKPiAgVGhlIG5hdGl2ZSB0cmFuc3BvcnQgKGkuZS4gIGdpdDovLyBVUkwp
IGRvZXMgbm8gYXV0aGVudGljYXRpb24gYW5kIHNob3VsZAo+ICBiZSB1c2VkIHdpdGggY2F1dGlv
biBvbiB1bnNlY3VyZWQgbmV0d29ya3MuCj4gCj4gIFRoZSBmb2xsb3dpbmcgc3ludGF4ZXMgbWF5
IGJlIHVzZWQgd2l0aCB0aGVtOgo+IAo+ICDigKIgICBzc2g6Ly9bdXNlckBdaG9zdC54els6cG9y
dF0vcGF0aC90by9yZXBvLmdpdC8KPiAg4oCiICAgZ2l0Oi8vaG9zdC54els6cG9ydF0vcGF0aC90
by9yZXBvLmdpdC8KPiAg4oCiICAgaHR0cFtzXTovL2hvc3QueHpbOnBvcnRdL3BhdGgvdG8vcmVw
by5naXQvCj4gIOKAoiAgIGZ0cFtzXTovL2hvc3QueHpbOnBvcnRdL3BhdGgvdG8vcmVwby5naXQv
Cj4gCj4gIEFuIGFsdGVybmF0aXZlIHNjcC1saWtlIHN5bnRheCBtYXkgYWxzbyBiZSB1c2VkIHdp
dGggdGhlIHNzaCBwcm90b2NvbDoKPiAKPiAg4oCiICAgW3VzZXJAXWhvc3QueHo6cGF0aC90by9y
ZXBvLmdpdC8KPiAKPiBTbyBjb252ZXJ0IHRoZSBzY3AtbGlrZSBzeW50YXggdG8gc3NoOi8vIFVS
THMgaW4gcGFyc2VfdXJpcygpIGZvciBzcGVjCj4gY29tcGxpYW5jZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CgpBcHBsaWVkIHRvIDIw
MjUuMDIueCAmIDIwMjYuMDUueC4gVGhhbmtzCgo+IC0tLQo+ICB1dGlscy9nZW5lcmF0ZS1jeWNs
b25lZHggfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL3V0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeCBiL3V0aWxzL2dlbmVyYXRlLWN5
Y2xvbmVkeAo+IGluZGV4IGJhZGUwMThjZDQuLmRmMTJlZTg0YzAgMTAwNzU1Cj4gLS0tIGEvdXRp
bHMvZ2VuZXJhdGUtY3ljbG9uZWR4Cj4gKysrIGIvdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4Cj4g
QEAgLTI4MCw2ICsyODAsMTIgQEAgZGVmIHBhcnNlX3VyaXModXJpczogbGlzdFtzdHJdKSAtPiBJ
dGVyYXRvclt0dXBsZVtsaXN0W3N0cl0sIHN0cl1dOgo+ICAgICAgICAgIHNjaGVtZSwgXywgc3Ry
aXBwZWRfdXJpID0gdXJpLnBhcnRpdGlvbigiKyIpCj4gICAgICAgICAgaWYgc3RyaXBwZWRfdXJp
Ogo+ICAgICAgICAgICAgICBwYXJzZWQgPSB1cmxsaWIucGFyc2UudXJscGFyc2Uoc3RyaXBwZWRf
dXJpKQo+ICsKPiArICAgICAgICAgICAgIyBjb252ZXJ0IHNjcC1zdHlsZSBob3N0OnBhdGggc2l0
ZSB0byBzc2g6Ly8gdXJpCj4gKyAgICAgICAgICAgIGlmIHNjaGVtZSA9PSAiZ2l0IiBhbmQgbm90
IHBhcnNlZC5zY2hlbWU6Cj4gKyAgICAgICAgICAgICAgICBob3N0LCBfLCBwYXRoID0gc3RyaXBw
ZWRfdXJpLnBhcnRpdGlvbigiOiIpCj4gKyAgICAgICAgICAgICAgICBzdHJpcHBlZF91cmkgPSAi
c3NoOi8vIiArIGhvc3QgKyAiLyIgKyBwYXRoCj4gKwo+ICAgICAgICAgICAgICBpZiBwYXJzZWQu
aG9zdG5hbWUgIT0gInNvdXJjZXMuYnVpbGRyb290Lm5ldCI6Cj4gICAgICAgICAgICAgICAgICB5
aWVsZCBzY2hlbWUuc3BsaXQoInwiKSwgc3RyaXBwZWRfdXJpCj4gIAo+IC0tIAo+IDIuNDcuMwo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
