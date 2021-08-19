Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89429C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:40:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4591D60720
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4591D60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FF038191E;
	Thu, 19 Aug 2021 20:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOoqy7MnwFwQ; Thu, 19 Aug 2021 20:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70D9581A12;
	Thu, 19 Aug 2021 20:40:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99F301BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 899104035A
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDKYlfhxFkKw for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:40:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2A45401B3
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:40:29 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y34so15583139lfa.8
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 13:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TxWGoSJIucJJhJcpS9wq17SNvI58fscqwWRL7RJtr3M=;
 b=R9Om5NnxTYilBH42AmvZGhGNngkn9qqGkV/dwm5RNtPIotgf+VZansXsffYkHrCEKj
 MCbXrm/xNhM3ouNJ/1eLiAkyDf/7IrOtVPaI7JOtwQsVbON2rketQYq8FaUiCLGioqhG
 M5L9gROoU6GNK4pK6GdE9OmEOwmxYkqdIKgCqmVZ8TD6knQoM0e3vdT1XY5PP3GBZ4Em
 aSyyPgH/2xD030jIxATppf7qs8YWgbtbr9gSy/ff4zxJrU24NS18p0vjQBlFXIrIyiQ/
 w2q2fNo6PEvMHS2V60NRIMWCAEtB4fhem3X1Z0zxWiVEfRH4NgsfKnDTvXXl3WASuobQ
 3wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TxWGoSJIucJJhJcpS9wq17SNvI58fscqwWRL7RJtr3M=;
 b=g83UQaeovJiXW3smQBTaQpmt64NNfBa8NU2jJ4VkZM+iTwg9jK4Gwgt/1z7RKbJzRx
 LTZdMRGiYUlvGSB3AtV7wTR+7QleNBwrd4KnmoSmUmvZ1wnddhouuu2c1A/UmYfGWtDX
 C+I0/hiEgbktB2gk6OWczifAfYjn8lo3tDrnUWpb9NfgoABtoPHGw3djbpCOSt4pJnfj
 tzvoPNgy202hqtbcnc/LlbxiGdx+6Yy+0s2PL4ovZfr1kLkcEdD/lRlXUJ65wKGllXYX
 URnLqFtMPaeMAi2WrHESDnUq1HqVWL20xJOp14h4hqegTXwbHCzX/FNeaaw04QxFQO2L
 w30g==
X-Gm-Message-State: AOAM533k+3gc6Lqa2Y6BZbBDUTBNtE0KtU/tKVkv2uut7xrANp2qggiR
 +GhcanX4WrWXOd2BajqWweL0d1RneRIbdjjyWQg=
X-Google-Smtp-Source: ABdhPJwCBhXJ42qsebCupBB2vQZcQBwcfm/y+WBietBKV53KMahRGfOWccOoEbbuJIRbgRCKUQXR2cVxgM0oDAKeptM=
X-Received: by 2002:a05:6512:1394:: with SMTP id
 p20mr11507844lfa.189.1629405627616; 
 Thu, 19 Aug 2021 13:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210819160317.1045482-1-fontaine.fabrice@gmail.com>
 <20210819223211.720d6e69@windsurf>
In-Reply-To: <20210819223211.720d6e69@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 19 Aug 2021 22:40:16 +0200
Message-ID: <CAPi7W8386-5F-fCsNzNWev47_14DB5B7Tqey4QawWDWELMJHCw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mpv: vaapi-drm needs egl-drm
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TGUgamV1LiAxOSBhb8O7dCAyMDIxIMOgIDIyOjMyLCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBUaHUsIDE5IEF1ZyAyMDIx
IDE4OjAzOjE3ICswMjAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiBCdWlsZCBvZiB2YWFwaS1kcm0gd2l0aG91dCBlZ2wtZHJtIGlz
IGJyb2tlbiBzaW5jZSBjb21taXQKPiA+IDZlYzQ3YzRlNTljN2M4YzU3ZTk3MmRhYjk4NWM4YTJi
YTBiZjcxNzQ6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vbXB2LXBsYXllci9tcHYvYmxvYi9lYzAw
MDZiZmExYWFmNjA4YTcxNDE5MjlmMjg3MWM4OWFjN2ExNWQ2L3dzY3JpcHQjTDY0Nwo+ID4KPiA+
IEZpeGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvODNk
NmRjYmI3N2FiODc1NGFlZmNkY2Y5MGJhZWFmZjlkYjJhMWM4MQo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0t
Cj4gPiAgcGFja2FnZS9tcHYvbXB2Lm1rIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21w
di9tcHYubWsgYi9wYWNrYWdlL21wdi9tcHYubWsKPiA+IGluZGV4IGQ0ZDRkNDgxMWQuLjkxZTMx
ZGQxNTAgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL21wdi9tcHYubWsKPiA+ICsrKyBiL3BhY2th
Z2UvbXB2L21wdi5tawo+ID4gQEAgLTE4MSw3ICsxODEsNyBAQCBlbmRpZgo+ID4gIGlmZXEgKCQo
QlIyX1BBQ0tBR0VfTElCVkEpJChCUjJfUEFDS0FHRV9NUFZfU1VQUE9SVFNfVkFBUEkpLHl5KQo+
ID4gIE1QVl9DT05GX09QVFMgKz0gLS1lbmFibGUtdmFhcGkKPiA+ICBNUFZfREVQRU5ERU5DSUVT
ICs9IGxpYnZhCj4gPiAtaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJEUk0pLHkpCj4gPiAraWZlcSAo
JChCUjJfUEFDS0FHRV9MSUJEUk0pJChCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VHTCkseXkp
Cj4gPiAgTVBWX0NPTkZfT1BUUyArPSAtLWVuYWJsZS12YWFwaS1kcm0KPgo+IERvIHdlIGNhbiBv
bmx5IHVzZSBNZXNhM0QgYXMgYW4gRUdMIHByb3ZpZGVyID8KRnJvbSBteSB1bmRlcnN0YW5kaW5n
LCB2YWFwaS1kcm0gbmVlZHMgZWdsLWRybSB3aGljaCBoYXMgYmVlbiBhZGRlZAp3aXRoIGNvbW1p
dCAwMzFkZjQ3NGMyNGY5Mjc1N2FjOTVhZGU1NzJiOTA5OTVlYmRjNmEyIGFuZCBpcyBvbmx5CmF2
YWlsYWJsZSB3aXRoIG1lc2EzZCBiZWNhdXNlIG9mIGdibSBkZXBlbmRlbmN5OgpodHRwczovL2dp
dGh1Yi5jb20vbXB2LXBsYXllci9tcHYvYmxvYi8wYjU2ZTFjMDBhNTdmZGI3Njc2NzQ0NjJjMjk5
YTVjOTczYTllMzczL3dzY3JpcHQjTDU3MQo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6
b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KQmVzdCBSZWdhcmRzLAoKRmFicmlj
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJv
eC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
