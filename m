Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE19C83029
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 13:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6826C409ED;
	Mon, 30 Jun 2025 13:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_7xdpNL0kT7; Mon, 30 Jun 2025 13:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BA334097A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BA334097A;
	Mon, 30 Jun 2025 13:37:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CFE1DF
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 13:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E00780BB5
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 13:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ru1L4ORCkZf8 for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 13:37:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA19580B8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA19580B8C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA19580B8C
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 13:37:55 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-453398e90e9so16543765e9.1
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 06:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751290673; x=1751895473;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqys+8+ZANNKF4waPwdrNk5fZsh+1xYEEuhDYVaFUn0=;
 b=lXzdqgwvJmPBwLs0k7nZTWuXst9uStyG2m5O3ZlnajE2/NVcRbPh5sVFfPbedGcUS3
 Yj0mbFYe112rIOrrFHNkOxACsXYV2w0zzmrOVTiO4KnvFwsRNhO9+1MGu75vT9mSUWAO
 pjNqb699yrtaW4azzgwlvO+xEYPEC7a+5y/9C12+JGBboDXpPigXJAQCF28fFYCaaIdT
 1CiMj6ekw2p484LtBKeFF6+oo8VPBOF9Q0mv60huRXXc9ltMc3YI+eDxPulpdlP3UEm7
 ei2fRBS6bDU5kadl8+h1qk0PphNcuungp/WF+8p7Htnwn7TQ1sv8Yqf30UCbnfF7rhlc
 o27w==
X-Gm-Message-State: AOJu0Yw4xIw+2BTzppY1O7zIIiVSPLd4tzarLPyInjUwHzln05CEZC7V
 bqPbCE1hup6R2B8iJOEHkmEN2t2Uwlpms+bSNSPmBXw6ssy4+qlusSvkEQWQgZtsdqQGjgnqX89
 6qgErDfE=
X-Gm-Gg: ASbGnctb9uD5tzeePKLCuJFXVz85A04oIlbXgRgp0GVcgLhqy36wMlNSybSRjTn+9uy
 Vuzd63WANO8/e7XsfbfuSl25w1SEsEgDcfB3cX5+0K96bTw/epmX8jwKu4AU2bMob+qLaYOF5kF
 BIG9qJzQOLZdCo0oCKH2g5EkRdDL5brhzEMIYnMHu70pNiMATmhk360h1ME/Eju9sNT70DymEG4
 NJfFkWvPsl8TKmmWrwts3h9LhXBch6C/TRiFSOR9RqacckhhRzznUWrnJBecL4s+BeXN+e6JjCi
 a1ojkDQbMvzy6RSTmNQ0vE0DgrCcGwq4gP6bf2DuaVsoYbj4BaKGLTjoUowPZPnImYCrgVUeV1E
 =
X-Google-Smtp-Source: AGHT+IFmtV7XSjV0N0KFEk/lA0XiBuaKJPxbXFf77mjrVTFfST+oSstLYYwN8q/Z2xx6I6a4h1PJkw==
X-Received: by 2002:a05:600c:4e8b:b0:453:8a63:b484 with SMTP id
 5b1f17b1804b1-4538ee75d5emr149759275e9.30.1751290673361; 
 Mon, 30 Jun 2025 06:37:53 -0700 (PDT)
Received: from [192.168.178.20] ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e6f74sm10450139f8f.3.2025.06.30.06.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 06:37:52 -0700 (PDT)
Message-ID: <1bbbb0e1-2f97-4a33-bd36-cbdef923a0f5@mind.be>
Date: Mon, 30 Jun 2025 15:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250626111922.1851579-1-raphael.melotte@mind.be>
 <cf2bc1b78c3e215d3313450ba34fed9c@free.fr>
Content-Language: en-US
Autocrypt: addr=raphael.melotte@mind.be; keydata=
 xsBNBF9jhjsBCACmkrLRBR22D1FiSlmQGKiSPPLY0lAYe6/DnBT7OsgiGIOWqmQL1ryGJmxI
 9PDMDGEBngJ6RyrsVlREt7ugoBEg75CrtYwXdTCB40fEPweceHtWwAQoOS3MDgFhdvd6uZvl
 YWenR6RcbCo/LZaV/novslE1eCnADNChMOkp8jTAA0K2jIlEYexrzO+G3CcrKmo6naVxn56r
 dn0kLnff4f/wvj+1l+J7m6GVL/8ckQ8fVQagLxQ5LHoxhIcOxKH1IEzf+gri/e+16gka7bWE
 4QUCEeGo/pBYysLinUP/6ArAmWoZXfGH3S0HiLBc/Yf4klnJ1nd6vZmxYKppOmy814+tABEB
 AAHNK1JhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT7CwJQEEwEI
 AD4CGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSjAZBvHnwkHJEj52rDTCsxdUfmrAUC
 Z4ZBYQUJCgPupgAKCRDDTCsxdUfmrC80B/0Y4VeyvIBoHgN2l5Jv9SvAAvPdtDNQBe66aG3X
 5J8wGOao7jGQQQwd52A/eRRHKf7DaVK8m1aMb82KSwaGp5YAM2TgUg72DvqPb2Nv/NKTjQ41
 mTBKOr0A1JJlhF0fOhOCvi4A4eQFnNt/Awn1id1ZKv7CVErH/AiXfdqF0nwXJ+SgTb7FtQ/R
 sCekSRrrnMiGqFA3W0zeYyZ6liehOCqqmYDwdqbnjjdaYfwEwPMRJCobdt9gpQsFxOWGNPTc
 EtPX6LyDEtF0gbQEdRDiYZ24YBeAydRwycmOiyKiVNnQFkKBw6jas5+7WeoKwnhZ7EEHhIEL
 6xRlP+ACT4YWIdkCzsBNBF9jhjsBCACcBqvoGcSgHH5io/UF+ouPP3tkr68kp6Ww2Gtnf7gu
 cL9vr9ixKbuobOCs2/1JhQD1fjmrs/Nb7wYUoA+QECkoZbdRLoqaldX0Uf+7no3EtwwSMROV
 EJKBOoRyuW7nH7PzoRmMYDGHqCYTuTfBH8byoh29tjPezyli5n4Zr3JIjmgjgG6jT31uqeDn
 eirLtWta2c2n4o5cPKoVNsZJmbVtuzAz5XHUPHDaLaFnQlaPlGQ1RDvuKVzkZ1maXloa9lND
 TL7dkWoQvq7LtYxRALEhSUU8My2Bxb3B+rRMGS8W+IGAdSvtxiGqDP6W7Ac2mrg13wXf8+fq
 XiYblnHp02PtABEBAAHCwHwEGAEIACYCGwwWIQSjAZBvHnwkHJEj52rDTCsxdUfmrAUCZ4ZB
 9QUJCgPvOgAKCRDDTCsxdUfmrDrzB/9w+0pSSeHdd+mgOgtjoab23OfHbwkQa86WgdSpx5hR
 U+QdtB9zJErJBA8q5Kq4vBSu+h9V9HaETg1nnpaREbiEo4mX5kiTHCwr51JArBLFMQXGMTqE
 pENpJdaHBZDJqktvcLFBfIzIo2avLMOjAznZBeFimEcKgwouAo9DK5qb61th9hjUBvNvzFjh
 h+mjryTGqe4l0eIRxwPi7uh1d3PCql/InUhXDii3oisu75ss+2aKyRtx1RMLxcj+pD1oheZs
 ib86j6501oe6jZ+FsoUBf6EXcSij4nZlVYtEWsr7vKpPEUdNYCeeAAOuabDWsYRU/Rfl8Myc
 7ZS5078ic8ic
In-Reply-To: <cf2bc1b78c3e215d3313450ba34fed9c@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751290673; x=1751895473; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aqys+8+ZANNKF4waPwdrNk5fZsh+1xYEEuhDYVaFUn0=;
 b=Zf3z5ZpABB+61vlcRoaSzbhAj1QWmAeLiDyR3fnK4eIA0GoSFfASO/XgV7DP/8oLiF
 tlBxT7xQ4NWN8DvvJDJAjIGzmsTGu4bOOv6a1olmpZBrPEmyCxBS61xohfsddqX1B2mt
 Qm2t1E3xzM6WbbJcbEB4DdEx1131p3O0iKMAQW7xR2k1aEC0hmrSEn8VLgw0Qh4tn4bR
 6Bz+VPxWpqU+sGvOSNxqThzC7qSkgIadyiY4fjsVqHRNh5sPQUyNH/myu6RyldCH9kq4
 GO2+T34nlf+G5dLaGtVF/npxECfgI3xUfZpVpO5E7MJZL+ayNj1qzWOInLszKZvDs0IS
 8sIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Zf3z5ZpA
Subject: Re: [Buildroot] [PATCH 1/3] package/gumbo-parser: update upstream
 repository
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

SGkgSnVsaWVuLAoKT24gNi8yOC8yNSAxNzoyNSwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gRm9y
IGluZm8sIEkgZml4ZWQgdGhlIGxpY2Vuc2UgZmlsZSBwYXRoLiBTZWU6Cj4gaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzVjMThlYjFhNTVkYmVjNGI2
YmY0YjdkMGE5YTRmYTAzMzdjY2M1ZDgKCk9oISBJbmRlZWQsIHRoaXMgaXNuJ3QgY2F1Z2h0IGJ5
IHRoZSBydW50aW1lIHRlc3QuCkknbGwgbWFrZSBzdXJlIHRvIGNoZWNrIG5leHQgdGltZS4KClRo
YW5rcywKClJhcGhhw6tsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
