Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30954C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 05:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A77E41754;
	Thu, 23 Jun 2022 05:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A77E41754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PaqVWOJWgOrR; Thu, 23 Jun 2022 05:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 313F541734;
	Thu, 23 Jun 2022 05:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 313F541734
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B6091BF20F
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 05:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7576A60BF2
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 05:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7576A60BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pq2cTS9TMbuK for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 05:54:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C231960BB9
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C231960BB9
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 05:54:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnITSAOzERCqBi/AF4pY926WVi7vZR9CLgPsLpd1af3yAMHVCwdUYQ3nEZHWRiwZrhGHwYTgRNfgsJyo+SEHkN67AqRzfrDsnvP6puHZi0OTHhp/LJX95iPbD6X2/BVjsb0ZAEgkcfO3Ds24r3eNFnff6rGD41jRTymxjjE0C+DatnWMEmlCFvD7mlEDcPyscEOAmT/REkSHMsvQ0waokNZR0xyscXrOfcyoVC/VYIp9+HEoddNpAKyWKCBueQGslncaJAC7M5Di3bzmRt+zr25dcEwQT33m442sOy8Tm0Uky51f7M7QSHqJFGYdG8wFvGUq6hmtSfSaXJoKp5AXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktLAE+a6Z7TY5wrfKz/jX1ivms6btkytn3KhrzJqqOw=;
 b=mnY1NlXIN5ApmEfnOZYdndwJ04m8Wq++fAJAq0natN0ak8OXvN1Lr5wpkBQcZ6FvN38Fhipvi/jzM/3qNwoFojlOmuaAH0F14Px1SFHC6MQ770QxoB3VGZrneKxzK/SuYsAqefgEU8hPv+hs0GhOOROtAASo2L+H0ToE5bYIrPXt0/nWB8iANKeC7BIkW38cp0GBHwGisoKYHF7FxJ8AZIYd3jaWN3pIRRy0Rrp+21vDib1gAVvLLN27QSPz7r0jMTdossEWsuScJ/6WUqIcaAhJHYDJpPovqNrRdRE5gfJFGlqAqgKtMkzFvWplkHb0dw5nV+kjI5jaSUwedl49LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MWHPR12MB1199.namprd12.prod.outlook.com (2603:10b6:300:10::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Thu, 23 Jun
 2022 05:54:39 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::250d:5a1d:c45:222b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::250d:5a1d:c45:222b%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 05:54:39 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "peter@korsgaard.com"
 <peter@korsgaard.com>, "Simek, Michal" <michal.simek@amd.com>,
 "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>
Thread-Topic: [PATCH v1 1/1] configs/zynqmp_kria_xxx_defconfig: uboot dp pll
 patch
Thread-Index: AQHYbmd9gaU+9UDylEGY0VVZaYvTQK0vqcaAgBdOTICAFbZYsA==
Date: Thu, 23 Jun 2022 05:54:39 +0000
Message-ID: <CH2PR12MB5004B1F5774DC5F8B21D2F87F0B59@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20220523053921.4076488-1-neal.frager@amd.com>
 <16f0674d-b933-730c-7600-45453d1d21f7@lucaceresoli.net>
 <SJ0PR02MB7758323D519C1EAAC34AAFEAD7A79@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB7758323D519C1EAAC34AAFEAD7A79@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 554f2c34-f2c1-45e6-b068-08da54dcdca0
x-ms-traffictypediagnostic: MWHPR12MB1199:EE_
x-microsoft-antispam-prvs: <MWHPR12MB119925FC43752C93EF6376D7F0B59@MWHPR12MB1199.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xv3Uu9rEOdLSSMNfPvvTBWAvqOHCkM10Y6Bgvlo8bY7MEkpnvBSwaN8oqjwMXuIkVYHHJQRj7/bgWo+GJ906qiwZKOgRBKVTlqgM3ae4RCagqBd5UpHS+N8H51VNc6UOIdXhXwXroq9kAMnP81zv3V0i/xyMOYGULdQ301OX1uFQ69uu1l/UbStQ+pTSoWIvvekffQ+K4zvuxuvjYU5xfVkDCDZSlYScC0m3vlF8v67INHrTXTYihN1WAj+qOUFUJYMrALEd83wgUzcKo7MB1Iou1TwFEgkV0YFrLJD1KLHlf3DuwUD2iijiiwQo0L0jeKxu3RbOR3ROjZ2395OpgCu7PqPBHdNv7HLFk0N7DVIuRh46ZvWLUXGSi+UfKQRIEyzmwBjfZpr9IddRXtCWhs2OmxG/H3rpUNqZSaUPSCyB/1gGQxFak9hYJNzJ4jWp+Jzv0Zw5adF30ZCsqAn6XWyaAjnicWRVeVHLsv59YiY67sfrvQnHiKMMf3S6/YtaHdYzfR8B+MI6A9VTz1vPdNhXQcrqTNB/J+YFLq1wLVso5iryFQyQCxNbuYy65/hj3Dqy/rxSfc+uopWKzhq6rskZgzrxANadtb+asPu/biLcWReb0AGfYZclTf1KD+g+ziq49J4eAnBGMwIwPeQbsC7Z6JbKjdF8YjDUqGO9ifbNYdXn433e2gSPfszMDDPBUwaXX0n0qlgKlvcmbIl3Xx1iwX+GPA6/ymrWLiDotSypPeY7gzkEquw1l7YRqw7kJh61rqj8iMIYxShdrSj6C1YbBzRUuWVlb1hyxuzMQpY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(52536014)(5660300002)(41300700001)(186003)(38100700002)(83380400001)(8936002)(33656002)(478600001)(110136005)(7696005)(66446008)(86362001)(71200400001)(2906002)(6506007)(66946007)(66476007)(38070700005)(26005)(76116006)(55016003)(122000001)(64756008)(66556008)(316002)(9686003)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: SZX7d1OCf1/sVKIf8dybbeRYTBwERu9RWJNBaF+PfNfxotAR8LJFdXRbhp3MmvKGedlQrLCEqXUJZoD7zsYkhZsHPRtndCodez2z0XXU8pd3Ol0SE3m047/eY6vky6AJQbjert7U8DcWUdDtivlw4v9cPIbbZ8prHjjLataZyTxE2G6HrWbPpjfAdqwa8ot+gp4e2NPsEVdbfaohEKOxVa0CjEpO2YDoOmCICE+gew5VYyR4v0q332pAGJMSDoXTk0bdBgPESKqMrFDDhe9xLPntsJ0H5Bo3waywClvkqcld3TZNmQs0hmMkei2eZmygyeXvNSX+/yBnLWoqyD5WLQ1EPKydDq+FtQ+8ts6y3jHmPd6CHKmBDB7ufyUcPz9+1QTbWH6mMuSl+VvezBHTPxVT6noLzZbOe7OJAd8RyivH4YVsO8UMdRCCI+5P7AymFdJ8vVtzFrNaoQFE1VRAdoI2SjSzSFMpBBKUrzseukWIwxoEU3YmUSi2xeHgD9PWEsHLuR+coanrvyatJI2LVu+R0LTWa75DN1WAvkf2CUt4/E6lvHcdfL3uTtuXxKQiMZAFLeTEKGRXOzF2RbrA84MYhujmwU2n1sm9q0ax59AUdbFmOeQ0Yd5H6ncLfcRhpb9aM2wYvcQ5iER3/f0XmSD4bKD3UPrmgDIn/R/B9UHeiek0VpXFcH9jNbal/W+YmvBeipj/jcLvjMPbh1Ttyin9eqliYVgxgg+VDkY2qlpk5DyVgjNpQ/v5BICAD5Hy
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554f2c34-f2c1-45e6-b068-08da54dcdca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 05:54:39.6934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZLTZPeuK4bW8MHPrmBncq+gEUqjSMDKq8LAjXJmdr1X5dEO53gZovRFdkXjs/wN6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1199
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktLAE+a6Z7TY5wrfKz/jX1ivms6btkytn3KhrzJqqOw=;
 b=OZAB5q5ENVTMW0Cu+lbREwbhP8cBOxtGEjRhpg3Hs2n+i/R4FxjuVN6OGqGYs2OoebX8zsNVc9xdxmvHiHQNV6ydP2HuAQYfrOnVcprxdzS/0ANxrZhjBcsbMDP7YeUV1+KUetHkKLYRYrtRduU9IQss8FayrMzZdg3tt6FsyAk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OZAB5q5E
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_xxx_defconfig:
 uboot dp pll patch
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

> This patch fixes the DP audio and video PLL configurations for the zynqmp-sm-k26-revA som.
> It needs to be applied for both the kv260 and kr260 starter kits.
>
> The Linux DP driver expects the DP to be using the following PLL config:
>   - DP video PLL should use the VPLL (0x0)
>   - DP audio PLL should use the RPLL (0x3)
>   - DP system time clock PLL should use RPLL (0x3)
>
> Register 0xFD1A0070 configures the DP video PLL.
> Register 0xFD1A0074 configures the DP audio PLL.
> Register 0xFD1A007C configures the DP system time clock PLL.
>
> This patch was build and run tested on a zynqmp-kria-kv260 target board.
>
> Upstream-Status: submitted (https://lore.kernel.org/all/fa7e9abc419c9d7648405d1c62367dbe701d09b8.1652709736.git.michal.simek@amd.com/)
> This patch will be removed from buildroot in a future release when no longer necessary.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Just a friendly reminder regarding this patch.  Any additional changes needed before committing?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
