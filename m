Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA859C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 14:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8612D408D9;
	Wed, 23 Feb 2022 14:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DRZo_LdzHIO; Wed, 23 Feb 2022 14:46:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E69B40607;
	Wed, 23 Feb 2022 14:46:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FDC61BF3DD
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 14:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B75341599
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 14:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5PAr0_slNMwh for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 14:46:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::608])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A59B941592
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 14:46:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVLibwNC1vekdvNe4MYE8U8L5BBAYjNUwIvluISMLGyUnKkUFRZA7R9sr58CwCCy4dejh9ZV/9qczKVkCIDyOqpwp5qy9+Ah6i3yRjCAapUkWjHp8EUG8rqWAskecdPETpyMPJo7HjGbZquoShu+a+YMv/3YsHf+LDxOf6bTVISpnd4yAzX93NH9x0CMEsMKlZ/wrRJExCsmoBscjc3/lynKLJvg+9Oq/XPysJNf9LapXBT/bFMd2n75wlv2gGq6zncou4Ew8GPHFWy9AEaqIprT367VBgWNLA/6ZfI8qmVnDKOdVhp+YCdmDZ++nMKG5l8CF0UaxOQjqOF6sRCksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IdG6yegO+lDZYV0M0j7aAhMrayCP6JVJDKHAslE0pU=;
 b=bmHMYwHDO7RoidF09Raj5Hs33fyItf9tVhYb9NElZItPJwpBsTx2BOO6MGNae8DQ3cAyDlvm/zDGtwrxalcJs7VgG8bt1S4wE7mRtkvC6axq/nH9puwHJz6ExSv44eMYgHAMAFxLonVoTCRhva/Ne1Y2Zn6Nzkh2pzkvCmq0UfbFjBN9YjCPwu6rMdpM/WVd+XCmDtpsGpo118xphwcRTsx1kdHUMWyp4Ltc4eD700gWRaDb1iCv6L5YnOgIIam4vr64fcJYTyN4A81hWg1ZgqHG4VDB4ns06WrnCiBgJZiZi3H6LcxGjgyuow+hDMIUsi010aSpi2SWC0ihwBZPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IdG6yegO+lDZYV0M0j7aAhMrayCP6JVJDKHAslE0pU=;
 b=V9II9CkhY08tGHyfCHGTO9DRubeBdDufSA/+UqKsiW1pz0l7LwCslUVMKlm+Jvr34eII5j0QKbi5bXFIWzMSPyqCeG7IitgzUQuTaxlJmxVThJLHyPU8D+BcE8c7e4uR5OvsnXbHkcoCT/a3pfyiOJoty8XkE50LOAC0DlAyeCo=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BL0PR02MB4258.namprd02.prod.outlook.com (2603:10b6:208:41::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Wed, 23 Feb
 2022 14:46:31 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345%6]) with mapi id 15.20.5017.023; Wed, 23 Feb 2022
 14:46:31 +0000
From: Neal Frager <nealf@xilinx.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Peter Korsgaard
 <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/1] configs/zynqmp_zcu10x: fix U-Boot dts config
Thread-Index: AQHYKLQagJosdMgR7E+1YH+HJPodRayhMSOQgAAE9MA=
Date: Wed, 23 Feb 2022 14:46:31 +0000
Message-ID: <SJ0PR02MB7758742EB45B173FB2375E66D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220223125118.2325363-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758FF7514FC2ABEF4BF2F04D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB7758FF7514FC2ABEF4BF2F04D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7189a3d4-5fbe-4635-d52d-08d9f6db47e2
x-ms-traffictypediagnostic: BL0PR02MB4258:EE_
x-microsoft-antispam-prvs: <BL0PR02MB4258B778BF37383D1D80916AD73C9@BL0PR02MB4258.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KlC+TQX97wFCQp8AM9t2QsaMR1ZOoyyXNbHtynNVnrzioW+TD7W2JvjvmTgxqmaWoHi1pI5lzREjqYhkacStOQyxvjsXMb2CMEas97aO6GYqujmN36ntnEXKDMIuygduGiMQAOLgiiaJKKmFYBgAsAMLlQFXoIE6uoMzbWIbpJH1qD7CcqfDWooBi4CU7D2rjl1Kq2CxuYdiUad9KDK3qfD8+pggGtXIi+BxI1zXDrTMIy1zhaZRVdvCYKN4JkHzaAS8IP/kW7qaEGGYHoYJ8flzNJcCJQkw+bi+Zu61HvQ3Wes09vC0pGpm6+mRcfmrWEgEtrEmoYQmLfA1Jez5S5RScJbgN+zh9IwWXplCHOw+flA4ujczFRegEoVMvbmGExAYVKGEQh+5dFXDZK53V9owtODWVPtzV+KJyQB+2fqcg/zm/FfV3ZwjXSlTD5c+aYm7CKTNU7mtJXPiNq2X+eWFhYTL3Y6tLOE0rc5vCQUgiOJYyv4IJmK0zao9Qu4kqTeb9Ae8Nvaj85zS6x6OW9mcFfoi8bIdQNcvT4YU68mpVYxLHenqBWL6MYmyMFNVZVvh3UeSRXLmqA1+4Hh1ixQUZcTzlpCkSKTkkROkADogG6jSKZSnXE+AkxqsCcGpUveMO1KjHUW1ed+0Y0zeWVuskkbqpqXKAplFKXneXL+SK4VKVTu8VYe4E9hTMFDN5p6KoqOBA0QnZmTrDWQedg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(107886003)(76116006)(54906003)(4326008)(66946007)(8676002)(64756008)(66446008)(66476007)(66556008)(2940100002)(26005)(110136005)(71200400001)(38070700005)(186003)(7696005)(6506007)(55016003)(2906002)(9686003)(5660300002)(52536014)(508600001)(38100700002)(86362001)(316002)(8936002)(4744005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8SQFhLxUMVUwFsoQjcv+MPPX2+/+xowaeqsFjHtM3yHvKNXPfvEuevgw6Zof?=
 =?us-ascii?Q?/hfpZKkH2qqTwjQfYPq+TCE7n8cVqy+7E5sHgtsL22finsHlpMrhhoC9QHjV?=
 =?us-ascii?Q?SLA+Z64XStK6vFQe9YEVlf9RuwTaHxuFu3e55Vvfitc7/KIUQns3T0D6k4D1?=
 =?us-ascii?Q?BwMVYeKCJtsutMYawZb7FZngQwnhdRU1CXqco01IfHsZ2jkPx5yFk7JetRRJ?=
 =?us-ascii?Q?98Tndm9RmeWwSul5zoJWuxyEqsvI3meNOf72WEF+gHi1KZjMfUK1XjPUQFk1?=
 =?us-ascii?Q?13TRd6x44q843HY7cGn2aNlqhakU6msyYdH8Vwgor3lFwMVj7iyNq1bp9kOO?=
 =?us-ascii?Q?RRJttsJGkwSqG2N/yu+F8GKt9oiW+XLMl5XBKd3ios50Bzt0ipsp6f/5dogB?=
 =?us-ascii?Q?V335gOx/0c0ER2E88AFt77f6re551seg9B1zmDesdsx0LTLZ9/iZKXtCDRVA?=
 =?us-ascii?Q?/MoPNsbuFvlBauWJDDANWDDXUsyyAFC/HuSrpQuokoh/t/7N6htpJGc+/LZ2?=
 =?us-ascii?Q?SEuziJxHhrxLseexe2Gh8HFICVPapnNM+PcDNublH1ZTYZeZmzBlaQMCLukU?=
 =?us-ascii?Q?VpxEzDV9yiEzWkAt0rqWzY4TPuwEMnS2+kao5B2MVdA7yVa4PqWSq6xMrhLf?=
 =?us-ascii?Q?vKKR97vElUrelTv5Tl0jzAj8LS+5MGi1mC9nJR11tck9kutDQog6AIhbY3ZU?=
 =?us-ascii?Q?+GYkolgP7lO0GaJ3cDKCGx10tnkc1xOWUp1hZ6nNI31wr4C4dMKO9EafvEDj?=
 =?us-ascii?Q?83SaDaJESIfDqkeHVrEahN7+d720y0t8aCerkcwwko/p8MbJVOkvptRZfP8y?=
 =?us-ascii?Q?HdEUKj15jYZsdngWW3RLMSO0WBHQmOGLk7ubMYZYC10cC3qZ1e8YKqgQcOd7?=
 =?us-ascii?Q?Llo0QiwrW2cw7EBljGvTYMrAOAHyF0OdFjB0nYyf88iG6PbTnTIAUzMJJNIp?=
 =?us-ascii?Q?Hd6MFwljHtJkiA/wQvV+lYRG1dokxfgrEseAhBBzzQZtVL9xgKPDosKlhiAf?=
 =?us-ascii?Q?fk9OGPJ0ZFM2wLrzXmgTp9JJHGG1HY62PnDodqj8dGlGPFsTyXsQGxrPGfxm?=
 =?us-ascii?Q?B4/05x3gfTxA2AnoAgjJW5wDbgxAVLcdR3hYGSUpH0Bnpytc5pscuDkKMVSW?=
 =?us-ascii?Q?YRoHgBlcbtDJcYV7mYZ6KyUKRsksO/Wd9eQUuaff0/tjblJlqbYzjviKN3EZ?=
 =?us-ascii?Q?jaimyxcOZc9IBPd88PHGNGkJSBerXywXs+P7RBLybtVO9u9ouXuGVeK14x6z?=
 =?us-ascii?Q?G2CE9B3bkC5v47zSwPTYy5qqjpSG3BCrc+nZs5lRRo34JaLZQOs4im2QRScd?=
 =?us-ascii?Q?i5/0FTftXcm3q20fXrXgj6FWFF2ulGvK6IqIAspBXEE0yszUJl9X5pgeStdH?=
 =?us-ascii?Q?ulCoQu19A8nen9SVIoJn6uBTL1F+ye4osP3qsQjddmIb+DvcX8BZxO8TM5MC?=
 =?us-ascii?Q?+ZvZyNnGRvdx61jbg2/rnHVMbdBUd5w0AYQOeVjGG9qi+CCudEgf/d+Gf3RG?=
 =?us-ascii?Q?BsJwfB57M9qUTUEfDUsXPxnhz2Xo/XMO2yZiCNj74FzGTu6bQcixLt/+USMZ?=
 =?us-ascii?Q?bqinKID2a47d5tr8niBvDSj5o4uLqWO1A6Ag6NwedCNRrW2GakrhzFSpDPC0?=
 =?us-ascii?Q?Ug=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7189a3d4-5fbe-4635-d52d-08d9f6db47e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 14:46:31.2861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3sgrSRDvsqk15ckAqyZKsuHavk2x7ut4ESJuyu5w6xXMpez1Vd8LxfCqBBS3Lc1SVCTmcpJvnHfXwetF0fv2Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4258
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu10x: fix U-Boot
 dts config
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> +++ b/board/zynqmp/zcu106/uboot-fragment.config
> @@ -0,0 +1,2 @@
> +CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"
> +

> I tried your method of creating a uboot fragment config that just modifies the CONFIG_DEFAULT_DEVICE_TREE.

> However, when I build, I get the following error:

> Device Tree Source (arch/arm/dts/unset.dtb) is not correctly specified.
> Please define 'CONFIG_DEFAULT_DEVICE_TREE'
> or build with 'DEVICE_TREE=<device_tree>' argument

> I can see that the U-Boot .config is correctly modified with CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"

> But it does not build.  How did you get this to build on your side?

If I add DEVICE_TREE=zynqmp-zcu106-revA to my environment, then everything builds and runs without any other changes.

But if I do not have DEVICE_TREE defined, I still get the following error, even if I have the following in my u-boot .config.
 
CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"

Any ideas?  Thank you for your help!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
