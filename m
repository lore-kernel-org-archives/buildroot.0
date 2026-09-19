Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0D1C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2244640A66;
	Sat, 19 Sep 2026 16:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUy_9wRgJ4BU; Sat, 19 Sep 2026 16:59:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5005940800
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789837153;
	b=nud/S00FT3491OYdXoXixg3XxefF2rN5UTsdxYJXTxB9nwk5Xq2vrX7GrGxftwDKjBgB
	 1Xgu3TpbpWjAUv7XM4DStOZgToh3cclf6mqBqqatxjwke8M/3W2d+QJLLDS9NYRS8I2SG
	 0pMQ1nVl2QL5+YaAHp2E6WDsyQSnswpuW2Znd4Ymb68gXWNti+nidwYDK40E8ABLCG4kR
	 93LMVLe+yLCtLT0TQhH8xufsT9yWrk9wUUj2CWiiAbbJp30IPMfoCOA9EHP7aSsS77WD9
	 Q0bGMWL+RCxTDNlLCUWrHEAer7B0iIZcjCjlShg7VuC3/dncdGbF8KLJrBA7Sy8MgUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789837153;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:From:To:Cc:Date:In-Reply-To:References:
	 User-Agent:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=n/CANjeiaFs8sJAdl5LDaEYDXvQwHExs2+tM9U0eke8=;
	b=m1gpksz8/40f4u3JvJa23yLbatmT4LKJcu300g1kV6Ry+VvYWrZK0QSLVLkl7jIzSsPC
	 A08thLwXBbr330aRvm+KNFylfGXkWkD2vbXLDhVul/KxZe3rYDyfb2IA0j/gBQfpRdw4B
	 /xOsFfZaLQkRbUzYVjb3fHxxktPJTwxOkuyaGmbsqdX5J+ZBlxGYPvJGTdubtjwqNMkuQ
	 ByINeXSEcuvB/XEAmaZJHq2vKnjGYzETNQjfWtB7mMnnlHTYsQa3770ACwlwS1MPctb3v
	 iPpQhCYu8rSa46laa4n0SUzaASIRFfwsaD2GwH/J8kyLmWX7i66qrGJL0/+46bj1ANw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789837153;
	bh=n/CANjeiaFs8sJAdl5LDaEYDXvQwHExs2+tM9U0eke8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VsO7ilo+ctmtWhk/t6c3gwznno53QsIxeSNpSBZiYltnTv/qjH0VSmrB/HBLxkxEX
	 NAwiQo4thDanUTpcieBfXevjJSIeFDzXpR5XI2/71m0+K7cHibNUjPUbJkdmbQdW/e
	 YvjPOwNXzNbeUUqbtwazh9/+YOA8qgeaQNkMKgGRXR/3q5wFpP0CR90P/fwY4h8S7m
	 uZxaSlVpAAPYnLrstFADtcatb90N308CyOibSuevfrEg2Vdtq75228i8mbaj2xVb5Z
	 rHvmTDIGD2wy3Zmt40XBHufYZtDTxBuDDkGR6KTaRV3/Z868dnHokz7KHI30upBZjO
	 9NwPJNeYnXYVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5005940800;
	Sat, 19 Sep 2026 16:59:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0787F13D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E96DA40084
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDzssNTppLMy for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:59:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 53C2B40026
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789837149;
 b=KV/q6CyBx45QtIfNlEoPMQjFcl9WuYCIWxfIfng1/olrKxpRq8Ou4GlYL2eh7p2sTDuB
 PuJ1MIhTNMrVVwvLJqxeq71hOHM541JYBzlUAvvVdo2Ij8LGfIN/6wsjXbZvcohOxQUpF
 j6ZhHeEwL4k7gAuZeQTBkE5iH0XIRz7evypYiDZDfxo+DAqcdrxwdc0KQpCccrhVQMFRP
 ZMlmJw6SfiSP1B0w0Ekw4+IbeBZBQM5WAoJ7psqZJ4GUSC6o27teACTHvD1OvQjhXcnpO
 K1B3zAM1STwsYLdPytEfO7Y029zdspvsGAmpgRHuEXN83+sytaG8aoK4b5aE+Rt4SRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789837149;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
 From:To:Cc:Date:In-Reply-To:References:Content-Type:
 Content-Transfer-Encoding:User-Agent:MIME-Version;
 bh=qOOIOJtpQDGHrMHJwK1pXzi43fz5KJud0VS6qwxZ3ko=;
 b=ZxvziyQy9grel2HH4Afig0HQQiqw9zErCfD4kgVolIOM+kf4Oa2PP1FDTMWKZB3HWRBE
 lFp3txPbkEOfD0nFRdEfgtVo5bDuFKXooyMi6/a1H7Q2itK9N1sS5EQK3gBokM0Tlzr3b
 mGnvQqGPPChCGTQgWdM3gyRcw5MUXOZPLN33Ehr9QZb2ynh52zc35tucEVY0siDV5u6Sz
 Kpo0RCcbab+UPxWD6TKUu/GWoOR9sMv5/cxnxT8P9RriOtZfeEaO43xK7fCtG/S8fc/Bw
 u+Ij7uwNfiULqhcOEUIB1Ngl9PyGFjWgOMEKTLnbs9vIwmMXue7SzWxIgp/ALYvBlKA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=snl2WURc; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=snl2WURc
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53C2B40026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:59:08 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-485933b24c3so901866f8f.0
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789837147; x=1790441947; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=qOOIOJtpQDGHrMHJwK1pXzi43fz5KJud0VS6qwxZ3ko=;
 b=snl2WURcH3AvxW8J2ViJr142LeCnINnFNLwqX4YUAV37oQ1FXCmz2h2f4ys2znv/tz
 YZAh0M5mxH4xHldfneWNaRxVM0WF3nhx1MBvxWY0+hJqxq8VikG8Emz568VlEmY/heDm
 QRzz/ruxY5mNMprtBvXcXkcWOUwJy5hl4IC+I8DeZQNmO8k8s7mkUbdL/mO+8ike0V+/
 GHIw6XCCpNGsT5nI+ZSj+++Oytp/zVlJZaXb5Tv8PIXdTWCDiMYAIDjgig2wk/EaOReJ
 Ln1gZ99NshjacQ6QI2X3XHh7e0QSaQ+hbY8jELA7FyvhdYy4eFoH2siPjytwGfl8Vfuv
 tGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789837147; x=1790441947;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qOOIOJtpQDGHrMHJwK1pXzi43fz5KJud0VS6qwxZ3ko=;
 b=cgE5s4NmCk6b1Y38FY99NY1FrH0FMr8DajVqvEKrxR9bEj+Wz1aTdTYwNwCxw68l12
 aDM04hl7Kw3AR2AcLqXsTFCGR/X/wkxF6qylg1BJOjHsqJLx9UT3Mbd4q+xiZy9Jy2dK
 NaPgo4NNrW7uiNnJTyBzOUCaV+zkelco8TvJ+HN9WkyYVRDCrCOnPBRMHm0+FvKIYLaq
 ZbnKo4FmPwdexhM3GGdRx/1kxN2UvBJgc63XkDFjt5H/Jdu5p9C/5HgCOsEU/AX8x8D3
 8UTJemmZ5H/3ygO/QqjfaA9Kr9uyusKZt3XQiZnjma1WskZeQaG8ZB2Pzyq4Hwwb5/hm
 1r6g==
X-Gm-Message-State: AFuF++n1bSdvxx6/xwk7skVYdq/x44LoupplXHDrni1yCG2FnDQgyZnS
 2h1FL8FuJiJyHCYy6ePCG1m/bgXfJj8rYLaJGEOgoCaq+rIwolBYYWm4j/9+8g==
X-Gm-Gg: AYBFou24/Xg/YcKFed6lkBVW8GPAo+X56XDST01CLgXQypGtNpZEJ1BjzmwJcCTc/+1
 9dEiYSIF5Z2u9yLizjD9Uu0+En+nfdiZBV121tR9Ba5lzBESgpBrFRI89ycNVUyZpMbdjcNcD3f
 P79eG4EDgUHpuRPTXgZI8N/jPalLbcreoZjk/RhIHlO644ddCDgbb997HHHdrzEZmc0tsBeiIvK
 4ZSHVWfLYKd4gzMlRL6O4E8lRFjKaTVrXfWO7I+nCPTga62OirYRiNlyXsmqF91GBTzPzMyD4ob
 58YrifBYlmhJFQiHyhpj4kkzE13cS8ySpY8m7kK/XkkBz28E03YF7lzH97vRUF6ZyxD6gbFxXDP
 U8ArD/m7kqVcud8pCy0hkMS4dfaLb1MDP5/XciK4TIox5jRiGTO9kzu/DPQysF0fsyZFwYUFP1z
 t5P879JU1ex3lMix3rQ0zP5LzqF68Fq1EHbscvSJhvwOuheEKLhtJ7pR6JrReRzlrFYXk39CYvL
 lQd2RGamgC+8hgxKw8dqtgwyW6g0r39ei/j9LY9XN7yrn4P9FIR3ys=
X-Received: by 2002:a05:600c:3584:b0:49b:96a0:5c00 with SMTP id
 5b1f17b1804b1-49fc57227b7mr109358395e9.13.1789837146460; 
 Sat, 19 Sep 2026 09:59:06 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc7cba562sm108527605e9.2.2026.09.19.09.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2026 09:59:05 -0700 (PDT)
Message-ID: <83e73170264c232037477ef2c356785a766602d3.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot <buildroot@buildroot.org>
Date: Sat, 19 Sep 2026 18:58:59 +0200
In-Reply-To: <0b863079fdd5738b4becfcc11e86c93f@umbiko.net>
References: <mailman.5079.1788156070.3179391.buildroot@buildroot.org>
 <0b863079fdd5738b4becfcc11e86c93f@umbiko.net>
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] boot/syslinux: Bump to 6.04-pre2
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

VGhhbmtzIGZvciB0aGUgdGVzdCBhbmQgdGhlIGZlZWRiYWNrIEFuZHJlYXMhCgpPbiBTdW4sIDIw
MjYtMDktMDYgYXQgMDU6NTUgKzAwMDAsIEFuZHJlYXMgWmllZ2xlciB3cm90ZToKPiBJIHdhcyBj
dXJpb3VzIGlmIEkgY291bGQgcmVwbGFjZSB0aGUgc3lzbGludXggaG9zdCBwYWNrYWdlIGFuZCB0
cmllZCAKPiB0aGlzIHBhdGNoOyB1bmZvcnR1bmF0ZWx5IEkgcmFuIGludG8gdmFyaW91cyBpc3N1
ZXMuCj4gCj4gPiAKPiA+IEFuZCBjaGFuZ2UgdGhlIHNvdXJjZSBVUkwgdG8gdXNlIG5ldyB1cHN0
cmVhbSBHSVQgcmVwbzoKPiA+IGh0dHA6Ly9yZXBvLm9yLmN6L3N5c2xpbnV4LmdpdAo+ID4gVGhl
IHJldmlzaW9uIHRvIGJ1aWxkIGNvbWVzIGZyb20gQXJjaGxpbnV4IHN5c2xpbnV4IHBhY2thZ2Uu
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2
ZXJkbGluQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gwqAgLi4uYmlvcy1GaXgtYWxpZ25tZW50LWNo
YW5nZS13aXRoLWdjYy01LnBhdGNoIHzCoCA4MiAtLS0KPiA+IMKgIC4uLlVzZS10aGUtaG9zdC10
b29sY2hhaW4tZm9yLXByZXBjb3JlLnBhdGNofSB8wqDCoCA4ICstCj4gPiDCoCAuLi4tRGlzYWJs
ZS1QSUUtdG8tYXZvaWQtRlRCRlMtb24tYW1kNjQucGF0Y2ggfMKgIDMwIC0KPiA+IMKgIC4uLm51
eC1Vc2UtdGhlLWhvc3QtdG9vbGNoYWluLXRvLWJ1aWxkLnBhdGNofSB8wqDCoCAwCj4gPiDCoCAu
Li4tYmludXRpbHMtbm90ZS1nbnUtcHJvcGVydHktc2VjdGlvbi5wYXRjaH0gfMKgwqAgMAo+ID4g
wqAgLi4uc2stRm9yY2UtbGQtb3V0cHV0LWZvcm1hdC10by0zMi1iaXRzLnBhdGNoIHzCoCAzMiAt
Cj4gPiDCoCAuLi4wMDA0LWVmaS1tYWluLmMtaW5jbHVkZS1lZmlzZXRqbXAuaC5wYXRjaH0gfMKg
wqAgMAo+ID4gwqAgLi4udGlscy1Vc2UtdGhlLWhvc3QtdG9vbGNoYWluLXRvLWJ1aWxkLnBhdGNo
IHzCoCA2MCAtLQo+ID4gwqAgLi4uaXRpb24taXMtbm93LXBhcnQtb2YtdGhlLWV4cG9ydHMtb2Yt
LnBhdGNoIHzCoCAzNyAtLQo+ID4gwqAgLi4udW1wLWNhbGxzLXRvLWZpdC10aGUtbmV3LWRlY2xh
cmF0aW9uLnBhdGNoIHzCoCAzNyAtLQo+ID4gwqAgLi4ucGVyLWJ1aWxkLWl0LXdpdGgtdGhlLWhv
c3QtdG9vbGNoYWluLnBhdGNoIHzCoCAzMiAtCj4gPiDCoCAuLi4tdHJ5LXRvLWd1ZXNzLXRoZS1z
ZWN0aW9ucy1hbGlnbm1lbnQucGF0Y2ggfCAyOTUgLS0tLS0tLS0tCj4gPiDCoCAuLi4xMC1jb3Jl
LUNsZWFuLXVwLXRoZS1pMzg2LWJpb3MtYnVpbGQucGF0Y2ggfCA2MjIgLS0tLS0tLS0tLS0tLS0t
LS0tCj4gPiDCoCAuLi4tc3lzbWFjcm9zLWgtZm9yLW1ham9yLW1pbm9yLW1ha2VkZXYucGF0Y2gg
fMKgIDM0IC0KPiA+IMKgIC4uLm11bHRpcGxlLWRlZmluaXRpb24tb2Ytc3ltYm9sLWVycm9ycy5w
YXRjaCB8wqAgMjUgKy0KPiAKPiB1dGlscy9jaGVjay1wYWNrYWdlIHNob3dzIHdhcm5pbmdzOyB5
b3Ugc2hvdWxkIGFkZCAiVXBzdHJlYW06IiB0YWdzIGZvciAKPiB0aGUgcGF0Y2hlcyB5b3UgYWRk
Lgo+IAo+ID4gwqAgYm9vdC9zeXNsaW51eC9zeXNsaW51eC5oYXNowqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKy0KPiA+IMKgIGJvb3Qvc3lzbGludXgvc3lzbGlu
dXgubWvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDYgKy0K
PiAKPiBCdWlsZGluZyBzeXNsaW51eCByYW4gaW50byBzb21lIGVycm9yczsgdGhpcyB3YXMgdGhl
IHNlcXVlbmNlOgoKSSdtIHNvcnJ5LCBpdCB3YXMgaW5kZWVkIHNvbWUgdGltZSBhZ28gdGhhdCB0
aGUgcGF0Y2ggaGFzIGJlZW4gdGVzdGVkCmFuZCB0aGUgY3VycmVudCBidWlsZHJvb3Qgc2VlbXMg
dG8gaGF2ZSBjaGFuZ2VkIGluIHRoZSBtZWFud2hpbGUuCgpXaGlsZSB0aGUgbWVjaGFuaWNhbCBy
ZWJhc2Ugd2VudCB3aXRob3V0IGlzc3Vlcywgc2VlbXMgdGhhdApJJ2QgbmVlZCB0byBkbyBzb21l
IGhvbWV3b3JrIGhlcmUgYW5kIHRlc3QgaXQgYmV0dGVyIG5leHQgdGltZS4KCkknbGwgYWRkcmVz
cyB0aGUgaXNzdWVzIGZvdW5kIGluIHYyLgoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
