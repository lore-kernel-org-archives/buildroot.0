Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA7DC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 14:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A898F41A00;
	Fri, 31 May 2024 14:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8d929T_kg_p; Fri, 31 May 2024 14:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5439141A69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5439141A69;
	Fri, 31 May 2024 14:57:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 730ED1D53A8
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 14:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D6D661147
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 14:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zThYtJpGDmo3 for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 14:57:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A89D26111D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A89D26111D
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A89D26111D
 for <buildroot@buildroot.org>; Fri, 31 May 2024 14:57:35 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-627ecda47d0so21819427b3.2
 for <buildroot@buildroot.org>; Fri, 31 May 2024 07:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717167454; x=1717772254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIWLVLpXy7mhfqKmEFvwFEpDZx14Y0fXPahfc5pE9uU=;
 b=kDeVY/LucdTY1uZ33VhLZi085S7eXWIUjsq5vLGyr/LscRhulLvD5cSfJVsZvzN7JM
 SZIdxyMp6+thr3gXdf/zP6+GayUY0iS2rz8bbMYMEstPuYv0majqdaNASCDJjDxRQ6gf
 Yv6jKTEdIfcJkslWxfDSfPNyUHNMfDqRyq7nzROyDy6OiC5sPHhSIMh2j5TCuxGd0E+j
 PrbP4BDWMxbW0pmqKqc1iP6VoNAT1e8MIKuKArtQCIEPY0oMMx3XMRHTHAGVAR2xph4X
 p8u7us1DXgJm5mGqNqCMXCMZF3qZhoSIroq6Uaf0Q1ZiDo4fJrUOL/HSbAAu3EP+Cnrn
 AxFw==
X-Gm-Message-State: AOJu0YyJKbNUY8tpQSzS+VwnIZKjNmha5eKGHTfFNL5DNBvVBb5S+Hm7
 ZmGBQ527lMfONFlUc0ODgEm6nd3b529iPG1qxNMa2gh/ZEXel9kKjrc5As4v9N3jNz7+mnDNv4M
 yXXxBUmFqk6JwdfBq83PwYky7E79hI//us01K34c9a9F+P+cB0K8=
X-Google-Smtp-Source: AGHT+IHx5U3emm8Nu0d1Z8T4p8sJbDbm1dbASTateXiPCZXLuwpuYtzHNEcelfJgviHmKUQ+2WfOIrzGnuZsKUP0vNk=
X-Received: by 2002:a81:5201:0:b0:627:ddef:34ab with SMTP id
 00721157ae682-62c7971dfc9mr18861627b3.24.1717167454098; Fri, 31 May 2024
 07:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240529213751.3919280-1-dario.binacchi@amarulasolutions.com>
 <87a5k7qfjv.fsf@dell.be.48ers.dk>
In-Reply-To: <87a5k7qfjv.fsf@dell.be.48ers.dk>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 31 May 2024 16:57:23 +0200
Message-ID: <CABGWkvpYgwKTQzu-Kx+ydqJdEXe99Dbg_o2KTE+nWKUcAjEhbQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717167454; x=1717772254;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIWLVLpXy7mhfqKmEFvwFEpDZx14Y0fXPahfc5pE9uU=;
 b=HXeeVcXrXtTowhi5lotn27gh8ijCXTaDgpPYVCBn7W+qgFk90V66b2HNw58J5ib/hd
 QSyFbO3/8RDqlRRenzbRfAtksFoR+WZf7XFOeNDolx6Nc7Hix4gKuHRAObL0IHkHmZGn
 atbuqKY72ZPZntm+J1WPr/QXl7RYpDdLD2IHk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=HXeeVcXr
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/at91sam9x5ek*_defconfig: add
 hashes for at91bootstrap3/Linux/headers/u-boot
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBUaHUsIE1heSAzMCwgMjAyNCBhdCA5OjEz4oCvUE0gUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+ID4+Pj4+ICJEYXJpbyIgPT0gRGFy
aW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cml0ZXM6
Cj4KPiAgPiBBbmQgZW5hYmxlIEJSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVMuIFdpdGgg
dGhpcywgd2UgY2FuIG5vdyBkcm9wIHRoZQo+ICA+IGRlZmNvbmZpZyBmcm9tIC5jaGVja3BhY2th
Z2VpZ25vcmUuCj4KPiAgPiBGdXJ0aGVybW9yZSwgdGhlIHVzZSBvZiB0aGUgZGlyZWN0b3J5IGJv
YXJkL2F0bWVsL2F0OTFzYW05eDVlay9wYXRjaGVzCj4gID4gZm9yIGFsbCA0IGF0OTFzYW05eDVl
aypfZGVmY29uZmlnIGNvbmZpZ3VyYXRpb25zIGF1dG9tYXRpY2FsbHkgZml4ZXMgdGhlCj4gID4g
TGludXggY29tcGlsYXRpb24gZmFpbHVyZSBmb3IgdGhlIGF0OTFzYW05eDVla19kZWZjb25maWcs
Cj4gID4gYXQ5MXNhbTl4NWVrX21tY19kZWZjb25maWcsIGFuZCBhdDkxc2FtOXg1ZWtfbW1jX2Rl
dl9kZWZjb25maWcKPiAgPiBjb25maWd1cmF0aW9ucyBhcyB3ZWxsLgo+Cj4gID4gU2lnbmVkLW9m
Zi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29t
Pgo+ICA+IC0tLQo+ICA+IENoYW5nZXMgdjEgLT4gdjI6Cj4gID4gLSBQdXQgdGhlIHBhdGNoZXMg
dW5kZXIgYm9hcmQvYXRtZWwvYXQ5MXNhbTl4NWVrL3BhdGNoZXMgYW5kIHVzZSB0aGVtCj4gID4g
ICBmb3IgYWxsIDQgY29uZmlndXJhdGlvbnMgKGkuIGUuIGF0OTFzYW05eDVla19kZWZjb25maWcs
Cj4gID4gICBhdDkxc2FtOXg1ZWtfZGV2X2RlZmNvbmZpZywgYXQ5MXNhbTl4NWVrX21tY19kZWZj
b25maWcgYW5kCj4gID4gICBhdDkxc2FtOXg1ZWtfbW1jX2Rldl9kZWZjb25maWcpLgo+Cj4gID4g
KysrIGIvYm9hcmQvYXRtZWwvYXQ5MXNhbTl4NWVrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaAo+
ICA+IEBAIC0wLDAgKzEsMiBAQAo+ICA+ICsjIExvY2FsbHkgY29tcHV0ZWQKPiAgPiArc2hhMjU2
ICBjYzcyZDZhMzZlYmY1ZjA5NzBlMTg3ODhiMWUxZGM5Yjc2YmE5MjM3ZWM2NzQ1YzZmMTZmMWIy
ZTFkOGZiM2EwICB1Ym9vdC1saW51eDRzYW1fNi4xLWdpdDQudGFyLmd6Cj4KPiBIbW0sIGRpZCB5
b3UgZG8gYW55dGhpbmcgc3BlY2lhbCBoZXJlPyBUaGlzIGlzIHRoZSBoYXNoIEkgZ2V0IGlmIEkg
dXNlCj4gdGFyIDEuMzQsIGJ1dCBOT1QgaWYgSSB1c2UgdGhlIGNvcnJlY3QgdmVyc2lvbiwgMS4z
NS4KCkkgbXVzdCBoYXZlIG1hZGUgYSBtaXN0YWtlLiBJIGRlZmluaXRlbHkgaGFkIHByb2JsZW1z
IGRvd25sb2FkaW5nIHNvbWUKcGFja2FnZXMsIHNvIEkKZGlkIHNvbWUgdGVzdHMgYnkgcmV2ZXJ0
aW5nIHZlcnNpb24gMS4zNSBvZiB0aGUgdGFyIHBhY2thZ2UuIEkgaGF2ZQpzZXZlcmFsIGJ1aWxk
cm9vdCBkaXJlY3Rvcmllcwogb24gbXkgUEMsIGFuZCBpbiBzb21lLCBJIGhhdmUgdGhlIHdyb25n
IHNoYTI1NnN1bSwgd2hpbGUgaW4gb3RoZXJzLCBJCmhhdmUgeW91ciBzaGEyNTZzdW0uCklmIEkg
cmVtZW1iZXIgc29tZXRoaW5nIG1vcmUgY2VydGFpbiBhYm91dCB3aGF0IEkgZGlkLCBJIHdpbGwg
bGV0IHlvdSBrbm93LgpTb3JyeSBmb3IgdGhlIGVycm9yLgoKVGhhbmtzIGFuZCByZWdhcmRzLApE
YXJpbwoKPgo+IEZpeGVkIGJ5IHJ1bm5pbmcgLi91dGlscy9hZGQtY3VzdG9tLWhhc2hlcyBhbmQg
YXBwbGllZCwgdGhhbmtzLgo+Cj4gLS0KPiBCeWUsIFBldGVyIEtvcnNnYWFyZAoKCgotLSAKCkRh
cmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5h
Y2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBU
cmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0
aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
