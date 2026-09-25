Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E619C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC8ED810D1;
	Fri, 25 Sep 2026 14:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9MxJN7V5xIW; Fri, 25 Sep 2026 14:44:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D3908811AE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347478;
	b=GnLfsXnROJ9AoH4neBc6Dyg7+y1sndnW5m3MFCXtyRhezMF8OQP9WNzo34JXk2GaFznS
	 VqitkKMSdDRX5XCLKBMfKdjdBdKnH+Mt40KKXLUS72Pi5KEt/ZKbCcFuUc0LBLcVxWhTj
	 Y/SLJElNoUBkLHmrz6VzrMYlA+KwvN/kx2FHfqJXqQt14Da33+77SSCQYGdTH9jmJGiJm
	 qwVrGRQ5879q4q4Eagqtv/8XkSSumlEWT2tju1i05OtySvwEbmamFh4Io2ArzeOUeYqKG
	 N10wX03GxqNxbKaPRJx8QtUOBot78EHaSW1qSvlTW6MfeIRpXLleflbLYxgmGBdv9cA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347478;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CR1yvoYhMU+tMzyBi/kLP5aOKtaVwxNne4Cc8Hcolw0=;
	b=UqyDowlgn8chs9w/SLQFh0lStAZ6iZTDUMEVSbZ8WZ0j3EDXMWFJC1JmZ8kl6cQuYisC
	 D7ch3xMjMa4mAjZymnvUKerShTdk4o89b80jHlCTXHWmoB873FjW8uOlCgPZ76rXE2LJn
	 /QUConIXqUBC0SIl11jPH2IEi8ZWbmo5/uFSN9ExYf5T/IU0502S4nQrrNjfUnIT70bNU
	 yKL1Z53HqrhKmPSmQhj4bccXCuZKhAQk/yPZ5irJFmLAmx773QvS+48MPpQqQw1kA/Osv
	 SfeRiyAY6XWgj/Q9rUe5qf0quDXrEwbpxxXBhzGuOIle0kkm+r2bH9nV2vA/kfH+x7g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347477;
	bh=CR1yvoYhMU+tMzyBi/kLP5aOKtaVwxNne4Cc8Hcolw0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qEaZpoDDjppv9XEP9lH8KR0bwmN2TOBBG3iiiUnFB+f+zxf9L+MKnXMQckLJs0MKl
	 ToaIxVo4zDhLOda/LtEgCjbfnshs/E9CIeRHnw3B/JFUgV6puNIhDsAb12RsUXNYil
	 Zj48YuYuSBhDTCKFbe7S5ktDbGfbC7wZ5pMgtv80p9ztaBYKGzH3TLM1VS6SHUFXZ4
	 pDw1O8jqYNQ4226Z0ov35DnDy4wBfAYOFoBRE2FMPPlwBrPFoXeYfNQVww7BPiyILS
	 mwliix10kAMLilP+zLIxvWnGz6B5bhXLBmcYutQigBp0UZkhjdMw46KCS9dNkkTUFA
	 e/KbCZxSAO4EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3908811AE;
	Fri, 25 Sep 2026 14:44:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 061C4334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC4E760D7A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORbfmdXOEl2d for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D43E760D90
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347475;
 b=Q6G248sb+dgfaccrlKvjM+n99IwJHpTEndnK1YGWMNsX39mPVX7lCLhZWfMdluAUur1r
 X9l4Fw6xl7RgxIvQY11sBxJJkXD+5xgU62UnbUFRcoZVla2eLzJ581XH6o8lYAd31avmw
 m6GEJRCYlSBxNXYYtGJClBybOUrCd10l4/JfWB4iUnsGVTHgMi3XkSgTapq8AbBo9cYeO
 OpNQb220PtAi/BwMUFqP1Zr1lUUvxydXC7YRLkD9e5XFswP8iDru0DVGNciCKHu0xl7eG
 7yuKDP3SujfG9097UeERnqBXBVNHLblwFushpK873vTp4oHmF0av/PZnZrICP33CuGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347475;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=YsVKP6aZtgRgrzkcyLJ+FOMnYB5W8fovZAOL55oeW8w=;
 b=jhMAcNPTTDYxIWoC2dqh/wGjchnbaEXRjU9qg7Lm294d9fbWiDALtTa2cfC9HtgPuIeC
 GZxog7GfHDp5qFQH5MEshnwJk6s0QxfVCzo4wiaqDE3YsuzPsyyxwQPPhuVKe97oaKkvk
 +LGdgFRhgtv8i+mCnNGmhCPHiAp+O8UQfnAB8Jw6YEI4T8Bt885MAVlj644TrgR8uvouc
 6n1jnhaieJCv0+G5Ak77imTa9D9I370ZRr5Cr7zQMXdkfIAzpGB6IsQyQGoI0A9roske5
 nghsugrcLYFCirqNLiJDYZVuNj3pmzwm00+Cem9zUiSrO2SvAnRq5GSM3vglUsDIjdQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SplAhCXc; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::2b; helo=mail-wr2-x2b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x2b.google.com (mail-wr2-x2b.google.com
 [IPv6:2a00:1450:4864:30::2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D43E760D90
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:34 +0000 (UTC)
Received: by mail-wr2-x2b.google.com with SMTP id
 ffacd0b85a97d-488811c9ebaso347390f8f.2
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347473; x=1790952273;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YsVKP6aZtgRgrzkcyLJ+FOMnYB5W8fovZAOL55oeW8w=;
 b=iuq9lquB9Bj7vn79esBOS9a6nd2fYKD/VJox5NWXFqMdnxIfqoMiBZRMv4Akapy8dM
 lDwtIqdE1uYtu2herBL5yJIKXBnOWgDAa6H5vliDs7ltLcWrS6R9RMLHeaJuxTh/Vffo
 cSo2mLGOuP9YnbHcG70RKFVLZ0OFLAGmlkfImiXxgR9F0csv76HxQjJYwURyPVemeTHf
 xOniNOUrfXV48cdea9wiuKGng7gLjHKX/qsxrDI4/BzqVH07yXp18+NXNsnZq5D7qd2w
 I5bAUqqG6jnKxRMhpXqizXEf++EqruCINOnKa1CoePlDAPMte4WGpeZZuecYFn0d0vdI
 kRrw==
X-Gm-Message-State: AFuF++k58yG8XwMCKjv+l/SzTKq3FwKNpMmkaxWWZlU+yQsFfF9QCfOw
 eWTClVCDucila0nAQPZGh4r0KRXcuu0tSpOIhjsKg7Bu1qBJoNy+ObRS+Wtkv7Vi4qrOpmqt+qS
 54iHh1fDDaA==
X-Gm-Gg: AYBFou3VyMcD+Atw9KqxNNLqtoAsga/7GeTLN+5Ann6uXED2CuR5iMHRcrcRP/zs3Ai
 Mzz0R13ZKLTewg3bqDMjKtezIK3PttenVzKqlvrJxOFP6QE6lxF4h6JyMG5mkEOHm56e/UVlJF6
 CNAd2eYfpV8lLDpU2LHx+sHB+ceWa4SO5MgXANKh0KuxAHO+ZSj0VagsAZ+5jJGLlgVbJqyR2lU
 TqJNqSIBZY5m/QpG1xFjWUS4/nqtJpUXSofRqVBO2WKySx0vUhPriAgHbupUz6z2iOShOJwwuO3
 xsGQEY/KB+nxrsQ0g3UhO6EUADEhI/fEW+oR0BjcxcRw873JDUjmIU1ZxYiP4X24/PHJmdaaRV/
 230vqnyilwe9gxuUshg6wGIwq3vmB+NNd6REPjGRxJALkMtcmqNFC0DBJ6132fZDlNmgXHBGSFg
 ncNZq7hPv0VdQgrjx4sVyYuHhrs5x27jvXTsaJIAfBRbq7ISUs8oHwfJ8gscbfiyXPZ/5iwQ37U
 i8kN5cUtoZr/1P2Zyw8HdSVx9Cso9BBPkhQbR0UEbQ=
X-Received: by 2002:a05:6000:186e:b0:486:ed36:b9c with SMTP id
 ffacd0b85a97d-48871699570mr9586451f8f.29.1790347472684; 
 Fri, 25 Sep 2026 07:44:32 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a64ed6esm8433088f8f.29.2026.09.25.07.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:32 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:20 +0200
Message-ID: <20260925144431.4096097-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260912201718.1667470-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/vboot-utils: Fix build with
 OpenSSL >= 3.x
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
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gUmVtb3ZlIC1XZXJyb3IgZnJvbSBDRkxBR1MgdG8gcHJldmVudCBidWls
ZCBlcnJvcnMgZHVlIHRvIHdhcm5pbmdzIG9mCj4gZGVwcmVjYXRlZCBmdW5jdGlvbnM6Cj4gCj4g
ZnV0aWxpdHkvY21kX2NyZWF0ZS5jOiBJbiBmdW5jdGlvbiDigJh2YjFfbWFrZV9rZXlwYWly4oCZ
Ogo+IGZ1dGlsaXR5L2NtZF9jcmVhdGUuYzo5Njo5OiBlcnJvcjog4oCYUEVNX3JlYWRfUlNBUHJp
dmF0ZUtleeKAmSBpcyBkZXByZWNhdGVkOgo+ICBTaW5jZSBPcGVuU1NMIDMuMCBbLVdlcnJvcj1k
ZXByZWNhdGVkLWRlY2xhcmF0aW9uc10KPiAgICA5NiB8ICAgICAgICAgcnNhX2tleSA9IFBFTV9y
ZWFkX1JTQVByaXZhdGVLZXkoZnAsIE5VTEwsIE5VTEwsIE5VTEwpOwo+IAo+IGZ1dGlsaXR5L2Nt
ZF9jcmVhdGUuYzoxNTU6OTogZXJyb3I6IOKAmFJTQV9mcmVl4oCZIGlzIGRlcHJlY2F0ZWQ6Cj4g
IFNpbmNlIE9wZW5TU0wgMy4wIFstV2Vycm9yPWRlcHJlY2F0ZWQtZGVjbGFyYXRpb25zXQo+ICAg
MTU1IHwgICAgICAgICBSU0FfZnJlZShyc2Ffa2V5KTsKPiAKPiBmdXRpbGl0eS9jbWRfY3JlYXRl
LmM6MTkxOjE3OiBlcnJvcjog4oCYUEVNX3JlYWRfUlNBX1BVQktFWeKAmSBpcyBkZXByZWNhdGVk
Ogo+ICBTaW5jZSBPcGVuU1NMIDMuMCBbLVdlcnJvcj1kZXByZWNhdGVkLWRlY2xhcmF0aW9uc10K
PiAgIDE5MSB8ICAgICAgICAgICAgICAgICByc2Ffa2V5ID0gUEVNX3JlYWRfUlNBX1BVQktFWShm
cCwgTlVMTCwgTlVMTCwgTlVMTCk7Cj4gCj4gZnV0aWxpdHkvY21kX2NyZWF0ZS5jOjE5OTo5OiBl
cnJvcjog4oCYUlNBX2dldDBfa2V54oCZIGlzIGRlcHJlY2F0ZWQ6Cj4gIFNpbmNlIE9wZW5TU0wg
My4wIFstV2Vycm9yPWRlcHJlY2F0ZWQtZGVjbGFyYXRpb25zXQo+ICAgMTk5IHwgICAgICAgICBS
U0FfZ2V0MF9rZXkocnNhX2tleSwgTlVMTCwgTlVMTCwgJnJzYV9kKTsKPiAKPiBjYzE6IGFsbCB3
YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+IAo+IFRoZSBvbGRlc3QgYnVpbGQgZXJy
b3IgZGF0ZXMgYmFjayB0byAyMDI0IHNvIGEgYmFja3BvcnQgdG8gTFRTIGJyYW5jaGVzCj4gc2hv
dWxkIGJlIGNvbnNpZGVyZWQuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm5ldC9yZXN1bHRzLzM3NS8zNzU1NGM1Y2U3ODQ4MzVhMzZmMDA2OGQ5YTBjMWNkOTMxMjEy
YjQ0Lwo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8xZmEvMWZhYmNh
MTFjNzgzOWQyZDdlZDgwOWYzMDQ4MjU5NTcxOWEyOWM5Mi8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBC
ZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoKQXBwbGllZCB0byAyMDI1LjAyLngsIDIwMjYu
MDgueC4gVGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL3Zib290LXV0aWxzL3Zib290LXV0aWxzLm1r
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3Zib290LXV0aWxzL3Zib290LXV0aWxzLm1rIGIvcGFja2FnZS92Ym9vdC11dGls
cy92Ym9vdC11dGlscy5tawo+IGluZGV4IGRjMGIxMzY1YjcuLjE0ZGVmNGM3MDggMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS92Ym9vdC11dGlscy92Ym9vdC11dGlscy5tawo+ICsrKyBiL3BhY2thZ2Uv
dmJvb3QtdXRpbHMvdmJvb3QtdXRpbHMubWsKPiBAQCAtMzMsNiArMzMsNyBAQCBkZWZpbmUgSE9T
VF9WQk9PVF9VVElMU19CVUlMRF9DTURTCj4gIAkJQ0M9IiQoSE9TVENDKSIgXAo+ICAJCUNQUEZM
QUdTPSIkKEhPU1RfQ0ZMQUdTKSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfR05VX1NPVVJDRSIg
XAo+ICAJCUxERkxBR1M9IiQoSE9TVF9MREZMQUdTKSIgXAo+ICsJCVdFUlJPUj0iIiBcCj4gIAkJ
QVJDSD1hcm0gXAo+ICAJCWZ1dGlsIGNncHQKPiAgZW5kZWYKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
