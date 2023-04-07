Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC1AC6FD1D
	for <buildroot@archiver.kernel.org>; Fri,  7 Apr 2023 17:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 714014070F;
	Fri,  7 Apr 2023 17:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 714014070F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aU8SW0ARM1B4; Fri,  7 Apr 2023 17:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C28DA408DD;
	Fri,  7 Apr 2023 17:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C28DA408DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F1D91BF293
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 17:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5492E41FED
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 17:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5492E41FED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOsqBE9sn50D for <buildroot@lists.busybox.net>;
 Fri,  7 Apr 2023 17:10:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7479B41EEE
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7479B41EEE
 for <buildroot@buildroot.org>; Fri,  7 Apr 2023 17:10:16 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id 18so9683855ejo.13
 for <buildroot@buildroot.org>; Fri, 07 Apr 2023 10:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680887415; x=1683479415;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5GLk4hcDCWsh0jagRZxiW9PqCUUt7YqW7aPL6yd2igE=;
 b=BWsg+UWnZhl6qyRCIE/icLWiioVvEsDBbBTDmJl9Tvo4NiDt/UVpMwSH1kRV5xCDMy
 u8K7HMUppUme3OmSUAqgmyBPJm8ICDxWf+FwKAJTomXvtbhDGx6UH6IjYrAv1RsObwbW
 X8ln7oyhSpv2x0iX8R3E8Sywz6vWkdUDFe69B4LZwJqSxSvOUnZ+lZxBv+KbRBwnKKwC
 mCGurI3IFUAHUSUIefEZT5QZiGUSjzqcb8Fi5s7/HEhnDK2S0NJFgnI2a8W5jJ9rjKcT
 Vio3sjSUU4DG86yNbDGus4WJSyMB34LDuW2840Ybp654yHVi1JUA6YlPgUjfjwg8C/Qm
 UFIw==
X-Gm-Message-State: AAQBX9eIy99znama6v0rK9VhZeM54f18yENpSbAc7VoYVsEBIvefRL4b
 y+TLJ2gSEMZ9p1fmbyrllLmBPhR/8tKDS/AJY7T08VxHtY6uX1vpaGE=
X-Google-Smtp-Source: AKy350Z9/rk99ScJZV+VwEGh7FMMVNGCzo39NWwpcJoQJG/cuqsOSw6GZQn8gMD2sxr15PYbAelqaj4czMVZfIlq1hI=
X-Received: by 2002:a17:906:68d8:b0:949:b347:1035 with SMTP id
 y24-20020a17090668d800b00949b3471035mr66924ejr.9.1680887415115; Fri, 07 Apr
 2023 10:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230403013530.3502-1-vfazio@gmail.com>
In-Reply-To: <20230403013530.3502-1-vfazio@gmail.com>
From: James Knight <james.d.knight@live.com>
Date: Fri, 7 Apr 2023 13:10:04 -0400
Message-ID: <CALAjcgXw4sajYyhP_zH=buQYOefFCmAZQHZ_ENcjiWfVioHYww@mail.gmail.com>
To: Vincent Fazio <vfazio@gmail.com>
Subject: Re: [Buildroot] [PATCH] utils/check-package: drop six usage
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBcHIgMiwgMjAyMyBhdCA5OjM14oCvUE0gVmluY2VudCBGYXppbyA8dmZhemlvQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgc2hlYmFuZyBpbiBjaGVjay1wYWNrYWdlIG5vdyBkZWZp
bmVzIHB5dGhvbjMuIFRoZXJlIGlzIG5vIGxvbmdlciBhCj4gbmVlZCB0byBtYWludGFpbiBzdXBw
b3J0IHdpdGggcHl0aG9uIDIueC4KClRlc3RlZC1ieTogSmFtZXMgS25pZ2h0IDxqYW1lcy5kLmtu
aWdodEBsaXZlLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
