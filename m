Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D23D1356D
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 16:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4385F80D10;
	Sun, 27 Oct 2024 16:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFbDJBR3y2kS; Sun, 27 Oct 2024 16:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B22D80CF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B22D80CF7;
	Sun, 27 Oct 2024 16:39:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60221AEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D6C2402C2
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BBCF2apvjPk for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 16:39:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA9EB402C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA9EB402C0
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA9EB402C0
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:39:14 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e28fd83b5bbso3748844276.0
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 09:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730047153; x=1730651953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qy6iK96gf15XaMo9fVosG2DtaHYfCEdrfruuxFoMG5Y=;
 b=iaj5N640Gew1UR9gjUjX7SAXQ+WncO+nyLAvgZS558dmWfjeselRUXNq0MYZgLGWjI
 +X5ev0kXbmxwZ+V1kLqvscbAQkaxTsaAGIPuXwi5Zn0LfZ4ChAvJUVuyskoOL5IMpors
 YqGU2B333AvWxQLi9MWEIoFabykEs69Z6Qc4zF6nAXNrRKYrQOHY4dy8hqRuw9TV4/zh
 GlIUaha6OjCNTHm2cIQgg6yoqcUxeU1jFX2gXbcfdR6SoSW2J23SNLCK5MF9BhZPlekZ
 YxS0EmVpBgqo6VmjragVq1MHAgs48diIlZIJj9yD3453+Z0yoFrzotO/T5zdN/akw9Jr
 4A1A==
X-Gm-Message-State: AOJu0Yx9AD7EeNG+6I2ty2VxVdY74wzqq9p97xv67vcxaSejDdTfjROG
 BIzfhw5dpbjHWSLemhr25GYERSJ3/uk4EjSRpBlXyITAiNaizVKvczek033aFs02aI5RZUBRBTt
 GvguGdpSXKYEd3yrqBw/WslXbr1gW1+r2RrcvHw==
X-Google-Smtp-Source: AGHT+IH2V0J/vnDuEkHPhWDHM1a4BDBqnB/K4eHW6y2fOsV8x5AL7IPTZHHHlAJjsHmvd+UP53o6Wea9xhZDu+JVXj0=
X-Received: by 2002:a05:6902:72c:b0:e2b:d9d7:9078 with SMTP id
 3f1490d57ef6-e3087a6b315mr4196353276.3.1730047153542; Sun, 27 Oct 2024
 09:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <ZwuMDPcgFOLNVRqn@landeda>
In-Reply-To: <ZwuMDPcgFOLNVRqn@landeda>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 27 Oct 2024 17:39:02 +0100
Message-ID: <CABGWkvrSdWrsrvjqXFVx6OVZq9Cx4_aT1_z1LBH6D=AgsvbKpQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Buildroot ML <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730047153; x=1730651953;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qy6iK96gf15XaMo9fVosG2DtaHYfCEdrfruuxFoMG5Y=;
 b=YLrBiY/Jd9rKkG4CbIZk+i2eeSiNtac07iRH5p0XJW4Q3jmW818AOl9Ke1zw+6nJup
 nIfnQprC6vtbUAoIYoEHGDi/JWTS3PipFDJS8IfpOacF0ezQBMaFWwUeEhAgEEXvcEe2
 UJB8TZM6UNJUChz3ogIs8HBATkK4+HI7h/An8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YLrBiY/J
Subject: Re: [Buildroot] Resigning as a maintainer
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCkknbSBzb3JyeSBhYm91dCB5b3VyIGRlY2lzaW9uIHRvIGxlYXZlIEJ1aWxkcm9v
dCBtYWludGVuYW5jZSwKZXZlbiBtb3JlIHNvIGFmdGVyIGhhdmluZyBtZXQgYW5kIGtub3duIHlv
dSBpbiBwZXJzb24uCgpZb3VyICJBbGwiLCBpbiBhZGRpdGlvbiB0byB0aGUgcGF0Y2ggYXV0aG9y
LCB0byB3aG9tIHlvdSBleHRlbmRlZCBlYWNoCm9mIHlvdXIgcmV2aWV3cyBpbXByZXNzZWQgbWUg
ZnJvbSB0aGUgc3RhcnQsIG1ha2luZyBpdCB2ZXJ5IGNsZWFyIHdoYXQKeW91IG1lYW4gZm9yIG9w
ZW4gc291cmNlLgoKQXMgYSBjb250cmlidXRvciwgSSB0aGFuayB5b3UgZm9yIHRoZSBwYXRpZW5j
ZSBhbmQgeW91ciBzdWdnZXN0aW9ucyB0byBtYWtlCm15IHBhdGNoZXMgbWVyZ2VhYmxlLCBhbmQg
SSBob3BlIHRoYXQsIHBlcmhhcHMgaW4gdGhlIGZ1dHVyZSwgeW91IG1pZ2h0CnJlY29uc2lkZXIg
dGhpcyBkZWNpc2lvbi4KClRoYW5rcyBhbmQgcmVnYXJkcwpEYXJpbwoKT24gU3VuLCBPY3QgMTMs
IDIwMjQgYXQgMTE6MDDigK9BTSBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5m
cj4gd3JvdGU6Cj4KPiBIZWxsbyBBbGwsCj4KPiBFdmVudHMgYW5kIGNoYW5nZXMsIG1vcmUgb3Ig
bGVzcyByZWNlbnQsIGJvdGggb3JnYW5pc2F0aW9uYWwgYW5kCj4gdGVjaG5pY2FsLCBoYXZlIG1h
ZGUgbWUgcmVjb25zaWRlciB3aGV0aGVyIEkgc2hvdWxkIGNvbnRpbnVlCj4gY29udHJpYnV0aW5n
LCBpbnRlcmFjdGluZyB3aXRoIHRoZSBjb21tdW5pdHksIGFuZCBiZWluZyBhIG1haW50YWluZXIu
Cj4KPiBJJ3ZlIHRob3VnaHQgYWJvdXQgaXQgcXVpdGUgYSBiaXQsIGZvciBxdWl0ZSBzb21lIHRp
bWUgbm93LCBhbmQgSQo+IHNlZSBub3cgdGhhdCBtZXJlbHkgYXNraW5nIHRoZSBxdWVzdGlvbiBi
ZWdzIG9ubHkgb25lIHBvc3NpYmxlCj4gYW5zd2VyOiBuby4KPgo+IEFzIGEgY29uc2VxdWVuY2Us
IEkgaGF2ZSByZXNpZ25lZCBmcm9tIG15IHBvc2l0aW9uIGFzIGEgbWFpbnRhaW5lci4gVGhlCj4g
b3RoZXIgbWFpbnRhaW5lcnMgaGF2ZSBiZWVuIGluZm9ybWVkIG9mIG15IGRlY2lzaW9uIGEgZmV3
IGRheXMgYWdvIG5vdy4KPgo+IEFzIGZvciBjb250cmlidXRpbmcsIEkgZG9uJ3Qgc2VlIGhvdyB0
aGUgdGltZSBJIHdpbGwgcmVnYWluIGZyb20gbm8KPiBsb25nZXIgYmVpbmcgYSBtYWludGFpbmVy
LCBjb3VsZCBiZSBhcHBsaWVkIHRvIGJyaW5nIGluIGV2b2x1dGlvbnMgdG8KPiBCdWlsZHJvb3Qg
Z2l2ZW4gdGhlIGNpcmN1bXN0YW5jZXMuCj4KPiBGb3IgdGhlIHRpbWUgYmVpbmcsIEkgaGF2ZSBu
byBpZGVhIHdoYXQgd2lsbCByZXBsYWNlIHRoZSBtYW55IGhvdXJzCj4gYSB3ZWVrIEkgd2FzIHNw
ZW5kaW5nIG9uIEJ1aWxkcm9vdCBvbiBteSBvd24gdGltZTsgbWF5YmUgYSBmdXR1cmUKPiBwZXJz
b25hbCBwcm9qZWN0IHdpbGwgcmVxdWlyZSB0aGF0IEkgdXNlIEJ1aWxkcm9vdCBhZ2FpbiwgYnV0
IHVudGlsCj4gdGhlbiwgSSB3aWxsIG5vIGxvbmdlciBiZSBhbiBhY3RpdmUgY29udHJpYnV0b3Ig
ZWl0aGVyLgo+Cj4gSSB3aWxsIHN0aWxsIGtlZXAgbXkgZW50cmllcyBpbiB0aGUgREVWRUxPUEVS
UyBmaWxlIGZvciBhIHdoaWxlLCBzbyB0aGF0Cj4gSSBjYW4gYXQgbGVhc3QgdHJ5IGFuZCBoZWxw
IGZpeCB0aGUgbWVzcyBJIGxlYXZlIGJlaGluZCBtZS4KPgo+IEkgYW0gZ3JhdGVmdWwgdG8gYWxs
IHRoZSBjb250cmlidXRvcnMsIHBhc3QgYW5kIHByZXNlbnQsIGZvciB0aGUgbWFueQo+IHllYXJz
IHdlJ3ZlIGJlZW4gYWxsIHRvZ2V0aGVyIHdvcmtpbmcgdG93YXJkIG1ha2luZyBCdWlsZHJvb3Qg
YmV0dGVyLAo+IGFuZCBidWlsZGluZyBhIGdyZWF0IGNvbW11bml0eTsgSSd2ZSBsZWFybmVkIGEg
bG90IGFsb25nIHRoZSByaWRlLgo+IEkgd2lzaCB5b3UgYWxsIHRoZSBiZXN0IHdpdGggeW91ciBj
b250aW51ZWQgdXNlIG9mIEJ1aWxkcm9vdCBhbmQgeW91cgo+IGZ1dHVyZSBjb250cmlidXRpb25z
IQo+Cj4gUGV0ZXIsIFRob21hcywgQXJub3V0LCBSb21haW46IEkgd2lzaCB5b3UgYWxsIHRoZSBi
ZXN0IGluIHlvdXIgZnV0dXJlCj4gZW5kZWF2b3VycyB3aXRoIEJ1aWxkcm9vdCBtYWludGVuYW5j
ZS4KPgo+IFNvIGxvbmcsIGFuZCB0aGFua3MgZm9yIGFsbCB0aGUgZmlzaC4KPgo+IFJlZ2FyZHMs
Cj4gWWFubiBFLiBNT1JJTi4KPgo+IFAuUy4gVG8gYXZvaWQgYW55IGZ1dHVyZSBjb25mdXNpb246
IHRoaXMgaXMgbXkgb3duIHBlcnNvbmFsIHBvc2l0aW9uIGFuZAo+IGRlY2lzaW9uLCBhbmQgaGFz
IG5vIGNvbm5lY3Rpb24gdG8gbXkgcHJvZmVzc2lvbmFsIGFjdGl2aXRpZXMgdGhhdCBtYXkKPiBi
ZSByZWxhdGVkIHRvIEJ1aWxkcm9vdC4KPgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
PiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJC
T04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUg
IERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCAr
MzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwg
IFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBf
LypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tLS0nCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3Bl
cgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFy
ZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZv
QGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
