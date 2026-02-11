Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B79EE9E2FA
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 12:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEA56610B7;
	Wed, 11 Feb 2026 12:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYifhB5avaTa; Wed, 11 Feb 2026 12:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E8A560F2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770812693;
	bh=Wi+WsAniD3lIQvXbqqHpfHqpX8Tb8OCoXf0bFp2/9rE=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jAW+Olzp9qkWcUlHCkvF2ZRGjWGtM0LNA/n2Su4iIsVoyO6SL8SOmkP5gTVOcUI1h
	 Mtje0BYLt6HSGdYGocb/eRNqga4oztSUjUKpLEYRK9gheraPTtmuh3fYvfKUZx8pEV
	 OPN5dQ0qtb6L5lbKB7ed6Dnqp4IH7OA5uVjgII5F2TVZ8rPgtqkM2LL91DgVkku0nD
	 fhngPRoSZViBMKMV/uMF+i6wDXxWc20Ib3+OZxq7bBskjQ5wKP3uryOLi7yqjDC/xy
	 mqaE/GTv7d7354cW+eQRh2WSzctEYV6hAKDvYsaeyBSrJkQYEKevomafxab3qiSaVY
	 ixNrWlg56Jhww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E8A560F2A;
	Wed, 11 Feb 2026 12:24:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 403DA23D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 12:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2228E60F2A
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 12:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5J6i9z-IZlC for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 12:24:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27F6260EE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27F6260EE6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27F6260EE6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 12:24:49 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-59dd9aef51eso9012740e87.2
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 04:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770812687; cv=none;
 d=google.com; s=arc-20240605;
 b=eVPbRzo5jMm+CTLZ6iDcO3xbR7AwpBijsXtvMaC5TnrtF1bw8ZrwcQR/Icou4PMnvo
 W+RCck6PldgJEwWDxoYxhz1bie9DdRjhc87jKKHLylOJ+nltbAkz5L7lEFQPVzunfnq2
 dUvHQWg9o4vlxOexidgGJIN/gxJrjYyug7k/zLJzKE/azKPD7p5tmd9lRechKsDyzZjY
 MTwsqnawSdDxUlNc+EXNBfSf7D04buUOtBISnZvKli+Nz2vuy8qtI+xEiaS3QjLH610+
 k4p8rVSNyID4zaDvNIXP70PcT0qv+JThR6AP6OEos8m98qP0xVPRDcdycp+U0ev2Wgdo
 ayEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HsHesoGgvxe3XmmWWNiUctiBKPyW4aUPIlfuTOLIKrg=;
 fh=3pWBXGdSiVldOzJ6ypfJcTUIWlbrikH1EIZUHFIjzuo=;
 b=TL7/xA4DGpFMnLbPUrSUJDecC6ktDh41D8+9FrPSnFtN9bcfZXvyfWWPP/CMeEI8F8
 z/BIV4uTfvS0SSzMTQrg95sTMn3bDeHn9VPArGIc1nsESyhw43t7MaKXwXyxzs42EO4K
 9Q0bZuBn1Ez6j88wQBlqPTLWptqRgLjcvujmCwEbo/RPKo/yqjjRbffjDcBduTxvfmZY
 ZJ9Clji+OMv1XVop7wkQhSd3iKRA/9j4IAVH+z5SFesQaoxdP3p78vcH1pws1k241q7X
 WZwqySJs7HpNiB8qdeYDdTQc/XDYm3VyoTburfzEjJxLf5zx/CLcxYDVBHL9Fzr0LkT0
 ALrg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770812687; x=1771417487;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HsHesoGgvxe3XmmWWNiUctiBKPyW4aUPIlfuTOLIKrg=;
 b=b3Ih5UlfP/Ie9tz0iHiqtDIfI0yMIn9yaA1rQcp3xaz5kRv5i3hDbYOTjsNrQZ7Qnv
 z+qdivW3h17Fc7TaDGc+/DA1iLU55oZsf3zv7HXG1+/9g/pcqRkP7L9e5REEf6QGDbOb
 LHIY6VDJ0wG0gvyqk6f64vqT1Wzp8a+oF+MSf/v67UikiRlVPNG6gqGGp/a0Y6MvAyPt
 t6cshv6lh6PjiZ3DV1m/zvH/NBjKIuXyiKYz09qoXXQdNxLWj2HC2yVIIZbO4JMHpMK7
 sK17hvk5deoPg0IInLpd7sCeLhTWeVTt0UvmgSBcqOln6qavbTR429SPT2K+mkdKVIpd
 tlcw==
X-Gm-Message-State: AOJu0YzVuxRQHVP5y+NUME5MTOhfzRXdHF4lASvnGxYKNSC7BtqhZs4L
 ZvTKpObQxx30BOYF+WDUck9fmPzj8aZ0aR9eEjnJ/YLj3kcLHYnkDOhWS/L4h44HfL4sOopZDFu
 H+v/X86VsOEv+ZCWL0t76DSHDuXpH6sFRcw==
X-Gm-Gg: AZuq6aJmoKZDYIqITBj8AJ4JIAf13cxr54B7At2OwA+6riIDrqqyXDSSSFCQ+tYYAOG
 OsCBLD1/Zm45suySKAUaROU7QzaBrPRQU/1PEyXS+L3cQ8qXnAApdjycreDtiq3lQd1HH6c8x8T
 o0ujUVUlg+sOV7+z6ldliE6/3kpgnI5toCFyQMcHggzmS4vS1+4jEp0CXDJVlCUtIECUOvYrcTi
 ZXyQaYJK64d/oLmQOYb2oFb/nwVIHpGO/cNzGxM67IhQCiMRQBovuGS0x7BHqcoN7BVtE5T3zuH
 0o5/TfV0Cw==
X-Received: by 2002:a05:6512:32d4:b0:59e:3c74:82e8 with SMTP id
 2adb3069b0e04-59e5e06da05mr762143e87.31.1770812687017; Wed, 11 Feb 2026
 04:24:47 -0800 (PST)
MIME-Version: 1.0
References: <20260211055138.719459-1-matthew.l.weber@gmail.com>
In-Reply-To: <20260211055138.719459-1-matthew.l.weber@gmail.com>
From: Matthew Weber <matthew.l.weber@gmail.com>
Date: Wed, 11 Feb 2026 06:24:35 -0600
X-Gm-Features: AZwV_Qjh4Fx0O2S82fuI9vZS79YfQa17OyUcGuhuBy7-t929PHCPTRsR6ZUjK34
Message-ID: <CAFt09wPMWuxLvd0FMDcoMcc3iZAQfVXt3hiqvQws0Xfwjf=Sxg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770812687; x=1771417487; darn=buildroot.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HsHesoGgvxe3XmmWWNiUctiBKPyW4aUPIlfuTOLIKrg=;
 b=IfX2+MPiXUFHPBHgFEyjDH9qhEkjcRiRWH+I0S0InB6E61ggsoGA70h/S08bA0wnJS
 IU6yQ6qBeKEpp1nNyHXlNeRjl8K2EchB6dPwHOOFx6AX0mTwq9+EDukcYmIwoGsO1tWW
 sNFCMV18aZS5E2Z3uXnl8oLZ3NvpLt6EsnD8wkgPygS9vJ3IqfToxnxhbEZIbbhxBhON
 9ukxm+jbcLyp65Z11LsYBgtVwtrxZxufn7a+BRevPALNcqDmzORNgQ58tTfsigKOnLUf
 6E27VHkBb2pzwUhHmc+JDrecwjDm55xWTFwBySdlQw0J04ybYVWPeo2zr0Nh9qAuEkxK
 ry7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IfX2+MPi
Subject: Re: [Buildroot] [PATCH] package/xen: bump to 4.21.0
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

QWxsLAoKT24gVHVlLCBGZWIgMTAsIDIwMjYgYXQgMTE6NTHigK9QTSBNYXR0aGV3IFdlYmVyCjxt
YXR0aGV3Lmwud2ViZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IFJlc29sdmVkIGluIHZlcnNpb24g
YnVtcAo+IC0gMDAwMS05cGZzLWluY2x1ZGUtbGludXgtbGltaXRzLmgtZm9yLVhBVFRSX1NJWkVf
TUFYLnBhdGNoCj4gLSAwMDAyLUZpeC1idWlsZC13aXRoLTY0LWJpdHMtdGltZV90LnBhdGNoCj4g
LSAwMDAzLWxpYnMtbGlnaHQtZml4LXR2X3NlYy1wcmludGYtZm9ybWF0LnBhdGNoCj4gLSAwMDA0
LWxpYnMtbGlnaHQtZml4LXR2X3NlYy1mcHJpbnRmLWZvcm1hdC5wYXRjaAo+IC0gMDAwNS10b29s
cy1kcm9wLWJvZ3VzLWFuZC1vYnNvbGV0ZS1wdHlmdW5jcy5tNC5wYXRjaAo+IC0gMDAwNi1Bcm02
NC1hZGp1c3QtX19pcnFfdG9fZGVzYy10by1maXgtYnVpbGQtd2l0aC1nY2MxNC5wYXRjaAo+IC0g
MDAwNy14ZW4tYXJtMzItYXZvaWQtLnJvZGF0YS10by1iZS1tYXJrZWQtYXMtZXhlY3V0YWJsZS5w
YXRjCj4gLSAwMDA4LWFybS1Bdm9pZC11c2luZy1zb2xhcmlzLXN5bnRheC1mb3ItLnNlY3Rpb24t
ZGlyZWN0aXYucGF0Y2gKPgo+IFRlc3RlZCBvbiBhIEFSTTY0IGhvc3QgbWFjaGluZSB3aXRoCj4g
ICAgICAgICB1dGlscy9kb2NrZXItcnVuIHN1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgXAo+ICAg
ICAgICAgICAgIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIgLXMgXAo+ICAgICAgICAgICAgIHRlc3Rz
LnBhY2thZ2UudGVzdF94ZW4KPgoKRm91bmQgYW4gaXNzdWUsIEknbGwga2VlcCB0ZXN0aW5nLiAg
KEkgbWFya2VkIHRoaXMgYXMgbm9uLWFwcGxpY2FibGUKaW4gcGF0Y2h3b3JrLikKCk1hdHQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
