Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C712BC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 09:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5401C60C28;
	Mon, 12 Dec 2022 09:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5401C60C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VeKeqLAGCaHN; Mon, 12 Dec 2022 09:43:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7349160C24;
	Mon, 12 Dec 2022 09:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7349160C24
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A58EA1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E2424045C
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 09:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E2424045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJZ8fv3whDOS for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 09:43:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 203B6400F2
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 203B6400F2
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:43:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0l/y1WIXE2CgBIhanX0aHKYMcc5eZIowRXO6WQK0lh/gIVIRDGjCIHubf3wGcPLROljd5O2uMia0hepsDl67jZHGEaRiWjbGMARPr4ug6SUhqkg5kJMYe6ORXUZs1uYxN9xf21vTsFX+ie4TTGaVqqqd1u4p+kzDIw1q7RcPJKJB8F0/5VoThHH90F8eDhdBHCxSqtAOY+AJsVXdJmHPP9gzj1/ywwpsw/IoOaq4EWn/ToOAgrRYgGTTBmsJDcEw2vN4JuzWSkDQ+bQasjOAgFoPMEtp3MWTzpjMyrmc+JaBJHaK+aQXP3Tdnp6/IbNIF4sqE8OqqSecPy4hzetwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5FkORe35b2uXo2+f2voloh1wHu37fVNxhc5khngJe0=;
 b=P9nJnZjjDIMlqBMOyLsQQBYQpZHGIIrHtHbWwh/hOY9PIE2jFjNULtgr0EDKikkl5QF+OPeszbGYGTXxCOs3I5ypNAqPJ4sTW1a2pVhqF4PVCvPEjjQf6rbZ49bRpvuF+3VunV+fkR+f5PeWXGMVPdK88xbjWsBSF1VDB96+OeNybdVJAB5lz995kdPo3SnzMpsckQRuTdvGkWicA+B2w0oRNEMpsKDdt74vQr0KENQEJeMskp78vp7w6rnWniMvpMbH491w4npU16/uElsLHvvRG+vzhMC8OBVdfabJxyxzp1FJIlbzW+mnztc27UPJelGre7X/OQMxZTa9nsnZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ0PR12MB7083.namprd12.prod.outlook.com (2603:10b6:a03:4ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 09:43:32 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 09:43:32 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH 1/1] boot/uboot/uboot.mk: support binary pm_cfg_obj
Thread-Index: AQHZDAYolIx6yte4nUeeBVq6Bchk4K5m3+1AgAMiEgCAAAFToA==
Date: Mon, 12 Dec 2022 09:43:32 +0000
Message-ID: <CH2PR12MB5004862F9543AC5E6141E8B7F0E29@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221209194043.28673-1-brandon.maier@collins.com>
 <CH2PR12MB500455907F9D4CB0D5CFAA90F01F9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20221212103508.7855148f@booty>
In-Reply-To: <20221212103508.7855148f@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ0PR12MB7083:EE_
x-ms-office365-filtering-correlation-id: 8d670d33-c85e-4ebc-8514-08dadc255515
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oKkVVlunp2TfDegWsV6MEoarjujd6KdQyoUGCmdrpZvz3n9a57n83qM/wU3QjjHnLO3mciZO9lf6o5i3jFqTriLVYSlEbepFXcuFafGtYhLPo0k60yc46A/tpIOgQd58ijJCFd8KYor/Rlu6buUMlk8YgRRQNofbuJTkqBhVPgWOWJY9kvrGDkZRFvzdeiNdL/uuOmdZ0+8hGuO4E/iwyf9rVYtftHbMeuwyeJzlgfjyCT8OvoAnqvVeaE0lBPqk5WIUB94hL58PVNov2JOHWJt1jT31bf7YOVOpKLTOuTklheiGKiMOMh/Y8nBCTaQOk03HqtZM6SuwCVJABljXIr98QfImtcdyKBejlX1iOiZeGqYjQ+1NselW4iNEiGy01B1v5Pa5PZObERbL3vejG9yiCGCXnBKV1qed58iV9ml2OAEVMs+64T+5P+UNpkXeO1N4Cvy9WLom8l/xh5TVxAdXTtkDdenqjHkSSl2aqowXCH9cvZkM2ErS9HndnS5fC+MIRVsc+qLkAfkJ1/ujrecBWVfmOT4ae90lf1pjjdBAT0EwZt+Ick5kLR39adfw7116MQQBmVguzQTurJbmlXzggNWxuuBR6Ej4IBylQVzZEx577oCFLdXn2lI5CMk49M5ul3W6cLHP7mBGF2QfL8ehRnO9vBIoCej+gFpXpL5uQm8Gse7yKXjFF/wjTN4SIFyoxJpAqq2sHjuskfspVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199015)(38100700002)(478600001)(7696005)(6506007)(83380400001)(8936002)(41300700001)(186003)(66946007)(4326008)(64756008)(86362001)(66446008)(8676002)(66556008)(66476007)(9686003)(71200400001)(38070700005)(52536014)(76116006)(5660300002)(33656002)(6916009)(316002)(55016003)(122000001)(2906002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tf1I+NPrRHzWpKrwB2NapoJmDwHNL0zEUyZnORNSbsfpNB/skBsYLs32dg85?=
 =?us-ascii?Q?kiS8ggFbxe/7mhkNoj+HfR1DMAFhEl9v2YZLX4lvoR2GUP9KhrgjqJDIJQQx?=
 =?us-ascii?Q?A23mYhvriIr8Fo6/nU2cxWX4pj8rgJ8xNcVzOFry0TtUmmqUzdbTtA9REYXu?=
 =?us-ascii?Q?84McafLckHI0M7aCRty8y3oEJVPKgmBMJ89TuyTvRYRx2JG2aedLwpFL/tBb?=
 =?us-ascii?Q?1CuIP2xAaT1cpg1FljkDoXaG6emNgmgmlam/baMvZTFW6kINwfc8atfSjMZD?=
 =?us-ascii?Q?5gw7t/RPkfh8VnT94ewgs4cf+4qhmeUtM50YzC8ZGTSUKRGFuCj+mJl5IS9v?=
 =?us-ascii?Q?nonDQNERNXAWIPmNK7EaDARVqxHPqu0vJzcEKxbC5s2iWvNasNQ5yLmlUts+?=
 =?us-ascii?Q?O1cwpXjAEzSCu14Vzq44wEwQeYCcW0jpsCsFCVmFZtGg6/73lE6syLim2Hzi?=
 =?us-ascii?Q?gfVy92QqZiiAHotj00TIv50bf1clRBBwuR3VJycQ70mxtg/INmdX0bVty2ZI?=
 =?us-ascii?Q?K4yYNqZqRr9dQuU8mws/8KWUCrrslSPQpqYnGtLHswsRR0JEfQzlF3n9BB6t?=
 =?us-ascii?Q?hnDnH1SLOq+lMaRokJpJ9J3wNeoXB6cjz6F5U0KOPuMQxdED40s9NRtclXXv?=
 =?us-ascii?Q?fryhBH9TAxEuLhNPzhn1vvkx25+OH7VvTtI+QFKfdhWUGCRNVC8ktWQr47qx?=
 =?us-ascii?Q?VpzuFfI2KHuHtMB9gD2fCo2gSzFzNFtEesuNnKwnxim1Svwll5JslUsAobFW?=
 =?us-ascii?Q?VNA4zld63tg51DkVl69QTYWpPrFGCzm8gJ2ebMaQxCZABOpQrABjnv/f5/B1?=
 =?us-ascii?Q?ETBi8GLiLaMHiDTr5soSDUdr2ccmjOeeQ/IdoN/PJC9LruvR9lybd34OYQOf?=
 =?us-ascii?Q?+kRgbc0tUM1DDzBr6ofGeua7UfN+/VI/UkziaGSUQ0NpLLNBEYg45oouQhkz?=
 =?us-ascii?Q?MmW63MjI6rvlpj/wUkBpGl6jd2GU5F6CBTLIYxqmW0eLwmhZY+zjNrZ12vbm?=
 =?us-ascii?Q?ei4H/s4QB2n4TFX/bs1aa2K/n/N5qEb7Mxqt5LGMOgCGi7dQL6KuoQrYObXA?=
 =?us-ascii?Q?UNfF8JSkLCKdccOSIEufel/ey+Fd5r7u3T9shAkYldLQRIpiZa7W8eu6opsP?=
 =?us-ascii?Q?sbA2BjreYFuQ1+ZpR9uvr1095lzB4LBnvlfolWxT+c5wl6KgCn3pVsvlm5Wn?=
 =?us-ascii?Q?GwOlDQi5w8pNYVMb4Zavt2ZPt5Da0Yj0QHote4ZbYIuKpts0S4vVDiYxnlw8?=
 =?us-ascii?Q?VUruRaltqtdEPE3nsaLPf85QPBDjPIbR5vBL3xDx2laNHgRGZVqcVr0yu9yj?=
 =?us-ascii?Q?Grl2kBG64w5JsHRZbhz7OBDN21Tfp6vReTbxrXtd5ZkErwsiyft6lew7iPHi?=
 =?us-ascii?Q?xZB91dPD1OsxYAueUSx9tfLGdh2lwDq4voBAocIRqNTkuGlKoapreYknf7ho?=
 =?us-ascii?Q?2igmWpWANo+xTTljlIXTliXu+iljEaxXo6wT7IMTte5hGlU02JTjlqWor17r?=
 =?us-ascii?Q?y5V6E51f8gzOcIw/Z32CMTiPMx1GUSes1hGU8Wj/53CoCGM6xE916T841TEW?=
 =?us-ascii?Q?pu4zq4ivM1IwyIyqGjsax0IsXhc88nY8vGe08DP6Hw0NrAlE+TWiSRwwrPW1?=
 =?us-ascii?Q?dXwbYI6uxkGtvrr89RDifu4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d670d33-c85e-4ebc-8514-08dadc255515
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 09:43:32.5564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zmBpJ6KGvK8yownMJhqNHS35WIeTBMir6UqmhNx+mZJPMHOx7SbaknD34hYHwd96
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7083
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5FkORe35b2uXo2+f2voloh1wHu37fVNxhc5khngJe0=;
 b=4D5YsnAm3m2YoJS9DKGgiyIDWC1PZXnxm5gTh2siTDwFbeHyQN/INhDedikx1K5ddYIaGjQqWM98RE9CrDcJPezZpRj8i1kHi0WnaIJ+uZk5z1e1fHJ8q4PwmVL4H6aOEeSG36e5jp6Z+JYy7GPWaqvgJm96uJ0tlqHzlSuh1pQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4D5YsnAm
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot/uboot.mk: support binary
 pm_cfg_obj
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> Hi Brandon,
> 
> > BR2_TARGET_UBOOT_ZYNQMP_PM_CFG only works with C files, as it always tries to process them through tools/zynqmp_pm_cfg_obj_convert.py. Rework the logic so if the pm_cfg_obj isn't a C file, it is provided directly to U-Boot.  
> 
> Good idea to add this support.  It is true that since developers 
> cannot build the pmufw with buildroot, it makes sense that they may also build the pm_cfg_obj.bin binary outside of buildroot as well.
> 
> 
> > +	$(if $(filter %.c,$(UBOOT_ZYNQMP_PM_CFG_PATH)),
> > +		$(UBOOT_DIR)/tools/zynqmp_pm_cfg_obj_convert.py $(UBOOT_ZYNQMP_PM_CFG_BASENAME).c $(UBOOT_ZYNQMP_PM_CFG_BASENAME).bin
> > +		$(call KCONFIG_SET_OPT,CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE,"$(UBOOT_ZYNQMP_PM_CFG_BASENAME).bin"),
> > +		$(call 
> > +KCONFIG_SET_OPT,CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE,"$(UBOOT_ZYNQMP_P
> > +M_CFG_PATH)"))
> >  endef
> 
> Just a question to the community.  Should we handle the error when a 
> user configures the BR2_TARGET_UBOOT_ZYNQMP_PM_CFG to be a file that is not a c file nor a binary file?  With the above if statement, the file would get fed directly into u-boot and the build process will succeed.
> However, the user will get a run-time error at boot time when the spl attempts to load an invalid pmu configuration blob.
> 
> In the previous version, when we only accepted c files, the 
> zynqmp_pm_cfg_obj_convert.py would error out causing a build failure if the input file was not an expected pm_cfg_obj.c file.
> 
> So the question is which is better.  If the user configures an invalid file format, should there be a build failure or a run-time boot failure?

> How would you detect which binary is "valid"? It's a pretty fuzzy definition.

> We definitely don't check the validity of other binaries the user wants to use (the pmufw to name one), which makes sense as Buildroot users need to understand what they are doing after all.

Very good points.  We cannot verify the validity of a pm_cfg_obj.bin from the file extension.  Plus, if the pmufw itself is invalid, we will also fail at run-time, since we cannot verify it.

I believe you have convinced me that if a user passes an invalid pm_cfg_obj, it should fail at run-time, so no reason to try to verify the validity of a binary built outside buildroot.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
