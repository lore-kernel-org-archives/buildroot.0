Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16712C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 15:24:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB59606A5
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 15:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EB59606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27AE860585;
	Sun, 29 Aug 2021 15:24:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pVbDK5_3GzPF; Sun, 29 Aug 2021 15:24:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA111605DE;
	Sun, 29 Aug 2021 15:24:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3261BF3DB
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 15:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75FDE80D7B
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 15:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgwkcDxpkQ8Y for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 15:24:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72B2180C51
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 15:24:02 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ia27so25411046ejc.10
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jgrc/TjVrMiXrC/kxW5efMaXcdKp0ZUzHJQreLY82Pg=;
 b=cKnM3k3rfgmm0laTj8iI7z14HjUAOODKJdWPJ4a8xYR9Iy9mSyZdnY4XTqUXcxJvFZ
 snFsrgZ955oWLn0F+h3o8nMp1Qz+LFsfI6iiNJmJIgGImoOVhV3nMZQq1SNTCucGEf4i
 vV9kX4impUCsTHCf2MzWWiby0CusOuz8BM/1UZI1WqX2GK240OfSp/kfEssBUtpnimoW
 2+ztGTt/k14kqpuJeRoFOwzRwXCDB1SXdDeyZWFzvsK1+x+mvDxZ6w53rXVuhirpGU10
 09hM40FkAT1oudNUEX2BbHMA4b6VnzSp4cZj6DPlQz18a2dBPr87aeg20qwNoE+c1QNu
 mKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jgrc/TjVrMiXrC/kxW5efMaXcdKp0ZUzHJQreLY82Pg=;
 b=L+u4oS69bv1Bo36QSz5btBV4oAkYcN20amLIcy8u/XJcIQkRv4raORBP/C5AHeV+Vm
 lDD7c9s2zGJaDhgtrK0/zHgQcFN33q95O5aQZu6ke0eFbYfqLhyP9iDTE7ejSo0TiWsh
 jPGUbxX5epLbJ3S6ESmZUVeq4ja5coJZNlBNzhnlVr/eESqg4fFDmYEujBbQOREFI4zZ
 JtKaB3Nj5eZlVd8r8dSCmpSC+3z39erROx+m43ze9eqIgEWoBAP6R84EGLka0aJDpYBB
 H5zauMplm9v49i1CV+r5qAULkVbcCuORhucYH9CUWaZ7prO1x+5ClD2TenI3k2N3pgJ5
 KDUg==
X-Gm-Message-State: AOAM533k1AMkD+bqFQlsDpoTyKi5GuAm8XI4i8Q+xIzjjZ8+fJoiVwbC
 pE5HsuKUxy4/2xk93D7bcOS3vA==
X-Google-Smtp-Source: ABdhPJypY4IajEtJoZ853WDj6r4PYiCql7mvPPmg5xkmVHle4oYAK9tC4YbXxbUC5exg9QoC5RU+xQ==
X-Received: by 2002:a17:907:764f:: with SMTP id
 kj15mr6465157ejc.473.1630250640481; 
 Sun, 29 Aug 2021 08:24:00 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x15sm5439954ejc.59.2021.08.29.08.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 08:23:59 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <86602fc9-9d62-0b7b-4ce3-25bf3de27254@mind.be>
 <7FE9A46C-9CD8-4143-99DE-CE8D786A459C@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <761985a1-2152-7a7b-e430-54b7b4ed31f3@mind.be>
Date: Sun, 29 Aug 2021 17:23:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7FE9A46C-9CD8-4143-99DE-CE8D786A459C@benettiengineering.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_83143
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAyOC8wOC8yMDIxIDE0OjM5LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIaSBBcm5vdXQs
Cj4gCj4+IElsIGdpb3JubyAyOCBhZ28gMjAyMSwgYWxsZSBvcmUgMTQ6MDYsIEFybm91dCBWYW5k
ZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gaGEgc2NyaXR0bzoKPj4KPj4g77u/Cj4+Cj4+PiBP
biAyOC8wOC8yMDIxIDAwOjM0LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPj4+IHJ1YnkgcGFja2Fn
ZSBmYWlscyB0byBidWlsZCBmb3IgdGhlIFNINCBhcmNoaXRlY3R1cmUgd2l0aCBvcHRpbWl6YXRp
b24KPj4+IGVuYWJsZWQgd2l0aCBnY2MgPSA5LjMuMDoKPj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm5ldC9yZXN1bHRzL2Y1Ny9mNTc0MmU3ZmI2ZTgxNDJiY2RiNTNiN2Y0ZjVlOWMxYmVh
MzU1OGNkLwo+Pj4KPj4+IEl0J3MgYWxyZWFkeSBiZWVuIHJlcG9ydGVkIHVwc3RyZWFtOgo+Pj4g
aHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9ODMxNDMKPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVu
Z2luZWVyaW5nLmNvbT4KPj4+IC0tLQo+Pj4gdG9vbGNoYWluL0NvbmZpZy5pbiB8IDkgKysrKysr
KysrCj4+PiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL3Rvb2xjaGFpbi9Db25maWcuaW4gYi90b29sY2hhaW4vQ29uZmlnLmluCj4+PiBpbmRleCBi
ZjJiYjNlZmU0Li40NDE5NDQzOTMwIDEwMDY0NAo+Pj4gLS0tIGEvdG9vbGNoYWluL0NvbmZpZy5p
bgo+Pj4gKysrIGIvdG9vbGNoYWluL0NvbmZpZy5pbgo+Pj4gQEAgLTEzMyw2ICsxMzMsMTUgQEAg
Y29uZmlnIEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfNjg0ODUKPj4+ICAgIGJvb2wKPj4+ICAg
IGRlZmF1bHQgeSBpZiBCUjJfbWljcm9ibGF6ZQo+Pj4KPj4+ICsjIGh0dHBzOi8vZ2NjLmdudS5v
cmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTgzMTQzCj4+PiArIyBFcnJvcjogaW52YWxpZCBv
cGVyYW5kcyAoKlVORCogYW5kIC50ZXh0IHNlY3Rpb25zKSBmb3IgYC0nIG9uIHNoNC4KPj4+ICsj
IFRoaXMgYnVnIG5vIGxvbmdlciBleGlzdHMgaW4gZ2NjIDEwLnggYnV0IHJlYXBwZWFyZWQgb24g
Z2NjIDExLnggYW5kCj4+PiArIyBpdCBzdGlsbCBub3QgYmVlbiBmaXhlZCB5ZXQuCj4+PiArY29u
ZmlnIEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfODMxNDMKPj4+ICsgICAgYm9vbAo+Pj4gKyAg
ICBkZWZhdWx0IHkgaWYgIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEwCj4+Cj4+IFRoZSBj
b25kaXRpb24gZG9lc24ndCBjb3JyZXNwb25kIHRvIHRoZSBjb21tZW50IGFib3ZlLi4uCj4gCj4g
SeKAmXZlIHRyaWVkIGl0IGFuZCBjaGVja2VkIC5jb25maWcKPiBJIGZpbmQgaXQgZW1pdHRlZCBv
biBnY2MgOSBhbmQgMTEgd2hpbGUgb24gZ2NjIDEwIG5vdCBhcyBkZXNjcmliZWQuCgogSSBkb24n
dCBrbm93IHdoYXQgeW91IGRpZCBkaWZmZXJlbnRseSwgYnV0IHRoYXQncyBub3Qgd2hhdCBJIGhh
dmUuLi4KCldpdGggdGhpcyBkZWZjb25maWc6CgpCUjJfc2g9eQpCUjJfR0NDX1ZFUlNJT05fMTFf
WD15CgpncmVwIEdDQ19CVUdfODMxNDMgLmNvbmZpZwoKcHJvZHVjZXMgbm8gb3V0cHV0LCB3aGls
ZSB3aXRoIHRoaXMgZGVmY29uZmlnOgoKQlIyX3NoPXkKQlIyX0dDQ19WRVJTSU9OXzlfWD15Cgpp
dCBkb2VzIHNob3cgaXQuCgoKIEJUVywgSSBkaWRuJ3Qgbm90aWNlIGJlZm9yZSwgYnV0OiB3aHkg
aXMgdGhpcyBvbmx5IGZvciBzaDQsIGFuZCBub3QgYW55IG90aGVyClN1cGVySD8gSSBtZWFuLCBh
cmUgeW91IHN1cmUgaXQncyBvbmx5IG9uIHNoND8gc2g0IGlzIHRoZSBvbmx5IG9uZSB0ZXN0ZWQg
aW4gdGhlCmF1dG9idWlsZGVycywgb2YgY291cnNlLCBidXQgaXQncyBraW5kIG9mIGxpa2VseSB0
aGF0IG90aGVyIFN1cGVySCBzdWZmZXIgZnJvbQp0aGUgc2FtZSBidWcuLi4KCgo+IEl04oCZcyBh
bHdheXMgZGlmZmljdWx0IHRvIG1lIHRvIHVuZGVyc3RhbmQgaG93IHRoYXQgdmFyaWFibGUgd29y
a3MuCgogSXQncyB2ZXJ5IHNpbXBsZTogQVRfTEVBU1RfMTBfWCBpcyB0cnVlIGZvciBhbGwgR0ND
ID49IDEwLjAsIHNvIGFsc28gZm9yIEdDQwoxMS4gSWYgeW91IHdhbnQgZXhhY3RseSBvbmUgdmVy
c2lvbiwgaXQncyBBVF9MRUFTVF8xMCAmJiAhQVRfTEVBU1RfMTEuIEluIHRoaXMKY2FzZSwgeW91
IHdhbnQgdGhlIG5lZ2F0aXZlIG9mIHRoYXQsIHNvICFBVF9MRUFTVF8xMCB8fCBBVF9MRUFTVF8x
MS4KCiBSZWdhcmRzLAogQXJub3V0Cgo+IAo+IEdpdWxpbwo+IAo+Pgo+Pgo+PiBSZWdhcmRzLAo+
PiBBcm5vdXQKPj4KPj4+ICsgICAgZGVwZW5kcyBvbiBCUjJfc2g0Cj4+PiArCj4+PiAjIGh0dHBz
Oi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTg1MTgwLiBUaGlzIGJ1ZyBu
bwo+Pj4gIyBsb25nZXIgZXhpc3RzIGluIGdjYyA4LnguCj4+PiBjb25maWcgQlIyX1RPT0xDSEFJ
Tl9IQVNfR0NDX0JVR184NTE4MAo+Pj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RA
YnVzeWJveC5uZXQKPj4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9s
aXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
