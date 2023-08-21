Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42867EE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 09:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 883C181F0F;
	Mon, 21 Aug 2023 09:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 883C181F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GlxqogPyhY92; Mon, 21 Aug 2023 09:50:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31DF081F1D;
	Mon, 21 Aug 2023 09:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31DF081F1D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E3D801BF308
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 09:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8DD44155B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 09:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8DD44155B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2lM5sk3ARKU for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 09:50:53 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 21 Aug 2023 09:50:53 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CB6441559
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CB6441559
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 09:50:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,189,1684771200"; d="scan'208";a="241548286"
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2023 17:43:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cc8KglTA1qI6DMGiTqd8Jnqs7aKwM1ytBkmBXt0/asXlZwFoLWs7908BYtjuH+RJHAga5qkyO7M/otloc32zY+Xc+ja0dqfGhaKMzCZXuijBfb/wrVqkfeMLe5MUwCHdTxcFDvOhtRZRkB2gzYqCFzKPu4rPnTrEH1simPFsFFiWUZOsyJv/4+fSxktcR7vOuAanRn213b/z1GcgWUfL5r6U2sa+0xDrRG/m1Ru/r/qVOzL2CTkjW2zIVpYwZoym3S2S5sxSAXUKJIvqCqabEL3S+25f78mlNs8niOu/Av4F5U9HHG1NJIVYzoPsYxtIksjxbhgAPwbVVDgniTVxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gNKtZREr43ZOAAt+axzC4agg1HS8w+SbM2yz/vjiUQ=;
 b=fsBN9NdIP3a4Jliyj4JDWMa1CkQBe05l8QGYz6EmPmPRAO2VIAA7unrDdfeAj7ZdL0Rb6Xj0UG5GU127WYDjvBqC/luTUI/PXxJmWIbTZjk8qr9XmZ3Qzde4kVDaiqWIJwH1BKWpyhZ+WZq/lO6MfXE6a7dF1ojhoHD8AFe+3/fbxyRwo/UeGmPupaKCz+qq3aRseQ5lZjS0WJ9iQxz89JDOIgBpOkhNjkEgFjj4bZhZxPZljTOGVt8Y3GERTBweFWX5Jrxq40K3i3+3NYVaGLoF+7P4VxzmPo4SmUtuL66tZOrIp9oPQtioQ90qjze8e9SVtOuaUU1ZPGtrf5QstA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from MN2PR04MB6272.namprd04.prod.outlook.com (2603:10b6:208:e0::27)
 by BY5PR04MB6913.namprd04.prod.outlook.com (2603:10b6:a03:22e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.15; Mon, 21 Aug
 2023 09:43:43 +0000
Received: from MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::d093:80b3:59e5:c8a9]) by MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::d093:80b3:59e5:c8a9%6]) with mapi id 15.20.6723.013; Mon, 21 Aug 2023
 09:43:42 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH] package/elf2flt: Fix build by updating to
 v2023.04
Thread-Index: AQHZ0kqBCK3Z4K1wFUCj4CBtkebpRa/zu8sAgADHkAA=
Date: Mon, 21 Aug 2023 09:43:42 +0000
Message-ID: <ZOMxzkz3gZNcs2BN@x1-carbon>
References: <20230819030849.3966233-1-Mr.Bossman075@gmail.com>
 <20230820234926.1dc52113@windsurf>
In-Reply-To: <20230820234926.1dc52113@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB6272:EE_|BY5PR04MB6913:EE_
x-ms-office365-filtering-correlation-id: ce28d652-2fb1-42d7-e3e5-08dba22b1b41
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jt7NkQGMYJvu+fq/3IjFp4Rwxaq9eECnaR4idxtkdXyNJ11wcZDzFpfi12TUdlXe8Tdzj7aTDudUVBCC5ol+FuOMTGvMNJeENGk7YAm2hmIaq+SPv5ZqFdABlHRHAaT1pHyrf+VRcQxliivyMvWlE6KBHCQv14fr76JD0uv7W1CtrBAhYDLJkySgyPyTB24Gb5mqhBHLLl+UAPkDYAyIAp0E0mHLTXcM+A+MK4kT11xHEYFv2wnmo3YXow17KKqn1XiFs6kWlcgLO7zoTIh0d4JLDF9K9Pkj99aTZ7sN8Haj2xkV+Ro+ZKoObneJh2KbGyRDGP05Ph8Ajei1GqtbPOUq/qGnxdKHwZ5SPBsANMq0oC62gyJIFQVI1C/yhRhOiu7T6j4P0jg9XITgj0nXl8PqCEx3a5u3RutRHN+514dlzq2D1503aVnvihXvQikA2ugSkVgGcWu9VGSAM2o39DrFEHSSc6kYGjJHmD2lpQvwsU4n0GZtPJO47KkhAm0RktsXN+mci7SZb6vPa6WrPw2ehjyT/XLNdHrDIFVWjRFfVqH+oxYz4HwCWVwmeduykJWg7f2p6sviaEuqzgXdgYG6cSwPXeqRU/SAncV+PxzQNUOl0Ia9EA1hwGZnd8DwTDVC9nbtnd3w5PDqwI0d7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB6272.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(136003)(346002)(366004)(376002)(186009)(1800799009)(451199024)(66446008)(6916009)(54906003)(66476007)(76116006)(66556008)(64756008)(6512007)(316002)(66946007)(9686003)(82960400001)(91956017)(8676002)(8936002)(4326008)(33716001)(41300700001)(122000001)(966005)(478600001)(71200400001)(38100700002)(38070700005)(6506007)(6486002)(83380400001)(2906002)(86362001)(5660300002)(26005)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zO/xb8FItsJ6wkclVx57SFw7Xr7zLlUxra4EOavtCbErsTBzkCqu5tYVsuCn?=
 =?us-ascii?Q?ia/p1h0klnAMgKvzmwosA+o3oWUKiK/IWiiOoJaXmZBD/gn3TANYPdZIxY40?=
 =?us-ascii?Q?kSqljq+6kfOzFCcc+YC1D/onz+P7xawZIQiPlIc5bxZIhIwbXsNnam7OLQcU?=
 =?us-ascii?Q?SvsPM6KwtgbvO1oB3gLtKZlXDylT8JtcSGwKmkqQaSj9/gbVcbu1aZb2CR2V?=
 =?us-ascii?Q?2w3GPngkd2oJzalMS92JmSYphIQVMZbyMwDKu4diEtX9xB96AZfw6LRIGiSW?=
 =?us-ascii?Q?haFCZJxU5MLvPjnZBb1pd1VEhJMJs82p+B+r5HLSaoLGPvmmihUqX7OQyLjy?=
 =?us-ascii?Q?chsVfYXYBhp/Fb1tDCdMJjGPYGkNDR9LakuiGBgsIBxpNcC70zm+s1rPB2JK?=
 =?us-ascii?Q?CURPLOy2TuLgEihYMMRHcpn98WLbOwuHcd4FkDUX6aKVkUwx2ieUGP1yCswS?=
 =?us-ascii?Q?4Oe5wS/LdS3WLg78bbGigXt2EhaFrogLmycXd6gK2UQy+TZ/I6EbQ5+1uZY8?=
 =?us-ascii?Q?4wW0yiTS1CdVHnXEYT+/9aEANltVwsLm5pOE7Q6a+ZT86/XM67dIo9pmIzoy?=
 =?us-ascii?Q?iKzF5510qZrgo44IAM4aJyZlQ7MVC1Lbr8YlGfFGVin7IuKUx0r3mSpSQe/W?=
 =?us-ascii?Q?aG6Ug4O7omwVkwpGnLke3Ws5KwNYKIgml31J7znJoqYGNtBWYsxBw9rShWkw?=
 =?us-ascii?Q?Eyv2BqoH/O9d3I1HoAM6vIf2D08RFtE/Ozngp2kHnN2tqtAm2AiSlnxa09YT?=
 =?us-ascii?Q?q+rVSwew41eRgPADaPhQdrarvJfXd0tv3z5KwL+yigdteLyzCENaf1+u762U?=
 =?us-ascii?Q?aSgBjAHTnbir8O+Bxe7kp5wAxTXY2kLaLNZRS6J12w7LWvGdNWlqpj0af7gU?=
 =?us-ascii?Q?PlGu1yU0czcoYCE2nZzJIC1LXS3djrnucoUoa5gMJeUN1HA5M9XUubRd8Fb5?=
 =?us-ascii?Q?oXs7H4WdO8nVMPubqitAXOYplrcZ7SOOI8Y/K0LgcOk9SO//EriBKriKGpq8?=
 =?us-ascii?Q?JDq5mJUBdbqh8jMDSFTvycNr1JLjZBdv653V1cdhTEXpLQBqXQuEV0EkAh8P?=
 =?us-ascii?Q?X/yXRxXiq8+v9XbfmoI3v+XZqzy+c8EyQmlcm9tgI0YqM4PiT8ZATHtUKVt9?=
 =?us-ascii?Q?Z9tXA0ybpJD+x2/j4xQTcepA+iL1YreyQQ5sJf6ffb1fqnjVnwWH6G1Hp6cy?=
 =?us-ascii?Q?SvdLvpMiQvNVAF5hROoTudnXFSBkTMVPwtRleUKInGVPdk1DNUhXtpWURUSH?=
 =?us-ascii?Q?qog6B3CdKivEOmlqS77TwzNRWM2CvKW7ATLI/qgMyEZm2HIAXCJByWXLW90Z?=
 =?us-ascii?Q?TnYnCoa8C/g568zEl/Op7bSPy+3W4R7pYbGWWAwooUm/fkBgzxSFqCX1W5B2?=
 =?us-ascii?Q?mYmx6zOEx8TDLgbikKFd7snM4EvQR/cgMZuft+rUrs1lejdVvXChrGvAsDHf?=
 =?us-ascii?Q?PGZ51ysSpeeZAmIgY4SvQgDC/PV85XUcrKI+lOJOyW72I46dGqssQGlGNHy3?=
 =?us-ascii?Q?gbvB1d+svE5UWiujcfevL60i63Q0U/SdkMwPTjomcmevtLSR6PZFTbNyOAZK?=
 =?us-ascii?Q?xH4r3JOcGUFe68I2M8SIGUVAYUhmvToeFExqRpsvdzpFwMfFqMP+OmePKEuG?=
 =?us-ascii?Q?iQ=3D=3D?=
Content-ID: <C0EAAEE7FABEB74788AF58BAFC0200F9@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?9VpSNwTuLtYgOKS1TIskonbR+S+DetgbFU5HlDZA/us4Q8I4873exiNcb54q?=
 =?us-ascii?Q?1coGS5otLje/XLyv2NveaukNwZsbr7j1SOdoHXUjSNmiyipJRXT/pHqAz4yh?=
 =?us-ascii?Q?V5wgZXrJMOEzFHdoskF+Fv+7pokWvyYnI9im/RDdODfP4CD6pBFfR85ICsKP?=
 =?us-ascii?Q?X4yq46goh6jdr3TWJPtSzAWM3RhtcIzTqi4ZfUS3ztmd+Ie5jKjMe3tx9QSh?=
 =?us-ascii?Q?+0x6TvsSyMs81lsKXLk0rSL+pCO5dPYmmSUdjlIwoj0tm/YavrRJCuA707WO?=
 =?us-ascii?Q?KztpMcL/21Sd+xvuSuWaG+Y9+XQQrdkp6VKPRB/jr7Qxj1NJhCLwpnl5kwjH?=
 =?us-ascii?Q?VTasueWGZ5VcOWp7uVU7IbebYz+QPsvPPx8/WCg/C+GB5P4jHMd4OR8ZvLpL?=
 =?us-ascii?Q?wVQfwhY7lrcuy+HYmr+aAcCnytctcw8lIIzXBoj0B263JdVwEgS6ugzrrDsB?=
 =?us-ascii?Q?vJrhMysuga9AMdGTPIyvAx5+VbqaLhl6iVRkTuLkRcnvf/kg7yyYPIU9CXxy?=
 =?us-ascii?Q?FDE+7AMdL2wJ/I1akZAS/1x+kAhYxnUw63l4wIsl2wvHLYZY4SNT+dptvp3l?=
 =?us-ascii?Q?VzfP2f7jyY74UkyYxTttcAXQoe82tybD24HTsV8LdPKhtZ/1uTrXZXoXhJVy?=
 =?us-ascii?Q?wQEC7jOGCgxPQoh1u+39pcm9Aha2rYqHKlT9DwfNR+O67qkkQNamgaHF/lpO?=
 =?us-ascii?Q?5c15s06DE6/e5TYKtvre7NdbAfGfRrvIEeWjeR3ENPMfjWUpkmhCMyBgLc6t?=
 =?us-ascii?Q?JnKP1mZdrPUDObGZlhfE3KwQHo2nHWwuAx1n5KhwiTnO+h3IWRDf2zmpXuIC?=
 =?us-ascii?Q?yuwWSUGcs3sVYBmoV2LV8WDQISd2RYatrbw3Nuxjqmqk56fTNVeiNpWkhoU/?=
 =?us-ascii?Q?mHEhA/AzWj6w3Xcm3aE+PHB43iurp0KZUNZyqRRG5jPn1VBsk4/ShDPLWeUd?=
 =?us-ascii?Q?X1cWciXv2+tAZI2hSdjR9dRTSfyk7RtU7Tr1psE7NoI=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB6272.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce28d652-2fb1-42d7-e3e5-08dba22b1b41
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 09:43:42.7131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +utMVligDaGTHi0xTIU3vpz8xIUJXR7mB93d+wjTM8XEFzx1yHto2mFOL43BK5TgF8Sga4fQUTPgK6i90SsR2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6913
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1692611453; x=1724147453;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=2gNKtZREr43ZOAAt+axzC4agg1HS8w+SbM2yz/vjiUQ=;
 b=GYK8SWNlJR4kl6Sdk6K5IW3ncwp9a/EAE9cp0c/snmLsvi1oOVsPDhyn
 MdFGMa6+hsvVpTDyAj27XzDE+Htyb1AEAKav748o4zBsNPDh3x12tNvQy
 QNSpeVI7TeCx5bPwMSG2/39eGQ/HlGzsGfC1p4T7juc2591mZnyw4D1+7
 rgUEeLnI32VBINEYkW1Lv97Wk7lXZ1NKkY8S6u9rtRHl4pKz2G8kkCdDz
 mVNZ4UnV+ldMI+osgdZ9Q+Mld9+nH/M7aQ8t5XqcQiQVvZMg9kQHwiK20
 zqvvpuwYA+pPKOqVDXMUT3ClbAhfBm1+mGcCqeUNTZZf/LFsiVgi+kEwD
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gNKtZREr43ZOAAt+axzC4agg1HS8w+SbM2yz/vjiUQ=;
 b=Cwm0eGYiymxRHd1io+/XsfzAi28P5HZpiRinnQ7apmgEtBfXoBzgsf0BOcTZaLRvaTUPeWVmIIM0bsvIOL9v7YKR0cZ0Q5fjl3LQ0uUC1X2UMgcls3risQpGTREb7QK+PeTOv5bJjsWAzbyARSgKlWpuDWSTnSeP36/LEBSEvo0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=GYK8SWNl; 
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=Cwm0eGYi
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH] package/elf2flt: Fix build by updating to
 v2023.04
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Jesse Taube <mr.bossman075@gmail.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Greg Ungerer <gerg@kernel.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Romain Naour <romain.naour@smile.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Aug 20, 2023 at 11:49:26PM +0200, Thomas Petazzoni wrote:
> Hello Jesse,
> 
> On Fri, 18 Aug 2023 23:08:49 -0400
> Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
> > In elf2flt Greg Ungerer committed "elf2flt: remove use of BFD_VMA_FMT":
> > 
> > "In binutils-2.40 the BFD_VMA_FMT definition used for printf style
> > formatting specifiers has been removed. For reference this was done in
> > commit b82817674f46 ("Don't use BFD_VMA_FMT in binutils") in the
> > binutils git development tree.
> > 
> > BFD_VMA_FMT is used in a number of places in the elf2flt code to output
> > bfd offsets, values and the like. So it is broken when using the bfd
> > code from binutils-2.40 and newer.
> > 
> > According to the binutils change PRIx64 (and friends) is used to replace
> > it, with appropriate casts to keep it clean for 32 and 64 bit platforms.
> > Change the elf2flt.c use of it in the same way to fix."
> > 
> > This patch updates elf2flt to version v2023.04, and rebases all the
> > Buildroot patches.
> > 
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> 
> Could you clarify which build failure this is fixing? The commit title
> says "fix build" but you don't explain which build failure is being
> fixed.
> 
> If it's the BFD_VMA_FMT issue, it has already been fixed by commit
> https://gitlab.com/buildroot.org/buildroot/-/commit/d79f9c9f416ac5da90cd428916cff0b5288cb03a
> in which we have backported the upstream commit you're referring to.
> 
> That being said, bumping the version of elf2flt is certainly a good
> idea moving forward. However, we should be careful when doing this, as
> updating elf2flt has several times in the past proven to come with a
> number of regressions.

If you can build and boot test:
riscv64, xtensa, and m68k then I'm very much in favor of a bump!

(Personally, I have kind of given up hope of upstream elf2flt,
but it's nice to see some activity after almost 2 years of some
of these issues being known and having open pull requests.
Now if they would merge the riscv patches, then I would be even
more surprised :p)

For riscv you can boot test using the defconfig:
qemu_riscv64_nommu_virt_defconfig

Unfortunately, I don't remember which defconfig I used to test m68k and
xtensa.

I do remember that Thomas reported a build error that was only seen when
explictly enabling BR2_PACKAGE_GDB, so it would be nice if you could enable
that as well. (It wasn't enabled by default in some of the defconfigs.)


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
