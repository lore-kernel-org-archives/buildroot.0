Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0295C3271E
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 15:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A39640648;
	Thu,  4 Jul 2024 15:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qobiEyqMIaTK; Thu,  4 Jul 2024 15:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C11784064E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C11784064E;
	Thu,  4 Jul 2024 15:19:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 717481BF2BF
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 15:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ED95812D9
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 15:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzmmjFaYGGGB for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 15:19:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 928A9812AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 928A9812AC
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 928A9812AC
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 15:19:41 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ec408c6d94so7881161fa.3
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 08:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720106379; x=1720711179;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vF9GzQTotLn02YwOPod7oNQ/9RnmHLQ40w3nJQ6EjnY=;
 b=PMQY6BpCQ88rV3Gtv8Vs4SGUmCdtWyQqDtShluh3MZIrtJwF8Iit+stqfuAjS48KWR
 PONA72Wi2zJHPP570qhEK6j1BWyQ+j9IwRuo3D6ad+veLJaZu+rN44aswNkg3ge/oCJd
 GW0XQYN8xdtb34E7nU+5va43FrLiShRadT7CSZL12nVwsPa9RxhiaQJ2fHjBdOp/TLoD
 18+efP0gkl3UsXPyRZooJWs4LT+RVZ2uDTjo1zUwIxEWQtj/iwINsxR/HOuqYIgWjTQE
 RrPwWyA2wnkHiekotfStckmQTG0xBesHN+GDNA0uamtUiWQZqbDY9ndURmh+02dUVkKt
 TDDg==
X-Gm-Message-State: AOJu0YwUtd7vy/91ww8fXy56wGKCmps2LdVDIbrrb4i7dykUqCmHQtut
 2AK4R376uURJL7CE3QGpV4gSRR+9XkJdRhAuph6kBppizu5oAVhMRnNjig==
X-Google-Smtp-Source: AGHT+IE07+7e7jK3fFYGCRP/iVpComSsVH8rl5iWqXoyiwex25li0mbEI4Yyt1Z1Bxwe/9pkLljxuA==
X-Received: by 2002:a05:651c:c2:b0:2ec:5621:b9f2 with SMTP id
 38308e7fff4ca-2ee8edd33edmr13280551fa.41.1720106378825; 
 Thu, 04 Jul 2024 08:19:38 -0700 (PDT)
Received: from gimli.local ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee89936f2bsm4006091fa.10.2024.07.04.08.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 08:19:38 -0700 (PDT)
Message-ID: <97a080baf7bdb4b8a19dddd7e713dd3fc51e8087.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Jul 2024 17:19:37 +0200
In-Reply-To: <87zfqxuxc7.fsf@dell.be.48ers.dk>
References: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
 <8b4e27a50df0f4c4770eeb7f7edfed5f2c1f8483.camel@gmail.com>
 <87zfqxuxc7.fsf@dell.be.48ers.dk>
Organization: Addiva Elektronik
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720106379; x=1720711179; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vF9GzQTotLn02YwOPod7oNQ/9RnmHLQ40w3nJQ6EjnY=;
 b=jKrlz/t2X6ES5+VlGUipCQ9lLJfj2RfXBvcJVRa/YMZmV7r25EQj0VduiSAShxeUOn
 2gdiYbBM+GfVLR29OIr0W23zb8f00VRztvdSBAgiLqd/JEFr5QZ/KtbCi/S3t4/oSevW
 /hAbsbXUB940GZgKfHjNt4DsOgQfMD2S+wCWNCYWKsWsNPDQyvE0ZU4k9yfUh5zMREGt
 UJmx+WAdxIGwXUJlsACxx2GeocPZcBkTPkQ4fiZZbCQTQefF6+oU3fQNMQlmySnSf16N
 eDKtJldqqbnRokTUkuV7Axzb3atlMYgFQcl7OUdJqdBdFEKZ/IvyYD4HPsaVL8WDAyEJ
 X46Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jKrlz/t2
Subject: Re: [Buildroot] package/openssh: please backport bump to 9.8p1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Stewart <christian@aperture.us>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyMDI0LTA3LTA0IGF0IDE0OjU5ICswMjAwLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6
Cj4gPiA+ID4gPiA+ICJKb2FjaGltIiA9PSBKb2FjaGltIFdpYmVyZyA8dHJvZ2xvYml0QGdtYWls
LmNvbT4gd3JpdGVzOgo+IMKgPiBPbiBUdWUsIDIwMjQtMDctMDIsIENocmlzdGlhbiBTdGV3YXJ0
IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gwqA+PiBQbGVhc2UgYmFja3BvcnQgb3BlbnNzaCA5Ljhw
MSB0byAyMDI0LjA1LnguCj4gwqA+ICsxIGZvciAyMDI0LjAyLnggd2l0aCB0aGUgYWRkaXRpb25h
bCBmaXggZm9yIHNzaGQtc2Vzc2lvbiBpbgo+IFllcywgSSB3aWxsIGdldCB0byBpdCB0aGlzIHdl
ZWtlbmQuIEknbGwgaGF2ZSBhIGxvb2sgaWYgY2hlcnJ5LQo+IHBpY2tpbmcgdGhlIGZpeCBvbiA5
LjcgaXMgYmV0dGVyIHRoYW4gYnVtcGluZyBnaXZlbiB0aGF0IERTQSBrZXlzIGFyZQo+IG5vIGxv
bmdlciBzdXBwb3J0ZWQuCgpUaGFuayB5b3Ugc28gbXVjaCwgdmVyeSBhcHByZWNpYXRlZCEgPDMK
CiAvSgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
