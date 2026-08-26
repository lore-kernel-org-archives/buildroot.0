Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D4BC5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 14:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4E828063F;
	Wed, 26 Aug 2026 14:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvasFUJ8pYaS; Wed, 26 Aug 2026 14:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787754080;
	bh=91xzipf6AVjvZaSVLIBxUAINOB+DlOPNXUpVK2bSijc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JUyZTi5U42w5Vx+ct3zy2BHSTGxMcLFIlAKK9i2sKCzAjqPbRdBtsGIAwMZgPjpJU
	 ibOPs7t/2GtJc5R5H/SNT5TXeUcKSGUoooPaGU9+D5bvVvhhfSjXsLCVB9ZxuN/QR5
	 s2whqdRbrh7bj3xZ9OsTZgZDxWRTwdHp12aW0YETu7FK+Pkr1fUM5qriisxr5mAguR
	 cwA6TpRM4TFd6Wc6cA+ed7HoE+sYX6oL0Hb/Nfm1LNo/2QlDfJvUbI4Qg+D6KZ3fGL
	 gY+FzVRax+HRWBjpFqZhiwNDn874KCz+daDGVWedT7OlOSIxqMmqJLyZ6HSwWVTjox
	 pTgFqY6/qpQqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9EFA8085C;
	Wed, 26 Aug 2026 14:21:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89A91230
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FB614005F
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CP299xveflM9 for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 14:21:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 618B240064
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:21:17 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c252cd2b3c1so82513066b.2
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 07:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787754075; x=1788358875;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fHlJyN+GxL16EJR5wADr2L7XjLgzIBtBDrk3X+/dIXg=;
 b=ZKP6lrXFBOmXoBfnAGW3s/R9dGKMgsjSHOiej5LQYNiBPmCt/rPRsOmd85txtwuRO3
 4cKe67K7lXwvBVfNKRWI+r9wr+Gfxwy8RDaGGOl7yBem83qjbSuSku/DnUPqNKaJzT0N
 ZcqFgXzLsjl+hvaNuLeRlyDYu/xMww47zPTeWd4hFc282TwXmOgCDBCL/YWcRh6IWyzJ
 kkmBbms96/1AzBbDdoeUCeFC+vkpgGz1Cf198x9XFXcwHg2us0tF+QDcm4eR5BW6rq37
 ed8dhemuREyGhp4UAJrlNDZrHkeksqYRtROFQglU1NwlRfvvMK3ytKhFjjcqA9IhiJzR
 w0eg==
X-Gm-Message-State: AFuF++kLNoZ7tuDzajwv/3myQGjr6n2f1i67+B+SKl7I4ROM8sdlvM7j
 OIirlc2PNzh2NbzsE2YGCwKWJ2xdc7niAAag7Ok230l6kekliAJI1U2XBb1febrGnhfJ7Uwkbak
 Rn9FQ6cw=
X-Gm-Gg: AR+sD10jjj1Aas97bF5J+kihzQDJYg1YravLaVu+FDLlPBRQG31vzf7HmeZ9LlhAgmJ
 V1d1nu2vkqShjPML42X4Mado/Hn9puBS14vwaLjxOiXoOdySrRJ/io3OOu6inP5atkbqoSf6ZgM
 sodC6Piyi9WE1573BF9FzZhWsdF0UXm5rM7ls/xD6HT7ZNcg+OCcCwFT3EUzBaG1kVqy6yS8N0p
 knxEuiB6CCDMlIq56R1vitlF0EqqPZBAVggnoqM8v+j88ExlaAMVGvWauI4E4E+7Cmqj0nS1fi+
 nw7Q2rEuhGd/s+KZpa4hp7q8e4deWRz7y08q6BX9tYwa0tFq1I7Gexj1+snLd8RELw4EeIErgpg
 YTt6lUgkk8Ao4pq1AE2yd36s2jIVO5k/DF/3GdOW9LowAzLmiWV7+uSA8Km4jA3PF6xdcEC1Hum
 6r5CTLufFMAOevUKi7p7jsaQdDFRN6lKUrkxzo1h3vh6FmCXC0SH5Rcy21b46nHjHW8mXdRA1Dy
 BX9ZIv1WbMzORUGEdqORcNq1S4KXi7yH63A+Y24mK4JvH8Y
X-Received: by 2002:a17:906:f5a2:b0:c20:88a6:8210 with SMTP id
 a640c23a62f3a-c250bc072a2mr871563266b.9.1787754075121; 
 Wed, 26 Aug 2026 07:21:15 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9b2817sm537775866b.53.2026.08.26.07.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 07:21:14 -0700 (PDT)
Message-ID: <2e6639e6-7be7-46fe-8663-5ed72c972bf0@mind.be>
Date: Wed, 26 Aug 2026 16:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be
References: <20260826123637.410258-1-titouan.christophe@mind.be>
 <20260826123637.410258-4-titouan.christophe@mind.be>
Content-Language: en-US
In-Reply-To: <20260826123637.410258-4-titouan.christophe@mind.be>
Subject: Re: [Buildroot] [PATCH for 2025.02.x 03/16] package/clamav: add
 patch for RUSTSEC-2026-0007/CVE-2026-25541 in bundled dependency
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gZXZlcnlvbmUsCgpJIHdlbnQgdG9vIGZhc3Qgb24gdGhpcyBwYXRjaDoKCk9uIDI2LzA4
LzI2IDE0OjM2LCBUaXRvdWFuIENocmlzdG9waGUgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogVGl0
b3VhbiBDaHJpc3RvcGhlIDx0aXRvdWFuLmNocmlzdG9waGVAbWluZC5iZT4KPiAtLS0KPiAgIC4u
LnBlbmRlbmN5LXRvLXJlc29sdmUtYS1zZWN1cml0eS1pc3N1ZS5wYXRjaCB8IDMwICsrKysrKysr
KysrKysrKysrKysKPiAgIHBhY2thZ2UvY2xhbWF2L2NsYW1hdi5tayAgICAgICAgICAgICAgICAg
ICAgICB8ICAzICsrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2NsYW1hdi8wMDAyLXVwZ3JhZGUtcnVzdC1kZXBlbmRl
bmN5LXRvLXJlc29sdmUtYS1zZWN1cml0eS1pc3N1ZS5wYXRjaAo+Cj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvY2xhbWF2LzAwMDItdXBncmFkZS1ydXN0LWRlcGVuZGVuY3ktdG8tcmVzb2x2ZS1hLXNl
Y3VyaXR5LWlzc3VlLnBhdGNoIGIvcGFja2FnZS9jbGFtYXYvMDAwMi11cGdyYWRlLXJ1c3QtZGVw
ZW5kZW5jeS10by1yZXNvbHZlLWEtc2VjdXJpdHktaXNzdWUucGF0Y2gKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmI3YWI0ODgxNGUKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvcGFja2FnZS9jbGFtYXYvMDAwMi11cGdyYWRlLXJ1c3QtZGVwZW5kZW5jeS10by1yZXNv
bHZlLWEtc2VjdXJpdHktaXNzdWUucGF0Y2gKPiBAQCAtMCwwICsxLDMwIEBACj4gK0Zyb206IFZh
bGVyaWUgU255ZGVyIDxteC52YWxAaWNsb3VkLmNvbT4KPiArRGF0ZTogTW9uLCAyMyBGZWIgMjAy
NiAxODowNDo1OSAtMDUwMAo+ICtTdWJqZWN0OiBVcGdyYWRlIFJ1c3QgZGVwZW5kZW5jeSB0byBy
ZXNvbHZlIGEgc2VjdXJpdHkgaXNzdWUKPiArCj4gK1VwZ3JhZGUgdGhlIGJ5dGVzIGRlcGVuZGVu
Y3kgdG8gcmVzb2x2ZSBSVVNUU0VDLTIwMjYtMDAwNwo+ICsKPiArLS0tCj4gK1Vwc3RyZWFtOiBo
dHRwczovL2dpdGh1Yi5jb20vQ2lzY28tVGFsb3MvY2xhbWF2L2NvbW1pdC9hNjc2MWNiNDFjM2Rj
YjRiMmUxYzE3MzY0YTU2Y2ZiODNmZTg0OTAzCj4gK0NWRTogQ1ZFLTIwMjYtMjU1NDEKPiArU2ln
bmVkLW9mZi1ieTogVGl0b3VhbiBDaHJpc3RvcGhlIDx0aXRvdWFuLmNocmlzdG9waGVAbWluZC5i
ZT4KPiArLS0tCj4gKyBDYXJnby5sb2NrIHwgNCArKy0tCj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL0NhcmdvLmxv
Y2sgYi9DYXJnby5sb2NrCj4gK2luZGV4IDg1YjYwNGU5MGEuLmVjNTM0ZTVhZTIgMTAwNjQ0Cj4g
Ky0tLSBhL0NhcmdvLmxvY2sKPiArKysrIGIvQ2FyZ28ubG9jawo+ICtAQCAtMjQwLDkgKzI0MCw5
IEBAIGNoZWNrc3VtID0gIjhmMWZlOTQ4ZmYwN2Y0YmQwNmMzMDk4NGU2OWY1YjQ4OTljNTE2YTNl
Zjc0ZjM0ZGY5MmEyZGYyYWI1MzU0OTUiCj4gKwo+ICsgW1twYWNrYWdlXV0KPiArIG5hbWUgPSAi
Ynl0ZXMiCj4gKy12ZXJzaW9uID0gIjEuOS4wIgo+ICsrdmVyc2lvbiA9ICIxLjExLjEiCj4gKyBz
b3VyY2UgPSAicmVnaXN0cnkraHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9jcmF0ZXMuaW8t
aW5kZXgiCj4gKy1jaGVja3N1bSA9ICIzMjU5MThkNmZlMzJmMjNiMTk4NzhmZTRiMzQ3OTRhZTQx
ZmMxOWRkYmU1M2IxMDU3MWE0ODc0ZDQ0ZmZkMzliIgo+ICsrY2hlY2tzdW0gPSAiMWU3NDg3MzNi
N2NiYzc5OGUxNDM0YjZhYzUyNGYwYzFmZjJhYjQ1NmZlMjAxNTAxZTY0OTdjODQxN2E0ZmMzMyIK
PiArCj4gKyBbW3BhY2thZ2VdXQo+ICsgbmFtZSA9ICJiemlwMi1ycyIKClVuZm9ydHVuYXRlbHks
IHRoaXMgZG9lc24ndCB3b3JrIGJlY2F1c2UgdGhlIGRvd25sb2FkYWJsZSBjbGFtYXYgc291cmNl
IApjb2RlIGFyY2hpdmUgY29udGFpbnMgdmVuZG9yZWQgUnVzdCBjcmF0ZXMuCldoZW4gYnVpbGRp
bmcgd2l0aCB0aGlzIHBhdGNoLCBJIGdldCB0aGUgZm9sbG93aW5nIGVycm9yOgoKIMKgIMKgIGVy
cm9yOiBmYWlsZWQgdG8gc2VsZWN0IGEgdmVyc2lvbiBmb3IgdGhlIHJlcXVpcmVtZW50IGBieXRl
cyA9IAoiXjEuMi4wImAgKGxvY2tlZCB0byAxLjExLjEpCiDCoCDCoCBjYW5kaWRhdGUgdmVyc2lv
bnMgZm91bmQgd2hpY2ggZGlkbid0IG1hdGNoOiAxLjkuMAogwqAgwqAgbG9jYXRpb24gc2VhcmNo
ZWQ6IGRpcmVjdG9yeSBzb3VyY2UgCmAvaG9tZS90aXRvdS9Db2RlL2J1aWxkcm9vdC9vdXRwdXQv
YnVpbGQvY2xhbWF2LTEuNC4zLy5jYXJnby92ZW5kb3JgIAood2hpY2ggaXMgcmVwbGFjaW5nIHJl
Z2lzdHJ5IGBjcmF0ZXMtaW9gKQogwqAgwqAgcmVxdWlyZWQgYnkgcGFja2FnZSBgb25lbm90ZV9w
YXJzZXIgdjAuMy4xIAooaHR0cHM6Ly9naXRodWIuY29tL0Npc2NvLVRhbG9zL29uZW5vdGUucnMu
Z2l0P2JyYW5jaD1DTEFNLTIzMjktbmV3LWZyb20tc2xpY2UjOGI0NTA0NDcpYAogwqAgwqAgwqAg
wqAgLi4uIHdoaWNoIHNhdGlzZmllcyBnaXQgZGVwZW5kZW5jeSBgb25lbm90ZV9wYXJzZXJgIChs
b2NrZWQgdG8gCjAuMy4xKSBvZiBwYWNrYWdlIGBjbGFtYXZfcnVzdCB2MC4wLjEgCigvaG9tZS90
aXRvdS9Db2RlL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvY2xhbWF2LTEuNC4zL2xpYmNsYW1hdl9y
dXN0KWAKIMKgIMKgIHBlcmhhcHMgYSBjcmF0ZSB3YXMgdXBkYXRlZCBhbmQgZm9yZ290dGVuIHRv
IGJlIHJlLXZlbmRvcmVkPwoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jbGFtYXYvY2xhbWF2Lm1r
IGIvcGFja2FnZS9jbGFtYXYvY2xhbWF2Lm1rCj4gaW5kZXggNTZlNDIxN2YzZi4uODRiY2FkZGU2
ZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2NsYW1hdi9jbGFtYXYubWsKPiArKysgYi9wYWNrYWdl
L2NsYW1hdi9jbGFtYXYubWsKPiBAQCAtMjcsNiArMjcsOSBAQCBDTEFNQVZfSUdOT1JFX0NWRVMg
Kz0gQ1ZFLTIwMTYtMTQwNQo+ICAgIyAwMDAxLWZpeC1wb3NzaWJsZS1wYW5pYy13aGVuLXNjYW5u
aW5nLXNvbWUtaHRtbC1maWxlcy5wYXRjaAo+ICAgQ0xBTUFWX0lHTk9SRV9DVkVTICs9IENWRS0y
MDI2LTIwMDMxCj4gICAKPiArIyAwMDAyLXVwZ3JhZGUtcnVzdC1kZXBlbmRlbmN5LXRvLXJlc29s
dmUtYS1zZWN1cml0eS1pc3N1ZS5wYXRjaAo+ICtDTEFNQVZfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIw
MjYtMjU1NDEKTW9yZW92ZXIsIHRoaXMgaXMgaW5jb3JyZWN0OiBDVkUtMjAyNi0yNTU0MSBbMV0g
YWZmZWN0cyB0aGUgUnVzdCBjcmF0ZSAKInRva2lvLXJzL2J5dGVzIiwgYW5kIG5vdCBjbGFtYXYg
aXRzZWxmCgo+ICsKPiAgIENMQU1BVl9ERVBFTkRFTkNJRVMgPSBcCj4gICAJYnppcDIgXAo+ICAg
CWhvc3QtcGtnY29uZiBcCgpDb25zZXF1ZW50bHksIHRoaXMgcGF0Y2ggc2hvdWxkIGJlIGRpc2Nh
cmRlZCBlbnRpcmVseSAoYW5kIHRoZSBuZXh0IApjbGFtYXYgcGF0Y2hlcyBpbiB0aGlzIHNlcmll
cyBzaG91bGQgYmUgcmVudW1iZXJlZCkKClRpdG91YW4KClsxXSBodHRwczovL3d3dy5jdmUub3Jn
L0NWRVJlY29yZD9pZD1DVkUtMjAyNi0yNTU0MQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
