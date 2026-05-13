Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE5ACD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 16:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED12A408B3;
	Wed, 13 May 2026 16:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09ZzQUW5lb42; Wed, 13 May 2026 16:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0299340311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778690338;
	bh=0/eRghU/nx+PJXhNE+1UrHW/LTH0uJcpL8lkdx3XWCw=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PI4pXWspj1Y9GVlN+fI7MPeVCuh4/mxfQ3y9sB99aM5CiHM3OWmHKLG6FAl5A9dT9
	 EjN8kCPVB/ENpGPhXLp//8G/lUXZVz/ChMI5eUCpD990Y94mLLUsu9Dx94tdlO0dzu
	 S9TXo2F51gkH+gcwipkAkFPJFO1AjPjsqbYs5WxUHEB9BCAFgMoGuEME9bqy3Okc1Y
	 QFjvFJ3CfbEXt+80LVjcSRGceNfwRm753zBmzPpAy5e1aTxdUNnCLc0KHVHdWks7qn
	 8hRok/J+kAICWYOL59CmyV4ANy+e24XX84nTBp12t3FzWMj61vjYxKADFUdVRHE4Sd
	 vgyqh3J2Ucr2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0299340311;
	Wed, 13 May 2026 16:38:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BA48270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 16:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E1A982F4F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 16:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CtC1RS12WuQ for <buildroot@buildroot.org>;
 Wed, 13 May 2026 16:38:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70F6982F49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F6982F49
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70F6982F49
 for <buildroot@buildroot.org>; Wed, 13 May 2026 16:38:56 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-69b4f7d66e2so1367115eaf.0
 for <buildroot@buildroot.org>; Wed, 13 May 2026 09:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778690335; cv=none;
 d=google.com; s=arc-20240605;
 b=JasggwbUufN1ZGO9U9AhWak/cLW99JePkqecAXZ42HAYuZyJVmGvLOBDkrSwjDyhbd
 cnH7TFWmsx50Qx+PYGe2V1xW7xbU3N66i3fuhMcQY5u1B11EJp7+ZUtZczgILdcoSReH
 pJmjg/CKUM2D85yzg/DQ0tcPeACT1JBo7D9U2nPcN2W/Qorji7SszdtLVZCaYYiN1cOe
 K5Olif8juEcr8jW96u25QfnLXYnrCFp9tXp3wq2cD6rgPD00IMQUF8A8nP+w9sVS3Biw
 /dV6AU6yF+w4ef8oH1zxV6YKRdv6omYjyx2CuUjdaCzricI0XdYPogNmoCxUcH1UXFj5
 C6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Wxu03oM+yIt6hs5loiwgSrLPGHddQbXomFESn+flM18=;
 fh=v8e3mHeeZPVeJ6Ipfu8Tr2PX0sss/OwrBryTWHCNTlo=;
 b=L1taD6Y/Wslnd0pmhna7iflaN2CjaLc/jHQfR9A9zofZHOTLZTSS1rp63UsQ58uG0X
 WsyGjdXsFOrBu4Fndg6dNx2Wfzupn0Zd4FZ4LVmamdFdOvhZEcziLjNo+RvOXwsUf66A
 Cdl9bMUyOYiDejYEyQf/GGS3YB6Z5Ev2Y38FGMpUFQCiQKzVICtIln+R6NIAjID08ayZ
 O2OaO9Sj+VkLljqS7idNgVZ0IpX3Y4rxJxgX2i7JjTFHx6Mx+28MlGmrC1fsBEo1HQyL
 3wh4LLzQemdDJxkgGYdZU24lzwYd0jpY43z/oGA5GGbUu4JqfbYOWvN8hPMfkbnu+p7E
 CTcg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778690335; x=1779295135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wxu03oM+yIt6hs5loiwgSrLPGHddQbXomFESn+flM18=;
 b=KXI59VXTW1gpCG6dVkbLavU0dkK76snxRnW+5jLKlOHN1sgg9qWL4m5hMZ71Ucq1Np
 EbA40bRAK7ZgmtAwVc02Xve8x8TlQ3RffMDWj+yY4eYsrlrU1/82zAeuAYftDKQDUo8b
 kDxwYfdVJp4i631grnS7WtDgm1J9h5m3g2cFahAUnjrjcnqAByxy/pTVf07INa3fDJEr
 SlVO63pgn9u8/209OZe5s1vaIYMnbkoAO6tZmP6PSN2kpLvAm2D2yo3og/s2Xum6H/HQ
 /mQK1lcyjJKFI7NRYezrhlKbBs6szrx0abriLd7oKYac4xsthOz9KVYoP3Jx8qtMZ1fK
 2wbQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9SPpNOa3u18qHXxl1QLn0tL1GbKd3Yeh0dojm5DMAjn5VrB92fhGR09e/VUsA1kjFmDiwTq4fGPsI=@buildroot.org
X-Gm-Message-State: AOJu0YxbBwhjkNtV02x9Z2G8fWb3Zz2V5o0V5VHDSL84D5BxjiLZkUeL
 ktC0CxuN4axwr5JU2qcJ71tHFkc4Ly1TPs6erlKc1bemrRNnhMwHlxCiuoqarq9cABNF4XScP1L
 eup/8iIqgE0h5Jbjhz3eVfte/m9GqxvQ=
X-Gm-Gg: Acq92OEohbHJJwdU+KRB1vS3PZWiKtwwZA0uFRLFgAy5mJ23pwh/1gbJl4Q3UUE9143
 2qXT8yb5EbVb+XtJ3DAfxCvbX5Vs3QRAQ7tkGHCukLQcQL7agK8nRYPjDyLPY/Q2f0mEcoinXg5
 VcXqV1OJTwEiSr2Z2F/LcdPsqyJwJJ8nIod3jFhIKOR8OqcA91D9Hgm5NfYeIPf7XhjGNPH5Afe
 sE0FNtRwFnUNGvDA0DWkWMMez5PkS9kUjfAu78Wi2YVjkNaYZuy49eCCOADKoj+o5cICIEBTlkE
 AuB8
X-Received: by 2002:a05:6820:199b:b0:699:b16b:936b with SMTP id
 006d021491bc7-69b78d32cf1mr2139668eaf.11.1778690335218; Wed, 13 May 2026
 09:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-qemu-v11-0-0-v1-1-776ebffbb3af@anodize.com>
 <87tsscyngb.fsf@tarshish> <f40ce0c6-0441-4aa0-91a6-fe80a66b2821@gmx.de>
In-Reply-To: <f40ce0c6-0441-4aa0-91a6-fe80a66b2821@gmx.de>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 13 May 2026 09:38:19 -0700
X-Gm-Features: AVHnY4I7OuVLpWJwHScTCLsBPsQV300HGKbn4fKUfYbeOFKQoY7GvVO6QDv4bgA
Message-ID: <CAMWSM7jkykAM0HoAyYS4gOaGV2qpu9K5iY3E8ZR5RqKUSNOZiA@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778690335; x=1779295135; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wxu03oM+yIt6hs5loiwgSrLPGHddQbXomFESn+flM18=;
 b=QmE6JMxsZ0G+gmo8Oo3ujFm43RQyDw2v1maUynh61nDjaFSIANu8r0u9mP77y8RLRW
 N6oKA6dOjmj4YjI+5sOlD/GeO1fm2nBtSvaOOwWKkv/MklXAHOXIOYRcG97fJ/gV3yqP
 Rsedw/qsFLjxpcYcwzKK0ngo+ul/tNoTyJKZsPDOmWSxywe7Qul75dClFPZWUx/y/mkt
 IbJm7HLuaNugqgpq/A5S0MbG1VZP+bvDUwIPVVAzFLrpiVGXusHe9efuxwePpIYcZSQ8
 yLvRTUwcIJHCIfB0GBMUVXXY2y4vISUACTjr7m4HMzM+wRJUV+SmMLlWFNIzVGTyeDu8
 v/rA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=QmE6JMxs
Subject: Re: [Buildroot] [PATCH RESEND] package/qemu: bump to version 11.0.0
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
Cc: Joseph Kogut <joseph@anodize.com>, Romain Naour <romain.naour@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmFydWNoIGFuZCBGaW9uYSwKCk9uIFdlZCwgTWF5IDEzLCAyMDI2IGF0IDM6MDLigK9B
TSBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3Jv
dGU6Cj4KPiA+IHFlbXUgMTEgZHJvcHBlZCAzMi1iaXQgaG9zdCBzdXBwb3J0IGFzIHlvdSBtZW50
aW9uZWQgaW4gY29tbWl0IGxvZy4gQnV0Cj4gPiB0aGlzIGNvbmZpZyBzeW1ib2wgaW5kaWNhdGVz
IHRhcmdldCBzdXBwb3J0LiBxZW11IGNoYW5nZWxvZyBkb2VzIG5vdAo+ID4gbWVudGlvbiByZW1v
dmFsIG9mIGFsbCAzMi1iaXQgdGFyZ2V0cy4KPgo+IFRoaXMgaXMgZm9yIGJ1aWxkaW5nIFFlbXUg
Zm9yIHRoZSAoQnVpbGRyb290KSB0YXJnZXQgc3lzdGVtIHRob3VnaC4gVGhhdAo+IG1ha2VzIHRo
ZSBCdWlsZHJvb3QgdGFyZ2V0IHRoZSAoUWVtdSkgaG9zdCAoVk1zIHJ1bm5pbmcgb24gdGhlIHRh
cmdldCksCj4gc28gaXQncyBhZmZlY3RlZCBieSBRZW11IGRyb3BwaW5nIDMyLWJpdCBob3N0IHN1
cHBvcnQuIFRoZSBCdWlsZHJvb3QKPiBob3N0LXFlbXUgc2hvdWxkbid0IGJlLCB1bmxlc3Mgc29t
ZW9uZSBpcyBidWlsZGluZyBvbiBhIDMyLWJpdCBzeXN0ZW0KPiAoc2VlbXMgdW5saWtlbHkpLgo+
CgpJbmRlZWQsIGFuZCB5b3UndmUgaGVscGVkIG1lIHJlYWxpemUgdGhhdCBJJ3ZlIG1pc3NlZCB1
cGRhdGluZyBxZW11J3MKQ29uZmlnLmluLmhvc3Qgd2l0aCB0aGUgY29ycmVzcG9uZGluZyBjaGFu
Z2UgdG8gZHJvcCBzdXBwb3J0IGZvcgozMi1iaXQgKGJ1aWxkcm9vdCkgaG9zdHMuIEknbGwgbWFr
ZSB0aGF0IGNoYW5nZSBhbmQgZm9sbG93IHVwLgoKT24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMzow
OOKAr0FNIEJhcnVjaCBTaWFjaCB2aWEgYnVpbGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zz4gd3JvdGU6Cj4KPiBUaGFua3MuIEkgbWlzc2VkIHRoYXQgcGFydC4gSSBndWVzcyB0aGUgY29t
bWl0IGxvZyBzaG91bGQgZXhwbGFpbiB0aGlzCj4gaG9zdCB2cyB0YXJnZXQgY29tcGxleGl0eS4K
PgoKQXMgSSBhZGRlZCBhYm92ZSwgdGhpcyBwYXRjaCBtaXNzZWQgdXBkYXRpbmcgQ29uZmlnLmlu
Lmhvc3QsIHNvIEknbGwKdXBkYXRlIHRoZSBjb21taXQgbG9nIHRvIG1vcmUgdGhvcm91Z2hseSBk
b2N1bWVudCB0aGlzIGNoYW5nZSBiZWZvcmUKcmVzdWJtaXR0aW5nLgoKQmVzdCByZWdhcmRzLApK
b3NlcGgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
