Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F713C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 13:38:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DD976113E
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 13:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DD976113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1EAD403FE;
	Sat, 21 Aug 2021 13:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSes9kr5RcHL; Sat, 21 Aug 2021 13:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27E3B40411;
	Sat, 21 Aug 2021 13:38:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5913C1BF35E
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 13:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48D314022F
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 13:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id REFZ6W-TwXOu for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 13:38:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F1A940124
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 13:38:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id l6so1369572wmq.5
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 06:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Rtl5p5l7mgqI0l5nEbrZa1qnzL8KsfMgf+u7N9KINE=;
 b=NOdxbuTZOHGxhId1GMa3cMRcA0mmJMrrPtbSyHMBSU5FwaTyvGdAax0C2TiBtLqC4e
 Md6B0UP2zP6qm7ffUIuQ9ym7tlSuUx890lo6J0Q+nRNK0hYRtmhchps3R2Xd5uW8Ib69
 Oa/zORFanpXFnHeky3jNpbqAuRM7m8x30nwQSXuKQi7CosvZLce6ntQyYelHhiq0O8i9
 2svc4eMNvhXrpfIxky2YShsPawxgbJWVhdDUbeKsPQG8++QBnxy0QRHnTgGB6I5azeKT
 v10Qp46f7PVZwIMemLnHM4QdJKSDL38WAd8gfT/rrSodwvTyP5Pi4Ip7w+aqpBvFtG3E
 1qlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Rtl5p5l7mgqI0l5nEbrZa1qnzL8KsfMgf+u7N9KINE=;
 b=ii6+vwTBPsym3uD9RSTolt1xWnzzlvR0Z0h5yI9Xmj2h5XSEvjFzTk9zfUQkly5hKb
 xBBFzC3MjFeL7u+MfcSvkwLU393rjAcwnonnzOoOA+sTAEzB0S8QXTsJBQFKLlflEHxC
 EXD+MlMdiG9z8+XgVRo6Mdg1oHWwWb96dmFpzKOpYFGShuhnyjpBAIBQ1VA2BkiDcbWu
 59yM4hLh4yYRpFHRu9MPryxhJxD9jQjYFpyL9v1R0Xm7ucGfyGCRyFg0aj2mOyiA38ES
 RQ2NSefujpnuYj20xUNru+1ysSVWJPzFiLtSibztFQ2xc1WAaGBnY1g7os6fUZMrkxbm
 52NQ==
X-Gm-Message-State: AOAM533uaplS1AMrwa4RtuvnZf6zKS5wsvEI0R+xXPULF+ZWpYrQF25A
 x3M/zEXFlH+nPTKWvxkr/tA=
X-Google-Smtp-Source: ABdhPJznyjSkgn/asYE5z/C7ndtEsgL+Rl4QfpPfiJG5NBNIFU2tK5GbOT5RAOqqNXtkZFPOMU/KbA==
X-Received: by 2002:a1c:444:: with SMTP id 65mr2857676wme.161.1629553094315;
 Sat, 21 Aug 2021 06:38:14 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id k14sm8867894wri.46.2021.08.21.06.38.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Aug 2021 06:38:13 -0700 (PDT)
To: Arnout Vandecappelle <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1624911306.git.yann.morin.1998@free.fr>
 <ae1e35ca4f0557873fa25ca5205d92aa2a16dd1f.1624911306.git.yann.morin.1998@free.fr>
 <04eed532-822e-28c7-bd3d-4d9288a2bad9@mind.be>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <4c95c45a-d650-183c-cd3a-dacff91b58fb@gmail.com>
Date: Sat, 21 Aug 2021 15:38:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <04eed532-822e-28c7-bd3d-4d9288a2bad9@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 3/4 v5] utils/test-pkg: add mode to only
 prepare .config files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gQXJub3V0LCBZYW5uLAoKTGUgMDUvMDgvMjAyMSDDoCAyMjo0NSwgQXJub3V0IFZhbmRl
Y2FwcGVsbGUgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAyOC8wNi8yMDIxIDIyOjE1LCBZYW5uIEUu
IE1PUklOIHdyb3RlOgo+PiBDdXJyZW50bHksIHJ1bm5pbmcgdGVzdC1wa2cgaXMgb25seSBkb25l
IGxvY2FsbHkgb24gdGhlIGRldmVsb3BwZXJzCj4+IG1hY2hpbmUuCj4+Cj4+IEluIGEgZm9sbG93
IHVwIGNvbW1pdCwgd2UnbGwgYWRkIHRoZSBwb3NzaWJpbGl0eSB0byBydW4gdGVzdC1wa2cgaW4g
YQo+PiBnaXRsYWItY2kgcGlwZWxpbmUgYW5kLCB0byBzcGVlZCB1cCB0aGluZ3MsIHdpdGggb25l
IGpvYiBwZXIgYnVpbGRhYmxlCj4+IGNvbmZpZ3VyYXRpb24uCj4+Cj4+IEFzIHN1Y2gsIHdlIHdp
bGwgbmVlZCB0aGF0IHRlc3QtcGtnIG9ubHkgZXZlciBwcmVwYXJlcyB0aGUKPj4gY29uZmlndXJh
dGlvbiwgYW5kIHRoYXQgaXQgZG9lcyBub3QgYnVpbGQgdGhlbS4KPj4KPj4gQWRkIHN1Y2ggYSBt
b2RlLCB3aXRoIGEgbmV3IG9wdGlvbiwgLS1wcmVwYXJlLW9ubHkKPj4KPj4gU2lnbmVkLW9mZi1i
eTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4+IENjOiBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4+IENjOiBUaG9tYXMgUGV0YXp6b25pIDx0
aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+PiBDYzogQXJub3V0IFZhbmRlY2FwcGVsbGUg
KEVzc2Vuc2l1bS9NaW5kKSA8YXJub3V0QG1pbmQuYmU+Cj4+Cj4+IC0tLQo+PiBOb3RlOiBuYW1p
bmcgaXMgaGFyZDsgbmFtaW5nIG9wdGlvbnMgaXMgaGFyZGVyOyBuYW1pbmcgb3B0aW9ucyB3aXRo
IGEKPj4gdGVyc2UgdGVybSBpcyBldmVuIGhhcmRlcjsgbmFtaW5nIG9wdGlvbnMgd2l0aCBhIHRl
cnNlIHRlcm0gdGhhdCBpcwo+PiBzdGlsbCBtZWFuaW5nZnVsIGFuZCBleHBsYWlucyB3aGF0IHRo
ZSBvcHRpb24gZG9lcywgaXMgZXZlbiBoYXJkZXIgeWV0Lgo+IAo+ICBCdXQgZG9pbmcgaXQgaW5j
b25zaXN0ZW50bHkgaXMgZWFzeSAoc2VlIGJlbG93KS4gOi0pCj4gCj4gIEFueXdheSwgdGhlcmUn
cyBhbiBlYXN5IHNvbHV0aW9uIHRvIHRoYXQgKHdoaWNoIEkgYmVsaWV2ZSB3ZSBzaG91bGQgYXBw
bHkKPiBoZXJlKTogZG9uJ3QgZGVmaW5lIGEgdGVyc2Ugb3B0aW9uLgo+IAo+ICBJIHRoaW5rIHRl
cnNlIG9wdGlvbnMgc2hvdWxkIG9ubHkgYmUgZGVmaW5lZCBmb3Igc3R1ZmYgdGhhdCBhIGh1bWFu
IGhhcyB0bwo+IHR5cGUuIEluIHNjcmlwdHMsIHRlcnNlIG9wdGlvbnMgc2hvdWxkbid0IGJlIHVz
ZWQsIGJlY2F1c2UgaXQgbWFrZXMgaXQgaGFyZGVyCj4gZm9yIHRoZSBwcm9ncmFtbWVyIHRvIHVu
ZGVyc3RhbmQgd2hhdCB0aGUgY29tbWFuZCBkb2VzLgo+IAo+ICBTaW5jZSBwcmVwYXJlLW9ubHkg
aXMgbWVhbnQgb3QgYmUgdXNlZCBieSBzY3JpcHQsIEkgZG9uJ3QgdGhpbmsgYSB0ZXJzZSBvcHRp
b24KPiBpcyBuZWVkZWQuCgpUaGFua3MgZm9yIHlvdXIgYWR2aWNlLiBJbmRlZWQgSSBkb24ndCB0
aGluayB3ZSBuZWVkIGEgdGVyc2Ugb3B0aW9uLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4g
Cj4+Cj4+IC0tLQo+PiB2NTogc3BsaXQgb2ZmIGZyb20gdGhlIG5leHQgcGF0Y2ggaW50byB0aGlz
IHBhdGNoCj4+IC0tLQo+PiAgdXRpbHMvdGVzdC1wa2cgfCAyMiArKysrKysrKysrKysrKysrKyst
LS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL3V0aWxzL3Rlc3QtcGtnIGIvdXRpbHMvdGVzdC1wa2cKPj4gaW5k
ZXggNTRjNmM1ZThmZS4uNGEyMGNhYjU3ZiAxMDA3NTUKPj4gLS0tIGEvdXRpbHMvdGVzdC1wa2cK
Pj4gKysrIGIvdXRpbHMvdGVzdC1wa2cKPj4gQEAgLTEyLDEzICsxMiwxMyBAQCBkb19jbGVhbigp
IHsKPj4gIAo+PiAgbWFpbigpIHsKPj4gICAgICBsb2NhbCBvIE8gb3B0cwo+PiAtICAgIGxvY2Fs
IGNmZyBkaXIgcGtnIHJhbmRvbSB0b29sY2hhaW5zX2NzdiB0b29sY2hhaW4gYWxsIG51bWJlciBt
b2RlCj4+ICsgICAgbG9jYWwgY2ZnIGRpciBwa2cgcmFuZG9tIHRvb2xjaGFpbnNfY3N2IHRvb2xj
aGFpbiBhbGwgbnVtYmVyIG1vZGUgcHJlcGFyZV9vbmx5Cj4+ICAgICAgbG9jYWwgcmV0IG5iIG5i
X3NraXAgbmJfZmFpbCBuYl9sZWdhbCBuYl90YyBidWlsZF9kaXIga2VlcAo+PiAgICAgIGxvY2Fs
IC1hIHRvb2xjaGFpbnMKPj4gICAgICBsb2NhbCBwa2dfYnJfbmFtZQo+PiAgCj4+IC0gICAgbz0n
aGFrYzpkOm46cDpyOnQ6Jwo+PiAtICAgIE89J2hlbHAsYWxsLGtlZXAsY29uZmlnLXNuaXBwZXQ6
LGJ1aWxkLWRpcjosbnVtYmVyOixwYWNrYWdlOixyYW5kb206LHRvb2xjaGFpbnMtY3N2Oj4gKyAg
ICBvPSdoYWtnYzpkOm46cDpyOnQ6Jwo+ICAgICAgICAgICAgICBeIEFGQUlDUyB0aGlzIGlzIGEg
J2cnLi4uCj4gCj4+ICsgICAgTz0naGVscCxhbGwsa2VlcCxwcmVwYXJlLW9ubHksY29uZmlnLXNu
aXBwZXQ6LGJ1aWxkLWRpcjosbnVtYmVyOixwYWNrYWdlOixyYW5kb206LHRvb2xjaGFpbnMtY3N2
OicKPj4gICAgICBvcHRzPSIkKGdldG9wdCAtbiAiJHtteV9uYW1lfSIgLW8gIiR7b30iIC1sICIk
e099IiAtLSAiJHtAfSIpIgo+PiAgICAgIGV2YWwgc2V0IC0tICIke29wdHN9Igo+PiAgCj4+IEBA
IC0yNyw2ICsyNyw3IEBAIG1haW4oKSB7Cj4+ICAgICAga2VlcD0wCj4+ICAgICAgbnVtYmVyPTAK
Pj4gICAgICBtb2RlPTAKPj4gKyAgICBwcmVwYXJlX29ubHk9MAo+PiAgICAgIHRvb2xjaGFpbnNf
Y3N2PSIke1RPT0xDSEFJTlNfQ1NWfSIKPj4gICAgICB3aGlsZSBbICR7I30gLWd0IDAgXTsgZG8K
Pj4gICAgICAgICAgY2FzZSAiJHsxfSIgaW4KPj4gQEAgLTM5LDYgKzQwLDkgQEAgbWFpbigpIHsK
Pj4gICAgICAgICAgKC1rfC0ta2VlcCkKPj4gICAgICAgICAgICAgIGtlZXA9MTsgc2hpZnQgMQo+
PiAgICAgICAgICAgICAgOzsKPj4gKyAgICAgICAgKC1sfC0tcHJlcGFyZS1vbmx5KQo+ICAgICAg
ICAgICAgICBeIC4uLiBidXQgdGhpcyBpcyBhbiAnbCchCj4gCj4gIENsZWFybHkgc29tZW9uZSBk
aWRuJ3QgdGVzdCB3aXRoIHRoZSB0ZXJzZSBvcHRpb24uIDotKQo+IAo+PiArICAgICAgICAgICAg
cHJlcGFyZV9vbmx5PTE7IHNoaWZ0IDEKPj4gKyAgICAgICAgICAgIDs7Cj4+ICAgICAgICAgICgt
Y3wtLWNvbmZpZy1zbmlwcGV0KQo+PiAgICAgICAgICAgICAgY2ZnPSIkezJ9Ijsgc2hpZnQgMgo+
PiAgICAgICAgICAgICAgOzsKPj4gQEAgLTEyNyw3ICsxMzEsNyBAQCBtYWluKCkgewo+PiAgICAg
ICAgICB0b29sY2hhaW49IiQoYmFzZW5hbWUgIiR7dG9vbGNoYWluY29uZmlnfSIgLmNvbmZpZyki
Cj4+ICAgICAgICAgIGJ1aWxkX2Rpcj0iJHtkaXJ9LyR7dG9vbGNoYWlufSIKPj4gICAgICAgICAg
cHJpbnRmICIlNDBzIFslKmQvJWRdOiAiICIke3Rvb2xjaGFpbn0iICR7I25iX3RjfSAke25ifSAk
e25iX3RjfQo+PiAtICAgICAgICBidWlsZF9vbmUgIiR7YnVpbGRfZGlyfSIgIiR7dG9vbGNoYWlu
Y29uZmlnfSIgIiR7Y2ZnfSIgIiR7cGtnfSIgJiYgcmV0PTAgfHwgcmV0PSR7P30KPj4gKyAgICAg
ICAgYnVpbGRfb25lICIke2J1aWxkX2Rpcn0iICIke3Rvb2xjaGFpbmNvbmZpZ30iICIke2NmZ30i
ICIke3BrZ30iICIke3ByZXBhcmVfb25seX0iICYmIHJldD0wIHx8IHJldD0kez99Cj4+ICAgICAg
ICAgIGNhc2UgJHtyZXR9IGluCj4+ICAgICAgICAgICgwKSBwcmludGYgIk9LXG4iOzsKPj4gICAg
ICAgICAgKDEpIDogJCgobmJfc2tpcCsrKSk7IHByaW50ZiAiU0tJUFBFRFxuIjs7Cj4+IEBAIC0x
NDcsNiArMTUxLDcgQEAgYnVpbGRfb25lKCkgewo+PiAgICAgIGxvY2FsIHRvb2xjaGFpbmNvbmZp
Zz0iJHsyfSIKPj4gICAgICBsb2NhbCBjZmc9IiR7M30iCj4+ICAgICAgbG9jYWwgcGtnPSIkezR9
Igo+PiArICAgIGxvY2FsIGRlZmVyPSIkezV9Igo+IAo+ICBJIGxpa2UgaXQgaWYgdmFyaWFibGVz
IHRoYXQgYXJlIHRoZSBzYW1lIGFyZSBjYWxsZWQgdGhlIHNhbWUuIEkuZS4sIHVzZQo+IHByZXBh
cmVfb25seSBoZXJlIGFzIHdlbGwuIFBlcmhhcHMgeW91IGNhbiBldmVuIHNraXAgcGFzc2luZyBp
dCBhdCBhbGwgc2luY2UKPiBpdCdzIGEgZ2xvYmFsIHZhcmlhYmxlLgo+IAo+PiAgCj4+ICAgICAg
bWtkaXIgLXAgIiR7ZGlyfSIKPj4gIAo+PiBAQCAtMTcwLDYgKzE3NSwxMSBAQCBidWlsZF9vbmUo
KSB7Cj4+ICAgICAgIyBSZW1vdmUgZmlsZSwgaXQncyBlbXB0eSBhbnl3YXkuCj4+ICAgICAgcm0g
LWYgIiR7ZGlyfS9taXNzaW5nLmNvbmZpZyIKPj4gIAo+PiArICAgICMgRGVmZXIgYnVpbGRpbmcg
dGhlIGpvYiB0byB0aGUgY2FsbGVyIChlLmcuIGEgZ2l0bGFiIHBpcGVsaW5lKQo+PiArICAgIGlm
IFsgJHtkZWZlcn0gLWVxIDEgXTsgdGhlbgo+PiArICAgICAgICByZXR1cm4gMAo+PiArICAgIGZp
Cj4+ICsKPj4gICAgICBpZiBbIC1uICIke3BrZ30iIF07IHRoZW4KPj4gICAgICAgICAgaWYgISBt
YWtlIE89IiR7ZGlyfSIgIiR7cGtnfS1kaXJjbGVhbiIgPj4gIiR7ZGlyfS9sb2dmaWxlIiAyPiYx
OyB0aGVuCj4+ICAgICAgICAgICAgICByZXR1cm4gMgo+PiBAQCAtMjU3LDYgKzI2NywxMCBAQCBP
cHRpb25zOgo+PiAgICAgICAgICBOb3RlOiB0aGUgbG9nZmlsZSBhbmQgY29uZmlndXJhdGlvbiBp
cyBhbHdheXMgcmV0YWluZWQsIGV2ZW4gd2l0aG91dAo+PiAgICAgICAgICB0aGlzIG9wdGlvbi4K
Pj4gIAo+PiArICAgIC0tcHJlcGFyZS1vbmx5Cj4gCj4gIEFuZCB0aGUgdGVyc2Ugb3B0aW9uIGlz
bid0IGV2ZW4gaW4gdGhlIGhlbHAhIFNvIG5vYm9keSB3b3VsZCB1c2UgaXQgYW55d2F5Li4uCj4g
Cj4gCj4gIFJlZ2FyZHMsCj4gIEFybm91dAo+IAo+PiArICAgICAgICBPbmx5IHByZXBhcmUgdGhl
IC5jb25maWcgZmlsZXMsIGJ1dCBkbyBub3QgYnVpbGQgdGhlbS4gT3V0cHV0IHRoZQo+PiArICAg
ICAgICBsaXN0IG9mIGJ1aWxkIGRpcmVjdG9yaWVzIHRvIHN0ZG91dCwgYW5kIHRoZSBzdGF0dXMg
b24gc3RkZXJyLgo+PiArCj4+ICBFeGFtcGxlOgo+PiAgCj4+ICAgICAgVGVzdGluZyBsaWJjZWMg
d291bGQgcmVxdWlyZSBhIGNvbmZpZyBzbmlwcGV0IHRoYXQgY29udGFpbnM6Cj4+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
