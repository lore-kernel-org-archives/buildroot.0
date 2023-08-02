Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE6AC001DF
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 22:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79A7841DB7;
	Wed,  2 Aug 2023 22:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A7841DB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tw0-TJlwfdko; Wed,  2 Aug 2023 22:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3408641DBE;
	Wed,  2 Aug 2023 22:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3408641DBE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84E121BF2F8
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 22:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3B8D404E9
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 22:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3B8D404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ssey2E0okagj for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 22:30:15 +0000 (UTC)
Received: from AUS01-ME3-obe.outbound.protection.outlook.com
 (mail-me3aus01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7004::727])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CA54404C1
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 22:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CA54404C1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScHApr2nChGqpdaabcUXx1Gs32mXOu/n5VQFxfJBSJuCWeZowZaw41AY77f2FKnh8QqjFoe2Lb4AnKGYfnqlxO1DQpg7ak0ZRCyB54/eZOo8NokPuzwza0n/CIBGG/oLIUx9ETbpOrudtNOz/2ZN/SjwSvXKivrjF6sOMNF25QCjACnS59wsTatukOZbCAvHi2+KZJGeVg/i2axutBrZ00L56X2rqjA/DF0krLupBFAtU2b7S0edf8WrYyua2vpdx1ugUs9fLfDV0L6dWUkMpas3MDskuqTfqwJxfTZso62R4FiFPcw3jVUlbkZ0GPOxPVYYpfURvXUr7E+XAE/Eww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozZ9LUwbfWrB9RoItjq60OI8KOYP0cFUr56gynDtPRI=;
 b=HbV13csI3ZEMuz92kNtj+VML2So1vkk6nGeqqwtS+JxgQ+6SJ+rPAza3sm2QMjFGn+vd3O0ElQ9xE7XCijy82nXHig4rvf4S/AYMhfpVjCfyv0yeqlkJHgrNq0OVoLGjAVIdRo2AIe9vkhuIrKLPjxsNjO4RYhVFMTspzhhJZZXcKRHW7SxSU4ldoZUQz2253llbsnnxRkMDyn3/6JpmIW4M6zantVnLFVeyGwf4q5bLL/3JJIV8mCukuAXg1FtFFcoYxWTxrvAmCNvkWWPOdXREsDGPH158mqFcQa3TDOFuPfb57K5zPwvbTu8pIhI8Hvd8HnI1X8FeWI+W7NNo3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com (2603:10c6:1:25::22) by
 ME3PR01MB6369.ausprd01.prod.outlook.com (2603:10c6:220:f2::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.20; Wed, 2 Aug 2023 22:30:04 +0000
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::c574:9949:1619:eac5]) by SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::c574:9949:1619:eac5%3]) with mapi id 15.20.6631.046; Wed, 2 Aug 2023
 22:30:03 +0000
From: Afshin Pir <Afshin.Pir@gallagher.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] Update schedule of sources.buildroot.org
Thread-Index: AdnEMbW/GqCIjib8R+iHlW1XZFDX9QALs1gAAEwNODA=
Date: Wed, 2 Aug 2023 22:30:03 +0000
Message-ID: <SY2PR01MB2778DE94AA435DAE575AAFD7940BA@SY2PR01MB2778.ausprd01.prod.outlook.com>
References: <SY2PR01MB2778500474B41D29E8E7D54C940AA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <20230801121118.72610acf@windsurf>
In-Reply-To: <20230801121118.72610acf@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY2PR01MB2778:EE_|ME3PR01MB6369:EE_
x-ms-office365-filtering-correlation-id: 84ffb27a-e0ef-46a9-ec5b-08db93a8040e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +sINB3FACyGua25qwKzes23Ohp2d8LA1DSKRezyYArXpKftnScSbj69mioqNkTyOemMUXNSvkRUrrFUhxQTpzdbms6MXaemBLa1Km9laY1Xgx1o0DFd7JvG24Ma6B9CeX3JF/trCEv5YvAc6mb5rnkhdT0AQuhc/E5NOU1r9vNzpka4RxBUoDMBjffs+OULTMmrd1delvqrNqciSGW6I5wWuQ60wM73fLUnPhHjoJ6F2uVJ8Bs7feLetUulP406/EHvu5kRvkypmDnZNDbsO1rHt4O9o4AJfIyD9y9YdBeJLhN3dQFTtrZBtO92RB01zT/oycMtaD625AUkRdOpreJsdqEzzWg2eIM5rvMX/ueSoF3gfAHP8Y8wyiNJz5izzrSj4VyG7MYMO9zCBtPG7qWznfrxqpEijgtFJoAJDJ/IuE8u/XBgLZbj14nf+pOO8/xWbrbtRh9auj+ZsirGFPGkxo/kL5zkQR2ASlwvNsitWf0gN7s+V24dsoeONh8Jx2fLyJqJGZhuqH5yFo9bPeJyT6iqMbAU7EB930aDmLkc8fa7btMIYaSwnfEqB8UhvEpkYrHFVO9IVytNHzTXWItoN5kNJ4YIqEV2t69C8r88=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SY2PR01MB2778.ausprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199021)(53546011)(6506007)(26005)(186003)(83380400001)(316002)(76116006)(2906002)(66946007)(4326008)(6916009)(64756008)(66446008)(66476007)(66556008)(5660300002)(52536014)(41300700001)(15650500001)(8676002)(8936002)(7696005)(71200400001)(966005)(9686003)(478600001)(55016003)(38100700002)(122000001)(33656002)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IvHjmaRbTsJdJxtLIQIRhwu3IwhsCrqkb3ARxKxbUJc+QRytAPjPSD+Mnms8?=
 =?us-ascii?Q?fbIHP2sZIlIicpCzBo0m8otb8mVOtIQ1ev4+8LjuOUqV3NUIxAA+btJG6gXS?=
 =?us-ascii?Q?UNBW3pYVpECOZI8frcg9DDXXbO7Pofg6BBPItwYcQ6EwJ5JSz0kWgz49KjR2?=
 =?us-ascii?Q?ZPRObOo6OK6joixVsn7ooQZMqzjc8c2zHjqci51E9H83b72dJk9yPmwauX3S?=
 =?us-ascii?Q?ZWWeUvSmJTbze/9ttsnrltH8DN3MzZ67darWKhqKbSd34LfgN2J0pjrQjR1e?=
 =?us-ascii?Q?RQgHITYmKDofCWFdta/bY82Ge3HXPB21h33guUrMzmZoP9MI6hi5k5rYbzYB?=
 =?us-ascii?Q?+1M8yfRIO4oEtM99Fz1UUdNMJfaYXdiDdxKVyHsVhJMsThv1TR+0BYZLJTQT?=
 =?us-ascii?Q?0VZIfUi4XbJp1KuEfLnrxEUDioMwkD9g5mDdx3ZSQAT1IT9enq0pJoEhozzc?=
 =?us-ascii?Q?NWDR95YCa5oywm5XlH38NTnCL9Z6OsN4ij+0l8guK7zga/7CS0cwfn7MJ5Zs?=
 =?us-ascii?Q?diQvU+ev4D3y6vlwrIfZGzggnNh/gbCHystiYKmkNk+G1Kyoazs4iIfEsOqn?=
 =?us-ascii?Q?a0nxmiwZQTnYLGASBPmZ1IONd0JvB6Ss5E0APHkSyASFNwwmcaYtNnYjS5+m?=
 =?us-ascii?Q?syDuQ2rQGxrnQ30x9Z4OB3JnzF+Cgrd3joD40/GFrqiaep6mzjTvbmwfVMCO?=
 =?us-ascii?Q?TmBegFQhmUsK5THkE47s+/QRU6Qj+YobCgvRniTtBxkdR+xWkE/hfgkFjCoB?=
 =?us-ascii?Q?OtI38kZafiE6XoysPF+HVSrrW6oTLUquBCoRQET0lRhavIgSnRPwiANQhIv5?=
 =?us-ascii?Q?gQ4lfGd5X40dDzZPp3dshr/UIoLUe0j2qo39wyTvKSHi9dyF6UM4PwamaMUX?=
 =?us-ascii?Q?MoVfAN0k7J67Atg2tQ8xBCiZfGYeTVKrwJhVED9L+tS4QaFo2votghk3Bbeg?=
 =?us-ascii?Q?ZLfWjFWSbGgy/DbV9GbQ7ZhLyLMdxLJUmDQD8DD9g8Md1egqCxWz/Kfu7aoW?=
 =?us-ascii?Q?IcxfG7ls5N+DlxkDTLQzoLSmLioZWyT5SKE22My0Ec3Fv5grjBJgoaGMCiTh?=
 =?us-ascii?Q?dxlwoSAiJ3EFg9fbz/GNhpPxx4VQMs2DagXXjBIhQ9jwZLfXBq/k6Ov0Q5mP?=
 =?us-ascii?Q?ReMddiXI0gzuPLgoxvr5WjXXhFR+VwEnYW1/g3SiGiV02C8/vcpiacyAkESG?=
 =?us-ascii?Q?7qSWTEF40P+ohmzfpdTlCv14LTIno3lqDgzTGFzPxYsExfBPW/ogVX7gyOUX?=
 =?us-ascii?Q?YZGYUtEAjQeA4cYHLVdaYGwDgOQrf2RkJO24BGTflbGkhho6RDKJa8BNqe2/?=
 =?us-ascii?Q?hrpqFAIjvB76zcngJxluYYXrbnv58y49NyUqVjzBQiBNeipEwHWnUPcrXA81?=
 =?us-ascii?Q?PrYLoV9lc7l4IFHxnlQn2sTYVhSF/tvPEAGNrxbhFFSJin0YI6jVaaroFAZH?=
 =?us-ascii?Q?wwW4RQDBwTCEHmDCWuy2hN5XkllkhM1PbJ3KEedmH2gPlmZRq/d7UHq3FDE1?=
 =?us-ascii?Q?4vYSlQ3ZHUYkP1NHMxYLLEsWfnb8p8exbiifYoJE3BwfjFCnixYLWLmJJzl5?=
 =?us-ascii?Q?OIk68joRsRwLqJicKlCTtqkyFD80Mo2qAznaNPm/?=
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY2PR01MB2778.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ffb27a-e0ef-46a9-ec5b-08db93a8040e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 22:30:03.4353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Db47kCqG+piXNX47Ig4glxMLNcCDGYX0lg+W49aFEDaYqs3KRLi40qJquWEEFdNGC+MugZJf7W9r8AjvmnM3ZTNzfhhWF4I9fo4Vy6WRRZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3PR01MB6369
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gallagher.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozZ9LUwbfWrB9RoItjq60OI8KOYP0cFUr56gynDtPRI=;
 b=gxMQH+Se1UrncpLMhnx44J/1/iEbsItV22lF21gYZ3PM8z4HuNN+TLY5jLQX/mkyQlaTsdWR0+bcTxCovk0gMQQ3gnLdsr3ZO5SB+wB4svcvQ/dXkjorJAgql+2jZIg8XD1u9eHjo1KHD5UwJSLL+GBpIA6C+b2ygfzezB7StHhIra0qa6GJmnUAe9Id5lkmcCYrqfdrU3cr6LUa2S9whwsZqh4/RRp34HQoTz/Z9Wv71HdUrI5nYzob44tz27txrf6oGlOsrDmo/SaUNcwTwiRS2m/U/r4DBSNQ0H8YWbQTMaZSdpxF3Vd1DdBpLMrDtqCS4zPNh/BVlfFwea/h8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gallagher.com header.i=@gallagher.com
 header.a=rsa-sha256 header.s=selector2 header.b=gxMQH+Se
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gallagher.com;
Subject: Re: [Buildroot] Update schedule of sources.buildroot.org
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

Hi,

I wonder if you have found out the problem and is there any ETA for when it will be resolved?

Thanks a lot.

-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Tuesday, August 1, 2023 10:11 PM
To: Afshin Pir <Afshin.Pir@gallagher.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] Update schedule of sources.buildroot.org

[You don't often get email from thomas.petazzoni@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]

Hello Afshin,

On Tue, 1 Aug 2023 04:36:24 +0000
Afshin Pir <Afshin.Pir@gallagher.com> wrote:

> I wonder when http://sources.buildroot.org is updated normally.
> Because from what I see, it is normally updates pretty quickly when
> packages are changed, but there has been no update for last 2 weeks
> while some packages like openssh have been updated.

It is normally updated constantly. I see right now the script from Peter Korsgaard is running on the machine to do the update. But I indeed see in http://sources.buildroot.net/openssh/ that the latest openssh version is not there even though the bump was done quite some time ago. I'll try to see what's going on, though it's usually Peter that takes care of maintaining this part of the infrastructure, so I'm not super familiar with it.

Best regards,

Thomas
--
Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com
________________________________
 This email is confidential and may contain information subject to legal privilege. If you are not the intended recipient please advise us of our error by return e-mail then delete this email and any attached files. You may not copy, disclose or use the contents in any way. The views expressed in this email may not be those of Gallagher Group Ltd or subsidiary companies thereof.
________________________________
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
