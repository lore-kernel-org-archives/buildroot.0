Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA4BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 11:15:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9CF7610CE
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 11:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9CF7610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A1CF40628;
	Sat, 13 Nov 2021 11:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45xmX73Y9emb; Sat, 13 Nov 2021 11:15:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7831405F7;
	Sat, 13 Nov 2021 11:15:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4804A1BF358
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 11:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3702580E28
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 11:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BPGtrnQiYm3G for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 11:15:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3551D80E0D
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 11:15:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r8so20113710wra.7
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 03:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KpG0sHrfjdaafzsSVpxFVleMnM6ewjJ6kj/qmDQoOoE=;
 b=W+9qXo19n4sKFX3BSxmD2LjwJTBdWFJQuxPKnFlOysoHHIpeaMTUl5zTBILxu91M7G
 346y4c2j/NwQDY5oxfOH5OSqSzbAXDZs4AuSr2bZv4cWKJD0NtcO74esoEU+Dpi0KqUl
 QJUYu+gOh3mCmB53nSGz5iKm3z2kUIN2AP8/N+7qYjbCW8rfdO8xuDmleZ3TJIsnctZJ
 LhgNlxqVwvdF/43puLZ3Ai1dwRL38Dnfnp1fy1COrK6jUBWSuHl86ulvhT1l2OxNL9Bn
 4WGIwamOVvav4pDRTMfB+KwNd5DcGK/nFqzMds3wy8XL1WrMrCgMF6ax7c1h7iev8L/v
 dlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KpG0sHrfjdaafzsSVpxFVleMnM6ewjJ6kj/qmDQoOoE=;
 b=sAp/z2XKENwqbOpENQ4iM6DZ/YfjQQB4ecWsbp/TMsV86AI5d3qWLilW+wjT1LqzD3
 EXQDttjhBo0DM/adhYQEOhtDyAevKl1sf7nIA4OkUao70n6BizIu2HUUMCnztAR2LNQ9
 pAaWdQdzvVsL84pZBOGJJJT0TFpb96xqgAZ1RFPnMPDSLz7YDTndTV9cNcRHMhviH9uf
 ue/NnmBp5DJu7U1jm31ZWBWyXuSplDtqsXWEWN6k1+jHVK08N+SPbE++dn8n1glMtnGV
 K/UKiGPS2GbEy+wPP5qNxGKIGSsaVwTyfkNMK0b9GAB3I42X50Q+DtRh5bo3SGaufyxt
 Chcw==
X-Gm-Message-State: AOAM5331+DcNZnRQmBIAWtTLOzDBzCtIBshuUzdC3RCZTNtwv02zvs6P
 ZOfwRcVeg16XEz2iHeCSZbo=
X-Google-Smtp-Source: ABdhPJxX39ibb2qw1blhP8yxqCC1ufIFGE+M783X583HRM5NRb/ppb7xhPu48IHewoLc5C8vZdlbrQ==
X-Received: by 2002:adf:fd4c:: with SMTP id h12mr26822293wrs.429.1636802106485; 
 Sat, 13 Nov 2021 03:15:06 -0800 (PST)
Received: from [192.168.1.39] (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id p2sm15157251wmq.23.2021.11.13.03.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Nov 2021 03:15:06 -0800 (PST)
Message-ID: <11e1729b-5ce3-931b-6ae9-ec543bc9c1b8@gmail.com>
Date: Sat, 13 Nov 2021 12:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20211020203816.128986-1-romain.naour@gmail.com>
 <20211024161302.7d02a143@windsurf>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211024161302.7d02a143@windsurf>
Subject: Re: [Buildroot] [PATCH] gitlab-ci: use the Docker image from gitlab
 registry
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAyNC8xMC8yMDIxIMOgIDE2OjEzLCBUaG9tYXMgUGV0YXp6b25pIGEg
w6ljcml0wqA6Cj4gT24gV2VkLCAyMCBPY3QgMjAyMSAyMjozODoxNiArMDIwMAo+IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4+IEZyb20gWzFdOgo+PiAi
SW4gTm92ZW1iZXIgMjAyMCwgRG9ja2VyIGludHJvZHVjZWQgcmF0ZSBsaW1pdHMgb24gcHVsbCBy
ZXF1ZXN0cyBmcm9tCj4+IERvY2tlciBIdWIgWzJdLiBJZiB5b3VyIEdpdExhYiBDSS9DRCBjb25m
aWd1cmF0aW9uIHVzZXMgYW4gaW1hZ2UgZnJvbQo+PiBEb2NrZXIgSHViLCBlYWNoIHRpbWUgYSBq
b2IgcnVucywgaXQgbWF5IGNvdW50IGFzIGEgcHVsbCByZXF1ZXN0LiIKPj4KPj4gU2luY2UgdGhl
biwgc29tZSBqb2JzIGluIG91ciBnaXRsYWItY2kgZmFpbCB3aGVuIHRoaXMgcmF0ZSBsaW1pdHMg
aXMKPj4gcmVhY2hlZCBbM10uCj4+Cj4+IFRvIGF2b2lkIHRoaXMgcmF0ZSBsaW1pdCwgbW92ZSBv
dXIgRG9ja2VyIGltYWdlIGZyb20gZG9ja2VyaHViIHRvIHRoZQo+PiByZWdpc3RyeSBwcm92aWRl
ZCBieSBnaXRsYWIuIEtlZXBpbmcgdGhlIGltYWdlIGZyb20gZG9ja2VyaHViIHdvdWxkIGJlCj4+
IHBvc3NpYmxlIGJ5IHVzaW5nIGRlcGVuZGVuY3kgcHJveHkgWzRdIGJ1dCB0aGUgZ2l0bGFiIHJl
Z2lzdHJ5IGlzIGdvb2QKPj4gZW5vdWdoLgo+Pgo+PiBUZXN0ZWQgb24gZ2l0bGFiOgo+PiBodHRw
czovL2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL2pvYnMvMTY5NDg2MzU4NAo+Pgo+PiBb
MV0gaHR0cHM6Ly9kb2NzLmdpdGxhYi5jb20vZWUvdXNlci9wYWNrYWdlcy9jb250YWluZXJfcmVn
aXN0cnkvaW5kZXguaHRtbAo+PiBbMl0gaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20vZG9ja2VyLWh1
Yi9kb3dubG9hZC1yYXRlLWxpbWl0Lwo+PiBbM10gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290Ly0vam9icy8xNjg3NTkwNDE3Cj4+IFs0XSBodHRwczovL2RvY3MuZ2l0
bGFiLmNvbS9lZS91c2VyL3BhY2thZ2VzL2RlcGVuZGVuY3lfcHJveHkKPj4KPj4gU2lnbmVkLW9m
Zi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+PiBDYzogQXJub3V0
IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKSA8YXJub3V0QG1pbmQuYmU+Cj4+IC0tLQo+
PiAgLmdpdGxhYi1jaS55bWwgfCAyICstCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKSWYgeW91
IHdhbnQgdG8gYmFja3BvcnQgdGhpcyBwYXRjaCwgSSBhbHJlYWR5IHB1c2hlZCB0aGUgZG9ja2Vy
IGltYWdlCigyMDIwMDgxNC4yMjI4KSB1c2VkIGJ5IHRoZSBCdWlsZHJvb3Qgc3RhYmxlIHZlcnNp
b24gdG8gdGhlIGdpdGxhYiByZWdpc3RyeToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC9jb250YWluZXJfcmVnaXN0cnkvMjM5NTA3NgoKQmVzdCByZWdhcmRzLApS
b21haW4KCgo+IAo+IFRob21hcwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
