Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B61E6FE34
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 17:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DE7181446;
	Fri,  6 Sep 2024 17:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jr8sOJEq52JM; Fri,  6 Sep 2024 17:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D25A81452
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D25A81452;
	Fri,  6 Sep 2024 17:04:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DFAD1BF38A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 17:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16D4C408CF
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 17:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRxkASx11qOe for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 17:04:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCEC3408C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCEC3408C5
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCEC3408C5
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 17:04:36 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e1d0e74f484so2764453276.2
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 10:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725642275; x=1726247075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vl5AcOAlbLn0zbqszLhESt0iWI7cAJK7z3/D8GPRaVU=;
 b=DQZywax3FUktor+zNOIMknEne6AcILjTnDqnHwgoXYp7W0l3B6BB4E+vPNSP5AioR7
 VrelHKagYgPx57/eWysQaQ4EeTfs88LcpSY5Q09ry65PwthRg7+nfETWGb/zJvV4E4/V
 +y2P/f7UEBEBiHS3DL5qQD9tgMb3+nTD0ogr8rk/FtaA/ZGf8bya2OvbaCsheZzC84t6
 7/iHHeBsftkfGlvsq98UzFGsI2Wi9XN4NLIGa5yvlMMI7UwbRCjz8qj4meTVG6/v+DJD
 nUoIoNf7Ft0YGpGUTuPtPC8jFbcz5J/dIC5m3ED/pWMZ3YYe22s0U3ytTKjX1SSNe4FA
 GtVQ==
X-Gm-Message-State: AOJu0Yzh4KzPAG141PIHRG7Um6OryFHYox5CapF/OmEMG/a4WM6H21pG
 fJLanoVoLliprX8DOi+OraGVpuecbuNn2Rd+6Dr0o+9OKjM9KMgAsZYU5PRGanjwpcQopmATO1p
 MvzSAzDJg7crnq2u+waGYM7WL07tgYh4eZ+ReBA==
X-Google-Smtp-Source: AGHT+IEYkN33q3cyLkxtCl2V9RmijvMgQdaydeXPjJpr6qw6FeMZ8+FXkQRe3wRiu9TgOJBv+2C9whXCjBHNdy6GOXE=
X-Received: by 2002:a05:690c:3205:b0:63b:d055:6a7f with SMTP id
 00721157ae682-6db452d5328mr30850267b3.38.1725642275340; Fri, 06 Sep 2024
 10:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240904174021.2670289-1-dario.binacchi@amarulasolutions.com>
 <ZtikL2bVIPqtvgJA@landeda>
 <CABGWkvqUodd2xpSpELk+_SbwuPrcpgiMfjWPsGDdWTme7_L=EQ@mail.gmail.com>
 <Ztlx-byJyg2ryXIF@landeda>
In-Reply-To: <Ztlx-byJyg2ryXIF@landeda>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 6 Sep 2024 19:04:24 +0200
Message-ID: <CABGWkvo3PZpjm3pFd375oCQfAcsjg=CdZwRv2Fhmv22R5CfhLQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725642275; x=1726247075;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vl5AcOAlbLn0zbqszLhESt0iWI7cAJK7z3/D8GPRaVU=;
 b=KrJjwmBTsVVp+pCLVIid9V4SvWNH5/QlotDcWXjvk32cLaf58DuCVDZCvwJ9AUb4/p
 y5HoHySNJzUDyOYPywliaXV/yHev8ls8ZUQNx1Z7kodM3zxljxrPHWnm01IkwkaelqfL
 pTwB0aiOuJG+5xD/rPP/9FgBNXuK6wqlSq8qg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=KrJjwmBT
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ipmitool: download
 enterprise-numbers versioned
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFRodSwgU2VwIDUsIDIwMjQgYXQgMTA6NTXigK9BTSBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBEYXJpbywgQWxsLAo+Cj4gT24g
MjAyNC0wOS0wNSAwODowOSArMDIwMCwgRGFyaW8gQmluYWNjaGkgc3Bha2UgdGh1c2x5Ogo+ID4g
T24gV2VkLCBTZXAgNCwgMjAyNCBhdCA4OjE34oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+IFstLVNOSVAtLV0KPiA+ID4gSSB0cmllZCBhIGZldyBo
YWNrcywgbm90YWJseSB0aGUgaW5mYW1vdXMgR0VUIHBhcmFtZXRlcnMsIGxpa2U6Cj4gPiA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9sYXJzZWdnZXJ0L2lhbmEtYXNzaWdubWVudHMvcmF3LzZlYWZbLi4u
XWVudGVycHJpc2UtbnVtYmVycy9lbnRlcnByaXNlLW51bWJlcnMmcGF0aD1mb28vZW50ZXJwcmlz
ZS1udW1iZXJzLTZlYWZbLi4uXS50eHQKPiA+ID4gYW5kIHZhcmlvdXMgdmFyaWFudHMgb2YgdGhh
dCwgYnV0IHRvIG5vdCBhdmFpbC4uLiBTbywgdW5sZXNzIHlvdSBjYW4KPiA+ID4gY29tZSB1cCB3
aXRoIGEgd2F5IHRvIGhhY2sgYSB2ZXJpb25lZCBmaWxlbmFtZSBpbiB0aGUgVVJMLCB3ZSdsbCBo
YXZlIHRvCj4gPiA+IGludHJvZHVjZSBhIGRlZGljYXRlZCBwYWNrYWdlLi4uIDotLwo+ID4gQUZB
SUssIGFkZGluZyB0aGUgcGFja2FnZSBpcyBwcm9iYWJseSB0aGUgY2xlYW5lc3Qgc29sdXRpb24u
Cj4KPiBBZ3JlZWQuCj4KPiBJbiB0aGlzIGNhc2UsIHRoZSBuZXcgcGFja2FnZSBzaG91bGQgcHJv
YmFibHkgYmUgc29tZXRoaW5nIGxpa2U6Cj4KPiAgICAgY29uZmlnIEJSMl9QS0dfSUFOQV9BU1NJ
R05NRU5UUwo+ICAgICAgICAgYm9vbCAiaWFuYS1hc3NpZ25tZW50cyIKPiAgICAgICAgIHNlbGVj
dCBCUjJfUEtHX0lBTkFfQVNTSUdOTUVOVFNfUEVOX1JFRwo+Cj4gICAgIGlmIEJSMl9QS0dfSUFO
QV9BU1NJR05NRU5UUwo+Cj4gICAgIGNvbmZpZyBCUjJfUEtHX0lBTkFfQVNTSUdOTUVOVFNfUEVO
X1JFRwo+ICAgICAgICAgYm9vbCAiUEVOIChFbnRlcnByaXNlIE51bWJlcnMpICByZWdpc3RyeSIK
Pgo+ICAgICBlbmRpZgo+Cj4gKHdlIG5lZWQgdGhlIHNlbGVjdCB0byBlbnN1cmUgc29tZXRoaW5n
IGdldHMgaW5zdGFsbGVkLCBhbmQgd2UgaGF2ZSB0aGUKPiBzdWItb3B0aW9uIGluIGNhc2Ugd2Ug
bmVlZCB0byBpbnN0YWxsIG90aGVyIGFpc3NpZ25tZW50cyBpbiB0aGUgZnV0dXJlKS4KPgo+IEFu
ZCB0aGVuIGl0IHNob3VsZCBpbnN0YWxsIHRoYXQgaW50bzoKPgo+ICAgICAkKFRBUkdFVF9ESVIp
L3Vzci9zaGFyZS9taXNjL2lhbmEvZW50ZXJwcmlzZS1udW1iZXJzCj4KPiBBbmQgaXBtaXRvb2wg
c2hvdWxkIGJlIGNvbmZpZ3VyZWQgdG8gdXNlIHRoYXQ6Cj4KPiAgICAgaWZlcSAoJChCUjJfUEtH
X0lBTkFfQVNTSUdOTUVOVFNfUEVOX1JFRykseSkKPiAgICAgSVBNSVRPT0xfQ09ORl9FTlYgKz0g
SUFOQURJUj0vdXNyL3NoYXJlL21pc2MvaWFuYQo+ICAgICBlbmRpZgo+CgpUaGFuayB5b3UgZm9y
IHRoZSBzdWdnZXN0aW9ucy4KVGFraW5nIGluc3BpcmF0aW9uIGZyb20gdGhlIHByZXZpb3VzIGNv
ZGUgcmV2aWV3cywgSSBoYXZlIHNsaWdodGx5IG1vZGlmaWVkCnNvbWUgb2YgdGhlIGNvZGUgcGFy
dHMgeW91IHdyb3RlLiBJIHByZWZlciB0byBwdXNoIHRvIHYzIHRvIGRpc2N1c3MgdGhlIHBhdGNo
Cm1vcmUgZWFzaWx5LCBjb25zaWRlcmluZyB0aGF0IHRoZXJlIHdpbGwgbGlrZWx5IGJlIGEgdjQg
dmVyc2lvbiBzaW5jZSBJIGRpZG7igJl0CnNwZWNpZnkgYW55dGhpbmcgcmVnYXJkaW5nIHRoZSBs
aWNlbnNlIG9mIHRoZSBpYW5hLWFzc2lnbm1lbnRzIHBhY2thZ2UsIGFzCkkgZGlkbuKAmXQgZmlu
ZCBhbnl0aGluZyBhYm91dCBpdCBpbiB0aGUgR2l0SHViIHJlcG9zaXRvcnkuCgpUaGFua3MgYW5k
IHJlZ2FyZHMsCkRhcmlvCgotLS0KCkZhbW1pIHNhcGVyZSBzZSBoYWkgYmlzb2dubyBkaSB1bHRl
cmlvcmkgdHJhZHV6aW9uaSBvIGFnZ2l1c3RhbWVudGkhCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1P
UklOLgo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0t
LS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAg
fAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJ
TCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKCgoK
LS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFy
aW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwg
MzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1
bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
