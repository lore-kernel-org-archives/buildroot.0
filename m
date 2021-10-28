Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52E1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 04:31:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F29361056
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 04:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F29361056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B532060689;
	Thu, 28 Oct 2021 04:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gTISlFe4ZYzC; Thu, 28 Oct 2021 04:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E26C560682;
	Thu, 28 Oct 2021 04:31:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D07121BF27C
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 04:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEA7E60682
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 04:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NAe5EDuS04U3 for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 04:31:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBAA26060E
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 04:31:19 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id x27so10806078lfu.5
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 21:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to; bh=5P0fsPfpuK/DaIbNFyD9fYDP1P4cWeS0ifab4SFU8Hc=;
 b=ScEuba5rjzdn+bb0JRNdTKO+m0XoCOQlDeMtOvGVUvNztwSBpE67aqwnlKGpuiKP3m
 Gn4ZwTnc3MU0A+HoQ07lFxtMc36O3AE49vrIsDLSaywwfkNZ+xfSr20AIW/YGLUklUhJ
 d/b1vZILrQHzqcY19y1dbtGs2+M+IXCP6AoNOI6TAYodpQTJMazzOIDSdB6cMfNlp3RA
 iNxtGz5+rxRu6qf0WpOsxPuvBqylrDlBAWRiiyqMX3ntU8yECByDxNuudN1wdOSVGl9n
 ZZBWGdTEW5hwxxKwd9X3RtEWia8nUGAEvyNKabvT6c72BLTgWshnrR/JPDHHyB9uXpUq
 8Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=5P0fsPfpuK/DaIbNFyD9fYDP1P4cWeS0ifab4SFU8Hc=;
 b=FnCSaMVPOEwyJQEmD3JK9bPjcWyCwaDbFAb5XZQeKZ98VOqt8J/VLwIeTKafNbmveZ
 y7tYOsM/NtoTRAXxLcOlQ/enAivM0lTPtKIZI1WJE85EAj9+ztHI6xl89dp1exL6uovV
 gFpWMEcRo42BDxahY2/AydOFru09hNWdIiZy6PtT5lnlknXsHqYI59xdYxB7M6V/mNuz
 GYXQMJnCISm+Qh6F/wPwMU3IOG1D+UCoE223RVI6bL7MsqrTtqWNGpaqYRViybN48QFG
 cgdoeAH99LkU9fzfz2flpMiwlYSevdjByuSZQLyfAy8jtilOCRCCKu4c3kRBGU/bt/DH
 NRIw==
X-Gm-Message-State: AOAM531O6112aGN6dWiIB5F0o+lN+pF5GCzGahfgavyzTJSWcL3VcMc2
 hYHeQa/ME4LO6LlIYuN7EQKekJky300=
X-Google-Smtp-Source: ABdhPJzssrko0SvkNIcOZTytiT/xoM3LVTXnPGF/Ji58Y0Cu+vkz/fU9/TP2vM6VkK5zuOOZnJbJaQ==
X-Received: by 2002:ac2:5fea:: with SMTP id s10mr1871351lfg.652.1635395477355; 
 Wed, 27 Oct 2021 21:31:17 -0700 (PDT)
Received: from [10.0.196.136] ([176.10.248.197])
 by smtp.googlemail.com with ESMTPSA id u7sm167516ljh.49.2021.10.27.21.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 21:31:16 -0700 (PDT)
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20211010154941.1093769-1-troglobit@gmail.com>
 <9079d075-d4a0-b67e-d617-97f32e26e28a@mind.be>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <e995569c-a4be-2562-dff9-52c7816dd065@gmail.com>
Date: Thu, 28 Oct 2021 06:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9079d075-d4a0-b67e-d617-97f32e26e28a@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/watchdogd: new package
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
Content-Type: multipart/mixed; boundary="===============7188973932218055661=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7188973932218055661==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7OwhwVqVo6pof5XejqgYH9EFlaelmXMFe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7OwhwVqVo6pof5XejqgYH9EFlaelmXMFe
Content-Type: multipart/mixed; boundary="B55hA0xX1yr8qY3jszN00Lq7iIfBdFrdp";
 protected-headers="v1"
From: Joachim Wiberg <troglobit@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Message-ID: <e995569c-a4be-2562-dff9-52c7816dd065@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/watchdogd: new package
References: <20211010154941.1093769-1-troglobit@gmail.com>
 <9079d075-d4a0-b67e-d617-97f32e26e28a@mind.be>
In-Reply-To: <9079d075-d4a0-b67e-d617-97f32e26e28a@mind.be>

--B55hA0xX1yr8qY3jszN00Lq7iIfBdFrdp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/27/21 10:13 PM, Arnout Vandecappelle wrote:
> On 10/10/2021 17:49, Joachim Wiberg wrote:
>> [snip]
> =C2=A0Applied to master, thanks, with changes specified below.

Awesome, thank you! :)

>> [snip]
>> +config BR2_PACKAGE_WATCHDOGD_TEST_SUITE
>> +=C2=A0=C2=A0=C2=A0 bool "Enable watchdogctl test cases"
>> +=C2=A0=C2=A0=C2=A0 default y
> =C2=A0This doesn't sound like something you'd want enabled by default, =
so I
> removed the "default y".

Of course, sorry about that!  I was sure I had filtered out all of our
old cruft from the $DAYJOB packaging.

>> +config BR2_PACKAGE_WATCHDOGD_GENERIC_POLL
>> +=C2=A0=C2=A0=C2=A0 int "Generic script monitor poll interval (sec)"
>> +=C2=A0=C2=A0=C2=A0 default "300"
>> +=C2=A0=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Poll interval for generic script monit=
or, in seconds.=C2=A0 A value
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of zero (0) disables the monitor.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default: 300 seconds
> =C2=A0We normally don't have such Default: entries in the help text. It=
's
> kind of pointless IMHO.

Ack!  I'm still getting accustomed to the nice new kconfig build
system.  So shiny :)

> [snip]
>> +define WATCHDOGD_INSTALL_INIT_SYSV
>> +=C2=A0=C2=A0=C2=A0 $(INSTALL) -D -m 0755 package/watchdogd/S01watchdo=
gd \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(TARGET_DIR)/etc/init.d/S=
01watchdogd
>> +endef
>> +
>> +define WATCHDOGD_INSTALL_INIT_SYSTEMD
>> +=C2=A0=C2=A0=C2=A0 $(INSTALL) -D -m 644 $(WATCHDOGD_PKGDIR)/watchdogd=
=2Eservice \
> =C2=A0WATCHDOGD_PKGDIR is package/watchdog. You want WATCHDOGD_SRCDIR h=
ere.

Love your attention to detail.  Much appreciated you took the time to
clean up my mess!

Best regards
 /Joachim



--B55hA0xX1yr8qY3jszN00Lq7iIfBdFrdp--

--7OwhwVqVo6pof5XejqgYH9EFlaelmXMFe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE3gkxgy2/gzkZH7KyLCqwqW4MR1gFAmF6J5MFAwAAAAAACgkQLCqwqW4MR1gM
+gf/WaEu59s/z1MCNL7QEgHb0+s6ZzPVK65HTUdPP83GdGC5P+M2qd9bfix1TGKumqbY4ld46v+u
EwtU3rwm8cZxGxLO6OKwmJu78C4sWsA3Bo9YQ5+ytgk8ooZtCsPB9FnE2yiL6KuSHsibs5DYrhMc
n/bsrHOXNqE8BAnwJolawLWLp9IWtzHH4L/bIfRmtn+TYUy4bQI7dQsiQ9SYH8n2VT843hPAM6Yw
QhOcnWu/qN7XAQrOnm7o5IXn7bXUcvb0oivoA4DgLBqCmGDipud+rbOPn2rfBcWnSCg+veDbshpn
eJ3+C3vf9adg96ywc8tSQAA2Q6J/Z+l28UAtu+n7yg==
=yyUC
-----END PGP SIGNATURE-----

--7OwhwVqVo6pof5XejqgYH9EFlaelmXMFe--

--===============7188973932218055661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7188973932218055661==--
