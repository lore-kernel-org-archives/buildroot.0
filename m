Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A57C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 21:12:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B38AC6023B
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 21:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B38AC6023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39FA140265;
	Sun, 24 Oct 2021 21:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DTC3r8-QxIp8; Sun, 24 Oct 2021 21:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 922BF4025E;
	Sun, 24 Oct 2021 21:12:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 971C41BF315
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 21:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 823B580D0A
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 21:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_L3OPmG_STc for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 21:12:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 265BD80CF9
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 21:12:27 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so7248435lfb.4
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HXWTj3BIvpMa8FJyyHAhyrWPOe5h7phY+3rQQHboaxw=;
 b=Tt11YuRqQjVceya3SphT4s/RkPb6NxB2Vhhx/3gAxbRRJhGRl0Ho36t6OsuTC7LQwX
 jMis6rRgIzSHTZDUid6Amh4P3VJxQs59GEc6DrJfTDkQJwopBYQhlKmfcpc+APr/BSsk
 S4c/DY/am12c884f+sQGv4w8jyESffpBg4T0ZHSNE6mp8Wd29Z8P0i5o+Xu+U8V0OMt/
 G0E6vQMcKo7YiVf3zfF3WV1P3d/m/uJd6+ZY2fJHU39/ScVlUAO1ZIWpDyKsGeEHBTD/
 QMrpDfiNMxBTUVSH2vTWu5w0MjDxPvETa2Qcwe8Q1cyucDBT4Btg2LHJtKBoSGcQaOAi
 JZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HXWTj3BIvpMa8FJyyHAhyrWPOe5h7phY+3rQQHboaxw=;
 b=higaK8qWbxQzS1YwjijoQp5lY1Bry1RPSs75OI0mbya3p2C864WpBU/onmFq0b3Zch
 PJb67qUPzMbz0rUMEuoXdTG3M19Ac8Ma/JTyxlE7eHcuuKpe0lEWuTrWKOR/my+QM7H8
 Keg2NgecA2rWy4Y71Ybk5f7uxAz831ERg8/6GbAWge83cuvsSj7tub+mIYeLHrnrB17O
 ipAUaQnjwsLeyHtUVBZX2scNYh/LXZhtwqPpmC4IhxCcPN8SrAFTwi+MOavA08Gai2eq
 k7NQFCa8IzwsPJ4DZ2BJFyeueDo/So1FOOepSRJmXcsPF4W7P9dIOwrWJ+q+NaNnrbT2
 s4Lg==
X-Gm-Message-State: AOAM5335EEgVDfBAd4s1bUEPVVR3QFBtbypOuDEzQdXGtEnrO+noSjfU
 KSerlY2OdAmuzTXGUqIVwOntGzeOpN4IIu1xaSk=
X-Google-Smtp-Source: ABdhPJzkDBKMlWGODQ7vhVJxJTApq/ZqQSCoNueUGeAV+DzpPPzNyu6YdurzYrkgR+x4AgbWiNBV47ucQPIR8Op1dUE=
X-Received: by 2002:a19:f512:: with SMTP id j18mr1461994lfb.684.1635109945129; 
 Sun, 24 Oct 2021 14:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211021064029.31168-1-peter@korsgaard.com>
 <20211024161541.3258ff38@windsurf>
 <87zgqyxxwi.fsf@dell.be.48ers.dk> <87v91mxxdt.fsf@dell.be.48ers.dk>
In-Reply-To: <87v91mxxdt.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Oct 2021 23:10:51 +0200
Message-ID: <CAPi7W834b_zZD6EQzTJ1TyjrqD3wuUXYfhiPuopN8-Y+r7dNvQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.21.1
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
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMZSBkaW0uIDI0IG9jdC4gMjAyMSDDoCAxNzoyMCwgUGV0ZXIgS29yc2dhYXJkIDxwZXRl
ckBrb3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6Cj4KPiA+Pj4+PiAiUGV0ZXIiID09IFBldGVyIEtv
cnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JpdGVzOgo+Cj4gSGksCj4KPiAgPj4+IEZp
eGVzIHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgaXNzdWVzOgo+Cj4gID4+IEkgaGF2ZSBhcHBsaWVk
IHRvIG1hc3RlciwgYnV0IHdoYXQncyBxdWl0ZSB3b3JyeWluZyBpcyB0aGF0IHRoZXJlIHdlcmUK
PiAgPj4gMCBDVkVzIGFmZmVjdGluZyBhc3RlcmlzayBpbiB2ZXJzaW9uIDE2LjE0LjEgYWNjb3Jk
aW5nIHRvCj4gID4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9zdGF0cy9tYXN0ZXIu
aHRtbC4gRG9lcyB0aGlzIG1lYW4gdGhhdAo+ICA+PiB0aGUgQXN0ZXJpc2sgY29tbXVuaXR5IGlz
IG5vdCBzdWJtaXR0aW5nIENWRXMgZm9yIHRoZWlyIHNlY3VyaXR5Cj4gID4+IHZ1bG5lcmFiaWxp
dGllcyA/Cj4KPiAgPiBMb29rcyBsaWtlIGl0LiBJIGFsc28gZGlkbid0IGZpbmQgYW55IENWRSBy
ZWZlcmVuY2VzIGluIHRoZSBkZXNjcmlwdGlvbgo+ICA+IG9mIHRoZSBpc3N1ZXMgSSBsaXN0ZWQg
Oi8KPgo+IExvb2tpbmcgY2xvc2VyLCB0aGVyZSBhcmUgaW4gZmFjdCBDVkVzIGZvciBzb21lIG9m
IHRoZSBpc3N1ZXMsIEUuRy46Cj4KPiBodHRwczovL2Rvd25sb2Fkcy5hc3Rlcmlzay5vcmcvcHVi
L3NlY3VyaXR5L0FTVC0yMDIxLTAwMS5odG1sCj4KPiBCdXQgdGhhdCByZWZlcnMgdG8gYSBkaWdp
dW06YXN0ZXJpc2sgQ1BFIHJhdGhlciB0aGFuIHRoZQo+IGFzdGVyaXNrOm9wZW5fc291cmNlIG9u
ZSB3ZSBsb29rIGZvci4KPgo+IExvb2tpbmcgYXQgdGhlIENQRSBkYXRhYmFzZSwgd2Ugc2hvdWxk
IHByb2JhYmx5IHVzZSB0aGF0IENQRSBpZGVudGlmaWVyCj4gaW5zdGVhZCBhcyBpdCBsb29rcyBt
dWNoIG1vcmUgYWN0aXZlbHkgdXNlZCAoMTE1NCBlbnRyaWVzIHZzIDYxKToKPgo+IGh0dHBzOi8v
bnZkLm5pc3QuZ292L3Byb2R1Y3RzL2NwZS9zZWFyY2gvcmVzdWx0cz9uYW1pbmdGb3JtYXQ9Mi4z
JmtleXdvcmQ9Y3BlJTNBMi4zJTNBYSUzQWRpZ2l1bSUzQWFzdGVyaXNrJTNBKiUzQSolM0EqJTNB
KiUzQSolM0EqJTNBKiUzQSoKPgo+IGh0dHBzOi8vbnZkLm5pc3QuZ292L3Byb2R1Y3RzL2NwZS9z
ZWFyY2gvcmVzdWx0cz9uYW1pbmdGb3JtYXQ9Mi4zJmtleXdvcmQ9Y3BlJTNBMi4zJTNBYSUzQWFz
dGVyaXNrJTNBb3Blbl9zb3VyY2UlM0EqJTNBKiUzQSolM0EqJTNBKiUzQSolM0EqJTNBKgo+Cj4g
RmFicmljZSwgeW91IGFkZGVkIHRoZSBDUEUgdmFyaWFibGVzIGZvciBhc3Rlcmlzay4gQW55IHNw
ZWNpZmljIHJlYXNvbgo+IHRvIHVzZSBhc3Rlcmlzay9vcGVuX3NvdXJjZT8KTm8gc3BlY2lmaWMg
cmVhc29uLCBJIG1pc3NlZCB0aGF0IHRoZSBkaWdpdW0gZW50cnkgd2FzIG1vcmUgdXAgdG8gZGF0
ZS4KPgo+IC0tCj4gQnllLCBQZXRlciBLb3JzZ2FhcmQKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
