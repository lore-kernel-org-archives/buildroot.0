Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B6EC4167B
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 07:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB45B81501;
	Thu, 14 Dec 2023 07:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB45B81501
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SoJjjtSCNfQ3; Thu, 14 Dec 2023 07:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BC45814B1;
	Thu, 14 Dec 2023 07:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BC45814B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A62E1BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4177040917
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4177040917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QoMZPa6H-mvz for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 07:51:08 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::606])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B4CF400FD
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 07:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B4CF400FD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ncdl3/+LvYX0ASQBnw+LdesPe+Nh1wp+5RwQzzVxaI2hAxdtfwSdnQSKQXEM34zQRjNsXskyG4ZV0nT8LH/9diuUVGD7o+NSEHzvG1buihHBVGVXjvn2SlaeoUxIRclsEkiMrKR4bEiFDJ+LFkEKakWjQZp5fd65q3i4wCZ7RjP7hB2qcngyp9Lj2D2DLSLferN40sdWHwWfQKVhznjeq/NWlcABnixvTJNMkrxDo0NEiAq3VA4YtEZYzlNiZ6UY8jDnm6J5L6+MjR3XDHjD2sCmNhMY/l/RELZwas3TAOgMU4lgMU1tCk8/5X5SlWO4HlVtmKos90xVGfoSvwFw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=434Gv2pQIPbEzQDJqojPbgLIyUYQ7XMkeNERZjUXX5k=;
 b=jzfIdDErPtGtGWyJVsKaDz2rwiO62MDcGR6Zb1RdzGyBwwbdCTnFQZQ129qH6DZjOgqSl5WNHL8k07v59HsJG3OQHMlKI9y/OhaS4rxAGjqysge4lmV35Ohc4gK0IBWgu2h7Fmyzt72VNkyEOivmA8hnvEcZbDPzuAVYbi5ZE6/f80+PgV1BLOJJpnz5PFv4ysG96rwhDFs+Uur5z92fcaWGQ/rUDAjgDRLBys92LxKmtpBzlPnVw2iLJIx+J4kZLhEkNvlbHaeuQSqnMEsxVfRBhAPLk4O7SybG+QhuypNznbdVyPBgCCvjXQwXvIk4sqA1v9VuABzZeMHA1UDxVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM6PR12MB4516.namprd12.prod.outlook.com (2603:10b6:5:2ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.30; Thu, 14 Dec
 2023 07:51:03 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 07:51:03 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
Thread-Index: AQHaJoRsxU6mz5uOtESx1TgKL/L3BLCn2nkAgAB1mMmAACS8AIAAARrQ
Date: Thu, 14 Dec 2023 07:51:03 +0000
Message-ID: <CH2PR12MB5004DAEB064E623D3575D3A2F08CA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
 <20231213232854.5242117f@windsurf>
 <5EB6E748-BA27-414C-9AB0-434429B724BF@amd.com>
 <20231214084116.48e04ecf@windsurf>
In-Reply-To: <20231214084116.48e04ecf@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM6PR12MB4516:EE_
x-ms-office365-filtering-correlation-id: 93c47d19-88db-400a-a0a4-08dbfc796bb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AcefFb2NdcaR3kWF5VS/FGA3Ch1+5og2Zw9k+QCDPCDf94t57HKdHlAmHfiQK49b2DMhiDLVBo3GHVpt2kSWuAvOqIJQQhHrMOaduILXpkbGyS0s0Uju7sWbzN8KQ1o6pc6F11PrNT1to91iQpA3qgTmATTy9s4xWos/w5R2NrnXUZ2u5fzNCQVM8mzCVZ8V86MiVDNUL6EmD7kRppO+p3uleAX8s3r6uqWzO0LbH9cyoUAbiYklEUB3mnnx/6V9F/t33bjAcxjXm+V9w9zXUFj5DrYruPhq79ZPunjFPCCPYdeFrT9r6ZxeA6m2S2rJr+6bOPHTDavHuyt2kzboJoKk8DX8I1PesgOHdh5pEOzI9MoPZzDFXkRGB1iDMWwppkxFWMm8HcZjqOgerRvdHP/NqI3NtY6hZ87WFdeTGGCO734PNmkioN3yOtwo0MuYBmxnmKg/Q8nqpRFEdljh0Djt2YTt0b/9Wy2U2Nnpl5yPRgHkbVX/j3vGJhjUlwL0dfgh+KCLPQ5j2aFvmqPnHM+QRog9HUHF02sVvGI1rFBM0rrhts2+XJmb7gxM69bvQN+8EVClXAbHqOpjxL0NC9ZCIEfAHEDOZZMM4TG1twNvw3malVRsVBGxwaSvIGqj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(366004)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(316002)(8936002)(8676002)(52536014)(4326008)(38070700009)(38100700002)(122000001)(9686003)(7696005)(6506007)(41300700001)(2906002)(478600001)(71200400001)(66446008)(6916009)(66476007)(66556008)(64756008)(66946007)(54906003)(5660300002)(76116006)(83380400001)(86362001)(33656002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cj5cfZIHLTcyCEk0FcBxh5MhwqdCozYBXCs2HfTsnemQAyAU7Zbk97D6fPHZ?=
 =?us-ascii?Q?2tQC5rxVtep3/2thIqt9zLTVhSLge0FOL4h6uFLgUzWXbmFr2ePH6yDhnmmC?=
 =?us-ascii?Q?UtI8SAK7FurjCpWPK5gB5HfYX8AZrKqsoKz3V7YAqMjcmZwNNjBAIumSesef?=
 =?us-ascii?Q?QDePWmOKv5c2DXnfgA9dnq1iegOR4P1YNWiCzTgEDfInIgsVrlHIQl6T2oRb?=
 =?us-ascii?Q?w18pgESsefqXwjkkCOaLfWn+z7V8t3mAtCfdUQzHsv1Go+Xl/17BULOKuwTi?=
 =?us-ascii?Q?4D+3hRhQRq5zy2z7gLsYustwU69Eu142O/qbF2Gj1lU9AmsgIaKH2UjrbmpS?=
 =?us-ascii?Q?f8VnmjO65NXo+9MPVGgJhWgtx1aAQV7Rww+aCA7ZgQS2Krz93lmiZfaNPCmL?=
 =?us-ascii?Q?N21BehuHpocfBzuaZtM6USKstkqXemfRAhYQdHdeavFWt4lMz+ZDkh69ynTz?=
 =?us-ascii?Q?tR+u4hXM28VzEN6NoHqEasjklnzsJd2g9IUrzGdP6+g5Hb/zwdVVEZDI8k77?=
 =?us-ascii?Q?b4pBStVpnvjrpFCeHZEjfoJ+ajWVZjryLHn9rozzH5r+yRItEM9uV6DJ6t72?=
 =?us-ascii?Q?sr2qPrITb+EjhSvzZLMDbLTe7UnZDagzySs8Q6xvNZN/llUpYcJzjoxOJOlA?=
 =?us-ascii?Q?hrA7orVYV5ibxWXr5Bf0t0kXuVyj7b5X6b8HIqLO7hgNbH0wUrwlIZdy/690?=
 =?us-ascii?Q?9M1lJwXpBL49SvYGKrak1HXvQYUXB3OaZ1juOtfPUbkaldkd5NddUQrIDA4v?=
 =?us-ascii?Q?kCupt+naBcChzZ5jMVPjq6jwfynYr9qoa624VgVDUrjYXG32Jfus/Mg3yl4Z?=
 =?us-ascii?Q?pxZpWT0jn/ovcMd/cytiYSNWaycsVU3v7u0+Fa59EoFX1t7RzdRc0zP8ruip?=
 =?us-ascii?Q?gHSlCjk6U6IzJFQT/KOVTPA9VI5xXIeoUh4Mpm8d0qVVJZBX98RlhceY8avD?=
 =?us-ascii?Q?aomOanzLLwZ4xEUelRNiuA9PO3K6teXalPOcZty6/LJmQXF3Z+O89wJ1Z3dK?=
 =?us-ascii?Q?caDPBfa1oujaIUGhpuvjbZVbLOgSRqfEuDBnMPJ8Ic8cDC4o1dG2umRN5Rv3?=
 =?us-ascii?Q?2mQ7JPOV1iZgopv4SFbuFKHJbb2nXE5ZdEwmwIncNO6c7I3K6IF99BPnEtTx?=
 =?us-ascii?Q?N9Q0IyzGRgHW8DDvrkBNJxsLq3tNxTSHtJMD80k3yBnNzR4rKoIyujmZOHOO?=
 =?us-ascii?Q?wTrgBY7EWIArbMh5VpXKlVvbzbsczrJusyIdgQVBNHeSStFhkWyyJjQK1mOE?=
 =?us-ascii?Q?RdfVxDoLEfkNpNwIHfbkbUcS4DyNHw4WeS895LlI7m5+bCacRkSG8Nlb1Nug?=
 =?us-ascii?Q?N1hNarRY3WglpI35PQiHVKDxYWJYVg3XbAdoZJzRPmJldZ/r5pEsF4580KL8?=
 =?us-ascii?Q?wXTMcwpcJwta3W3/eHNH3YJvOIZPPQpWnWhfXaHuSiN3L9HfR4rTlLy2d+3r?=
 =?us-ascii?Q?HMJSlafNnkIrUe1rVeGZ8LcO2kAC7C+bKuA9KVvbWiqvTc8Xq9ZcoOIQ5Chh?=
 =?us-ascii?Q?zZ0PZyueP0e578ntsqz4nVJzlT+TfQIea48itpZSLehyDdSrlEApiEg7w+Yw?=
 =?us-ascii?Q?1EUemHgUpk5qv/jd7BsyBaJN/s+qND2A4PmBP0lfjRjULP7/Qalpy/UpLSan?=
 =?us-ascii?Q?dC/G7dPV2RFG4OEblmhmNMk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c47d19-88db-400a-a0a4-08dbfc796bb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 07:51:03.0997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gkWY/QCvOk7rbYKgOkp3Lc51R8G9v2W8Mh495O05rcKE/v2rR3+8gwoIJWaxk/Mc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4516
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=434Gv2pQIPbEzQDJqojPbgLIyUYQ7XMkeNERZjUXX5k=;
 b=yQcHpS9gBJveXa6iqBiJaQPVRp4eXQkW+k0KkRU6ThAnePNDZHIgJzhLzG3gHi4NL7Nyf2KcSk+ElK0n8AkocEz4wuvp7hfFgAT0eKjeijRKalNNHXtmfi0Y8hLFBri2igMirD7uzZ+5X0skQ9k2S3SOQ3sN+3sZDYpaN1JSZog=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yQcHpS9g
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
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

> Thank you for your research.  I had not looked into how to fix newlib, 
> so that it installs to the correct place to begin with.
> 
> From my side, I think patching newlib is clearly better because we can 
> try to upstream the patch to newlib.  Once upstream, no patch or fix 
> up hack will be needed anymore when we bump to a newer newlib version.
> 
> I will test this patch with your branch as well to verify that we can 
> remove my fix up post installation hack.  If this patch works, I 
> propose going with the patch.

> Well, the thing is that there is probably a reason why upstream does not install headers/libs in the standard location and decides to go with this custom tooldir thing. So I'm really not sure changing this will be upstreamable. Or perhaps by making it configurable, so that it can be overridden using a ./configure option?

> Thomas

Since we are not sure about this, I will go ahead and try to upstream the patch to the newlib community, and see what they say.

If there is a reason, perhaps they can help us with implementing a configurable solution, as you suggest.  In any case, I think working to upstream a proper solution is still better than my fixup solution.  I only implemented the fixup solution as it was quicker than spending many hours learning the newlib configure script.  Now that you have found the root of the problem, I think patching it upstream is the best option.

By the way, since the bare-metal toolchain no longer has a default architecture, all of the config files in patches 7 and 9 need the following line added:
BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"

Will I need to submit a v9 for this, or could you just add this config for me to each of the zynqmp and versal config files?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
