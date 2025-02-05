Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B988DC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 08:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83BC6832BF;
	Wed,  5 Feb 2025 08:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saaZazyvX0wC; Wed,  5 Feb 2025 08:48:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E3D83330
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78E3D83330;
	Wed,  5 Feb 2025 08:48:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73A0ACD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61DF14056C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isDOdsmpHSHE for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 08:48:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F8D54055E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F8D54055E
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F8D54055E
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:48:45 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso74307175e9.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 00:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738745324; x=1739350124;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xvDn2zOgBks/EVrojkShjbnk5qFhApD/4KHpZPBkVCI=;
 b=DBgXBrKjtjA3JiNPS5Cy+oVQwIfcGWq3DwFHS2x9O08+rjL7dcHnYTajE9feTykJzf
 D5eTng8VJQZzmUh8sOjavdWf/W8/pC0B709dlI5nDSE+CE6r384n/MJZVlUFw0c3FA3Q
 TcUWlkTShnJaLElELtowedXT8QRPUFEEa66GJJkW26SEx38VNyVsEcmjQPpP5wHj36bb
 fqz2lSB8Ye44xIvKbyvHTJn0mKzUIGXknzxn5o8oa8uF3r8Ny2BJwU0G10mf1pcl/JxX
 fF/Hh4ndXq7gy+29bJCJHr4knaNE2Ig23kmfdRrm53Sd9dJywmMpCvbWv37ca4/oXh3z
 4CLw==
X-Gm-Message-State: AOJu0YyasYpKcDuXuePyFHWYpkLbpdIHAuY/gez13/c+ekqLtwhMnjSz
 bbk0FlGw+IlQdkaRBLNsvGDOyS5GoYbFlBia21YHyWqhgfAIDHTArzYVvYJ4Cns=
X-Gm-Gg: ASbGncsvqZ8TtZ1wQDtJXOxCdkVvo3VsDuCP8jMZKQhjbXXyQ4gI7WbOCiXqkgeFN86
 CRKrwcp9/8uNXeHJnERYsEYwqW6OGAiz3HYdmof5HyFxpr8al0l8Y/0rMERZhTefjpnVVhkqiIi
 kf+XGp68RIdOUOxTQPOyU2pfThuj1nqXXP361yj4TeZ48kL+L4Sne4ZEOHY//ZPOu1Rqqa8Sg0d
 N13TanaamcT+MCHA7MIJKolYb+25DPKntvCYAV6dx8kTCk7a9fRcUDwm+dzaxg+YCDC7qVmTycR
 wKF9937GmTtkob7SBOCVeKBoXmxlSafKsunjlHyfm2r5g38=
X-Google-Smtp-Source: AGHT+IGD07ONpB2RQAoWDJP2S/tMplWTlEbK38vrIs8H9lpVsGeQscXXClJsSR5Nq8OJP4hjOe0Ing==
X-Received: by 2002:a05:6000:4020:b0:385:d852:29ed with SMTP id
 ffacd0b85a97d-38db48d5c38mr1328903f8f.36.1738745324041; 
 Wed, 05 Feb 2025 00:48:44 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c11b71asm18318024f8f.39.2025.02.05.00.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 00:48:43 -0800 (PST)
Message-ID: <655518d0-dbe0-4655-9b24-726a2de1a784@mind.be>
Date: Wed, 5 Feb 2025 09:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joachim Wiberg <troglobit@gmail.com>, Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>,
 thomas.petazzoni@bootlin.com
References: <20250106203459.2875914-1-troglobit@gmail.com>
 <dq3i7hbdwatnngs4zix4pe3bwnv64fjca4i3krbjr3yccy3b4v@wjik7jr5er7z>
 <f07db2bf9668c00e911ffbc161551d875ffdb96f.camel@gmail.com>
Content-Language: en-GB
In-Reply-To: <f07db2bf9668c00e911ffbc161551d875ffdb96f.camel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738745324; x=1739350124; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xvDn2zOgBks/EVrojkShjbnk5qFhApD/4KHpZPBkVCI=;
 b=RfoNGppF+Ca4+sFcJB9/CSdv9DX74bWeQ11Pi0wymBp1qyHn/wzgZWbMhVAwhiXo/f
 TpZ7zPbJ0qj6a93zCHgaH8SnK5yhf05UcAvuGu8tMlmF/N2ZlRi6ENFsrCULGPoS46Jy
 li/EHYJ13sEbodcv2VmpCTMiUNLvsGSbFWhmjmR5PogmCqgXhq90JxWWO83Aa5uFOkWD
 QZbMim/MRXh0ZdWN2Nt6MZY0jslD+RkCba+y/MVwvptm97JPGu2O2Z/qCb/PZzUd09Vj
 wOY1YJ0wP7y/6iiY2o09MnHsx3ZUWzFFgJtnxkiNXdH2ayRrqgoEWi52EC7f73fbfUZi
 o1KA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RfoNGppF
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: make vtysh group
 configurable
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNS8wMi8yMDI1IDA1OjE0LCBKb2FjaGltIFdpYmVyZyB3cm90ZToKPiBIaSBWaW5jZW50
IQo+IAo+IE9uIFdlZCwgMjAyNS0wMi0wNSBhdCAwMjoyOCArMDEwMCwgVmluY2VudCBKYXJkaW4g
d3JvdGU6Cj4gCj4+IFdoeSB3b3VsZCB5b3UgZW5mb3JjZSBhIGZycnZ0eSB1c2VyIHRvIGFueSBv
dGhlciB2YWx1ZSA/IENhbiB5b3UKPj4gZXhwbGFpbiB0aGUgcmF0aW9uYWwgb2Ygbm90IHVzaW5n
IHRoZSBCdWlsZHJvb3QncyBkZWZhdWx0IHZhbHVlID8KPiAKPiBDdXJyZW50bHksIG5vbi1yb290
IHVzZXJzIG9mIGEgQnVpbGRyb290IHN5c3RlbSwgdGhhdCB5b3Ugd2FudCB0byBnaXZlCj4gYWRt
aW5pc3RyYXRvciBwcml2aWxlZ2VzIHRvIG1hbmFnZSB0aGUgc3lzdGVtLCBpLmUuLCBlZGl0IHN5
c3RlbSBmaWxlcwo+IGFuZCBjb25maWd1cmUgRnJyIGRhZW1vbnMgdXNpbmcgdnR5c2gsIG5lZWQg
dG8gYmUgbWVtYmVyIG9mIHR3byBncm91cHM6Cj4gd2hlZWwgYW5kIGZycnZ0eS4KCiAgVGhhdCBp
cyBjb3JyZWN0LCBidXQgSSBzdGlsbCBkb24ndCBzZWUgd2hhdCB0aGUgcHJvYmxlbSBpcyB3aXRo
IHRoYXQuIEl0J3MgCnByZXR0eSBzdGFuZGFyZCBVTklYIHN5c2FkbWluIHByYWN0aWNlIHRvIHVz
ZSBhIHVuaXF1ZSBncm91cCBmb3IgZWFjaCBzZXJ2aWNlIAphbmQgdG8gYWRkIHRoZSB1c2VycyB3
aG8gbmVlZCB0byBhY2Nlc3MgdGhhdCBzZXJ2aWNlIHRvIHRoZSBjb3JyZXNwb25kaW5nIGdyb3Vw
LgoKCj4gSSBwcm9wb3NlIG9wZW5pbmcgdXAgdGhhdCBzbyBpdCBpcyB1cCB0byB0aGUgQnVpbGRy
b290IHVzZXIgKGRldmVsb3BlcikKPiBob3cgdGhleSBtb2RlbCB0aGVpciBlbmQgc3lzdGVtLgoK
ICBXZSBkb24ndCB3YW50IHRvIGdpdmUgY29tcGxldGUgZnJlZWRvbSB0aG91Z2guCgoKPj4gRXZl
biBpZiBGUlIgaGFzIHN1Y2ggY2FwYWJpbGl0eSwgaXQgZG9lcyBub3QgbWVhbiB3ZSBzaG91bGQg
ZXhwb3NlIGl0Lgo+IAo+IFRoaXMgRnJyIGJ1aWxkLXRpbWUgc2V0dGluZyBjb250cm9scyB0aGUg
Z3JvdXAgd2hpY2ggYW4gYWRtaW5pc3RyYXRvcgo+IHVzZXIgaW4gYSBzeXN0ZW0gbXVzdCBiZSBt
ZW1iZXIgb2YgdG8gYmUgYWJsZSB0byBhY2Nlc3MgdnR5c2ggb3ZlciBpdHMKPiBVTklYIHNvY2tl
dCwgaXQgY2Fubm90IGJlIHNldCBzZXQgb3IgY2hhbmdlZCBpbiBhbm90aGVyIHdheSBhZnRlciBi
dWlsZC4KPiAKPiBBIHZhcmlhbnQgb2YgdGhlIHNhbWUgcGF0Y2ggdGhhdCB3b3VsZCB3b3JrIGZv
ciBteSBvd24gdXNlLWNhc2UsIGFuZCBpbgo+IHNvbWUgd2F5IGFsaWduIHdpdGggQnVpbGRyb290
IGRlZmF1bHRzLCB3b3VsZCBiZSB0byBjaGFuZ2Ugd2hhdCB3ZSBoYXJkLQo+IGNvZGUgaXQgdG86
Cj4gCj4gICAgIC0tZW5hYmxlLXZ0eS1ncm91cD13aGVlbAoKICBCdXQgdGhhdCB3b3VsZCBnaXZl
IGFjY2VzcyB0byBmcnIgdG8gZXZlcnkgdXNlciBpbiB0aGUgd2hlZWwgZ3JvdXAsIHdpdGggbm8g
CndheSBhdCBhbGwgdG8gcmVkdWNlIHRoYXQgYWNjZXNzLiBDb252ZXJzZWx5LCBhIHNlcGFyYXRl
IGZycnZ0eSBncm91cCBhbGxvd3MgeW91IAp0byBhZGQgd2hhdGV2ZXIgdXNlciBpcyBuZWVkZWQg
dG8gdGhhdCBncm91cC4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gSSBkaWQgbm90IHRoaW5r
IHN1Y2ggYSBwYXRjaCB3b3VsZCBmbHkgYXQgYWxsLCBpbiBwYXJ0aWN1bGFyIHNpbmNlIGl0IGlz
Cj4gbm90IGJhY2t3YXJkcyBjb21wYXRpYmxlLiAgV2hpY2ggaXMgd2h5IEkgd2VudCB3aXRoIHRo
aXMgYXBwcm9hY2ggd2hlcmUKPiB0aGUgZGV2ZWxvcGVyIGNhbiBhdCBsZWFzdCBkZWNpZGUgdGhl
IGdyb3VwIG9mIHVzZXJzIHNob3VsZCBiZSBhYmxlIHRvCj4gbWFuYWdlIEZyciBub3cgdGhhdCBp
dCBoYXMgc2hpZnRlZCB0byBldmVyeXRoaW5nLXZpYS12dHlzaCBmcm9tIHBlci0KPiBkYWVtb24g
LmNvbmYgZmlsZXMgYXMgdGhlaXIgZGVmYXVsdC4KPiAKPj4gWW91ciBzdWdnZXN0aW9uIHN0YXJ0
cyBhZGRpbmcgc29tZSBjb21wbGV4aXRpZXMuIEJhc2VkIG9uIHRoZSBzYW1lCj4+IG1vZGVsLCBp
ZiB3ZQo+PiBmb2xsb3cgaXQsIHdlIHNob3VsZCBkbyB0aGUgc2FtZSBmb3I6Cj4+ICDCoAktLWVu
YWJsZS11c2VyPWZycgo+PiAgwqAJLS1lbmFibGUtZ3JvdXA9ZnJyCj4+IHRvby4gVGhhdCdzIHdo
eSBJIHdvdWxkIGJlIHN0cm9uZ2x5IGludGVyZXN0ZWQgaW4gcmVhZGluZyB5b3VyCj4+IHJhdGlv
bmFscyBmb3Igc3VjaCBjYXBhYmlsaXR5Lgo+IAo+IEkgc2VlLCB3ZWxsIHRoYXQgd2FzIG5vdCBt
eSBpbnRlbnRpb24gYXQgYWxsIHRvIGltcGx5LiAgVGhlIGxhdHRlciBpcwo+IGZvciBwcml2aWxl
Z2Ugc2VwYXJhdGlvbiBvZiB0aGUgZGFlbW9ucyB0aGVtc2VsdmVzLCBJIGRvbid0IHNlZSBhbnkK
PiB2YWx1ZSB0byBhIHVzZXIgb2YgQnVpbGRyb290IHRvIGJlIGFibGUgdG8gY2hhbmdlIHRoYXQg
Zm9yIGFueSBwYWNrYWdlLgo+IAo+IAo+IEFsbCB0aGUgYmVzdAo+ICAgL0pvYWNoaW0KPiAgIAo+
IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
