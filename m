Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F84E68167
	for <buildroot@archiver.kernel.org>; Tue, 17 Feb 2026 10:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D407827CA;
	Tue, 17 Feb 2026 10:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0bJOGsnmFsB; Tue, 17 Feb 2026 10:23:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A06823C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771323814;
	bh=2paZRWPt9fwUfPoO5pJ7Xou1Zewb8bvabXwtDCyNpV4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=A1BjzBC0a2866xIIjEAUBx/5F5Fq3b14IApyaATWRMFsu4LUmUrBdkfUZBiGZoCME
	 /bcNLKu83Hd9RZv6Rz40GEONZBwEFDnN4AZNG/Q+CSQZkjPFhDLoxwlVRNmH4qFfSW
	 rKErfr4zVfKzmK2k4VCOZlFFmFRka6UBonJM4/vCr0IBAzAOa1xz7RkK/VCamZITO6
	 MD9Dy7iWQxqPc6NNbKOACWekeTkBSqTa/IxkBKpuyxXDUnMzKNAjOVv8IsaSqAskRk
	 9o2FOGOgp5GBHi6AKiaMezE+7bBkk/FMthxpYecP0MeQOttjoaQeEQuLEnXvu/grMN
	 Wj3GGfZRFkHRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A06823C0;
	Tue, 17 Feb 2026 10:23:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E76E1EB
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 10:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F04B540C81
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 10:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgYDumyow_ft for <buildroot@buildroot.org>;
 Tue, 17 Feb 2026 10:23:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64D7B40C46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64D7B40C46
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64D7B40C46
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 10:23:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.105.180]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8GMk-1vfDKw3l1E-00uaNS; Tue, 17
 Feb 2026 11:23:27 +0100
Message-ID: <32fc646f-87e4-4cda-931a-2c5fb5fbab58@gmx.de>
Date: Tue, 17 Feb 2026 11:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260217075026.395724-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260217075026.395724-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:b6lCubSyAVbKdZnTJm1Qd2Xl4IHQ2lwT6q6shiUia+pViTcWfEK
 wa8DpjhwhfVfUjDW2UXuQKC8uIDcUHJ1i0s3s1u6t+kZxc6C1x1A9NlYcBRWZJqZiJyzeTJ
 Rqg9wlxm4DDMrFYqDAuh4PDODGmHJVL413Fo5PQss+Tx6g8l5YN23Dbtll/GGR/o35uH1wo
 9C0EFxAzspIArhkgZC6zg==
UI-OutboundReport: notjunk:1;M01:P0:O9Rnwc2bfKg=;8izj9W7upvemUdA679DGJx3Eijg
 O305JmalHVm2BoQP/FV57284fCN/w62VgZc8o9GhT2pSia2mAJTFGKELz3GMZNblmsyfA6B7+
 Qpydzt+6PEPLYHK9wRkHMGN8NKy7PZ3ItyXv4IgRqaDWqd2qRsN0KpTliY8Q/s4JpXhaeEwAy
 b73SmE2GdgOVtgjGKECPvfb+x4bnvGFohc+FSW/RUkxXpW3Z/+gChIAkGUKNIxkT/v151bofq
 6lZb3QV6blZW2UUYHudl8flQYnzVeI5Ih+RxZwbN62xGrC7SJhJDrpvUUo7tG/FXQYp5cQB4G
 axB4R5gnsZ+UPwjcXGDswtI8k35GdFHb1gp69XjOzGExxZHySDSxSipzyRvfGnAv4PbMnaKo3
 xlzJcL56/8+38TtahyOCBn6un3y3UpjwjXNEiMZHGw0pzeBDuCC+3QSiISEXu3cYM4a56zQHS
 qCZ8dX6GshaWEnOfgPTlUg8mavGGs/BgfYQ5GTfx53zjQH+qUmkm9tPAfwH2b3LFK5RC7c373
 wH6aCodhdVeWbgdMFqf8fDMe8TO/Ky649sLfx26bSKWeJfb/Vn7h20pe/z6Vwz747RLywWP80
 0Qk8HVy4ZC2i3Rfy8fYJxV1vNi5TMrN6g1uJDKZUq2JtnbUFRZmq0Tz5E/w5GmQPEvSRJ0eX6
 P65L5JebXjuzd54p0myCVuVL0GekTYKI/USF6SHBXaPXxbvF4Oz3yB1y1wgSe5sljJpsCLI7W
 O8C+I2yyi9lXcfIcOdvuAU9XyC51Jj23ZU4gq7fDFqD8S8Q9YUIYjlZA1vJOMp5yav9adMpks
 UrlDlYlAnBYOtu/BTptjEhrBwnLrNBBIIrSCzJRipe8zEdPHWDl53L0wG8B+wHf7jayntW3kH
 zz+lOY9B4etu4alqkr8MLVy3/1wBwlkRdej3H1WX8P0eU5skkNtlqlqDWrTkOgb4dF+CV6bXd
 vcwWjHaQgpvTzqCawCutHEG1v1fyL25sFyeDAzzIN5xad9oEvVHwtr3SMaSldWqwfrACI+YKY
 gOPsA5GUCnXCJtPf7wAg0VB4Q6nKLAHYlgJynM+fvJ9rEsvcEXVR/VURafbI+DhXkkmxlP8hc
 Oy6msLaB5jb18BNozdNVxwvdKAXYBMFtm062vTvl3xTd9vUMZyOY0w4ZWpx6zwOtIR3WGloJd
 zWNAi8oZSywI5ONAohL6KOrcW/dzSr0NBMsHHMrqD6TWwWKeRgy7+B22Zg0wuPxFIOnENGrgO
 omGHnx+LCGnTQufquSC++WODBieQIbIkYaCVm4cxV3iHhskdgZ++5Z2vufz335YRkOAKnBzAV
 s1e5CBaXSXP+41J5t2o9POSNiq7enbrJr9IbvFVuPDDQtCYAEJYR5HEwnG1p2FiBz0j0qZyPg
 HVZj31Dy4vuhJu3E6g8l2y8e88gqg76N5Bd2/RaTQxSpdHZNCD93lbZYDewotY3gMzNjlbh9o
 U5WRQIlB933hRu3JB0RPvo3rnsM+JjtzIvUppznUb0vQgcdi8w08f1WADNoUH960BO3acyaWY
 AvYQ42wdBDlsvelfu6dg7roSdlHI/9aBw0OV1TVSAwdjkIkD5jLwPLo7ZQNYSyH4ZNS6cWyy5
 stMLBGXzBuvNp7SBRY8cgUbK2ReA7YZ7Uf+l30ceH4m7LM68IVpvaftpLODrSebGCTIJcEN/e
 un6+6kMIkWXbq5CeFWi1ZZxcnAleyR3Q22mMr63NNjZoTMsR8TEMf9qir9+Y1GVL4ae2Iu9fB
 9lR03N03DXuFBDLEaZhndzip/IT6IvxPxSM2tD48B6LliBEGwulCsPVSjFxALMCuZqMgxebx3
 RM3+l25cg6jA9RJCvtlKeWAJtpmOiZL6NBf+8bZSeU+FZxAR0zGOa0MQx7i9U17S/ly/FqD5v
 ixylsI4rso1SHiYqYqqpekgTj4yJk9NTUKZzW1P62Cfi/SHb8ZH6Stxlz8ut20dCLR+/73O09
 hso2MJSplbx2D2woEatoHDMByHUkZ5z9mY00KrW/z9E3B20dWUySXuTWbslAXqOoxUH8hwzOS
 6I5rHT/MTRGHzivoIuLwujaHka5/Yz6RvQA5Tow5H+xNJAvJoqWuYRqwb1THnwdDK9dJYdGwI
 I9y1VXRDH5GlhLpLe+HQDb0WM0juPegbO0snGsG8yQyMamNini4XGZZWNd/GENOAPLTFYDz5b
 CvzZKssG9v2UMVthYh7Mo2d6llJmdj7/Hehyi4pfPyorK4/yZKvcnbw89T2r6k8cklrfQt+PK
 Hq8Kw3lqyQL8M/1vEhfBCd4q8qV+sY07Z30VwWYkEtnB6wP8eYGNbHdKXkFtRDZRehWJsSfTv
 VzHok2bK1CFvZqzJ4weXmJm5BRzpTjg3NKwhwxNs5LFls0fvi3C+zKFLE6jcsDcOz4MOEYiVd
 OJf4Lyyc/NoPfjg6ZexbF+TKuNE8xiySzC9e3EdB39ukp28tv4c7etWQoD8ec6UHxXew8feWJ
 CDnRFj51A/0EiHVq8Yk2QjLRyuP/u2fcjh/lwqO9sEMX4wHLoxjIDyVLMZy2rXsHD1x4OEPCj
 FYRAvphQsw0HVGrwUmLBi0B12P0aQ6VfsHB8vx/An92QemUA4RnQIehIQXOSpl6uj6PgOiYbc
 t5wigw8cEuHofdtihYFoKm0zWJ3HC8LyPcmIDF7V+gKNI8tyOOD9X66pA26nIXaamMCHZt1pm
 g1Jorl+Qde+RscJ9NqfhALJAxisuKXP9cftbfAV3fZsQjBSH73zwKu6r8xDaCJaD4Xka8QuG9
 d6FKLxlaQ6YD6Xr4g1MsznL0DbQjRnOE4NjdMQ1HznSsFeegLrilid3n1AgARAtbV3O93FEH7
 HqF9AAhvOmEWq3b4ZIVqCLfZkLRAwDsjXfidlk1gIqTEkoikJkDl60gEDeGNgJ3WNW2LeLAsa
 Ii/cxNCRWhRau89LjRtTArDPvAm3QbUBR5wNIYXmsFvNBFGGXdFWqOWXo40PjPKImvm+sZRLA
 mclr5WXh4xAe7/1uiAosQuV5uSD45YinuU+ocJ2ahB08qtyZ/QaPviaIsfd9/99vxjZxFyR9s
 vAA0oj0IDDgHI+FBUa0hJ4KPWXO/RUxksSRaYELJPNFpdejhy+KxoXszI7JDii19gKtZCZNxT
 Zb6GStAruIo+wOVqPiLq3cisXGhCu3c5at7Jc5k4k8W8kWc3vNrL0x7pJsKGNOetYjajjCOHv
 CeoR8LWfS3H/nALUjHNom/lWf/kf1H9mUdhzkv4bwb11p7yquH8wwXcNXHx6XuMdjdehCOwrV
 oUNV3zBwKLfuMCsRPfEFawQidwpg4yUQBWpUZ/i+jGnmLgu3ImgKgkye2IlfFqO/NMyFrP1Vq
 hWoOlUMAx4HBc+mQzf5kuKuLcwl4nobbUc0MeH3JS7sDXRJXeqeGecQq7vAonRAGU/kai493h
 v7JKuf3lS0Dfk3mJ+zu9KVIJbmpoL0Xt/zPevSaR7zpi84BBCZdTflE0SUu+O0Bay93B0Gunn
 4RW2dI7oQ3CImNDGI7EthZhuqw2KRHvs+NfHOi4pR40aBKQy/kAXHfoqSaQ4vhChuxSset4PJ
 7ceZr+p6/baspPZcn+ddjV9BiSiUQw4Aaq0xtMklwQWfVrZnLaMY2eX0Fhm+K/N4ACH2fEUUO
 2isIDNx+YNQN50F7PQVZ/9ni1Q+wxpeGFfgpiff5Jbunco+7ztWlzEpZzLwVD4RS9LrDQVS4N
 RGco3dGGbYbMET4i/cdWQGwT1tIG3u+YbAHKOY1jwtPNVGjtczapyXw3xn1IQCtU91AZ102RB
 SOu7zhuhwe/AWS4Fjf3K5Jc+uTe9fFHz75BMCe2vd47Q6u8R8jBCaoCF0BhshBCxjFoxILRQB
 TZXCjeoVjdA0tKZZ4IlJRGGv7BoGp9WIS8oZIIDquiEdxBXT/xRTqjmFougx57YRmWkgd2ebo
 HZRaC0Saxo47AOK6JIwqpbMAHjq8yWcYglxxaKhnCyIQz411NiDi1MUxKE+QVhOI+yqj/4aus
 yiw0SfpIVVuk18f6R4j3ndXiLwKkEDoRz9Vh80iWfkwuQBYs/1Vh6N+uKSafTODLn9ATGfwnp
 GzYQd97O+QslXvT1pPLejbYLZ76WMPQGl0JcGl5+JXzeGVzNfCvmfla40fOf2IYaqeVQTydes
 GoLFr5t/zq3bBWb9eDYhZYiS8CITT+pCHrwOxZcrUPkxxH71/czt/VYyFl8qn45HvStblQEUE
 FIrqj1FaMIDmKtMx0KCtaeSVz8HsETZdyTYCdY/h3zoOOSOdHMypk4PJKxDesOHtViN2m/ySo
 MdvPqYEmRPCcqIl2B8DEAjGpPot4yxEvr6unt0tafcqxZTlFl+gw3gm7VaEM+Frp74FAEuV0m
 h+X8XnZzotqGMwP/Ai8FG9Ns7ncmfP51jXJJV0NPbXvjSt/pcImmQJ3RpJ4AWJq4N5HuYjhpV
 +VSxddHZqSTJr5aXglfshGLvMH/Vz21JKHT3A5Q0SIWLaxGFSHBB5vFPDJ9rb70FfIV27Jp6J
 JOWep1Npn1/Pz+/TGk3n3j30YosZlfBc2dwDLBJx90GPlAl0c9vKnOqw/65nEqtyBCtaJaVsr
 NjzB9Ec5+ksYwwBONkLu0Dw2Phdp7pBtKYVe37XWUH3STYa46WQD9imwS5IrqTJDpW5uIDo65
 PDaYkP/Ee/r4dmDOP0QdtnwRGpeKww44zLVg46Si8HbIwQN7C5z6OsaygSffEpvx4nfeOv/ig
 ZfXpvFHVa0j1MJPDC2x6B/zLu1bCw6apF9dquSlLbhpeR1Ika4IspagjgA2Hg6TbrSI0k3sUk
 skIg+ysH9NEDmju+c4ohDgsfuV6nmMohAjT20o4UNmkYfkaPgM1kN+KTUBOUe6Cf0CPIeCABh
 hyJfnnAisjagIDhlLANUHCit+3Gxnrn8zo3r8kEt+gjQOMEnYnerKC6qJDnw/h5vucMzSy51r
 rhMhJUTiNsulfmne4aRv5EksYAA357VXtllmc3HkGNv1Q9pzjSI4fdn1qzynRmR1WdPa4CeKx
 btBIzQPJFpwPT6G0mIrzYUEHaOGxVkCY1pWqPPdYfVdJQ90zSIaD8v+mDDFHq7pxkByznxM/d
 Ai6TnJxEjN8eKiW28LeAYHAAL5leBGv2MmXzi4dsMx8wvU60jQobkBW1c3Xq9diyKmWjQyTyu
 5Kc2zi7wWTMpjBxbrNTZjeQJj8JMJHNGtYe6h8gxtOGR/l5E7dRGn5S66g0bXP8siU47wFILw
 UpqtkEGk3rWae7TBFsSmzIxZ/LZS5TYoP1ZpMOWBPMT02l2kRCnq8IXBtRqalzGb61HiUVQ8s
 LSRIDVo3/9USJIY2wxjmTUXOK9txUO2Gt+B0UX4F/Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1771323807; x=1771928607; i=fiona.klute@gmx.de;
 bh=bFXcgnK6D+9UU9t6aLwD3o4WvMbM7seDziVeqIhqMd4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=qkvpObSGN7rFl+J9Jecv4EGreoEbXlwZkv3s7jqHa39NPXbF1UPD1UMtxM0E9LiO
 qfU0BcvOCjGHXzMe29c7ql9hDDrjVxA8rmxZInle0eiKiYPW8th27hT1w7OuVqbi2
 WOw++9a8p+ODaXArglgWWOXRB87Ztl7Kj8JF+3BoUUhSI2QCTJbNCAkaUnHIOqlEv
 N6NEwMUFt+ZhBxJ33wnP0hq5shUUf+ZRUCtVN/ZBS1GopA2GsiJOHO3MjB9afyJzM
 eOBtPQ86jBsWDCq2lUewl9trYsz/Nu5pD+SMygsFwHR1yLAf8X9nGD1ZGp5oNqlXm
 2+zdlDCuo4+UARU6sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=qkvpObSG
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 18, 19}.x series
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

Hi Bernd!

Am 17.02.26 um 08:50 schrieb Bernd Kuhls:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   linux/Config.in                            | 2 +-
>   linux/before-6.17/linux.hash               | 4 ++--
>   linux/from-6.17/linux.hash                 | 4 ++--
>   package/linux-headers/{6.12.71 => 6.12.73} | 0
>   package/linux-headers/{6.18.10 => 6.18.12} | 0
>   package/linux-headers/{6.19 => 6.19.2}     | 0
>   package/linux-headers/{6.6.124 => 6.6.126} | 0
>   package/linux-headers/Config.in.host       | 8 ++++----
>   8 files changed, 9 insertions(+), 9 deletions(-)
>   rename package/linux-headers/{6.12.71 => 6.12.73} (100%)
>   rename package/linux-headers/{6.18.10 => 6.18.12} (100%)
>   rename package/linux-headers/{6.19 => 6.19.2} (100%)
>   rename package/linux-headers/{6.6.124 => 6.6.126} (100%)

Renaming linux/6.19 => linux/6.19.2 seems to be missing here.

Best regards,
Fiona

> diff --git a/linux/Config.in b/linux/Config.in
> index a0814b2787..e32f252440 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "6.19" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.19.2" if BR2_LINUX_KERNEL_LATEST_VERSION
>   	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
> index 4352943b52..d523173bb0 100644
> --- a/linux/before-6.17/linux.hash
> +++ b/linux/before-6.17/linux.hash
> @@ -1,6 +1,6 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  143e8bc76cc41f831b51aa5e75819bed55bed41f299d35922820f1d2d2b02600  linux-6.12.71.tar.xz
> -sha256  a7aefb9f8e9be2314a66ccda708257d1c2dc04e68235cda987879597fc89794e  linux-6.6.124.tar.xz
> +sha256  4059d394cbf8e9548df36d37e0b8a80c4409ac4e14ecc5019a72a770ef7b41ba  linux-6.12.73.tar.xz
> +sha256  16742f4e78abfec8cc9205fb3cf79d63c7e819c33bfc691402683402c350ee2f  linux-6.6.126.tar.xz
>   sha256  fd2d033321bd15e0ad5669208b6e43f3f93ccecb059a512ca6b913ca940c38ea  linux-6.1.163.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>   sha256  fce4b1c86688880932ba8f755880cbf390a89453464bfd90b9a1b01a121c2998  linux-5.15.200.tar.xz
> diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
> index f7effa8edb..6edbdd7471 100644
> --- a/linux/from-6.17/linux.hash
> +++ b/linux/from-6.17/linux.hash
> @@ -1,6 +1,6 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  303079a8250b8f381f82b03f90463d12ac98d4f6b149b761ea75af1323521357  linux-6.19.tar.xz
> -sha256  d6d377161741ada2fab28eed69143277634a2aeb5e3883e50c031588ede48ede  linux-6.18.10.tar.xz
> +sha256  88611981582cceb7cdd4d688d9d881073cf4977176252193a23ca6d4b982ee5a  linux-6.19.2.tar.xz
> +sha256  e003294ad4c2c2ac5bb77fbb8259511134f51d987b3212516832dc4b0c83f1ea  linux-6.18.12.tar.xz
>   
>   # Licenses hashes
>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
> diff --git a/package/linux-headers/6.12.71 b/package/linux-headers/6.12.73
> similarity index 100%
> rename from package/linux-headers/6.12.71
> rename to package/linux-headers/6.12.73
> diff --git a/package/linux-headers/6.18.10 b/package/linux-headers/6.18.12
> similarity index 100%
> rename from package/linux-headers/6.18.10
> rename to package/linux-headers/6.18.12
> diff --git a/package/linux-headers/6.19 b/package/linux-headers/6.19.2
> similarity index 100%
> rename from package/linux-headers/6.19
> rename to package/linux-headers/6.19.2
> diff --git a/package/linux-headers/6.6.124 b/package/linux-headers/6.6.126
> similarity index 100%
> rename from package/linux-headers/6.6.124
> rename to package/linux-headers/6.6.126
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 09c6cb724b..d53460d07d 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -467,10 +467,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
>   	default "5.10.250"	if BR2_KERNEL_HEADERS_5_10
>   	default "5.15.200"	if BR2_KERNEL_HEADERS_5_15
>   	default "6.1.163"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.124"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.71"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.18.10"	if BR2_KERNEL_HEADERS_6_18
> -	default "6.19"		if BR2_KERNEL_HEADERS_6_19
> +	default "6.6.126"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.73"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.18.12"	if BR2_KERNEL_HEADERS_6_18
> +	default "6.19.2"	if BR2_KERNEL_HEADERS_6_19
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
