Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95B8C624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 12:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAC5E40B0E;
	Sat,  5 Sep 2026 12:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KA0TWPRelj5z; Sat,  5 Sep 2026 12:44:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BA92240A6E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788612275;
	b=GBoEnQYCDbb82giOsE2l22NHO7UmA1C3u+lZHKNUTYmlvC3fQjOkw18qzIwO5mVL7m65
	 mZWqnJ7Qr07yCoaFA/OJho7Ayo1GzZ258tNqN1N87oBMjn2U81a2Mdjqf/49h/QNYebnj
	 G5v3+JqSmWzJ2REpymb0r1ug0T5+3iH0IZXrVaA92ib/evFnLG9alUloCy59N7DB8j0j7
	 DQkspLFfMdzyEnzmjFkleh9pXlK9l6nF4rL8n9KfphjnQTkJYFQoV9o+xmOHndrYQpkxL
	 5XJlgf3Dlc0b/WMBwwK7l3sRTBG9RthifbYo5GssNZZiw8FcxFtxfx+OyyNBJfUZMPw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788612275;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3XYZSzFOjvYB9wDPYhj2vezJtdOdgokmhA/A9/6/qdI=;
	b=FAJQ1tEwgZgK/i9k7BKxJ0cpvNJU8F2SyGRIWwM7BEf8BtfYwOd4+qO5qwYjY0NCqKAD
	 q2ivhPOptT/gKopNeICOwpyeLg5Mu+/85kq9eyM95pvmnyWRREXhGoEG/r8gk1PBLvmTL
	 3hm+QQR49qm6vl+jaICxq0euWSQyTne+7RC56MoWCwsziC1tRSh2ED4tABTUfdUzKtmJa
	 xARJTnqQjQcX1KNp1qpl3ub07l1ZaPw7jq91dWv2h3NK2BxtfBKP2/QMmSzPkPb5lv7TO
	 7TPm2WuSuPcnzgl5E4vgAUR5aRXAciHIOr0Qse/pE5hpnFj79Jf/Jwv6knXuYTznPkA==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788612275;
	bh=3XYZSzFOjvYB9wDPYhj2vezJtdOdgokmhA/A9/6/qdI=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cu4fgoW4O5Tudei7KdgKqugiAnrsaeqsLMRr8fBi0xeAV72xbZ5sCxG2P8qUo3dcH
	 DOaewPsvTGntdoCO/e+Z5JZjHj8gPNreDLF3D9xRTMiHDzlxlk7NHjBZosLCxYLQ9n
	 mQd2WKjex/6/ytKKnJqMoqpHzBhudBXEbKMGxcgPGWVf2v3h/GFW7LglF6NIGDwqAa
	 c1RV3D4ePlx9waZu9iiEU9Z1kEonSnsPyx6HTWk34mRfCkzPoXXv8cD3Ti/Nyqeq9S
	 NaulhEsRiDWIbMYEhSf8CDKnQN2ggcmGCxwPv7KBmY5+PdisFVT3ybp//N4OfE6OFn
	 9AAui2cavKvUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA92240A6E;
	Sat,  5 Sep 2026 12:44:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4966388
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA427605EA
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sK_k-OAazd7B for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 12:44:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5D89E605D2
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1788612272;
 b=peRWrgx3v2yxcQaAKnVJ+XKsffvam8jss7DNrXGWRFnFNlyqqQKVGfb5xGhb1DaFtvIO
 OvbmEpYsy4h2EzpBFaKoi6BCVHv9O5N+jj+l4xTMPJ+7SwWbryqVcT26xqU3PfWhK7p0b
 KVOhZFgzuQOJLW6MBSr9VOeuBtJHcaCo9l1B5GDMRLNqSuCsY8ZEI0MIN+NLF5WEKuBR0
 g4oPQZzE8ZPVZEIYJ6q5y2bzT8sLSMnInm291cNfuNgQAIlqyLoC04c7Xgmu5Q6rotkKr
 Vv1rasviiC3OxRgofGl9d7+5Xfwh2xG7RZC1gGLAo6p4E1YESsJpufOltErYEYq1J4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788612272;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=1ZSGGxLN2rLvFApcekoJN0s16fonCowRkum0y4qtQIo=;
 b=nBtcIEwwX3ofy9kWSWc7VTw78uPmTH2euPmBqfWyowFfwfwpSUn4jyBRtDlepjXUOq3o
 Yv7C3Mzph2uHM2oNEsESxqUThFhxDnz8NZSBtX/EjfBHJduFJSZZi43/+aiPiX5OpkVrV
 1wn7Wt2cU+4Sv57QjZlLZk+lIWdcobxVMQ8wMG3eY6DORMYtadeIXAvInofZd3qAK9usL
 cWyLduVTkTtJ5c8P9AiP++U4+jHqG4VqLacKyRzyzJveG4Xmvkkj7TiVDcDZapILOY1VD
 +sP+HEO4DWIU8aRxwGsFL30C2fh7MwgfB3Unoib0Fho4Id1ba26UC7EXrBaNynchuHw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=VLWxiHHY; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::532"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D89E605D2
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:44:32 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6a5ebf75d62so2929054a12.1
 for <buildroot@buildroot.org>; Sat, 05 Sep 2026 05:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788612270; cv=none;
 d=google.com; s=arc-20260327;
 b=At/6sXq/M2Bd86R+LMjpK5NTVoy2mmsAm5ut189gjG5WZtfL7XOYUXcsmr0YbXk4TI
 GS1qVEkVd2nxe1kovCqepVbYCE94LzKRSt7uDrxeTRol919InzEnth+Yv9KRleo9pPrn
 KK62vepP1VJa7hpgmmudkxiG2HD+pXvTT5AHdP4lh+avLzUP9lfftkGdH7emmPuYzXdv
 1yWGbry7I3CyhqKY1rvE/oIJBjob2bPgs2SU7XMLc40PQjnCrNJNncIkw2dil3owSE9Q
 mEPwYVsirwb7wdy4jTNHmw03wyjArQucsRqHq8jOjR7lr2aF702sojxOd3C5mkKZhi5t
 0SLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1ZSGGxLN2rLvFApcekoJN0s16fonCowRkum0y4qtQIo=;
 fh=eKd68SYs49y2DRZ9tDX+kqXwnVz9rB9kc8+cFSXGP9I=;
 b=qYYOclx2/V2cBTQsnkiwmdkAFjxLFOUlGDl/DQqRNzodENyu8oyS99pcENpK6I9+4a
 UotvoRU+1ZOrA3JeHXquZLIgvX3QjuLjWUrKF64aZ9V1r+j67mLSWKBAKsmkzZ8/pR3o
 3DUxS0rZGsG/+GY08Pf3OZ145WxSG+HOOehJomvm9+wTnW0CnYZTIcd/7nO1apFzyYZ7
 JjOKmJq/XUMXonpnnB+7RfBROGMIYIJ+UDXwfvwMFxl+iwB/errMNTAmNzwtYB8WVvP+
 xxI4qzQQ1IW8gVNftAOrgZdDnOr513SNCqfeXdgfFRPRbmf3K0VXopHE1eSzy1SFkMrd
 uYuw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788612270; x=1789217070;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1ZSGGxLN2rLvFApcekoJN0s16fonCowRkum0y4qtQIo=;
 b=BiIrBUYsSNQjLq9bc0YZllSpPGgSQeu4qWWW//qmxHt7xDtPr2STMOcl76b130ouhk
 i3w5oN6NS5SLdujnlaEkjbWbmexCuRiKo7L5FpuAWBcrU3K/gVjeIyOo06prTvTlDbmk
 xBQmHqp8YsXJwaBUHHiXYEBEwIveN2aGLe8ELwf3/0kNsldIsYv+frvNwryNRoKGcMMT
 M214+LRQKMVrhCvKkj3kcpkrmxNlmYGEs0VmkLvQP2WLQ6wBdban7m1j8g/DEGw3QlIL
 hsW7sFYZnxC2RMuoPrvpLpTkIaXM7/OeOPIrWOZi4satl2InzBFaLTjHp7NaZP/AqtLO
 m44w==
X-Gm-Message-State: AFuF++maMRsl8EXlNOgA0LeJbYhitVkl5shKnK+MI5NXtrX0wQbGyLuf
 6xxz3SVbQGBgum0ddiZw9cWHJwo4pcdRulVne7NqWFe3Vyrh5+idD54UoQ5iBS2x/+aZ0+1qnA9
 TWYyDOF5nImoeSXUCnij1TE6k0LR6zkPz107/5Ow=
X-Gm-Gg: AYBFou32TPzdkIV1m1tQ1/xHb9CklsRnw+kFSFl7PVzlIj1Aj3g2OVQPc69qU9NzhmE
 ydHBBlGCAAY+XYnTXYNeC90QxBsN2gWKMZRmhdM7mTPe8doZc7gLnhCApp2UP1m8btbGJVmpfpX
 vFuHMhsWJuiQc6yM61QCr6f8IxU1S/RCiL6TU/i74DEOF0wHGqpzSwxzpvNQkk1TrKIt7uW5Zy1
 xWDfFbc/Bl8KCq9cGgCPv43CmyRL/3MqcyMS0aqt+smlfa0BI07Uq+UcyC9OasdhAiW1It70OAa
 eiBzo2FmdOmY00VltN089CYzOmMH9QantvqgOmdFOQ==
X-Received: by 2002:a05:6402:540e:b0:6a3:5685:703 with SMTP id
 4fb4d7f45d1cf-6a7e90ce914mr4002768a12.3.1788612269579; Sat, 05 Sep 2026
 05:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260905122040.2054789-1-bernd@kuhls.net>
 <20260905122040.2054789-4-bernd@kuhls.net>
In-Reply-To: <20260905122040.2054789-4-bernd@kuhls.net>
Date: Sat, 5 Sep 2026 14:44:15 +0200
X-Gm-Features: AcwNN1XPN9ddWpoZqP15miReX8KhaanlCucjk9_3TdlkOIb4VCV7icqEw0WJ5lg
Message-ID: <CAGm1_ksF6YVLV80CNbgvSZKMOdbGevR+e1+77C9+OmPYSRyDBQ@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Daniel Sangue <daniel.sangue@sangue.ch>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Pierre Floury <pierre.floury@gmail.com>
Subject: Re: [Buildroot] [PATCH 4/7] package/libftdi1: fix build with swig
 >= 4.5.0
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgNSwgMjAyNiBhdCAyOjIx4oCvUE0gQmVybmQgS3VobHMgPGJlcm5kQGt1aGxz
Lm5ldD4gd3JvdGU6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMu
bmV0PgoKUmV2aWV3ZWQtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWls
LmNvbT4KCj4gLS0tCj4gIC4uLi8wMDAxLXB5dGhvbi11cGRhdGUtZm9yLVNXSUctNC41LnBhdGNo
ICAgICB8IDQ4ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZnRkaTEvMDAwMS1weXRo
b24tdXBkYXRlLWZvci1TV0lHLTQuNS5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGli
ZnRkaTEvMDAwMS1weXRob24tdXBkYXRlLWZvci1TV0lHLTQuNS5wYXRjaCBiL3BhY2thZ2UvbGli
ZnRkaTEvMDAwMS1weXRob24tdXBkYXRlLWZvci1TV0lHLTQuNS5wYXRjaAo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNDUyMWVhOGU0YQo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9wYWNrYWdlL2xpYmZ0ZGkxLzAwMDEtcHl0aG9uLXVwZGF0ZS1mb3ItU1dJRy00LjUu
cGF0Y2gKPiBAQCAtMCwwICsxLDQ4IEBACj4gK0Zyb20gNmM5NjU0NjMyMjNlYTQ2ZDBiN2FlMjI1
ODZjYWRjMTUwZjcxOWY4NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogSml0a2Eg
UGxlc25pa292YSA8anBsZXNuaWtAcmVkaGF0LmNvbT4KPiArRGF0ZTogVHVlLCAxMSBBdWcgMjAy
NiAxMzo1NTo1OCArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHB5dGhvbjogdXBkYXRlIGZvciBT
V0lHIDQuNQo+ICsKPiArU1dJRyA0LjUuMCByZW1vdmVkIFB5dGhvbiAyIGNvbXBhdGliaWxpdHkg
bWFjcm9zIChQeUludF8sIFB5U3RyaW5nXywgU1dJR19QeXRob25fc3RyXyopCj4gK2Zyb20gaXRz
IHJ1bnRpbWUgaGVhZGVyIHB5aGVhZC5zd2cgKHNlZSBjb21taXQgWzFdKS4gVGhlc2UgbWFjcm9z
IG1hcHBlZCBvbGQgUHl0aG9uIDIKPiArQyBBUEkgbmFtZXMgdG8gdGhlaXIgUHl0aG9uIDMgZXF1
aXZhbGVudHMuIFBhY2thZ2VzIHRoYXQgcmVmZXJlbmNlIHRoZW0gaW4gY3VzdG9tIFNXSUcKPiAr
dHlwZW1hcHMgb3IgcHJlLWdlbmVyYXRlZCB3cmFwcGVyIGNvZGUgbm93IGZhaWwgdG8gY29tcGls
ZS4KPiArCj4gK1RoaXMgcGF0Y2ggcmVwbGFjZXMgYWxsIG9jY3VycmVuY2VzIHdpdGggdGhlIGNv
cnJlc3BvbmRpbmcgUHl0aG9uIDMgQyBBUEkgZnVuY3Rpb25zLgo+ICtUaGUgcmVwbGFjZW1lbnRz
IGFyZSBzYWZlIHNpbmNlIHRoZSBtYWNyb3Mgd2VyZSBhbHJlYWR5IGFsaWFzZWQgdG8gdGhlc2Ug
ZXhhY3QgZnVuY3Rpb25zCj4gK2luIFNXSUcncyBQeXRob24gMyBjb2RlIHBhdGguCj4gKwo+ICtb
MV0gaHR0cHM6Ly9naXRodWIuY29tL3N3aWcvc3dpZy9jb21taXQvNzlmN2EyYjdjYjdkZGMyNTZl
YmEwOWM4NzcwMTMzMTQ4MDI1MTcxZAo+ICsKPiArVXBzdHJlYW06IGh0dHA6Ly9kZXZlbG9wZXIu
aW50cmEybmV0LmNvbS9tYWlsYXJjaGl2ZS9odG1sL2xpYmZ0ZGkvMjAyNi9tc2cwMDAxMi5odG1s
Cj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+ICst
LS0KPiArIHB5dGhvbi9mdGRpMS5pIHwgNCArKy0tCj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL3B5dGhvbi9mdGRp
MS5pIGIvcHl0aG9uL2Z0ZGkxLmkKPiAraW5kZXggZmFjNGQxNi4uMzFlMTdjNiAxMDA2NDQKPiAr
LS0tIGEvcHl0aG9uL2Z0ZGkxLmkKPiArKysrIGIvcHl0aG9uL2Z0ZGkxLmkKPiArQEAgLTkxLDcg
KzkxLDcgQEAgY2hhciAqIHN0cjJjaGFycF9zaXplKFB5T2JqZWN0KiBweU9iaiwgaW50ICogc2l6
ZSkKPiArICJyZWFkX2RhdGEoY29udGV4dCkgLT4gKHJldHVybl9jb2RlLCBidWYpIgo+ICsgJWVu
ZGRlZgo+ICsgJWZlYXR1cmUoImF1dG9kb2MiLCBmdGRpX3JlYWRfZGF0YV9kb2NzdHJpbmcpIGZ0
ZGlfcmVhZF9kYXRhOwo+ICstJXR5cGVtYXAoaW4sbnVtaW5wdXRzPTEpICh1bnNpZ25lZCBjaGFy
ICpidWYsIGludCBzaXplKSAleyAkMiA9IFB5SW50X0FzTG9uZygkaW5wdXQpOyQxID0gKHVuc2ln
bmVkIGNoYXIqKW1hbGxvYygkMipzaXplb2YoY2hhcikpOyAlfQo+ICsrJXR5cGVtYXAoaW4sbnVt
aW5wdXRzPTEpICh1bnNpZ25lZCBjaGFyICpidWYsIGludCBzaXplKSAleyAkMiA9IFB5TG9uZ19B
c0xvbmcoJGlucHV0KTskMSA9ICh1bnNpZ25lZCBjaGFyKiltYWxsb2MoJDIqc2l6ZW9mKGNoYXIp
KTsgJX0KPiArICV0eXBlbWFwKGFyZ291dCxub2Jsb2NrPTEpICh1bnNpZ25lZCBjaGFyICpidWYs
IGludCBzaXplKSB7Cj4gKyAgICAgICAgIGlmKHJlc3VsdDwwKQo+ICsgICAgICAgICAgICAgICAg
ICQyPTA7Cj4gK0BAIC0xMzYsNyArMTM2LDcgQEAgY2hhciAqIHN0cjJjaGFycF9zaXplKFB5T2Jq
ZWN0KiBweU9iaiwgaW50ICogc2l6ZSkKPiArICAgICBpbnQgZnRkaV9nZXRfZWVwcm9tX3ZhbHVl
KHN0cnVjdCBmdGRpX2NvbnRleHQgKmZ0ZGksIGVudW0gZnRkaV9lZXByb21fdmFsdWUgdmFsdWVf
bmFtZSwgaW50KiB2YWx1ZSk7Cj4gKyAlY2xlYXIgaW50KiB2YWx1ZTsKPiArCj4gKy0ldHlwZW1h
cChpbixudW1pbnB1dHM9MSkgKHVuc2lnbmVkIGNoYXIgKmJ1ZiwgaW50IHNpemUpICV7ICQyID0g
UHlJbnRfQXNMb25nKCRpbnB1dCk7JDEgPSAodW5zaWduZWQgY2hhciopbWFsbG9jKCQyKnNpemVv
ZihjaGFyKSk7ICV9Cj4gKysldHlwZW1hcChpbixudW1pbnB1dHM9MSkgKHVuc2lnbmVkIGNoYXIg
KmJ1ZiwgaW50IHNpemUpICV7ICQyID0gUHlMb25nX0FzTG9uZygkaW5wdXQpOyQxID0gKHVuc2ln
bmVkIGNoYXIqKW1hbGxvYygkMipzaXplb2YoY2hhcikpOyAlfQo+ICsgJXR5cGVtYXAoYXJnb3V0
LG5vYmxvY2s9MSkgKHVuc2lnbmVkIGNoYXIgKmJ1ZiwgaW50IHNpemUpIHsKPiArICAgICAgICAg
aWYocmVzdWx0PDApCj4gKyAgICAgICAgICAgICAgICAgJDI9MDsKPiArLS0KPiArMi41NS4wCj4g
Kwo+IC0tCj4gMi40Ny4zCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
