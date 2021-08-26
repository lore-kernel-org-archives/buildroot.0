Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926F5C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:47:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 317406101C
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 317406101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5921426AF;
	Thu, 26 Aug 2021 22:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q-w0_hky2WPh; Thu, 26 Aug 2021 22:47:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E30426B0;
	Thu, 26 Aug 2021 22:47:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C79E91BF2F0
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC4C3426B0
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRdpligjllJC for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:47:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DFC0426AF
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:47:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so3123549wms.2
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 15:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tV21CCunuUoNTdwwlio9fozzAWVGip+UCpgyrT8u4PE=;
 b=p2iGl8NIE1DCodoJYgc0vJvdNgVjZkNVetmKahDXHSyWIZIJ1aHtSncRzAH33fjpXY
 HpZ7fvSx+g+HlRDT7EOHyyT2Sb+Cq78tV8SCWqmZvusEgEGcsArO/kXvuxxfm4s/GJHR
 KV0cNMuqvaksy9lDB6vKcs+cNO76yRGsHgU/6BoNo4luKslCuO/s1eMxI9mdY/GBp+LB
 WNfDe2MXXyyfXNTOsDibPhDZV3RtSvG4tAsbne4v4l6wDQGMes4wo5sv4w7ACNJbRlXg
 1hGmzoBkbEAAarbalImtdQjZwTNOICAk1xZvEkHA6j2b6cgJwjI+kDOTfi7KPSSG9sdi
 giIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=tV21CCunuUoNTdwwlio9fozzAWVGip+UCpgyrT8u4PE=;
 b=HhA0MNNO37rUVzIdTV/1WILAF5A8GWwhxgUP55dCjfgaxIVS1so7bCW7eYil3xk5sF
 SvSIgm9c50/dINSi7VGjrtdnL6lpc9NEtJhuQDW025fQpSXGsyYCSnbxSWJeL9L86hcy
 dKnyO9xHu97oWX3ibsqJ+Lig79vFt5MDC0VmaGWuxn749HYR/PHyWYMBfXtcljotVcz3
 FJC2igwvw28UES3qyGn3vj1IpwLBbfnFRu6q9ZciIOM0HlTsRT2+yYDo2gC2sDQBlQqq
 mv0lje4vW4tZZvVptvPBCG6QNKQeKEgs/xLC29x7acdUOjksdQna1xGao6oD6XqVEciV
 FMUw==
X-Gm-Message-State: AOAM532dPNMg4H6cQRDkXaoS2hDIQaNG3mQ0XPtu31C8tetN8oed2DpK
 gY7OjL7vcnSsZeFojO+ZgAQ=
X-Google-Smtp-Source: ABdhPJzQ1L6kDVg9G8y4RJkWloL7N+rpqdPn1hd4OeuAGf9KWvS8WtZx3BgjCvevZHex9/GYCsOWIQ==
X-Received: by 2002:a7b:c922:: with SMTP id h2mr16628553wml.186.1630018027573; 
 Thu, 26 Aug 2021 15:47:07 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id w18sm4868070wrg.68.2021.08.26.15.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 15:47:07 -0700 (PDT)
Date: Fri, 27 Aug 2021 00:47:05 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <YSgZ6V/1uWia6lye@pevik>
References: <20210822190251.280313-1-petr.vorel@gmail.com>
 <20210822190251.280313-2-petr.vorel@gmail.com>
 <1bf16d0e-12bf-db14-5f1a-9c24534be795@gmail.com>
 <YSKj9XQJbZ4jMQZB@pevik>
 <4b58e6bf-eb43-facc-2c44-e50ae52ad111@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b58e6bf-eb43-facc-2c44-e50ae52ad111@mind.be>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/localedef: bump to version
 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgQXJub3V0LCBhbGwsCgo+IE9uIDIyLzA4LzIwMjEgMjE6MjIsIFBldHIgVm9yZWwgd3JvdGU6
Cj4gPiBIaSBSb21haW4sCgo+ID4+IEhlbGxvIFBldHIsCgo+ID4+IExlIDIyLzA4LzIwMjEgw6Ag
MjE6MDIsIFBldHIgVm9yZWwgYSDDqWNyaXTCoDoKPiA+Pj4gcmVzeW5jIHRoZSB2ZXJzaW9uIHdp
dGggZ2xpYmMgcGFja2FnZS4KCj4gPj4+IERyb3BwZWQgMiBwYXRjaGVzIChmaXhlcyBiYWNrcG9y
dGVkIGZyb20gcHJldmlvdXMgcmVsZWFzZXMpLAo+ID4+PiByZWJhc2VkIDIgd2hpY2ggYXJlIGtl
cHQgKG9ubHkgbGluZSBudW1iZXJzIGNoYW5nZWQpLgoKPiA+Pj4gU3VnZ2VzdGVkLWJ5OiBSb21h
aW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IFBl
dHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgoKPiA+PiBUaGFua3MgZm9yIHRoaXMgbmV3
IHZlcnNpb24uCgo+ID4+IEJ1dCBpdCB3aWxsIGNvbmZsaWN0IHdpdGggbXkgcGF0Y2ggdGhhdCBy
ZXN5bmMgdGhlIGdsaWJjIHZlcnNpb24gZm9yIDIuMzMKCj4gIFJlc29sdmluZyB0aG9zZSBjb25m
bGljdHMgaXNuJ3QgdG9vIGRpZmZpY3VsdCwgc28gZG9uJ3Qgd29ycnkgYWJvdXQgaXQuCgo+ICBX
ZWxsLCBhY3R1YWxseSwgdGhlICJyZWZyZXNoIiBvZiB0aGUgcGF0Y2hlcyAqZG9lcyogbWFrZSBp
dCBhIGJpdCBkaWZmaWN1bHQuCj4gSXQncyBuaWNlciBmb3IgdXMgaWYgeW91IGxlYXZlIHBhdGNo
ZXMgdW50b3VjaGVkIGFzIGxvbmcgYXMgdGhleSBzdGlsbCBhcHBseQo+IGNvcnJlY3RseS4KCgo+
ID4+IGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8y
MDIxMDgyMTEzMTI1Ni4xMTM4MDAyLTEtcm9tYWluLm5hb3VyQGdtYWlsLmNvbS8KPiA+IE9LLCBJ
J2xsIHJlYmFzZSBpdCBvbmNlIHlvdXIgY29tbWl0IGdldHMgbWVyZ2VkLgo+ID4gQnV0IGlmIGJ1
bXAgY29uc2lkZXJlZCBzYWZlLCBtYXliZSBteSBjb21taXRzIGNvdWxkIGJlIHRha2VuIGFzIGl0
IGlzLgoKPiAgVGhhdCdzIHdoYXQgSSBkaWQgOi0pCgpUaGFua3MhCgoKPiA+PiBTaW5jZSBnbGli
YyBhbmQgbG9jYWxlZGVmIGFyZSByZWFsbHkgdGhlIHNhbWUgcHJvamVjdCwgSSB3b3VsZCBzdWdn
ZXN0IHRvIGJ1bXAKPiA+PiB0aGUgdmVyc2lvbiB3aXRoIG9uZSBjb21taXQuCgo+ID4+IEkgYWdy
ZWUsIEl0J3Mgbm90IGNvbnZlbmllbnQgdG8gdGFrZSBjYXJlIG9mIGxvY2FsZWRlZiBwYWNrYWdl
IGF0IHRoZSBzYW1lIHRpbWUKPiA+PiBvZiBnbGliYy4KPiA+IEkgd2FzIHRoaW5raW5nIGFib3V0
IGl0IGFzIHdlbGwsIGJ1dCB3aGVuIHBhY2thZ2VzIGFyZSBpbmRlcGVuZGVudCBpdCdzIElNSE8K
PiA+IHNsaWdodGx5IGJldHRlciB0byBzcGxpdCBpdC4KCj4gIEkgZG9uJ3QgY2FyZSBtdWNoIGVp
dGhlciB3YXkgLSB0aGVyZSBhcmUgYXJndW1lbnRzIGZvciBib3RoIG9wdGlvbnMuIGxvY2FsZWRl
Zgo+IGFuZCBnbGliYyBhcmVuJ3QgdGllZCB0aGF0IHN0cmljdGx5LCBpdCdzIGp1c3QgdGhhdCBn
bGliYyBjaGFuZ2VzIG1heSByZXN1bHQgaW4KPiBkaWZmZXJlbnQgb3V0cHV0IG9mIGxvY2FsZWRl
Ziwgd2hpY2ggeW91IHdvbid0IG5vdGljZSB1bnRpbCB5b3UgYWN0dWFsbHkgdXNlCj4gdGhvc2Ug
bG9jYWxlcyBhdCBydW50aW1lIChhbmQgdGhlbiBvbmx5IGlmIHlvdSB1c2VkIHRoZSBjaGFuZ2Vk
IGFzcGVjdCBvZiBpdCkuCj4gU28gaXQncyBtb3JlIGEganVzdC10by1iZS1zYWZlIHRoaW5nLgpU
aGFua3MgYSBsb3QgZm9yIGluZm8uCgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gIFJlZ2FyZHMsCj4g
IEFybm91dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMu
YnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
