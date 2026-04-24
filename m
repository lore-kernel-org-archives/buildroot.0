Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555BAFED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2555A84E44;
	Fri, 24 Apr 2026 16:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3qQF-o6gSgU; Fri, 24 Apr 2026 16:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2C8384E37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048006;
	bh=hpkIWra2DNL11Hm7uyCse7ZBa0MLu5WHKrxAsR51h+g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ErF6PthpY6B6OhLBJRGxy2DKqIXQVMKVc+RiMMLHPYR2EUb+Dnoi40D5aQn3Cqdt5
	 6qn6zUgMWFQnP9wbU0hNH6vO6I0dzmaTyGprM8WokmCUQATAWLuboqHJgsdiz7nMlw
	 vpSNzLYsCRZ93BbNtO0K0DFjd4spVcrZngpo9RzY124Yddkb74I9Cxt4VTsqsovaDP
	 a6I44APVqQxGQdZzlGZ33uIZpbFtt8OBBv8/j95t2nPPqvKoNWXYc8xWY9CnIym7k4
	 ztLhk8ZjoI+QhrHmdpcdwVXzRFGgFYgY3aRO65WpRE/vygTP/gGQPbZCkghBS6BO4o
	 R84TRhd+JpCHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2C8384E37;
	Fri, 24 Apr 2026 16:26:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E16EF206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C402D4295F
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEyTvFmdOHdg for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:26:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE04D4295E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE04D4295E
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE04D4295E
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:42 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488b150559bso64238925e9.1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048001; x=1777652801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W2sCWZKZOInPuPG2xOdUaI4q+uGgrFkWB6H/AH2sPk4=;
 b=aA9QZKumlMmvPw7bcCIfSw3jOdtN9Grr8IhQ2H1z85EQei1Dt/jbAkqZQ9Fvbbyvgt
 QV+xDg3WsC2mrT42RudB4xj+hrWuwEpEmQfFbRejh8crthnvPHPCiFdpf70fp0wJ+w4T
 sHxRkzdEOPdbeKEjPoV/OpY3R6cCHG8IKpQv2/KsvSAKQD3qNIHBTx8tJvwadCbo9eCT
 /ykwSq0wqfnHfwxJc3ad7hdPAdLTr+6GCSgqVF5ssO1Z/S69pa6f41uqEi8TYVAxUJez
 hzfV+PF3+5+qych3LTbaHlBGa1T0OVHkt30QhiyfPq6k4XNr4FzeJ1qT5BKyzPWGmC6V
 cQ3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9cBiSDG33V3sy+MdWA6eizKS9QGSPmNANm2Uec4NsQw2+z8E/KJvnKf26Qmk2zMuU9pq+mVpGD2c4=@buildroot.org
X-Gm-Message-State: AOJu0YyyCOA33YW5h6/fQN1fwq82cR4lm/fV9NK2Me5zxrtjotsJg43X
 6abJb1d6kTNuaiaQkQsL3ZeFMT15Dijy/gzbld++0Ntxh6ZeWrYJHBxxe9n8P9wNg/M=
X-Gm-Gg: AeBDiesw8H82RjFMsKqZEGeWq7scMTZcNrsqxXZLu5MN4l9mCcUdUt9wDzeA0wfw+zl
 B5eREDnAQapq5ayHDxhKWEwAD2LawW345erRTYebwBJ5/GCrCmlPcyazYilxNaH72rCqidDkkRJ
 Yb9qyhlnIeAwxwZut5PxaiAmFW0cKAuMEXPqaN/3sonXTxeP8cjxeKmDNiV4jSq4HNUIb8+YMeK
 w3uYP27Y11D+CAYfgj2HWepsBBdU/BnnVWJPERTOeUybXFhhW24UBY/+bgh9CECqyH/sfuqjS44
 mc8dZ3zeP8xQyYMcmd3lsJJth4tqVobqSQfaMsRo3R20JsuCMkLoI4L00tSeb4K6mHg5ZvVv9PI
 L2YT88jBn4EogfdopYhjznuS61ZFQ9/coNqxuK458FVBve8nh1aWbVqKPBvZICds5gTcbylM3P6
 7aF5KSrb6z3ia+xwN8wjRDPXd9sg==
X-Received: by 2002:a05:600c:348b:b0:489:5022:39a4 with SMTP id
 5b1f17b1804b1-4895040c025mr319384585e9.9.1777048000715; 
 Fri, 24 Apr 2026 09:26:40 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-489fec8f7cbsm318728795e9.11.2026.04.24.09.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:26:40 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:26:38 +0200
Message-ID: <20260424162639.160966-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260417091800.2374733-1-titouan.christophe@mind.be>
References: <20260417091800.2374733-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048001; x=1777652801; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2sCWZKZOInPuPG2xOdUaI4q+uGgrFkWB6H/AH2sPk4=;
 b=cApwgaGv+206aGyef/YNsDD7Qp4VTNAHTddiBgJ4ytQ9c+dqRcXP/dlzXY9cK81pjl
 DIHj//iJGxUZKVaqFaxjoq1+eyuXV518qjYXfqd76uV/BZL3AjjO7Nmm0st9Nx06rQcy
 FqVcVenEf+7Oxs13vtoga/lwTeHpDAgeBXrclJin0u+hiz9wMm6M9Uq327XycYnMWCkN
 dcsnCqoIO/fMwY64uMf9apwdYJrxowWVOgj/w8ces+P5H3IJGrOfsby81qfGJmi58BCQ
 rs3SVMK+7joIPGDvEm2P82lFDfSfMixdPlWUi0RWrodn+KOH2DTP0Rhvg+biorUOdnXU
 nMcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cApwgaGv
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python3: security
 bump to v3.12.13
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

SW4gcmVwbHkgb2Y6Cj4gU2VlIHRoZSByZWxlYXNlIG5vdGVzOiBodHRwczovL3d3dy5weXRob24u
b3JnL2Rvd25sb2Fkcy9yZWxlYXNlL3B5dGhvbi0zMTIxMy8KPiAKPiBUaGlzIGZpeGVzIGEgaGFu
ZGZ1bCBvZiBidWdzIGFuZCB0aGUgZm9sbG93aW5nIHZ1bG5lcmFiaWxpdHk6Cj4gLSBDVkUtMjAy
NC02OTIzOgo+ICAgICBUaGVyZSBpcyBhIE1FRElVTSBzZXZlcml0eSB2dWxuZXJhYmlsaXR5IGFm
ZmVjdGluZyBDUHl0aG9uLiAgVGhlCj4gICAgIGVtYWlsIG1vZHVsZSBkaWRu4oCZdCBwcm9wZXJs
eSBxdW90ZSBuZXdsaW5lcyBmb3IgZW1haWwgaGVhZGVycyB3aGVuCj4gICAgIHNlcmlhbGl6aW5n
IGFuIGVtYWlsIG1lc3NhZ2UgYWxsb3dpbmcgZm9yIGhlYWRlciBpbmplY3Rpb24gd2hlbiBhbgo+
ICAgICBlbWFpbCAgaXMgc2VyaWFsaXplZC4KPiAgICAgaHR0cHM6Ly93d3cuY3ZlLm9yZy9DVkVS
ZWNvcmQ/aWQ9Q1ZFLTIwMjQtNjkyMwo+IAo+IFRoaXMgYWxzbyBpbmNsdWRlcyBhIG1pdGlnYXRp
b24gZm9yIGEgbGliZXhwYXQgdnVsbmVyYWJpbGl0eToKPiAtIENWRS0yMDI1LTU5Mzc1Ogo+ICAg
ICBsaWJleHBhdCBpbiBFeHBhdCBiZWZvcmUgMi43LjIgYWxsb3dzIGF0dGFja2VycyB0byB0cmln
Z2VyIGxhcmdlCj4gICAgIGR5bmFtaWMgbWVtb3J5IGFsbG9jYXRpb25zIHZpYSBhIHNtYWxsIGRv
Y3VtZW50IHRoYXQgaXMgc3VibWl0dGVkIGZvcgo+ICAgICBwYXJzaW5nLgo+ICAgICBodHRwczov
L3d3dy5jdmUub3JnL0NWRVJlY29yZD9pZD1DVkUtMjAyNS01OTM3NQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFRpdG91YW4gQ2hyaXN0b3BoZSA8dGl0b3Vhbi5jaHJpc3RvcGhlQG1pbmQuYmU+CgpBcHBs
aWVkIHRvIDIwMjUuMDIueC4gVGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL3B5dGhvbjMvcHl0aG9u
My5oYXNoIHwgNiArKystLS0KPiAgcGFja2FnZS9weXRob24zL3B5dGhvbjMubWsgICB8IDIgKy0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uMy9weXRob24zLmhhc2ggYi9wYWNrYWdlL3B5dGhv
bjMvcHl0aG9uMy5oYXNoCj4gaW5kZXggZWQwZDg3OWYxMS4uNWIxMGYyNGY3MCAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5oYXNoCj4gKysrIGIvcGFja2FnZS9weXRob24z
L3B5dGhvbjMuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+IC0jIEZyb20gaHR0cHM6Ly93d3cucHl0
aG9uLm9yZy9kb3dubG9hZHMvcmVsZWFzZS9weXRob24tMzEyMTEvCj4gLW1kNSAgMDRmZWIwMTMx
NmM3YmIxYjQ0ODAwMWFkYmM2M2RkMjMgIFB5dGhvbi0zLjEyLjEyLnRhci54ego+ICsjIEZyb20g
aHR0cHM6Ly93d3cucHl0aG9uLm9yZy9kb3dubG9hZHMvcmVsZWFzZS9weXRob24tMzEyMTMvCj4g
K21kNSAgYjY3ZGM1ZDU1YjI3Yzk4YTM2NjE1ZjdkMGRmYTZlNGMgIFB5dGhvbi0zLjEyLjEzLnRh
ci54ego+ICAjIExvY2FsbHkgY29tcHV0ZWQKPiAtc2hhMjU2ICBmYjg1YTEzNDE0YjAyOGM0OWJh
MThiYmQ1MjNjMmQwNTVhMzBiNTZiMThiOTJjZTQ1NGVhMmM1MWVkYzY1NmM0ICBQeXRob24tMy4x
Mi4xMi50YXIueHoKPiArc2hhMjU2ICBjMDhiYzY1YTgxOTcxYzFkZDU3ODMxODI4MjY1MDMzNjk0
NjZjN2U2NzM3NGQxNjQ2NTE5YWRmMDUyMDdiNjg0ICBQeXRob24tMy4xMi4xMy50YXIueHoKPiAg
c2hhMjU2ICAzYjJmODFmZTIxZDE4MWM0OTljNTlhMjU2YzhlMTk2ODQ1NWQ2Njg5ZDI2OWFhODUz
NzNiZmI2YWY0MWRhM2JmICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uMy9w
eXRob24zLm1rIGIvcGFja2FnZS9weXRob24zL3B5dGhvbjMubWsKPiBpbmRleCA0YWNlNGQ4NTcz
Li42MGFiNWIwY2JjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uMy9weXRob24zLm1rCj4g
KysrIGIvcGFja2FnZS9weXRob24zL3B5dGhvbjMubWsKPiBAQCAtNSw3ICs1LDcgQEAKPiAgIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gIFBZVEhPTjNfVkVSU0lPTl9NQUpPUiA9IDMuMTIK
PiAtUFlUSE9OM19WRVJTSU9OID0gJChQWVRIT04zX1ZFUlNJT05fTUFKT1IpLjEyCj4gK1BZVEhP
TjNfVkVSU0lPTiA9ICQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS4xMwo+ICBQWVRIT04zX1NPVVJD
RSA9IFB5dGhvbi0kKFBZVEhPTjNfVkVSU0lPTikudGFyLnh6Cj4gIFBZVEhPTjNfU0lURSA9IGh0
dHBzOi8vcHl0aG9uLm9yZy9mdHAvcHl0aG9uLyQoUFlUSE9OM19WRVJTSU9OKQo+ICBQWVRIT04z
X0xJQ0VOU0UgPSBQeXRob24tMi4wLCBvdGhlcnMKPiAtLSAKPiAyLjUzLjAKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
