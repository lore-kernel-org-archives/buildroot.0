Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAC1C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 14:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F72180E5C;
	Thu, 18 Jul 2024 14:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQ_mg3F1SYFx; Thu, 18 Jul 2024 14:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E41181EED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E41181EED;
	Thu, 18 Jul 2024 14:42:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D862F1BF59C
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 14:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C609D403B8
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 14:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12UjnI4oj4eM for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 14:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.47;
 helo=mail-ej1-f47.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B85B640332
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B85B640332
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B85B640332
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 14:42:16 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a77bf336171so145644766b.1
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 07:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721313734; x=1721918534;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ER8xwGbeSFu0s/WyEaSu35WVcLpPm5xuj1f5eUXF3YE=;
 b=SqmcBbtFaMgGm10MBfn4CFGzQcW0MzQR3g/l4vdxkyIRnMAcPo4cIbVU/ljK8yIwwZ
 JBtCh+jtRvNSU/xJ9wo1HA//iVl+x91XuAfMv8TRKV0embRYbI990h2O4mERYFnmdctp
 +GO95Rsas9oozuYTWv9bCZjGd1nZmogLMt5pYYnorwpTE6G9uwl+2zBnVFsipZz9d1uM
 F8QSBylEAJEL3RTra/WcJkGccFXjY3BkR05nURjg2fOX9yxaQMqTAu5nu7pSRL7m8tUI
 xg7NeMljnim/r6MRDuDwvsPL/hrfwgJSkn9mv2AcUpePTRb1qhSqNQ3WafAeWvaalRNw
 XmZA==
X-Gm-Message-State: AOJu0YwLCBiUem4ORBwQomZWp0thL8dkjOUCiDLD6605CoIcSBGuw9L2
 Ze5p1SZqRAnjIguq0qfEMzt3bwsdmwUQu1xb/6lzqswotWPKIIVEJkH5LQ7k
X-Google-Smtp-Source: AGHT+IHHUowtzyOx/cEnrjEjb7FliqNn9iPJDxMt0yy8JHZeYso6Lz/2HpL8HUpbp4YGoEg6hVbAcQ==
X-Received: by 2002:a17:906:4bd5:b0:a72:b43c:72f2 with SMTP id
 a640c23a62f3a-a7a0f0fe745mr324936566b.2.1721313734214; 
 Thu, 18 Jul 2024 07:42:14 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5e8609sm571465766b.94.2024.07.18.07.42.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 07:42:13 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-58e76294858so3722827a12.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 07:42:13 -0700 (PDT)
X-Received: by 2002:a50:a69e:0:b0:57d:3df:ba2d with SMTP id
 4fb4d7f45d1cf-5a1554ecc65mr3141302a12.2.1721313733483; Thu, 18 Jul 2024
 07:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <CADXxVSKBFjoub2ctkeSAzuuw2hbaMKwPw+xC=BG9z5+JJk7vSg@mail.gmail.com>
 <23725f14-d243-45da-b096-948c5e063aa7@mind.be>
In-Reply-To: <23725f14-d243-45da-b096-948c5e063aa7@mind.be>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Thu, 18 Jul 2024 08:42:00 -0600
X-Gmail-Original-Message-ID: <CADXxVS+tRXXBbtVf=DXOtsH6BqbJgbKDZgQn206aS0sOMYek=w@mail.gmail.com>
Message-ID: <CADXxVS+tRXXBbtVf=DXOtsH6BqbJgbKDZgQn206aS0sOMYek=w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: Re: [Buildroot] [PATCH] package/connman: Remove wpa_supplicant
 selection for wifi
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
Cc: martin@barkynet.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LApUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4KCgpPbiBUaHUsIEp1bCAxOCwgMjAy
NCBhdCA0OjA04oCvQU0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3cm90
ZToKPgo+Cj4KPiBPbiAxNi8wNy8yMDI0IDIzOjE0LCBCcnljZSBKb2huc29uIHdyb3RlOgo+ID4g
Q29ubm1hbiB3aWZpIHdvcmtzIGJvdGggd2l0aCBJV0QgYW5kIHdwYV9zdXBwbGljYW50LiAgWW91
IGRvbid0IHdhbnQKPiA+IEJSMl9QQUNLQUdFX1dQQV9TVVBQTElDQU5UIHNlbGVjdGVkIHdoZW4g
dXNpbmcgSVdELgo+Cj4gICBCdXQgeW91IHN0aWxsIG5lZWQgb25lIG9mIHRoZW0sIHJpZ2h0PyBX
ZSBub3JtYWxseSBkbyB0aGF0IHdpdGggYSBjb25kaXRpb24gbGlrZToKPgo+ICAgICAgICAgc2Vs
ZWN0IEJSMl9QQUNLQUdFX1dQQV9TVVBQTElDQU5UIGlmICFCUjJfUEFDS0FHRV9JV0QKPgo+CgpZ
ZXMgeW91IHN0aWxsIG5lZWQgb25lIG9yIHRoZSBvdGhlci4gSSdsbCB1cGRhdGUgdGhlIHBhdGNo
IHRvIGRvIGl0IHdpdGggdGhlCgpzZWxlY3QgQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlQgaWYg
IUJSMl9QQUNLQUdFX0lXRAoKVGhhdCBpcyBwcm9iYWJseSB0aGUgbGVhc3QgdW5leHBlY3RlZCBi
ZWhhdmlvciBpZiBzb21lb25lIHdhcyByZWx5aW5nCm9uIGNvbm5tYW4gc2VsZWN0aW5nIHdwYV9z
dXBwbGljYW50IGJ5IGRlZmF1bHQuCgpGaXJzdCB0aW1lIHRyeWluZyB0byBwdXNoIGEgcGF0Y2gg
dXAgdG8gYnVpbGRyb290LiBXYXMgYSBsaXR0bGUKYW5ub3lpbmcgdHJ5aW5nIHRvIGdldCBnaXQt
bWFpbCB3b3JraW5nIHdpdGggZ21haWwsIGVuZGVkIHVwIGp1c3QgY29weQpwYXN0aW5nIHRoZSBw
YXRjaCBpbnRvIGFuIGVtYWlsLiAgSSBrbm93IHlvdSBoYXZlIHlvdXIgcHJvY2Vzc2VzCmFscmVh
ZHkgc2V0dXAsIGJ1dCB3b3VsZCB5b3UgY29uc2lkZXIgYWxsb3dpbmcgdGhlIGdpdGxhYiBQUnMg
c29tZWRheT8KIE1pZ2h0IGdldCBtb3JlIGNvbnRyaWJ1dG9ycyEKClRoYW5rcwpCcnljZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
