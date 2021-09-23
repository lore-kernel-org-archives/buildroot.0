Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED3DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:52:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 501F76124C
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 501F76124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EACF060AFE;
	Thu, 23 Sep 2021 20:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3HQYo5Iwx_ch; Thu, 23 Sep 2021 20:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05F9E60B25;
	Thu, 23 Sep 2021 20:52:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20C111BF304
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F91E415A4
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:52:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0KHmgNYpTl8 for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 20:52:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B038C41596
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 20:52:39 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t28so7475800wra.7
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OoVNASSZg6rSrXsa/c8v90iNl4I4RVrjaOLQm1dYsR0=;
 b=C8uz35tCDKX9/H3wIHPHLhFlOTWM0/IbOK+bUXb7rIrVkElXQSY5R2Blx2sIAupH7H
 qPnYqLkHFejQlGmp9ywqUkGeAyPnpAOG4txLVf6sbLZDcuN/tetzyd703EcriBCrAQ7m
 t4mWH1+XsxKyODqtTpUzesInEOxqDXMQiDa+qADEllxU22Tbel/h7kV591lwS8rFi151
 O0NlPnsEb+TPLm4J5QxHcynLZaauBifWkGzGBtkJiLJpOzFwDyS4u1OssiC26SH1LFHU
 ZZ8dPqPbD9xr8OJKQmxqLUAlIv9nHWHEQOyPteDx08HgxNAUHaSX0of5E6f3Ovd08k7/
 yI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OoVNASSZg6rSrXsa/c8v90iNl4I4RVrjaOLQm1dYsR0=;
 b=FhH/YHqbkM1Qc1TNohW36mmUxEjhW2GZNdxVoIkVWkli1erVpf/ewMG/OR52e6ETS1
 5nEb30EXMk2U4u3SQLH3CrUUFFgZkjSpBsV7YBDeeG31UGn+I5vNmwIhP39pbk8klCMj
 BR5MydjAJn6eEKg2oL98J+25anYOBoVx/zfAFmoH1ZgU/KX/k5tFv/h6nQZsPou4iDJ6
 oJ9o19lLIvhiYIM8PT2FiRB0DkrcOfMD2rHN5/vamot1t0ebtUfVL5tk5eDWBZyF9r75
 H4zS4udnb+w2NtsiAUUiqKNzmOBblQlVRQ+dzkziFAr0WvUF1OGl1cFWM+PScNaX13jF
 jR9w==
X-Gm-Message-State: AOAM530iyOvGRcT1rl5n7tnHytKYoYh0I16nQDkVuWjlGqwt3KJKH4gP
 NptQRi9phmj7zKfYCDeIQkk=
X-Google-Smtp-Source: ABdhPJxeOIATFdhWz2gZeW3jtlcTub8OKwqoIVxjGZkfOEYEyyl1jhwVO/lY0aQGH1q+M+oRf+2yLQ==
X-Received: by 2002:a05:600c:4f83:: with SMTP id
 n3mr6518219wmq.114.1632430357840; 
 Thu, 23 Sep 2021 13:52:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id y197sm11929282wmc.18.2021.09.23.13.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 13:52:37 -0700 (PDT)
Message-ID: <8c9191ba-efe8-5277-8d66-791157a52d90@gmail.com>
Date: Thu, 23 Sep 2021 22:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210912141140.253778-9-romain.naour@gmail.com>
 <20210922201027.934860-1-arnout@mind.be>
 <074d7a6f-bebc-1b36-f845-34ab5297d707@gmail.com>
 <f40b51e0-815d-76dc-f44b-482e9adeaaf5@mind.be>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <f40b51e0-815d-76dc-f44b-482e9adeaaf5@mind.be>
Subject: Re: [Buildroot] [PATCH] .gitlab-ci.yml: update docker image to
 20210922.2200
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gQXJub3V0LAoKT24gMjMvMDkvMjAyMSAyMDoyNSwgQXJub3V0IFZhbmRlY2FwcGVsbGUg
d3JvdGU6Cj4gCj4gCj4gT24gMjIvMDkvMjAyMSAyMzo0NSwgUm9tYWluIE5hb3VyIHdyb3RlOgo+
PiBIaSBBcm5vdXQsCj4+Cj4+IExlIDIyLzA5LzIwMjEgw6AgMjI6MTAsIEFybm91dCBWYW5kZWNh
cHBlbGxlIChFc3NlbnNpdW0vTWluZCkgYSDDqWNyaXTCoDoKPj4+IENvbW1pdCA3MWI4MzIyNzEy
OGJlNjJjMTY5MzEzZTg1YmI4ZjMzOWY5NzdhZDY3IHVwZGF0ZWQgdGhlIERvY2tlcmZpbGUKPj4+
IHRvIGJlIHVzZWQgaW4gQ0kgdGVzdHMuIEluIG9yZGVyIHRvIGFjdHVhbGx5IHVzZSB0aGlzIG5l
dyBkb2NrZXIgaW1hZ2UsCj4+PiB1cGRhdGUgLmdpdGxhYi1jaS55bWwgdG8gcG9pbnQgdG8gdGhl
IGRvY2tlciBpbWFnZSB0aGF0IHdhcyBjcmVhdGVkIHdpdGgKPj4+IHRoZSB1cGRhdGVkIERvY2tl
cmZpbGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vu
c2l1bS9NaW5kKSA8YXJub3V0QG1pbmQuYmU+Cj4+Cj4+IFRoZXJlIGFyZSBzb21lIG5ldyBpc3N1
ZXMgc2luY2UgbGFzdCB0aW1lIEkgdGVzdGVkOgo+Pgo+PiBXaXRob3V0IHB5dGhvbiBpbnN0YWxs
ZWQsIHN5c2xpbnV4IGRvZXNuJ3QgYnVpbGQuCj4+Cj4+IFRlc3RTeXNMaW51eFg4NkVGSS9idWls
ZC9zeXNsaW51eC02LjAzL2NvbTMyL2NtZW51L21lbnVnZW4ucHkgWy4uLl0KPj4gbWFrZVs2XTog
cHl0aG9uOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4+Cj4+IGh0dHBzOi8vZ2l0bGFiLmNv
bS9rdWJ1OTMvYnVpbGRyb290Ly0vam9icy8xNjE0NDQ2NzY2Cj4gCj4gwqBGb3IgdGhhdCwgd2Ug
anVzdCBuZWVkIHRoZSBweXRob24taXMtcHl0aG9uMyBwYWNrYWdlIChvciB3aGF0ZXZlciBpdCdz
IGNhbGxlZCkuCj4gT3IsIGJldHRlciB5ZXQsIGxldCBzeXNsaW51eCBkZXBlbmQgb24gaG9zdC1w
eXRob24zLgoKQWN0dWFsbHkgcHl0aG9uIGlzIG5vdCBhIG1hbmRhdG9yeSBkZXBlbmRlbmN5IG9m
IEJ1aWxkcm9vdC4KV2l0aCBweXRob24taXMtcHl0aG9uMyBpbnN0YWxsZWQgaXQgZG9lc24ndCBm
aXggdGhlIGRlcGVuZGVuY3kgaXNzdWUgZm9yIGdvb2QuCgpJdCBzZWVtcyB3ZSBjYW4gb3ZlcnJp
ZGUgdGhlIHB5dGhvbiBpbnRlcnByZXRlcjoKaHR0cHM6Ly9yZXBvLm9yLmN6L3N5c2xpbnV4Lmdp
dC9jb21taXRkaWZmLzRkZWM2MmNlOWMyYzBkMTcwZjIxYjNhZTJkN2M2MThlYjdhMzBjMDUKClNv
IHdlIGNhbiBmb3JjZSBzeXNsaW51eCB1c2luZyB0aGUgcHl0aG9uMyBpbnRlcnByZXRlciBwcm92
aWRlZCBieSBob3N0LXB5dGhvbjMuCgo+IAo+IAo+PiBUaGVyZSBpcyBhIG5ldyBpc3N1ZSB3aXRo
IHB5dGhvbi1hdHRycyB0ZXN0IHdoZW4gcHl0aG9uMiBpcyBub3QgaW5zdGFsbGVkOgo+PiBodHRw
czovL2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL2pvYnMvMTYxNDQ0Njk0Mwo+PiBodHRw
czovL2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL2pvYnMvMTYxNDQ0NjkzOQo+IAo+IMKg
SSBzdXNwZWN0IHRoYXQgdGhhdCdzIGp1c3QgYmVjYXVzZSBweXRob24tYXR0cnMgbm8gbG9uZ2Vy
IHN1cHBvcnRzIHB5dGhvbjIuIEl0Cj4gaGFwcGVucyBvbiB0aGUgYXV0b2J1aWxkZXJzIGFzIHdl
bGw6Cj4gCj4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMTc1LzE3NWMy
ZGQ4MmRkMzA1ZWQ4OGI0ZDE3ODBiZDhjNTJlNGY2NTFkZTUvCj4gCgpJdCBzZWVtcyBhIGZpeCBp
cyBub3cgYXZhaWxhYmxlOgpodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvcGF0Y2gvMjAyMTA5MjMxODM3NTEuMzYxMzg2LTEtYXNhZmthN0BnbWFpbC5jb20vCgo+
IAo+IMKgQW5kIEkgaGF2ZSB0aGUgc2FtZSBmYWlsdXJlIHdoZW4gSSBidWlsZCBvbiBteSBsYXB0
b3AsIHdoaWNoIGRvZXMgaGF2ZSBweXRob24yCj4gaW5zdGFsbGVkICh0aG91Z2ggL3Vzci9iaW4v
cHl0aG9uIGlzIHB5dGhvbjMpLgo+IAo+IAo+PiBTdHJhbmdlIHB5dGhvbiBpc3N1ZSB3aXRoIHJl
ZnBvbGljeS0yLjIwMjEwOTA4IGJ1aWxkOgo+PiBodHRwczovL2dpdGxhYi5jb20va3VidTkzL2J1
aWxkcm9vdC8tL2pvYnMvMTYxNDQ0NjgyNi8KPiAKPiDCoEFyZSB5b3Ugc3VyZSBpdCBpcyByZWxh
dGVkIHRvIHB5dGhvbj8gSSBhbHNvIGdldCB0aGUgc2FtZSBlcnJvciB3aGVuIEkgYnVpbGQgaXQK
PiBsb2NhbGx5IG9uIG15IGxhcHRvcC4KCk5vLCBJIHJldmVydGVkIHRoZSBsYXN0IHZlcnNpb24g
YnVtcCBvZiByZWZwb2xpY3kgYW5kIHRoZSB0ZXN0IHN1Y2NlZWQuCkl0IHNlZW1zIGEgcmVmcG9s
aWN5IGlzc3VlLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IAo+IMKgUmVnYXJkcywKPiDC
oEFybm91dAo+IAo+Pgo+Pgo+PiBCdXQgdGhlIGlzc3VlIEkgaGFkIHdpdGggVGVzdENoZWNrUGFj
a2FnZSBpcyBmaXhlZCB3aXRoIHRoZSByZWNlbnQgc3dpdGNoIHRvCj4+IHB5dGhvbjMuCj4+Cj4+
IGh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vam9icy8xNjE0NDQ3MjM2Cj4+
Cj4+IFdpdGggYWxsIGlzc3VlcyBmaXhlZDoKPj4gwqDCoCBBY2tlZC1ieTogUm9tYWluIE5hb3Vy
IDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+PiDCoMKgIFRlc3RlZC1ieTogUm9tYWluIE5hb3Vy
IDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IFJvbWFpbgo+
Pgo+Pj4gLS0tCj4+PiDCoCAuZ2l0bGFiLWNpLnltbCB8IDIgKy0KPj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS8u
Z2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2kueW1sCj4+PiBpbmRleCBiZjlmMmRjYTZjLi4xNTBi
OGVhYzFhIDEwMDY0NAo+Pj4gLS0tIGEvLmdpdGxhYi1jaS55bWwKPj4+ICsrKyBiLy5naXRsYWIt
Y2kueW1sCj4+PiBAQCAtMSw3ICsxLDcgQEAKPj4+IMKgICMgQ29uZmlndXJhdGlvbiBmb3IgR2l0
bGFiLUNJLgo+Pj4gwqAgIyBCdWlsZHMgYXBwZWFyIG9uIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC9waXBlbGluZXMKPj4+IMKgIC1pbWFnZTogYnVpbGRyb290L2Jh
c2U6MjAyMDA4MTQuMjIyOAo+Pj4gK2ltYWdlOiBidWlsZHJvb3QvYmFzZToyMDIxMDkyMi4yMjAw
Cj4+PiDCoCDCoCBzdGFnZXM6Cj4+PiDCoMKgwqAgLSBnZW5lcmF0ZS1naXRsYWItY2kKPj4+Cj4+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
