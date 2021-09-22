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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9C5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:46:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFC476120E
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFC476120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96131614FC;
	Wed, 22 Sep 2021 21:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwQXkhrgA7oo; Wed, 22 Sep 2021 21:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1065D614A6;
	Wed, 22 Sep 2021 21:46:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E633B1BF2F7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D48D5415B9
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7x3-w2e9eeyy for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 21:46:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FD874000E
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 21:46:00 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u15so11078155wru.6
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 14:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9HHMJB/P6ESG4OhV6W26atk0D/W9v+bBCg9rPvztirk=;
 b=T8b8Luu3mr5erYVtLPtxD3V0lJbVmG3NOwrgmsWMN6lN7VshSjU8buI8+o3KtPwL3K
 cS9J6FfvIS6aybtgJYiALDw5ewiudwZIU0+q5QPJnBa4oXaOGj5/UhCF/ZOat8qjaxMq
 sq1ZQYJS01SLyl73E0PmfuiYu8hGjPXtpKlbdzmOFe5Onn6Ja+Tk/r/7eyeSQaYzZEa+
 LqA2Uvv8qGsqxFEVotpk05JZfVpLtPbgPW3597xsNU23ai9aQEg3Cyy/pLx9hHROCERD
 Opc0CAa5lifxMN3uXvnJOiEdppPt/TruX9sNevNCIyrHqGQ4IVilWkIyAS+KVNz4f+Sd
 9ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9HHMJB/P6ESG4OhV6W26atk0D/W9v+bBCg9rPvztirk=;
 b=NOReroeuWHZsnWGgfyhw9k8WJXKK+6pqRq2OQV8bUKrcu/w2QDuy0eRS5GgVlTCegR
 2FkXsh0ZFS05hEpyo3pvVz+k6peCWEqLHlZId1MGRw8UPWg3AHrR58vMTyP+h44olh9R
 QcM5HAozsCVv35Mka+N6pqUkUKPk4sFocA1w4DTLEUOod1ZSFWH35C5RjXIj46lLMVYw
 haDsPWGJqncjedXaJzIzafex3+dTCQImH6IL2qs8QJ51ypBLJ3DdQW56QtPiOoo1qk5v
 l8F/xyqScdr4AXlCGNzec4qVEhqBHUL62k73ZjQsq5Tdy/u4tk0H37H3d26CMkMuuR2b
 QMLw==
X-Gm-Message-State: AOAM532jDSNT0E6CUzXb5cRIbypYJdyU+83UDuqSriM5IezF3D0LbKva
 0pGhHOxTXgiC6q9DyBjo4jRrlPdzGaQ=
X-Google-Smtp-Source: ABdhPJxmKv7o2Ow0U5NYDBU63ClaAyO0WF0yq6J9PMPZRH7jOqDhWRpdahd4n4+AD8vgLioR3f5CRw==
X-Received: by 2002:a5d:54cf:: with SMTP id x15mr1311816wrv.27.1632347158827; 
 Wed, 22 Sep 2021 14:45:58 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:23a5:a748:5a4b:18cd?
 (2a01cb058f8a180023a5a7485a4b18cd.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:23a5:a748:5a4b:18cd])
 by smtp.gmail.com with ESMTPSA id c135sm7410649wme.6.2021.09.22.14.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 14:45:58 -0700 (PDT)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 buildroot@buildroot.org
References: <20210912141140.253778-9-romain.naour@gmail.com>
 <20210922201027.934860-1-arnout@mind.be>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <074d7a6f-bebc-1b36-f845-34ab5297d707@gmail.com>
Date: Wed, 22 Sep 2021 23:45:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922201027.934860-1-arnout@mind.be>
Content-Language: en-US
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

SGkgQXJub3V0LAoKTGUgMjIvMDkvMjAyMSDDoCAyMjoxMCwgQXJub3V0IFZhbmRlY2FwcGVsbGUg
KEVzc2Vuc2l1bS9NaW5kKSBhIMOpY3JpdMKgOgo+IENvbW1pdCA3MWI4MzIyNzEyOGJlNjJjMTY5
MzEzZTg1YmI4ZjMzOWY5NzdhZDY3IHVwZGF0ZWQgdGhlIERvY2tlcmZpbGUKPiB0byBiZSB1c2Vk
IGluIENJIHRlc3RzLiBJbiBvcmRlciB0byBhY3R1YWxseSB1c2UgdGhpcyBuZXcgZG9ja2VyIGlt
YWdlLAo+IHVwZGF0ZSAuZ2l0bGFiLWNpLnltbCB0byBwb2ludCB0byB0aGUgZG9ja2VyIGltYWdl
IHRoYXQgd2FzIGNyZWF0ZWQgd2l0aAo+IHRoZSB1cGRhdGVkIERvY2tlcmZpbGUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKSA8YXJub3V0
QG1pbmQuYmU+CgpUaGVyZSBhcmUgc29tZSBuZXcgaXNzdWVzIHNpbmNlIGxhc3QgdGltZSBJIHRl
c3RlZDoKCldpdGhvdXQgcHl0aG9uIGluc3RhbGxlZCwgc3lzbGludXggZG9lc24ndCBidWlsZC4K
ClRlc3RTeXNMaW51eFg4NkVGSS9idWlsZC9zeXNsaW51eC02LjAzL2NvbTMyL2NtZW51L21lbnVn
ZW4ucHkgWy4uLl0KbWFrZVs2XTogcHl0aG9uOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cgpo
dHRwczovL2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL2pvYnMvMTYxNDQ0Njc2NgoKClRo
ZXJlIGlzIGEgbmV3IGlzc3VlIHdpdGggcHl0aG9uLWF0dHJzIHRlc3Qgd2hlbiBweXRob24yIGlz
IG5vdCBpbnN0YWxsZWQ6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vam9i
cy8xNjE0NDQ2OTQzCmh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vam9icy8x
NjE0NDQ2OTM5CgoKU3RyYW5nZSBweXRob24gaXNzdWUgd2l0aCByZWZwb2xpY3ktMi4yMDIxMDkw
OCBidWlsZDoKaHR0cHM6Ly9naXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9qb2JzLzE2MTQ0
NDY4MjYvCgoKQnV0IHRoZSBpc3N1ZSBJIGhhZCB3aXRoIFRlc3RDaGVja1BhY2thZ2UgaXMgZml4
ZWQgd2l0aCB0aGUgcmVjZW50IHN3aXRjaCB0bwpweXRob24zLgoKaHR0cHM6Ly9naXRsYWIuY29t
L2t1YnU5My9idWlsZHJvb3QvLS9qb2JzLzE2MTQ0NDcyMzYKCldpdGggYWxsIGlzc3VlcyBmaXhl
ZDoKICBBY2tlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgogIFRl
c3RlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgoKQmVzdCByZWdh
cmRzLApSb21haW4KCj4gLS0tCj4gIC5naXRsYWItY2kueW1sIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvLmdp
dGxhYi1jaS55bWwgYi8uZ2l0bGFiLWNpLnltbAo+IGluZGV4IGJmOWYyZGNhNmMuLjE1MGI4ZWFj
MWEgMTAwNjQ0Cj4gLS0tIGEvLmdpdGxhYi1jaS55bWwKPiArKysgYi8uZ2l0bGFiLWNpLnltbAo+
IEBAIC0xLDcgKzEsNyBAQAo+ICAjIENvbmZpZ3VyYXRpb24gZm9yIEdpdGxhYi1DSS4KPiAgIyBC
dWlsZHMgYXBwZWFyIG9uIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC9waXBlbGluZXMKPiAgCj4gLWltYWdlOiBidWlsZHJvb3QvYmFzZToyMDIwMDgxNC4yMjI4Cj4g
K2ltYWdlOiBidWlsZHJvb3QvYmFzZToyMDIxMDkyMi4yMjAwCj4gIAo+ICBzdGFnZXM6Cj4gICAg
LSBnZW5lcmF0ZS1naXRsYWItY2kKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
