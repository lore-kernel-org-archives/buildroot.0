Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2801C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 15:21:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91D0B610A0
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 15:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91D0B610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4652460854;
	Wed, 27 Oct 2021 15:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjqQhaoyoa2c; Wed, 27 Oct 2021 15:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EEFA6084C;
	Wed, 27 Oct 2021 15:21:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 202981BF31A
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 15:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E67D40257
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 15:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vVM3x9Z7YljU for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 15:21:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 254B84010B
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 15:21:42 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id 205so5258172ljf.9
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 08:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=TvVj234tauLfopJRnwcGgpUzDqRp+bJx8NZwsSfK6oM=;
 b=ckrOXC4rpTxno0TCE+gMYPOnOIjzsuKFHfp6xaHsJ/thf7zLD2a2EJpfMMKJfYtPZq
 VUhpOnv4VHhdU/uBPyKVce8Q1IJTzf/tVDsTsrpshAm4SNQ43r5B5kmejVh4z74bm4gF
 kuFZesZfzFag0HvnmsLGBMbMD1xZNQtb7X1aqygYhAoLSAoQqvwPPF2QzOKQ1wQmuNBZ
 uZljAqFac/LqdPAraqOZU8KBHzRF7gtyOUNmQOv27RwtcG8IhOkWA5xhvQdBboiZ8Poq
 TmCEMTCQMfF/zt865GSGhraestH/etW1zigiO75lnIKbd/WDKBt2UFj622CQggoT25io
 YOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=TvVj234tauLfopJRnwcGgpUzDqRp+bJx8NZwsSfK6oM=;
 b=QQtuHM59/sKEEGsUIwB0L8gwJgw0yBHPb7c8wCDfBns2fD28NqLn+eyWX9wYtl1rBp
 aHBt8KuwFI5lCbiumHbi6vG4M+s8J7uokk6oiR3xiSZ41najmJLu24ySmkC+13ANzIfH
 s8ysdf96V4rBwGIVSxOnPnv2hVy693hF2a0BIeyrlrbF5p7hzL/XIMfOskCguDLk1Bfe
 ceeXwtnGRGR/I6aksfYJXWC/rjnF9Wx2pDAMJCoEAfCrat8IcBTYFy9FpFdlXxtMWc2R
 Jbsgsuq0aoiZy3bJijQBpOYGvZcPvwjH+TPdFG0SPahWzi7JKhojcZEMou0zK6hbXzjG
 HjmQ==
X-Gm-Message-State: AOAM533srACy1pomM6V7IzawIYgs/LRIAGA1l0eNACTbbCvRX10hxhOy
 ZQI9MWjQhMFsD2W2l7F8Rxx/j2EsnU4=
X-Google-Smtp-Source: ABdhPJzix8YAHH+qBinqsSfD719yoPXwkWKb+5mmmuGe6MtGvKh6pAHEjFhDXrMio4DgdliT8kQ+Jw==
X-Received: by 2002:a05:651c:1304:: with SMTP id
 u4mr34158497lja.136.1635348099432; 
 Wed, 27 Oct 2021 08:21:39 -0700 (PDT)
Received: from [10.0.196.136] ([176.10.248.197])
 by smtp.googlemail.com with ESMTPSA id d20sm25909lfv.117.2021.10.27.08.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:21:38 -0700 (PDT)
To: Arnout Vandecappelle <arnout@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211018214727.1514701-1-fontaine.fabrice@gmail.com>
 <56769cf6-a027-636e-887b-e562a71c627e@mind.be>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <fe858f43-077d-a470-2cc4-d4a09acbd590@gmail.com>
Date: Wed, 27 Oct 2021 17:21:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <56769cf6-a027-636e-887b-e562a71c627e@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/smcroute: don't override
 dependencies
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6548983226315899042=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6548983226315899042==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0K3nEqR002wJDhsZfVRRZ2ZRRyL9QbZQC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0K3nEqR002wJDhsZfVRRZ2ZRRyL9QbZQC
Content-Type: multipart/mixed; boundary="WClnBCbXE4Xp5PX03qg9A8klHo7o8kHYq";
 protected-headers="v1"
From: Joachim Wiberg <troglobit@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <fe858f43-077d-a470-2cc4-d4a09acbd590@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/smcroute: don't override
 dependencies
References: <20211018214727.1514701-1-fontaine.fabrice@gmail.com>
 <56769cf6-a027-636e-887b-e562a71c627e@mind.be>
In-Reply-To: <56769cf6-a027-636e-887b-e562a71c627e@mind.be>

--WClnBCbXE4Xp5PX03qg9A8klHo7o8kHYq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/25/21 10:16 PM, Arnout Vandecappelle wrote:
> On 18/10/2021 23:47, Fabrice Fontaine wrote:
>> Don't override SMCROUTE_DEPENDENCIES in a conditional
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>=20
> =C2=A0Applied to master, thanks.

Awesome, thank you Fabrice for finding this!

Regards
 /Joachim



--WClnBCbXE4Xp5PX03qg9A8klHo7o8kHYq--

--0K3nEqR002wJDhsZfVRRZ2ZRRyL9QbZQC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE3gkxgy2/gzkZH7KyLCqwqW4MR1gFAmF5boEFAwAAAAAACgkQLCqwqW4MR1jG
+wgAjGpexaAYs9+xD5jOKQYfshGlSaE2bSIEgP9Jr+KqKzDURAF72nm+lYtRiA+DV4OUANzZ0fU1
OoV6jpxirzvs2CLMN0PMnOI7y7yFGmVEFoDM1qG1s9rXuL5L/EBjP6WMhn1/wseU9roZ1KrjvQZ2
VOTWHpzZzIdqFUl9e8zijkk9OZ/ZupZn77fnUPYAcG7wrtQMh7tjE7IAbNc4yNT6krl9MFZru7ZX
v2HU7mMOUUcRCLv7AcMSp0WsdhJJjOY86tyQGj3VO7D9BjG22xHMfj3bh86Z0LiFZhkakey8ug2y
z7fBE6nv+NzYTPf++0EaBI0FhA2pS9M1qBgI0edhEA==
=KkNl
-----END PGP SIGNATURE-----

--0K3nEqR002wJDhsZfVRRZ2ZRRyL9QbZQC--

--===============6548983226315899042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6548983226315899042==--
