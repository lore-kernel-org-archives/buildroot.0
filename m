Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773FDC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:30:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BA8E60F25
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BA8E60F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD8B2400AE;
	Sun,  8 Aug 2021 21:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9XtR4S5X0dW; Sun,  8 Aug 2021 21:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB7AA40160;
	Sun,  8 Aug 2021 21:30:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13DBC1BF42E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0359C82C04
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M0OekU2-hqtX for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 21:30:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B624C82BFD
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 21:30:46 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g30so25486855lfv.4
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 14:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xheStixTQm3CFjnMsIcH8K+kwX7jdk6Yx6oH+z26fkY=;
 b=ssonsOYSr/N6esq8L9h+Levuu5mcgGw5cE14VTCLPfHAR76FRLMj+aE/re/4UwALfV
 LZJFYFg/LPddlIfxT9iwgHvfo0xBsa3rXJv2PmWN3s05MwHxJlrUQJldnEq4oQGwY+ha
 8wsrJgDehi1Lr7cFDBxXOus1XVInZAnB7fB0ecZuQOkw7PB7U2vDD/zWTAhC4VqiFQgP
 UEJPN+ptvj2KmZaxu68J1yHWjDsFP9gjxV7prrSYNZErQHq4+U1ZE+ccD46yD/ASv/Fp
 nNte/xGQm8qKhgWGpOG01BWBYXgl3iIVtDm+UR4POAN1uCqaO36SjBNQKn9A9+k1KhtS
 vZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xheStixTQm3CFjnMsIcH8K+kwX7jdk6Yx6oH+z26fkY=;
 b=HREBMOjiHioXyXIWL/kEgaDGyal5FmoiyQd7Ombz9w4asXh6TDf8+cmOk2vgRyzy9F
 19ARuB8Xep6JRm7JmwTngwEWzs5Ds7pUqB/vbJFF/+eXVAOXQGa6PVsBH7XMPXJyoIKW
 sgmSNjZ70hHm+bDQx/HHb3r1v0fC46KtwNFsftI04/lcPri28WetP7gO3LDOhNTBnbTY
 IMJmMJwXQaI8fXHWbva8iYRkaHXwL4HFatOyIJj288eUAxY8jnDWYaa0WBEPYEN1TeEq
 lDECkp6Vzfgyx5gJFTIt2MxUCTdKUyMy7n7Y6V1igAsRb1TlnW2oKxfwfUZVbXZhXvlc
 vZEA==
X-Gm-Message-State: AOAM530OJWpdaovc4cp8LZow9Rzw/p1vgNJyoCM7ZNvZnf4cuYTqu2rz
 DdpE6AqjbdZuEBGT5X30PZ9gQeSuSJ4o0c7TeIs=
X-Google-Smtp-Source: ABdhPJyZWEZoE2oie/YaMl/LDqc/WUTsNfyysWugKwnQBjImyTcP4G54CJUp/uIAssC6Ije8LewqeTBXPGnfDVaX4sE=
X-Received: by 2002:a05:6512:1597:: with SMTP id
 bp23mr14438420lfb.189.1628458244685; 
 Sun, 08 Aug 2021 14:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210807194031.1501659-1-fontaine.fabrice@gmail.com>
 <20210808232220.3083425d@windsurf>
In-Reply-To: <20210808232220.3083425d@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 8 Aug 2021 23:30:28 +0200
Message-ID: <CAPi7W83WV+dAkbdi8idtja67YbQ1C=LDeQkNGZSpBkp_d=kwoQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/ffmpeg: add -latomic to pkg-config files
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TGUgZGltLiA4IGFvw7t0IDIwMjEgw6AgMjM6MjIsIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFNhdCwgIDcgQXVnIDIwMjEg
MjE6NDA6MzEgKzAyMDAKPiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiA+IC1sYXRvbWljIHdhcyBhZGRlZCB0byBleHRyYWxpYnMgdG8gZml4
IHN0YXRpYyBidWlsZCBvZiBmZm1wZWcgaW4gY29tbWl0Cj4gPiBmYzg3OTgxOTdiNTc0ODhhODUy
ZTJjMTRiNDY3N2I1ZWIwMTE0YTBiLiBIb3dldmVyLCBleHRyYWxpYnMgaXMgbm90Cj4gPiBhZGRl
ZCB0byBsaWJhdmZvcm1hdC5wYyByZXN1bHRpbmcgaW4gdGhlIGZvbGxvd2luZyBzdGF0aWMgYnVp
bGQgZmFpbHVyZQo+ID4gb2YgbW90aW9uOgo+ID4KPiA+IC9ob21lL2J1aWxkcm9vdC9hdXRvYnVp
bGQvaW5zdGFuY2UtMS9vdXRwdXQtMS9ob3N0L29wdC9leHQtdG9vbGNoYWluL2Jpbi8uLi9saWIv
Z2NjL2FybS1idWlsZHJvb3QtbGludXgtdWNsaWJjZ251ZWFiaS85LjMuMC8uLi8uLi8uLi8uLi9h
cm0tYnVpbGRyb290LWxpbnV4LXVjbGliY2dudWVhYmkvYmluL2xkOiAvaG9tZS9idWlsZHJvb3Qv
YXV0b2J1aWxkL2luc3RhbmNlLTEvb3V0cHV0LTEvaG9zdC9iaW4vLi4vYXJtLWJ1aWxkcm9vdC1s
aW51eC11Y2xpYmNnbnVlYWJpL3N5c3Jvb3QvdXNyL2xpYi9saWJhdmZvcm1hdC5hKGZpZm8ubyk6
IGluIGZ1bmN0aW9uIGBmaWZvX2luaXQnOgo+ID4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9p
bnN0YW5jZS0xL291dHB1dC0xL2J1aWxkL2ZmbXBlZy00LjQvbGliYXZmb3JtYXQvZmlmby5jOjUx
OTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19hdG9taWNfc3RvcmVfOCcKPiA+Cj4gPiBTbyBh
ZGQgYSBwYXRjaCB0byBhZGQgZXh0cmFsaWJzIChhbmQgc28gLWxhdG9taWMpIHRvIGFsbCBwa2ct
Y29uZmlnCj4gPiBmaWxlcwo+ID4KPiA+IEZpeGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5i
dWlsZHJvb3Qub3JnL3Jlc3VsdHMvNjJlYzYxOGU0MDA4MWEyNTBiODEyOWVjNmY1YTE3OGViMDZm
YmExZAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZh
YnJpY2VAZ21haWwuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHYxIC0+IHYyIChhZnRlciByZXZp
ZXcgb2YgWWFubiBFLiBNb3Jpbik6Cj4gPiAgLSBBZGQgZXh0cmFsaWJzIHRvIGFsbCBwa2ctY29u
ZmlnIGZpbGVzIGFuZCBub3Qgb25seSBsaWJhdmZvcm1hdC5wYwo+Cj4gQXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4gV2h5IGRvIHlvdSBjb25zaWRlciB0aGUgcGF0Y2ggbm90IGFjY2VwdGFibGUK
PiB1cHN0cmVhbT8KQmVjYXVzZSBJIHRoaW5rIGl0IG9ubHkgbWFrZXMgc2Vuc2UgYmVjYXVzZSB3
ZSdyZSBwYXNzaW5nIC1sYXRvbWljIHRvCmV4dHJhbGlicyBidXQgSSBjYW4gdHJ5IHRvIGdldCB0
aGVpciBmZWVkYmFjay4KPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBC
b290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHBzOi8v
Ym9vdGxpbi5jb20KQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
