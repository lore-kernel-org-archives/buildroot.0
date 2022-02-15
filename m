Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064D8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 23:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67C9660B68;
	Tue, 15 Feb 2022 23:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id deZm_fppjYVe; Tue, 15 Feb 2022 23:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C85B60B04;
	Tue, 15 Feb 2022 23:44:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3DD21BF20D
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 23:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF95240923
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 23:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="nWjrhHju";
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.b="gTZrpDJE"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VFiyE0nBCWpE for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 23:44:37 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E658740920
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 23:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644968675; x=1676504675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GNPZe4taKN/Q5bSaFUAg/NO+RwBRPTWiMqYj0aiiqUE=;
 b=nWjrhHju2Zr42/RbZRtt5/eIFAbSPh5JEhsfI8dNtsQJy0Ns20KY8rkj
 piciGUGjnWI6yK1d5zgWevFGBM2JNNIf8V1NmLx0WZZyH1ZAgBIikuhl7
 uWlMW1EfUrRIDWcigpQw+xy2kEL8iGVbz0K2nzUtW5d+9IfCHcZZ5HmSG
 Ui0LjDVCe+jYPUSagL0nD/Jnwf53ZTFykTi1iP4BxiyYWxfRUAeBH5sjU
 C/zWDJkvTTvqn0VED8GUn8oz1kHhNtjUr3kwT+m3qQdhjVK5nYAkqCHXY
 Szp8+1sxa3J3OroCILhjEe8CytZnY+Ox5A68WWSjdvKxTfU0Pk1urERWp g==;
X-IronPort-AV: E=Sophos;i="5.88,371,1635177600"; d="scan'208";a="193046172"
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 07:37:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuJAQGFFToq8P1JIKVyAACg7dmS2jefV3BBMNHBLJqg6iP7GSV1YmXl6pGsb93G99RaeUNSXnBKqWf/zqh+s91a3Rgk5B8IEpg4Z9vsRMe53FwpI3TZkTSXfaYMQ7vCGhVVMH5wPSul8TsY97XXhDQgT6Rj0W/f4A/KgQZqaE2OUSSM2pADzRVBROTYKfD4vpyMf/vulazAh5vDi3w9KNAcuMBjcrW2fNJ0UHHx8YVOTg9STqwU8AoboeKedxHK+w96w+G51chaD8LWU4vCvokyHr3bNM1q4B3VbLkFgAQwVbqpKDaFnQH62BjfJa6GEwzwkw6nG27kt1xAKqRi/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNPZe4taKN/Q5bSaFUAg/NO+RwBRPTWiMqYj0aiiqUE=;
 b=ZNRTt3br40YY8+TO64JR5mBkR/skiDzOFfc+OkN/54p0cuKQHFxfs0htLvNf3LiyCWbV3uqNh2foavgzwAZz07fpEBxOhO8IT3BNjDvVnwXtv4VRcMAw0Jrdi2Vw7GtyW5xqO03Z8etg7fhX8bmGP0nhZ+fbGkjHestAOfrVuHXQqbqyJpGWwMhnaPQ+xL0ICEqVV1wbCcIL2CQWBJc0H+w+ugStE0VYopJqcOIANzi4z0NaLTf8jJHa74FQ+cDlQDa3MMF9sgaSh9WfbYdmEmMs8eZibWg42q8+mx6jJ/lh3ABlGL5y+scEUIxNqn4heseYMqfVpIUBG+OYDYR5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNPZe4taKN/Q5bSaFUAg/NO+RwBRPTWiMqYj0aiiqUE=;
 b=gTZrpDJE28vPthP/55x+yrgAJ+3ce0ZhNR0GwaB4SiX7yYbODfBpjSSFM4AT48ewMUGpblNeeoS04pK8Vj0Y/2clVskKIpL8x3+ltk86wQnSMGiKWc0PeMTg2hw2eb4WiKHWbW9YGi2MEy2I3lggx0NCIPYEQ15YROlYvmLfDcU=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by SA2PR04MB7545.namprd04.prod.outlook.com (2603:10b6:806:14b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 23:37:28 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::c8f4:8499:a5fc:1835]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::c8f4:8499:a5fc:1835%3]) with mapi id 15.20.4975.018; Tue, 15 Feb 2022
 23:37:27 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v5 05/10] board: Add Sipeed MAIX-bit support
Thread-Index: AQHXyjmPBFf6vXtxHU6uYcYx520GSKxL4vEAgABGRoCABa6SAIBEHb0A
Date: Tue, 15 Feb 2022 23:37:27 +0000
Message-ID: <0a4ee945d9de8406fc1887ac2ae23037851f56f1.camel@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-6-damien.lemoal@wdc.com>
 <20211230212742.030be8c5@windsurf>
 <ba60fa7b8380ce6c817bb5bb2ada0283752efdfe.camel@wdc.com>
 <20220103162520.07b40bf0@windsurf>
In-Reply-To: <20220103162520.07b40bf0@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.3 (3.42.3-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6996f2d-0a31-4a9d-c01c-08d9f0dc2092
x-ms-traffictypediagnostic: SA2PR04MB7545:EE_
x-microsoft-antispam-prvs: <SA2PR04MB7545A79B33060E45DAD190C8E7349@SA2PR04MB7545.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1ttYoijGQgenPNE9lLriWzEGbupXCcjGdbhc7Ir2dvRR9vugrAqOwORptHVxSDvBeANde9LkMWrA3N5wNJBtnD8DdOmJW1x26ojurs18pvu6K+EwJCFA+Ckvwpfw6kqzn3dQNu+iW5AziEf9Ye8rqG+TjsqNWuJnG7HzqGhUzBGhORESPJ4MVv0G4+ODZEDh1P8E7vuXPZb8axVg4Z+V5RgF4qaY0Kk5zGcm97iE1f76xnPBAn/QHoMDS/aWwi2HtpTKjAkwC8UnHAdMTdvpTcj1lmNHbpAJb4orLmqvhGT1RTJfab5QviM377JyMgsRaPZNsXyp6XgtDMnJmXIyemGqy/NNwY3lCoMg3hNldXZBHx1zJqsbdoLotdpCIDetE2t6EsxU6+OlEsuEodcGo+WmUVIbPCDmd7R3u/q4xrMyNJ2wx0mwfBu4qmpVjQbkkRCZQlLShPgchQuK/5owB0p0yx70AgvyyKASr39agbABWKo0/VX0ijGqVWIrKZMq7TOL3uD8+WxODcKkvSRaUGRGFkSOUGeXxJCSi3J0IiXTjH1CQPhZQ2AZ0jvjD88xSCs1hKrLMc9cV8IQQIPkWiSRiuUiS8K1dXfHVPBZXSJomeKhc6xgiewWBxE/Yy3ClNfzXUya6VvY5ZTVTItaijL43VShDp7Lq8uOPQJNjCmzHEkyUa9qII5qy1HG1/mCZTeqMrCfTaIQmpTo5HEBEooUEe0LHd74zowU0q/jtE9BCgrhGWM4Mi27d7iIKW2t
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(76116006)(5660300002)(64756008)(66446008)(86362001)(122000001)(8676002)(66946007)(38100700002)(8936002)(38070700005)(2906002)(66476007)(66556008)(82960400001)(186003)(26005)(4326008)(2616005)(71200400001)(6916009)(6506007)(316002)(36756003)(508600001)(6512007)(83380400001)(54906003)(6486002)(91956017)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aE1iVmkwU1BGQ2tZMGVBd1ZEdjRZYkFuN3Z4L09qMkU0OWVMdWdYcmlFVHdK?=
 =?utf-8?B?aVQvdytheUxZYWxtQW9KRHNNWHFZWG9TZ25lYVNUNVhCTEFjR1pBTWlTdlZB?=
 =?utf-8?B?YXJ6TUNwbXE3NnVqVVZzTVQ2aUVLUldjaGcxc0owOFF1SHRHMG5YbnVvc0ht?=
 =?utf-8?B?a2NBVjA0emdsNmVFUHJmWFJSWlNVRjlNQjJCeGM4dTNHMHR3UDFuS2Y2N1ZB?=
 =?utf-8?B?c2IzRTBEZXVSd2pvTE1LY3ZMZDVieFVUam5iUUNNY0FkWEx2czNXU1YvS2gr?=
 =?utf-8?B?aGgzaHBqcnhkdU0yK3Bhb0dXRkdoRVBtRllLUENTMnp5TmU2eWZHaFZpeTVD?=
 =?utf-8?B?UUJTcGFrNTNNZDhuTmZoZ29raFMwQXkvbi83elZrVmFPQXV5cnNhRVlObmtC?=
 =?utf-8?B?UERDSll4V2FQZW9uWDdIWlNoQmc3a3UyUHJER3hVY1dybHJOMjZrc3VybkFL?=
 =?utf-8?B?V2JPakxHOENQcS92MUwzMFhNbFZjbEhPU0FSUVNCVE55VFF1L2tvT0Z5dDQv?=
 =?utf-8?B?S01kY0pSTGt0dEF6VEtBTm0xWEtOWFVhamZ1bzFkS0NrMWxYSFh3VlYvSndK?=
 =?utf-8?B?a1lvcFpzWG5WbjV5dEQ2ZHBEZmhxd0R0bUdsdklwZmxqRkt3dmJSUnA4dTlT?=
 =?utf-8?B?S09jc0VCQzgwaWtJMGJoaUxvd21PbXI0ZU4xMEdKbTBTYXhQU0NqOFh5ZjB2?=
 =?utf-8?B?RkFwTkwzemtkMmZ6citXRkNEUWpYZGdSdG5UenB5ZWZpQUx5eGszVkdlQ1R4?=
 =?utf-8?B?NG9TRmRWczZKd1FOSzVVOGhoQzR5T0s1K0pSSm40OHpQZ2pOaUY3REtTZnpS?=
 =?utf-8?B?a0NMOStSR2ZiOWFxS251d2JobjNqSXJGMnNGQU9EdXB4TE0veEJmVUowa1hy?=
 =?utf-8?B?SUtsQUZIWnI0MzBRY0JBL2RhK2xSSWxNTm00empsTURCQ1BmMkRlRjdNNmQy?=
 =?utf-8?B?TVptUTJnMUhjeWxOQVhkc2k1WllSN0lDL2JmOEZtTGkzd3M5UE5ETnNFaTd3?=
 =?utf-8?B?bmlnK3NiUmhZbTl3WmJpa1F5Z0E4c3J4WjNtVWFnYTN5T0pWMHd2aVFoeVNQ?=
 =?utf-8?B?UkJQNVJkdlNrQlp6bTNyb1dlVHZzeXozeU5INXJUSmNjV2h6eXEzVlBuNDUx?=
 =?utf-8?B?bi9RelZ4QUFJMFd1NDU4aTdoMnZBV0NrcjNwT3I3bjBwaWYzd09aVStPMWJw?=
 =?utf-8?B?eFpDQVNYdkFyRVJZZVhuNkpxSjJOZTVodkRKOTlzMzRUdlovZSswS3VWZEVP?=
 =?utf-8?B?dDJjU3A3bFZPQlIzQ3RtOCtrTUVwWSt2QzExLzl4bjhaKzlkVlhCeFBpZnpw?=
 =?utf-8?B?L1lnY3JqdjZCWE00Nk5xbzhMN1JqeGFFUHpzUjRqb2YzWm1qbGsxRGsvZ1VH?=
 =?utf-8?B?UWtEUmNxVDYxMm9NTjQ4OGE0ck9ZWmMzQnhqRDk5Uy9UbmxuZWdaZnJMa3JQ?=
 =?utf-8?B?eDVoZDFsNTdxSWhGbHp4L3lkQnl2SHYwNWFoVVRkVzEwV3AwbFkzc2J5ejdv?=
 =?utf-8?B?bkNKdWVtQUhEY0FwK0JBSkRnR3hKZ0hPdTlhVXVIUEJITVV6NHlFREdyTUZs?=
 =?utf-8?B?SVVFYk5uWFhYM1VBWUloVWk5aE1RSE5uVGc1b0daME9NQ2pXTTdMcDVPZG1l?=
 =?utf-8?B?QlZMTXJBWDlreUxWbnlTenJhaWF0V3lhcEZHdGJxYkRwTzlSbzZsck16VWVU?=
 =?utf-8?B?YjkvdEpvYXhFV2xNcVJEOUZWUmJDTkxRNjhsZmNCcWVoU3FRclhXVWxwclB2?=
 =?utf-8?B?OEZ0NXBNUGpUZ1R3TUpob0t1TzhDWDg4KzRmSy9tYnJoMThsZnBmeG5reG1x?=
 =?utf-8?B?QzJKZmlzTVpyeUdaMk4xMzgxVTFJLzAzOXlLSEM1YTJOQzRuY0ZnWkQ3SWky?=
 =?utf-8?B?alZ2UEpWRGYwSG4xSmdCNHl2Qk1lOW5MUkJpbVlLMEhlUVFPZjJjN2ZkLzRR?=
 =?utf-8?B?SnFTMUJVd0VDTC90U0NuRVorWXZYUGMvejlENkYvRkt1K002ZFFYeFBXMzRT?=
 =?utf-8?B?NXMrbzdZQlhNZFFUTURBTXFxUGszMjhyOTdsdG9TTHF4VUhYb3dTZWdtL2h5?=
 =?utf-8?B?U2RwWXAwNzZDUVUyY3BpWDdRZU1NRnYyaDd5SVA3STBzK2J2NWhuY1RRRnlx?=
 =?utf-8?B?L3dxd0Z5YkVqUkJFSEdTS1FKb1creGJueU1xQU9Td3hIbFE1SHlSTzlNaXZK?=
 =?utf-8?Q?Z3l6CHp7qypgChNeVrJxyhaiPyPe+38NvEtDXVx1pXKn?=
Content-ID: <FDBDD3CE3F773B49BB3FCA03474C5AA9@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6996f2d-0a31-4a9d-c01c-08d9f0dc2092
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 23:37:27.8345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GNs0XRZvMle/oPuH3Jaqpes6fbKxcKBtGLKlcrxiAn3d7LGmM61bODQshHCJkvg5GhOqZZMsLXbQmo7d92zljQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7545
Subject: Re: [Buildroot] [PATCH v5 05/10] board: Add Sipeed MAIX-bit support
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
Cc: "alistair@alistair23.me" <alistair@alistair23.me>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 2022-01-03 at 16:25 +0100, Thomas Petazzoni wrote:
> Hello Damien,
> 
> On Fri, 31 Dec 2021 00:39:14 +0000
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> 
> > My apologies about the delay. I have been swamped with the kernel and other
> > projects. I kept at this a little though, mainly trying to address the elf2flt
> > issue which seems to generate unworkable binaries for Peter, while it is always
> > working for me... Really no clue what is going on so I am a little stuck with
> > that. I will work on updates addressing all of Peter's comments and see how
> > that work.
> 
> No worries about the delay. I took advantage of the Christmas/New Year
> quiet period to help catch up with our patch backlog, and stumbled
> across your patch series, which is why I asked.
> 
> I also saw the on-going discussion with Peter who had issues with
> non-working binaries produced by elf2flt.

Update: I think the elf2flt stability problem was sorted. It seems to have been
related to gcc arch isa options that were not set correctly. With that done, we
stumbled upon some bugs in u-boot that prevented clean boots. We have finally
found fixes for all the problems now. We will be sending patches to uboot &
kernel and update the buildroot series once that is done.

Cheers.

> 
> > >  - The readme.txt file for each defconfig should be added in the patch
> > >    adding the defconfig  
> > 
> > Hmm... It is the same procedure for all boards, only the defconfig name
> > differs. Hence I added this README file last with all board defconfigs
> > mentioned. I can add the README file with the first board and update it with
> > each patch adding a board ?
> 
> Yes, that would work: add the README file with the first board, and
> update it progressively for each board.
> 
> Thanks a lot!
> 
> Thomas

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
