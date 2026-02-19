Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBACE9A054
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 19:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 560AE41782;
	Thu, 19 Feb 2026 19:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwAQ2VGKa_JA; Thu, 19 Feb 2026 19:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E33FD4177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771529579;
	bh=J5d+wF3AP6XEnpFjBhg0Cx8hGzDHX8WfyoOlwlkanJE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rnMMxE5ZPrYQxC8djlNGIwTBj8SZKKBs9YIsHRj9v3Y7tT0/VXoSjSkEjzRGujlkV
	 mI3+nhhMDMsprFJ90nkHdEdS+ujJTE0Fs4gvX8YFxGzQwnDbQ/BrfjJoMKPBAgNAuB
	 V117S8kCZarcQxW7gBtWQCVnuEnW+ft1sFEysvYzNmIQW5EqLprcBqf7/sPLOB/+g/
	 F6je2SiHmgyrnSm7mtX321k4dT+oEPFoEqzXnwCArS1sKwQvNaNGvXS34jZH2yZqCj
	 8wKJtRhquFVijoo4451BHd2GQVdcmTEIAlh3db5geuTcsFoyshec/yfNbYzpgNrph8
	 wZa5qNXQoG57g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E33FD4177A;
	Thu, 19 Feb 2026 19:32:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB62D1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 19:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CB6C83BAA
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 19:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0u3ZbmcW9Kj for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 19:32:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D46583BA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D46583BA3
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D46583BA3
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 19:32:56 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7d1890f5cafso466892a34.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 11:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771529575; cv=none;
 d=google.com; s=arc-20240605;
 b=BSsPNej6oIp6h7ZyazsSRSgOAaSN0XYopLOlxoNTGmt9/+HnMPXJKEDjqCk4lSOsWw
 VR1HjLePAPUeQclGXeCdlEQhvI5FBVUd35qwyV0kDraj/m6EQVebM+6jHGLq/OkMDjaP
 hhsDfxPnSzad0LZnCs70n/Le0pdw5sZDjPm+41qb/3AsflwA24nkp5jW3ElSa8s+cvJd
 W/ZYl/FljItlhDhZzhUpEEwtbbE+2b/Z94NeBFzB3jqjVch74PrmaT6wqtzBqtIHPxH6
 jzC3HU75LT5VU2KEGTgyYS8alRJAdIR71fWbBy8ldWamCX9F9zrgFed6gCUbYx8jGM8C
 WCgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=niNDCvpHxtGZeYUHHhuMgl4nQh8NF4BlUMJ3Yxr5XOM=;
 fh=wo7tCDjhCybiN53hXWmbFG5LuhEyalG3Ts7dxuq/aEU=;
 b=KFOxH3BpC6ytcIY/3GgShFeW79plvkdAoSdEtw8kt2C1X/v74muhesnnVTjbpOPj3G
 o2BOyPzYSlB9PXYky+PyBZK/8c63KhYwcCa9gdd84C1h4M9Fy+VgN6qXIo72zB+IXKz4
 HGTQrvKZ2xLCyozFp4ae05LC+lVWxtmZ7u+2TpCyOYpurswPP3smUeWAIJzVUrRLAWP5
 DHAnx9/9h54bi1alXmPi0E1F+33w/aihwMsdwies9p8YJKHOHjjjKILSQu0Yo73MqybM
 rc2i4c+afyIq6L9EptETZ77pE6Y0RaxghEJJUnaIAFvTYQ1aSSL7o1LpJosqR7EGSIZY
 25cg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771529575; x=1772134375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=niNDCvpHxtGZeYUHHhuMgl4nQh8NF4BlUMJ3Yxr5XOM=;
 b=hF2ygMvp9yU2LFd2fy5NcKPuW57ks91Qe9fgK+uBp5wbB/uvPP00r0DspL25ZMAMkk
 BFtD36uw8ThjksuVnZsbp/S7x75QI54K8mruolzwAV+dEDaDICoFFrkXmreLqP056vFi
 P5Zr6p9Lxe9YQUCn8xyMNAtsWcPjivmkFz4m3sEy5feEatTZEuySCI5o3LAImmjgrzJ0
 DDWw5vSmE0/lpD7c/+sujHLR+AtUkDsKfUyAojw4Y/mUW+HjqpT4xQufJiNP7LGW+hcd
 UYAgvkgJJ6JCjZMYaP+ZFm8jC9IvEuJq4dEAULStCVM5044z2QzTmVlRjQRTCXPfxa5y
 0XVA==
X-Gm-Message-State: AOJu0YyTuqCho2qE9zGXMypWPoDppvzM9AM8SIVpvsyfS5BXnRRPZ+Hy
 GxDYQsGmgnK/Uh9fpwr09WX+UefabscUt1OLisY0kcAG/huZQUtGDKaCoOekCiZ7DsGa/FCuObl
 htff7Yo0+gjyNm3x6mgQSMil7EKEtQuI=
X-Gm-Gg: AZuq6aKHe8estQTjEiyl/KdgEJ51RPPDYkUHM94XvPUWGkfPRCxv1QgfSTWjpOnuw9M
 +suS20jBNe5p/ojY31r/CijPfrXXGUX5sdL4077Fc1jWf46vN/T0d397JoJO4sH+PnuRm7N1DuD
 sOtzpQkD4k0m9a2oZyZQzWp+Mb01sD0u6XOx9lNyjEOEzuPrUk7y3bSe4/U3NkS5Knfg9RmjlGx
 vvYllFEQMfiV7p4Nue5/uaLnlGNZ4PFm1Bace0rwWONc0skDRZEjG49fsnWSAN8Sa7Z6bgTwwhp
 FisXNQ==
X-Received: by 2002:a05:6820:1c94:b0:661:cc1:50c0 with SMTP id
 006d021491bc7-67858ef3a2bmr9831133eaf.11.1771529574500; Thu, 19 Feb 2026
 11:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20251203-virglrenderer-v2-v2-0-2846fc1a579a@gmail.com>
 <20251203-virglrenderer-v2-v2-1-2846fc1a579a@gmail.com>
 <d13a47d0-39c4-4bd4-801c-ca4cdd4bc8ca@smile.fr>
In-Reply-To: <d13a47d0-39c4-4bd4-801c-ca4cdd4bc8ca@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 19 Feb 2026 11:32:18 -0800
X-Gm-Features: AaiRm51wCBXXiEojh4gmZPxsXHgc-3fbQ2RBjwDxXiEdjk7Q-to0B3vgVfmAPik
Message-ID: <CAMWSM7hYmiCCkqnAbSZaJtAgwGfrSDbvrMvojzGk57fiUqaC=w@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Romain Naour <romain.naour@gmail.com>, Steve deRosier <derosier@cal-sierra.com>,
 Adam Ford <aford173@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771529575; x=1772134375; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=niNDCvpHxtGZeYUHHhuMgl4nQh8NF4BlUMJ3Yxr5XOM=;
 b=BnHffXPREKb8a63hmbSeTnNKe8BwzqzTzXOUjDYVBelPnvxnX7Hw4bfkVh2YXtM0tG
 zbY6nAU1u6WcVUYjubkZhCD87aS8iFYj+0xB2Pq/0MVXHU1r1g92sqamRPog4CH31TSe
 SGCP7/NnRU69lNc7DeqbD/Fbw39St56dsnctoH+o3jn8oDoabBbzbJsXYcZ6FvTUUd/b
 iA9cxj55n5gkregg5zWvFQtbsGF6DXkAOvRp9cg+NmcjOB2MNDzbyEDGDUN3nCW8zFwN
 SAzJix8IdeVf53yJVMsE42p0A0gJvEer6GlT3I4xHf0iw0ytPHisUwveKUebY+yHI4Zu
 rH8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BnHffXPR
Subject: Re: [Buildroot] [PATCH RESEND v2 1/2] package/virglrenderer: new
 package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gVGh1LCBGZWIgMTIsIDIwMjYgYXQgMTA6NTnigK9BTSBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiBJIG5vdGljZWQgdGhhdCBo
b3N0LXB5dGhvbi1weXlhbWwgYW5kIGhvc3QtcHl0aG9uMyBhcmUgbmVlZGVkIGhlcmUgc2luY2Ug
c29tZQo+IHB5dGhvbiBzY3JpcHRzIGFyZSB1c2VkIGJ5IHRoZSBidWlsZCBzeXN0ZW0gaW1wb3J0
IHRoaXMgcHl0aG9uIG1vZHVsZToKPgo+IHNyYy9nYWxsaXVtL2F1eGlsaWFyeS91dGlsL3VfZm9y
bWF0X3BhcnNlLnB5OjMzOmltcG9ydCB5YW1sCj4KPiBsaWJnYm0gaXMgYWxzbyBjaGVja2VkIGJ5
IG1lc29uIFsyXSwgc28gYWRkIGxpYmdibSBpbgo+IFZJUkdMUkVOREVSRVJfREVQRU5ERU5DSUVT
LiBBZGQgImRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX0xJQkdCTSIgYXMKPiBCUjJfUEFDS0FH
RV9WSVJHTFJFTkRFUkVSIGRlcGVuZGVuY3kuCgpHb29kIGNhdGNoLCB0aGFuayB5b3UuCgo+ID4g
K2lmZXEgKCQoQlIyX1BBQ0tBR0VfVklSR0xSRU5ERVJFUl9WRU5VUykseSkKPiA+ICtWSVJHTFJF
TkRFUkVSX0NPTkZfT1BUUyArPSAtRHZlbnVzPXRydWUKPiA+ICtWSVJHTFJFTkRFUkVSX0RFUEVO
REVOQ0lFUyArPSB2dWxrYW4tbG9hZGVyCj4KPiBDYW4geW91IGNoZWNrIGlmIHZ1bGthbi1oZWFk
ZXJzIGlzIG5lZWRlZCBoZXJlPwo+CgpZZXMsIEknbGwgZG91YmxlIGNoZWNrIGZvciB0aGUgbmV4
dCB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMuCgo+Cj4gV2UgaGF2ZSBsaWJ2YSBpbiBCdWlsZHJvb3Qs
IHdoYXQgYWJvdXQgYWRkaW5nIGxpYnZhIG9wdGlvbmFsIGRlcGVuZGVuY3k/Cj4KPiBpZmVxICgk
KEJSMl9QQUNLQUdFX0xJQlZBKSx5KQo+IFZJUkdMUkVOREVSRVJfQ09ORl9PUFRTICs9IC1Edmlk
ZW89dHJ1ZQo+IFZJUkdMUkVOREVSRVJfREVQRU5ERU5DSUVTICs9IGxpYnZhCj4gZWxzZQo+IFZJ
UkdMUkVOREVSRVJfQ09ORl9PUFRTICs9IC1EdmlkZW89ZmFsc2UKPiBlbmRpZgo+CgpJIGJlbGll
dmUgdGhlIHZpcmdscmVuZGVyZXIgcHJvamVjdCBpcyB3b3JraW5nIG9uIHZpZGVvIGFjY2VsZXJh
dGlvbgpwYXNzdGhyb3VnaCBvdmVyIHZpcnRpby1ncHUgYW5kIGl0IGJ1aWxkcywgYnV0IEkgaGF2
ZW4ndCB0ZXN0ZWQgaXQKbXlzZWxmLiBJIGRvbid0IHRoaW5rIGl0J3Mgc3RhYmlsaXplZCBvciBn
ZW5lcmFsbHkgdXNhYmxlIHlldCwgc28gSQpjaG9zZSB0byBsZWF2ZSBpdCBkaXNhYmxlZCBmb3Ig
bm93LCB0aG91Z2ggSSB0aGluayB3ZSBjb3VsZCBhdCBsZWFzdAptYWtlIGl0IGV4cGxpY2l0LgoK
QmVzdCwKSm9zZXBoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
