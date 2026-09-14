Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497EBC88E6F
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 20:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA410403D8;
	Mon, 14 Sep 2026 20:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2-hwDwI6huf; Mon, 14 Sep 2026 20:19:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0431F402E7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789417191;
	b=ozjVjJhpYaomo9UtFqbH1s7cBJr1Gt1KUp+BzwDF9y8zVcZ4Ax4o7KFao1fcwgRBN/6V
	 vQjNydNdbvNqQfrpJ91Klz+3FALf8mV8cz552X4inWi7QqGCerWgaSV3nQi2i/4uIW2Lw
	 NGrxpLIQhwqYgXiMhX+nwqgM2FdCPIsSL8uHIFoIAB2vQNG7Ue68bwAGe7dyILE4ve9QU
	 6TOMiPkcF94uO3bR8Vn2PqgUsROFR8NQAExkUGYTXpTMstZ6eSAOLNZAUcK+H+g4dgyHd
	 k2h4UMquEzvX3AhdeS9GCouVE5H9V7HOE7Ndj90kZhIszlmomMqNJVGdnc1zUEIFdug==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789417191;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=JRI3BUcZB+LKn1F6BgCgRN/8BterF0UkEmmpnjARqKs=;
	b=rkt8patcuWa3myQoFTkeSCpnaXw20CDmKsfhLm5UiNV19Sit8Rct1Wt/w9xhRGgSJU0m
	 mj4FnAfpQ6Pbq1Iw4hLfRSbqKi4Qrjs6dCQkh3LSPIFSYzqc89Dr5i/PLLf+lZJx406Fn
	 32TnRruLVArYlthk0k6mBnwYEA9miGWmVz4Bn93fzabIvKEjaZAcOlnDN0Qa3qUrNZ3ed
	 oOhO1yNQit194XtXyI1Rp20k6rVzAstpTdAVEI+bC1DAY/x5FsgY0jW3hsw+t0/LL9DOR
	 1sQ95SpVHVms/9y8LunI4Bpy3hzTyVGet/ocX3RJhp6lkZGeZKNwVnPwK8tfsYqNd4w==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; dmarc=none header.from=j-ernberg.se;
	dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=q0nrxYhp;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789417191;
	bh=JRI3BUcZB+LKn1F6BgCgRN/8BterF0UkEmmpnjARqKs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IX+x/MB03QAkF6lCR4C0eknZtau5f1Q25ilyGIAmRmMP8y163yG2wUSMx6B50AnP9
	 l1VIo5f97qZlGM7JUJKdewdsw4HHB69im/Hjv+uBMlPV+peS2usRMMk8jQNGh9D2p5
	 d8cQ7nUWg3+ra5KdwdtTwLTNE/q7D2FMiCTulUECTSSBaerwb2Vex/Oq5ALnLvosNO
	 Nch14Iotbn5ACZeWp+1w4ok3PHHAW8YBXD9toQJRQvk600nknhZe0C2lwo7Iuygt5o
	 ZlEY80DxLkV3cWxW+WBtwsBKmuaG/glYRbidCx5jX646/hBcI3PAN3qGr+7QgsehmU
	 ytq5fXNcsUOAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0431F402E7;
	Mon, 14 Sep 2026 20:19:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3A9E2E5
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 20:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95C5C402E7
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 20:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EljSvAGrHOrR for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 20:19:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 999E8402E6
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789417188;
 b=pmTDxEaAv4Zw3XhM6LK24agqr+53QIuysKkLbeRo4WoZWP1i6d0kUb+sQAd+yBoVBbU+
 AyYM5UB0AqZASr6rC0edlGOlRuG/I05cuavzy8nZCCw+7Sj2ib0UDlAkRh+N3ffDigsHp
 Itxy6eN6p6ToxAqtU/nErZN3NSpw22KRMh7xnG/AGdbYtUs9OmGpQM/r4tsk3Qqw9VGdd
 3DLg1Ge9VJCb5BrJgJfcX4JBXFcI5tozwG5BbzvLOESogJGBHW9CPTYas1AF2vrQjFB/I
 GUi4z8wWzKvH2Ff68C36yGs33MN3BOxnzsfvuHyVaNDRFB5x5FKiB2TTY2I98nRSD9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789417188;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=OK36yl51ZK5Q837AmgTqEu9FlWuFBSNNVto62DAIMPs=;
 b=Sj7qDxQOmcBtOAUOyJQTCMr+SeGUbPSQS/mg1PkNJ9vM/VlJ/kXPE26BUs6WSsQKu6I+
 RAr9+eY56sgb/AJP8HSbyOMFr/lv1C99BCr0HQQ4QT1dkMgI4fUaD7+8LQAjXw3rMqEcI
 JUItxQjK4Lye4KdBF37n2PRS/tluXglJ1RhpQTzH5s14lhNIrC64rQNPyuRnX8UHu9Xsp
 9khEC92JhHz+UXdJ4HoRivmDcRwz/yCc+TnW2vyDXmg1dvpY4My0ZtyZkk9XzYCimoC8m
 asDUGZmg9ukn+siIiLkRofsjEbCBJSyZJCn/C/Tb0LQzATaOfT6Ia3uQjzmUZSjAXvg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=none header.from=j-ernberg.se; 
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=q0nrxYhp; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::430"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=q0nrxYhp
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 999E8402E6
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 20:19:46 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-86a25369f16so2938561b3a.3
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 13:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789417185; cv=none;
 d=google.com; s=arc-20260327;
 b=HMg6cjn0U3z0fDB8V2m1joG+1SnE+WyYTYcK/xWint2VquDcxrTTNIAW+Aa2Iv/YCG
 P7kmIgFel+9JC1/FP+wolOhemdR8s1rUdDf4OLzHmzzFO9d94+nCDYyC7coVZ1SzboW8
 qrFKkYhkofPVqKi/IjtVLvk51PWfILiyN8CH0yHnwWPi0XbBW4hV99FIcUMjGS/pVyLE
 KfS8h6xwgSKGlvGy5IC5fzI47jQFs++5+3cPCkz7hNWKRT1Uv0x3wzxXv9JjJbgTF6Wb
 RFGGqhGuVgINNldSISU0+nrCDyCzbs7Ec3qC/V7ftLgAn0cBR3hOBSIdQl0ZHmsfVwx9
 9VNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OK36yl51ZK5Q837AmgTqEu9FlWuFBSNNVto62DAIMPs=;
 fh=GJIYKAxGu+j1ubKhbaDgs0nkVYK43SKlCYTnngGfoDs=;
 b=n+WZZ4+p/htanxT+oiHgSgH67xuHiIvFnLqvSjYSAWNUDDyuDwMaVVRYYx59U7D3Iy
 Bb+JC9xDi9wmX5B5tEAEAQMsHdmaNwTch5/q2WIfUbo1ddWA9e1Z2FIrbyMlAZUF/NNO
 DomUTeWuXv8srwqMTmobAI/XPeDGsXh8+wC9hB5dZM8Ngk/qiBTPCzFvBDhoeZJSO6hS
 8xeRYJVySFHW45o/KzHdLlwRR1AxlzFVhk8BNWpQAWlJQmtBih6PQfO+oliVY/FOjmW8
 2gwSMYFzBN3iECh5QOfcM5BzlfvmRDno35VsfBrqvWp4BLe/rbozl6IC2r1Mg/VCtSDd
 Sl2A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1789417185; x=1790021985;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OK36yl51ZK5Q837AmgTqEu9FlWuFBSNNVto62DAIMPs=;
 b=q0nrxYhpnWfRg+cLn2TNb0dNlOIWd3tZ08JooayNX8FJ+VzVSvWznS4cwIq6TnThKK
 NZW83tpvuQCDX2bNtDkcs4VSNnBHsae4jV9V+ulnOteINrk+EyicDLhOZl6XyCpJ+6On
 zg+fohKU7r4s5FSmarTns+gH1XVM4X0p+ECSgFBP8sU9oh8r1llyiU84SXStxpkMsku5
 Lf/WFbMYALwHdZD6uYI5eAxgM2nuL5PtO/04hOjPQr/H9zsWR7dtxzpjX27aDvqDGvHo
 zJh9ww9hIzHWPL7IahEoi7HkxIoCHtxAOcfNdQo3DV/+Cw/L+4pmhA7RUnqVht+e613T
 tblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789417185; x=1790021985;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OK36yl51ZK5Q837AmgTqEu9FlWuFBSNNVto62DAIMPs=;
 b=dChDetaXNbZoQIII6rLccLNyY9hYk6BjbHIdAPjPyKfc7jH07PXqhE3ReYPcmz5V4V
 wrRD3rm1bVUYaJ9V7Dsh03f+6B/ojlr/3vu4O+UZGSxciHx9psYwa8voeqPcGOTGt0Cf
 Tm3N7AeXos0sOwcqPpQj5qBFtRfy+X+6T5AnZ8b5X1gPz/hQEQY3wRyNuNMlJNJ1NKcs
 IAEcINV0Bf1fydmSwnsZzWjvcSDAiRr8zRaQXdkKb9Y1cxOSROf5EYVQKPjufo0+hXdL
 LzrHfv6FBmyscJ8NzWBYiucPhTYuvNBmQZ5ddt7YQNZli/vGiHmyyBLsgT1+LRdoqoA+
 gv5g==
X-Gm-Message-State: AFuF++kykcwHEoB5eoNIX81UHPNL/OrkHrfUA6Pamsiv2cmNoyKl1sR1
 DcXMu6xxuyb/cqr9vx/eXboSVymaYyzTUNN7stlfeiGIioICyDDLMzhXZIRrRRBH7Cc3D/p9rT/
 931oD0IvsbjoqyZVeCB7iwZgKNPDGwdHpr2uAhcqNig==
X-Gm-Gg: AYBFou1RmN5hezyYSkY4IfHL3ine0tDVocDt+sFnpKFNALqiMTY8JnZFP4+zDjyYfZQ
 cwUZeztTcZ7ZbO39mAah+Qz4d4HPd4wwNzOxq8BfuvREQJyzFdhNVz7fr9x/auVmcslmdwIOw8H
 DvoToWx/aPWQKF2B/BYgcYi/coMKwS+tiH7r7hY/0xzvcnUDsEoRw5MwzJQtq4FdMKXrjreU8ts
 YJWlntKaK8PKMQqtuzXpER+0QBAY9JY/VKBWnJD2Sqf5FtzTr8beF0PGErEAqGpKDTmiTY2axxA
 WEmTDYXMokr/udsM8RELT8nj2/JWEtlO7Um9Jw8/j1V9Pt92+T+I0ZYAIubSVD/QcxHkMb325CI
 4RSZUeGIeC7bLsxZOuWAZsp27G0LCLWg5nf/1FNR2zg==
X-Received: by 2002:a05:6a20:3952:b0:3da:15a9:a18e with SMTP id
 adf61e73a8af0-3db4059677bmr8549958637.23.1789417185084; Mon, 14 Sep 2026
 13:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260803140815.617446-1-aford173@gmail.com>
 <CAAHg4ZjzukzO4RMSkgjkzORsV5zS05mjq-En03ny8mpxUbsgeQ@mail.gmail.com>
 <CAHCN7xJjR7tsaFBNGkxkk2orOC5srBuXW0S5mL4rdVSY+BY-HQ@mail.gmail.com>
In-Reply-To: <CAHCN7xJjR7tsaFBNGkxkk2orOC5srBuXW0S5mL4rdVSY+BY-HQ@mail.gmail.com>
From: John Ernberg <j@j-ernberg.se>
Date: Mon, 14 Sep 2026 22:19:34 +0200
X-Gm-Features: AcwNN1Uc5qvTlav1hDy0g2PCD3gKiWyMrlTVbfswRCCfoxR3oyK8mWMlrA8yjKc
Message-ID: <CAAHg4ZhWT-zWmAsfY2cHfav9q33wFDotDMi+itg9rvhbZxpq_A@mail.gmail.com>
To: Adam Ford <aford173@gmail.com>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>
Subject: Re: [Buildroot] [PATCH V2] package/x11r7/xwayland: fix glamor DRI
 ordering dependency on mesa3d
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

SGkgQWRhbSwKCk9uIFR1ZSwgQXVnIDExLCAyMDI2IGF0IDk6MTPigK9QTSBBZGFtIEZvcmQgPGFm
b3JkMTczQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gU3VuLCBBdWcgOSwgMjAyNiBhdCAx
Mjo0NOKAr1BNIEpvaG4gRXJuYmVyZyA8akBqLWVybmJlcmcuc2U+IHdyb3RlOgo+Pgo+PiBIaSBB
ZGFtLAo+Pgo+PiBBcG9sb2dpZXMgZm9yIHRoZSBkZWxheS4KPj4KPj4gT24gTW9uLCBBdWcgMywg
MjAyNiBhdCA0OjA44oCvUE0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlOgo+
PiA+Cj4+ID4gWHdheWxhbmQncyBnbGFtb3Igc3VwcG9ydCBlbmFibGVzIGEgRFJJIGNvbmZpZ3Vy
ZSBjaGVjayB0aGF0IGxvb2tzIGZvcgo+PiA+IE1lc2EncyBkcmkucGMgaW4gc3RhZ2luZy4gV2l0
aG91dCBhbiBleHBsaWNpdCBvcmRlcmluZyBkZXBlbmRlbmN5LCBhCj4+ID4gaGlnaGx5IHBhcmFs
bGVsIGJ1aWxkIGNhbiBydW4gWHdheWxhbmQncyBjb25maWd1cmUgYmVmb3JlIG1lc2EzZCBpcwo+
PiA+IGluc3RhbGxlZCwgZmFpbGluZyB3aXRoOgo+PiA+Cj4+ID4gICAgIEVSUk9SOiBEZXBlbmRl
bmN5ICJkcmkiIG5vdCBmb3VuZAo+PiA+Cj4+ID4gU2luY2UgbWVzYTNkIGlzIHdoYXQgcHJvdmlk
ZXMgdGhlIERSSS9FR0wvR0JNIGJpdHMgZ2xhbW9yIHJlbGllcyBvbiwgZm9sZAo+PiA+IGl0IGlu
dG8gdGhlIGdsYW1vciBjb25kaXRpb246IG9ubHkgZW5hYmxlIC1EZ2xhbW9yPXRydWUgYW5kIGFk
ZCBpdCB0byB0aGUKPj4gPiBkZXBlbmRlbmNpZXMgYWxvbmdzaWRlIGxpYmVwb3h5Lgo+PiA+Cj4+
ID4gU2lnbmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+Cj4+ID4KPj4g
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS94MTFyNy94d2F5bGFuZC94d2F5bGFuZC5tayBiL3BhY2th
Z2UveDExcjcveHdheWxhbmQveHdheWxhbmQubWsKPj4gPiBpbmRleCAwMmEyMWI5NmMxLi4zYmQ4
N2E0NTUyIDEwMDY0NAo+PiA+IC0tLSBhL3BhY2thZ2UveDExcjcveHdheWxhbmQveHdheWxhbmQu
bWsKPj4gPiArKysgYi9wYWNrYWdlL3gxMXI3L3h3YXlsYW5kL3h3YXlsYW5kLm1rCj4+ID4gQEAg
LTMyLDcgKzMyLDcgQEAgWFdBWUxBTkRfQ09ORl9PUFRTID0gXAo+PiA+Cj4+ID4gIGlmZXEgKCQo
QlIyX1BBQ0tBR0VfSEFTX0xJQkVHTCkkKEJSMl9QQUNLQUdFX0xJQkVQT1hZKSx5eSkKPj4gPiAg
WFdBWUxBTkRfQ09ORl9PUFRTICs9IC1EZ2xhbW9yPXRydWUKPj4gPiAtWFdBWUxBTkRfREVQRU5E
RU5DSUVTICs9IGxpYmVwb3h5Cj4+ID4gK1hXQVlMQU5EX0RFUEVOREVOQ0lFUyArPSBsaWJlcG94
eSBtZXNhM2QKPj4gPiAgZWxzZQo+PiA+ICBYV0FZTEFORF9DT05GX09QVFMgKz0gLURnbGFtb3I9
ZmFsc2UKPj4gPiAgZW5kaWYKPj4gPiAtLQo+PiA+IDIuNTMuMAo+PiA+Cj4+Cj4+IGRyaSBpcyBu
ZWVkZWQgYnkgZ2x4LCBub3QgZ2xhbW9yLCB3aGVuIGNoZWNraW5nIHRoZSBjb2RlLiBEaWQgeW91
IHRlc3QKPj4gYnVpbGQgdGhpcz8KPj4KPj4gKGl0J3MgZWFzaWVyIHRvIHJlcHJvZHVjZSB3aXRo
IGEgcGVyLXBhY2thZ2UgYnVpbGQgd2hlcmUgdGhpcyBiZWNvbWVzCj4+IGEgcGVyc2lzdGVudCBm
YWlsdXJlIHJhdGhlciB0aGFuIHJhbmRvbSkKPgo+Cj4gSSB0ZXN0LWJ1aWx0IHRoaXMgd2l0aCBw
ZXItcGFja2FnZSBlbmFibGVkLCBhbmQgaXQgd29ya2VkLCBidXQgSSBvbmx5IGhhdmUgTWVzYSBw
cm92aWRpbmcgbGliZ2wgYXMgaW4gbXkgYnVpbGQgc2NlbmFyaW8sIEkgYW0gdXNpbmcgZWl0aGVy
IEludGVsIG9yIEFNREdQVS4KPgo+Pgo+Pgo+PiBJdCBzaG91bGQgZ28gdG8gdGhlIExJQkdMIGNo
ZWNrIHJhdGhlciB0aGFuIHRoZSBMSUIqRSpHTCBjaGVjay4gQnV0IGFzCj4+IEkgbWVudGlvbmVk
IG9uIHYxLCB5b3UgcHJvYmFibHkgbmVlZCB0byBjaGVjayBob3cgdGhpcyB3b3JrcyB3aGVuCj4+
IG52aWRpYS1kcml2ZXIgaXMgdGhlIExJQkdMIHByb3ZpZGVyLgo+Cj4KPiBJJ2xsIGRpZyBhIGJp
dCBmdXJ0aGVyIGludG8gdGhpcy4KPgo+IGFkYW0KCkkgbWFuYWdlZCB0byBkaWcgYSBiaXQgbXlz
ZWxmICh0b29rIG11Y2ggbG9uZ2VyIHRoYW4gYW50aWNpcGF0ZWQpLAphZnRlciBJIG1hbmFnZWQg
dG8gYnVpbGQgdGhlIG52aWRpYSBkcml2ZXIgZnJvbSAyMDI1LjAyLnggYnJhbmNoIEkgY2FuCmNv
bmNsdWRlIHRoYXQgaXQgZGVwZW5kcyBvbiBtZXNhM2QtaGVhZGVycywgd2hpY2ggYWxzbyBwcm92
aWRlIGEKZHJpLnBjIGZpbGUgKG1hbnVhbGx5KS4KCkkgaGF2ZW4ndCBkdWcgaW50byB0aGUgZGVw
ZW5kZW5jeSB0cmVlLCBidXQgeHNlcnZlciAvIHh3YXlsYW5kIGJ1aWxkcwpmaW5lIGJlY2F1c2Ug
dGhlIGRyaS5wYyBmcm9tIG1lc2EzZC1oZWFkZXJzIHByb3BhZ2F0ZXMgY29ycmVjdGx5LiBJCmRp
ZCBub3RpY2UgdGhhdCBtZXNhM2QtaGVhZGVycyBhbmQgbWVzYTNkIGNvbmZsaWN0LCBzbyBhZGRp
bmcgYQpkZXBlbmRpbmcgb24gbWVzYTNkIGlmIHRoZSBudmlkaWEtZHJpdmVyIGlzIHVzZWQgaXMg
YnJva2VuLgoKVGhlIGVhc2llc3Qgd2F5IHRvIGRlYWwgd2l0aCBpdCBpcyBwcm9iYWJseSB0byBh
ZGQgdGhlIG1lc2EzZApkZXBlbmRlbmN5IGlmIG1lc2EzZCBpcyBiZWluZyBidWlsdCwgb3RoZXJ3
aXNlIHRoZSBtZXNhM2QtaGVhZGVycwpkZXBlbmRlbmN5IGlmIG1lc2EzZC1oZWFkZXJzIGFyZSBi
ZWluZyBidWlsdC4KCkJlc3QgcmVnYXJkcyAvLyBKb2huIEVybmJlcmcKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
