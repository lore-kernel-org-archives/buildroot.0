Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FCCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 22:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7758483145;
	Thu, 13 Jan 2022 22:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HD9_1FbRuXTd; Thu, 13 Jan 2022 22:17:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1C6282D75;
	Thu, 13 Jan 2022 22:17:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B9441BF476
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 22:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4977D60A71
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 22:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H7DWb_kI0nAt for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 22:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96F5A60A7C
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 22:17:13 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id o3so12599024wrh.10
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 14:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ca4Gc/kBtS0AxdLaUIagnvDE/cMrOclr9qJjgw5HOZg=;
 b=DPJn9rAOED2h16LScT0mRmkWa7/ehGpnkFjtwumhQKVBHZo09I5dSY+cS7olcNGGYs
 hXGRQ1VWPw2QqsuOOYRaY8g9SwAczE04i7IkTd20u4dXxZrkS+VOGT3/N7y/l2cXLxfX
 pWq8tMhAyBuicKV+PA3+5C2OSPyc9PCaCr894VkdiB+IKwblrGPTGrknal8Z5wTKlaii
 uODiYXO916dfozKIWS+eLJmQHsQSM23QQ9Q0dG162XAmuCL9nvpC5U9QyUaQygpm7YHk
 fMaoGbqLA5RmmHNEGuICjRGLZ485ufySzoWTTgEvMGCT996s42NUp7NhUGoSJkoFeod5
 2csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ca4Gc/kBtS0AxdLaUIagnvDE/cMrOclr9qJjgw5HOZg=;
 b=XdJ5/c/2Lxuxu2JP5cH002J1QEF/cWvF7nOFNguUiR9SMEE3btJPzDx7LAHo4v5lnA
 9pFRum6MwdyoFBMCSOFonZOKwvHmnpAFukD0kBJslpl3AaEP0ygaoFQS5oyeV0toXs/X
 5gJxYy3iwsDiFq3Io6/g9hSW1D1RKatAQNa3vFbn0NbnIGtQ6TYKlb2KeecswXbuCCGJ
 ZqilWZc5VXL6sfDuf47sURrs07VTFumoMWCUSxDTE1kh1Jmk1M+uKVdZqZoofz2OCGZc
 rqco32THvVjtAivchknKw+974U22PBp/0zASsTMUU1CD+5tBQq0w38567Db/BKmcmp88
 Pnxg==
X-Gm-Message-State: AOAM532X4sIy6Rum16eiRxcx0872zq1el/ft6g1Hw2Ye8+1e6TTQm8Wf
 WyU03eOuh/FvPW20xK5KWcKMjaT1veU=
X-Google-Smtp-Source: ABdhPJw2W4OLrueF9mtZ+Mi+XE4kVfSF9bNJGFC8CHuQxkR76vxcf8RYqGVeu5UwBBYNW9qVCNkctw==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr5764908wru.264.1642112231899; 
 Thu, 13 Jan 2022 14:17:11 -0800 (PST)
Received: from [192.168.1.43]
 (amontpellier-158-1-160-63.w92-145.abo.wanadoo.fr. [92.145.131.63])
 by smtp.gmail.com with ESMTPSA id o8sm4803225wry.20.2022.01.13.14.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 14:17:11 -0800 (PST)
Message-ID: <55296fff-7a19-3691-22e2-52095bc5cc47@gmail.com>
Date: Thu, 13 Jan 2022 23:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 buildroot@buildroot.org
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
 <20210518113652.29609-5-patrickdepinguin@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20210518113652.29609-5-patrickdepinguin@gmail.com>
Subject: Re: [Buildroot] [PATCH 4/4] perf: fix compilation in case of i386
 userspace with x86_64 kernel
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMTgvMDUvMjAyMSDDoCAxMzozNiwgVGhvbWFzIERlIFNjaGFtcGhl
bGVpcmUgYSDDqWNyaXTCoDoKPiBGcm9tOiBUaG9tYXMgRGUgU2NoYW1waGVsZWlyZSA8dGhvbWFz
LmRlX3NjaGFtcGhlbGVpcmVAbm9raWEuY29tPgo+IAo+IElmIGEgNjQtYml0IGtlcm5lbCBpcyBj
b21iaW5lZCB3aXRoIDMyLWJpdCB1c2Vyc3BhY2UsIGFuZCB0aGlzIGlzIGFjaGlldmVkCj4gdmlh
IGEgbXVsdGlsaWIgdG9vbGNoYWluIHRoYXQgZGVmYXVsdHMgdG8gNjQtYml0IHdpdGggJy1tMzIn
IGluCj4gQlIyX1RBUkdFVF9PUFRJTUlaQVRJT04sIHRoZSAnPGNyb3NzPi1sZCcgY29tbWFuZCB3
aWxsIHN0aWxsIGRlZmF1bHQgdG8KPiA2NC1iaXQgb3V0cHV0Lgo+IAo+IEluIHRoaXMgY2FzZSwg
cGFja2FnZXMgdGhhdCB1c2UgJ2xkJyBkaXJlY3RseSBuZWVkIHRvIGJlIGluc3RydWN0ZWQgdG8g
dXNlCj4gdGhlIGNvcnJlY3QgQUJJIHZpYSB0aGUgJy1tJyBwYXJhbWV0ZXIuICdwZXJmJyBpcyBv
bmUgc3VjaCBwYWNrYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZSBTY2hhbXBoZWxl
aXJlIDx0aG9tYXMuZGVfc2NoYW1waGVsZWlyZUBub2tpYS5jb20+Cj4gLS0tCj4gIHBhY2thZ2Uv
bGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1rLmluIHwgMyArKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LXRvb2xz
L2xpbnV4LXRvb2wtcGVyZi5tay5pbiBiL3BhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1w
ZXJmLm1rLmluCj4gaW5kZXggNGUyODEyOWY1MC4uYjg0YjVmZDQxNSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtcGVyZi5tay5pbgo+ICsrKyBiL3BhY2thZ2Uv
bGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1rLmluCj4gQEAgLTQ1LDYgKzQ1LDkgQEAgUEVS
Rl9NQUtFX0ZMQUdTICs9IExEPSIkKFRBUkdFVF9MRCkgLW0gZWxmMzJsdHNtaXBuMzIiCj4gIGVs
c2UKPiAgUEVSRl9NQUtFX0ZMQUdTICs9IExEPSIkKFRBUkdFVF9MRCkgLW0gZWxmNjRsdHNtaXAi
Cj4gIGVuZGlmCj4gKyMgY2FzZSBmb3IgeDg2IHRvb2xjaGFpbiB0aGF0IGRlZmF1bHRzIHRvIDY0
LWJpdCBvdXRwdXQKPiArZWxzZSBpZmVxICgkKEJSMl9pMzg2KTokKGNhbGwgcXN0cmlwLCQoQlIy
X0tFUk5FTF9BUkNIX09WRVJSSURFKSkseTp4ODZfNjQpCj4gK1BFUkZfTUFLRV9GTEFHUyArPSBM
RD0iJChUQVJHRVRfTEQpIC1tIGVsZl9pMzg2IgoKRG8geW91IGtub3cgd2h5IHRoZSBBUk0gdG9v
bGNoYWluIGRvZXNuJ3QgbmVlZCBhIHNpbWlsYXIgaGFuZGxpbmcgPwoKQmVzdCByZWdhcmRzLApS
b21haW4KCgo+ICBlbmRpZgo+ICAKPiAgIyBUaGUgY2FsbCB0byBiYWNrdHJhY2UoKSBmdW5jdGlv
biBmYWlscyBmb3IgQVJDLCBiZWNhdXNlIGZvciBzb21lCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
