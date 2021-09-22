Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8155C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 20:50:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 700F96115A
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 20:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 700F96115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21CB383F6E;
	Wed, 22 Sep 2021 20:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ek61k0seie6s; Wed, 22 Sep 2021 20:50:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AD8D83B31;
	Wed, 22 Sep 2021 20:50:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0102F1BF37F
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 20:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0D1240604
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 20:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fr5Nx3lpmfqW for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 20:50:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AA874060C
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 20:50:53 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t8so10777381wrq.4
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 13:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rDVc9ckzj0TE8WuoCBdA+JPRpAovGNq7dKoouYoP7YY=;
 b=ORrdiYUY8AuItKYjKOw0NJXtsheRQVdU2OUU+n/yESKsBBT4twb3QX73BVYSJ0JteN
 c6hq/z3YoqYyTFfUaaq8qA0l4QgLV7W5quXHlYAv074Z6fbKWFZyugwUkmU9Cb+6/nlF
 bpD+ue/aEDPFdmLkhFNvGiaoFVidOySj317fNzio8KTSmK5REAUhect57oqL48VDYBxg
 c9fIrgPDK+mISfLp43cOSBrCTEr+rk5ZdThVV8ixGd81u9c1dlhpt1SIFJ46Z7rRSUCV
 AaL8TF95HqRIl5XrvBXoFmhFCppEL6rpFGKxTG5Un8i8kFQtFRje0fVRMazk7kWYflbS
 9XMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rDVc9ckzj0TE8WuoCBdA+JPRpAovGNq7dKoouYoP7YY=;
 b=Rk3zYdhqEQecgzvjFD5Kct7TLLf0cTVULDT/Pu/WLi3lTJSr0vUs57BoDcM0BqKLnS
 3P0pRn/8Mi20UBUAZKC8OL72S6rOgDOUtqP9azoy4fF8/w114ll8EB8dM9iE8JLKG820
 vU35KbFErBRzaB45mEZJW46rEZAwaSmXJHNT/14q3AeuB+G1wvNR2BvRwP2J73WgYb6l
 jyWl44CBJ0dfJRH1uOxDip7XKlvYfshB4JrfEkVsOdprRLxppjxeIMxK3+p+ufxoDhpH
 eNvBLKl+iMljtGjy8xTTIkb6mdKuc9hyjoYVXITvqj4ZLVIgR9BsVSDKJYtZcf63DxpG
 L/DQ==
X-Gm-Message-State: AOAM531UP2eHojd8P0NjGDhNdUkNAUmyynRv3Gqq0zFEsdat1y3pytr7
 sv4Waczxi5oq9W1YNikmdIjcJbLy1So=
X-Google-Smtp-Source: ABdhPJzZxvWO9q7jS8xpPl04ptZGBAsMpGjYX7FzlBxNy3J7/wXXuxxdQNDOft9r3/3JjWKJJEovSA==
X-Received: by 2002:a5d:6750:: with SMTP id l16mr1102949wrw.174.1632343851741; 
 Wed, 22 Sep 2021 13:50:51 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:23a5:a748:5a4b:18cd?
 (2a01cb058f8a180023a5a7485a4b18cd.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:23a5:a748:5a4b:18cd])
 by smtp.gmail.com with ESMTPSA id e2sm3309717wra.40.2021.09.22.13.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 13:50:51 -0700 (PDT)
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210912141140.253778-1-romain.naour@gmail.com>
 <20210912141140.253778-9-romain.naour@gmail.com>
 <d70bb907-428e-ba30-ed79-9700113e00fe@mind.be>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <79918a91-fa6e-2f69-0426-51ca2ed185f0@gmail.com>
Date: Wed, 22 Sep 2021 22:50:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d70bb907-428e-ba30-ed79-9700113e00fe@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 11/16] support/docker: bump docker image for
 the gitlab-ci to Debian bullseye
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gQXJub3V0LAoKTGUgMjIvMDkvMjAyMSDDoCAyMjoxMywgQXJub3V0IFZhbmRlY2FwcGVs
bGUgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAxMi8wOS8yMDIxIDE2OjExLCBSb21haW4gTmFvdXIg
d3JvdGU6Cj4+IFN0YXJ0aW5nIHdpdGggUWVtdSA2LjEuMCwgZ2NjIDcuNSBpcyBuZWVkZWQgdG8g
YnVpbGQuCj4+IFNpbmNlIHdlIGJ1aWxkIGhvc3QtcWVtdSBwYWNrYWdlIGZvciBxZW11IGRlZmNv
bmZpZywgd2UgaGF2ZSB0bwo+PiB1cGdyYWRlIHRvIChhdCBsZWFzdCkgRGViaWFuIGJ1c3RlciB0
aGF0IHByb3ZpZGUgZ2NjIDggYXMgaG9zdCBjb21waWxlci4KPj4KPj4gV2hpbGUgdGVzdGluZyB0
aGlzIHVwZ3JhdGUsIHRoZSB0ZXN0X2VkazIgZmFpbGVkIHNpbmNlIGl0IGFjdHVhbGx5Cj4+IHJl
cXVpcmVzIFFlbXUgPj0gNC4xLjAgdG8gc3VwcG9ydCBhcm0gU0JTQSByZWZlcmVuY2UgbWFjaGlu
ZSBbMV0uCj4+IERlYmlhbiBCdXN0ZXIgb25seSBwcm92aWRlIFFlbXUgMy4xLgo+Pgo+PiBGaW5h
bGx5LCB1cGdyYWRlIHRvIERlYmlhbiBidWxsc2V5ZSBidXQgaXQgcmVxdWlyZXMgc29tZSBsaW51
eAo+PiBrZXJuZWwgdmVyc2lvbiBidW1wIGluIHNldmVyYWwgZGVmY29uZmlncyBzaW5jZSBob3N0
IGdjYyBpcyBiYXNlZAo+PiBvbiBnY2MtMTAgWzJdLgo+Pgo+PiBBZGQgZXhwbGljaXRlbHkgcHl0
aG9uIHBhY2thZ2UgaW4gdGhlIERvY2tlciBmaWxlIHRvIGluc3RhbGwgcHl0aG9uMgo+PiBvbiB0
aGUgaG9zdC4KPj4KPj4gWzFdCj4+IGh0dHBzOi8vZ2l0LnFlbXUub3JnLz9wPXFlbXUuZ2l0O2E9
Y29tbWl0O2g9NjQ1ODA5MDNjMmIzYWVlMDhkNzRkNjRlNjI0OGEzMTNiMjQ2Y2I2OQo+Pgo+PiBb
Ml0KPj4gaHR0cDovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGludXgva2VybmVsL2dpdC9zdGFibGUv
bGludXgtc3RhYmxlLmdpdC9jb21taXQvP2lkPTYyMWYyZGVkNjAxNTQ2MTE5ZmFiY2NkMTY1MWIx
YWUyOWQyNmNkMzgKPj4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4u
bmFvdXJAZ21haWwuY29tPgo+PiAtLS0KPj4gVGhlIGRvY2tlciBpbWFnZSBtdXN0IGJlIHJlYnVp
bGQgYW5kIHB1c2hlZCB0bwo+PiBodHRwczovL2h1Yi5kb2NrZXIuY29tL3IvYnVpbGRyb290L2Jh
c2UvCj4+IC0tLQo+PiDCoCBzdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlwqDCoMKgwqDCoMKgIHwg
NCArKystCj4+IMKgIHN1cHBvcnQvZG9ja2VyL2FwdC1zb3VyY2VzLmxpc3QgfCA4ICsrKystLS0t
Cj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZSBiL3N1cHBvcnQvZG9j
a2VyL0RvY2tlcmZpbGUKPj4gaW5kZXggYTliYWNjYTNhMC4uNzk1YjI2YzI3NiAxMDA2NDQKPj4g
LS0tIGEvc3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZQo+PiArKysgYi9zdXBwb3J0L2RvY2tlci9E
b2NrZXJmaWxlCj4+IEBAIC02LDcgKzYsNyBAQAo+PiDCoCAjIFdlIHVzZSBhIHNwZWNpZmljIHRh
ZyBmb3IgdGhlIGJhc2UgaW1hZ2UgKmFuZCogdGhlIGNvcnJlc3BvbmRpbmcgZGF0ZQo+PiDCoCAj
IGZvciB0aGUgcmVwb3NpdG9yeS4sIHNvIGRvIG5vdCBmb3JnZXQgdG8gdXBkYXRlIHRoZSBhcHQt
c291cmNlcy5saXN0Cj4+IMKgICMgZmlsZSB0aGF0IGlzIHNoaXBwZWQgbmV4dCB0byB0aGlzIERv
Y2tlcmZpbGUuCj4+IC1GUk9NIGRlYmlhbjpzdHJldGNoLTIwMTcxMjEwCj4+ICtGUk9NIGRlYmlh
bjpidWxsc2V5ZS0yMDIxMDkwMgo+PiDCoCDCoCBMQUJFTCBtYWludGFpbmVyPSJCdWlsZHJvb3Qg
bWFpbGluZyBsaXN0IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4iIFwKPj4gwqDCoMKgwqDCoMKg
wqAgdmVuZG9yPSJCdWlsZHJvb3QiIFwKPj4gQEAgLTM2LDYgKzM2LDggQEAgUlVOIGFwdC1nZXQg
aW5zdGFsbCAteSAtLW5vLWluc3RhbGwtcmVjb21tZW5kcyBcCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBsaWJuY3Vyc2VzNS1kZXYgXAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbG9jYWxlcyBcCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBtZXJjdXJpYWwgXAo+PiArwqDCoMKgwqDCoMKgwqAgcHl0aG9uIFwK
Pj4gK8KgwqDCoMKgwqDCoMKgIHB5dGhvbi1zaXggXAo+IAo+IMKgQXMgZGlzY3Vzc2VkLCBJIGFw
cGxpZWQgdG8gbWFzdGVyIHdpdGhvdXQgdGhlc2UgcHl0aG9uIGNoYW5nZXMsIHB1c2hlZCBhIG5l
dwo+IGRvY2tlciBpbWFnZSB0byBkb2NrZXJodWIsIGFuZCBzZW50IGEgcGF0Y2ggdGhhdCB1cGRh
dGVzIC5naXRsYWItY2kueW1sLgoKT2ssIGdyZWF0IQoKPiDCoEkgYmVsaWV2ZSB0aGUgcmVzdCBv
ZiB0aGUgc2VyaWVzIGNhbiBvbmx5IGJlIGFwcGxpZWQgYWZ0ZXIgdGhhdCB1cGRhdGUgaXMKPiBj
b21taXR0ZWQsIHJpZ2h0PwoKWWVzLCB3ZSBuZWVkIHRvIHN3aXRjaCB0byB0aGlzIG5ldyBEb2Nr
ZXIgaW1hZ2UgYmVmb3JlIG1lcmdpbmcgcWVtdSB1cGRhdGUuCkkgdGVzdGVkIHRoZSBzZXJpZXMg
dXNpbmcgaW1hZ2Ugc3RvcmVkIGluIG15IGRvY2tlcmh1YiBhY2NvdW50LgpCdXQgd2UgY2FuJ3Qg
YXZvaWQgdGhlIHViaWZzIHJlZ3Jlc3Npb24gaW4gdGhlIHRlc3RzdWl0ZS4uLgoKQmVzdCByZWdh
cmRzLApSb21haW4KCj4gCj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4gCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBweXRob24zIFwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHB5dGhvbjMtZmxha2U4IFwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHB5dGhvbjMtbm9zZTIgXAo+PiBkaWZmIC0tZ2l0IGEvc3Vw
cG9ydC9kb2NrZXIvYXB0LXNvdXJjZXMubGlzdCBiL3N1cHBvcnQvZG9ja2VyL2FwdC1zb3VyY2Vz
Lmxpc3QKPj4gaW5kZXggNzg5ZmI4ZmMxNy4uMGY4NzJmZDM5OCAxMDA2NDQKPj4gLS0tIGEvc3Vw
cG9ydC9kb2NrZXIvYXB0LXNvdXJjZXMubGlzdAo+PiArKysgYi9zdXBwb3J0L2RvY2tlci9hcHQt
c291cmNlcy5saXN0Cj4+IEBAIC0xLDQgKzEsNCBAQAo+PiAtIyBMYXRlc3QganVzdCBiZWZvcmUg
MjAxNzEyMTBUMDAwMDAwWjoKPj4gLWRlYiBbY2hlY2stdmFsaWQtdW50aWw9bm9dCj4+IGh0dHA6
Ly9zbmFwc2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLzIwMTcxMjA5VDIyMDM0NlovIHN0
cmV0Y2ggbWFpbgo+PiAtZGViIFtjaGVjay12YWxpZC11bnRpbD1ub10KPj4gaHR0cDovL3NuYXBz
aG90LmRlYmlhbi5vcmcvYXJjaGl2ZS9kZWJpYW4vMjAxNzEyMDlUMjIwMzQ2Wi8gc3RyZXRjaC11
cGRhdGVzIG1haW4KPj4gLWRlYiBbY2hlY2stdmFsaWQtdW50aWw9bm9dCj4+IGh0dHA6Ly9zbmFw
c2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLXNlY3VyaXR5LzIwMTcxMjA5VDIyNDYxOFov
Cj4+IHN0cmV0Y2gvdXBkYXRlcyBtYWluCj4+ICsjIExhdGVzdCBqdXN0IGJlZm9yZSAyMDIxMDgx
N1QwMDAwMDBaOgo+PiArZGViIFtjaGVjay12YWxpZC11bnRpbD1ub10KPj4gaHR0cDovL3NuYXBz
aG90LmRlYmlhbi5vcmcvYXJjaGl2ZS9kZWJpYW4vMjAyMTA5MDJUMjA1NTMzWi8gYnVsbHNleWUg
bWFpbgo+PiArZGViIFtjaGVjay12YWxpZC11bnRpbD1ub10KPj4gaHR0cDovL3NuYXBzaG90LmRl
Ymlhbi5vcmcvYXJjaGl2ZS9kZWJpYW4tc2VjdXJpdHkvMjAyMTA5MDJUMTkzNjUwWi8KPj4gYnVs
bHNleWUtc2VjdXJpdHkgbWFpbgo+PiArZGViIFtjaGVjay12YWxpZC11bnRpbD1ub10KPj4gaHR0
cDovL3NuYXBzaG90LmRlYmlhbi5vcmcvYXJjaGl2ZS9kZWJpYW4vMjAyMTA5MDJUMjA1NTMzWi8g
YnVsbHNleWUtdXBkYXRlcyBtYWluCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5i
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
