Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1221F5A8C5
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 22:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D86F83231;
	Mon, 20 Apr 2026 22:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NskM-JzvYEwi; Mon, 20 Apr 2026 22:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD2B83155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776722940;
	bh=r5jR0+uRaizicRk1HycK0dQ3g48xSNJCK19n943/k8w=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=U3NyYs/uPJzulQodig8gdllnuRz6tv1f1Ctu4h5E0IvPchRTCVi+UL9VW7/oxa6gu
	 HUbXTtJjCaPxVH9IOMeYmZZ2G75wr3mKvyk9ZKDZ/J+nnHmTEklGxQ7Ql1LlDX5pob
	 sYNL8Axp4VCLNflOAgp5XZCc61TonBTBQvOeqyPAQmnX63x+s0Q8fGMBZR3JKJapS/
	 veHSRMvA112ZercBjncX1nQJjAiM8QMs6beN4swTqOJMPixvLHT3nIAHm1+KZjmTRu
	 +wNbprj9iF7BhrJu6n3TFlbsuruqc+c7z/d1UNzQ255R2bh2YhVbcMTjdqL1YosVUZ
	 HfbVzRRauJqmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAD2B83155;
	Mon, 20 Apr 2026 22:09:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60A91259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 22:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DAF440084
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 22:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44Qrm3YeXrmJ for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 22:08:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5761D40051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5761D40051
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5761D40051
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 22:08:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fn0-1vHSJc0qs4-00unPf; Tue, 21
 Apr 2026 00:08:48 +0200
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 21 Apr 2026 00:08:37 +0200
Message-ID: <20260420220839.1232620-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:cYlha4C3/OZE9ZUNKgLaG22IQmmibyWjGcoCypByMWQUzj5SRTA
 2cs7WtuoysN5hJdC1gmyle6xp0EI4H9T2D8eA6+rfPMFGGDzwjZxv7nTX/q2KdMru5CFtlx
 COzzf7mdEhVpJwH67gmF//fq+jOtScIp/TnYER8XYPHcBz/aJTuaEN/piIEvQBzPHSMr4xG
 HMQ+Oko52RyAmy0C/KUzw==
UI-OutboundReport: notjunk:1;M01:P0:BFJ+UoLIdek=;N3h3+BPyy+Ere31Ldww8YIBcBgd
 LnLnglzWjK+UBP4htgNeAKfR7OLDPx/NKQ5WoBreG5Uy92SSnQCeOr8QZNNvRVwWzHf71m2p+
 /cM9GYTC+RXj+0ElE2wtvcf9Ce2qSn4chmUMzGswFDA74m6yRLwGMxDGXsQSPAHdNC61h/r24
 TD55dG30WzLoVFXDgQHqWgXHywcGPuV+Q2njCeyN27Dtnt6AgJipvmlXiZP+5sfRM/pJOzfrE
 FZEZgNEwyqZ7UgTyKeoV7d+i1Y3o/PfU20I/BRtA1QqLWu9wk1Xf2I2m+A7LfAf4K3PTIr3HW
 qR5pkBFwiOgXPUnMVpwEOEHryLshwocNr6S39ctayuKcV1RNTMivabt22Qe2dQGTa255pME9K
 28bx894+duspyd2B0+lQG75ZNFN3AX5y2mQNKy5q379oN1bOTjrsvTc+iOfv22IapWS350Hgi
 IFBH1apeFXsL04AKf/pCqyVnHSV4CIkxfHAqj6SZZ5j2HIY7yj8zbgH/5tXLIk1VuWdrCecxi
 33SrieoqkIU8HV6lg3ZU+9bo5OrF1wLi/0qVH5mAHASYe3/B1w0DFwHygcBT5KPii47i07BSf
 4Nw/kL1nyqWKGJ2b8CIwjWlDI8e3+PdlNcmFme14TJ3PkIb3axzdv3ygjawFVj/8NgVDxqB/e
 av0qK4Nb7jEP7xzDtAoTM+OqTIUE70BGo6r8EfR0V6hM2mvZyjUs9ypNWezNe7SwV1cntZ5fG
 TcJbImKR8rCsqxGWe2sRTZsafuIO5G0CFE/JmNSaaG11zjuHHvkz24yZJn5pD//EYn37NuvpN
 Wot368vd0fNfVb1AKQdrK3CuT+4fo5shBZiB7QI9/DsYgDfXcirgi7//HoRJ8iU9wR97Mv7Up
 PGD+MSEo73OiT3fqHdo8tu0SRxEJbdBDWlABFkiNKwLbythHS8xaXpJnYusXUKmuJkwCLnW8w
 8MMwlNQiHH38cYzGrFzDspHZvMsrba3iniyL2Fu2dgCo9diOCj+7JH7Oj7/qSwdMiCB6UgfVS
 UMw5jsuir0YCH9nyufn+XjSk6q6aiPgMOV6T7MCyjFsf0jqWHpu3ldwesZ0vEOJZo7yGjmox+
 2UwAZZvJ/G9EYP7Q9Aisja7DcvGIkBArm2FDCY7j+S7oPstRoTFbpfhjEecw2+WBS9kaM/3KX
 LJ5oCvuJfUpd6p0No/or7JW6zLzubPNtKhikoBpMrWjAFcbwtCAZxODrBMPSc1iPVqpKnVBi/
 nwPcCFeE/UjPkx2M0CjLG71IukclNLqpypuO0Rz+1lzkBFGLE1w5KWLvCc1fHzT+PKV4Rngb7
 YXlISNUOvGmIb4LIWFwJecLETI6H3R8rRKMp2Vz4E2IFfZdczuXP5X8Z28sI3xYhNrJr2j+P4
 KB9z/PI1+3xdsnC4zINZoIuimh/RpRDFQjJsNcsMectwckNTPfIvSyXAtpeNI+6dn5tuTH8EJ
 Ce8Zd9Wac5hq1FYjw6tsCCK1Vd2nHjG/xu5CRU4Ys3bQdvvvoW2Tpezb6hYhDJe/YtXZD/Nsr
 hmmeCokUjNiL/CyQ+ro7aGvfurJRnPD7J6gLfa3GQZN3Un7bU3ma8WkzUqSWLyKHYo3AvRDXr
 PhWl5wSrXP0AMvV0U5JCzNXIkRR+zIWzbaYxzT+Ncat1XBAnTuyRPoDi2NnWiYSVRYizrd639
 NUhqkmeVsWbak90lbvQoRMBaLaESnvZ+seCIR1MAzOoQfXFoWHL8JSipsCiY3FVCpW2xdfWFy
 t4oBlHxE1QiPNp2bmcu1ohCCdos4UqM2DavqgKAJK+UgVfg1G+aJmJey2tylHnnNyC88m3jf4
 UsGNJY2tWiG9FISp4/Xh0pUbVx7wveTdoHkFI/b+CBZpMsWpkk8ZLmi1RV1gteX981OrfMzCx
 6aeXyVUDO+LAgPn8diV6n/VNGncV8ZF0tzgAJF/24jivnKESebtWecZOTTNUR2fwSOppXnCvp
 B4RffswTXXmrOzaCgyQT9hAly3lGli7+uaBe6AYZwXrTarHWay8+a+F+gW7RQb7CWgrpLLAK4
 gqVP70l7OkhzZp0q91BbdOFAstYEPcS2WjVrJq6GCldDC80l28vxTWQyn4z8/feV5eC7t8bQE
 RyQP65351ZELxnkgXMjK7pTfmAwV8ixr+o71Z0NxC0eflJXaF8H9wzmL00FRgsbOaXBgyJm+e
 fiSMmG+BojYDHMP64BvLNNiOc7GNoVvfc5XZlyw8IA+zQ73eK63MBavmSjPpEskDG5BU+1aZz
 r5D9PEayAYaRidTjYuez4j1IACA3ikivKiLbPsFeag+AnDWZkSL7PE2ZYB8pQIiPdf2+N/1Xb
 KKc0doxBiJtqGZBcW9gpMsLYLDc6SVDyEinj30XdiHCiL7XpG0ECl+VaSPN/Y7RUmdarNgiVu
 g3DWUBByoy/zCtNyF/F6cDzSB8OHMLJpjjbxd95ZsJ+T/zVB1e3WxbBzotYUu3D3+PEXELsY2
 vkjU8eiRakvfeGR7DyECYFj10CSfsg4NXJMZY6Z50gnlJ+wH9DIxAnfAmeqS0Etdjlkq9ZNJI
 izOrLuLCA870dL18Re3BY8yt5ME9i31Z2CMMpuI6MGqvT3YrwtGUqrsrls41wfEmEF/rC65Nw
 u+yPYEeAb3i/B8jiQkG7hHcBA6DPOlqpTm0deH2km5PRuOV05FVrcnSJR1RDqmK+dxQk/bI+U
 9tzp01bnhe33aq3OMf2FR94MAQuxEgcx8aaHYGeEeOdOicJy+LxG9YmRjbe5P0kXeG5hOZDQr
 LmSPvWi0DDA4Nn1gExr7ebC25z/9lv8LeGvELl7fssNvSMlFWoPiQtuVBeH6iimKZg/OwEnFU
 RrHuA9qyv5taxcM9lEPs9DR7dTScEhoMHvXHXnwZ49t6+jVM5nWqY80CE8+0taGNsUqDAykv5
 97oKl4Bao5Zb77IOM3x2cGMWS1wiDp3oA3kYUP8aucmK15TjtIfYPdOUf5zsJwTzYcr2AVaAE
 I6xVzBabg479+IwmGtrmtpSXmjR+iwibZYUODmll5pTGcfRuDf47uuD7C15sAHC5OZv3fuhyq
 IqcGAYoNon9MkJGyMYsFqw2QIGgnTVIKEihnDw8aX52kL/t0oLlS954ojrqxC/mat5Zy65LBE
 eb21H1ytAAOP0ARgsj6E1MdlfHiF3Eu2dP3zLmADoecMNjjVF6Qpa3LsPq5Ia7wk+MR/VQ8Dd
 Ju+quqB7rRMEl9iIRxfc/Th4UhopOrYuleOfluwS+IlUv9HkWlctUTvdST3u0CKtWgMspPYtr
 NcTWP6fhdHBqLafnauIEhQ5zlSCBDJPNVO4lI+SjSAYxixPw/aKaP0j0NJ5LA3BaBSa7Dy+oh
 aoppRnFVSilBsRTdAvGDtvksVpqX80boOkNTOSgXO4eVX6Mhaqsjf1WY14ZqgOQX/oaMn81V6
 XaBLrOU7K7q36J8yWhE/373+cSPMOstDNP5uP3BLkhSFl4nOfqq2TXf1RqtCMQp6LfibOlYK9
 DDXz1L3Dk7gVRmoXPz8L5lGG57u/Z1Hjzm4ccy4q+GMNA83a/roAuHvWC472Ys6iHgD9+eJ1a
 e8i7fNZXok2usD5Wa9vwqyneDVgWhtfnzVGF1nXknVLURBMR0scdADDI83/LMJ6X9bXeQSNbM
 rWJXswz2o3NKqhOR9I1CTDcWoWE5NsEoqRiDtD6uY/2ARf4evaoXEEGmygqXQlQ9eg1c06/yk
 teldydCLW9UQrLMCLJxyMt3VzDAWLY53UhyIbBEQtiGb70doXUwA0OUrov6Novm0YIiHunGiU
 RJuFX/1H+WbkQH2s2dPePT6JrBIQxRamXQG8dO5OVIwqdNcuixfpg449uIOInR5cJJouDp0Jf
 9+oi5EgjGut19VmPlyU8N3Sj+0ucc6yRi1Y0b7th3GGjdKfZ2yCWRjr5/nPyfNJOTF9BOqWgd
 iUTtc4Kye//gRal/coFoUZsydI0iEncDNJa6UTO0jmLfntxRYBTt4TGkZk2Bb4TTm5t6uM3nb
 lKzpegiXuKmVXTlsYpJ1j8xtHr1DCg5k4IIj7Wmj6am9EFjIEWpCdQkXjlB4pN7MEGAtcpmCD
 ZIbSPnoTokJTLpAoiC9usr6B+Din+1X2ruk95s8OHNwys7GGm3/TLu+cM+eLoWwHYUkmjUQ/L
 4Y6xNOYb4yhv54fJR1W5vYvnRjR9Pu+FYtTXyZQ/cO4bR95PhRam8fXNncrXRHYp2AlBnPpsF
 FMRkZMiMmCUiTOQROUsfLhcbO/o5uoUDTWUj0aaJxGovwLystFs5Gx7qUoSqiCaOtLIDwB6uf
 vQgArzB25dDBMx9JnfYLEQv9hiN2BJZy+EV2gr2XnNydXcfmIedWh+QoH0CQsSUjxHrTwk0iQ
 SDKpA32VkCm4Q574VwW70sIxU51FMwWHW05ja5Jd/nZOkaAywVMCKWyl1hukbp0Gz9p6rwVrJ
 2lMUaztlB5oipOAQLoiTcxShn+cFq+ErTbhK4jqeZLekhmcG5vlcchEHTtoccpf8F7+w8UfLt
 4d2aerR+JyedfF9YFGsfhxSbCJz2N9tV9+HH74gOow9umZgJVFESgy4NJS72YSQh+z0eBatdk
 86qSLusKTcHfRop3CSCvK4S3+/qUDm4oyJwBfAQGp26R4E1KLiMG/kdRzqr3bxHiAiKLcS7i5
 1L4KJK8qniTrvaxxu9HOygY5WWIiOdeCDWSEbpiDxQGejcRfyxR1O8mpBJ8VG1qkb7tHbYCQ5
 3A6lzGehinVs8c8/Y9KGTHOsk/SkXUQNeKXiH+v3m7RLuziDjCal1K99wkhlhC9kMCMXVjbyw
 PMiA5nXEIHCk1Io1PsxV8+LZ4Ob5DRd8zGLLh31K+rUPVzwxDEHZo+cTipunjntR5M+DG0lWd
 Qows0lATiZDdBBCo7x75Rzd+8xcypieJlVPaqGCEKd6xjqZn6qHilCMMYN4q0o3TNcCoiLNdg
 vS4ocGEAOh3XXqUoeHc5akJxaDS5W8aLBREoByR5Szxw7I35C5CtYBn33Owoo/al/kAMpm/yd
 IWAcZE8UIkm14ewkfKSta4HPyWmKGM9tLQ1kWoHN/HnZw4tRjP0zNife19hGYHhPouoh5KASM
 rz1TKhKn4XNhll6u3h8RXFXGJLxT90Txile/dL5Do0r8q6xgGF/pdtUkKZqvz/bwYAF39SZ0S
 w4Pjx4a6al1aDbAvsp56lBvLKj3eDHZv4WgsHpv482P8w04CBzm489MVjKlbn2h0PC6SDkPQs
 SMb6EPolampk/+shRwsjrr3vT/2mgcl95O43jP33XHKK6W0bi0ecjg03D7ZBZaVGeA1hJB8by
 Y+fc1R6pa7g3mTHLiVsBxjMJQ8gH5pz9tPYW0Siv9nvDZ4VQ4Ql+pez4bJmNgi5GkQDTMn/cW
 fBk+2GlA79VULyDbb1ovNYpSeGT/DQHlqQtTsk0G5e3ybKwVJDjO9fnUP2uUzHCqO9zn1Qq2c
 Ea5RM91aq1T/5JTJiKXpasEw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1776722928; x=1777327728; i=fiona.klute@gmx.de;
 bh=gIkqdOs974GEGpXPXjjin5OfZWqGt1kRo/0CJMjA57o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=r3Ug0TKOJkb877IzePYO0r03hytMV+Vv4o7UmMt5kvhRWiCV8CRSm1w8giqJPqVG
 z0YgmqBQc7c/W22FLlWKotX94c+HV7QmIq6j7Jv6y/Tzh29hKHDtL06tvQ2XPA3YH
 tJBBy6D2+uDgMZQLaSAarlfs5hEFKVAhRlNk/lk6gf5qK4XUFCW2rzZK3c69vzx01
 B0D4qV4haU8917p4uusl9/kqkY9jlv9PiBLH26YHZitMqdX+NbVl2kLbD2UcckmTz
 fohlVYd3nl8Dwbe29mfH3NoQdQInaWzyOIMH2XvNu4lOpB3qIUSTT+K22KzlDb4kl
 liqIUDzxlWfv7kWcQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=r3Ug0TKO
Subject: [Buildroot] [PATCH 0/2] Add upstream security patches for musl 1.2.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi everyone,

the patches themselves are pretty standard, importing the upstream
patches. This is the first time I'm adding CVE tags & ignore rules to
Buildroot, so please check everything is right.

However, I found an annoying thing while looking into the CVE details:
"make pkg-stats" didn't find any open CVEs for package/musl, I believe
because CVE-2026-6042 and CVE-2026-40200 have not been tagged with the
CPE yet in the NVD (status "Awaiting Analysis").

I looked https://db.gcve.eu/ in search of an alternative, and the
results were mixed:

* https://db.gcve.eu/vuln/cve-2026-40200 has the correct CPE

* https://db.gcve.eu/vuln/CVE-2026-6042 does not: no CPE, and tagged
  with vendor "musl" and product "libc" which does not match

Unfortunately they don't seem to have a channel for reporting errors.
So I'm wondering: Is there another reliable source for vulnerability
information that might be a bit faster to update?

Best regards,
Fiona


Fiona Klute (2):
  package/musl: add upstream security patch for CVE-2026-6042
  package/musl: add upstream security patches for CVE-2026-40200

 ...-slowness-incorrect-mappings-in-icon.patch | 324 ++++++++++++++++++
 ...do-heap-corruption-from-bug-in-doubl.patch |  48 +++
 ...ude-oob-array-writes-independent-of-.patch |  97 ++++++
 ...06-qsort-fix-shift-UB-in-shl-and-shr.patch |  43 +++
 package/musl/musl.mk                          |   8 +
 5 files changed, 520 insertions(+)
 create mode 100644 package/musl/0003-fix-pathological-slowness-incorrect-mappings-in-icon.patch
 create mode 100644 package/musl/0004-qsort-fix-leonardo-heap-corruption-from-bug-in-doubl.patch
 create mode 100644 package/musl/0005-qsort-hard-preclude-oob-array-writes-independent-of-.patch
 create mode 100644 package/musl/0006-qsort-fix-shift-UB-in-shl-and-shr.patch

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
