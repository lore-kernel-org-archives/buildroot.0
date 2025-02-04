Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFBBC02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 16:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F39938230A;
	Tue,  4 Feb 2025 16:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhNrc7nph4Oe; Tue,  4 Feb 2025 16:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0595822ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0595822ED;
	Tue,  4 Feb 2025 16:36:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98DB912A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C4C740AE5
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0SLNwO7Jp4qp for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 16:36:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3737240635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3737240635
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3737240635
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so67384225e9.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 08:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738686989; x=1739291789;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6s2wp7iQGHSNFUFn1locdPyc+48UrWMRWyTrU7DOcns=;
 b=F4wa8GZ119bY5APDHx3hphyOv2+HRWCNIAnZfl3kxZJcchTCb3iqqcTZojsVPyBckN
 wN5hr/h1Cc051W5OKywsD5VeqcidE+VAEkvBGVI7XSgZRIZQwrKjkzo8PvUa8Vbc/Caz
 K9h3gKHahGdqMe5/ocS9C3qNCjonmx0uuWbePbx68ZXydFLXQHLd84Ft9CiznmrLEcq0
 qoxXYMVdfXpcLxYCOVOhFg/PhCnvVik8JUpGESCsMw2NFsFLZikw0295kSABvagG21YJ
 iFNSYsrnO3BlVnbgO+jTWJuP3NQ35zdfSZFnnrgnwD8aaOSCWxr3k+olHQpykIme717n
 fz1g==
X-Gm-Message-State: AOJu0YzDlMDDRJYK+GlsY6ry/3i/1INjJd0NMlc0a+OS+ZP9/0V6tGoO
 1vtHWWZ80CMVRf+bHnkHfWf3zdj+xMu3sxyYZgFCrHlHGMOyVYCkjeLvLgU30b4=
X-Gm-Gg: ASbGncsvkoe+ofH/mIyEXuw7s8H7rlh8y007lPtMFGi7ia+yN0wPNr1/G/sVQYRdwqB
 NPUu4m6szfT56A/h/xCEndlkEaC1sRTXy7yGrfjkJeFEGsC0lqSpNyO2kiAwUipU5lCDc4XERX5
 SbbPyxPR0HmCL/32Vs9hzNFJi2iF+I5q+WC+IsK47gaFUOe/r7qk1h8IUZV++UVts1OvTbGrAS4
 VnSjh8MfF6X8KcBhgAz4GK/WDT+H0IweXqeYBMRhRLcgUTcM26awMVFDCjjN6CjwhxtW18LRLWZ
 ALRNNWD5unvuh0sW8dC3KYA73W8R8RDLZLyZjneB429xTtFCb9qEjfz2
X-Google-Smtp-Source: AGHT+IGL66qyVmvWoOzm69tnUEnhTBdpjdTQf1AYycBrxjPpT3uHWbsffv0P+QuK/wLa6k+k2fpq2g==
X-Received: by 2002:a05:600c:35d3:b0:434:f586:753c with SMTP id
 5b1f17b1804b1-438dc3c3790mr245614275e9.7.1738686989085; 
 Tue, 04 Feb 2025 08:36:29 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23deedfsm199335115e9.16.2025.02.04.08.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 08:36:28 -0800 (PST)
Message-ID: <476cc10f-1b93-4c80-bb0d-ca84c10d08f5@smile.fr>
Date: Tue, 4 Feb 2025 17:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Walle <mwalle@kernel.org>, Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel <cassel@kernel.org>, =?UTF-8?Q?Ga=C3=ABl_PORTAY?=
 <gael.portay@rtone.fr>
References: <20241213083430.4121422-1-niklas.cassel@wdc.com>
 <D6AG261DAIGT.19EZJ5IUQQ16R@kernel.org> <Z1v5werOKAXaX2iW@ryzen>
 <D6AGYGCVAEYN.F84LYRW2DRTV@kernel.org> <Z1wC0zRgrhS0jl52@ryzen>
 <D6AHJX8GO6HT.3K4SPRXLX14U4@kernel.org>
Content-Language: en-US
In-Reply-To: <D6AHJX8GO6HT.3K4SPRXLX14U4@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738686989; x=1739291789; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6s2wp7iQGHSNFUFn1locdPyc+48UrWMRWyTrU7DOcns=;
 b=oe/2v4ZJ0Cxtup8j/tCpBxrHcWAOWaj/lNtBLU6MiBty1b0txdws0nwAsigHJMO9YE
 8XLisDT9T69tprKdwkyEZb+zZ4JedvcKiAqeoWBDybqrmedL7MyiSENx4Svz4lxJng/r
 97dj3Awy1SeeswkNai0WVPnp6qa1Gd2yWc0sE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=oe/2v4ZJ
Subject: Re: [Buildroot] [PATCH v3 1/2] linux: add support for device tree
 overlays
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTmlrbGFzLCBNaWNoYWVsLCBBbGwsCgpMZSAxMy8xMi8yMDI0IMOgIDExOjAzLCBNaWNo
YWVsIFdhbGxlIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBIaSBOaWtsYXMsCj4gCj4+PiBC
dXQgSSd2ZSBqdXN0IHRlc3RlZCBib3RoIGNvbXBpbGluZyAuZHRzIGFuZCAuZHRzbyBmcm9tIHdp
dGhpbiBhCj4+PiB2ZW5kb3IgZGlyZWN0b3J5IGFuZCBpdCBzZWVtcyB0byBiZSB3b3JraW5nIG9u
IG5leHQtMjAyNDEyMTMgKD8pLgo+Pgo+PiBJZiB5b3Ugc2F5IHRoYXQgY29weWluZyB0byBhcmNo
LzxhcmNoPi9kdHMvPHZlbmRvcj4vIGlzIHN0aWxsIHdvcmtpbmcsIHRoZW4KPj4gbW9zdCBsaWtl
bHkgaXQgaXMgb25seSBjb3B5aW5nIHRvIGFyY2gvPGFyY2g+L2R0cyB0aGF0IGlzIG5vIGxvbmdl
ciB3b3JraW5nLgo+IAo+IENvcHlpbmcgaXQgdG8gZHRzLyB3YXMgd3JvbmcgZm9yIGFyY2gncyB3
aGljaCBoYWQgYSBzdWJkaXIgc3RydWN0dXJlCj4gYW55d2F5Lgo+IAo+Pgo+PiBJIHN0aWxsIHRo
aW5rIHRoYXQgdGhpcyBwYXRjaCBjYW4gYmUgbWVyZ2VkIGFzIGlzLgo+Pgo+PiBPbmNlIHRoZSBC
UjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSCBtZXNzIGhhcyBiZWVuIHNvcnRlZCwgc29t
ZW9uZSBjb3VsZAo+PiBhZGQgc3VwcG9ydCBmb3Igb3V0LW9mLXRyZWUgZGV2aWNlIHRyZWUgb3Zl
cmxheXMsIGlmIGFueW9uZSB3YW50cy9uZWVkcyB0aGF0Lgo+IAo+IFdlbGwsIHRoYXQgd2FzIGFj
dHVhbGx5IHRoZSBpbnRlbnRpb24gb2YgbXkgcGF0Y2ggOikKPiAKPj4gQWRkaW5nIHN1cHBvcnQg
Zm9yIGluLXRyZWUgZGV2aWNlIHRyZWUgb3ZlcmxheXMgbm93LCBkb2VzIG5vdCBtYWtlIGxpZmUg
aGFyZGVyCj4+IGZvciBhbnlvbmUgaWYgdGhleSB3YW50IHRvIGFkZCBzdXBwb3J0IGZvciBvdXQt
b2YtdHJlZSBkZXZpY2UgdHJlZSBvdmVybGF5cyBpbgo+PiB0aGUgZnV0dXJlLgo+IAo+IEFncmVl
ZC4KCkFjdHVhbGx5IHRoZSB2MiBmcm9tIE1pY2hlYWwgd2FzIG9rIGV2ZW4gaWYgdGhlIChpbnRy
ZWUvZXh0ZXJuYWwpIGRldmljZXRyZWUKb3ZlcmxheXMgc3VwcG9ydCBpcyBsaW1pdGVkIHRvIGtl
cm5lbCBiZWZvcmUgNi4xMiByZWxlYXNlLgoKSSBhZGRlZCBhbGwgY29udHJpYnV0ZWQgcGF0Y2hl
cyByZWxhdGVkIHRvIGRldmljZXRyZWUgb3ZlcmxheXMgYW5kIGV4dGVybmFsIGR0cwpoYW5kbGlu
ZyB3aXRoIHRoZSBsYXRlc3Qga2VybmVsLgoKSSdsbCBwb3N0IGlzIHNvb24uCgpCZXN0IHJlZ2Fy
ZHMsClJvbWFpbgoKPiAKPiAtbWljaGFlbAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
