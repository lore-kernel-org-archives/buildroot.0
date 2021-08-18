Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AE1C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:48:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55EF861100
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 20:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55EF861100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2592A40578;
	Wed, 18 Aug 2021 20:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MsNjw7a2UUiH; Wed, 18 Aug 2021 20:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 816AF405F7;
	Wed, 18 Aug 2021 20:48:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2D961BF344
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEDAC405F7
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 20:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhTadBJGQwd7 for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 20:48:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBABC40578
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 20:48:13 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id z20so7768668ejf.5
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 13:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=oAEODvj6SAlGolJO9Kpq6j0ltIBTbQQEu3bgoGXpdqI=;
 b=WEoGPn/vBu9xdHgB7rxiT1S7shYHnG+iNQoQiysyI3n9Egb+Z7I7exeeRnTYR/jHXD
 7AO84Ggd6CTGCOYRhamNluZ66a+o91JN/IUOTEhePs41KbNnC6MmzUqUeBHMby7xr49m
 /82p73f0FMDtpCyP0nzRm5MaVa8MJvQCS7GHcSKZqqbkv+7vblcDX8rSTqcsXnDbHwDm
 ZHarGPJoZAlOhYfFj5BGyLlM6xzBrScK6Fh3yW6VS8zILaBVexaMt5RiY0//l9T2ny3t
 l6xxdlXO5f01qD7b7IDGK0am0drWIMXMpK3cyNYUwQzJQL/d3+6TXip0DlkjFcJIYB70
 crcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=oAEODvj6SAlGolJO9Kpq6j0ltIBTbQQEu3bgoGXpdqI=;
 b=XFRpuR1xT+d8/e61IOa8GQMNPEaV/FkXVcE1K61F5QVkW3vpHsqU3KDzAiek8QR2LH
 lQinmnH1w6ESYwMISEJzuBGUxSU/4QiPspY9A7vGVb8S+S0G1K2Bp2Kfl2YZwuKmpFZL
 bmqn7ITkUhDSWXfOy3xtn95Ku4j9S3LaptAT05A8sQgYbbLNbeItdt/alIIyJfB93BXZ
 raIknzbqmR79h/W+im0m6PV3hQjgCmUXvAyz41p+sZsEzeDMo+sgKtrFFc5SeNalYYfM
 IWXFIhL98Qe9yXoAcxaoHnxNe91/BRsepfkqQIAj4bUmwwkxLS8F8GSzbhjpz7PE7eZs
 QzXw==
X-Gm-Message-State: AOAM532p+SQy5ocn8gM8R+WRho5rd6ndT7lmUGkljbPYi8Q1+hVK7leh
 awepAVORcgb2TSf0Hqi07Bs=
X-Google-Smtp-Source: ABdhPJxPvTjotgOzOr8U/VrWiqBvSaT4lkvdnWXy2s/DyTaN5m341sLAE3rAHg/q96AAQ1cXgU4u8A==
X-Received: by 2002:a17:907:7883:: with SMTP id
 ku3mr12048824ejc.453.1629319691959; 
 Wed, 18 Aug 2021 13:48:11 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 ch15sm629844edb.10.2021.08.18.13.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:48:11 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mGSTp-0007PX-Bj; Wed, 18 Aug 2021 22:48:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20210808185905.11617-1-peter@korsgaard.com>
 <87v94f90sg.fsf@dell.be.48ers.dk>
 <e5d15f23-6120-3a2d-7263-803d82032dd7@gmail.com>
Date: Wed, 18 Aug 2021 22:48:09 +0200
In-Reply-To: <e5d15f23-6120-3a2d-7263-803d82032dd7@gmail.com> (Romain Naour's
 message of "Wed, 18 Aug 2021 21:55:39 +0200")
Message-ID: <87fsv61nue.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-2021.02.x] package/glibc: security bump to
 version 2.32-50-g737efa27fca5c97f5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3
cml0ZXM6CgogPiBIZWxsbyBQZXRlciwKID4gTGUgMDgvMDgvMjAyMSDDoCAyMTo0NywgUGV0ZXIg
S29yc2dhYXJkIGEgw6ljcml0wqA6CiA+Pj4+Pj4+ICJQZXRlciIgPT0gUGV0ZXIgS29yc2dhYXJk
IDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cml0ZXM6CiA+PiAKID4+ID4gRml4ZXMgdGhlIGZvbGxv
d2luZyBzZWN1cml0eSBpc3N1ZToKID4+ID4gLSBDVkUtMjAyMS0zMzU3NDogVGhlIG1xX25vdGlm
eSBmdW5jdGlvbiBoYXMgYSBwb3RlbnRpYWwgdXNlLWFmdGVyLWZyZWUKID4+ID4gICBpc3N1ZSB3
aGVuIHVzaW5nIGEgbm90aWZpY2F0aW9uIHR5cGUgb2YgU0lHRVZfVEhSRUFEIGFuZCBhIHRocmVh
ZAogPj4gPiAgIGF0dHJpYnV0ZSB3aXRoIGEgbm9uLWRlZmF1bHQgYWZmaW5pdHkgbWFzay4KID4+
IAogPj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5j
b20+CiA+PiAKID4+IENvbW1pdHRlZCB0byAyMDIxLjAyLnggYW5kIDIwMjEuMDUueCwgdGhhbmtz
LgogPj4gCgogPiBFdmVuIGlmIGl0J3Mgbm90IGVhc3ksIHdlIHNob3VsZCB0cnkgdG8ga2VlcCBn
bGliYyBhbmQgbG9jYWxkZWYgcGFja2FnZSBpbiBzeW5jLgoKID4gaHR0cHM6Ly9naXQuYnVpbGRy
b290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD1jOGNiZTk3MTkwMjU2NzZiYzIzMzBiOWRmYjEx
ZTU4ZGM0ZjQyN2U4CgpDcmFwLCBpbmRlZWQuIFdpbGwgZml4LgoKLS0gCkJ5ZSwgUGV0ZXIgS29y
c2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5i
dXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
