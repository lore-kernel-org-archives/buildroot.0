Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78D4C64EC4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 07:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 654D841949;
	Fri,  3 Mar 2023 07:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654D841949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idqSr5dzYNZr; Fri,  3 Mar 2023 07:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 698AD41891;
	Fri,  3 Mar 2023 07:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 698AD41891
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E93891BF3FC
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFDE841891
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 07:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFDE841891
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ge7Nmn1gJI6V for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 07:38:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64A144183A
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64A144183A
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 07:38:47 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id s11so6744238edy.8
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 23:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677829125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dggkE9IPBcKcKLE/bDY9xSP8btNmx1baFIa1NKKyjh8=;
 b=Gxrs3MKS1ny0i2bLmRcbNdsjF8oUNnouiwEVFolSfzk1sDR896d/e2v7kKUxNyzq5B
 b2i0f1ywUCBEeD9u6GJqjbXMXCuUlazR7W5tKQT4vOVgwKhaIEdQCFKD42KZv1+dym/C
 C5mkPPHCtXdA6kbtucb2w1IfS6HnN6/lLFVakKKTQPLgxNNJFqN3+Y9ZRPynUgEvlGAm
 DvLnbTNGRJmSLp7PczUSyKEByDpppBNL1xGg+2JiMNTG1COyVWQNt9T3XNPDJzEmQ/S6
 zjNj4Mky/mANhQN1gwqfJbtx1Ub8bEiCL8TlTQitBX9rMRivIn50aeVczplTJK4DqJ6z
 ZrBg==
X-Gm-Message-State: AO0yUKV4Ni6qPel8K7YwFUHnod6UF+U6Bkzjh8hlG+mGYukaN01Er2Te
 BlNYfdWmD9hjmjTexwytpuoIjIn75w/3B/H9Mzo=
X-Google-Smtp-Source: AK7set8JGO3OMP4rnqC0YozSe7cbhZw2dYK+kKdDJ+fmIxK11974IWaqXpC/aAJcvekg0tvn6iHnMQ==
X-Received: by 2002:a17:907:1b1e:b0:7c4:fa17:7203 with SMTP id
 mp30-20020a1709071b1e00b007c4fa177203mr813957ejc.63.1677829124913; 
 Thu, 02 Mar 2023 23:38:44 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 g14-20020a170906c18e00b008b1b86bf668sm657432ejz.4.2023.03.02.23.38.44
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 23:38:44 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id u9so6879108edd.2
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 23:38:44 -0800 (PST)
X-Received: by 2002:a17:906:6d55:b0:8d0:2c55:1aa with SMTP id
 a21-20020a1709066d5500b008d02c5501aamr351321ejt.0.1677829124185; Thu, 02 Mar
 2023 23:38:44 -0800 (PST)
MIME-Version: 1.0
References: <c5c998e135a5915b35bde46cd6c191610777aaf8.1677663986.git.stefan@agner.ch>
 <f757263ae4444a2a3e4ff4dae9223364c229a426.1677663986.git.stefan@agner.ch>
In-Reply-To: <f757263ae4444a2a3e4ff4dae9223364c229a426.1677663986.git.stefan@agner.ch>
Date: Thu, 2 Mar 2023 23:38:32 -0800
X-Gmail-Original-Message-ID: <CA+h8R2o3i1nKZO19J9HhsePrx5TnKwn7i7o+y5fH1iSyxq-H-w@mail.gmail.com>
Message-ID: <CA+h8R2o3i1nKZO19J9HhsePrx5TnKwn7i7o+y5fH1iSyxq-H-w@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google; t=1677829125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dggkE9IPBcKcKLE/bDY9xSP8btNmx1baFIa1NKKyjh8=;
 b=GIEK/S0YXIldYkqyQQTyGZRhIMOapJnnJcrah1q1O949fkFO7dmPwSK0PT+VhcYk5c
 OBuvdIEfhtCc8ai/9apNCSxx2uJCYR2ofpLj0lAY2BJLeTRlK5QhTbwqXfN69uXl/iW5
 vHi1cZFC11G85zgeVuN9oHW/rauDXtzHyONClw8eTXy2dCEGoOMEawTR4dyOmhVmZt/W
 LZLy1lzzLQ02Fyscx2HO6seSEEY7k4kVcgAf6rQyrPxa3CV2AUHeb+Ba6zlYZZSJM5BR
 hKuXG+H8nyitomjVnv+VtzOzxKCfLV3X/ECHgQUPQ3381nEHus5yzxmXkYmjM3RLzJ+l
 Ecdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=GIEK/S0Y
Subject: Re: [Buildroot] [PATCH] package/docker-engine: bump version to
 v23.0.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aGkgU3RlZmFuLAoKT24gV2VkLCBNYXIgMSwgMjAyMyBhdCAxOjQ24oCvQU0gU3RlZmFuIEFnbmVy
IDxzdGVmYW5AYWduZXIuY2g+IHdyb3RlOgo+Cj4gVGhpcyByZWxlYXNlIGNvbnRhaW5zIHNvbWUg
Zml4ZXMgYW5kIGFuIGltcHJvdmVkIGVycm9yIG1lc3NhZ2UuIEZvciB0aGUKPiBmdWxsIGxpc3Qg
c2VlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9tb2J5L21vYnkvcmVsZWFzZXMvdGFnL3YyMy4wLjEK
Pgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgo+IC0tLQo+
ICBwYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5oYXNoICAgICAgIHwgMiArLQo+ICBwYWNr
YWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tayAgICAgICAgIHwgMiArLQo+ICBwYWNrYWdlL2Rv
Y2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5oYXNoIHwgMiArLQo+ICBwYWNrYWdlL2RvY2tlci1l
bmdpbmUvZG9ja2VyLWVuZ2luZS5tayAgIHwgMiArLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgoKTGd0bSwKClJldmlld2VkLWJ5OiBDaHJpc3Rp
YW4gU3Rld2FydCA8Y2hyaXN0aWFuQHBhcmFsLmluPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
