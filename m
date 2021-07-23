Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF587C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:44:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9107860F25
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9107860F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5736E6072C;
	Fri, 23 Jul 2021 22:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5gBjNT2aXw7; Fri, 23 Jul 2021 22:44:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F80C606BF;
	Fri, 23 Jul 2021 22:44:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AF7F1BF3EE
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25FC24068F
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="V7X9sNk2";
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.b="GiNoQ2c5"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLHkpLN7mk2J for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 22:44:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49A064068D
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 22:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627080242; x=1658616242;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=hgt/Mem9s5n0a3V0Ah//AGqcjDUfI+CpTUp0d3iRrbk=;
 b=V7X9sNk2oHAQIIClE/LSWC2R8hEiJDCZg36RKm7X0tX3es08qMG3RPqR
 IsGYC+kSdBBcAe9afh/ZnReK8KanPUnakKhePQ+dkp/VOkFiR0aldDwwe
 viBpY2r91KLVk5Q1WuIjRD8AB4qMt+pnwGyVkcIXvnv9tbljzr7VWkarB
 W+xUjnMG/2nnEIEdR5tkKOcqEEplnzc/bXfAiUOhaj1uMDg0HVowtGlkJ
 E1xYo/e9zJXuGg+7sQ4bL3pVu+4/RwP7CzvPGTipAiHY/TqaT4hj9gv/s
 TSHY/0DYMB4nGudQitpwUlf/sBlBqjNzB4WoOKGDj45BhCtZZgiW5TT4e w==;
X-IronPort-AV: E=Sophos;i="5.84,265,1620662400"; d="scan'208";a="279201714"
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 06:44:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfrXOnu0v5YX8YfAJhNXRouGiqyMIs0sXOzdsg/c64ToiwRMzLygQrVfj+fumg4Ppf9G9EzDbbwsW9inh/IvQO1yerc8ay5rLwvqQ9SUPWZb1q0mjNKuSNmd2UKwj53xhBYQgscs0bG2DAr0iZERMxWzdEErNKt9ow5KMqTgOaSzzhiOF54Qktv95ITwxG+3tsuuuJzfXk6uS7U8btyGOO920ppt/6zr+sfxT+kZLOqhfZ6rZmksFeBIBNYIY/u5ItpyZyHfQqYm4YzpL3HPOp0G7V0//FM7/4UPH1Gbh3wsR+onuqSTjIgXHpbxTj+nlCnzKp44N4lAdFQ4KDM5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JccWjFmKbscUF6QcLtMrQh7TuPtr/gsus9atTC8umgk=;
 b=mGYQtFUFFREn05Y1NzV3o0ovscbXsCDSkigogcTF/tyy8JErTfl0Eig9yMgpOvsgklPlBd44e7iuoWxKrxy8gkvoqx6ITIuIkdkBovgvmjK1BcyzdBBdmeAJFtiQC/gZ1Zry5FGeyLgof5UmhJUsMFJwMUkyuahmExXYaA7TxpEPRTxsq3OP+DgTSA/ul+O93Nd/LAFA7oaoq/sApfG6jExFxzTiL4sAdeWabYEibkWhxY5my1rEsG7jxtSx1I9D0GV3L5/JWwQb+FjSrv2irFUxA1M6MP2PfP88CQLLwvWTcgze22MAZKBqVo0H5hysgpSnMnaptvvsivuhceVAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JccWjFmKbscUF6QcLtMrQh7TuPtr/gsus9atTC8umgk=;
 b=GiNoQ2c5N7P+cyH8d4fptdyTf8BiJkhEoAl9TmwytgQQ2dJ/m7Ce++5Vo1+Zmw8R/fe1L5NadyrP5eQgEeiC2KA85nLqoO251bqKQ2hKpbKwkE8d/o2Y8c/nfvAFNP066VDPOZ8bSlrEO8fMzhQp42A2yd6WcXm2Ix3WFdZADdk=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM5PR0401MB3525.namprd04.prod.outlook.com (2603:10b6:4:7c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Fri, 23 Jul
 2021 22:43:58 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::44e6:14cc:4aab:3028]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::44e6:14cc:4aab:3028%8]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 22:43:58 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnout Vandecappelle
 <arnout@mind.be>
Thread-Topic: [Buildroot] [PATCH v2 4/9] board: Add Sipeed MAIX-bit support
Thread-Index: AQHXeRNqg2/imBJvY0mqcly0otv+ug==
Date: Fri, 23 Jul 2021 22:43:58 +0000
Message-ID: <DM6PR04MB70817A36892EBB84C44ED189E7E59@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
 <20210715004843.337268-5-damien.lemoal@wdc.com>
 <6a1b7aba-9fe8-d0ab-ffda-b24167b0cfce@mind.be>
 <20210724003514.4da0f292@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4e926c8-c444-4ae2-da66-08d94e2b5c3f
x-ms-traffictypediagnostic: DM5PR0401MB3525:
x-microsoft-antispam-prvs: <DM5PR0401MB352543336967EB256C2F4B48E7E59@DM5PR0401MB3525.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HNnuV3+ncERjYBfzM2f/7nq3QqHhQiy8Uu4qxEq5gwTcHNcDhA6H0IAw6VnEsiBpkkBZ4C3AWka5i3RN854mvbJSDSwSxC1s1eQvpq6qUAKHCrVSBWeOs6yFCDWTiFNBQHkmeAeU5sVU2uuex3kafCuvmCzkwx7tgBpj4WqkqFFaUPCEARm4bFYuIL6vkr7vb4q6p7I87us0/GjHgKaWP9GDYCN7TarBkpQae/MbpQT9+y3QEByu/QLUDG+/VUPyKGr52vJXhTzl5lD8yNw39FhsQMXjS5JcnISvyfXn+sik24NvcySC2O+qEzA62dBuS/eJm37yctIWkjQn+zhouxWotawVU6csGSKujw5Ip1G+CEGMwtk9/imPiVRY3Cy+qsVDo6zC13L0deOZCE5ajTGuYQjAs1nSned2lvhjfzawCxrfxWjxWjll/h4q2j+nxn4JW4FKSQONk3q62qT6R2e16lOlfxjmUZy1p2QNLToiSox8jIyPvYPMxUWv2Th+z4uvppQD1FepqJ9FAdmlzMH4QLOTIZidV8d3NC//4pCfSlHONoN1agFRQykpCgGsBgEqBPIRxqTVQEKXJzXZAu8xpAyXJ08h4A5pL4qkP/0oZeR+xWdSB/wdPBYCueBmLBKcZ+8h6J6ZGG23NVWNXK0W3vBtjnoctNcypSDR/R648oYtQxPM8SaXp6uLY3j5F0BVykjGo2F3FbrL17G8tw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(4326008)(8676002)(55016002)(122000001)(91956017)(54906003)(66556008)(66476007)(7696005)(66446008)(71200400001)(38100700002)(66946007)(9686003)(6506007)(76116006)(8936002)(53546011)(64756008)(478600001)(186003)(86362001)(33656002)(5660300002)(316002)(110136005)(2906002)(52536014)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jDMgOYlKFv0VJ9vChFNj3ydHD68QJX/8vntPfOGM0R3jN3vU9/Fi4lnfwgvV?=
 =?us-ascii?Q?NqOwvsQyFV1bDSeKW1Ssmfd4wqmBxCg7A23MxgDiFq6f3Vpbh49DyEhMWCJs?=
 =?us-ascii?Q?k2Xps4UYewxQ7ry+fNw0zJlgopmnKtLGGnQvzUG0zXcoBRYDCvk5yzGfa+zw?=
 =?us-ascii?Q?G5OUSWkaWgnvUyISTQ90fxeN7ihTM7hfvY78DhPucl8JgEhepEJvokauPh6y?=
 =?us-ascii?Q?R7pMkfCdqAM2aIb+0Ql+/n4KwKyj/bt0WtNzfhULx7dVL9bLcKfUvz7qMJnv?=
 =?us-ascii?Q?jOc93/whT6iK7tNXpRsn+RCA/+ujVl3WvUyIKoD87dpxPonCm/oIFZ1oz0ka?=
 =?us-ascii?Q?t4yNJG+lMs9DJNDDNALJNWJS5v/62pGimE85d4BMY1gOsaM0jjF4FP4xv7a0?=
 =?us-ascii?Q?8svxZR6zEZgyAAMrvLOmAkCt7RLfZXHJWDMDtmdDzcVmx+deKp1r00O+fnO0?=
 =?us-ascii?Q?h0sqetA5SKd9yLPlXC/EcptjoOxT5iCFT1jS6dZRkS7BM9XdFtP1mFpnEhUO?=
 =?us-ascii?Q?a8lIv5o5pWOtB2qt/NlWsr9tXSb8VimPMsGd7BzCy9eBds1EA+dscAG1LG5k?=
 =?us-ascii?Q?TAYfZ2pQ+PYkV/s+qNaqQEAn0bL3TpkWl1XlD7DPIbxDkbey4oz3mJvwV0q8?=
 =?us-ascii?Q?dpjhqm3B1xThHt8yZcoto2xofc/NJ8/q6Ot8eokehgolnzKMArQPPslBxEyO?=
 =?us-ascii?Q?laEswsVoshNOydn9fiwBgYhfb7mErhSV63Y3tOrC6V1InhCbVNLKT02stWkk?=
 =?us-ascii?Q?vBGWl3dC1WxdTmq1baEgmUGTpLMJttPkYJobJZd2M6ukEX0A4jjPRqKkp+vq?=
 =?us-ascii?Q?WkN7SYwZWv82KBfWG4JGzG2IA7n1UJxofvPQf1JGvvxPLCzSqhiuLfwzKtsI?=
 =?us-ascii?Q?TAX1SThD+E80l/a3X+Sljypf9qXSMkEteT2gSTPlMWEg7I1g3ZGYw6kCps2u?=
 =?us-ascii?Q?hRUYk/5XfNxnei/2YqLsKFJ4f4TXtt1HmViuItLeH/dJT6U/JWEpO4bFWvor?=
 =?us-ascii?Q?xISNdrH9y1a8D1YILZGWr8Hb9q7S0Wz9mkbeiGPAW3ngnrXYAewBLviN++UR?=
 =?us-ascii?Q?RNt4nGFkQPLk7WrlGPV+Th4y+6Kvyx7S6RqudE0zEQzsUDCegOHM0zts1OfL?=
 =?us-ascii?Q?yOXAJClAJ6IloOkTjd2hrXqShHhk4SA7y39XPzU3oQIDwNdyaHkJ9/XjQmX3?=
 =?us-ascii?Q?4OiBuRWxhRBbHR9Vas+Thx95ZjvHi7gowN3jMphBGh4Guiewa68kPaUMf4QG?=
 =?us-ascii?Q?UdRVip3S1BM92r6cU+XWKmTweNeWrUliGANZRVXBWMLEcLrG6Vzur1352Fz1?=
 =?us-ascii?Q?su/N5qCVjvLyPkJW96GaBUsp9hKD4RIdBlwJGy8uGCS/nq3nDj8fvkQ/5Btx?=
 =?us-ascii?Q?kGfXkEmhZ/zn/dlBO+n8vM4lbWZHE+HUnyVqO3qeGCA+NJxW1g=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e926c8-c444-4ae2-da66-08d94e2b5c3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 22:43:58.6679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VnTvqSjMzsJBEkIFxpQ1/qluW0ajVrAsM/jEeOFJ6lu3MyfV9f2Ghj8Y0G00fYQ+MO8kJEaAISxklxhE4B++AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0401MB3525
Subject: Re: [Buildroot] [PATCH v2 4/9] board: Add Sipeed MAIX-bit support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>, Mark Corbin <mark@dibsco.co.uk>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 2021/07/24 7:35, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 24 Jul 2021 00:25:27 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> +++ b/board/canaan/k210-common/busybox-tiny-initramfs.config  
>>
>>  Wouldn't it be better to start from busybox-minimal.config and just add a
>> fragment that removes the unnecessary options?
> 
> Also, we already have a package/busybox/busybox-minimal.config. I'm not
> sure we want to add zillions of "minimal" Busybox configurations.

OK. In this case, this is all about saving memory and getting that busybox
process as small as possible, given the super low amount of free memory
available after boot.

The toolchain do not allow to compile "shared library" for NOMMU (shared text
segment). This is not supported for RV64. Once that is done, someday, we can use
the default minimal config as forking shells will be cheaper in memory.

> 
>>> +++ b/configs/sipeed_maix_bit_defconfig
>>> @@ -0,0 +1,23 @@
>>> +BR2_riscv=y
>>> +# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
> 
> This should remain the default.

OK.

> 
>>> +BR2_KERNEL_HEADERS_5_13=y
>>> +# BR2_UCLIBC_INSTALL_UTILS is not set
> 
> This should remain the default as well.

OK.

> 
> Thomas
> 


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
