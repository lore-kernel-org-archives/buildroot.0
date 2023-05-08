Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74486C7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 16:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0409761541;
	Mon,  8 May 2023 16:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0409761541
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v57oUR_K2jA0; Mon,  8 May 2023 16:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68FCE61542;
	Mon,  8 May 2023 16:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68FCE61542
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E940B1BF35B
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C254161542
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C254161542
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCP3sv7xrqZ5 for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 16:24:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E0D561541
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E0D561541
 for <buildroot@buildroot.org>; Mon,  8 May 2023 16:24:45 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-51452556acdso3034807a12.2
 for <buildroot@buildroot.org>; Mon, 08 May 2023 09:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683563085; x=1686155085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=upRgCW9fw0xdqM2VDSRF++O+xVrEAdw4BkxwbIlgG1c=;
 b=NQWUs3cIruNJ/7JZH4oX2fc/kdwWfYWuiaAMBun2+bJVhiN9Yf7X3FXIwxDQUP7WpK
 YZTibi/vc9IcKw+1hi3FqXMe+ML850fduhhtLjsu5RFItD8Kuz0Ik6wNABr4jdy7H17T
 B4JTj3i+d4yeOooPuMg3rFo+yCkFXV9gEWPn6MHjuN7x80vWm2bZLpy61q14g94H57kW
 QZ51EHxg+P1p5wQl1hIymDpR4ol23pMvQd1RJnO92v0/Xn8X8H2cQt+xcU5hUqS4JuAx
 VbNTvDSKLBgH/Um2QE64pw8TC3hZg0fVLnCkir9dK06hVO4fwCrGArLrJDJvZ1KhJUIk
 Teqg==
X-Gm-Message-State: AC+VfDxYmnOSW3OrU3bABX860vP6Oo+iHzqiEekbiZgIBuCnSkdkC+BL
 oiwm7n5YQN+hKLX8VSZVMsQbMg==
X-Google-Smtp-Source: ACHHUZ5a6Ew2vvMeOMpMAxLGynnGwxLzSBR6E+vS9XNsZoiEq4X5EXgAWGXwYxKqmSolKd8+JTQVqg==
X-Received: by 2002:a17:90a:8a05:b0:24d:ebf8:b228 with SMTP id
 w5-20020a17090a8a0500b0024debf8b228mr10427878pjn.19.1683563084862; 
 Mon, 08 May 2023 09:24:44 -0700 (PDT)
Received: from [192.168.0.164] (d205-250-120-28.bchsia.telus.net.
 [205.250.120.28]) by smtp.gmail.com with ESMTPSA id
 kp14-20020a17090ae94e00b0024e4efbb843sm10031033pjb.22.2023.05.08.09.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 09:24:44 -0700 (PDT)
Message-ID: <e8102c98-41a9-b43b-c53a-ec6a8581bf7f@threespeedlogic.com>
Date: Mon, 8 May 2023 09:24:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <ed1bff77-5934-f09a-ab39-ca4eea6b4b12@threespeedlogic.com>
 <20230507201254.GK252090@scaer>
From: Graeme Smecher <gsmecher@threespeedlogic.com>
In-Reply-To: <20230507201254.GK252090@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20221208.gappssmtp.com; s=20221208; t=1683563085;
 x=1686155085; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=upRgCW9fw0xdqM2VDSRF++O+xVrEAdw4BkxwbIlgG1c=;
 b=NYBGnwaRj+dOid/t+IVqDLyjOXZR6+jn4hRaP7GFBgJfurAux585Xl+HYFkFr2dH4H
 nuNaiDUwHBpaoq+4/iwQzlWGRQInM4DKs63sFqoYr9QMKTJ0wQ/GWFj4bSgka2YSr5Jo
 M4AIkkIaEiZX2VJI6VOR5MHjVxlLxyMGM98l1hpHZAw9cnlFR8RUuSfiLN1OLW/MVnAL
 iwa9JjV0g2f18bbTFQhqbTFAmZPonZMVUOAXKv6gF6YPelaYHqwA47Yks5+LARwjxCBa
 FrtU+FBc5ryj9NZlpYNN8gPqdKbjZPkJ/oMCbyVZljPklDAvHLlb6FoYwXpuBHkSNGeR
 NqFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=threespeedlogic-com.20221208.gappssmtp.com
 header.i=@threespeedlogic-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=NYBGnwaR
Subject: Re: [Buildroot] Suitability for upstreaming - JupyterLab 4.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwgYWxsLAoKT24gNS83LzIzIDEzOjEyLCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IEdy
YWVtZSwgQWxsLAo+IAo+IE9uIDIwMjMtMDUtMDIgMTQ6MzMgLTA3MDAsIEdyYWVtZSBTbWVjaGVy
IHNwYWtlIHRodXNseToKPj4gSnVweXRlckxhYiBpcyBhYm91dCB0byByZWxlYXNlIHZlcnNpb24g
NC4wLjAgWzFdLiBCZWNhdXNlIHRoZXkndmUgCj4+IHN3aXRjaGVkIHRvIGhhdGNobGluZyBbMl0s
IGl0IHNlZW1zIHRvIGJlIG11Y2ggZWFzaWVyIHRvIHBhY2thZ2UgCj4+IHRoYW4gaXQgdXNlZCB0
byBiZS4gKE15IHByZXZpb3VzIGV4cGVyaW1lbnRzIHBhY2thZ2luZyBqdXB5dGVybGFiIAo+PiBv
ciBpcHl0aG9uLW5vdGVib29rIHdlcmUgYmFmZmxpbmcgZmFpbHVyZXMuKQo+PiAKPj4gSGF2aW5n
IGFzc2VtYmxlZCBhIG1vc3RseS13b3JraW5nIHNldCBvZiBidWlsZHJvb3QgcGFja2FnZXMgZm9y
IAo+PiBKdXB5dGVyTGFiIDQuMC4wcmMxLCBJIHRoaW5rIGl0J2QgYmUgdXNlZnVsIHRvIGFzayBo
b3cgYSByZXF1ZXN0Cj4+IHRvIGluY2x1ZGUgaXQgaW4gdXBzdHJlYW0gYnVpbGRyb290IHdvdWxk
IGJlIHJlY2VpdmVkLiBXZSBjYW4KPj4gbWFpbnRhaW4gaXQgb3V0LW9mLXRyZWUsIGJ1dCBpZiBK
dXB5dGVyTGFiIGlzIHVzZWZ1bCB1cHN0cmVhbSBJJ20KPj4gaGFwcHkgdG8gZ3Jvb20gaXQgZm9y
IGluY2x1c2lvbi4KPiAKPiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIEp1cHl0ZXIgaXMgYSBub3Rl
Ym9vaywgYW5kIHdoYXQgSSB1bmRlcnN0YW5kIAo+IGJ5IHRoYXQsIGlzIHRoYXQgaXQgaXMgYW4g
aW50ZXJhY3RpdmUgdG9vbCB0byBpdGVyYXRlIG9uIHNvbWUKPiBwcm9ibGVtIGF0IGhhbmQgdW50
aWwgaXQgZ2V0cyBmaXhlZCwgb3IgdG8gdXNlIGFzIHR1dG9yaWFsIHRvIGV4cGxhaW4KPiBzb21l
IHNwZWNpZmljIHByb2JsZW0tc29sdmluZy4KClRoaXMgaXMgYSBncmVhdCBleHBsYW5hdGlvbiBv
ZiBob3cgbm90ZWJvb2tzIGFyZSB1c2VkIGluIGRhdGEgc2NpZW5jZS4KCj4gRXZlbiBpZiBteSB1
bmRlcnN0YW5kaW5nIGlzIGxpbWl0ZWQsIEp1cHl0ZXIgaXMgc3RpbGwgYSBub3RlYm9vaywgYW5k
Cj4gYnkgaXRzIHZlcnkgbmF0dXJlLCBhIG5vdGVib29rIGlzIGEgdmVyeSBpbnRlcmFjdGl2ZSB0
b29sLCBzbyBJIGZhaWwKPiB0byBzZWUgaG93IGl0IGNhbiBmaXQgaW4gYW4gZW1iZWRkZWQgc3lz
dGVtLi4uCgpOb3RlYm9vayBzZXJ2ZXJzIG1ha2UgZ3JlYXQgZnJvbnQtZW5kcyBmb3IgZW1iZWRk
ZWQgaW5zdHJ1bWVudGF0aW9uOgp0aGV5IHJlcGxhY2Ugd2ViLWJhc2VkIGludGVyZmFjZXMsIGVu
Y291cmFnZSBvcGVuIHNjcmlwdGFiaWxpdHksIGFuZApicmlkZ2UgdGhlIGdhcCBiZXR3ZWVuIGlu
dGVyYWN0aXZlIGFuZCBzY3JpcHRlZCB1c2UtY2FzZXMuIEhpZ2gtZW5kIGxhYgpnZWFyICh0aGlu
azogb3NjaWxsb3Njb3BlcykgZ2VuZXJhbGx5IGNvbWVzIHdpdGggc29tZSBvZiB0aGVzZSBpbmdy
ZWRpZW50cwpidXQgaXQncyB1c3VhbGx5IHZlbmRvci1zcGVjaWZpYywgb2Z0ZW4gaGFsZi1oZWFy
dGVkLCBhbmQgdXN1YWxseQppbmhlcml0IGl0cyBlcmdvbm9taWNzIGZyb20gSUVFRS00ODggKG5v
IHRoYW5rcykuCgpYaWxpbngncyBQWU5RIGZyYW1ld29yayBbMV0gaXMgYSBnb29kIGV4YW1wbGUg
d2l0aCBhIGZvY3VzIG9uIHRlYWNoaW5nCmFuZCBicmluZy11cC4gVGhlIFFJQ0sgZnJhbWV3b3Jr
IFsyXSBhZGFwdHMgUFlOUSBpbnRvIGFuIGluc3RydW1lbnQKY29udHJvbCBzdGFjay4gVGhlc2Ug
YXJlIHRoZSB0d28gSSdtIG1vc3QgZmFtaWxpYXIgd2l0aCwgYnV0IEknbSBzdXJlCnRoZXJlIGFy
ZSBvdGhlcnMuIEluIG15IG9waW5pb24sIHNvbWV0aGluZyBKdXB5dGVyLWxpa2UgaXMgYSBnb29k
IHBhcnQKb2YgYW4gb3Blbiwgc2NyaXB0YWJsZSwgYW5kIGVyZ29ub21pYyBpbnN0cnVtZW50YXRp
b24gc3RhY2suIEFuZCwKdWx0aW1hdGVseSwgaXQncyBqdXN0IGEgZ2xvcmlmaWVkIHdlYnNlcnZl
ciAtIHdoaWNoIGlzIHVuaXZlcnNhbCBvbgplbWJlZGRlZCB0YXJnZXRzIHRoZXNlIGRheXMuCgpO
b3RlIHRoYXQgUFlOUSBpcyBjdXJyZW50bHkgYmFzZWQgb24gYW4gb2xkZXIgdmVyc2lvbiBvZiBK
dXB5dGVyIGRlcGxveWVkCnZpYSBZb2N0byBbM10sIHNvIHdlIGFyZSBub3QgdGhlIG9ubHkgcGxh
Y2UgaW50ZXJlc3RlZCBpbiBhbiBlbWJlZGRlZCwKY3Jvc3MtZGVwbG95ZWQgSnVweXRlci4gV2Un
cmUgbGlrZWx5IHRvIGJlbmVmaXQgZnJvbSB0aGVpciAidGhpcyBkb2VzIG5vdAptYWtlIHNlbnNl
IHdoZW4gYnVpbGRpbmcgZm9yIGFuIGVtYmVkZGVkIHRhcmdldCIgYnVncywgYW5kIHZpY2UgdmVy
c2EuCgo8c25pcD4KCj4+IEZpbmFsbHksIEkgZG9uJ3QgaGF2ZSBhIGdvb2Qgc2Vuc2UgaG93IGFw
cHJvcHJpYXRlIHRoZSBweXRob24td2hlZWwKPj4gcGFja2FnaW5nIGlzLCBvciBob3cgaXQgd29y
a3MgKHRoaXMgaXMgYSBob3N0IHBhY2thZ2Ugb25seSBhbmQgSSd2ZQo+PiBwYWNrYWdlZCBpdCBu
YcOvdmVseS4pCj4gCj4gQWgsIHNvIHRoaXMgaXMgbm90IGV2ZW4gZm9yIHRoZSB0YXJnZXQgZGV2
aWNlPyBXaGF0IGlzIHRoZSBwdXJwb3NlIG9mCj4gaGF2aW5nIGl0IGFzIGEgaG9zdC1vbmx5IHBh
Y2thZ2UsIHRoZW4/CgpUaGVyZSBhcmUgYSBmZXcgcG9pbnRzIHdoZXJlIGEgcHl0aG9uIGhvb2sg
aW4gdGhlIGJ1aWxkIGZyYW1ld29yawooaGF0Y2hsaW5nKSBuZWVkcyB0byBpbnRlcnJvZ2F0ZSB0
aGUgYnVpbGQgZW52aXJvbm1lbnQsIHVuZGVyIHRoZQphc3N1bXB0aW9uIGl0J3MgdGhlIHNhbWUg
YXMgdGhlIGRlcGxveW1lbnQgZW52aXJvbm1lbnQuIElmIEkgZG8gZ2V0CnBhdGNoZXMgYmVhdGVu
IGludG8gc2hhcGUgZm9yIHVwc3RyZWFtaW5nLCBJJ2xsIG5lZWQgdG8gZXhwbGFpbiBhbmQvb3IK
YWRkcmVzcyB0aGlzIGJldHRlciAoYW5kIHBvc3NpYmx5IGZpbGUgYSBmZXcgdXBzdHJlYW0gYnVn
IHJlcXVlc3RzLikKCj4+IEluIHNob3J0OiBkb2VzIEp1cHl0ZXJMYWIgYmVsb25nIHVwc3RyZWFt
ZWQgaW4gYnVpbGRyb290LCBvciBpcyBpdAo+PiAgdG9vIHNwZWNpYWxpemVkIHRvIGJlIGJyb2Fk
bHkgdXNlZnVsPwo+IAo+ICJCcm9hZCIgb3IgIm5hcnJvdyIgdXNlIGlzIHZlcnkgYmFzZWQgb24g
dGhlIHBlcnNwZWN0aXZlIG9uZSBzZWVzIHRoZQo+IHdvcmxkIGZyb20uLi4gU29tZXRoaW5nIEkg
bWlnaHQgc2VlIGFzIGhhdmluZyBhIHZlcnkgbmFycm93IHVzZSwgCj4gb3RoZXJzIG1heSBzZWUg
YXMgYmVpbmcgdmVyeSBpbXBvcnRhbnQgYW5kIGNyaXRpY2FsIHRvIHRoZWlyIAo+IGZpZWxkLi4u
Cj4gCj4gU28gSSB3b3VsZCBub3Qgd2FudCB0byBkaXNjb3VyYWdlIHlvdSBmcm9tIHN1Ym1pdHRp
bmcsIG9yIGVuY291cmFnZSAKPiB5b3UgaW50byBzdWJtaXR0aW5nLi4uIElmIHlvdSBoYXZlIHNv
bWV0aGluZyB0aGF0IHdvcmtzLCBhbmQgeW91IGNhbiAKPiBwcm92aWRlIGEgZ29vZCByZXNvbiB0
byBoYXZlIGl0IGluIEJ1aWxkcm9vdCwgdGhlbiBmZWVsIGZyZWUgdG8gc2VuZCAKPiBwYXRjaGVz
Lgo+IAo+IFdoYXQgd29ycmllcyBtZSwgaXMgd2h5IGl0IGlzIGEgaG9zdCBwYWNrYWdlLCBhbmQg
d2hhdCBpdHMgdXNlIGluIAo+IHRoaXMgY2FzZSBpcy4gTWF5YmUgYW4gYW5zd2VyIHdvdWxkIGJl
IHNvbWV0aGluZyBsaWtlOgo+IAo+IFdlIG5lZWQgSnVweXRlciB0byBpbnRlcnByZXQgbm90ZWJv
b2tzLCB0aGF0IHByb2Nlc3MgW3Jhdy1kYXRhXSBpbnRvCj4gIFtvcHRpbWlzZWQtZGF0YV0gdXNp
bmcgW2RhdGEtcHJvY2Vzc10sIGFuZCB3cml0dGVuIGJ5IHRob3NlIHBlc2t5IAo+IGRhdGEtc2Np
ZW50aXN0cyB3aG8gZG9uJ3Qga25vdyBiZXR0ZXIgKHNuYXJrKS4KPiAKPiAoSSBrbm93IHNvbWUg
Y29sbGVhZ3VlcyB3aWxsIHNuYXAgYmFjayBhdCBtZSB3aGVuIHRoZXkgcmVhZCB0aGlzOi1dKQo+
IAo+IEFsc28sIGFzIGEgaG9zdC1vbmx5IHBhY2thZ2UsIGhvdyBjYW4gd2UgdGVzdCB0aGF0IGl0
IHdvcmtzLCB0byAKPiB2YWxpZGF0ZSB0aGUgcGFja2FnaW5nLCBhbmQgdG8gYXZvaWQgcmVncmVz
c2lvbnMgaW4gdGhlIGZ1dHVyZT8KCk9LIC0gSSB3YXMgbG9va2luZyBmb3IgYSBxdWljayB0ZW1w
ZXJhdHVyZSBjaGVjay4gSSdtIGVuY291cmFnZWQgYnkKd2hhdCB5b3UndmUgd3JpdHRlbiBhbmQg
dW5kZXJzdGFuZCB0aGUgcXVlc3Rpb25zIHlvdSd2ZSBhc2tlZC4KCkkgaGF2ZSBjb21taXRzIGlu
IGEgcHVibGljIGJ1aWxkcm9vdCBicmFuY2ggWzRdLCBidXQgdGhleSBhcmUgbm90CnJlYWR5IGZv
ciB1cHN0cmVhbWluZy4gSSB3aWxsIGFkZCAidXBzdHJlYW1pbmciIHRvIG15IHRvLWRvIGxpc3Qu
IEluCnRoZSBtZWFudGltZSwgYW55b25lIGJ1bXBpbmcgaW50byB0aGlzIG1lc3NhZ2UgaXMgd2Vs
Y29tZSB0byB0YWtlIGEgbG9vay4KCmJlc3QsCkdyYWVtZQoKWzFdOiBodHRwOi8vd3d3LnB5bnEu
aW8KWzJdOiBodHRwczovL3FpY2stZG9jcy5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvClszXTog
aHR0cHM6Ly9naXRodWIuY29tL1hpbGlueC9tZXRhLWp1cHl0ZXIKWzRdOiBodHRwczovL2dpdGh1
Yi5jb20vdDAtdGVjaG5vbG9neS9idWlsZHJvb3QtY3JzL2NvbW1pdC8wOTFmNzNiODg3Mjk0ZjYy
MmIzN2EzMTAwMWE3Y2M2N2EwNmEwYmQ3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
