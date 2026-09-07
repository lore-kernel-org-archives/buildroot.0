Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C9BC79F9E
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 20:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCB56809A4;
	Mon,  7 Sep 2026 20:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8bh-W76etGh; Mon,  7 Sep 2026 20:24:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1B7B180980
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788812652;
	b=lnWW5MSc/f3GVSVcapXTY0HdBJ0E4Es1WRQUZ7FoiDaIelncAqotr7f8pZMO62S6h3nQ
	 h+8+WiH4RbyA5XgNnfpcuadcNq3ROfdlR+weWm8XqtJzmiXP28xys5bc253r6sB9q4kbp
	 bUgECDO6uX40jFwJsSNF27bh1jFAhPwFRaymHAAZOZpE6uUfESHDEgMYc8zl/no0c9rdz
	 e/KIZgODx/8o/FYwB4KtxvHHcVfD8keHpJtjLvcl3TrT3w4ZNmrSmCEt0hTZjj4dIqH8+
	 8onRs17wNO/ZM9/Vpk7DrOnXERliG8fA2wf1F6Jkl58rG4XChS5/eA71XzyPCcoYsBg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788812652;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=A8GrwAWnesM5ngja91+XlbpCJfXgAZinuItGbMI60KY=;
	b=KNyeJ2FnLSTssZRSuFS40TpnzNGAoQCjKyPYibEVCed07DDmzrW3Krs+455O6pigbAb/
	 hbK3o/8Em8PaREgkIMk2bvB2ts59NlNMv7kw1MFtF2zgz2KghUqJjJh8PALZyn6kOOFAA
	 vzVthK748OSQGZP/rXBIJby8J3x/6qhFp0ft2iKXe7Q7eonLnpV4AKOegrxYeTU2pH383
	 Of6mc5BUFoRGhwc4ezjR3hqv3p7rT6DiCSQ+kgOhtUgxBeGUfWmcmwSGH+eRQw3LLFoBU
	 YWrVCHVudsqyXEifr7sE4/kTNZx2snPy3CnCNQtNQb2Zh3plYAFzFJB4kUIMCsn9Zrw==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788812652;
	bh=A8GrwAWnesM5ngja91+XlbpCJfXgAZinuItGbMI60KY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YcyQU0xcc4G3ya6hOnJlzeCo2AXnlUuI9WqR1FFnZtSH+o0wbQdl6e77YwfGXA0n7
	 zrnefLnoJo2f7nCcgfCixt7xLb6T+xr54tN7CqsrrZ9ylBqLtNie2Xtb81JbeAFWj3
	 QXRUMMv+hxiBZ0t/QWDbLiEc90U1UVg1y6PJdpd84I7jLUkaYBELED0KFb6eZc0gYf
	 3GPB2hjZ35Xvi/HGtj0rfSm9W8gA8Y7BTyDcH9CTy/IzHMgNr7DbYv8z18hPdGSK0e
	 1gXmSTgxZxfzzRqaCacLO/sH6vgYv/3XmoV/2WpF9n9/TIVfzyYP1u3IPpxG6iyFzk
	 RyM6unwosaSkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B7B180980;
	Mon,  7 Sep 2026 20:24:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12B05230
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 20:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 046B840519
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 20:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQ5ZezoRODdt for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 20:24:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1AD3040518
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::c33"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1788812650;
 b=LCx7aiflwlLcwX2xeM8TIpd86obueitXRS19crdlII+/I0x+0OUIRJL0oDFQlctyhuYp
 CcvOUNxnM7h4RTRh1sWF4hZlGSip5qRIXMr3RmaxUMuIhXZL6jO91fgCenmIrxwplTTXJ
 IxV55CVmc46tTS/U4E5IfdumMiCm1TsdP+/UAq7PX2fh6CnR4u+SmOuIkda9lNd/Iy9c9
 i/qXBx+sEiKcrHVCadCPHqnRPfpHiqS7WUB34CRtj63ZxVMAxuXojNsqLGj/21SX7wFwK
 HO4FLfee+PyPI0OqN48UrGi/OR/drgdHxko/Efus4BfmEVb8Apn1ECsF7u+ZCKCCWew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788812650;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
 bh=tWeO9OkKgTt6XX0iOTgCFix8BQxzK44Mtk/n5w4npgk=;
 b=JrJ/kBo4NnCtEVqzKzpHVJ1DR9dJAJr7DxYYVC3WRhEVMpm3prdBoLYmvORX+6q79gfP
 RLzHRVjfvrsHiWj6e5LJuSCZyujwrkuicLaXdo4yfWcSF1QU/Shs+kbrLoCtYsInyUA2T
 DRzg+xpEckeBrrgP6BK38k7dYWfypHA5CW6vb+x5cyxh+KLR/NJhzhx20r1Ldzc0rZPX+
 k39aj0ispgKp+6ume794/4QMW6OAp04xiOIsMzaYjSiAp0yqhiXb2Tu+11+KFuksZGpQO
 8EvrHYLxBE9FJtC/B4U/YMG3GANTPnbK/OsUOyE9XeC+zINxV48q1Gl5n0dv/5TjpLw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=S+rYXwI7; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::c33"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=S+rYXwI7
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AD3040518
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 20:24:09 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-6b1b233ca98so2862780eaf.1
 for <buildroot@buildroot.org>; Mon, 07 Sep 2026 13:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788812649; cv=none;
 d=google.com; s=arc-20260327;
 b=JtUgUenoXYV+oavxzj6/xNm9Y8I3XK+yTPUCRdQWNgL02VwpBUyCaS+opkZQY67LRY
 wdzT4tqE2ZPum3h6jMyVIRPFHtW3KH+qur+W3RDyK+TOGdPYecPMeN8V9m3YGrMc3Odt
 dnrKvkT5vBXVlBEypxde1OsDe6QGa5jul4kOz85lETKsUFH9MH/MFr6nU3wOCRb5q5sd
 olbRUAdxzTZ6CKqRZ9fBXe9KsbBYVrbzs89LmbB2IwbhgSK3D0iXQuSdr4692evKqKQg
 yQ8UKK/KJqJie7oXD3PzQSQU5USCmQtGHiF18F9PiIaGslYz2i9Qw0IPsqhMdhVOS1Ui
 tIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tWeO9OkKgTt6XX0iOTgCFix8BQxzK44Mtk/n5w4npgk=;
 fh=BLZKM2xbMwUREZlBUAJWlOM0WUfFzGtxehjGluA5nYQ=;
 b=FxaUy1Bb86sOAcX/Waj/bMtyqH98KfFO51mFCIARv6OSktANfzAzDezMSVxuSLjOaB
 VANPyhN6fy2NpekfnTe3qldZqrPWiozrxzkW0NNPRIQyqBP8B5+qvrbQA1SExIFwEaHG
 29UJSnOWf2Xm7IAcJTeBs6zUCSlD9fpZL9VRXqkwrJ9cqHTPPFNS2AGKeyNhFZ6gcS79
 zED4qtNRjCOtus08Og3+pnmfk9OLYtEzZ13DCYven4BrjZUoPTgHu+GMTEzXx606r0OK
 eOjfeZDK9YKcuvKfQ8x0Zs5UQrLFQLpCX7B+zp9vHsPq57Xpw/Xoy3qMITHqD17ROgNF
 zydg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788812649; x=1789417449; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=tWeO9OkKgTt6XX0iOTgCFix8BQxzK44Mtk/n5w4npgk=;
 b=S+rYXwI71ZDCnSA0jP8cbz3rUXh8QQKE29z2hUerx3s6y1s0huCp+cXfKzIoj6LLla
 nA/SqwshH6n3l8POjX3l9xKT5hxrWPja3xCU0FHa4/hyT+x8poWDKZr0BxSgzlb3aSnZ
 UOprYi/S6kfcNMWhGy9skmpu+R0JmEu45to7DqmVEqPwTGTmmOfMaHtpveF42TG3mKPd
 zgZyTPNRLzNZo1GYYJh2+ExVRruPcu7gJXX9ePAE6XmGyz3OB+zFSkIEiR9XvuJP9ChK
 GiJpqOIm9Tj7n1rRv/WrOYjqP8TtjgpLN4PMayGSVwwB83/tOWiTlm1jYe91FFmpOKdi
 BqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788812649; x=1789417449;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tWeO9OkKgTt6XX0iOTgCFix8BQxzK44Mtk/n5w4npgk=;
 b=RnsbIIlujBt+Ek7it+U9hSoxU3uN+GIjF8CJ7rXC03Wak8FbMAI59U9VzP2bNvzMiR
 OAdmuY8VBVzXYzn+9RTcL++BS4zsKW0IOsNa1YIR0SfHuUbPMi9YfcnPh4xxPl0TDANH
 8hP/PMm9oAfAeAcTEWJHY5r5mH84yQSVQxkngofAomdWdM/wgaA8pQG0/yDa3giLyeN1
 sDUiuCDGmNHR7bVtJJSZLNKkWy7gz7hWogmW8745pw89gNlpnYwawIwhI0CaWM3f5AtJ
 R026EhTTzh3n3rKlnxNPJBIzbbOijx8mThjF5WQwMteBrmJ5EOC0H21senqehOskaj7z
 /xcQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByC1e0WH/DNYE2H0cuAsEgaLKumhjqvTO1Z92K6kLnk8wB2qxKIoOD3R8H03b9nyn1r2JHEpBUFKmw=@buildroot.org
X-Gm-Message-State: AFuF++m+/wUTBy7s3pyC6Hh3DAlTwWkT6UEV2t+5S5nCEbyvWe3pIm8F
 Ufucv5UGzAJ2ledBMn2Ix5TEPOYcIvM4euQ4qZ9MBPqL9WIEo2Bk3fCv2+87Wx8rJxdRZgmbBXH
 I4Bz97f1jmy9zBMjoCyy//HtQTB8gwJ0=
X-Gm-Gg: AYBFou24J5WL/RWAyIHSU3q19xYS70h8oznqotBKutot8uWNoTNHvnAHCfjvmue9Hq4
 30TxB6Txv2YFwwCyApvceWc3eI+X5k3gMxuCgXVhi4IvuWmUL/DO6Dfxgj+c3zfZTbLbIqIupWK
 sX2wjgdygcEWyNBgoEzNu0/ldsUSdPjQev5bekDo7LDzr3EPUTh+/VBgvtNbwCjIo8HzZx5YU8q
 WvgZnJ8LSehprIKiMY8/aYi061MEUJfUpOeNMIdJlTcQTbJxu7rWPeR79abWtCIZ/Fe4lHGhyQw
 zYkcWmCfczSj8uNKn4vnDpQIqOcvrbXRkd8WpUysSlDu
X-Received: by 2002:a05:6820:2212:b0:6b7:8415:d77f with SMTP id
 006d021491bc7-6b78415d8a4mr12887362eaf.42.1788812648708; Mon, 07 Sep 2026
 13:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260818-passt-20260728-v1-0-aa8bc1ce2c5a@anodize.com>
 <20260818-passt-20260728-v1-2-aa8bc1ce2c5a@anodize.com>
 <ap3Xvv4F7Mgi3mve@windsurf> <ap5TbdrtlWJCSkSM@windsurf>
In-Reply-To: <ap5TbdrtlWJCSkSM@windsurf>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 7 Sep 2026 13:23:31 -0700
X-Gm-Features: AcwNN1X2cK6HYizLMqyX9NVvIyLB2pzCpegyJdZFyX3_obQ2tuMViupazlVeNcg
Message-ID: <CAMWSM7gTjU2OuSd8nak_EE7fqG4VEkChuXyvrOJ9BRG63T5xLg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 2/2] package/passt: bump to version
 2026_07_28.f8df3f1
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

SGVsbG8gVGhvbWFzLAoKT24gU3VuLCBTZXAgNiwgMjAyNiBhdCAxMTowMuKAr1BNIFRob21hcyBQ
ZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8g
Sm9zZXBoLAo+Cj4gT24gU3VuLCBTZXAgMDYsIDIwMjYgYXQgMTE6MTU6NDhQTSArMDIwMCwgVGhv
bWFzIFBldGF6em9uaSB3cm90ZToKPgo+ID4gTm90ZSB0aGF0IEkgZGlkbid0IHRyeSBfYmVmb3Jl
XyB0aGUgYnVtcCwgc28gSSBhbSBub3QgMTAwJSBzdXJlIHRoZQo+ID4gYnVpbGQgaXNzdWUgaXMg
Y2F1c2VkIGJ5IHRoZSBidW1wLgo+Cj4gSSB0cmllZCBiZWZvcmUgdGhlIGJ1bXAsIHdpdGggdGhl
IHNhbWUgdG9vbGNoYWluIGFuZCBpdCBidWlsZHMKPiBmaW5lLiBTbyBpdCdzIHJlYWxseSB0aGUg
dmVyc2lvbiBidW1wIHRoYXQgaXMgY2F1c2luZyB0aGUgYnVpbGQKPiByZWdyZXNzaW9uLgo+CgpJ
J2xsIGhhdmUgYSBsb29rLiBUaGFua3MgZm9yIHRoZSByZXZpZXchCgo+IFRob21hcwo+IC0tCj4g
VGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGlu
LmNvbQoKQmVzdCwKSm9zZXBoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
