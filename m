Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6003C4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F3D406C7;
	Mon, 12 Feb 2024 21:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70uBoDOepHwf; Mon, 12 Feb 2024 21:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 872764071A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 872764071A;
	Mon, 12 Feb 2024 21:53:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFA3F1BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCF2981FBB
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64NR5HTiQ_ww for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:53:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB86181F6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB86181F6E
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB86181F6E
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:53:50 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-410cb93185dso11966685e9.3
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 13:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707774829; x=1708379629;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TEPiO99FqqXEhW48EdAZ0CEOZpuI3Xim9LXU94GwFAc=;
 b=QJsfX9ktxi1Shprd06vAkEMcvGCn0gFQq3vY6LPIZrCvJ6X5kde2QoDrEZlSCwCh4G
 UplY/isym8HsfvzAQR5zcnNRDzyemrAc0ldIEtAi1NW8BbuiUI/kFC1TzwnAkgWOUPrI
 XGMQOR2RTqgozTM/iCic5Os/5+JqDz8vHl7OJzs60Gv1n+G94iQP8TlQ7Q0XENq2mgAj
 DVGowL3l+p7ZX+7WXOfn57NShILeiGI8YWSUwDp5+1AafPB92B9W99dbYw8T8tjKupB3
 wkQGX0HMx3OFxj0lWW+5kBIvOD9bjqQ8E3pNmGKbzaUzCzfTVQDzRm4b1EnGFNncHAVy
 9X/A==
X-Gm-Message-State: AOJu0Ywg1cbpGIG5X0P6R8YcWn+xMQZkGWaup6Hh7vE2Qva3hvNtidRg
 Y32oI34j7OaaRtezsw/2jEkgOOZXGGujSbhGDvGMCdBj+z2VzK0gpoG/QDrcEtKNckTmf/b+1m4
 9
X-Google-Smtp-Source: AGHT+IGo2YJJn13qsHWxWVdDtMtK1mA4VuW4ZKEeJ4WvlBXuHUgLxvlLtssX76sjRB2k3Owh6Cv4HQ==
X-Received: by 2002:a5d:4c51:0:b0:33b:81c9:f3ce with SMTP id
 n17-20020a5d4c51000000b0033b81c9f3cemr2785884wrt.59.1707774828784; 
 Mon, 12 Feb 2024 13:53:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZIVfcM4PYX+kzvCyUFsnJx8DdOOnMXuyjOXBRhrNPT/JB9Xo2hp259CpldV8jTXifM5g9B6oWgc0cAVnl76IXjDuXeiGUHdtjm3BhM+NmxwGMDMNBhV7TCjVFh7JRoJfm+C9O8qZSnjEiUJjOfYE8mNNCKIOWHRkWsGFtMLVkJ8H414AH8vfAXCJMU1t4vDXcmSWNZQYJuPGRbUUEXIhnCImeVGqzgu/ircgnBNU3cod7
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bx31-20020a5d5b1f000000b0033b5ee36963sm7924432wrb.23.2024.02.12.13.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 13:53:48 -0800 (PST)
Message-ID: <f556b1c4-2743-48bf-be95-457d746eefbf@mind.be>
Date: Mon, 12 Feb 2024 22:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20240209175631.1337370-1-james.hilliard1@gmail.com>
 <Zck6_sR8fspWF37e@landeda>
 <CADvTj4ppD06TSGnYUUBSzB_sV6vErb2ozyMuGr1QjyLtu_pvPA@mail.gmail.com>
 <ZclC3_dSvLTp6Ras@landeda> <18bea399-dc8e-424b-b087-3823d0bd4545@bubu1.eu>
 <CADvTj4pdnvNK3go=5t6PWhU8ax0gNpqwD3kpOUn9RCJV8b2NkA@mail.gmail.com>
 <ae0932bd-dd5c-4082-a34d-af0eea110b20@mind.be>
 <CADvTj4r3sY7qO4XJcPOdq3WieX_3zp7KEheVVkxNjuj64m6vSA@mail.gmail.com>
In-Reply-To: <CADvTj4r3sY7qO4XJcPOdq3WieX_3zp7KEheVVkxNjuj64m6vSA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707774829; x=1708379629; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TEPiO99FqqXEhW48EdAZ0CEOZpuI3Xim9LXU94GwFAc=;
 b=KTMLewbFjFwjA1MuB7d6ObkfwRyJQprk3gqEKgxTx8mz/iDBAqW6Cfi983oxWNC1Rm
 5PDnOnI/0rWTIDjmxP8B1iD2rbnMKCjFjGv7H9C2rutisUeoFcBRbzdXSmi9NqVEonoW
 UmB3Sc32vFxkKj02cthNtiCKovQQ0wF9u2oaTtwyAs1zFYSfk3vZG7iE4SZvOQZgPhuO
 1NtXMDZatOLvIjhQErMF3X2CM4eDMVxl3VVk1C7GZMNGAlhGkWXTV2BF8bWp5HbS+xxz
 lbimO12+XZzQHpdar7gzP74FVjSFqiioGCyFLIxhpM0KHOe9yQZ4jbm8Z5cTKJBv1IE4
 6eHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KTMLewbF
Subject: Re: [Buildroot] [PATCH 1/2] package/python-uvloop: add support for
 cython3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMi8wMi8yMDI0IDIyOjA5LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBPbiBNb24sIEZl
YiAxMiwgMjAyNCBhdCAxMjo1MOKAr1BNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWlu
ZC5iZT4gd3JvdGU6Cj4+Cj4+Cj4+Cj4+IE9uIDEyLzAyLzIwMjQgMDE6NTEsIEphbWVzIEhpbGxp
YXJkIHdyb3RlOgo+Pj4gT24gU3VuLCBGZWIgMTEsIDIwMjQgYXQgNToxM+KAr1BNIE1hcmN1cyBI
b2ZmbWFubiA8YnVpbGRyb290QGJ1YnUxLmV1PiB3cm90ZToKPj4gW3NuaXBdPj4gSW4gc2hvcnQ6
IGlmIHdlIGNvbnRpbnVlIHRvIHVzZSB0aGUgc2Rpc3RzIGZyb20gcHlwaSwgY3l0aG9uIGlzIG5v
dCBhCj4+Pj4gcmVhbCBidWlsZCBkZXBlbmRlbmN5IGFuZCB3ZSBjYW4ganVzdCByZW1vdmUgaXQg
ZnJvbSBweXB0b2plY3QudG9tbAo+Pj4+IGluc3RlYWQgb2YgdHJ5aW5nIHRvIHByb3ZpZGUgdGhl
IGNvcnJlY3QgdmVyc2lvbiB0aGF0J3MgbmV2ZXIgZ29pbmcgdG8KPj4+PiBiZSBpbnZva2VkLgo+
Pj4KPj4+IFdlIGNhbiBwcm9iYWJseSBqdXN0IHBhc3MgLS1za2lwLWRlcGVuZGVuY3ktY2hlY2sg
YXMgYSBidWlsZCBhcmcgb3IKPj4+IHNvbWV0aGluZyBsaWtlIHRoYXQgSSBzdXBwb3NlLgo+Pgo+
PiAgICBUaGF0IHNraXBzIF9hbGxfIGRlcGVuZGVuY3kgY2hlY2tzLCBhbmQgd2UgdXN1YWxseSB3
YW50IHRvIGNoZWNrIGRlcGVuZGVuY2llcy4KPj4gVW5sZXNzIHRoZSBkZXBlbmRlbmN5IGNoZWNr
IHdpbGwgcmVxdWlyZSBob3N0IHBhY2thZ2VzIGZvciBydW50aW1lIGRlcGVuZGVuY2llcz8KPj4g
QnV0IGlmIHRoYXQgd2VyZSB0aGUgY2FzZSB3ZSdkIGFscmVhZHkgaGF2ZSBhIGxvdCBvZiB1c2Vs
ZXNzIGhvc3QtcHl0aG9uLWZvbwo+PiBwYWNrYWdlcyBJIGV4cGVjdC4uLgo+IAo+IFllYWgsIHNv
IHJ1bnRpbWUgZGVwZW5kZW5jaWVzIGFyZSBiYXNpY2FsbHkgbm90IGNoZWNrZWQgYXQgYWxsIHNp
bmNlIHdlIGRvbid0Cj4gZ2VuZXJhbGx5IGhhdmUgYnVpbGRyb290IHRhcmdldCBweXRob24gcGFj
a2FnZXMgd2hpY2ggZGVwZW5kIG9uIG90aGVyIGJ1aWxkcm9vdAo+IHRhcmdldCBweXRob24gcGFj
a2FnZXMsIHRoZXkgbWVyZWx5IHNlbGVjdCB0aGVpciBkZXBlbmRlbmNpZXMgd2hpY2ggYWxsb3dz
IGZvcgo+IHRoZWlyIGRlcGVuZGVuY2llcyB0byBiZSBidWlsdCBwYXJhbGxlbCBidXQgcHJldmVu
dHMgYW55IHNvcnQgb2YgdGFyZ2V0IHBhY2thZ2UKPiBkZXBlbmRlbmN5IHZhbGlkYXRpb24uCj4g
Cj4gSSB0aGluayB0aGF0IC0tc2tpcC1kZXBlbmRlbmN5LWNoZWNrIGZsYWcganVzdCBkaXNhYmxl
cyBwZXA1MTcgYnVpbGQgZGVwZW5kZW5jeQo+IGNoZWNrcyB3aGljaCB3b3VsZCBiZSB0aG9zZSBo
b3N0LXB5dGhvbi1mb28gYnVpbGQgZGVwZW5kZW5jaWVzIHRoYXQgc29tZSBoYXZlLgoKICBPaCwg
YW5kIGEgbWlzc2luZyBidWlsZCBkZXBlbmRlbmN5ICh0aGF0IGlzIGFjdHVhbGx5IHVzZWQpIHdv
dWxkIGFjdHVhbGx5IAp0cmlnZ2VyIGEgYnVpbGQgZXJyb3IsIHNvIGluZGVlZCBpdCBzb3VuZHMg
bGlrZSB0aGUgcGVwNTE3IGJ1aWxkIGRlcGVuZGVuY3kgCmNoZWNrIGlzIHF1aXRlIHJlZHVuZGFu
dC4KCiAgUmVnYXJkcywKICBBcm5vdXQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
