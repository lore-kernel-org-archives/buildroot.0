Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2664C432BE
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 19:55:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F6D761185
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 19:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F6D761185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D0D040799;
	Wed, 18 Aug 2021 19:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRdBlNk5uXmx; Wed, 18 Aug 2021 19:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35DDD407A2;
	Wed, 18 Aug 2021 19:55:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDF3B1BF333
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 19:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE204407A2
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 19:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 041KEcXE8dO6 for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 19:55:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B334F40799
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 19:55:42 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 w21-20020a7bc1150000b02902e69ba66ce6so2529897wmi.1
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6y+ySlUt9ZK9UA24nPLJorXFneYarSOGGYJ7ys/ucaE=;
 b=BNPI+H85hZODNLcYZ4YfRLTB68GI0ogK8Nvh6WtYP31KA6+teK7crBuHiOt8EZMjj9
 L3hyWj8AfU5jnWF/uuTpXyNQSzLpCNOWloiEIxATTWPizWk1WDV1hyBqVaA7tLva0vfS
 LAYr86WMBnHkMkya7VWRQr0n75+nLXHdMppixxWR4PmtQ+MW95oljhPohpktvsVIOK5J
 UbRxCuuph3IXxbcBx0WIyCYvZTZjvelhrelP/b1hMplxupOvqvdA7bU3mc59kwXhiRLm
 QVpA7YVHMKcMf+muGSMZvtE37ECUPYsvIwyqu8dSsNRNn0WUcL/d1j+7VyWj2Y7VJZqQ
 GVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6y+ySlUt9ZK9UA24nPLJorXFneYarSOGGYJ7ys/ucaE=;
 b=TwpJYGRssske1LYNv0Ca1l4yP0SWmjAiMap3r79oZo8bHgKVqj9jGU/IsJeb+TMWDb
 QzSTniXbYm13s0EAkhFwq60zOb3y0PGp5xSJGpZe/t/husQUNuCyogXGRGZqsQwqshIu
 fdW3b38FCppDX+3L4aS6yA/6Iq4AjctK37QL6VYtc2Z5DkMiqR4iIfQnmcqAF8EliMWO
 8qLuWJ1kNKEQH9IzVce+oTdYwOYy0QyMIChHSbSGScO2f3COvJSjJjcW2S/4pOPDVZiM
 GfI2v95gIOX4OSugaW8LuaaD/kmzT6daEDyyOXG+vHa2Ffa6Y3/BPBrNfn8aDfI4nT0M
 WFSw==
X-Gm-Message-State: AOAM533oINj1pZJ5+VJijkQbYg86Rua4I0zgFOSqKbHqmy7eNN5Dr4bX
 e619Qu0/p2nj9P3pjJxkqIgmanPICkM=
X-Google-Smtp-Source: ABdhPJx/0PJF2d/OXAy504BMQP7mWLlnmH4sS5rDDkx/Z115s6dBdQ7XKB8PJgLU3ddny3Bm98cWfw==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr9979456wmb.83.1629316540888;
 Wed, 18 Aug 2021 12:55:40 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id s13sm5942766wmc.47.2021.08.18.12.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 12:55:40 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20210808185905.11617-1-peter@korsgaard.com>
 <87v94f90sg.fsf@dell.be.48ers.dk>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <e5d15f23-6120-3a2d-7263-803d82032dd7@gmail.com>
Date: Wed, 18 Aug 2021 21:55:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87v94f90sg.fsf@dell.be.48ers.dk>
Content-Language: en-US
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gUGV0ZXIsCgpMZSAwOC8wOC8yMDIxIMOgIDIxOjQ3LCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPj4+Pj4+ICJQZXRlciIgPT0gUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2Fh
cmQuY29tPiB3cml0ZXM6Cj4gCj4gID4gRml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1
ZToKPiAgPiAtIENWRS0yMDIxLTMzNTc0OiBUaGUgbXFfbm90aWZ5IGZ1bmN0aW9uIGhhcyBhIHBv
dGVudGlhbCB1c2UtYWZ0ZXItZnJlZQo+ICA+ICAgaXNzdWUgd2hlbiB1c2luZyBhIG5vdGlmaWNh
dGlvbiB0eXBlIG9mIFNJR0VWX1RIUkVBRCBhbmQgYSB0aHJlYWQKPiAgPiAgIGF0dHJpYnV0ZSB3
aXRoIGEgbm9uLWRlZmF1bHQgYWZmaW5pdHkgbWFzay4KPiAKPiAgPiBTaWduZWQtb2ZmLWJ5OiBQ
ZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+Cj4gCj4gQ29tbWl0dGVkIHRvIDIw
MjEuMDIueCBhbmQgMjAyMS4wNS54LCB0aGFua3MuCj4gCgpFdmVuIGlmIGl0J3Mgbm90IGVhc3ks
IHdlIHNob3VsZCB0cnkgdG8ga2VlcCBnbGliYyBhbmQgbG9jYWxkZWYgcGFja2FnZSBpbiBzeW5j
LgoKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD1jOGNiZTk3
MTkwMjU2NzZiYzIzMzBiOWRmYjExZTU4ZGM0ZjQyN2U4CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5u
ZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
