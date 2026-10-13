Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651BDCC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 10:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16CBC60779;
	Tue, 13 Oct 2026 10:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odL0u2ZsXfwT; Tue, 13 Oct 2026 10:04:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1FF8160776
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791885881;
	b=glofJA2/VNA0bGAPmDPx40Z/vL8+82z6ed8bMSfBVLzzyidypk6vJZ3xhL/Fbdxq6HO7
	 yqeOY3oSB9zaicTn+f1dtM5wWHG+3yTFo4PPKeiywWOEPMGhQ6XWMTqh8j7fTtitbi+yJ
	 7ESllo8fHsbg9XZ02AtumFJA6zaYUmZx06emkbNSJl3RUR6kZtqky/YrHpORePrhD/GLo
	 9x7xRR8jyewH4/vxEMljXftpHecjsMdV/4SrEfwSDGOyRMp6wRZZVvK2eZfnLIw5158oc
	 l+QwBgWUsXV7U8zSE4VFzoBKNCpE7miQOoHuuB2b/9xRf9Tzf9twjgkWOiSfj/bjQNw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791885881;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=hrVRek/fXJjgCl4+4YzeSNBpjIKQm/8gYBSp8xOtFx8=;
	b=PIb6zn4JCg/5VDZlv13i3PPpT+avdwLAteDB+dsQ+wKip+E8SOwuU/JUzxAgTiqxvebk
	 IfJudcvLLRdrbNHiRnuK6iGjwkpSPv7XxnEz9kFhRgRG0c1frnpk5CEQrYhshCesAeR21
	 bE4VdfBFEn8Ue7Qas1tCa6vEVHeQ3hETKsCpcCZ0PqAJM+lHE8mp0v6WiV/Sbt2DTZLGI
	 hYEfenmNOyagexIOdIOb765rxsgQsPrY7QoIrA7qSV5AWKc6tN1vq9e2doe2Y2yI8Yks4
	 HsLGaufDJxFDE2iM4vGFyhflsZLIi7kBWHlcrGnSs/GiShOOhVMGdaEDaI94dVMTe2A==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791885881;
	bh=hrVRek/fXJjgCl4+4YzeSNBpjIKQm/8gYBSp8xOtFx8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SBX64BEWDb/HltjjjiGPO56g04+fQEsoJ0pPMgL81jrct2qjdcUgynHp/dYQsRaBl
	 uSySg1PIcSG0VSnksrI1zfVYmte+LyKVy3HhKxNXovL1TR8ljhxikh/HBBdU7QT0Zr
	 s6XcQGO874YAnMoa4FrNzkDO9queqyEpkUi4UwL3bODoGneR88doduVzOjrggvg3DL
	 evzKhbNRTATbmBuWY9fyGgEGiVTWYUFG5p6oxYk5YYBlbbgcVN7nO42oEerJnGpNRO
	 xNG8DtvXe2BPHAMnq9nq3KjX/wwdxfLsJ7MKIS2WytLvKfknJxZj448ZBsD+4nOd50
	 yDRPuqQHe/M9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF8160776;
	Tue, 13 Oct 2026 10:04:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DAB2A235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB5D380D5B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwVpOHqWA0kk for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 10:04:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DB1CB80D50
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::1332"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791885879;
 b=Do8PP2zLbyFP78wIQk1CAcIyvc5TS2TGs2vE6lEaAHSxA2V9O4x1yoUDrijCjruhVTd/
 L8bcqgKfI+bsTlXN/xhYeQYPsr+Mz16fgU5XCeRjdefGKyZ7v5sn8DmK62qJG4gcsZJoi
 SOWcOVMwS7xNrUjFCliDP840+zP/HExmS0EHWZk/4zrfMAgiShbmb6vk7y674M1rOokok
 WBQqxNialdSyd2rkbZmlK/2HI6gN3jGaHZdiNn8KGZgKk7CW5qFOTfTj7pS2tDqKWLEsm
 eCjawkbOWKUE1dbumVXF3m6ivDm/UowUPuC/zFA8+vXoUELDkbYAwFvU8wcIuwUvFVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791885879;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=XDk4ilt2lFwkNnr+lce+fDLc3maGm4zEyFqKlSd3i9Q=;
 b=UD+We0KoOLsbTe2mx6EJUtceoKIKJAQ/99S/X+I6n9+QKVAGFR8H4X4UP07nx8Oqo4eV
 8uoNDpNTGxhpFzUX3HTKIFFDu2egDL6eqmNKBVfdY4/P/LcdXWk6FBoxb1sl2yHrOUX5m
 48vnTOQp9IhkPvxihJgosVF9jkQVwFGTy73OGvPNFvGjcsBydgvcMD/WiiWZ2QRwnN8SL
 wKwYWv5RHmAb2B7ZnUQfRpIYRl6U2q9OF11CELO4561Uc27Cx7OoHQRGoWAG1Ehzz7iOW
 44eVdOQynjsrzr7nLoWJbmu+BeLVtNENqcEyKpIlwRFgbLGO/5G3MTmhtuMKgijZ8GA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=nimblex.net;
 dkim=pass header.d=nimblex.net header.i=@nimblex.net header.a=rsa-sha256
 header.s=google header.b=K0C5YnLL; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::1332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1332; helo=mail-dy1-x1332.google.com;
 envelope-from=bogdan@nimblex.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=nimblex.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=nimblex.net header.i=@nimblex.net header.a=rsa-sha256
 header.s=google header.b=K0C5YnLL
Received: from mail-dy1-x1332.google.com (mail-dy1-x1332.google.com
 [IPv6:2607:f8b0:4864:20::1332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB1CB80D50
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:04:38 +0000 (UTC)
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-35c76e9614aso521658eec.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 03:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791885877; cv=none;
 d=google.com; s=arc-20260327;
 b=Je1EhnmHezGmrTjpWTeITSQPo/oC4RpmiHQmWeqfk6rsF6JHvmQlTRw3VG8zE3Dzus
 mF1ZTWQf3jBHKzJXAZ5ArR/gWfF73fVBINMAgvbs29fUSSDlIlSSTs88Vqg2U6mcrDhM
 F+ueHy+linYPpiI6XCmrnfPGsGnpwJucFhSYW5nzEy/zWokRm9Pp/2uP3CntZDwMnjOu
 jlIgmVuUXxnMNWKIRQPll4vq8bsr4Hv+NvcWmmRe7NZe94GXbfiXC/TeP4Kuw09U95Nt
 /U2DF1z8QCd7ASaHeY9WHg94whPdVafxrPTkYvIMOa/jzRH/JV8DXsGF9ZNeAgySUo0+
 cLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=XDk4ilt2lFwkNnr+lce+fDLc3maGm4zEyFqKlSd3i9Q=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=EISCSNfG1BQz4hYZj1Pfzcr8201Genn/F/GrkykKk5Pc16b5Qu1nwKV7kcZ+jDLbvz
 eCxOEG+GYXluHhokXHhFa7wg3+QpTQnLHmFcgnPsNW21FsUXAN8nMeZe6UxU9rsRWS7O
 RgR3dSvgCIt/sZ1If2XroDt/w0AIE2j4/QBF2wem9WVMnuRyBfEWbhD9pz+rShIjZ1T/
 xxSk4Q+2RzOm9GMdGyEgZXNe9QdopvOXbjoKmPPaBmYqf/VE336RpTCswvASBQdIZhEm
 ljYpxAKbZdQuXnXw+OBkMcc+AaqoKGioldl0bzEmw9a6nbaIm6R64QMnufodQVrMOi6N
 CtmQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nimblex.net; s=google; t=1791885877; x=1792490677; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XDk4ilt2lFwkNnr+lce+fDLc3maGm4zEyFqKlSd3i9Q=;
 b=K0C5YnLL/32mf5gQa/qniIPzEDQUMTgfzd3hukCreUVth1/aoznZTHk0GdUgyX/KOC
 yXFGuDaNmDQgEyJxBQljW7KSrz9Gg+ua6/MdJR0o4rVG5Xsz/0RT0xZSOGEFqRbbItcr
 G0EoeuJKeuhnZ3mvbJXM6g4tFh0Xfo74S8dM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791885877; x=1792490677;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XDk4ilt2lFwkNnr+lce+fDLc3maGm4zEyFqKlSd3i9Q=;
 b=J2YEQP44fMT7AkeNqhyEDnn5UJ4LaaPa8E0Ijflgo6EK6BKQ5By+edMX3GFpj5N/Qm
 U/TtSigoMi8eRObqcSciaywmGHCHNPWGfeVTlNcuxFga30iKa2Z6YxTtUenoq302nV11
 CPgYyv88FkVnXFMzKOqtZBTitd0AME3r+NubqIFOvPKDMqw+++jgkF1go8Zp21zgPF/e
 R6beppLWLubkuQKqRo/ujzowGbC9Yklt5o9z4Y+wC7+OgDtLHXSXqa7IVpNAFyszTt/0
 l4wnU0e8MbSCz8hbHpQW/ifhlrYqfpEsXDMl+xTTjIMRAAzPqJoH2l5SXrWnDUIOsbiZ
 D/Vg==
X-Gm-Message-State: AFq9FYIlEb3wZHz96kq8PD37TLu3ZBqC5TNtQoOh+5l+nj9pRo4l6NGS
 tMK80ysWt65hgS1wPnL3T0XR7EkFKEyq3LJGB9V927lq9UFWpu2stgaN521DGi/LGfY0ZDstHtt
 vKEHyLitWrtN21dGAcwskxjjC87/7spsAJ7MhVzdWkv7S5AWQKFeKQBMgMDb7
X-Gm-Gg: AYBFou3IHQFB9aLV4jkXNvUBHMMA5FnEWmVtYlDQsWBY1EWMGzHq7NUBPHBoeJ/1md/
 Gq45JjaCCRLXiLXLrVC4Tg4JAdZW0xt+Y5fG7LMkOCH3MLcQZj107tsqP4uayAy8QE9NhVQkHcr
 exymcBPMAO3MFjZiYjlBK4sEPe4vogBmRpotbuh2hQc43jKkYIDu1BRU17ebns2kjrHt64OMtuF
 BCHYDMXFmmNUfQbv3L41LLhyiX5Pp23V29c0UTbUPHx6nLZzSmu7FFoj4v3SGJqC9EpDX3ZYU2S
 sZFqVrshZF+TXsgbmIozmgvfbZF/Mu3uhELVzpvUFGbxv1ygd57NgGSW8fQ5a1whdyY2H2oLHTt
 mzjIqS3TxaEaoYFGbM4OVNdA=
X-Received: by 2002:a05:7301:78c9:b0:34e:e7f4:cc78 with SMTP id
 5a478bee46e88-3537de1cfd3mr16190856eec.5.1791885877144; Tue, 13 Oct 2026
 03:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20261011185735.3200892-1-bogdan@nimblex.net>
 <as3lw8h7cEQnb96R@windsurf>
In-Reply-To: <as3lw8h7cEQnb96R@windsurf>
From: =?UTF-8?Q?Bogdan_R=C4=83dulescu?= <bogdan@nimblex.net>
Date: Tue, 13 Oct 2026 13:04:41 +0300
X-Gm-Features: AclHuK8FRNZZjwgKtC9GMYG8BOcpREwqEIIhncIeKEmQl9kvD3HJlMapx4qhWu8
Message-ID: <CAKu+J92O3mc+d+4zH5-2sfydPW3Nzs_n5q6SC=m3uu-1ORECAQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/nettest: not available for the i586
 Rust targets
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

SGVsbG8gVGhvbWFzLAoKCk9uIFR1ZSwgT2N0IDEzLCAyMDI2IGF0IDExOjA14oCvQU0gVGhvbWFz
IFBldGF6em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxs
bywKPgo+IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBwYXRjaCEKPgo+IE9uIFN1biwgT2N0IDExLCAy
MDI2IGF0IDA5OjU3OjM1UE0gKzAzMDAsIEJvZ2RhbiBSYWR1bGVzY3Ugd3JvdGU6Cj4gPiBuZXR0
ZXN0IGRlcGVuZHMsIHRocm91Z2ggcnVzdGxzLCBxdWlubiBhbmQgcmNnZW4sIG9uIHRoZSByaW5n
IGNyYXRlLAo+ID4gd2hpY2ggcmVmdXNlcyB0byBidWlsZCBmb3IgMzItYml0IHg4NiB0YXJnZXRz
IHdpdGhvdXQgU1NFIGFuZCBTU0UyOgo+ID4KPiA+ICAgZXJyb3JbRTAwODBdOiBldmFsdWF0aW9u
IHBhbmlja2VkOiBhc3NlcnRpb24gZmFpbGVkOiBjZmchKHRhcmdldF9mZWF0dXJlID0gInNzZSIp
ICYmIGNmZyEodGFyZ2V0X2ZlYXR1cmUgPSAic3NlMiIpCj4gPiAgICAgLS0+IC4uLi9WRU5ET1Iv
cmluZy9zcmMvY3B1L2ludGVsLnJzOjI2OjkKPiA+Cj4gPiBCdWlsZHJvb3QgdXNlcyB0aGUgaTU4
Ni11bmtub3duLWxpbnV4LXtnbnUsbXVzbH0gUnVzdCB0YXJnZXRzIHdoZW4KPiA+IEJSMl9BUkNI
IGlzICJpNTg2IiAoaTU4NiwgcGVudGl1bS1tbXgsIGdlb2RlLCBjMywgd2luY2hpcC4uLiksIGFu
ZAo+ID4gdGhvc2UgdGFyZ2V0cyBkbyBub3QgZW5hYmxlIFNTRS9TU0UyLiBUaGUgaTY4NiBSdXN0
IHRhcmdldHMgZW5hYmxlCj4gPiBTU0UyIGJ5IGRlZmF1bHQsIHNvIHJpbmcgYnVpbGRzIGZpbmUg
dGhlcmUuCj4gPgo+ID4gTWFrZSBuZXR0ZXN0IHVuYXZhaWxhYmxlIHdoZW4gdGhlIFJ1c3QgdGFy
Z2V0IGFyY2hpdGVjdHVyZSBpcyBpNTg2Lgo+ID4KPiA+IEZpeGVzOiBodHRwczovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZDA0Zjc3MDUzODQxMmJlZTc3ODUxMTQyZWUwMDdmMmZm
MTA3ZTBlYwo+Cj4gQ291bGQgeW91IHRyYWNlIGJhY2sgd2hpY2ggQnVpbGRyb290IGludHJvZHVj
ZWQgdGhlIGlzc3VlIGluIHRoZSBmaXJzdAo+IHBsYWNlPwo+Cj4gQWRkaW5nIGEgdGFnOgo+Cj4g
Rml4ZXM6IDxjb21taXQgaGFzaD4gKCI8Y29tbWl0IHRpdGxlPiIpCj4KPiB3b3VsZCBiZSBpZGVh
bC4gSWYgdGhlIHByb2JsZW0gZXhpc3RzIHNpbmNlIHRoZSBwYWNrYWdlIHdhcwo+IGludHJvZHVj
ZWQsIHRoZW4geW91IGNhbiBzaW1wbHkgdG8gdGhlIGNvbW1pdCBpbnRyb2R1Y2luZyB0aGUgcGFj
a2FnZQo+IGFzIHRoZSBjb21taXQgYmVpbmcgZml4ZWQuCgpZZXMsIHRoZSBpc3N1ZSBoYXMgYmVl
biB0aGVyZSBzaW5jZSB0aGUgcGFja2FnZSB3YXMgaW50cm9kdWNlZC4KCj4KPiA+ICsgICAgICMg
cmluZyBuZWVkcyBTU0UvU1NFMiwgd2hpY2ggdGhlIGk1ODYgUnVzdCB0YXJnZXRzIGxhY2sKPiA+
ICsgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19BUkNIICE9ICJpNTg2Igo+
Cj4gSSBiZWxpZXZlIHlvdSBzaG91bGQgcmF0aGVyIGhhdmUgYSBkZXBlbmRlbmN5IG9uIFNTRTIs
IGxpa2UKPiBodHRwczovL3BhdGNod29yay5idWlsZHJvb3Qub3JnL3Byb2plY3QvYnVpbGRyb290
L3BhdGNoLzIwMjYwNjE3MTYxMzMxLjE0MTY2Ni0xLXNoaXJva292YWxleHNAZ21haWwuY29tLwo+
IGRvZXMuCj4KPiBJbmRlZWQsIHRoZXJlIGFyZSBzb21lIGk2ODYgcGxhdGZvcm1zIHRoYXQgZG8g
bm90IGhhdmUgU1NFMiwgYW5kIHRoZXkKPiB3b3VsZCBjb250aW51ZSB0byBmYWlsIGJ1aWxkaW5n
IGV2ZW4gd2l0aCB5b3VyIHBhdGNoLgo+Cj4gQ291bGQgeW91IHdvcmsgb24gYSB2MiB0byBhZGRy
ZXNzIHRob3NlIHR3byBjb21tZW50cz8KPgoKSSBhYnNvbHV0ZWx5IGFncmVlIHdpdGggeW91ciBz
dWdnZXN0aW9uLCBhbmQgSSBzdWJtaXR0ZWQgdGhlIHYyIHBhdGNoLgoKPiBUaGFua3MgYSBsb3Qh
Cj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJv
b3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmlu
Zwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KClRoYW5rIHlvdSB0b28gZm9yIHlvdXIgc3VwcG9ydCEK
CkJlc3QgcmVnYXJkcywKQm9nZGFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
