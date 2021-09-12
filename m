Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B536C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 21:34:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AADCD61039
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 21:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AADCD61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F891402BD;
	Sun, 12 Sep 2021 21:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D2d3IUaBNN5F; Sun, 12 Sep 2021 21:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92F71402AE;
	Sun, 12 Sep 2021 21:34:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 674071BF3FD
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 21:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5483340439
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 21:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqS1A05bTpDx for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 21:34:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D95740433
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 21:34:01 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id p15so13549189ljn.3
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V5h28ZTL0/6EBCSUZfgLI2jK6ty+7jHQ+OsVMj6ePXc=;
 b=WxgdbRdOpXcy2ZYV0QQ0pfUNQ4axGZWrSqGaHJPOnLdUTMXNXNf66/mg0aU1SBZWwu
 lWEaZKz96kTdKIb9S8Zl628ya9RSNLsNHlJgWGNz8M3P9ELlqbyoHvL5uIReas6CPFZf
 DksC/20bkBVUcc+6ExEzmJ4sEUKwcFSjGtI4CT9KXyX6T8jieYWlVrpnpJ43MHSfZfqI
 N+uaS9xRq3JJfpDzR+P3Eg4Pc6MjgWhTQUZs1n+UnVd2pxvaHYpvOEVzQ/RtLO+HDAIj
 fJP6HMEDgc+71G5cttsJapAB3aZGBfQVt858MRnn2YkMwRtIRJPD7GNfP2ViIYeyqgtr
 id/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V5h28ZTL0/6EBCSUZfgLI2jK6ty+7jHQ+OsVMj6ePXc=;
 b=cqyUnd/eW7sey4YjhclC0df8XzOp6bwPwdbllBdMI3i82ymhPLiYhM2fmkZlFkA1Ne
 N0VlFsrTtnwl2WJLQPV1As5hQJFRM6GS+E8n3uydTUBbzsvXdonJrOz928R/MpTYoi2r
 b3LIH6Ct3B1U0xxT0lTmnB5wMY8zJl8Cun7dpNnMsLnM0xOIyrmWest96gCBW7AGQitg
 nf8DBOKZ+qw7+Pi/PIyebklLgMWP/Ka/AH5IUz8ApCfLFYOSeQNDY3bE4ffqYhTInLD7
 RBxtOMQxZhOB9undIbpjsT+RzlTBaQjat+7KOsISFt4G+RLPpSs6QHFR4qBibvZVBGBz
 GZ+g==
X-Gm-Message-State: AOAM530tPCdc6cZ0u4Tl9E5LPnrRlWjgtZCH7WoUJqwqxh2qNyHEqvta
 Tdby7TAhgSr+9hG8FaavrM/pETDlAPYGxJ4LXNw=
X-Google-Smtp-Source: ABdhPJxgWQ+rHDDBn6xdBVBz2GGf9fwaynED2NCDSFSrG+feCCrXA+upNR8HMHrPRC8SpxD+rjn7ZDvMhBHpDR0SDxI=
X-Received: by 2002:a2e:97cb:: with SMTP id m11mr7705839ljj.240.1631482439447; 
 Sun, 12 Sep 2021 14:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210912200706.2884974-1-fontaine.fabrice@gmail.com>
 <bfb503d3-a70e-9e12-6a39-d0d56dbb5e56@benettiengineering.com>
 <60e98119-f7e7-f7d4-0976-ddd62295b068@benettiengineering.com>
In-Reply-To: <60e98119-f7e7-f7d4-0976-ddd62295b068@benettiengineering.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 12 Sep 2021 23:33:48 +0200
Message-ID: <CAPi7W80iLwuDZGOvNgbebi52xEMznmOgcQjfFNoZMHdAXr0zSw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/minicom: drop autoreconf
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGkgR2l1bGlvLAoKTGUgZGltLiAxMiBzZXB0LiAyMDIxIMOgIDIzOjExLCBHaXVsaW8gQmVuZXR0
aQo8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gYSDDqWNyaXQgOgo+Cj4g
T24gOS8xMi8yMSAxMTowOSBQTSwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4gPiBIaSBGYWJyaWNl
LAo+ID4KPiA+IE9uIDkvMTIvMjEgMTA6MDcgUE0sIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4g
Pj4gYXV0b3JlY29uZiAoYW5kIHNvIEFNX0lDT05WKSBpcyBub3QgbmVlZGVkIHNpbmNlIGNvbW1p
dAo+ID4+IDJkZjMyZTBkNDQzN2I0MjIxNzUwODllZGYxOTE3MjE5NjU2ZmNjZWYKPiA+Cj4gPiBD
YW4geW91IHNwZWNpZnkgdGhlIHVwc3RyZWFtIGNvbW1pdCBpbnN0ZWFkIG9mIHRoZSBCdWlsZHJv
b3Qgb25lIGluCj4gPiBjb21taXQgbG9nPwpUaGVyZSBpcyBubyB1cHN0cmVhbSBjb21taXQsIHdl
IGNhbiBkcm9wIGF1dG9yZWNvbmYsIGJlY2F1c2Ugd2UncmUKdXNpbmcgdGhlIG9mZmljaWFsIHRh
cmJhbGwgd2hpY2ggcHJvdmlkZXMgYSBjb25maWd1cmUgc2NyaXB0IHNpbmNlCmJ1aWxkcm9vdCBj
b21taXQgMmRmMzJlMGQ0NDM3YjQyMjE3NTA4OWVkZjE5MTcyMTk2NTZmY2NlZi4KPgo+IEFoIHll
YWgsIHdpdGggYSBsaW5rIHRvby4KPgo+IFRoYW5rcyBhIGxvdAo+Cj4gLS0KPiBHaXVsaW8gQmVu
ZXR0aQo+IEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4KPiA+Cj4gPiBFeGNlcHQgdGhhdDoKPiA+
Cj4gPiBSZXZpZXdlZC1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGll
bmdpbmVlcmluZy5jb20+Cj4gPgo+ID4gQmVzdCByZWdhcmRzCj4gPgo+CkJlc3QgUmVnYXJkcywK
CkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
