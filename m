Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3376C10F15
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 08:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80094400E2;
	Wed, 24 Apr 2024 08:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egjf2riWO6tz; Wed, 24 Apr 2024 08:06:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 730D8402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 730D8402BC;
	Wed, 24 Apr 2024 08:06:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B8CD1BF47D
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 08:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84A74404D5
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 08:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rK6vmb1mMbu3 for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 08:06:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA2CD403C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA2CD403C8
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA2CD403C8
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 08:06:22 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a587fac79e5so190652866b.3
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 01:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713945980; x=1714550780;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S0gOb5IHtRCTAaCdKDjG/1wSNViYxz9FU9M1rI/GWeA=;
 b=A+jfW4aWrkCVn8QS7rWdI2RlmAruakOjD2iF/lVuHSpJZlWW8UykvNbktrjyvqr80F
 A7ZhEigyFkfVCphkaun/nvgfgcO5X9crxwTNn/sMr7IsFzy+U8DCz0poG3u/n/UNxYOk
 BwNlSzbONyVz6vN3rfcyfXOgOwsgKPVZUaAByb1TGzqwwnAD5SBjg6nIaHgCIwj4cHcP
 dXM7cJ5oaB3KBAr4OpbHUAbBc2SvSFfnjICAq0lCSShPGAhioTp+E73LMGCul6/yIjJC
 wp8f6OHFsHKuIe15BviSObsOzZA5ggKQbIlMriHwApgogR2wf4tIN4skRzrtZzJx3NVC
 ktJQ==
X-Gm-Message-State: AOJu0Yxm0Y2mGWiCxNPOB8m/DS4oS/aq3AGzGwFuMeG4FXQ0ocRB53I+
 4cLZQmspiosNv9vTYZoMMvm8vF5po5zHvj/ctj6HRvEhkUWk6gSzc7tdH7yOVdo20wXb8VclkP3
 xzIPsHkuaazcZmIZIMGKi1x17eQ2zT86wps2KPt+UdP1tCJRPFYeXzG+JkwF29Q==
X-Google-Smtp-Source: AGHT+IHOqHtRoSbMmDv47oNuMvoL0jh4paUmFvDZeoV4e6xc44jAa1Fj624mbOJsqja6pLI8anCvHw==
X-Received: by 2002:a17:907:a4a:b0:a58:849f:4d18 with SMTP id
 be10-20020a1709070a4a00b00a58849f4d18mr1263067ejc.35.1713945980221; 
 Wed, 24 Apr 2024 01:06:20 -0700 (PDT)
Received: from theia ([2a02:8109:8abb:b200:e0f:cb9c:950e:c8ec])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a170906339300b00a5592a12fe2sm5757789eja.128.2024.04.24.01.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 01:06:19 -0700 (PDT)
Date: Wed, 24 Apr 2024 10:06:18 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240424080618.GB1370614@theia>
Mail-Followup-To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240423113313.GB527510@theia>
MIME-Version: 1.0
In-Reply-To: <20240423113313.GB527510@theia>
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1713945980; x=1714550780; darn=buildroot.org; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S0gOb5IHtRCTAaCdKDjG/1wSNViYxz9FU9M1rI/GWeA=;
 b=ls7qrEq8TnoEpguJByJTgPvUxjAvJ8OSfNnYOdPp18Evq3rDc8eZ30HnHQ3AcReJjl
 tIEVTzgVUHbjqKJRGEKcmpmo+CegSdprbS2jDTMMDJKwiat3z6HnuwnWXtq/lHDPDUOV
 /Xw7GIKCzt2vuUMklNSBWKxhopY3V4j7xRED7P36GDxXwuRpM0DRNrzLj1rfU2TL3qdy
 rCfCwjATZpqH/Gi/Q/zjZXoN2VJei2wn1cmWDY1yZB2c+R3sUYno1zbgKbi7gVVQEQ8v
 aDyG8CE4jb9YcCeMYneiKqYvilnopZNqKAcHfhW0JKvc3qRtEUfYxkIWydIrPY88DJAK
 4Jvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=ls7qrEq8
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKSSBoYXZlIHRvIGNvcnJlY3QgbXlzZWxmOgoKT24gVHVlLCBBcHIgMjMsIDIwMjQg
YXQgMDE6MzM6MTNQTSArMDIwMCwgR2VybyBTY2h3w6RyaWNrZSB3cm90ZToKPiBIaSBEYXJpbywK
PiAKPiBJIHRyaWVkIHlvdXIgcGF0Y2gsIGJ1dCBpdCBkaWRuJ3Qgd29yayBmb3IgbWUuIGJtYXB0
b29sIGZhaWxlZCB3aXRoIGFuCj4gZXJyb3IuIFRoZSBpc3N1ZSB3YXMgdGhhdCBteSBob21lIGRp
cmVjdG9yeSBpcyBlbmNyeXB0ZWQgdXNpbmcgZWNyeXB0ZnMuCj4gVGhpcyBkb2VzIG5vdCBpbXBs
ZW1lbnQgYWxsIGlvY3RsIG9wdGlvbnMgdGhhdCBhcmUgbmVlZGVkIGZvciBibWFwdG9vbAo+IHRv
IHJlYWQgdGhlIGJsb2NrIGFsbG9jYXRpb24gb2YgdGhlIGltYWdlIGZpbGUuIFRoZXJlIGFsc28g
c2VlbSB0byBiZQo+IGlzc3VlcyB3aXRoIFpGUywgc28gSSB3b3VsZCByZWNvbW1lbmQgdG8gbm90
IGVuYWJsZSB0aGlzIGJ5IGRlZmF1bHQgZm9yCj4gZGVmY29uZmlncy4KPiAKPiBBIHdvcmthcm91
bmQgZm9yIHRoZSBpc3N1ZSBkZXNjcmliZWQgYWJvdmUgd291bGQgYmUgdG8gc3BhcnNlIGNvcHkg
dGhlCj4gaW1hZ2UgdG8gYSBta3RlbXAgZmlsZSBhbmQgcnVuIGJtYXB0b29sIG9uIHRoYXQuIEhv
d2V2ZXIgdGhhdCB3aWxsIG9ubHkKPiB3b3JrIGlmIC90bXAgdXNlcyB0bXBmcyAoaWl1YykuIEFu
ZCB3aWxsIHBvdGVudGlhbGx5IGVhdCBhIGxvdCBvZiBtZW1vcnkKPiBmb3IgdGhpcyBzdGVwLgoK
VGhpcyB3b24ndCB3b3JrLiBPbiBzZWNvbmQgdGhvdWdodCBJIHdvbmRlcmVkIGhvdyBjcCBjYW4g
ZGV0ZXJtaW5lIGEKc3BhcnNlIGZpbGUgd2hpbGUgYm1hcHRvb2wgY2FuJ3QuIFNvIEkgY2hlY2tl
ZCBjb3JldXRpbHMsIGFuZCBpaXVjLApgY3AgLS1zcGFyc2U9YWx3YXlzYCB3aWxsIGRldGVjdCBo
b2xlcyBieSByZWFkaW5nIHRoZSBmaWxlIGFuZApnZW5lcmF0aW5nIGhvbGVzIGZvciBhbGwgYmxv
Y2tzIHRoYXQgY29udGFpbiBvbmx5IHplcm9zLiBDb3B5aW5nIGEgZmlsZQpsaWtlIHRoaXMgYW5k
IHRoZW4gdXNpbmcgYm1hcHRvb2wgb24gdGhlIGNvcHkgd291bGQgZGVzdHJveSB0aGUgYmVuZWZp
dApvZiBibWFwdG9vbC4gQmVjYXVzZSBibWFwdG9vbCBjYW4gZGlmZmVyZW50aWF0ZSBiZXR3ZWVu
IGJsb2Nrcwpjb250YWluaW5nIHplcm9lcyBhbmQgYmxvY2tzIHRoYXQgYXJlIGVtcHR5LiBFbXB0
eSBibG9ja3MgYXJlIGhvbGVzIChubwpuZWVkIHRvIGNvcHkgdGhvc2UpLCBibG9ja3MgY29udGFp
bmluZyB6ZXJvZXMgYXJlIHJlbGV2YW50ICh3aWxsIGJlCmNvcGllZCkuCgpCZXN0LApHZXJvCgo+
IAo+IEkgZ2VuZXJhbGx5IGxpa2UgdGhlIGFwcHJvYWNoIG9mIGJtYXB0b29sIGFuZCB0aGluayBp
bmNsdWRpbmcgdGhpcyBpbgo+IGJ1aWxkcm9vdCBzZWVtcyBsaWtlIGEgZ29vZCBpZGVhLiBNYXli
ZSB0aGUgZG9jdW1lbnRhdGlvbiBzaG91bGQgYWxzbwo+IGluY2x1ZGUgYSBzZWN0aW9uIG9uIHRo
YXQgaW4gIjE0LjEgQm9vdCB0aGUgZ2VuZXJhdGVkIGltYWdlcyIuIEN1cnJlbnRseQo+IGl0IG9u
bHkgY292ZXJzIE5GUyBib290IGFuZCBMaXZlIENELiBEaWZmZXJlbnQgb3B0aW1pemF0aW9ucyBm
b3Igc2RjYXJkCj4gZmxhc2hpbmcgc2VlbSB0byBiZSBtaXNzaW5nLgo+IAo+IEJlc3QsCj4gR2Vy
bwoKLS0gCgoKCuKAk+KAk+KAkwoKCmdyYW5kY2VudHJpeCBHbWJIIHwgQSBWb2RhZm9uZSBDb21w
YW55wqDCt8KgSG9sem1hcmt0IDHCoMK3wqA1MDY3NiAKKkNvbG9nbmUqwqB8wqBQaG9lbml4c2Vl
c3RyYXNzZSAxOMKgwrfCoDQ0MjYzICpEb3J0bXVuZCrCoMK3wqBHZXJtYW55CnzCoGluIAo8aHR0
cHM6Ly93d3cubGlua2VkaW4uY29tL2NvbXBhbnkvZ3JhbmRjZW50cml4PiB8IHBob25lOiArNDkt
MjIxLTY3Ny04NjAtMCAKfMKgZW1haWw6IGhlbGxvQGdyYW5kY2VudHJpeC5uZXQgPG1haWx0bzpo
ZWxsb0BncmFuZGNlbnRyaXgubmV0PgoKCmdyYW5kY2VudHJpeCBjYXJlcyBhYm91dMKgcHJpdmFj
eSAKPGh0dHBzOi8vZ3JhbmRjZW50cml4Lm5ldC9kZS9wYWdlcy9wcml2YWN5bWFpbC8+CgpBbXRz
Z2VyaWNodCBLw7ZsbiB8IEhSQiDCoAo3MDExOSB8IEdlc2Now6RmdHNmw7xocmVyOiBNLiBLcsO2
bWVyLMKgIFIuIEjDpG5lbCB8IFVTdC4tSWROci46IERFMjY2MzMzOTY5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
