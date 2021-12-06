Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8D8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 22:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 382B284BE2;
	Mon,  6 Dec 2021 22:26:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UtjW7Rm5cjE8; Mon,  6 Dec 2021 22:26:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A58984BE3;
	Mon,  6 Dec 2021 22:26:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEBF21BF232
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 22:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE2DB60DF9
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 22:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=samsung.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xtvNqZRaJ58X for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 22:26:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D83260DCB
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 22:26:34 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211206222631euoutp023ec29529ccc01ab2ceaecaac3bf52d25~_StSWdIUM2404824048euoutp02Y;
 Mon,  6 Dec 2021 22:26:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211206222631euoutp023ec29529ccc01ab2ceaecaac3bf52d25~_StSWdIUM2404824048euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1638829591;
 bh=DA9V+u5AhMv9vr8BNgWDgnUw4udmhf+enokZl/WU6oU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fNaMmZF7ZRrWyD8ZOo5px2Yv/c5zbs9BRpQISiKdjKW4Y6e7bbMwYHj0OUO9Oqgyu
 UNVLQAvS6xmqE4kgYICnrw80JTVdZJzDoVBgs8ZjoJo3tJWG07kfSS9mIAVm0eCQLN
 /q+LuotnTnJ60iUrFnXRcPaNGYyuj8vVv+TNq598=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211206222630eucas1p16481a446c834ab4b7f4af3955b804d9e~_StRgypa_0276102761eucas1p1d;
 Mon,  6 Dec 2021 22:26:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 35.B2.10009.51E8EA16; Mon,  6
 Dec 2021 22:26:29 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20211206222629eucas1p23efe561cb9df1409e7e961c8d6360646~_StQ4oEQP0427204272eucas1p2I;
 Mon,  6 Dec 2021 22:26:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211206222629eusmtrp190e27878517f8db5d381b7b31a0bfdbe~_StQ35npZ1542215422eusmtrp1S;
 Mon,  6 Dec 2021 22:26:29 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-b5-61ae8e150daa
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D7.E5.09522.51E8EA16; Mon,  6
 Dec 2021 22:26:29 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20211206222629eusmtip17575dcf917b36cfd27809d740fab7333~_StQrClZS0152201522eusmtip1P;
 Mon,  6 Dec 2021 22:26:29 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Arnout Vandecappelle
 <arnout@mind.be>
Date: Mon, 06 Dec 2021 23:26:20 +0100
In-Reply-To: <20211206212347.GC2603@scaer> (Yann E. MORIN's message of "Mon,
 6 Dec 2021 22:23:47 +0100")
Message-ID: <dleftjilw1gyk3.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEKsWRmVeSWpSXmKPExsWy7djP87qifesSDd5OM7V4efQls8XH1j3s
 Fs8btrJatE3exG6x9shddovOP7uYLGa8W8Jq0fnmHbvFgl0v2Rw4PVa/7mT3mLem2uPy+7ns
 Hv3rPrN67Jx1l93j1OplTB53b11i8ujbsorRY8v+z4wBnFFcNimpOZllqUX6dglcGT/vnWQs
 uMBd8ffPE8YGxh+cXYycHBICJhLPFp1nAbGFBFYwShz4ZdLFyAVkf2GUWHVoNwuE85lR4n7v
 F1aYjq6NB9khEssZJdZ9Oc0I4TxnlDg9eyJQFQcHm4CexNq1ESANIgJhEheWrGUGqWEWuMwk
 cerDHSaQhLBAmkTvpJOMIDaLgKpE/89zYHFOgSyJs23/2UBsXgFziZ2n14PViApYSvx59pEd
 Ii4ocXLmE7C7mQVyJWaefwN2hITAYk6Jk/P3QZ3qIjFvyzsoW1ji1fEt7BC2jMTpyT0sIIdK
 CNRLTJ5kBtHbwyixbc4PFogaa4k7536xQdiOEp+fdTFD1PNJ3HgrCLGXT2LStulQYV6JjjYh
 iGoViXX9e6CmSEn0vlrBCFHiIfHyQh4kpGslftw4yDKBUWEWkmdmIXlmFlAHs4CmxPpd+hBh
 bYllC18zQ9i2EuvWvWdZwMi6ilE8tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzCpnf53/NMO
 xrmvPuodYmTiYDzEqALU/GjD6guMUix5+XmpSiK8ag/XJgrxpiRWVqUW5ccXleakFh9ilOZg
 URLnFfnTkCgkkJ5YkpqdmlqQWgSTZeLglGpgmmB0MYrFsfHllYBglUk/1zGtPJkpGmR/XXuq
 2pXLyYkB7pVbC+X27Jt9dS8zQ2bjCf7O7ImNZoXB5pz8hj89ek6Zfjl99c7tzz8ZvOfN1Vot
 prFrV1WE4czj3bmHjPWfXiv+N1/PaQ5be07F80f/FFQN/dp8j4ns2Ld0Yvr3EN1GLfO3vDp6
 TalipYVbTm1cecSpvXgyX0CDYkDUEc7wx7ZHLhw77Xr82g8xOcMlnxf4Ku81rTbcIT67ufVZ
 ZbySyr5PTVqTOGpKfYTSd+adLROeN8Vg1ZuZC//1W69affz+m5PZEhNW7DobaZMs8NStYOEi
 VSG+Jx8XtF/vtT3rUflWgiP/2p4A/o1Rdb3+SizFGYmGWsxFxYkAeNdjk+UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xu7qifesSDS7P5Ld4efQls8XH1j3s
 Fs8btrJatE3exG6x9shddovOP7uYLGa8W8Jq0fnmHbvFgl0v2Rw4PVa/7mT3mLem2uPy+7ns
 Hv3rPrN67Jx1l93j1OplTB53b11i8ujbsorRY8v+z4wBnFF6NkX5pSWpChn5xSW2StGGFkZ6
 hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GT/vnWQsuMBd8ffPE8YGxh+cXYycHBIC
 JhJdGw+ydzFycQgJLGWUOL1nLWMXIwdQQkpi5dx0iBphiT/Xutggap4ySjyYt4cFpIZNQE9i
 7doIkBoRgTCJTRuWMoLUMAtcZpJ4e/cuG0hCWCBNonfSSUYQW0hAU6J14nJmEJtFQFWi/+c5
 JpA5nAJZEleXB4CEeQXMJXaeXg9WLipgKfHn2Ud2iLigxMmZT1hAbGaBbImvq58zT2AUmIUk
 NQtJahbQVGagbet36UOEtSWWLXzNDGHbSqxb955lASPrKkaR1NLi3PTcYkO94sTc4tK8dL3k
 /NxNjMCY3Hbs5+YdjPNefdQ7xMjEwXiIUQWo89GG1RcYpVjy8vNSlUR41R6uTRTiTUmsrEot
 yo8vKs1JLT7EaAr02URmKdHkfGCyyCuJNzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0t
 SC2C6WPi4JRqYIpm3R/itWP6Z5FcHi/e4GghT/FjjQGzZlcssbHe6e9SouR1NefJPe20tdwe
 xau+F+pbl864sX7eu/dP9yfYvkw3NvgieIZV4v7xmXfTksJZJ7orXayTmc156tiy80IvuG7U
 1Nj3mdwySNPb3LRcqX/Jw1gGt9tbbrXOjM5STAxYy3q80PiqtfjZxyu8dgdfWVGXIaae1nlm
 M9OGJ0efRW1ZtHrLAnO1teuWvFOKPVEacJKNL25H4oVk9obkPr/p66/tYZWXYl5k+lr0lweH
 mc/d5wIs9jIv0nND11TU57HO2FIff0g5+MGT5vApuemLYsTMvh1SMHQoOh3xzebl2ngR2Yfu
 vfe4Fv3Y8MFsvhJLcUaioRZzUXEiACUchYVeAwAA
X-CMS-MailID: 20211206222629eucas1p23efe561cb9df1409e7e961c8d6360646
X-Msg-Generator: CA
X-RootMTR: 20211206222629eucas1p23efe561cb9df1409e7e961c8d6360646
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211206222629eucas1p23efe561cb9df1409e7e961c8d6360646
References: <20211206212347.GC2603@scaer>
 <CGME20211206222629eucas1p23efe561cb9df1409e7e961c8d6360646@eucas1p2.samsung.com>
Subject: Re: [Buildroot] [PATCH v2 1/2] arch: Make page size configuration
 architecture-independent.
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============0322783421612715343=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0322783421612715343==
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2021-12-06 pon 22:23>, when Yann E. MORIN wrote:
> Arnout, All,
>
> On 2021-12-06 21:30 +0100, Arnout Vandecappelle spake thusly:
>>  Thank you for this patch! Since it's a bit an invasive feature, it might
>> not get merged easily.
>
> Yeah, I have already been looking into it, and will do a proper review
> "asap". In the meantime, the easy low-hanging fruits, see below...
>

No need for asap at all (-; These patches are a byproduct of my work
where I use BR. I am willing to make them mergeable, but I can't work on
them full-time and I will be more than grateful for your detailed
advice. I am completely new here and know next to nothing about BR
concepts of doing stuff.

Kind regards,
=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmGujgwACgkQsK4enJil
gBAG9Qf/bgzTniT2Lq9lGuww4LN4ZJDAjIqDTy1tGKJI4smsa6cVHRd4rSTjJsE+
xdPaZCRiKZLhj0wtVBcZumpDn9rAEyQqqA06FxIukofFrpetSs4/YHLBTDDA36w6
xjSQel1nvKs1b6wdT9FnHFiicUdED0fx7r2UrtEmNNCkNsHETPSh9DQasrkstC/k
c8mhZ9MN6kuegQ6htBIWD7S+03aPTvH5hIqFBeY/qyZFF5xArj8J8qfEXSpEMz3Q
mAG1LkjFC82qaeVNAx0cZam8tzahKO0YYa63v+o+1IGvbcH38GJBNK3nodut3o1O
Nl3lob7nml8EUBZrxTbvMK6dVQ2Yag==
=/IQo
-----END PGP SIGNATURE-----
--=-=-=--

--===============0322783421612715343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0322783421612715343==--
