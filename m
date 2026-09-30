Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E81CA5FB1
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 11:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5175F608AA;
	Wed, 30 Sep 2026 11:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbqpYVYUa4yR; Wed, 30 Sep 2026 11:54:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 40F3460A8A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790769280;
	b=QDSAYKAI/6zL394+SW+zS3WRBZGlJcFNy2ZoIDMkNVWxrO4DzxUe0tF/cmQn4BdcyBjK
	 JZyjzhB0YcEoxxytPalnVwkbdh+mKl6CsFGU78srafKaJe3OoFWttVGP/HQVsB+z3MdZt
	 eYRi3D0aYBziZEeZAlCTLdvl95UjRddV1/rEX0/OrVMDhAo5f72ps1xjY0dsZv4nwXLWR
	 x7cZ2bhArXSsdlaNkNFlFJdPjXDCVWl7/4RGE03ullATHeE9GKrURpOOYSiOvsTN3aSyz
	 ZdJQXsPhIb9IVj/IdebhLOKOHPjp9XImJQ5OQPVOXscz4EdlL74sS+btssn4mKVvSQQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790769280;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ou7al8KddhvIEsyu9lIS9WBBf48l0LuEDYAjf7F5akM=;
	b=dqMbQq+wRAsYiz/EzjzoZX/0dBAelJ+ATrLh6bDQV6lIpuwGO3hNdbaY/UQrth9Nb/Za
	 6RkBz+C5yMopsRU3lOFKuWQ8ShBr49B35/G+QPvi1OoQUIwCdDSq652R6R3VKXfy2xbOj
	 /wg1MYvlc5U5Mzs7h9MNdhkxdZUbrYRQOuM1z9KSx7k6PLusjKHy+KMeP9fj1zsOUogun
	 OXoSJolfSWk1OfnmaABlWQC5r4AHWgL7cXYSlk2bMaESwlxQy8tqKYnLTpfpT9Spp/ujx
	 bApA9QxgJVbFqpnSLd0cX0nsCFxBGqg0SBf3NQYncDCxuE/9S1lbNZBeZkm5OBsxLeg==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790769280;
	bh=Ou7al8KddhvIEsyu9lIS9WBBf48l0LuEDYAjf7F5akM=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gqyUw5cthLIx+ly5Fk7PfreHG56P4AvIUXxX6+5Xlo+9QNffqvfbDB3ek7GcYlStX
	 oPkUzowwXHmh/28R1FJtDqtGjol9SsJ8nvps8XNLC9sWW6FLQr5+sIh313cmFcvwhK
	 GonAnm2xTbi3aEYMM4m/uX9YO3kjMdAPhaZqSXReKyT7SdMhEpXD6tG36SfAitOn5d
	 HP3E4yDBioiSt6FIMIB7v3S3JvZSB3JQLdzwlz5dNz70t0WQcr4seyuSx309tA/Kk8
	 oYUY9TxyL05KIjULXFI8FLBwX7x+YZcJ+9oRwbnOwv7KKgOsAoIUlwD9DxWD1hqRrQ
	 EVH8lsZID244Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40F3460A8A;
	Wed, 30 Sep 2026 11:54:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E70E024E
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 11:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D84C880FA9
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 11:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzQSn2ssu4ft for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 11:54:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 884B180F8B
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790769278;
 b=kD52e5y9vwj2NO5lhn3zW7BkE//aoB5lUe+ZZgljR4QlIq3m9DPg91yemiNHRGVLqSAi
 S/2SLGjvReAIXCIox9WRehLNccP2GnMwSx36Hm1m28pUPjhJxGNkQIbDg6onqDv4hVS2s
 x3kiZkdZkQVWj5ogwdKybu48uOJWE94D+mnBDziuMcgjwoz017cRJs+QK++dfcYzoL2WG
 sqw9El1g85//3Gtt4totjWi6vuGm0HjOD3gFm1LW4sxRxvaJ/d13T75ksdxMCsMxiy2s+
 iNsR4S3c6GHZjAKgwW487hoif+DTY0wRPdbs95uPaDs2RdOQ9Sm41JzaOrEWJbLSKhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790769278;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=pS6H/yVsnCm6eag7bjagtiZKd2daL0usUnH9z55HuZg=;
 b=kGeM/amC4tGbakB3q79RtneAHVpk5dBN8tz9HL0Jdy6BGX/mMGgWvwdJ63wS8rV8HsIO
 RVicx9xp1Es4beAGvS1O7cwN/8BV9LfXMx99KaKCerl/UztN2ARg7RhXIR/O6uWY+Wji5
 0duKLskilqvHH/bCcpLEoWnr+HrBDnziRF+14vvu17ejg4hYTWS2MWuixdg/MbkPPoo+/
 yBlVk32VrL4ni8OabZ4VG5exCxCftEMgqYlwTpzDNomCW4jcwIte91bgAUIBB4thydURv
 40QKc/R2NdXaUE88kvyr8V9rQ8eBoWle7wdIgxGKazgM8mjgwWwpHoLO3no7Wb0rn1A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=rxibSlCq; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:33::e"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:33::e;
 helo=mail-ed2-x0e.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ed2-x0e.google.com (mail-ed2-x0e.google.com
 [IPv6:2a00:1450:4864:33::e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 884B180F8B
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 11:54:37 +0000 (UTC)
Received: by mail-ed2-x0e.google.com with SMTP id
 4fb4d7f45d1cf-6ab01dda422so5395608a12.0
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 04:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790769275; cv=none;
 d=google.com; s=arc-20260327;
 b=UeYoR/pp0RKUOSfe4/7rNyBFr7kuhTA3wfHy+/frxKYnq067XnvP38D8knD0gTd4OJ
 vTDZrNHffZIp6IxQ1G3Y9FWAzzgKGUwXnXtPcvwv33ztT7bDP98c4JWgBQf4zPXuMcbk
 ITb3CjAnzzm22iMqsKccWuA6WT2HLO81hcBIwah84orV0T0qfKKhdmhFoU9wwyT8Jwv3
 NtfMXdCgLeCq/EjngUiqt8Nrs7qrPaGZYpio+1dw9jB6lNbNPRquC9GJlZyT0OIwPUqC
 GBSeAjtfKkY5WIP9WjJ2wCRkKVDILIkAbfJqdiEnijF0WK7H6DSCBPgoRVJGMAj6OjTJ
 SWsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pS6H/yVsnCm6eag7bjagtiZKd2daL0usUnH9z55HuZg=;
 fh=Y3my2KWZRmiVP28SRb1lFtAk5I9Uyoku0EkNu5NChaM=;
 b=a8zS2iV29Ti8ZsOFIPsprXIP5075p+n92+U1xzweWgGn0U991ijUifYdFd6095CYCS
 4QV43Qui8GMm/H74hanDiUiXN0atmmuMqgwISXcbvo8DA76Ntzc1Vdr7GsFJVgganIjH
 4gY2MREP03AfI6c4z2vHKkmw+WWMKqEV1fgf6n4pBE4nbq28d/PiMTvAWCMM6aIzip0j
 Bd8oZc3L4GD6mEJy0Ilp0tOp5tdkbpoILVRY+SDOOlm+CkcCLF28uDTcsLa90AltfUPT
 738CYNy9xI29/Iq54T+j/vzId4XTKLBAE+CnOgWDf4VfDF2XAnGxokjGC4n0xZuzAmvY
 6hYA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790769275; x=1791374075;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pS6H/yVsnCm6eag7bjagtiZKd2daL0usUnH9z55HuZg=;
 b=Ew+qmTCTHtvibUX6gkVTkUXFgSCOe5Qyt2i+qiEvae+4s1+D5POo7JXG8gWOFsmrXL
 wJDNhOit/j0m11pIxR6jYuHC18KTa/D6W+pTwzG/KKMG51a2lETwhuvvA9HR1pGGFOkw
 +ROLE8vNwHVL++fy7Sm4Z6rCE/K2TCuccZ3wP7Wk3uj9s0pH8iMQxn26shBQcqEabH6s
 CTF02R3KqI+azlQkt4++fD3cA9KJOkaaqX3kAq5TJOmihJZet6fplrBaiUaq/Ru1vBwO
 V199FA2fFwwYScvEoaPoKef5T7thYmG2iSHlH/7xtphhiCaZOcwGaI7JXxBiNcoSWUUB
 LQHw==
X-Gm-Message-State: AFq9FYIEQNBpHDeS2GFnA0WQWsQbDs0wuqMxIbnDtsE1VXEWgSIsIdqV
 pjbOFakoll4thErNTJqDtBhWW22iz2fK28Hv8ajhTK2O/IRpjzPlrtiDkqfKkXT4EN8NcRK6Pj3
 cHrvZiS26TjMRIcB/ks1bM4AHAGRHKgsrNoih
X-Gm-Gg: AYBFou0Lwn2wvd6vh99usdBTZKWk4b//2jxxzQWC39JbPEzADypHxKrt3inJMRodoae
 eI3gbhTuhOMKpvFTGFAPDFBFCB3Ei73KgOoX9aky+Q4MR5TTfQ9kkXgDuUOUcMSNYhB87zcGduS
 StoDF0I98+koX+zKstQQwAnmQoK/wA5frKM7az/dTJaZGS45YmXbsXZ4ivV89FhhefNyMVRSbnl
 CPV+Ap32j586VgSyK0RZ8308bdcqudSX/eN4lONOPqHs/6C5i3CYxS3PWQva/mk/NypsJINOQX5
 CkZE6NxlSeQWGDZltKriAWUuqPai6Pvb9FaLZocLfVKKy1vTab93b06m
X-Received: by 2002:a05:6402:3899:b0:6ac:7868:b690 with SMTP id
 4fb4d7f45d1cf-6ae198f247dmr774612a12.8.1790769274716; Wed, 30 Sep 2026
 04:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260907213335.3492307-1-julien.boibessot@armadeus.com>
In-Reply-To: <20260907213335.3492307-1-julien.boibessot@armadeus.com>
Date: Wed, 30 Sep 2026 13:55:01 +0200
X-Gm-Features: AclHuK-7iyiLkDtgL15UdPWNdUIYqdeQkbvZeLqGY9ZC6Pb-WB_VALE66DJbn9A
Message-ID: <CAGm1_ksjYJBHS2UtPEDajYH8m8hBHmXk2Fcgwm-szyh8AWvmpA@mail.gmail.com>
To: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodbus: bump version to 3.2.0
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

T24gVHVlLCBTZXAgOCwgMjAyNiBhdCAxMjoxMuKAr0FNIEp1bGllbiBCT0lCRVNTT1QKPGp1bGll
bi5ib2liZXNzb3RAYXJtYWRldXMuY29tPiB3cm90ZToKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9z
dGVwaGFuZS9saWJtb2RidXMvYmxvYi92My4yLjAvTkVXUy5tZAo+Cj4gbGlibW9kYnVzIDMuMi4w
IGFkZHMgdGVybWlvczIgc3VwcG9ydCB0byBhbGxvdyBjdXN0b20gYmF1ZCByYXRlcyAoUlRVKSwK
PiBidXQgdGhlIFRDR0VUUzIvVENTRVRTMiBpb2N0bCBjb25zdGFudHMgYXJlIG5vdCBleHBvc2Vk
IGJ5IG11c2wgdGhyb3VnaAo+IDxzeXMvaW9jdGwuaD4uIEFkZCBhIHBhdGNoIHRvIGluY2x1ZGUg
PGFzbS9pb2N0bHMuaD4sIHdoaWNoIGRlZmluZXMKPiB0aGVzZSBjb25zdGFudHMgb24gYWxsIExp
bnV4IGxpYmMsIGZpeGluZyB0aGUgYnVpbGQgd2l0aCBtdXNsLgo+Cj4gQWRkZWQgdGFyYmFsbCBo
YXNoIHByb3ZpZGVkIGJ5IHVwc3RyZWFtLgo+Cj4gQnVtcCByZXF1ZXN0ZWQgYnkgQnVpbGRyb290
J3MgYXV0b2J1aWxkZXIuCj4KPiBCdWlsZCB0ZXN0ZWQgd2l0aCB0ZXN0LXBrZyAoNiB0b29sY2hh
aW5zIDogdWNsaWJjLCBnbGliYywgbm9NTVUsIG11c2wsIHN0YXRpYywgb2xkIGdsaWJjKS4KPgo+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBCT0lCRVNTT1QgPGp1bGllbi5ib2liZXNzb3RAYXJtYWRl
dXMuY29tPgoKUmV2aWV3ZWQtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVt
YWlsLmNvbT4KCj4gLS0tCj4gIC4uLi1pbmNsdWRlLWFzbS1pb2N0bHMuaC1mb3ItdGVybWlvczIt
cy5wYXRjaCB8IDQwICsrKysrKysrKysrKysrKysrKysKPiAgcGFja2FnZS9saWJtb2RidXMvbGli
bW9kYnVzLmhhc2ggICAgICAgICAgICAgIHwgIDQgKy0KPiAgcGFja2FnZS9saWJtb2RidXMvbGli
bW9kYnVzLm1rICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0MyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9saWJtb2RidXMvMDAwMS1zcmMtbW9kYnVzLXJ0dS1pbmNsdWRlLWFzbS1pb2N0bHMuaC1mb3It
dGVybWlvczItcy5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibW9kYnVzLzAwMDEt
c3JjLW1vZGJ1cy1ydHUtaW5jbHVkZS1hc20taW9jdGxzLmgtZm9yLXRlcm1pb3MyLXMucGF0Y2gg
Yi9wYWNrYWdlL2xpYm1vZGJ1cy8wMDAxLXNyYy1tb2RidXMtcnR1LWluY2x1ZGUtYXNtLWlvY3Rs
cy5oLWZvci10ZXJtaW9zMi1zLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwLi4yMWI0ZWNlYmJkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbGli
bW9kYnVzLzAwMDEtc3JjLW1vZGJ1cy1ydHUtaW5jbHVkZS1hc20taW9jdGxzLmgtZm9yLXRlcm1p
b3MyLXMucGF0Y2gKPiBAQCAtMCwwICsxLDQwIEBACj4gK0Zyb20gNWY2YWY5ZTBlM2Q2YWRlYmMx
MDNhMWY1YTQ1YTViMGQ5YzVhN2UxMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTog
SnVsaWVuIEJPSUJFU1NPVCA8anVsaWVuLmJvaWJlc3NvdEBhcm1hZGV1cy5jb20+Cj4gK0RhdGU6
IE1vbiwgMDcgU2VwIDIwMjYgMTg6NTQ6MDAgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSBzcmMv
bW9kYnVzLXJ0dTogaW5jbHVkZSA8YXNtL2lvY3Rscy5oPiBmb3IgdGVybWlvczIgc3VwcG9ydAo+
ICsKPiArU2luY2UgdjMuMi4wLCBsaWJtb2RidXMgdXNlcyB0aGUgTGludXggdGVybWlvczIgaW50
ZXJmYWNlIChUQ0dFVFMyLAo+ICtUQ1NFVFMyKSB0byBzdXBwb3J0IGN1c3RvbSBiYXVkIHJhdGVz
LiBUaGUgY29uZmlndXJlIGNoZWNrIGRldGVjdHMKPiArInN0cnVjdCB0ZXJtaW9zMiIgdmlhIDxh
c20vdGVybWJpdHMuaD4sIGJ1dCB0aGUgVENHRVRTMi9UQ1NFVFMyIGlvY3RsCj4gK2NvbnN0YW50
cyBhcmUgZGVmaW5lZCBpbiA8YXNtL2lvY3Rscy5oPiwgd2hpY2ggaXMgbm90IGluY2x1ZGVkIGJ5
IG11c2wKPiArbGliYyB0aHJvdWdoIDxzeXMvaW9jdGwuaD4uCj4gKwo+ICtUaGlzIGJyZWFrcyB0
aGUgYnVpbGQgb24gbXVzbC1iYXNlZCBzeXN0ZW1zOgo+ICsKPiArICBtb2RidXMtcnR1LmM6IGVy
cm9yOiAnVENHRVRTMicgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCj4g
KyAgbW9kYnVzLXJ0dS5jOiBlcnJvcjogJ1RDU0VUUzInIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKQo+ICsKPiArSW5jbHVkZSA8YXNtL2lvY3Rscy5oPiBhbG9uZ3NpZGUg
PHN5cy9pb2N0bC5oPiB3aGVuIEhBVkVfU1RSVUNUX1RFUk1JT1MyCj4gK2lzIGRlZmluZWQgdG8g
ZXhwb3NlIHRoZSBUQyoyIGlvY3RsIGNvbnN0YW50cyBvbiBhbGwgTGludXggbGliYy4KPiArCj4g
K1Vwc3RyZWFtOiBub3QgeWV0Cj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gQk9JQkVTU09U
IDxqdWxpZW4uYm9pYmVzc290QGFybWFkZXVzLmNvbT4KPiArLS0tCj4gKyBzcmMvbW9kYnVzLXJ0
dS5jIHwgMSArCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiArCj4gK2RpZmYg
LS1naXQgYS9zcmMvbW9kYnVzLXJ0dS5jIGIvc3JjL21vZGJ1cy1ydHUuYwo+ICtpbmRleCAyYTA2
M2ZiMS4uZDg0MTRkMmQgMTAwNjQ0Cj4gKy0tLSBhL3NyYy9tb2RidXMtcnR1LmMKPiArKysrIGIv
c3JjL21vZGJ1cy1ydHUuYwo+ICtAQCAtMTQsNiArMTQsNyBAQAo+ICsgI2VuZGlmCj4gKyAjaWYg
ZGVmaW5lZChIQVZFX1NUUlVDVF9URVJNSU9TMikKPiArICNpbmNsdWRlIDxzeXMvaW9jdGwuaD4K
PiArKyNpbmNsdWRlIDxhc20vaW9jdGxzLmg+Cj4gKyAjZW5kaWYKPiArICNpbmNsdWRlICJtb2Ri
dXMtcHJpdmF0ZS5oIgo+ICsgI2luY2x1ZGUgPGFzc2VydC5oPgo+ICstLQo+ICsyLjQzLjAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtb2RidXMvbGlibW9kYnVzLmhhc2ggYi9wYWNrYWdlL2xp
Ym1vZGJ1cy9saWJtb2RidXMuaGFzaAo+IGluZGV4IGRkY2E4MzVmMzQuLmRjNTY3NGYzMDggMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJtb2RidXMvbGlibW9kYnVzLmhhc2gKPiArKysgYi9wYWNr
YWdlL2xpYm1vZGJ1cy9saWJtb2RidXMuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+IC0jIEZyb20g
aHR0cHM6Ly9naXRodWIuY29tL3N0ZXBoYW5lL2xpYm1vZGJ1cy9yZWxlYXNlcy90YWcvdjMuMS4x
Mgo+IC1zaGEyNTYgIDJmNGQ0MTkxY2QxOTZjMWZiYTEzMWRhZWMwM2I2MjFkYjc1MTI5ZDgyNTVj
ODMyZmM2NmIyNTlkOWZjNDZlN2IgIGxpYm1vZGJ1cy0zLjEuMTIudGFyLmd6Cj4gKyMgRnJvbSBo
dHRwczovL2dpdGh1Yi5jb20vc3RlcGhhbmUvbGlibW9kYnVzL3JlbGVhc2VzL3RhZy92My4yLjAK
PiArc2hhMjU2ICA3MjIzOWYzMTliOWI4NDgzZTNkMzkzYzVhNjA4NjVkNzM0ZmNmZjE4YThhYmJi
MjQ4NmUzODk4MzRhMmY2ZWYxICBsaWJtb2RidXMtMy4yLjAudGFyLmd6Cj4gICMgTG9jYWxseSBj
b21wdXRlZAo+ICBzaGEyNTYgIGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBlNTZjOTdh
NjRmZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgIENPUFlJTkcuTEVTU0VSCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbGlibW9kYnVzL2xpYm1vZGJ1cy5tayBiL3BhY2thZ2UvbGlibW9kYnVzL2xpYm1v
ZGJ1cy5tawo+IGluZGV4IDVkMjBhZWYzNWMuLjM2ZTMyZmU1ZDQgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9saWJtb2RidXMvbGlibW9kYnVzLm1rCj4gKysrIGIvcGFja2FnZS9saWJtb2RidXMvbGli
bW9kYnVzLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPgo+IC1MSUJNT0RCVVNfVkVSU0lPTiA9IDMuMS4xMgo+ICtMSUJNT0RCVVNfVkVSU0lPTiA9
IDMuMi4wCj4gIExJQk1PREJVU19TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL3N0ZXBoYW5lL2xp
Ym1vZGJ1cy9yZWxlYXNlcy9kb3dubG9hZC92JChMSUJNT0RCVVNfVkVSU0lPTikKPiAgTElCTU9E
QlVTX0xJQ0VOU0UgPSBMR1BMLTIuMSsKPiAgTElCTU9EQlVTX0xJQ0VOU0VfRklMRVMgPSBDT1BZ
SU5HLkxFU1NFUgo+IC0tCj4gMi40My4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
