Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5158C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:20:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E4461168
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18E4461168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B513260ECD;
	Tue, 21 Sep 2021 20:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EoiG88rfoCQI; Tue, 21 Sep 2021 20:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13D0F611D8;
	Tue, 21 Sep 2021 20:20:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 132311BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 027B1406CE
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JcBMPpt8E2g9 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:20:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09D6840661
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:20:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u18so349352wrg.5
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LBOvkHIxbn+6syiTcqLtwegMp7oEkUb7xa2VpuuYW90=;
 b=HhwEy5X0YuuzsxSV2cNEfjQQ6tQp3Q32rodhMaFxhC0Rz2sKuGvn19Ih9ha2eqJs0D
 EKGTjXo33g+QU9AvLR6fK1B891WjWC7760QeP3DWrY6m6ef8J5VK+0vrY6ki+SSugh7a
 DobEszgM+VtSxh8W8UZsete0k4wQUFR2LLqLR0ydJHZAQuvfY6Jj3HLC7lxs1fN2UIoP
 dUKJCSoVGA8SvIZhJu38AlDtEtxfvhRIE1gv/9MkNmOaGFOHm4EF8kjUCcfFI3KRHH5y
 4nHDShgCpbwedI8+WZaVeTavtYlsp+t3AtwwVmLMdOSA6+zcvaNulaZF1EOhlqGewWxY
 l16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LBOvkHIxbn+6syiTcqLtwegMp7oEkUb7xa2VpuuYW90=;
 b=Ac9Af5Bmnub5seBCn8cMgBhtf7PW3K1kN3Cx3Cf2UvzcBSpHq/lh1I+Fk8DQ4mMM8h
 ZM2dTxpRw2WLuc6Y0RkgFVZth33epuxsJGyEwrAZbUfyvsrMKT+c9o2HY7PEWB95ivz/
 xgV6bbm330svrM2Hec9jnFurF2xi+ElUAWngG2jDWRJh4UlAwF8SUjlBeBqqvAQl3EP1
 juy6NDEk0ApnBHKFR+NC6o5tozxLGXk5M1jgMjsVTrhf9/DsgjXLb92ATbkCIm+dkVSG
 V+agyK6+B7p2mVzZXH/KOxOpPVcp724RRTBHr6BPMU7ow4H6xj4U5OMCzTucqo85/UsN
 iteQ==
X-Gm-Message-State: AOAM5301dwkyfAN2Pd3bqnIIyviimvVBx351M8MDgfrT9IQx5Bk1F7dj
 JAMvWD4cZo4kTY9KcKQpH64=
X-Google-Smtp-Source: ABdhPJzv/cXQnE90AO0msydghabKB0Aywz1udNuBdT3/gW3cpjp6OMMkUlwrmQvOO42zQv/RPHBFGQ==
X-Received: by 2002:adf:ef48:: with SMTP id c8mr36644969wrp.349.1632255637184; 
 Tue, 21 Sep 2021 13:20:37 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:23a5:a748:5a4b:18cd?
 (2a01cb058f8a180023a5a7485a4b18cd.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:23a5:a748:5a4b:18cd])
 by smtp.gmail.com with ESMTPSA id v191sm3838551wme.36.2021.09.21.13.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 13:20:36 -0700 (PDT)
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20210915194839.22122-1-petr.vorel@gmail.com>
 <20210915194839.22122-2-petr.vorel@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <41cb0bdf-845d-ab94-0322-c4d1393f40b8@gmail.com>
Date: Tue, 21 Sep 2021 22:20:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915194839.22122-2-petr.vorel@gmail.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v2 1/4] support: utils: use python3
 explicitly
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: David Laight <David.Laight@ACULAB.COM>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gUGV0ciwKCkxlIDE1LzA5LzIwMjEgw6AgMjE6NDgsIFBldHIgVm9yZWwgYSDDqWNyaXTC
oDoKPiBQeXRob24gMiBpcyBFT0wgc2ljZSAyMDIwIFsxXSwgaXQncyBzdGlsbCBhdmFpbGFibGUg
b24gZGlzdHJvcywgYnV0IG1heSBub3QKPiBiZSBpbnN0YWxsZWQgYnkgZGVmYXVsdCAoYXMgYmVp
bmcgcmVwbGFjZWQgYnkgcHl0aG9uMykuCj4gCj4gVGh1cyByZW1vdmUgY29tcGF0aWJpbGl0eSBp
bXBvcnRzOgo+IGZyb20gX19mdXR1cmVfXyBpbXBvcnQgcHJpbnRfZnVuY3Rpb24KPiBmcm9tIF9f
ZnV0dXJlX18gaW1wb3J0IGFic29sdXRlX2ltcG9ydAo+IAo+IFRlc3RlZCB3aXRoIHB5dGhvbjMg
LW0gcHlfY29tcGlsZS4KPiAKPiBbMV0gaHR0cHM6Ly93d3cucHl0aG9uLm9yZy9kb2Mvc3Vuc2V0
LXB5dGhvbi0yLwo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21h
aWwuY29tPgo+IC0tLQoKPiBkaWZmIC0tZ2l0IGEvdXRpbHMvZ2V0LWRldmVsb3BlcnMgYi91dGls
cy9nZXQtZGV2ZWxvcGVycwo+IGluZGV4IDkxODJiMmQ4NWYuLjIyYWNjYWYxODEgMTAwNzU1Cj4g
LS0tIGEvdXRpbHMvZ2V0LWRldmVsb3BlcnMKPiArKysgYi91dGlscy9nZXQtZGV2ZWxvcGVycwo+
IEBAIC0xLDQgKzEsNCBAQAo+IC0jIS91c3IvYmluL2VudiBweXRob24KPiArIyEvdXNyL2Jpbi9l
bnYgcHl0aG9uMwo+ICAKPiAgaW1wb3J0IGFyZ3BhcnNlCj4gIGltcG9ydCBnZXRkZXZlbG9wZXJs
aWIKClRoZXJlIGlzIG9uZSByZW1haW5pbmcgX19mdXR1cmVfXyB0byByZW1vdmU6Cgp1dGlscy9n
ZXRkZXZlbG9wZXJsaWIucHk6ZnJvbSBfX2Z1dHVyZV9fIGltcG9ydCBwcmludF9mdW5jdGlvbgoK
SXQgd2FzIHJlbW92ZWQgYnkgeW91ciBwYXRjaCAzLzQgYnV0IGl0IHdhcyByZWplY3RlZDoKaHR0
cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjEwOTE1
MTk0ODM5LjIyMTIyLTQtcGV0ci52b3JlbEBnbWFpbC5jb20vCgpNYXliZSBpdCBjYW4gYmUgcmVt
b3ZlZCBkaXJlY3RseSBmcm9tIHRoaXMgcGF0Y2guCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
ZGlmZiAtLWdpdCBhL3V0aWxzL3NpemUtc3RhdHMtY29tcGFyZSBiL3V0aWxzL3NpemUtc3RhdHMt
Y29tcGFyZQo+IGluZGV4IGEzZDdmMjUwYzYuLjQyMjk3MmU0ODggMTAwNzU1Cj4gLS0tIGEvdXRp
bHMvc2l6ZS1zdGF0cy1jb21wYXJlCj4gKysrIGIvdXRpbHMvc2l6ZS1zdGF0cy1jb21wYXJlCj4g
QEAgLTEsNCArMSw0IEBACj4gLSMhL3Vzci9iaW4vZW52IHB5dGhvbgo+ICsjIS91c3IvYmluL2Vu
diBweXRob24zCj4gIAo+ICAjIENvcHlyaWdodCAoQykgMjAxNiBUaG9tYXMgRGUgU2NoYW1waGVs
ZWlyZSA8dGhvbWFzLmRlLnNjaGFtcGhlbGVpcmVAZ21haWwuY29tPgo+ICAKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
