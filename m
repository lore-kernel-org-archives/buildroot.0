Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF11CC001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 16:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6387040B5D;
	Mon, 31 Jul 2023 16:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6387040B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLUK9zu-ksRK; Mon, 31 Jul 2023 16:17:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60C2A409E6;
	Mon, 31 Jul 2023 16:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60C2A409E6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DB161BF334
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 16:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06D3C610C3
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 16:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06D3C610C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvd1_d7f6-3j for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 16:17:31 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::623])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C45D9610C2
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 16:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C45D9610C2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jc10xapo9HqU+PJw4J38CoxrAuoRnfgRDAJmZarU1OjkXVs8iJzP+sI/BecRJnOjbW8AlUx2XzsmUeWMNvvPz/tV+lxMh915Qg1iThtWsJyAKtEYO8d5nO0TEoY+s4qKqtv88dxLLihP/o93zCq0P2qmLSycJsertBH5mhZVdjmcFWNGPkrdSml0jh2oWpOgoctyyW3ESlc7+JTcDizrSMFFwsvk8iDpCm5/jgH1CfXZNUM4m5DcjmoUiXZYVJQ4sNicOrFP+WqhAfcpMzm4D1WsIAUNYrLoshcNv7ptVf6ktZteecPJJzVKzPg1QO2rGw1J44MRdobKICLcWK8K5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgFUNmNfhyIEHnRnTOI/i7LIDMN63oiqAhIQP/2n/wg=;
 b=UbPRIt4HjBOUsW18i4chUgGdH4iIHFNd4uHjc/EhA6SNKsPRmdn/+EkZjfYSLu7SZ3pkHnLMWEHeE3/MgQ52XJ1vKOLcZSXjsHqc4R+vt45GC/kmoP2ui5RXiM67CXE5tDCKR1aUddB8FVK+3J1CbdpyujR0obK3Kll4B6Uk5yMR/9FWk2Jobor4W/zDp9/fmJ/GZbUGlnu2e/FDQ9o5ze8/jpX00Bd8ToV7SarNSzRaMi/qT0zT1JlZDhP9Bb5SXcMZ91EpltzBtnAz+6HiLxQ7RFx/lmV894NHoSRgI7yuA/W8AyWfsky/iLudq7MvA3qUBprN+zJEWhdLLmxM2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ2PR12MB8692.namprd12.prod.outlook.com (2603:10b6:a03:543::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 16:17:28 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3ed1:482d:14a6:d401]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3ed1:482d:14a6:d401%7]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 16:17:28 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v1 1/1] board/zynqmp: fix atf build failure
Thread-Index: AQHZw3XSD/nC8eKrlUCtMfQ/zbF586/TzBKAgAA8+UCAAAI3gIAAATtg
Date: Mon, 31 Jul 2023 16:17:28 +0000
Message-ID: <CH2PR12MB5004AF7439020873F90EB476F005A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230731061113.193556-1-neal.frager@amd.com>
 <20230731142113.3945104c@windsurf>
 <CH2PR12MB5004F616135C586B599F520DF005A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230731180723.2ac1d93f@windsurf>
In-Reply-To: <20230731180723.2ac1d93f@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ2PR12MB8692:EE_
x-ms-office365-filtering-correlation-id: 22627b4c-13ae-4e5f-8f18-08db91e1a26e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yZVL+sb8mBgzmsaRssey55V0KVPL2VA1CxWHkG0+fPJ7LRMADMz4RvxFJmoaixx6d+LTEM7abYdKfKUxvZCNzMOarkIOw294W0+iSqp6lxKw3Q0aVOPeF7y6CDYZC01ojcOr1UeBTU9VJW7ePdlvNI0FmGCtUmPH2W4z+vzRuH3TZNGAOXJI36S88PN0pNsI+E67T1+ll5n5a18zYkveqUe7xboXjYUdoYLGtk/prpElNib8kiKe05NE87FP8ffPeC0lXK6fwczqab/0OrWcTke+k9o7z/Dr/bUjBMqDomf63zuw4HT/Ul0JMjnJ2U6fGnL3N5RAFcxsOiYVBoIpK1Gv7d5Cqq7DY7KqlTD7fnqhxJX/1S3l4PsSNqEoHtVNBou4aAl5jzFYJerBjztppcUnDALs9YBxKQR3BuRpG04MdLrNw8jYIYsqIPb6dDuAJ+UBXdWLCJpifQi+hgtiPlPT37J9spuG4yM1IWtVIowKq2poEyT78jkwWe6ttAkHam4YILok/UqSrBBq6vQunRCMqybiToMeDbSdjTj+jRJvsyLauaYVFP+6l15x7zsmwXNCqxXDgYy1ym9wA/PsIn3D0g5di6GQHptJptFX47s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199021)(38100700002)(122000001)(55016003)(86362001)(38070700005)(33656002)(966005)(9686003)(71200400001)(478600001)(7696005)(186003)(8936002)(26005)(6506007)(8676002)(52536014)(5660300002)(66946007)(66476007)(66556008)(76116006)(54906003)(2906002)(66446008)(64756008)(41300700001)(6916009)(4326008)(316002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7wDqrbKaettKSQ1ZCujfx8vlij8k1Raht7iancOFpA07L2e2JiQrm7H+liYo?=
 =?us-ascii?Q?/+bKXDYU8LCw/jGQr6GFyLXW5ZOEpuHSxedVejqgwvHU8MQpfqqU4QqUNkbL?=
 =?us-ascii?Q?3j1Y4xj0qVgjlOYfv0Ys2dq+HyaqZwwcVr9TI2y8BDRXTc9X2mBWfrcGVTxb?=
 =?us-ascii?Q?Ud8GxqbesSoQQkh+TLzoF60b+n0ExxkMdTQBTi93Jt6v80C5uCXw6OJ4FI25?=
 =?us-ascii?Q?YeRB7FRMhioVbo84hgTd5k4boqsCnJPXo9bb+MP4kfkuBSbLQePbFg57NB7v?=
 =?us-ascii?Q?lLw5w/n6f4gUh81XWvNdR0ivTgb2/WDtxJ0U6Dy3RsklatK60/otu6iaU4k6?=
 =?us-ascii?Q?AZRU7NeC+z3MUvpmP3w/nMuCyOeKjxqmDWyvl6dnRF+gYC8Ft7KGewkjMl+x?=
 =?us-ascii?Q?lv1JG9oY1GFKiHHtn+3jDiEoNJvJQ4zL+5FWsBVew52cAt/sNib+Kgf59IAs?=
 =?us-ascii?Q?230EF8I1S49OHWJ+Uo4fylg/QzJoiV4z6a8aohUEY38z2wP6UITv38Tth3lb?=
 =?us-ascii?Q?/8u7kQHrcFe86IT8zL7mNMkxYscf8a95UnpOn3TN8PHeRsT+0qSA4Qm1nTjq?=
 =?us-ascii?Q?Ra9nbYPK2js5iE6Es9rj9penO5Rhrae2lJjoT/ptbfguqzhO4voCgbUwGvQH?=
 =?us-ascii?Q?jFkGLMmdkDn0HYhBMnJmMfjx8wq/tdIWkPZjdSW/DWlewNGTrf7jzy7p10L7?=
 =?us-ascii?Q?2bhIhM60s1NTtfclutC/vc9BedwsbprcybPMvi72H6tL8ivJuyPH/zj/Ee+D?=
 =?us-ascii?Q?v9skVB82OzfitncPxC67n+G37LnYDi3+GBEA630gIA1UP6MXs4yxHgQPoa1j?=
 =?us-ascii?Q?bPds4xuch3Sjg9ynqMv3uLdFwsWA2HPtA1hJ1wiXztGzSA2QbuiB+Zgn2ERO?=
 =?us-ascii?Q?YFfovyMf84Wpo1nuWHNBn+tJdsFLXT5dcBHkArFFm7YDyrelC6Ao8Ebqe0J4?=
 =?us-ascii?Q?A2NiTtTBtsttY00lH1lMGuwqh84OYq403k2KqberXk9pEB2AYQCMupxKA8Nt?=
 =?us-ascii?Q?T3m4oXlNtV5FIP64R1/yVrdl7m8++GZDobGS27fEECxuITKK7399mVyBgnBU?=
 =?us-ascii?Q?fXZByi+5D4yVj0/MUI8q78iZJz6aUA5965R1SwQ+ImoWqf0t0gxFhdOTLxE1?=
 =?us-ascii?Q?3hi0juIUtEcfH5eP2bA6pTcK00SPmTUpjYqhiaO/BnGvV5q/SZ534V7JDEBU?=
 =?us-ascii?Q?SikBJMGmsyMtLE3X2mNV0UXslB4ETdtJHd59R/dwX3kqXCRzCYGNYTCXNcTp?=
 =?us-ascii?Q?4OfX/pK+aOWw4sG3PQfXbLiiT6rche3BwFJcomejktRC6hSR7vlPI/Ifl3Z9?=
 =?us-ascii?Q?Sm4irWmx3tIotpUIceQbp59FApx+dAZLfT5CqulAGhyjuv3SH4A7a4dfb3EM?=
 =?us-ascii?Q?k3AJtlSS1NANUcwQAN0IYjO/yDGRZfrOofvqbo7U62O55sOMAedHWRGy0wOa?=
 =?us-ascii?Q?VyK2mViFHYQ6nd2d6ZQ7WEyQ72Uei+OQF5YGuCPRfsnY30ldTqHoogwm+6aW?=
 =?us-ascii?Q?aWG3fN8rEIIY9U168V6N71TxblHcRwL9ceIFbChOz3EajFk5+KKhwBe5ZqIt?=
 =?us-ascii?Q?uieRDhRSldETgyyvxnw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22627b4c-13ae-4e5f-8f18-08db91e1a26e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 16:17:28.1448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Qkr4chOTWKlZ4qE3vNnHFUJ9inQB2Ck0we5eO2hkvOgM0Cm5bCtoNznvCx0NTpV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8692
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgFUNmNfhyIEHnRnTOI/i7LIDMN63oiqAhIQP/2n/wg=;
 b=vj3OrIvKsdNe3N+eCeq9czdyxtRPyjzT5hBzVJkb0MDLOXEuaPwALAOfZ9bNJGEz29ds1L/NQleVzE1czyI9hyKdOzJjWWJCA6+/TQnHQ3J7SyBwdKsAf/d08nACmfP1a3vh9tUA+H9wubIKCmvYQRUur1qDgct1O8U1zkrFXYk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vj3OrIvK
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp: fix atf build failure
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> Thank you for pointing this out.  Are you ok with my just creating a 
> link to the arm-trusted-firmware patch for v2.6 already included in 
> buildroot?

> I saw your patch that use a symbolic link. I don't have a strong opinion here. On one side, using a symbolic link obviously avoids duplicating the patch. However, I'm wondering if we will remember to adjust the symlink in board/zynqmp and board/versal when we change/remove the patches in boot/arm-trusted/firmware/. Or maybe AMD/Xilinx will update to a newer TF-A soon, which will no longer require the bug fix?

I already have a patch set ready to bump the zynqmp and versal boards to our 2023.1 release which bumps to TF-A v2.8.
I will make sure to update the symbolic links when I submit these patches.

Our 2024.1 release will be based on TF-A v2.10 (or whatever it gets called).  As far as I understand, the patch will no longer be needed when we bump to this version.

At the moment, I am committed to maintaining the zynq, zynqmp and versal defconfigs to follow the AMD/Xilinx release schedule, so I will make sure to handle this.

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
