Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48129C433FE
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 23:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C546040B53;
	Wed,  5 Oct 2022 23:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C546040B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wwj5GiG9ovb5; Wed,  5 Oct 2022 23:28:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E07DC40B52;
	Wed,  5 Oct 2022 23:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E07DC40B52
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5241BF2CD
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 23:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06A9960FEB
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 23:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06A9960FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ONmnavKxf_Mr for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 23:28:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D54960FCB
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D54960FCB
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 23:28:14 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 s1-20020a4a81c1000000b0047d5e28cdc0so301301oog.12
 for <buildroot@buildroot.org>; Wed, 05 Oct 2022 16:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=ZKkwiRmlvc0rj67FoKYFARBMKai8m2ua+j/ywHGRYvY=;
 b=KJ8/MZnOw7sgsq8MfzhSti4CXrBVYBTL2/eGqc9jj7XZo/ad0Tac7TCBSTX/vNEYyB
 jORak9SIf83uQH3qvA+pryfJkznFlRXTB3dTUWZOM9p0aTNA8fFgNGqwUIRcboZNrRZH
 +3cdIpo3uaqdgHKfzxuK198rGRCljmVzs1dIsCkHlkDOxUM1ii4dCcu+h8xBEykeTikM
 9Qctlk/2jvILbP9Ta0FLDQl99QmbS/gSJymp8wGxlgOG6G2xgFdc4UpcqrtarcjSk7QV
 BVVEWGFi/pB/K/sJjxS7cviIeQ2pQtb0lljAvnzIn5c09sFq2h0njUqtV05tIKFEBzvq
 Cdrg==
X-Gm-Message-State: ACrzQf2OC94mo6QzHIExEFKMa6xErakrDcrsX6k7reV4tTwfpsWZi9ZL
 jH339GtmdC0JzfHi1pue1H4cXq2sgm+Dty0R3M/mhqBLprPJlQ==
X-Google-Smtp-Source: AMsMyM4p/Uotx9lW8hDid3ikNHbhOrcYqXeRSCuSeM32eIauFgVkj3LolHbS2xUwLEd5DUaDI/3DiN2Z1k7P4lLaBz0=
X-Received: by 2002:a9d:80a:0:b0:660:d443:b1c7 with SMTP id
 10-20020a9d080a000000b00660d443b1c7mr787335oty.19.1665012493304; Wed, 05 Oct
 2022 16:28:13 -0700 (PDT)
MIME-Version: 1.0
From: Cem Sezer <cps@microplex.com>
Date: Wed, 5 Oct 2022 16:28:03 -0700
Message-ID: <CACw=RXKvmdHDVc5bk1qZ6-d6ebbeJqEWGaNk9pOdn1YoYoVX6w@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microplex.com; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date;
 bh=ZKkwiRmlvc0rj67FoKYFARBMKai8m2ua+j/ywHGRYvY=;
 b=e/vExf2NbZY+/aW5xTn/F7EDiT3jNPv5guZcHQtVUVvsnbZdcq5YFMdpVL1EJyHrn6
 cVEL6q10Sgr+Mw523FuvKoDZaxTbN2QpFxh5WSgIrFEAHIAnERH4Qk+ISH55ZNJZq3rQ
 Fv98DbNpRN1/lhBKyppYGTTikabMOSkVpjQ1wLpFe+UucChVqp2iMGTC/sUJtYT9Y1aP
 8xhGKpQXN5pLSQlSgKuKVXyCKsiObqhGFxS4Jt8ixkaKiPY3iwN+LbBIeJpCOsgbvqge
 xMuODy1JUpY5B2ZZzSzuwhUm3t0PdshhS1CU+slB1NkkwX+jzRx9CS4vDM8a7iaSJ7/b
 c/dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microplex.com header.i=@microplex.com
 header.a=rsa-sha256 header.s=google header.b=e/vExf2N
Subject: [Buildroot] wpa_supplicant: TLSv1: No TLS version allowed
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
Content-Type: multipart/mixed; boundary="===============3543743508380050767=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3543743508380050767==
Content-Type: multipart/alternative; boundary="00000000000035db4d05ea51eed7"

--00000000000035db4d05ea51eed7
Content-Type: text/plain; charset="UTF-8"

Hello,

On a new build, when I run wpa_supplicant, it seems to only allow TLSv1.0.
When I specify the supplicant to use a newer version of TLS in
wpa_supplicant.conf under phase1, it fails and the debug output says
"TLSv1: No TLS version allowed". Am I missing something? When I don't
specify, it defaults to using TLSv1.0. I included all parts of
wpa_supplicant, openssl, and libcurl when using menuconfig. I'm using
buildroot-2022.08. The version of wpa_supplicant is v2.10 and openssl
version 1.1.1.q

Thanks in advance,

Cem

--00000000000035db4d05ea51eed7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>On a new build, when =
I run wpa_supplicant, it seems to only allow TLSv1.0. When I specify the su=
pplicant to use a newer version of TLS in wpa_supplicant.conf under phase1,=
 it fails and the debug output says &quot;TLSv1: No TLS version allowed&quo=
t;. Am I=C2=A0missing something? When I don&#39;t specify, it defaults to u=
sing TLSv1.0. I included all parts=C2=A0of wpa_supplicant, openssl, and lib=
curl when using menuconfig. I&#39;m using buildroot-2022.08. The version of=
 wpa_supplicant is v2.10 and openssl version 1.1.1.q=C2=A0<br></div><div><b=
r></div><div>Thanks in advance,</div><div><br></div><div>Cem</div></div>

--00000000000035db4d05ea51eed7--

--===============3543743508380050767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3543743508380050767==--
