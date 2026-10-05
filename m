Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FD7CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 12:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED55B4066E;
	Mon,  5 Oct 2026 12:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3kfEkn-qrXU; Mon,  5 Oct 2026 12:40:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9814040651
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791204046;
	b=iiz4GTkbox1MntDTsOCcP04bqkTww6NkEVKMXANuPcex02iRGIerTQHSVe3choScxfeN
	 bj0JI9+6oEpOlrlgU9YQSQeqF4A6I8DxPdiHgSA5GVKEbislmYzbooOUAzY6+oL7rORCl
	 ETpb+L7392XyElzmZQAdtLFma0gFeoqfxxnUf3Y5bE/zznFUH/hOeb9iF2cHlC5mp075v
	 SX2GMY57coPszs2gEmY1grUaaMtFkljEYm3/smaMAlWdh4wp8VQkQz+4W8E70JB2qo6UU
	 YexHUTk/1k6IEExiHh+l+ZhI1ae1hfbbsNGbg0IkCWNvBClWFV17Uk5+BQ8/hG1pJ1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791204046;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=xLeQe3osCwEh55no778SsHmiVCWfNPPaeRYY6+Evua8=;
	b=KZiiAqLKAEJlqo+lIT42O1M7SeWzauF0I+jK8W7S/SEsL7O42ESGUlJ0JBwBpTAe5m7p
	 dLEedwg8YMKgeNXftTsMDtS4NhxToYv1Nf855bv0eWEdoGvh/3lhEPqTJU9h5QbLf6iYt
	 PDaH76gCje7xbIM1I3swmvjrZVK7ypg8zCfaJu4exF4Ar5hMppBs46py+xdZMfbdETZa4
	 RbrifT/1p91GP6/RHp9eE3e+RhrKC8OB74sB1js8urNJFoP/mS2VRak5LzAs55VxK3dlQ
	 KHSS6+vfigCFxsrzrYpjlIU7GhZP5hf1ys8lk+GmN23uHX6nN5S502aaSr35ejZfZyg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791204046;
	bh=xLeQe3osCwEh55no778SsHmiVCWfNPPaeRYY6+Evua8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GuN0OEyN4fadu94T1r150omKpYXzAFxVJ2P1b56xU6X/vdC2gH4vRilarNX6XxxZf
	 qUUms8AlqNjvNS3Cfd+B8mWP2tLE0vD3Oc3fuaebTKWrKHGz073QWjX0fPhwPXh0G6
	 I0AbAXY3g/Y0nR1KbPKIJeqpl/N5RQOjyNEFBXVP6QSFLx94DXl8P/Zfy/3QcTbpUe
	 2u6BjPdiELSntVn9fDWyieycBmAEEzEk8EPXNoiQ62DX6DVfvRfeuN1MvG9bP17EOs
	 dmsxKNeA4Arau3GGg53IQjFfK3h/yukIR5aeMREj9wQDK8VC1UQUu9g3mcdwdSa8YZ
	 1G4HEhXoBTJ1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9814040651;
	Mon,  5 Oct 2026 12:40:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4165D32F
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 12:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32D22605F9
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 12:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8b94hvS4w4w for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 12:39:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C2B4D605F0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791203952;
 b=R2bZ79+IGaJvMyLkBnujkFhMOXl+pCrsYE6Yj8JefHUmEkk6Y/wVpAr3/kBEKt7USPCl
 QcR7Vt6KXQ/Zs2d/QfXR5pVMhA8q6l9TwgzQn2o3Kjx1FSgk5P3O14EzX2ncmTbFUO03S
 ckg7xqM/znu1dV6BU1w8sW5Ra1prpQeOEHFBfHPj+ldfHm9yaMSoABRbNk049lGVMEVGi
 uBUCYB+Zhzhj8DFIL+xDnFHrz9HzAEgygkyISzJqPHrCUR831C/f9avL+Upy60M4ZkkBi
 87yKrwgB721GYgaZvTGwmn/RUslKu42Fy2iMH5h5li4zgSzxZ8Ayiklr1J0yhORkYrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791203952;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=G44PTD0jeEooBOS9Eh+WmGIECOauhb5Ed7bt7xX5pN4=;
 b=hW4JXYAllXXrHxsQHHh7+exchquRDLwjGzQ+xUIN11M8Wu4Lw/R+OHSCRXBSuBzJVGoL
 APGKmlpvb84P+hd3EOMMRHljHyuWmAippNY95cCXHOiQPvgfDBejfnXtAWaTp/olCP1l0
 jrwsBYdOqtEx6C+g+fjhfxYr17QCc9DC9fnAOJIji8U8vnvBZkHABkGheKE//qW0ZTNdL
 x7h58MlHk3SMoVOSthRyBMXvcpcZPe+OW2VBSXqIByDml3FlgtpPkLpap3XmIloHA1EOG
 6Z/cr/NSAc/IUFeH5vFbBX0BA5huAVlUBpUKkbGp0lj9K/OJ9lAMVHWYj109L2BsTnw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ayb+K6IM; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2B4D605F0
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 12:39:10 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-4a1706a2b24so7441625e9.1
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 05:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791203948; x=1791808748;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G44PTD0jeEooBOS9Eh+WmGIECOauhb5Ed7bt7xX5pN4=;
 b=d5jjRd0bqd8oBzjJjZJeKpLXWSgeMQ4/fqWFCNxhUCiWX6Kpr1irieFuC+yCoW2MYM
 epbL8GXCykyl/BU8VSWJwZlWLq1tLUJ/U8Zx3oUl8D+LAdbPIf9lBGDLF6tYT69GwKH3
 ltVkT9YT1/ja6DReOIBKnQsLT7hDF27cI0Je0kzkgLh0/g7ru5TBreGE1E7Xcx2XPUNd
 Vdl90uHY8P7tJxL3EslhK5uavLEYniuOldZhhuVwl26bOOEwaf8ndxden1MB0/tnM1lm
 h7f7tjHeIumQ+HBF0LJDoUQHq9iOPQ/90vgeEuzBM/S7Kh2jpdrlETWJ+qUhenTDw9/s
 sNxw==
X-Gm-Message-State: AFuF++k7ftT2FjoTC8nwD27jH6tJTaUy3zQGfAh/nNfpZx0cMehWawxL
 QbefMZuK//p+gVrJsWvBINYqDuWhmCFTUZU4wv51/NqWzbdlA3F/2lvJ5l6igPg8qTA=
X-Gm-Gg: AYBFou0mqzSNB0+muDtkY7O9wTAzLW22SSqrmSBs6f+YnmNXlCJf4W1BxJo6jo6ogOt
 dePWWIGix3TycgmdFw7K3omJBhz5+kmqesXLFi208So55Zb6lPJSjck+rEYyXUzzMMULyOKptUc
 fhOK/HIcpvItXaUoUdOzWje/FLwKmYTNkhfhc9dWOFnTYvERPNP0CLiHGxRN6xOORgnkDW7kElR
 9rUHNBWuSPBPsvJVuV5sbN7FjZgoWL1QulV+Q49krT5rSPUH3MKxjOQrXJVmO3m3nIu+eGJQQBd
 sQOJuu+eNb7Dl6LifSiO8hcN+16x7WsvCu2tfe/HIINrL+aAP4r6MsmzQWwSUDqIzY8yOlxLJ+3
 7pY26RrnzF1Ue5tHK/Go27I8/I+C9/lW+RcirlLs+JwKbYmT1kgUIgx+bkmb7WusLFAmpF8Tm4u
 GnYLPsX5jJmAnyqDD/8vYvRn3+5qU65iiwx0ZvgnE8IBq76NuGJP1eTclrUI6MlyhEAyJ7zGVwZ
 A==
X-Received: by 2002:a05:600c:6995:b0:4a0:159b:d283 with SMTP id
 5b1f17b1804b1-4a0275857a7mr181296695e9.30.1791203948392; 
 Mon, 05 Oct 2026 05:39:08 -0700 (PDT)
Received: from [10.140.0.3] ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280ceaf0sm367996165e9.12.2026.10.05.05.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 05:39:08 -0700 (PDT)
Message-ID: <84750609-5d4b-4101-b740-0c243fe5c15d@mind.be>
Date: Mon, 5 Oct 2026 14:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
References: <20260930120101.474560-1-raphael.melotte@mind.be>
 <asJy1yDEqT_q0rH4@windsurf>
Content-Language: en-US
In-Reply-To: <asJy1yDEqT_q0rH4@windsurf>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pipcl: new host package
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gMTAvNC8yNiA1OjM4IFBNLCBUaG9tYXMgUGV0YXp6b25pIHdyb3Rl
Ogo+IEhlbGxvIFJhcGhhw6tsLAo+IAo+IE9uIFdlZCwgU2VwIDMwLCAyMDI2IGF0IDAyOjAwOjU3
UE0gKzAyMDAsIFJhcGhhw6tsIE3DqWxvdHRlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gCj4+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1waXBjbC9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhv
bi1waXBjbC9Db25maWcuaW4KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAw
MDAwMC4uMWNhYzg1MzUyZAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9u
LXBpcGNsL0NvbmZpZy5pbgo+PiBAQCAtMCwwICsxLDcgQEAKPj4gK2NvbmZpZyBCUjJfUEFDS0FH
RV9QWVRIT05fUElQQ0wKPj4gKwlib29sICJweXRob24tcGlwY2wiCj4gCj4gSXQgZG9lcyBub3Qg
bWFrZSBzZW5zZSB0byBoYXZlIGEgQ29uZmlnLmluIG9wdGlvbiB0byBlbmFibGUgYSB0YXJnZXQK
PiBwYWNrYWdlLi4uIHdoZW4geW91IGhhdmUgbm8gdGFyZ2V0IHBhY2thZ2UuCj4gCgpJbmRlZWQs
IEkgbXVzdCBoYXZlIHRob3VnaHQgcGlwY2wgd2FzIG5lZWRlZCBvbiB0aGUgdGFyZ2V0IGluaXRp
YWxseSwgYW5kIGZvcmdvdCB0byByZW1vdmUgdGhlIG9wdGlvbiB3aGVuIEkgbWFkZSBpdCBhIGhv
c3QgcGFja2FnZS4KSSdsbCBzZW5kIGEgdjIuCgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRo
b24tcGlwY2wvcHl0aG9uLXBpcGNsLm1rIGIvcGFja2FnZS9weXRob24tcGlwY2wvcHl0aG9uLXBp
cGNsLm1rCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLmMwZTk3
ZWVlYjMKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1waXBjbC9weXRo
b24tcGlwY2wubWsKPj4gQEAgLTAsMCArMSwxNSBAQAo+PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPj4gKyMKPj4gKyMgcHl0aG9uLXBpcGNsCj4+ICsjCj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+PiArCj4+ICtQWVRIT05fUElQQ0xfVkVSU0lPTiA9IDEyCj4+ICtQWVRIT05fUElQQ0xf
U09VUkNFID0gcGlwY2wtJChQWVRIT05fUElQQ0xfVkVSU0lPTikudGFyLmd6Cj4+ICtQWVRIT05f
UElQQ0xfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy82NC8x
YS85YWIyYjI3MmRlZjlkYjljODBiZjE4ZmU4MjgyMTE5YzJjNGMwNzRjYzU0MjAzMGEyOGU0MTM2
ZGQxM2IKPj4gK1BZVEhPTl9QSVBDTF9TRVRVUF9UWVBFID0gcGVwNTE3Cj4+ICtQWVRIT05fUElQ
Q0xfTElDRU5TRSA9IEFHUEwtMy4wKwo+PiArUFlUSE9OX1BJUENMX0xJQ0VOU0VfRklMRVMgPSBD
T1BZSU5HCj4+ICtIT1NUX1BZVEhPTl9QSVBDTF9ERVBFTkRFTkNJRVMgPSBob3N0LXB5dGhvbi1w
YWNrYWdpbmcKPj4gKwo+PiArJChldmFsICQoaG9zdC1weXRob24tcGFja2FnZSkpCj4gCj4gICAg
IF5eXgo+IAo+IFNlZSBoZXJlLCB5b3UndmUgbWFkZSB0aGlzIGEgaG9zdCBvbmx5IHBhY2thZ2Uu
Cj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IFRob21hcwoKCktpbmQgcmVnYXJkcywKClJhcGhhw6ts
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
