Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47748CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 12:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB5EC84E43;
	Sun, 31 May 2026 12:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuPNYzpH3rvF; Sun, 31 May 2026 12:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1663D84E44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780230012;
	bh=aZIM2HC4/eqGbmQ4yzSy9zFvzr0bAa8yl60uPGEU+GI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ALaCx7Ax4SR9aEX3qI0enSk7XqagDK5FB+z8Ys94ofjmyoe+CIg7P+LRg/Juyq3gt
	 KtBpGtssXuoDWh3Fa8gSamvBSoKdPV8FYinNeThmipIu6m5q5OhVFOXvBdz4StGC+m
	 4/SOhUVWAPWhO2Ht05j3QWu88DzGCiU0TsRThRz5JlW9BdaVQulKy0AkdMIfJv11yN
	 Ri361gM+mCBAiyZ4LJiHpH8kez7ZJeV/k0iWhAagL4hddFSkuujlVxCAP1qisk/BbS
	 kLvQxaxTFnFNyDhk9jBExzAQ9nhMdcFfBoZw/cvxi4otrNg6ao6r13uwmyWK2P+fUX
	 uQOy2WjEVTlmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1663D84E44;
	Sun, 31 May 2026 12:20:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE47FF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9406160F8D
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsEEcBIY1BMi for <buildroot@buildroot.org>;
 Sun, 31 May 2026 12:20:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4EAE060F8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EAE060F8B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EAE060F8B
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:20:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490388fd0dbso95884675e9.0
 for <buildroot@buildroot.org>; Sun, 31 May 2026 05:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780230006; x=1780834806;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r/YNjy22/1mLnU//f0ICOxrLmeNSkE06jhPMn7/PGt8=;
 b=HwTJwi1i2KYiY/l+DMwWJbD/HkxSuewEee+JBlH46NVpXxfm33iu5Tk/xV9w60gT9p
 FiuAoBtdRtCbtuOz4Ikr/7RWX1YsFeFKR7p1kVUCstGRu0IfR3tjfK1BGOzbeFynvFC9
 fimhVElybtwvCcroiWulgSrppENqc6m7oWy7YzZgsmkZ03TIZxfjJUPzIw4A+FMhucQZ
 yspCDTnP2Tu+TrZ4+iN9DHWoVBmVnm9GaMRoK+Z/h1547tDzwiy6Ve8PyvwqdMACTYDm
 +tM5kNj9gyBCn0IuTLL+ENrR8mE5s0Fc8m9QJTpvgMnvuT/kDaCF5t+tGQ9xcpasygfz
 KZFA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+JwdR3JmqRYFhA8x7LIxb1n7v4Lwxvu+cJPMWyISqq2uOBv53nq/NhRsm/VNRlEMBGoW6ZhVgEUy0=@buildroot.org
X-Gm-Message-State: AOJu0YzEJizTtqy/dZMGVGiRjnAm7UF4lWKOq8dGZt/t1Nwb15Tcam34
 wJUdOb9hvqbhxxWK6H0Z6X1SGWiMXydq45+sozNkGZ+3Td9OGEw5Xlh3KEiNmG032EU=
X-Gm-Gg: Acq92OFbyt8hx+xukrvnMCKiL7Pnn581qqUOikIu6wb1yBiCfmAMxxhO3BJpEYnkY2P
 d3KNCPO7pH7sQ5o2euRZzIaD+oWXID/vapwi0/FZbc6nkgQHfdOYy2XJ8aLFO07ckiazAWTVwZX
 Q8Zd0hkFH+ui4f/PhZUaRQHzRh2yTHujuTIreRT9tKDLEoSODsfhffxkdGuXXE2Dh2sWqrTrAu+
 mHeDHSTliyzt1tKK8FG+B6ToEkZAR45NJMOEZR0EWdRw/Yjvm0QgRWihGCVnYxNSXjCiOhS8GMN
 wBac3nKpBxZt5+tM3rDU2zygByM/4917hvnzcS8PMq1EPspiL0xOZWhTiNlitE7cGyZ5tUXVun4
 2KcARisfJ6q/Df8mz4lL2i8i/X4EMmO0B1N8Jz667saaRU4MkRdxircV0+x7CEgm2o+/9JT/KqQ
 YVo/vYbS++kNi4D+ozh3Pc9A1lZag/mQ71gG+MUawWb5rk5KRTJxOO2CDIzXCkN17PwcxeAJCM9
 V5u+eKVLKuzQl/Rixth2kE=
X-Received: by 2002:a05:600c:4e08:b0:490:6237:5200 with SMTP id
 5b1f17b1804b1-490a293624dmr122991085e9.10.1780230006554; 
 Sun, 31 May 2026 05:20:06 -0700 (PDT)
Received: from [10.0.0.90] (lputeaux-658-1-173-117.w92-154.abo.wanadoo.fr.
 [92.154.108.117]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3563cb9sm18367842f8f.29.2026.05.31.05.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 May 2026 05:20:06 -0700 (PDT)
Message-ID: <7e531d93-6dbb-4fa0-9cae-978a219aa7bc@mind.be>
Date: Sun, 31 May 2026 14:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20260529213651.548156-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20260529213651.548156-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780230006; x=1780834806; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r/YNjy22/1mLnU//f0ICOxrLmeNSkE06jhPMn7/PGt8=;
 b=A//ktxPmlxl6XjrtdaFoPPkHFnWfLJ3HKKKr/LSGo6+GzATZ73JPTkjU7ilfy5gR8z
 FbGkqBH6OCuiXx8AAvaCP8ZtHbcVDeidDn/T4C0vRgzrZi+OgnPWwEiwPgqsb9T/ROID
 gmqm5GfCwag/SWrIDKg/ouTOC+Gikd+uQ8nR71c5cbBMAM4QqQkIhC7PzAAsr9MswjxD
 Jb5neoXnnIF+lLMkMkIUscBXdTBHyM57JGW4s3HROjuTRxGcQCDJFGogsRGnfv4n8Kj5
 1Qg13KYozyFBTXsWU2vnNeu+H8JYbqb9AuGudlX+9GeGveygogLBQpOvZavzHDfYDzKY
 WZUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=A//ktxPm
Subject: Re: [Buildroot] [next 1/2] package/pkg-download: add pypi helper
 for downloading packages from pypi.org
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

SGVsbG8gTWFyY3VzIGFuZCBhbGwsCgpUaGFua3MsIHRoYXQncyBhIG5pY2UgYWRkaXRpb24gKGFu
ZCBpdCB3aWxsIGFsc28gbWFrZSB0aGUgTFRTIAptYWludGVuYW5jZSBzbGlnaHRseSBlYXNpZXIg
OikgKQoKQ291bGQgeW91IGFsc28gYWRkIGEgbm90ZSBpbiB0aGUgZG9jcyBhYm91dCB0aGlzIG5l
dyBoZWxwZXIgPwpGb3IgZXhhbXBsZSwgaW4gZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLXB5
dGhvbi5hZG9jLCBzb21ldGhpbmcgYWxvbmcgCnRoZSBsaW5lcyBvZjoKCiDCoCDCoCBJZiB0aGUg
cHl0aG9uIHBhY2thZ2UgaXMgaG9zdGVkIG9uIHB5cGksIHlvdSBtYXkgdXNlIHRoZSBoZWxwZXIg
Cm1ha2UgZnVuY3Rpb24gInB5cGkiIGxpa2UgdGhpczoKIMKgIMKgICQoY2FsbCBweXBpLHRoZXBh
Y2thZ2VuYW1lKQogwqAgwqAgb21pdHRpbmcgdGhlIHB5dGhvbi0gcHJlZml4IHRoYXQgaXMgc3Bl
Y2lmaWMgdG8gQnVpbGRyb290LgoKSSdtIHN1cmUgdGhlcmUncyBhIGJldHRlciBmb3JtdWxhdGlv
biB0aG91Z2guCgpNb3Jlb3Zlciwgc2hvdWxkbid0IHdlIHVwZGF0ZSB0aGUgc2NyaXB0IHNjYW5w
eXBpIHRvIHVzZSB0aGF0IGhlbHBlciBhcyAKd2VsbCA/CgpCZXN0IHJlZ2FyZHMsClRpdG91YW4K
Ck9uIDI5LzA1LzI2IDIzOjM2LCBNYXJjdXMgSG9mZm1hbm4gdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBQeXBpIHByb3ZpZGVzIHBhY2thZ2VzIHVuZGVyIGEgc3RhYmxlIHVybCAoaW5zdGVhZCBvZiB0
aGUgaGFzaCBiYXNlZCBvbmUKPiB0aGF0IGNoYW5nZXMgZXZlcnkgdmVyc2lvbikgYnV0IHdlIGRv
bid0IGN1cnJlbnRseSBtYWtlIHVzZSBvZiB0aGF0IGEgbG90Lgo+Cj4gSW50cm9kdWNlIGEgcHlw
aSBoZWxwZXIgZnVuY3Rpb24gYW5hbG91Z291cyB0byB0aGUgZ2l0aHViIGFuZCBnaXRsYWIKPiBo
ZWxwZXJzIHRvIG1ha2UgaXQgZWFzaWVyIHRvIGRvd25sb2FkIHBhY2thZ2VzIGZyb20gcHlwaSB1
c2luZyB0aGlzIHVybAo+IHNjaGVtZS4KPgo+IEZvciB0aGF0IHdlIGludHJvZHVjZSBhIGZpcnN0
Y2hhciBmdW5jdGlvbiAod3JpdHRlbiBieSBQZXRlcikgd2hpY2gKPiByZXR1cm5zIHRoZSBmaXJz
dCBjaGFyYWN0ZXIgaW4gYSBzdHJpbmcgd2l0aG91dCBzcGF3bmluZyBhIHNoZWxsLgo+Cj4gQ28t
ZGV2ZWxvcGVkLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogTWFyY3VzIEhvZmZtYW5uIDxidWlsZHJvb3RAYnVidTEuZXU+Cj4gLS0tCj4g
ICBwYWNrYWdlL3BrZy1kb3dubG9hZC5tayB8IDMgKysrCj4gICBzdXBwb3J0L21pc2MvdXRpbHMu
bWsgICB8IDMgKysrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWRvd25sb2FkLm1rIGIvcGFja2FnZS9wa2ctZG93bmxvYWQu
bWsKPiBpbmRleCBjZTYzY2U5NjU4Li4xNjBjNTEyNTk5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
cGtnLWRvd25sb2FkLm1rCj4gKysrIGIvcGFja2FnZS9wa2ctZG93bmxvYWQubWsKPiBAQCAtNTYs
NiArNTYsOSBAQCBnaXRodWIgPSBodHRwczovL2dpdGh1Yi5jb20vJCgxKS8kKDIpL2FyY2hpdmUv
JCgzKQo+ICAgIyBnaXRsYWIodXNlcixwYWNrYWdlLHZlcnNpb24pOiByZXR1cm5zIHNpdGUgb2Yg
R2l0bGFiLWdlbmVyYXRlZCB0YXJiYWxsCj4gICBnaXRsYWIgPSBodHRwczovL2dpdGxhYi5jb20v
JCgxKS8kKDIpLy0vYXJjaGl2ZS8kKDMpCj4gICAKPiArIyBweXBpKHBhY2thZ2UpOiByZXR1cm5z
IHNpdGUgb2YgcHlwaS5vcmcgaG9zdGVkIHBhY2tnZQo+ICtweXBpID0gaHR0cHM6Ly9maWxlcy5w
eXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL3NvdXJjZS8kKGNhbGwgZmlyc3RjaGFyLCQoMSkpLyQo
MSkKPiArCj4gICAjIEV4cHJlc3NseSBkbyBub3QgY2hlY2sgaGFzaGVzIGZvciB0aG9zZSBmaWxl
cwo+ICAgQlJfTk9fQ0hFQ0tfSEFTSF9GT1IgPQo+ICAgCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQv
bWlzYy91dGlscy5tayBiL3N1cHBvcnQvbWlzYy91dGlscy5tawo+IGluZGV4IDUyNzUwMDZkNmQu
LjNjYWYwNjI3NGYgMTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC9taXNjL3V0aWxzLm1rCj4gKysrIGIv
c3VwcG9ydC9taXNjL3V0aWxzLm1rCj4gQEAgLTYyLDYgKzYyLDkgQEAgZW5kZWYKPiAgICQoZXZh
bCAkKGNhbGwgY2FzZWNvbnZlcnQtaGVscGVyLFVQUEVSQ0FTRSwkKGpvaW4gJChhZGRzdWZmaXgg
OiwkKFtGUk9NXSkpLCQoW1RPXSkpKSkKPiAgICQoZXZhbCAkKGNhbGwgY2FzZWNvbnZlcnQtaGVs
cGVyLExPV0VSQ0FTRSwkKGpvaW4gJChhZGRzdWZmaXggOiwkKFtUT10pKSwkKFtGUk9NXSkpKSkK
PiAgIAo+ICsjIGV4dHJhY3RzIHRoZSBmaXJzdCBjaGFyYWN0ZXIgb2YgYSBzdHJpbmcKPiArZmly
c3RjaGFyID0gJChpZiAkKDEpLCQoc3RyaXAgJChmb3JlYWNoIGMsJChbRlJPTV0pIC8gJChbVE9d
KSwkKGlmICQocGF0c3Vic3QgJChjKSUsLCQoMSkpLCwkKGMpKSkpKQo+ICsKPiAgICMgUmV2ZXJz
ZSB0aGUgb3JkZXJzIG9mIHdvcmRzIGluIGEgbGlzdC4gQWdhaW4sIGluc3BpcmVkIGJ5IHRoZSBn
bXNsCj4gICAjICdyZXZlcnNlJyBtYWNyby4KPiAgIHJldmVyc2UgPSAkKGlmICQoMSksJChjYWxs
IHJldmVyc2UsJCh3b3JkbGlzdCAyLCQod29yZHMgJCgxKSksJCgxKSkpICQoZmlyc3R3b3JkICQo
MSkpKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
