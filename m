Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9FEC00142
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 07:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 332A5414D6;
	Tue, 31 Oct 2023 07:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 332A5414D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7nyCeqDaICg; Tue, 31 Oct 2023 07:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E8F2414DB;
	Tue, 31 Oct 2023 07:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E8F2414DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD28D1BF25F
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 07:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95F51414D8
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 07:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95F51414D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eb8AH0nWwnsF for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 07:32:48 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85040414D6
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 07:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85040414D6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWqZMvSZuK/9xvEl7mfLdNI22tc3KaWOi/pyTBp0pgyFbmVBYPdK8wvuhv/vT8UlSQlBvXwCZFYLbhwTQVmiXXyyb1mt2LddPJ0eB7Ht7ZxgL8cqCVzyiYDq6hOwDJ9/d2UUo5rIhHBr1JUbqPDOa5ozmH0er0e91UjknCXfWlD+U16DaFWqq1t6xLqpFH87p1XIf2P756nqKcnPqlGInq5og1j1KkVZPl+d7WtDJ2dYWg2LMdLn7pONcSIAlu9ZKCgtyCEnHd2snmw4Pbx5HywQQuUTZJZ9wsri7KWDbywNo+Yo7dMiOKuo3T0TlVk9gbIEF5W782e7ZNpeRbTeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fH9Btx5nWl8LY3xWrVNgYGLUUdH2tP9HA5OdJ+HlCEs=;
 b=Egp1c6KXDYIAssLxt2tPAlUjf6qobIXDNbuMDiw6qP/Rbc/7oezTAPrJVoEXpX+puDmX3PETJCnci1oaRYVr3AY9IygrJuL4WZ6UGzrtpShNZQDm6tZ9KHcP1nCxGAT/5Z2cCClvujczjFhygWwZwZC74ecyiWyWvoycWEgvd8Kb1WBACUKJ4VbTwA/U7x6wnMWytSGlc6DaTATCXXJ5jEaGCjc/yq77aO8n9hROCZMACgHJ9imPQXWs6a2JIrAjsV+MsJYTITOkBx1/Vg1AwvW4jq7NnFqt5wHKW5g9s9Kzh4+bU1NEGq5xL80gFYJTCaQm+7a7AHvmUbSYwaxaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH0PR12MB5678.namprd12.prod.outlook.com (2603:10b6:510:14e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 07:32:44 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 07:32:44 +0000
To: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "peter@korsgaard.com" <peter@korsgaard.com>
Thread-Topic: [PATCH v6 01/10] package/binutils-bare-metal: new package
Thread-Index: AQHaA0qRbywoKgTFjUeOg7I3CT54X7BcRkSAgAdK4yA=
Date: Tue, 31 Oct 2023 07:32:43 +0000
Message-ID: <CH2PR12MB5004ED4CDCF062DA410D5397F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231026180649.66bdde4b@booty>
In-Reply-To: <20231026180649.66bdde4b@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH0PR12MB5678:EE_
x-ms-office365-filtering-correlation-id: e5d72b47-3ba7-4afe-fe21-08dbd9e39259
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8iUkzBMWc+8dduQZCwmeEia3j87sfNCqGGBDvuQ3XSs07Xpls2q51jtK6JmGz9DGKPIzncliTxEx4zgDm5qtKjG38Ql+QVtCcyiyT6tj85CpdZsMAsDy8c+OA/MgF1Sj15wqHJtCrxgW1UQf8j0l8PIr8bA/a4MtAI1x5F5MI+ZZhkKcT5KzFalQ1duIL+5e7sW/hcEZQXzQD5FjRmtcH69ERQfIik3XhJ3BEJg6duG9woEtGA6L73CViHT7tDVTNN3521t1kmLojnpiuF2PPw7ou/eOqSNdvfNcPgEF/tfkcZnuGD5OjKC+eEyCbuWi1Hy3z2BLDboaApiQDcQe44NZrJD8wccFgJh0B597aGy881BXlayq+OA0UtfdwRHQpM9POsq0vVpqxLKD4RGP/dlDl6BPT3IsjJl+/gfz8kikaU3Wt54yqn2cp0lPhAOxHZZ9VDsRpSuQC67KqwFDn4YLKWQSCEuH3SQFVV8xYRbv76ey/7k5ObqwKCfAT/TjVEK6nDdMUoTMkvwYja77qIwPGi/kWm2U4ziEJs8SAXpHuiA7Tmfp+hY0TBJJSvzVvUUyS+DGP0s0wxkz1w5ASlnGdzNbbIu58iSNphGWXWY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(66556008)(86362001)(122000001)(33656002)(38070700009)(55016003)(71200400001)(966005)(478600001)(9686003)(41300700001)(8676002)(8936002)(52536014)(4326008)(6506007)(7696005)(2906002)(5660300002)(83380400001)(76116006)(64756008)(54906003)(66476007)(66446008)(110136005)(66946007)(316002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fl1/QU2ffNjmYsoXh9UEskORi5/B+xYUVGKlAuNhUhNhhS/06t/X9/4p0GV8?=
 =?us-ascii?Q?z7TcFbZupGC1LemDjtCx3VBXFYNPAV9PkiW0MkZzM+9mmLZFU21yY94RJp86?=
 =?us-ascii?Q?/qgRfk9yi6dC/uYfwnZfFuBk6iyxO4bOpIRglncqEnM+DtspARcC/SuseFQJ?=
 =?us-ascii?Q?LdSlVY49EPmzqmkjdDtO4lAP/RhOqWkm084gEsQyAwnIAr7LFdNR+MBItP09?=
 =?us-ascii?Q?iw+62Kd10uj2Q/FlvTW6Uu/kj3UlUsxmTn1j9y8nKoQ4rop8SzP16JQbvL/m?=
 =?us-ascii?Q?pWzm9LR+UaYNWKuc7j02+/9K9Gb0xs+P8fPgl+Wm+9OtRhBvBz8VookAIHfH?=
 =?us-ascii?Q?rnOsCDK/z6RDj5RZ1vHS7sgLjQx3WB+Rsq2IM1aSUWK8Z7vR+LQUcfR4SvOW?=
 =?us-ascii?Q?NAZeVhXsiOscEOxRZ/Zr9L/zrXNXKb6jXOHlaaY22eLwN+3clukM3hpahoaV?=
 =?us-ascii?Q?p9q+LagTmS9dVR9f59ViVLpI0E10u2Y4wPypm8G+w2Ptn9pBVSYLwy7bUxml?=
 =?us-ascii?Q?MA3WDpADeslXVQqsQYUfM2JWiXbQ+vI1UKPZd8ragoGmjQQM+3y6iL5GgYWu?=
 =?us-ascii?Q?m/vjrydppe4b2Le0zm5KyDGUJ+Bg2e54UFYYbmNkyajhW9yssC9JR6TgYtlM?=
 =?us-ascii?Q?tibwcRBJ7pMcEAW+M6DCOIjNdmnZqA9vtCyDZqNiW+qGQQQMB0BnbbQSW4KA?=
 =?us-ascii?Q?Xc7g/SckfPEPTX3nVtwtkFiQQnwAYNf/+LWoSKlqZgs1WOmh/sbeNWXLVaOk?=
 =?us-ascii?Q?ejxGYj3R+VN+bijmpUVgCK6R5Nsfp4WFvnxh2ipO/baF0Tj+kwqT9dUpq1Md?=
 =?us-ascii?Q?qMX1mSbtE6QUDUiwJ7e1+sFESCnY1V9zJnyUxkAaawUjtVhtBSpJjmmGDrnb?=
 =?us-ascii?Q?U4t1DrOG3wGfpWRYyd9C6lg4YoqC4VFeLyR3odZKjRHVO4GbUJLMEjM0SkbB?=
 =?us-ascii?Q?gjSnpYDXw07D4Qr5sjodE/6WqcZPb0vnAsCBtMi6ZGYIiPDELU6d5ZR/GvyA?=
 =?us-ascii?Q?WO0ACKA4gLEV59/JQfyN6IiOxpsV8IOJNx/2GRv45QlcgY0hKDSWu5+y+BK3?=
 =?us-ascii?Q?JB5RXDB7iiKtUfnInDwV0s+u8Di2GZEiThWAh2V9WfpyVujWvrpo7Pdj7i0p?=
 =?us-ascii?Q?U0eEyHWnWD3YD/TrynthlXEgzxzqxQq7EXh4tKF10asn7jjvzdxCYiCzbZc/?=
 =?us-ascii?Q?gyjREcCfUzSHeNO6WUUkDceilMUe6sonRgUX1xE+9ax8Jr3k/6w0R7pwl6vB?=
 =?us-ascii?Q?pbWa7/DqOvuhUtOpiTEAUtSMQrp5QbTi9t8y8B5TQ2GAmS++U+vUeu8TIbLg?=
 =?us-ascii?Q?m6gUQD/GPwXgplNqnwVQrhEjdPKxv5qDVvGQ4vfbvGhyNxHqKN+muE5cbFy/?=
 =?us-ascii?Q?5tqBYQMRI8Ol1H4VAEtDRbMjSY9pIlCHFDv/kKGkCGYuMpNwh6ic1xmL3e9W?=
 =?us-ascii?Q?+PP3o/1kAzndeqo3UDr0GDXAUNJoA1bnXTsxdi5+bKhtQ9niz4OHzX6wl3c9?=
 =?us-ascii?Q?6zPhiZAx+Bc4bV/tIZJUER8t56YiDQJhibRYOmkm906sIABr67kXrNFD9muk?=
 =?us-ascii?Q?cU/EtzPRGq5WnACjB4ZbKbHBS9K4QTu7ZKIBvIK0C/6JMRNs0FrvrratwLOP?=
 =?us-ascii?Q?4O5tAacouK/FXXh0pRlJo/k=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d72b47-3ba7-4afe-fe21-08dbd9e39259
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 07:32:43.8686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rSIMN4tKVgHogCsL31kM/rRgxYSyHvqQoH9EIWpXVRyhYIXd72Gbv8fWvzXa5vAd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5678
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fH9Btx5nWl8LY3xWrVNgYGLUUdH2tP9HA5OdJ+HlCEs=;
 b=pYS8ZSL0y00ohb80xlGgtQiuOy0htZhX2qXGpQnz05x+qYblXWlwNaMeRkqi5pchG6fa8rwcZkcQ8/2v0yPmQtxgn4SfntLySYtFtndQthBwUE51VxLNhJdgJNOHAgrWolRRVOgv6190KrRqNnJk1UbNI5EbiNZyx2hPgUladcA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pYS8ZSL0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 01/10] package/binutils-bare-metal: new
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek, Michal" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Peter,

> This patch adds a new package for building binutils for a bare-metal toolchain.
> The cpu architecture is defined by a toolchain-bare-metal virtual package.
> While any cpu architecture could be used, the default configuration 
> will be a Xilinx microblaze little endian architecture, so that 
> buildroot will be able to build the microblaze firmware applications for zynqmp and versal.
> 
> In order to build the zynqmp pmufw and versal plm applications without 
> error, binutils version 2.41 or higher is required with the following 
> patches.  All six of these patches have been submitted upstream with 
> five of them already applied.

> [Tested on Kria KV260 starter kit]
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

As you can see, Luca has tested and validated the patch set on the AMD Kria KV260 Starter Kit.

Do you have any feedback regarding the patch set?

If the only concern is build time, I would be ok with making two sets of zynqmp defconfigs.  One that builds the pmufw from source for each board, and the other which downloads a pre-built pmufw.  Then users can easily choose which they prefer.

What are your thoughts?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
