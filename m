Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5561C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 02:24:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1642161073
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 02:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1642161073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA89080D9E;
	Thu, 28 Oct 2021 02:24:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yqiMjzgp196A; Thu, 28 Oct 2021 02:24:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C890080D9F;
	Thu, 28 Oct 2021 02:24:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE2991BF969
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 02:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDC3480D9F
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 02:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1r_NLaeLwtsZ for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 02:24:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7310C80D9E
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 02:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635387863; x=1666923863;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=tqebS/SN83mu0SeXmIqsNlHV7efS9qlSFRqKdc+jXUQ=;
 b=b6vtvPAZq6++p+xLxd5YtL9MEUp/eEC9O4EojH45IqkLaV+Hsg2fjBdT
 feKXxitmVFpNSGb1TECuZh53PqenJFwk6rD4njxRKdoTUASZmFoPEEItP
 RKLJ7JgCKgmabXhmilbmqt1vaPf6ZU/lNDFJRR0eyvH7mlz0TprbSlSVj
 zWgPy1Dg6Uvq5RzJ0zY2oE9kDDzP+d76Kwl/k5o9TwDyA2C7rjqmJEHAa
 OtPvAltmSO838SuN7nPQFTfMLAtNE/9HRu+Syp3QxNJeRjrzl1mlszaIe
 A53lMDxNu1nx1n/r1ROpraBNYAfXPG78Te6RJ1t9RLDbx2DuT13f4faZT w==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="183033662"
Received: from mail-sn1anam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 10:24:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MI6+5s69xWhwh62NInGqI6+ssyc7LXSf8gCUJcN6m+f5RVPp9WRGqj/wlq4id60qNzKfVyvVeEj5Wad7+5lJy3so7hqZVUUHmyJ7VyvwyuWZ3C4ho35wNK9kmEg2gXi94ZUXsEgoPahvJUfloKLmLNUwqPGmrpL67w5tJ392ge/2Vlh5gSZaMjHIVMoGgSlVX5WN7q6FuhcEGQapwWAiR80TXmXoYkIwT7vXenJizAGngZQTbDL1HCaXWgfnQPu8GZMzr8b54PVr31JgWjZI8ZnzvWh70VDjWPw71k66VXxx5ElyvlOhiag6DxRGaBHvfNgq+9LuS7RfALps2zTjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7jemZUObbTiyZEq9ERH5EMUY/rroWqw0aId2l14LIQ=;
 b=VbW2jZNouarABwD8rnvd2N5nmzKHpblJsHxJ5xXqQ4rcN9RdGcfnZ9HXq+phcvmjtsvrhoyWIAT7i93ooRnKZ9vozDyVxciw7XA+w8RqYR9E4hf8pGk0ArR5KMgvIniem2UeHZoKtgnxOIxAnm8jWX49BcKd+S8qOPzogG6Kp7L3MoX4U17KFYrVmcD0mij2j9T2Vbk3nodpmEFIsoa37G+wPllz0dDQ1cnmlnRoRH2+thQIdTC1Dgrh4rJUCeeZZq8HyhiH4bFhhPbqtR65zPNr4x5hxu8jUckg6LpO5nFIrF+dEiLOt5Bu20Xp/gFFXVxU0O1ZkIy9AExm0J5LVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7jemZUObbTiyZEq9ERH5EMUY/rroWqw0aId2l14LIQ=;
 b=F3NhrL3cqFJIkj2cZxmtaaioyANPHP09LDzD5JiSvRTAu4t+bGJKFYb8f5r09dC8aUgEicijJ/WAnQesi1+QPRl10xW+rpwLHKbwopaUioRF7ObSrreEfjjBp6KGvcMgyAB7krAr1forWvniQ8v/u3G98av9z+d9P6fuiYnivmU=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB5241.namprd04.prod.outlook.com (2603:10b6:5:10e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 02:24:19 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::5034:7af4:3e2a:b1af]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::5034:7af4:3e2a:b1af%8]) with mapi id 15.20.4649.014; Thu, 28 Oct 2021
 02:24:19 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Sean Anderson <seanga2@gmail.com>, Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v5 05/10] board: Add Sipeed MAIX-bit support
Thread-Index: AQHXyjmPBFf6vXtxHU6uYcYx520GSA==
Date: Thu, 28 Oct 2021 02:24:19 +0000
Message-ID: <DM6PR04MB7081F6C9116157E809440F3CE7869@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-6-damien.lemoal@wdc.com>
 <87cznqpocv.fsf@dell.be.48ers.dk>
 <DM6PR04MB7081C25D109CFECB60F402A3E7869@DM6PR04MB7081.namprd04.prod.outlook.com>
 <e6eb0eda-20db-dfd6-c3d6-47db131bc247@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb57d423-f49b-4ec9-ee16-08d999ba0c0c
x-ms-traffictypediagnostic: DM6PR04MB5241:
x-microsoft-antispam-prvs: <DM6PR04MB5241FB8429BFF63EA5919C29E7869@DM6PR04MB5241.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hqC/yXcVc3W9k1N5obXfqFoz6VNgIuLaMj+TjulzKOrAUYSol5mnVd4mr/fOLbx50KHqweEYjkUNs9nsxKOwkYbFv8GsbLIYA/fdnq/K+ned406QptBgYQSnAgZqvhjJgS9JW6pel1zdPcReggjfS3TfjlA+XSoi9I3KhWdiBbUh+VjLHzqy4mBHTC+BEVCZ/ZL/60hiWEtKrSz7HfNL0xfB6A5N9zROn34FuTZ9/LLUenqPp0uExCv2x2CNg/VasSitnTL7+6Gtc+hGHExHoSE86oX6Ry/Fr0h1OQTUURCo1aF5A9cQSpurd+JRzV7fzqB4Ygoyb7wCFeSfhrDZSe29B+aCIuwhnmbJNPlDfI+Y8Q3FukpSJuEAd9qZ2ZnyU+6CD15TPGS3obHSLd4w/bkUwbLXsVN6hgjhlW6cJsTwwltN2ahI3D0EyE9W4CL88a2SIgItPip4Vi1F7FveG+kEOrxXp+IfighH6X7C82w3gQnScbgVXEn1H2WTWE9J4IT4kNGFd3v4p8OQSU1IqMIF5DAGdROO+FHRwmQ98TXNLVEX766+UR6m9Sl4gVOsOzwCaSq2+5KQfHdlMZen8mfASDY6PxxHyzarD3hZ1rLinFLdvrZtbGBZVpsn3y07ypExfTYuvTFcqabUVRmmEnnn2MUvvFHyAUNKqxU8PrTE3a9RRsVfyUSBch7oIICoMYzQJ22fEqz1DKLH3ZfvFkjFC36ChevxgjEz488BlDSqgKszoA83TdznsxPCTNxFahbXzKDqbIi/nfaPvCCjQ8Ri2qcuUSRIzieyI1QnbuqGzNvCJGPBdgcGTKV2opkpE2+uXBN1C5Fs3ga4p7iTFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(38070700005)(64756008)(66556008)(71200400001)(2906002)(52536014)(66476007)(33656002)(53546011)(6506007)(186003)(66446008)(508600001)(8676002)(91956017)(7696005)(66946007)(122000001)(55016002)(54906003)(5660300002)(4326008)(316002)(966005)(76116006)(83380400001)(110136005)(9686003)(82960400001)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yQvwImsYxAtv8+1s6eTxpyaw4Ef5838dA/yqqKQLbg/TpNSDILoMKJxMTzpd?=
 =?us-ascii?Q?V3KECPrVNakpWyh/YEEA8PtUP7dWGC4F18N1m/ha9nKanmdVmTaNflVfS3Ly?=
 =?us-ascii?Q?wjNcOaGymUiWwO3ZEX+rWtnv39JUYBg3jw1tF5SdL2JBa+uXSN0pCdLOiMP9?=
 =?us-ascii?Q?NgECEWM7ZRgH5N/eMIWm7p+1eqldPWetxGIsefxWbi1GIxl26TlIQcMAIsLf?=
 =?us-ascii?Q?9W1tw13KyLjVGsep4dA2TeBYm+BCF4nRnz2vUJxygFOe2iRz9U2PMoTy2xTX?=
 =?us-ascii?Q?bTA55aortY1cMzcJ/h6xktUlV8jUTbrAzjL1lOSRlkFTova16RlJvEDAgfR/?=
 =?us-ascii?Q?ahYtXb6CxRUjw2Llib70ctVmahjc83Nio9IOK7fmec4yTHSu9IJc8+903Gzk?=
 =?us-ascii?Q?9rqj5aR3MdTNzoZ6Qbn/NBtMeLY2dETSA5xBceLJ14HexX1xZPoqU+z5Gz+U?=
 =?us-ascii?Q?BunPIi8GErbUXcsrgXqubQsgEuECLk+UxMmivX/ZsMpkddiJ3CmY4+JSMZ1t?=
 =?us-ascii?Q?37qWONnngBAfGhsINcwdGVMnVoqZyIYtBVQ0uE6vXIjcOlFnyAj9o54qyTdI?=
 =?us-ascii?Q?rTV/1ymemjZvLIDZirNFY0XUo8oGSrl41Nka0J1hj2qonFPcSCI8Bbj/EdgG?=
 =?us-ascii?Q?OwWr4HSd12gWhHAdCPmPNyjtXksr9WBpUeBCkLgT6VGntTka7NQR0CjmUnL0?=
 =?us-ascii?Q?R/+ZvsJiE6ji527xvEEdE2O+8+0KYw59ue/Q4OjTGpUp6SVh8PkFKobtClqw?=
 =?us-ascii?Q?/ygVJ/qN0KoSVjQxx4DkvUGxTcoCYjDegKwLwVSiH8faILsQfLqMpGUhxQbt?=
 =?us-ascii?Q?hPgPi/OSneZ9OHn6oQBHw6pOfgf8ur40sZnDRdIvzEar7K9DQCy1+/Gg+spI?=
 =?us-ascii?Q?gJCEHvmPwhAk0e66Mg/djMleiueb8XL7379BCmpaUCL2g9qFA/wnb+19+pVV?=
 =?us-ascii?Q?nfLZA7MJbdccu20c3JptTEWA1ny4ECdky+dJecVwRn9SRBG+NZWMJcw7wrM4?=
 =?us-ascii?Q?pEVqhBov6eBNNJqKBWcr6hJzA0T8qzcqWuJRt/pQj20vFGYmtZDzRu2yhqQ9?=
 =?us-ascii?Q?TZvbs+1Z28Y6ktSXt9ziD5dzwEVrotUUC4YTayFczazs45vPCn6zFpekNKFL?=
 =?us-ascii?Q?ndvZ4JFRP+pkxF8RftzcQiiX/B02wP3QqAgkbLje7OR2Tw4sWPM6Djl1q1g9?=
 =?us-ascii?Q?7Oy3AHAs5o0Y/KKFkfBO/1utdZ7OCF1NaCzLOZQv58Z0ln72Hbj0rB73BmAm?=
 =?us-ascii?Q?1QvXjVN70wmi+sZCZ27xgonh9rRIXYCCmWf8XnYf0OnMPQjBhaY9+Flgi29p?=
 =?us-ascii?Q?T6DmslRTzcUMyE+puNW3H+SEzWUKY72rB5RRGKhZGxm6H+avV586dcM+5PLy?=
 =?us-ascii?Q?OvcbU7BCqsJdqEukEjJ6ZjmdymZ+iGlqFGjC24hQJnc71buPZBoApIi4HLCi?=
 =?us-ascii?Q?vbl7gn9KR3z6flZ1tG0QBcStY3pfxSxHrSuwhAqZCGIeOQcwp+ronXfKqkps?=
 =?us-ascii?Q?Nhe92kF+VIBXoU3kcZbPcIQuX+PutyBi8p+oy9zQdsN4mLVuJswH1aPDWVsZ?=
 =?us-ascii?Q?aDgnpwZrpS29TaOGKOm68rna1bj177nFgG4+leXa7BvL3pTyBvQGzDZLaXNs?=
 =?us-ascii?Q?eF6qbgFdRHLH6vhwXadID/6SxdxmOrsEUmNYMT23i34FYnRxXRcqRc14FDSy?=
 =?us-ascii?Q?7cCi1IVbKISpUm56kwhFGfmhamG3PHWaYSBXI8VmmAhLr/FG?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb57d423-f49b-4ec9-ee16-08d999ba0c0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 02:24:19.3054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +zy3lFpzg4Q9JP3tfVVAuVC/k/3zyjPXIe1m12rz2mJtkMZrM6ZlJ/MLuwkdYV61NwepPokFRjSrRunyaLsb1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5241
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2021/10/28 10:21, Sean Anderson wrote:
> On 10/27/21 9:07 PM, Damien Le Moal wrote:
>> On 2021/10/27 22:51, Peter Korsgaard wrote:
>>>   > diff --git a/board/canaan/k210-common/busybox-tiny.config b/board/canaan/k210-common/busybox-tiny.config
>>>   > new file mode 100644
>>>   > index 0000000000..7adcaf1db9
>>>   > --- /dev/null
>>>   > +++ b/board/canaan/k210-common/busybox-tiny.config
>>>   > @@ -0,0 +1,241 @@
>>>   > +#
>>>   > +# Additional config changes for busybox-minimal.config
>>>   > +# to reduce the size of the busybox executable.
>>>   > +#
>>>   > +
>>>   > +#
>>>   > +# Settings
>>>   > +#
>>>   > +# CONFIG_INCLUDE_SUSv2 is not set
>>>   > +# CONFIG_LONG_OPTS is not set
>>>   > +# CONFIG_LFS is not set
>>>   > +# CONFIG_FEATURE_DEVPTS is not set
>>>   > +# CONFIG_FEATURE_SYSLOG_INFO is not set
>>>   > +# CONFIG_FEATURE_SYSLOG is not set
>>>   > +
>>>   > +#
>>>   > +# Build Options
>>>   > +#
>>>   > +CONFIG_NOMMU=y
>>>
>>> That is already taken care of in package/busybox/busybox.mk
>>
>> Right. I overlooked that. This should not be needed. Will check.
>>
>>> Did you verify if all of these tweaks are needed? This looks pretty
>>> extensive. Perhaps we should update busybox-minimal with some of these
>>> instead?
>>
>> busybox-minimal is fine but gives a larger busybox executable. I added this tiny
>> config to save memory when running and avoid failures due to memory allocation
>> when executing complex-ish shell commands spawning multiple shells (e.g. pipes).
>>
>>>   > diff --git a/board/canaan/k210-common/rootfs_overlay/init b/board/canaan/k210-common/rootfs_overlay/init
>>>   > new file mode 120000
>>>   > index 0000000000..a0b71977c0
>>>   > --- /dev/null
>>>   > +++ b/board/canaan/k210-common/rootfs_overlay/init
>>>   > @@ -0,0 +1 @@
>>>   > +/sbin/init
>>>   > \ No newline at end of file
>>>
>>> Why? Isn't fs/cpio/init suitable?
>>
>> In the past, I was getting errors mounting devtmpfs. Trying again now, it seems
>> to be working as expected. This added init does adds mount of sysfs and procfs
>> for convenience, but the main point is that the last exec starts the interactive
>> shell instead of /sbin/init. The default busybox init executable is way too big
>> and fails to run.
>>
>> I could just overlay /sbin/init as a symlink to /bin/sh.
>>
>> I do like the sysfs and proc automatic mount though, and the cute logo added :)
>>
>>>   > diff --git a/board/canaan/k210-common/rootfs_overlay/sbin/init b/board/canaan/k210-common/rootfs_overlay/sbin/init
>>>   > new file mode 100755
>>>   > index 0000000000..6ec4748c03
>>>   > --- /dev/null
>>>   > +++ b/board/canaan/k210-common/rootfs_overlay/sbin/init
>>>   > @@ -0,0 +1,27 @@
>>>   > +#!/bin/sh
>>>   > +
>>>   > +# Mount sysfs and procfs
>>>   > +/bin/mount -t sysfs sysfs /sys
>>>   > +/bin/mount -t proc proc /proc
>>>   > +
>>>   > +# Use the /dev/console device node from devtmpfs if possible to not
>>>   > +# confuse glibc's ttyname_r().
>>>   > +# This may fail (E.G. booted with console=), and errors from exec will
>>>   > +# terminate the shell, so use a subshell for the test
>>>   > +if (exec 0</dev/console) 2>/dev/null; then
>>>   > +    exec 0</dev/console
>>>   > +    exec 1>/dev/console
>>>   > +    exec 2>/dev/console
>>>   > +fi
>>>   > +
>>>   > +# Print a fun logo :)
>>>   > +echo "          __  _"
>>>   > +echo "         / / (_) ____   _   _ __  __"
>>>   > +echo "        / /  | ||  _ \\ | | | |\\ \\/ /"
>>>   > +echo "       / /___| || | | || |_| | >  < "
>>>   > +echo "      /_____/|_||_| |_| \\____|/_/\\_\\"
>>>   > +echo "    64-bits RISC-V Kendryte K210 NOMMU"
>>>   > +echo ""
>>>   > +
>>>   > +# Start interactive shell
>>>   > +exec /bin/sh
>>>
>>> Cute, but why can't we use the normal busybox init / inittab?
>>
>> The default binary init is way too big and fails to run (ENOMEM). Even if we
>> could run it, it would stay around and consume memory for nothing.
>> That is why I just go straight to an interactive shell here.
>>
>>>   > diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
>>>   > new file mode 100644
>>>   > index 0000000000..bbbe00d44d
>>>   > --- /dev/null
>>>   > +++ b/configs/sipeed_maix_bit_defconfig
>>>   > @@ -0,0 +1,14 @@
>>>   > +BR2_riscv=y
>>>   > +BR2_PACKAGE_HOST_ELF2FLT=y
>>>   > +# BR2_USE_MMU is not set
>>>   > +BR2_INIT_NONE=y
>>>   > +BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
>>>   > +BR2_LINUX_KERNEL=y
>>>
>>> You don't specify the kernel version, so it will change every time we
>>> bump it, please specify a known good version.
>>
>> Any version including and above 5.13 work fine. How do I do that ?
>>
>>>
>>> I gave it a try here, and it fails to boot with 5.14.14:
>> [...]> [    0.253373] i2c /dev entries driver
>>> [    0.258022] random: get_random_bytes called from 0x000000008000569a with crng_init=0
>>> [    0.271672] Freeing unused kernel image (initmem) memory: 608K
>>> [    0.276809] This architecture does not have kernel memory protection.
>>> [    0.283241] Run /init as init process
>>> [    0.289488] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
>>> [    0.296422] SMP: stopping secondary CPUs
>>> [    0.300340] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---
>>>
>>> Any idea why?
>>
>> I was getting the same when elf2flt had problems (buggy relocation). What I sent
>> is working for me doing this:
>>
>> make clean
>> make sipeed_maix_bit_defconfig
>> make
>>
>> And flashing loader.bin gives me a working shell.
>>
>> Not sure what is going on. It seems that elf2flt riscv support is still very
>> fragile. I need to address the comments I got on my PR and dig further to check
>> that I am not overlooking anything.
>>
>>>   > +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>>>   > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"
>>>   > +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>>>   > +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
>>>
>>> I see you are adding documentation at the end of the series, but perhaps
>>> it would make sense to add a host package for python3-kflash to make
>>> this work out of the box?
>>
>> Yes, we could. Do you want this with this series ? Or adding it later is OK ?
>> I need to check how to add a host package. Not sure how to do that...
> 
> I suggest [1]. It is faster. Though if you want to compile your own
> 'ISP' it will take a bit of tweaking.
> 
> [1] https://github.com/loboris/ktool

Just tried this and it does not work for me. I get:

Greeting fail, check serial port (SLIP receive timeout (wait frame start))

Tried different options, baudrate etc, but all give the same. Not sure what is
going on.

> 
>>>   > +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
>>>   > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"
>>>   > +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>>>   > +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
>>>   > +BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>>>   > +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>>>   > +BR2_TARGET_ROOTFS_EXT2=y
>>>
>>> We have genimage in buildroot so it is easy to create a full sd card
>>> image with the right partition as well. I also see that there is some
>>> k210 support in u-boot nowadays, would a setup with u-boot in the SPI
>>> flash and kernel + rootfs on the SD card not be nicer?
>>
>> +Sean who did all the k210 U-Boot work.
> 
> This should work. I have not tested with a recent kernel. If you have
> /{uImage,k210.dtb} on the mmc it will be loaded. See
> include/configs/sipeed-maix.h for details. And feel free to send a patch
> to adapt that to your use-case.

OK. Will give it a try after revisiting elf2flt.

>> I have not tried but I think it should work. And as long as the final memory
>> usage is the same (e.g. U-Boot not sticking around in memory), things should be
>> all OK.
> 
> It doesn't stick around. No SBI either so Linux owns the whole machine
> once it comes up.

Great. There should be no issue then.

>>> Any specific reason to keep the kernel in the SPI flash?
>>
>> Not really for now. It is just very simple to use :)
>>
>> Going forward though, I hope to be able to use XIP to execute busybox from there
>> directly. There are patches out there for this board and got report that it is
>> working with nommu. But that is more for the cpio case than the sdcard case.
> 
> Can you link to that series? I made an attempt in [2] but never went
> beyond reading (and perhaps writing? I don't remember).

I do not have the patches nor a link to them. The developer mentioned that he
has it running on 5.13 on the Maixduino board. Let me ping him again to get a
status update.

> 
> [2] https://lore.kernel.org/u-boot/20210205043924.149504-1-seanga2@gmail.com/
> 
> --Sean
> 


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
