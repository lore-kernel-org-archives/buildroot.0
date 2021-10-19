Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E07C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 15:17:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C68561074
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 15:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C68561074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iml.fraunhofer.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2A3B40766;
	Tue, 19 Oct 2021 15:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFXLaVwodlqJ; Tue, 19 Oct 2021 15:17:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6064340758;
	Tue, 19 Oct 2021 15:17:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD3101BF2A7
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 15:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C17860BFA
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 15:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsHiYEqpsYu5 for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 15:17:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx-relay89-hz1.antispameurope.com
 (mx-relay89-hz1.antispameurope.com [94.100.132.89])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0C6F60A65
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 15:17:34 +0000 (UTC)
Received: from mail-mtaka26.fraunhofer.de ([153.96.1.26]) by
 mx-relay89-hz1.antispameurope.com; Tue, 19 Oct 2021 17:17:30 +0200
IronPort-SDR: 2N2NmPKiboRRfABlJjt2OZB5rFNu6BLbnUqzZBzyC6oZf9Mb4zYIodQ1zHMXlwcrKFX1VxbIv3
 SAQqtF9dQ+hGApSpPJu1h1OJdr6hDXsi4=
X-IPAS-Result: =?us-ascii?q?A0CQAgBt4G5hlz6wYZlaHgErCwYMIgmBUIFRUX5YASZDi?=
 =?us-ascii?q?AwCA4U5hWmCJzgBmjmCUwNUCwEDAQEBAQEHAQEqCwkBAgQBAYUAAoJMAiY3B?=
 =?us-ascii?q?g4BAgQBAQEBAwIDAQEBAQUBAQUBAQECAQEFBBQBAQEBAQEBAYEiZGiBT4FhE?=
 =?us-ascii?q?ws0DYZDAQEBAgEBESgGAQEUIwEECwIBFigQMgceAgQODRqCTwGCVQMOIAIOo?=
 =?us-ascii?q?QoBgToCih94gTOBAYIIAQEGBASFChiCNQMGCQGBMIMGixCCDUOBFUODJYEFT?=
 =?us-ascii?q?oEQBBiBSINNgi6NDoE7BRt4Nb9MAwQDggWBLIpKlEgUlWuRMZYLjG+VUoM0A?=
 =?us-ascii?q?gQCBAUCDgEBBoF3I4FbcYM4TgECAQINAQICAwECAQIJAQECjjaDWYRZhgVCA?=
 =?us-ascii?q?TECNgIGCwEBAwmFRwEBijUBAQ?=
IronPort-PHdr: A9a23:r3g1YxCOY5NfD87Rsx0gUyQVjhdPi9zP1kY95Z83zbRDbvfr85fjO
 RnZ4vNgxB/MUJ7A4v1Jw+zRr+j7WGMG7JrA1RJKcJFFWxIfz8lDmQsmDZ2KDF29KvP2PGQ2G
 c1YXwpj+He2eUFeBMf5YQjUpXu/pT4fExnyL0x7POPwT4/Xi4K5zemv/Z3UbQhSwjawMttP
IronPort-Data: A9a23:RmJC26/N5OuQX0hwitk/DrUD3XiTJUtcMsCJ2f8bNWPcYEJGY0x3n
 WJKX2jQM/aKa2Sge4twaY2y90kF65TXy4BlSVdv/CBEQiMRo6IpJzg2wmQcn8+2BpeeJK6yx
 5xGMrEsFOhtFTmB4EvF3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es7wr9h3uaEvPDga++zk
 YOqyyHgEAL9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9UPrzEZqMw07QGeG4KAIaq
 9Hrl9lV9kuBl/sk50jMfrzTKiXmSZaKVeSCZ+Y/t6WK2nB/SiIOPqkTONwTRBgJoA2wmopwl
 vFEt7vgUwQCB/iZ8Agde0Ew/yBWOKpM+bvKZ3WvuszVwVfPbn3sxPtjFgc6MOX0+M4uXDoIp
 KNecW9TKE7Z7w616OrTpu1EndguIsDtepwWvm1t1xnYCPJgT4rKXqPK4tFVxnE8i6iiGN6EP
 5dDOGsyBPjGSwFkOXIRUbAap7rrh2CjKgF4mXS4u4NitgA/yyQrieO0a4qEEjCQfu1NhQCCq
 3rB5XjRDRQKctqS1VKt+G+tguPVmiTncIgPFbm07PltnBuU3GN7NfENfQLm+rzo1QvnBIwad
 RZS5C9opu487kW2SNn6URCi5nKJ1vIBZzZOO+Ec5yzSlIHs2gPDBzYgRzxmOMYln/ZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuO1c49cTFqicgsEFJt3jXznG0gpk+WFIcyS8ZZmvWkRWCpm
 1hmuQBk3+17sCId60ms1Xzq6w9AS7CQE1Vwt1qSBz37q10jIpCgIYfu50LS8PBAK4iUVB+Ns
 RDoevRyDshQUPlhdwTXG43h+Y1FAd7eblUwZnYzRPEcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/QrPtLoW5xynfS4fTgAahwyRoQeCnSWXFDclByCmWbKgD+FfLUEwfhkY
 sfLIa5A815GUPw7kVJauNvxIZdxn3tnnjOCLXwK5xiqzKaFb36YUv8LN0GVZeAk6qyfpgjJ4
 b5i2ziilH1ivBnFSnCPq+Y7dAlSRVBiXMCeg5EGLYarf1s5cEl/UKW56e16JORYc1F9y76gE
 oeVARcIljISRBTvdG23V5yUQOO2DMgu/SxhY0TB/z+AghAeXGpm149HH7NfQFXt3LALISdcQ
 6ZXdsOeLO5ITzibqT0RYYOk895jcRDtixiHIiylZzYyZdhsSlWRqNPjewLu8ggIDza27Jdv/
 ef/i1mDGZdTFR5/CMv2ae60yw/jt3Yqnu8vDVDDJcNeeRmx/YUzc37xg/Y7LtsiMxLGwjfGh
 Q+aDQ1B+rvMpotz/sPAmKaEqImkCa1yExMCTWXc6L+3Mwjc/3aimNMRDrzXIGqFDG6tofesf
 +RYyf34IcYrplcSvtouCatvwII/+8Dr++1QwDNiESiZdF+sEL5hfiSL0MQT5K1AwrhV5Vm/V
 k6VoIQIPLKDOcfoVlMBLwpjYP6KyPcUnTff97I5LRyitiNw+bOGV2RUPgWN0XAMcuEqbdl9m
 epx6tQL7wGfiwYxNorUhC5j8WnRfGcLVL8qt81HDYK32BAnzEpOPc7VBiPsu8vdMogXdxh1Z
 2bL2u+c3fJCwwzJNXQpHGXL3e1TiI5ItB0TlA0OIFGAm9zkgP4r3UQNoGptEVkPlk1Kg7BpJ
 2xmF0xpPqHSrT1ms85OAjK3EAZbCRzFp0H8xjPlToECo5VEi4AVEFAABA==
IronPort-HdrOrdr: A9a23:u7nLqa65XfsX2NzqWQPXwWSBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qADnhOJICO4qTPmftWjdySSVxeRZg7cKrAeQYhEWmtQttp
 uINpIOcuEYbmIKzPoSgjPIa+rIqePvmMvD5IfjJjVWPHpXgslbnlxE422gYylLrXx9dPwE/e
 2nl616TlSbCBYqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEw9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyTpAJb4RGYFqjgpF5N1H22xa1+
 UkZC1Qefib3kmhO11dZyGdgjUIngxes0MKgmXo/kcL6faJOg7STfAx376xOyGpmnYIrZVy1r
 lG0HmesIcSBRTcnD7l79yNTB1ykFGoyEBS2tL7okYvGLf2UoUh5bD3PXklZasoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blngR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjia2jPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjTT4A21rep2GzX2MSmAtBjWu7JjDqlCy8nBreDQQF2+oXgV4rmdn8k=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.87,164,1631570400"; 
   d="scan'208";a="2052995"
Received: from 153-97-176-62.vm.c.fraunhofer.de (HELO
 mobile.exch.fraunhofer.de) ([153.97.176.62])
 by mail-mtaKA26.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 17:17:24 +0200
Received: from XCH-HYBRID-02.ads.fraunhofer.de (10.225.8.59) by
 XCH-HYBRID-02.ads.fraunhofer.de (10.225.8.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Tue, 19 Oct 2021 17:17:24 +0200
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (10.225.8.37) by
 XCH-HYBRID-02.ads.fraunhofer.de (10.225.8.59) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.15
 via Frontend Transport; Tue, 19 Oct 2021 17:17:24 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHzjfosVLAkfvrHgu7P6yLE4OtMfZkxNJlioObl/nIrCqzk0/0uJK0AOgTyDzii8DuXhEuwfXTbprojVn4pROm9Xo4piaL8ajezFOLiQMA+ygyc8htEo3Wdoi0L3QJCqzKhSqln5Gc0iAgrP2Pecxp4gZadT34QybH4esKS5z4BKiF1o0TRFC37jWp/s8EqD5CqI4aDVmcv1jDsDuDpJ42x9dDgsW/fkEdcaLyMsnu24ap6O9ZjzgGa4tof+whaiR6A3lFk9YJneMjjgPO9hh+7QB8RPDXox1XpKzbOycJdjJecPT9nN8Mek/azS1ixFcHwNO3PQL4kq9b4hJ4YMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXWoozHqFXjhWwEcHfas2hSbKnCxybYfgnWcKG+6Ggg=;
 b=W1KbpUzwbYwrmIJNEnwIFxqMZ77pQVrM2eQhkbxLDXTvPJq9/yu6J22Q68qWOYtmae6dJtMDdu4NlZaKM9jyA97aQ4GyR/5tklFWW5kCoyGQ4xsRVG2N5GQREkxeWLqvV9qZlLQsIwDIzdnYZMLBOXohY/QxKHRvvD1cGAwv1H+ACFMqpCx7sVRXct+1Jsw4qbpzoZDvThgr4e/Ha5ZOSIkF3geeEQWY6t/kCRLc6zNrF/RBgbM09W0JNW3gxgQwHXpuKkkku15eeRtCcthuX0Q3D9M/muKdhjpTDI4qU3PJSU+CnBV4OgQilZJkeXido+rnXMcQRnR3tr9CBz99VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iml.fraunhofer.de; dmarc=pass action=none
 header.from=iml.fraunhofer.de; dkim=pass header.d=iml.fraunhofer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXWoozHqFXjhWwEcHfas2hSbKnCxybYfgnWcKG+6Ggg=;
 b=qKbfIkuGVhdtH+s7MQQu03SeYLe1PttmeY8yf9AJoOd/v8GD1a3UHtBsrxQ3ke1f2OB0eqE+Bv2ieRAeaPRgjNZDTp1CXRkVcE8okW8pxjAaXVBrR1ldzy7MS3OnFrIxn93Z6IBLPLmew6UuOKrgk5XIOJgwq7rVoI5IRadkRig=
Received: from AM0P194MB0706.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:14a::15)
 by AM0P194MB0692.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 15:17:23 +0000
Received: from AM0P194MB0706.EURP194.PROD.OUTLOOK.COM
 ([fe80::d874:47f:22cf:a6cf]) by AM0P194MB0706.EURP194.PROD.OUTLOOK.COM
 ([fe80::d874:47f:22cf:a6cf%3]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 15:17:23 +0000
From: "Walter, Stefan" <stefan.walter@iml.fraunhofer.de>
To: Peter Seiderer <ps.report@gmx.net>
Thread-Topic: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
Thread-Index: Ade7uZXHP7nGx63eQL+BAdw+WW1TNQAC7xCAACJQTnAABr5hgACJCEnQAA2810ABaoRLgAAi5Iyw
Date: Tue, 19 Oct 2021 15:17:23 +0000
Message-ID: <AM0P194MB0706FB2963323BD5D657815EB7BD9@AM0P194MB0706.EURP194.PROD.OUTLOOK.COM>
References: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211007235019.51751a53@gmx.net>
 <DB6P194MB0022286BBE77E2174FE40B87B7B29@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211008192555.6dbd67d2@gmx.net>
 <DB6P194MB0022742E4E1B12DFEAC7FD24B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <DB6P194MB0022C662CECD3D29EB4BA064B7B59@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
 <20211019002255.165e5e00@gmx.net>
In-Reply-To: <20211019002255.165e5e00@gmx.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmx.net; dkim=none (message not signed)
 header.d=none;gmx.net; dmarc=none action=none header.from=iml.fraunhofer.de;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1dc864ef-7365-4b35-5f2a-08d993138d9d
x-ms-traffictypediagnostic: AM0P194MB0692:
x-microsoft-antispam-prvs: <AM0P194MB0692B69B483C857E53DE9810B7BD9@AM0P194MB0692.EURP194.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GWz2kRei5V3Nt8r3FNlvRBj8phris0eGs089NIf+Xw0YSQJACI2Kn0Ux1WCeckeM1/rvizy6KwN3QTeXju6WgZACrWj2NXNYpXXXqKP+RYgxxZJ3N2zxBK4OwY/7895YiuUN2qhUcEG/HFWkJSUZy0sUEqXmdrvkr26Cc+n3547QmOiiFv6e/1lHVbNxQj6ZsXnDEYLoPOd9zMc7cD40vgtu5ailfLmwYGHmV79cIarvDhFek+N0d1rIL+aMui6YwGIC1ItMy8mryYfdoY5puoPoSoFxa5clxy/q9VrW2dlYGRjGcH9KaPbYbv2/g7VdIa1eGD5ggm2I6X3qV244qdRwqajR77bIc7Vs3yt4QcmdedCvoVFc4QoWvLEKrXB7Hw9JU235UpucU1QBGzbVcdRI8sTVnWTshEohGVHDdLhdMSiu1GVX7V0IbK8SZrzuZ+EjjExZGu/+pGLXZS+II59NRXTXvQHIaYGjUAPly4sO4mic1g6TIus7sDEOFdhhGamVUMDQE77UiStzUik2bEDHdH705DP7iV9ZH/ytOiOvTGqy5o3UfVRHMOxDa0A11fFX16HHNapmSYF4SWoX6Q+QZ+enfLN3kxlsFlfcOIggElJcJVY2w2fKmG38uahB6+hC2EW+BO3Skw0McsAdBvd4Dk65OjtN4X4N4AzQQU7awF2DBZwsWJccj9XKrOBgSYOl1kIhfK3HrZGS3FjMDcHd+Xwcd7RM1ipQurnBZjUYALSktn8luAkBu/56OlBBHfXdneblZ7uuExm78yC+G/mW9CrfpFhg/wMTtWbeyh4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0P194MB0706.EURP194.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(8936002)(122000001)(26005)(966005)(8676002)(66556008)(52536014)(4326008)(66946007)(6506007)(76116006)(5660300002)(7696005)(66446008)(66476007)(64756008)(82960400001)(71200400001)(316002)(38100700002)(508600001)(33656002)(38070700005)(9686003)(86362001)(55016002)(2906002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QQvypNGijkQp7PXjaU+ARHl3+wpNR9DP97xUnRcGcNw+es+xdCNbxPk/oisf?=
 =?us-ascii?Q?TV1N8BKae6b7k8pt5UUIIgidvlBD9YnkAf6X6A+g4e6wFIeFP8CMYoNss4na?=
 =?us-ascii?Q?kaU5uoqHLVOQw4s2JMfJngXW8pClcCgD010L4+Dl7mCbDyqm/ZYMukve/3xG?=
 =?us-ascii?Q?SI14jBc2RcHyWxpNefeeSqZ43tdV5W75HHP1W9BHmYkKihA7gJJzQ+SiIkBL?=
 =?us-ascii?Q?jGCpM8bMYhLB4dV/UUkDhD/fItLs7ISswH31Hj6s9B9zAIysYxTjlXxWU4s/?=
 =?us-ascii?Q?36jP43XuloJgSN3kZOxayexdAPugvWEG4fTUY+tj1S8wKrKptOSWsghA9U2p?=
 =?us-ascii?Q?nheZedZbWFp521nhtkl9CnOIKPWkNlBsoH/WcJuVP77DHj+zRYXjXLIPfDsR?=
 =?us-ascii?Q?qyGqU/wBPV0TLa4T7azoDNTtUsEiA3jw5g563W96j4TSyPR8Ac2qNZkjQsOV?=
 =?us-ascii?Q?Wc224h2ouxU9UHua9QbQ4RxJOBrOdpLLVevcjWMossOYmlV9083V4bDUipeQ?=
 =?us-ascii?Q?qzuY11xcV2Y+hw5GeIvcs1lZBlrF3Tmre/25bd6DeuXs+JnFPKqW1JFEcpd3?=
 =?us-ascii?Q?otyNQK4nRLibsZv3M0FG6ZwPZHM0hcaxnr3oWEw/hmLn6LYC0ufxekY3SMfz?=
 =?us-ascii?Q?Q7E2G50lpos8oLKMfzJAX1rcap1gGCds0TMhELVDexVMMVFpxUXGs8/Rp1S1?=
 =?us-ascii?Q?5w7gDfC31s6szoTF2ej+i7dNs2lcq9D2ZDCrJXICa2uFLQMBv0DnfT77gLrK?=
 =?us-ascii?Q?P3MeGDXoHpSFfVoAcuvj6yzsw2xKwffvA+u5s+/6gdahqBoknR2fQp89hnxA?=
 =?us-ascii?Q?FwyyHOk1safGohsbzPEI6vCSm454yzhEtn+Y7ABGC3GxvgapUyThSjGeQHi6?=
 =?us-ascii?Q?xKNrcYiyZtf01KJ6e4N+h/oe0h/Y0pQHSns5k+ynZVOGRbc18P4x4CZCGQ3b?=
 =?us-ascii?Q?232ze2qwJMYTHYGVri1WZLfLmtZnmvgoU314uWbmf0lmuGxMxdqlQSHfuewc?=
 =?us-ascii?Q?HB+2/M9SAgVwu2MZP51jY5ykPI6yu4gUzw4onmdn69vtJGlKAYeKJ6bNvkIv?=
 =?us-ascii?Q?eO5q4CS4Kd47MaAcbp1jhNDithYVi0ZCp0zZoHeDXeUlI65p1+AI+zSFUu3u?=
 =?us-ascii?Q?7dLWlFnIoounyQ+79elfl3CDyjVZE993kVTdj4+lno2raSqPmmJdlWjsTrzx?=
 =?us-ascii?Q?oAw05vzm/uCusBbQVY4WrrcVc1Q5X/IBAZx5B3M7EYOyR0DY2XL5iaXUsH3h?=
 =?us-ascii?Q?0+6nWCHx0KzBG7xCKIBFjmisBB0kRZRebxX2BsWP59Z0evmtuCL56CooH1VD?=
 =?us-ascii?Q?G1VcYA8bbm+aPc+bA8a3KFej?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0P194MB0706.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc864ef-7365-4b35-5f2a-08d993138d9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 15:17:23.8770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+7XGOCIKz2IezriQlZT78BQqexUOsWuvA7ncneBce7QoYzPvyLikGrj4y/WACsGYDv6dd7+gEl27kuc0lCkSVxVBmN1d6xeO03qb4JlWbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P194MB0692
X-OriginatorOrg: iml.fraunhofer.de
X-cloud-security-sender: stefan.walter@iml.fraunhofer.de
X-cloud-security-recipient: buildroot@buildroot.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay89-hz1.antispameurope.com with CFAA41243C4E
X-cloud-security-connect: mail-mtaka26.fraunhofer.de[153.96.1.26], TLS=1,
 IP=153.96.1.26
X-cloud-security-Digest: 3299f8e01184c34513d6d2f78411cc1a
X-cloud-security: scantime:1.679
Subject: Re: [Buildroot] Boot process stuck at "GRUB loading.." since
 2021.02.1
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> Can you try instead of your original
> 
> /path/to/buildroot-sdk/host/bin/grub-mkimage \
> 	--config=grub_early.cfg \
> 	--directory=/path/to/buildroot-sdk/host/lib/grub/i386-pc \
> 	-o ./genimage_input_tmp/grub_core.img \
> 	--format=i386-pc \
> 	--prefix==/boot/grub \
> 	biosdisk part_msdos ext2 normal linux configfile
> 
> the following one (makes the difference here for me with the qemu test):
> 
> /path/to/buildroot-sdk/host/bin/grub-mkimage \
> 	--config=grub_early.cfg \
> 	--directory=/path/to/buildroot-sdk/build/grub2-2.04/build-i386-
> pc/grub-core \
> 	-o ./genimage_input_tmp/grub_core.img \
> 	--format=i386-pc \
> 	--prefix==/boot/grub \
> 	biosdisk part_msdos ext2 normal linux configfile
> 
> Note the --directory change from the '.../host/lib/grub/i386-pc' (installed)
> directory to '.../build/grub2-2.04/build-i386-pc/grub-core' build directory (as
> the original buildroot
> grub2 install step uses to create images/grub.img...

there is no directory build/grub2-2.04/build-i386-pc, but there is a build/grub2.204/grub-core, which I assume you meant. I tried with that directory, and indeed, the resulting image boots.

Thank you for your help so far! I'll reference this in the issue at https://bugs.busybox.net/show_bug.cgi?id=14281.

Best regards,
Stefan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
