Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B72C12002
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 07:21:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A2E661029
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 07:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A2E661029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aleksander.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B833D83077;
	Wed, 21 Jul 2021 07:21:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbbEWyGEx36s; Wed, 21 Jul 2021 07:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D71F783022;
	Wed, 21 Jul 2021 07:21:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3EF61BF423
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 07:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D309A40138
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 07:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aleksander-es.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzcLV55I-5yU for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 07:21:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A7FD400D7
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 07:21:05 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 t4-20020a05683014c4b02904cd671b911bso1258836otq.1
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 00:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NJOEU2EsbQpdX0h2dK9qWjOeTFik3WxFa/gpTdTMAUI=;
 b=kGOsPy4I/e3pq0rljgp0ydowLIDw7bxqQ5LnIliwRrDa+8nnR4xy1PdWV2tUZj+vxn
 nTEzOmcsx0f2ZezDQRJl5cVatFfhommM4WuG3k8qFIUjQGjosddKQ1ZQOh0uWM/fPmUK
 loE5ua9lYSDGetspBazXYeqFrJteVaxAWwqK350n1CRs1uv3NcAvatwIAyYep5gxfobd
 uUSn0ZNgFGZ4Kster2TMAC3bp3bbO+AMGEqI/7Cb7uoeFuKx+8Fqv9JzghOH7HhsR6ZH
 9kjQZIL6VeSgIRY66gS0R2teXrRBxYCovlANXjtlLclgJQ6VNbp5SbscTmAmLQLASHT6
 yEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NJOEU2EsbQpdX0h2dK9qWjOeTFik3WxFa/gpTdTMAUI=;
 b=KxofhYevqqzlRzSy/w/Yj0cHRXvFfIoFjJaWGbhv2o5IFR1fuU3Mrl3IZkZheFRpua
 1uy35jcNn9lJbG74o5qDgs+WpLiLK3OwU/WGY1GbXxkJP4lf6t6MpaNijVhQBI2wN9rQ
 nkoKbr7VqpCA54PxL92Q3HZVLvAhdJAA9I/gT/WT3KUmgpHmEAtYAKts/CDmDCLytsay
 cQRzeuhoo60Jt7fTo1etahiJVVbIHqM0EeGtqLMKsozgNzy065dbZ+YK1uJ9tbvTpLHt
 C4MgjW8P1T7NK3vufrs6jnDULCE19hN5GlzU4VSktylW7wrUIGm6J3gx+ri+r48QE3EA
 IL1Q==
X-Gm-Message-State: AOAM533AnoSjx/rzrcFVK9u0oigLCF6xA1o6alYV4umQlG+ZQ05wLuVX
 TVdqR1BFSjdetFQVEqCj50aW14MMypOJiY5s/myYAQ==
X-Google-Smtp-Source: ABdhPJxXcvo3L46duTP1LI0mvKSGJeXDC7S703ojvK/oPa8i2EYl/DSTljimCyu2J0mW7BjaGDpSe7GXoNF2xhnCEW0=
X-Received: by 2002:a05:6830:3143:: with SMTP id
 c3mr10410513ots.229.1626852064660; 
 Wed, 21 Jul 2021 00:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210712091827.335522-1-aleksander@aleksander.es>
 <20210716225449.382c1426@windsurf>
 <CAGm1_kuFhe7U+qYMRiPP2htmfCDR4kmOKFaX0Vnsfh0XvSQVUA@mail.gmail.com>
 <CAAP7ucKbpPfUROc=rm2U4idc23+MOC8TJ405Qxf-M5CkHnz=TQ@mail.gmail.com>
 <CAGm1_kvyEXaH8ZpZZdq5fWJw2ZDrtXS7ZxE4sDRO_uYQ1aKfvQ@mail.gmail.com>
 <CAAP7uc+0Q9w7UJxRQJLtX7t+7cPh+zHF2dqRGWLOqzT6j8Sf8g@mail.gmail.com>
 <CAGm1_kuTdXuZs=ajf2YGu=pUu+caErdMtMbZ8s2D=Ac_oe=WDw@mail.gmail.com>
 <CAAP7ucLkz=OSXLN+UhpDPEcyNDfnX_deodsQK87iMi9_LiEnyA@mail.gmail.com>
 <CAGm1_ksDv2Kuk_s4+NP3Uc8VxBTLcnpDckLyBz6y_hoAWpasAA@mail.gmail.com>
 <CAGm1_ktaWo27F0zNigOOYV7yoMoqGRta_mifiCK0+REB=QYbfw@mail.gmail.com>
In-Reply-To: <CAGm1_ktaWo27F0zNigOOYV7yoMoqGRta_mifiCK0+REB=QYbfw@mail.gmail.com>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Wed, 21 Jul 2021 09:20:53 +0200
Message-ID: <CAAP7ucJ6RHQVuAsXYztzv1ZeGXBusg0VQ=PqKUW2yvS38tTRng@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: multipart/mixed; boundary="0000000000006ab6dc05c79d034e"
Subject: Re: [Buildroot] [PATCH] package/libmbim: bump to version 1.24.8
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--0000000000006ab6dc05c79d034e
Content-Type: text/plain; charset="UTF-8"

Hey,

> INTROSPECTION_MAKEFILE is the problem. If I replace the path to the
> path inside my BR, everything is working (the same issue is with
> Qmi-1.0.typelib).
>

The introspection.m4 included in the sources is a bit outdated, the
attached patch syncs it with the newest one I have installed in my
system. I do see some fixes in the INTROSPECTION_MAKEFILE definition
in the patch, so these may be enough. Any chance you can give this
patch a try? You may need to force autoreconf as we're patching a m4
file-


-- 
Aleksander
https://aleksander.es

--0000000000006ab6dc05c79d034e
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-build-fix-introspection-setup-in-cross-builds.patch"
Content-Disposition: attachment; 
	filename="0001-build-fix-introspection-setup-in-cross-builds.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_krd5peil0>
X-Attachment-Id: f_krd5peil0

RnJvbSBkMDUxMjEwYzNiMzU5NjIzOTNmMGZjOWQ5MzQ0MzViMjA3NDNiZWJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGVrc2FuZGVyIE1vcmdhZG8gPGFsZWtzYW5kZXJAYWxla3Nh
bmRlci5lcz4KRGF0ZTogV2VkLCAyMSBKdWwgMjAyMSAwOToxNzo1MyArMDIwMApTdWJqZWN0OiBb
UEFUQ0hdIGJ1aWxkOiBmaXggaW50cm9zcGVjdGlvbiBzZXR1cCBpbiBjcm9zcyBidWlsZHMKCi0t
LQogbTQvaW50cm9zcGVjdGlvbi5tNCB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbTQvaW50cm9zcGVjdGlvbi5tNCBiL200L2ludHJvc3Bl
Y3Rpb24ubTQKaW5kZXggNjFmMGNjMy4uYjBjY2Q2OCAxMDA2NDQKLS0tIGEvbTQvaW50cm9zcGVj
dGlvbi5tNAorKysgYi9tNC9pbnRyb3NwZWN0aW9uLm00CkBAIC04LDYgKzgsNDcgQEAgZG5sCiAK
ICMgc2VyaWFsIDEKIAorZG5sIFRoaXMgaXMgYSBjb3B5IG9mIEFTX0FDX0VYUEFORAorZG5sCitk
bmwgKEMpIDIwMDMsIDIwMDQsIDIwMDUgVGhvbWFzIFZhbmRlciBTdGljaGVsZSA8dGhvbWFzIGF0
IGFwZXN0YWFydCBkb3Qgb3JnPgorZG5sIENvcHlpbmcgYW5kIGRpc3RyaWJ1dGlvbiBvZiB0aGlz
IGZpbGUsIHdpdGggb3Igd2l0aG91dCBtb2RpZmljYXRpb24sCitkbmwgYXJlIHBlcm1pdHRlZCBp
biBhbnkgbWVkaXVtIHdpdGhvdXQgcm95YWx0eSBwcm92aWRlZCB0aGUgY29weXJpZ2h0Citkbmwg
bm90aWNlIGFuZCB0aGlzIG5vdGljZSBhcmUgcHJlc2VydmVkLgorbTRfZGVmaW5lKFtfR09CSkVD
VF9JTlRST1NQRUNUSU9OX0FTX0FDX0VYUEFORF0sCitbCisgIEVYUF9WQVI9WyQxXQorICBGUk9N
X1ZBUj1bJDJdCisKKyAgZG5sIGZpcnN0IGV4cGFuZCBwcmVmaXggYW5kIGV4ZWNfcHJlZml4IGlm
IG5lY2Vzc2FyeQorICBwcmVmaXhfc2F2ZT0kcHJlZml4CisgIGV4ZWNfcHJlZml4X3NhdmU9JGV4
ZWNfcHJlZml4CisKKyAgZG5sIGlmIG5vIHByZWZpeCBnaXZlbiwgdGhlbiB1c2UgL3Vzci9sb2Nh
bCwgdGhlIGRlZmF1bHQgcHJlZml4CisgIGlmIHRlc3QgIngkcHJlZml4IiA9ICJ4Tk9ORSI7IHRo
ZW4KKyAgICBwcmVmaXg9IiRhY19kZWZhdWx0X3ByZWZpeCIKKyAgZmkKKyAgZG5sIGlmIG5vIGV4
ZWNfcHJlZml4IGdpdmVuLCB0aGVuIHVzZSBwcmVmaXgKKyAgaWYgdGVzdCAieCRleGVjX3ByZWZp
eCIgPSAieE5PTkUiOyB0aGVuCisgICAgZXhlY19wcmVmaXg9JHByZWZpeAorICBmaQorCisgIGZ1
bGxfdmFyPSIkRlJPTV9WQVIiCisgIGRubCBsb29wIHVudGlsIGl0IGRvZXNuJ3QgY2hhbmdlIGFu
eW1vcmUKKyAgd2hpbGUgdHJ1ZTsgZG8KKyAgICBuZXdfZnVsbF92YXI9ImBldmFsIGVjaG8gJGZ1
bGxfdmFyYCIKKyAgICBpZiB0ZXN0ICJ4JG5ld19mdWxsX3ZhciIgPSAieCRmdWxsX3ZhciI7IHRo
ZW4gYnJlYWs7IGZpCisgICAgZnVsbF92YXI9JG5ld19mdWxsX3ZhcgorICBkb25lCisKKyAgZG5s
IGNsZWFuIHVwCisgIGZ1bGxfdmFyPSRuZXdfZnVsbF92YXIKKyAgQUNfU1VCU1QoWyQxXSwgIiRm
dWxsX3ZhciIpCisKKyAgZG5sIHJlc3RvcmUgcHJlZml4IGFuZCBleGVjX3ByZWZpeAorICBwcmVm
aXg9JHByZWZpeF9zYXZlCisgIGV4ZWNfcHJlZml4PSRleGVjX3ByZWZpeF9zYXZlCitdKQorCiBt
NF9kZWZpbmUoW19HT0JKRUNUX0lOVFJPU1BFQ1RJT05fQ0hFQ0tfSU5URVJOQUxdLAogWwogICAg
IEFDX0JFRk9SRShbQUNfUFJPR19MSUJUT09MXSxbJDBdKWRubCBzZXR1cCBsaWJ0b29sIGZpcnN0
CkBAIC01MCwyMCArOTEsMjUgQEAgbTRfZGVmaW5lKFtfR09CSkVDVF9JTlRST1NQRUNUSU9OX0NI
RUNLX0lOVEVSTkFMXSwKIAogICAgIEFDX01TR19SRVNVTFQoWyRmb3VuZF9pbnRyb3NwZWN0aW9u
XSkKIAorICAgIGRubCBleHBhbmQgZGF0YWRpci9saWJkaXIgc28gd2UgY2FuIHBhc3MgdGhlbSB0
byBwa2ctY29uZmlnCisgICAgZG5sIGFuZCBnZXQgcGF0aHMgcmVsYXRpdmUgdG8gb3VyIHRhcmdl
dCBkaXJlY3RvcmllcworICAgIF9HT0JKRUNUX0lOVFJPU1BFQ1RJT05fQVNfQUNfRVhQQU5EKF9H
SV9FWFBfREFUQURJUiwgIiRkYXRhZGlyIikKKyAgICBfR09CSkVDVF9JTlRST1NQRUNUSU9OX0FT
X0FDX0VYUEFORChfR0lfRVhQX0xJQkRJUiwgIiRsaWJkaXIiKQorCiAgICAgSU5UUk9TUEVDVElP
Tl9TQ0FOTkVSPQogICAgIElOVFJPU1BFQ1RJT05fQ09NUElMRVI9CiAgICAgSU5UUk9TUEVDVElP
Tl9HRU5FUkFURT0KICAgICBJTlRST1NQRUNUSU9OX0dJUkRJUj0KICAgICBJTlRST1NQRUNUSU9O
X1RZUEVMSUJESVI9CiAgICAgaWYgdGVzdCAieCRmb3VuZF9pbnRyb3NwZWN0aW9uIiA9ICJ4eWVz
IjsgdGhlbgotICAgICAgIElOVFJPU1BFQ1RJT05fU0NBTk5FUj1gJFBLR19DT05GSUcgLS12YXJp
YWJsZT1nX2lyX3NjYW5uZXIgZ29iamVjdC1pbnRyb3NwZWN0aW9uLTEuMGAKLSAgICAgICBJTlRS
T1NQRUNUSU9OX0NPTVBJTEVSPWAkUEtHX0NPTkZJRyAtLXZhcmlhYmxlPWdfaXJfY29tcGlsZXIg
Z29iamVjdC1pbnRyb3NwZWN0aW9uLTEuMGAKLSAgICAgICBJTlRST1NQRUNUSU9OX0dFTkVSQVRF
PWAkUEtHX0NPTkZJRyAtLXZhcmlhYmxlPWdfaXJfZ2VuZXJhdGUgZ29iamVjdC1pbnRyb3NwZWN0
aW9uLTEuMGAKLSAgICAgICBJTlRST1NQRUNUSU9OX0dJUkRJUj1gJFBLR19DT05GSUcgLS12YXJp
YWJsZT1naXJkaXIgZ29iamVjdC1pbnRyb3NwZWN0aW9uLTEuMGAKLSAgICAgICBJTlRST1NQRUNU
SU9OX1RZUEVMSUJESVI9IiQoJFBLR19DT05GSUcgLS12YXJpYWJsZT10eXBlbGliZGlyIGdvYmpl
Y3QtaW50cm9zcGVjdGlvbi0xLjApIgorICAgICAgIElOVFJPU1BFQ1RJT05fU0NBTk5FUj0kUEtH
X0NPTkZJR19TWVNST09UX0RJUmAkUEtHX0NPTkZJRyAtLXZhcmlhYmxlPWdfaXJfc2Nhbm5lciBn
b2JqZWN0LWludHJvc3BlY3Rpb24tMS4wYAorICAgICAgIElOVFJPU1BFQ1RJT05fQ09NUElMRVI9
JFBLR19DT05GSUdfU1lTUk9PVF9ESVJgJFBLR19DT05GSUcgLS12YXJpYWJsZT1nX2lyX2NvbXBp
bGVyIGdvYmplY3QtaW50cm9zcGVjdGlvbi0xLjBgCisgICAgICAgSU5UUk9TUEVDVElPTl9HRU5F
UkFURT0kUEtHX0NPTkZJR19TWVNST09UX0RJUmAkUEtHX0NPTkZJRyAtLXZhcmlhYmxlPWdfaXJf
Z2VuZXJhdGUgZ29iamVjdC1pbnRyb3NwZWN0aW9uLTEuMGAKKyAgICAgICBJTlRST1NQRUNUSU9O
X0dJUkRJUj1gJFBLR19DT05GSUcgLS1kZWZpbmUtdmFyaWFibGU9ZGF0YWRpcj0iJHtfR0lfRVhQ
X0RBVEFESVJ9IiAtLXZhcmlhYmxlPWdpcmRpciBnb2JqZWN0LWludHJvc3BlY3Rpb24tMS4wYAor
ICAgICAgIElOVFJPU1BFQ1RJT05fVFlQRUxJQkRJUj0iJCgkUEtHX0NPTkZJRyAtLWRlZmluZS12
YXJpYWJsZT1saWJkaXI9IiR7X0dJX0VYUF9MSUJESVJ9IiAtLXZhcmlhYmxlPXR5cGVsaWJkaXIg
Z29iamVjdC1pbnRyb3NwZWN0aW9uLTEuMCkiCiAgICAgICAgSU5UUk9TUEVDVElPTl9DRkxBR1M9
YCRQS0dfQ09ORklHIC0tY2ZsYWdzIGdvYmplY3QtaW50cm9zcGVjdGlvbi0xLjBgCiAgICAgICAg
SU5UUk9TUEVDVElPTl9MSUJTPWAkUEtHX0NPTkZJRyAtLWxpYnMgZ29iamVjdC1pbnRyb3NwZWN0
aW9uLTEuMGAKLSAgICAgICBJTlRST1NQRUNUSU9OX01BS0VGSUxFPWAkUEtHX0NPTkZJRyAtLXZh
cmlhYmxlPWRhdGFkaXIgZ29iamVjdC1pbnRyb3NwZWN0aW9uLTEuMGAvZ29iamVjdC1pbnRyb3Nw
ZWN0aW9uLTEuMC9NYWtlZmlsZS5pbnRyb3NwZWN0aW9uCisgICAgICAgSU5UUk9TUEVDVElPTl9N
QUtFRklMRT0kUEtHX0NPTkZJR19TWVNST09UX0RJUmAkUEtHX0NPTkZJRyAtLXZhcmlhYmxlPWRh
dGFkaXIgZ29iamVjdC1pbnRyb3NwZWN0aW9uLTEuMGAvZ29iamVjdC1pbnRyb3NwZWN0aW9uLTEu
MC9NYWtlZmlsZS5pbnRyb3NwZWN0aW9uCiAgICAgZmkKICAgICBBQ19TVUJTVChJTlRST1NQRUNU
SU9OX1NDQU5ORVIpCiAgICAgQUNfU1VCU1QoSU5UUk9TUEVDVElPTl9DT01QSUxFUikKQEAgLTk0
LDQgKzE0MCwzIEBAIEFDX0RFRlVOKFtHT0JKRUNUX0lOVFJPU1BFQ1RJT05fUkVRVUlSRV0sCiBb
CiAgIF9HT0JKRUNUX0lOVFJPU1BFQ1RJT05fQ0hFQ0tfSU5URVJOQUwoWyQxXSwgW3JlcXVpcmVd
KQogXSkKLQotLSAKMi4zMi4wCgo=
--0000000000006ab6dc05c79d034e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--0000000000006ab6dc05c79d034e--
