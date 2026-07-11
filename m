Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70D6C43458
	for <buildroot@archiver.kernel.org>; Sat, 11 Jul 2026 10:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D1740CB1;
	Sat, 11 Jul 2026 10:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCgHTGipIGaJ; Sat, 11 Jul 2026 10:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68FB440CB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783765504;
	bh=dLMVQyWO6JmEZya1gAPkR6KDtdC2ooFFIWWLNla5xKI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=phyVjAPYaXJpQpDxkR28IKYE3gZVb5yYyAmIHXUpoE2uSmXoCBAEmYXZDAo3iv81M
	 YYmb6CWTG+1RohuFuxALVOuD/Cq7ZAq4Gbc30TbG8RHuV5AueIWfntNIuyQJn5W6bL
	 1M1rnrnqkSCZwO3xivK6AtSrkTbdkx/kXXtJw+1nI58XGzyYqzeSyfjRjtfLWyj/C1
	 8gYBIJ74LZTDGAuZY1rDf0L4nq1Hdg8yz2iFUng0sX8ZPARBgXCsdHVFqTL6hYiLoK
	 uxLH7fqbkkuw7ApAqehEOJilmYx9irYmv5vBt1eNpp9T04n4pYPO3Sjp3i8auwAtEZ
	 F/j77XLVQ2dIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68FB440CB2;
	Sat, 11 Jul 2026 10:25:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83531372
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 10:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74D29818D4
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 10:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrkruzIKd3Nv for <buildroot@buildroot.org>;
 Sat, 11 Jul 2026 10:25:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08FA8818CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08FA8818CD
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08FA8818CD
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 10:25:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MY68d-1wYx952muz-00I9kf; Sat, 11
 Jul 2026 12:24:50 +0200
Message-ID: <c06472fc-be68-49ce-9a8f-a8411be6d520@gmx.de>
Date: Sat, 11 Jul 2026 12:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Ziegler <br025@umbiko.net>, buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
References: <20260709110822.305873-1-br025@umbiko.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 xsFNBFrLsicBEADA7Px5KipL9zM7AVkZ6/U4QaWQyxhqim6MX88TxZ6KnqFiTSmevecEWbls
 ppqPES8FiSl+M00Xe5icsLsi4mkBujgbuSDiugjNyqeOH5iqtg69xTd/r5DRMqt0K93GzmIj
 7ipWA+fomAMyX9FK3cHLBgoSLeb+Qj28W1cH94NGmpKtBxCkKfT+mjWvYUEwVdviMymdCAJj
 Iabr/QJ3KVZ7UPWr29IJ9Dv+SwW7VRjhXVQ5IwSBMDaTnzDOUILTxnHptB9ojn7t6bFhub9w
 xWXJQCsNkp+nUDESRwBeNLm4G5D3NFYVTg4qOQYLI/k/H1N3NEgaDuZ81NfhQJTIFVx+h0eT
 pjuQ4vATShJWea6N7ilLlyw7K81uuQoFB6VcG5hlAQWMejuHI4UBb+35r7fIFsy95ZwjxKqE
 QVS8P7lBKoihXpjcxRZiynx/Gm2nXm9ZmY3fG0fuLp9PQK9SpM9gQr/nbqguBoRoiBzONM9H
 pnxibwqgskVKzunZOXZeqyPNTC63wYcQXhidWxB9s+pBHP9FR+qht//8ivI29aTukrj3WWSU
 Q2S9ejpSyELLhPT9/gbeDzP0dYdSBiQjfd5AYHcMYQ0fSG9Tb1GyMsvh4OhTY7QwDz+1zT3x
 EzB0I1wpKu6m20C7nriWnJTCwXE6XMX7xViv6h8ev+uUHLoMEwARAQABzSBGaW9uYSBLbHV0
 ZSA8ZmlvbmEua2x1dGVAZ214LmRlPsLBlAQTAQgAPgIbIwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBOTTE4/i2fL6gVL9ke6nJs4hI1pYBQJn9S5IBQkQ6+MhAAoJEO6nJs4hI1pYvz0P
 /34nPCo/g0WbeJB6N75/1EkM9gDD1+lT4GdFEYYnCzslSxrIsL3kWuzG2kpqrErU8i7Ao/B2
 iE3J9NinRe613xlVUy2CU1VKaekm3YTkcfR7u8G/STNEQ42S46+3JRBMlLg1YldRsfVXq8tc
 jdwo193h4zrEeEmUDm8n43BPBhhwNRf+igtI8cNVyn9nBt6BrDnSswg497lrRjGjoP2zTkLT
 Q/Sb/6rCHoyFAxVcicA7n2xvaW0Pg0rTOrtA9mVku5J3zqyS4ABtoUwPmyoTLa7vpZdC33hy
 g7+srYNdo9a1i9OKF+CK9q/4auf3bMMeJB472Q5N8yuthM+Qx8ICySElyVDYSbbQIle/h/L7
 XYgm4oE1CxwiVCi8/Y/GOqhHt+RHLRGG1Ic+btNTiW+R+4W4yGUxL7qLwepIMY9L/0UcdnUa
 OBJk4waEX2mgOTmyjKR0FAGtaSH1ebz2UbY6pz5H9tZ4BIX7ZcQN0fLZLoi/SbbF+WJgT4cd
 8BooqbaNRoglaNCtTsJ7oyDesL9l0pzQb/ni1HGAXKW3WBq49r7uPOsDBP8ygyoAOYw4b/TX
 qUjJYpp9HcoQHv0sybSbXCFUMnL1E5WUhy8bBjA9fNtU43Fv3OR2n5/5xSn6o33XVMYMtkrN
 0AvEfAOGGOMJWktEYA7rxy0TQiy0ttUq0eQszsFNBGQ1Nr0BEADTlcWyLC5GoRfQoYsgyPgO
 Z4ANz31xoQf4IU4i24b9oC7BBFDE+WzfsK5hNUqLADeSJo5cdTCXw5Vw3eSSBSoDP0Q9OUdi
 PNEbbblZ/tSaLadCm4pyh1e+/lHI4j2TjKmIO4vw0K59Kmyv44mW38KJkLmGuZDg5fHQrA9G
 4oZLnBUBhBQkPQvcbwImzWWuyGA+jDEoE2ncmpWnMHoc4Lzpn1zxGNQlDVRUNnRCwkeclm55
 Dz4juffDWqWcC2NrY5KkjZ1+UtPjWMzRKlmItYlHF1vMqdWAskA6QOJNE//8TGsBGAPrwD7G
 cv4RIesk3Vl2IClyZWgJ67pOKbLhu/jz5x6wshFhB0yleOp94I/MY8OmbgdyVpnO7F5vqzb1
 LRmfSPHu0D8zwDQyg3WhUHVaKQ54TOmZ0Sjl0cTJRZMyOmwRZUEawel6ITgO+QQS147IE7uh
 Wa6IdWKNQ+LGLocAlTAi5VpMv+ne15JUsMQrHTd03OySOqtEstZz2FQV5jSS1JHivAmfH0xG
 fwxY6aWLK2PIFgyQkdwWJHIaacj0Vg6Kc1/IWIrM0m3yKQLJEaL5WsCv7BRfEtd5SEkl9wDI
 pExHHdTplCI9qoCmiQPYaZM5uPuirA5taUCJEmW9moVszl6nCdBesG2rgH5mvgPCMAwsPOz9
 7n+uBiMk0ZSyTQARAQABwsF8BBgBCAAmAhsMFiEE5NMTj+LZ8vqBUv2R7qcmziEjWlgFAmf1
 LrEFCQeCXvQACgkQ7qcmziEjWljtgBAAnsoRDd6TlyntiKS8aJEPnFjcFX/LqujnCT4/eIn1
 bpbIjNbGH9Toz63H5JkqqXWcX1TKmlZGHZT2xU/fKzjcyTJzji9JP+z1gQl4jNESQeqO1qEO
 kqYe6/hZ5v/yCjpv2Y1sqBnPXKcm21fkyzUwYKPuX9O1Sy1VmP1rMzIRQHXnNapJJWn0wJAW
 079YqdX1NzESJyj4stoLxIcDMkIEvOy3uhco8Bm8wS88MquJoR0KlyBR30QZy9KoxmTiWKws
 Mn6sy4aX9nac3W0pD+EyR+j/J9SWSvOENAmn4Km+ONxz93+oVLWb+KHtQQloxOsadO0wwiaZ
 xUT7vJcxSgjrHugSs+mOLznX/D8PfG/+tYLFlddphcOGldzH0rxKfs53BplAUe+LEZY1AU8p
 0WDK2h097ZQ0eZiVZlvAKSjwsjow2tpqwamtfNKrFg/GFRbNZcoQuYsf3vBW1CiZ5JQ6Vh2A
 bCn+vBDsJwD9Hcht1eVRxnIq745SQ0naL48Q3HGpKdXZpJoBQZ8bSAFhRSb3m+P4PE272rLY
 6FCkqS+UeX7RBpPkkIDoL7WS9HdvDHuQ751D56WkTnIpoF+sgW6tOEcfgFrYf3rVvh6G3B8S
 FPSOJuHYnwzMFrDNxQQKb0uS/j1s2dnlS55MouCvd5pShM5iRFzE7k3CMeS4NkhFim0=
In-Reply-To: <20260709110822.305873-1-br025@umbiko.net>
X-Provags-ID: V03:K1:1GEANo+50K/54grYgeRkOVW/Eq0WUDbzK6W9MSCDG0B35uy7IzG
 gvc1v9+4MrhWU5XUQbOH1H0FIuIrvjz2y0PlrFx/3IfKuj1SmUojR0KB94dDDkHEw/ALSl9
 +ynAEXbfBtXU/bv1de+VVRyMUza811hLn4Qi1zWievZLKJ1MdMHB22J2JnvmIoMRX/1nO90
 uQa7fzSAKAXBU4l98qWow==
UI-OutboundReport: notjunk:1;M01:P0:qCiSzDpVPzA=;s5JmnwFJVFN3CwJYZYwvyj/R15d
 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
 4pbfo1TlW4OxY4MbnatTsPVEs3wOTP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783765490; x=1784370290; i=fiona.klute@gmx.de;
 bh=XyW5uIPDwtgeSGyW/ZuBgd7UPakyhY/ztlECvYFTunA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=aFRTr8J38bpRVNYS4qHYgiZBSBKI2GJGUj/Ntfu1Kt7tRNRZUvntrR6GAi34En29
 4mpQWvJ3HMRY3esyME4velmOG++pa0CRcrmWeLdtz+4cEADPgs3Rbb1xWhId5rU3R
 VvCKdEH9Kf6QNqIvx/pK5XRd7s/2MV2yW/PYAu4ViJpQc7tM+pzpiCthGgAW1v1TA
 /lQ5/JujEkgt839TVBwZOgqYEXju2VvIcF7pstbuLjJoJ9440LfRAUzWnDRZ6ckGd
 p2EVezzrJS1XGn/4QUDRG/YMHuY1X4iTntK0DgQp8IBEolY/pZoM/5IBNm4z68rXj
 xlnkLYf0iEibQSA+Sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=aFRTr8J3
Subject: Re: [Buildroot] [PATCH v2 00/11] add runtime test for mpd
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andreas,

thank you for working on these tests!

Am 09.07.26 um 13:08 schrieb Andreas Ziegler:
> Testing MPD in a real world situation is fairly straightforward: build,
> deploy, play some music. Representing this simple test within a test
> framework is quite complex.
> 
> I tried to break down my simple test case into a few atomic steps that
> interact with MPD via the built-in protocol. The necessary test data was
> generated with ffmpeg and imagemagick and is royalty-free :-D
> 
> In good old usenet tradition, test data had to be split in archive
> chunks, to overcome the limitations of the mailing list. The data will
> be re-combined in a post-build script.

I don't like the idea of adding a bunch of binary test data to the 
repository. Why not generate it as part of the test or build? Sure, 
adding ffmpeg/imagemagick to the config would make the build heavier, 
but having a clearly visible generation command and no binary data in 
the repository seems more important to me.

Best regards,
Fiona

> Working on this also triggered some changes in the Buildroot setup:
> 
> The configuration file supplied by Buildroot is only a sample; it will not
> start MPD on a default installation. Usually a custom mpd.conf is supplied
> in a rootfs overlay. Drop the Buildroot configuration file and install the
> sample supplied by MPD instead, it is more complete, contains useful
> examples and is update regularly.
> 
> After various updates since version 0.20, most dependencies placing
> restrictions on sub-components are now superseded by restrictions placed on
> MPD itself. Example: io_uring needs kernel headers > 5.1; MPD needs kernel
> headers > 5.6. Remove dependencies from sub-options if they are already
> imposed on MPD.
> 
> MPD has 99 configurable options; of these, 44 are exposed in Buildroot's
> Config.in. Sort order and grouping of these options are different within
> the MPD project and Buildroot, which makes a comparison difficult.
> Reorder entries in Config.in to reflect their order in meson_options.txt.
> Also update at least some of the help texts to more closely resemble what
> is published in the MPD manual.
> 
> Changes v1 -> v2:
> 	split test data in chunks to overcome mailing list restrictions
> 
> Andreas Ziegler (11):
>    package/mpd: install provided sample configuration file as mpd.conf
>    package/mpd: remove duplicated dependencies from sub-options
>    package/mpd: reorder config items based on order in meson_options.txt
>    support/testing: add test data for mpd
>    support/testing: add test data for mpd
>    support/testing: add test data for mpd
>    support/testing: add test data for mpd
>    support/testing: add test data for mpd
>    support/testing: add test data for mpd
>    support/testing: add runtime test for mpd
>    DEVELOPERS: add entry for test_mpd
> 
>   DEVELOPERS                                    |   2 +
>   package/mpd/Config.in                         | 364 +++++++++---------
>   package/mpd/mpd.conf                          |  32 --
>   package/mpd/mpd.mk                            |   2 +-
>   support/testing/tests/package/test_mpd.py     |  57 +++
>   .../tests/package/test_mpd/_test_data0        | Bin 0 -> 223630 bytes
>   .../tests/package/test_mpd/_test_data1        | Bin 0 -> 223630 bytes
>   .../tests/package/test_mpd/_test_data2        | Bin 0 -> 223630 bytes
>   .../tests/package/test_mpd/_test_data3        | Bin 0 -> 223630 bytes
>   .../tests/package/test_mpd/_test_data4        | Bin 0 -> 223630 bytes
>   .../tests/package/test_mpd/_test_data5        | Bin 0 -> 223630 bytes
>   .../tests/package/test_mpd/busybox.fragment   |   4 +
>   .../tests/package/test_mpd/post-build.sh      |   6 +
>   .../test_mpd/rootfs-overlay/etc/mpd.conf      |  14 +
>   .../test_mpd/rootfs-overlay/root/test_mpd.sh  |  74 ++++
>   15 files changed, 348 insertions(+), 207 deletions(-)
>   delete mode 100644 package/mpd/mpd.conf
>   create mode 100644 support/testing/tests/package/test_mpd.py
>   create mode 100644 support/testing/tests/package/test_mpd/_test_data0
>   create mode 100644 support/testing/tests/package/test_mpd/_test_data1
>   create mode 100644 support/testing/tests/package/test_mpd/_test_data2
>   create mode 100644 support/testing/tests/package/test_mpd/_test_data3
>   create mode 100644 support/testing/tests/package/test_mpd/_test_data4
>   create mode 100644 support/testing/tests/package/test_mpd/_test_data5
>   create mode 100644 support/testing/tests/package/test_mpd/busybox.fragment
>   create mode 100755 support/testing/tests/package/test_mpd/post-build.sh
>   create mode 100644 support/testing/tests/package/test_mpd/rootfs-overlay/etc/mpd.conf
>   create mode 100755 support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
