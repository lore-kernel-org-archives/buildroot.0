Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339F3C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 07:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8C3A80EC2;
	Mon,  6 Mar 2023 07:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8C3A80EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLtuNGgQ8f0L; Mon,  6 Mar 2023 07:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08FAF80EAD;
	Mon,  6 Mar 2023 07:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08FAF80EAD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 927171BF291
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 07:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BF2840977
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 07:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BF2840977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I-ZWvCIDhRXA for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 07:27:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0B1A4095F
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0B1A4095F
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 07:27:52 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a25so34753928edb.0
 for <buildroot@buildroot.org>; Sun, 05 Mar 2023 23:27:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678087670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=khww4x4sEzRg9n6kKQIiEKxk76Baf7IUZ+kIx9rCYvk=;
 b=O+8P0bToNgAfp6MPCNtVwLGSPZHiSUosEsmRXhnOuX9K77mVnMsrmLP3eK8WZ0wIKC
 wq8T/Ov/Ma/RVpV9QwQOiARpv3JcYoP08NHKJVZF/eMDvTN+qJtnAexDMUG7wFKHNBfg
 oa+sKWgqBP9nUEm7nTjPx8VSxSY1Z+cLUuvMTbnHyGm9klsB/87Lb06zKMZR/vzOTMV8
 5KppwhLPCUDs6rFEqcbOsnxBcEAQ8l6S2d6Nt0Jv4bj4KKE9HFH6RM85C4QZD6fbZx/h
 jLEpVAd/F+XP5EYH1wgltxTsB8JrPjoN6O1L26/ZpDvWJd0EPf6mB0nGqKSWqSS1mjuF
 yVYg==
X-Gm-Message-State: AO0yUKWazSEbBb/j8BDcxX/R/3oHDlwZ+WkrBXJaFZTJ7uMxmdwuG6nf
 o4Z0s+QNnBXMc6EU+EGnY5WGoGYNi6DcauSvy0gQhQ==
X-Google-Smtp-Source: AK7set8vYz8tW6iUZvSnuANc5epG6DyUmVqnEUBRnUfighv3uf232RQoWxb9CapxvKkY35Zg/6wWrw==
X-Received: by 2002:a17:907:d14:b0:8f6:711b:8d67 with SMTP id
 gn20-20020a1709070d1400b008f6711b8d67mr14607323ejc.26.1678087670688; 
 Sun, 05 Mar 2023 23:27:50 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090685c200b008dcaf24bf77sm4146452ejy.36.2023.03.05.23.27.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 23:27:49 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id g3so34600330eda.1
 for <buildroot@buildroot.org>; Sun, 05 Mar 2023 23:27:49 -0800 (PST)
X-Received: by 2002:a17:906:d041:b0:877:747d:4a82 with SMTP id
 bo1-20020a170906d04100b00877747d4a82mr4669094ejb.0.1678087669548; Sun, 05 Mar
 2023 23:27:49 -0800 (PST)
MIME-Version: 1.0
References: <20230302151859.400567-1-giulio.benetti@benettiengineering.com>
 <CA+h8R2r5SvTysWRJO12UFCG8TdMQo1+Y+q+Mdam4nwj43+yNVw@mail.gmail.com>
 <87zg8r59qq.fsf@dell.be.48ers.dk>
 <f5059df8-e34b-dde2-e9ce-91ecadf5d486@benettiengineering.com>
In-Reply-To: <f5059df8-e34b-dde2-e9ce-91ecadf5d486@benettiengineering.com>
Date: Sun, 5 Mar 2023 23:27:38 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rV-M13PB30fLxvWUSHM7SuQ=grhnBPBs0VATg4Kny32Q@mail.gmail.com>
Message-ID: <CA+h8R2rV-M13PB30fLxvWUSHM7SuQ=grhnBPBs0VATg4Kny32Q@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google; t=1678087670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=khww4x4sEzRg9n6kKQIiEKxk76Baf7IUZ+kIx9rCYvk=;
 b=GHBEz/kdXQDOoOmgLEjHXsRKlCdHbAd6vYyh2FbrAf72vfXkzRSUpWbmv2LQu0Mty9
 01fNDy1aLMDEgDx+ooG6VsR0dRJf56MUyyzUookY/okJ+yNYqcQrt2c4JsmKYUSUsOl7
 3BZCP3kLedf88KDrNYrgRh5tmaceHCwanByf6phQK8cNIg7aPYWdkGcPnUQUa0pZG9Mq
 GuZdNx2ZbvB74uBuKcpFoPMl1Qh4zjUW1hIfzCoy38RzXAQFre2CEAiPvyMOlSzebDwn
 Baayvi/PQXyIm5EblTNTbVIsMU8DxnK2qLtKKjbXZFEWe0H8aVjuvWziRmtoN3tf5yUO
 7bTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=GHBEz/kd
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: fix build failure on
 PowerPC64
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
Cc: Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLCBQZXRlciwKCk9uIFN1biwgTWFyIDUsIDIwMjMgYXQgMTI6NDPigK9QTSBHaXVs
aW8gQmVuZXR0aQo8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6
Cj4gVGhpcyBwYXRjaCBpcyBzdGlsbCB2YWxpZCwgaXQgZml4ZXMgdGhlIGJ1ZyBmb3IgdGhlIGN1
cnJlbnQgcmVwb3NpdG9yeQo+IHVzZWQgYnkgdGhlIHBhY2thZ2UuCj4gQnV0IHNvb24gdGhlIHJl
cG9zaXRvcnkgd2lsbCBiZSBtb3ZlZCB0byBhIG5ldyBvbmU6Cj4gaHR0cHM6Ly9naXRodWIuY29t
L21vcnJvd25yLzg4MjFjdS0yMDIxMDkxNgo+IGJlY2F1c2UgdGhlIGFjdHVhbCBvbmUgd2lsbCBi
ZSBkZWxldGVkKGl0J3MgYSBzdHJhbmdlIGNob2ljZS4uLikuCgpUaGUgUFIgd2l0aCB0aGlzIHBh
dGNoIGhhcyBiZWVuIG1lcmdlZCB0byB0aGUgMjAyMTA5MTYgcmVwbzoKCmh0dHBzOi8vZ2l0aHVi
LmNvbS9tb3Jyb3duci84ODIxY3UtMjAyMTA5MTYvcHVsbC83MwoKc3VibWl0dGVkIHRoZSBwYXRj
aCB3LyB0aGlzIG5ldyB2ZXJzaW9uOgoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIzMDMwNjA3MjU1OC4zMTUxNS0xLWNocmlzdGlhbkBwYXJh
bC5pbi8KCkkgc3VnZ2VzdCB3ZSBtZXJnZSB0aGUgbmV3IHZlcnNpb24gJiBza2lwIGFkZGluZyB0
aGUgcGF0Y2ggdG8gdGhlCmJ1aWxkcm9vdCB0cmVlLgoKQmVzdCByZWdhcmRzLApDaHJpc3RpYW4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
