Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB815CA5FFF
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 09:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 518D9807B6;
	Wed,  7 Oct 2026 09:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wv5HahtLI70L; Wed,  7 Oct 2026 09:52:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6946C80A53
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791366766;
	b=s6DECLXxGPaNUpt1gRFGuLxWO4YWWpegDYfVHWrO+fJzG1AuYht/RKCDFjL0vdr2v7uz
	 A5nregy9w85oJMDUmqBBkgFT/e31d+uGZULKKUfDpRFl2hxa6XPcJ3fkdO4Gs90EdS9EB
	 lNKBwX83d+UMJZAwtekqQWn+wUDb761BfVoNMR+VypqlCR6H0JMrP1ihElVH6WRCyQqH4
	 oJmIHx1uFwR6y/3RpXLNpqIVjM0gwedOxmeoxy110IPin17vuMzQoVgiH69MDoQzBVJUE
	 ORwqMT4+AFxVSBiwAWKqEMGqk7MuQyiSlUN5Nl5eSMJRiuvYrh6m9oN9iE20rRmsk1A==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791366766;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=AW9ywEqeZeAmBixJFyliZ+483xvSkj1jKpJ+32O448E=;
	b=OiuJ/5aklc5lP1lL6GwBThC3xcEDJDp0tuIzTYxrqLwEcMxRAt3kXIPN38ZBjrTtFm6K
	 WxwPo6DREbqQXwwROSOWuFqJrlDnKPaH+SceVYVp+xkl/Kbx4iIVX3Nh7GZZYebq0VVSn
	 NncvKOm3g8eS4tm2RveXRzQaNbD5qSnF1YLT0Lz34oJE2WXERkqzSF19lkRbvpqQbJYki
	 3Z0d0ls9NhWl/8HZmdYu/RfurOuuKO62x/hzpR9dpvZ6fgyQ/bQfip0KoBljGkN9kiRVZ
	 B+xUpCThXHHRHTGLMsWx6kV5bUxABCQLjDgvLXVPkOBZtyl7OAZdITPeHh0mYtq6gHQ==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Sj5AS46O;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791366766;
	bh=AW9ywEqeZeAmBixJFyliZ+483xvSkj1jKpJ+32O448E=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PqC1POXZHsIQ0/LTQX6aew1lrg3BFtlToK94vUMYHakV6ql54Ppznq8wgANAdttwj
	 /D4GOv3/XU+RDCaRU1xavTPM3smK03sqdic785ujM8333fFFjWyC5+ZkaYOsrIvO4g
	 vJ3tXlpwyVjUI6WjR7iu8The7rQvCGKVydfJLYkIqkLdWxce12Yo8o+ugA8uCPfh4o
	 KAGM2EjeEXOIq4m0XzqiTNAttiO3M4xTabCmQOHCHdyQ2UlM9HITAbvdY/MM211BOZ
	 bGLbDZJWVvOQzfs9KpQ6roINSfG5Dj74eVZ4nuXxkfHKj5Yt7uijnFOgIw2WCJ6U+H
	 6UzxTEpHYeQGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6946C80A53;
	Wed,  7 Oct 2026 09:52:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E05B0317
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 09:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5B6F80EEF
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 09:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGNMvGNj1q3q for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 09:45:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9C1FA809BE
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::a29"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791366321;
 b=EkkySw9le090VzWn7SSHeQhI0/57/DhyoAx5i9/HhIXL1QDkTYkmHJZMDh8hwLDA1uJ7
 Wt7hUF+EzRM5cbXbxKaUQQKSmz/PhJJSTJM2/MiTyoqTUzunLuMEeYPu8o657gma41wS/
 HpivrmpohzeIxJOMIEMgSjKr3YOEVvUGBd2OhJkBFdCMhmSQ317D5rsiRvINKtLFRmlJu
 +Umzu3VszW+qr7Jz/EXlfvGeulUIuCAOGsrcSfeP//8jKl7HlVXjteR95N+CCVWgGAalY
 pFlIvU96Y3ObQC8ac3HkVwTftfHIVPdCO1X4SZ6cp0kjwnLiNpRgye8cQA0C2QGyiQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791366321;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=Mjdg1aJ7twpFAq0G/hh8/eG05cX09B4u2U4K58L76bg=;
 b=pymGKMS3QqO1UAu5fxdjXKInMdbB8l+iv2l9m4/VsIu33IVmQGJ+HsxPnLd6EbbmmRXF
 qvwdIPZZ7s5GjTKx/46CZKgTZFQTAw4xb2ZAvx6nwwfA3Xaj8282vQn3d03f4SsMgBZtz
 WbzEvLrCCY2mP+RU63MXZUJlerZn2ooWIVq4IP3TeWlChGO2GPoHHEphmVptqAdmDg435
 h6pA9WHOlB0LPPgmzXwNzyO5wISsOUidBvjYNhRI/huLbfFKqiy3BGY8CSbXwONXfUZsJ
 6WvX1uj+Oja1llHqVebMfbEMQvxwDH2GxkUT/B/LnMRkgfaalpRb0JojrrhW0/gQwTA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Sj5AS46O; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::a29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a29; helo=mail-vk1-xa29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Sj5AS46O
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C1FA809BE
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 09:45:20 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-5dd8bbb2175so1358875e0c.3
 for <buildroot@buildroot.org>; Wed, 07 Oct 2026 02:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791366319; cv=none;
 d=google.com; s=arc-20260327;
 b=NZrTP2wQ2lhPzwO75Ma0/ZmxlcYG1JSqd2eyI1AVgaPAA2G/mtn0yLLKv+YPT2wvOy
 YgZne1/ExJPuc9P7ksiiK2As9G7GJffN18IfaaxQRH94yRQsOguz7HmWDwk5pbi9JKr+
 CrjyQ6RLBK0CZ3c0ZCVPiESR0f1sirfu1NU/f8I1f/DnQW5gCvG+6/A/XgYWwPqh1/bb
 x8sKQKwydXiJ6eosKfzMx83MCmXNw0KlwL3RLkCSVPyOpYh3+Xc7dx7Dd5TFn5QL7EVc
 tLSx1xIXdIvOq7LBI6WQA+iEexWgJuuR4Uq+zAWg4yTI1/Kn63CVoFtlbJehjlU7pm8C
 hSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Mjdg1aJ7twpFAq0G/hh8/eG05cX09B4u2U4K58L76bg=;
 fh=OXSws1DiqHrDxxvsXcR/G1RKX9FNqHpIGkAabcFCpqM=;
 b=RpZFc0T09Uf/gonCxX6aPp0FLo9vDWi36wckaOD1ZkEGKl/S+VhhOO6T7Dgz7qhGEe
 b1tfXnmnsD18hXiD/TTll8yh2doCLZBAsxln4Il6TmXIFTc3Y2zJib7AnlDF/etASYx5
 HF/nGygiCo/3NhrDVBqEBX33rYjZkwBjmFunqPHO94Av0lZicE/r1DXcrMuAYzH4V8PV
 WM/zyFztpjaKnT7yKVbltRC2rohd4YiY9tZF6vFXOuQSaFk/wTzQxir65KAnBiV676vO
 6/Nced3egZs7mg3zt4oebw6sTSnbFJvOIstBDv1ADBKyJRCyfvY3EogY3ao/MEEolBvf
 4LVQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791366319; x=1791971119; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Mjdg1aJ7twpFAq0G/hh8/eG05cX09B4u2U4K58L76bg=;
 b=Sj5AS46OxMtA3nvByEKJDSr5j/MpffkXmOiFKJE8ens8ndeOILol6gLMwm7/W3ZA4S
 PFoXCfRnb85K8BPtHCQf1YZHDLbDWXzkz6rNyHwDVdhny6AE5s/GkRJNbrzYbfup/tjd
 +ad8a63sXGnz/aq3ZaXmH5Vjiks04on1N6XBVj89zAYcvxzA6VZX6uxzUHT6HwXp1jQQ
 1eQEVeFOeHs2KlFJP7q3FsiiTNYejhEGN5BuShIPMvUuV5HC2a3kxoNqqi4qbBleUN7q
 wMlk53FiKmArXZSYv/P3ONw8StPmdnLQGXL4a++hDP9Us2w3DpLF6UFdCJuvR8VTYmjO
 ODXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791366319; x=1791971119;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Mjdg1aJ7twpFAq0G/hh8/eG05cX09B4u2U4K58L76bg=;
 b=yuf2PJ4NhMU72iwQTUZvPTdZmGEdd9k06QnvZYJjMqw4guoyDFs/gh7JiF+EZYcO85
 EIcRKnnYJ+Wq13UVMngmEu37OmX60PTbXVMyYmt4IpU6oGAKjWefrIAHgL/X0Fke2F4N
 o3vGovlLwCfcPoHoafNelo2ztgX/qf9C8pnUM/zp8qLvB+8rAuY+noZjpzSDzYmAg3Sz
 ytmqo6nlvJAQh21cbAcw4EL93x9/0ywAfw28pMZC77hS1QefMe2mGnkp0+Jy3WEIoS4S
 DCdwgl9hSoPtYAV5nbGYa9ccL0+lr8MU5O+cPGpslD78AVCUqDsl4JEflvAbhwn9kWv1
 Vp0Q==
X-Gm-Message-State: AFq9FYJrqQwo3yRej6oRerzsec44LrLAs1y4D0MvvGNIMprehFkvpaga
 GGNd63TlN2du6fUg8+CAbwNL5i6WlZsvgzVmwFv1828WIMuriDitqFKATNNd/IpIu81s+Xr8iaB
 zbl8I2ItJ8QWqvOTg8uf+BEbTPDLtfDY=
X-Gm-Gg: AYBFou3N8DunadzstspbcPOkxxUa625pZlVlHoQC245/u+duYlq0ZA/U2XJeYTwo5nL
 hmOfKWIDDtOh7BMXUZ9l1m609R3KYsOq3b7/+Moh1ts4D2lUDwt0UYz7sIFkcnXyFAZyXDevm7X
 uyv32ltnxwdZVdnw9hlWLR1vSdKo8s3oumuK/V4ql59SEEwMO+0xfC0A5gXnE0XKtzgjtKaxYWn
 gkOrh+D+GHUvCLCwhZTihs+QQ/yRNBUCsQvhwHQJ0VMncFUnYAXi0eMdVbNg1BjildvCLg+lri3
 jH2ruVMS3t9YugNk7i0ejLE4SW7ZpojbD5dObFa7AZMixrSFGWLTnDoKa1ChDAsAruPNlpg12vE
 7r14owcFrZb0kQmGxLgwxuFPPwkj3vFWU4XwSpspXrTP+o1VDMpnCGSCIN8mRsK6szBcTx0ah0l
 cpFCxokB5CIWv7anoEiXYVbNzuLiByzTlUnFnm0KNinqGB
X-Received: by 2002:a05:6102:2921:b0:7c1:9f20:36ad with SMTP id
 ada2fe7eead31-7ca36f47b01mr562539137.2.1791366318846; Wed, 07 Oct 2026
 02:45:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261006195933.2225477-1-james.hilliard1@gmail.com>
 <asX6R74TC4XMSXDo@windsurf>
In-Reply-To: <asX6R74TC4XMSXDo@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 7 Oct 2026 03:45:07 -0600
X-Gm-Features: AclHuK-Z3x4t7rtMIDydbSZ6IBPmdbnG3Hy1q7xjk2JQ_B201oCrm0cWJ9xQkvw
Message-ID: <CADvTj4qdSJ-iWg8qTr-9uZNbRhMEN_SpzTTR7sPnN_+MoMizbw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/rust: use cargo environment
 during installation
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

T24gV2VkLCBPY3QgNywgMjAyNiBhdCAyOjA54oCvQU0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVp
bGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE9jdCAw
NiwgMjAyNiBhdCAwMTo1OTozM1BNIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IFBh
c3MgSE9TVF9QS0dfQ0FSR09fRU5WIHRvIHgucHkgZGlzdCwgYXMgaXMgYWxyZWFkeSBkb25lIGZv
ciB4LnB5IGJ1aWxkLgo+ID4gVGhpcyBlbnN1cmVzIENhcmdvIHVzZXMgQnVpbGRyb290J3MgY29u
ZmlndXJlZCBDQVJHT19IT01FIGluc3RlYWQgb2YKPiA+IGZhbGxpbmcgYmFjayB0byB0aGUgdXNl
cidzIGRlZmF1bHQgY2FjaGUsIGFuZCBrZWVwcyB0aGUgaG9zdCBSVVNURkxBR1MKPiA+IGNvbnNp
c3RlbnQgYmV0d2VlbiB0aGUgYnVpbGQgYW5kIGluc3RhbGxhdGlvbiBzdGVwcy4KPiA+Cj4gPiBG
aXhlczoKPiA+ICAtIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8wMmIv
MDJiMmZjNmJhNzMyOTg1MmQ3YmY2YWU0OTM1YzEyMGM0ZGU0N2IzZQo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+Cj4gVGhh
bmtzIGZvciB0aGUgcGF0Y2guIFNpbmNlIHdoZW4gZG9lcyB0aGlzIHByb2JsZW0gZXhpc3Q/IE9m
IGNvdXJzZSBpdAo+IGV4aXN0cyBzaW5jZSB4LnB5IHN1cHBvcnQgd2FzIGludHJvZHVjZWQsIGJ1
dCBkaWQgaXQgYmVjb21lIHZpc2libGUKPiBiZWNhdXNlIG9mIGEgbmV3IHBhY2thZ2UsIG9yIHBh
Y2thZ2UgdXBkYXRlPwoKSSB0aGluayBpdCdzIGNhdXNlZCBieSB0aGlzOiBodHRwczovL2dpdGh1
Yi5jb20vcnVzdC1sYW5nL3J1c3QvcHVsbC8xNTYxOTYKCj4KPiBBcyBpdCdzIGEgZml4LCB3ZSBu
ZWVkIHRvIGhhdmUgc3VmZmljaWVudCBpbmZvcm1hdGlvbiBpbiB0aGUgY29tbWl0Cj4gbWVzc2Fn
ZSBhYm91dCB3aGljaCBjb21taXQgaW50cm9kdWNlZCB0aGUgaXNzdWUsIHNvIHRoYXQgb3VyIExU
Uwo+IGJyYW5jaCBtYWludGFpbmVycyBjYW4gdW5kZXJzdGFuZCB3aGV0aGVyIGl0IG5lZWRzIHRv
IGJlIGJhY2twb3J0ZWQgb3IKCkkgdGhpbmsgdGhhdCB3b3VsZCBiZSB0aGlzIGNvbW1pdDoKaHR0
cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QvY29tbWl0L2U4YzhiZDliYzU2YTgy
N2RiOTBjM2JiMmU3MWU0NjEzYTVhMmM3MzAKCj4gbm90Lgo+Cj4gVGhhbmtzIGEgbG90IQo+Cj4g
VGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGlu
Cj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBo
dHRwczovL2Jvb3RsaW4uY29tCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
