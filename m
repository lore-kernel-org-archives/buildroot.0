Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE783C77B75
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 04:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FB51408BB;
	Tue, 16 May 2023 04:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FB51408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCA6geaJXLtx; Tue, 16 May 2023 04:28:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D41AC40620;
	Tue, 16 May 2023 04:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D41AC40620
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 872911BF29F
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 04:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B1694088D
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 04:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B1694088D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WItdusBJWiaR for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 04:28:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9AB74086D
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9AB74086D
 for <buildroot@buildroot.org>; Tue, 16 May 2023 04:28:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TT10kiqyNsYGFuDrCuo6TrSlbbrS0gjcq2oC27QuUjyhEFU5qhvU7Bgfmfvxrn9DmgGVgSej2hF4IOJpsV9LxIYCrD9pzpobyKbbJmlh9fw4J2FHgMc7N9Cc+XhX3JpQBXYw+4wqaqJTixLAp24TbcyrOjykjygNByCoOlOL2rOH2GkwVoHEovuumqse8OCikurEvBhcR7H4KHnPYzPw33bUe9FbFhVt3Cl0IAr1t26NFf0o0swPpkOmgW/o8OCduG1i/R0MGcH9MZZ8qP3/GvtaKwGyhSWwlFjAxRob0T4DrSfhAAy/ovcS+OsQ+RtTPsM0F/pEEO9szXAIDxbsPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0M7SnwqH2ZDKexETewgXsm9q1JXTLB3pRznA4/wxqLU=;
 b=ABKQmAUW2z/LDGOzDADj5xkyvuJlMAl/au+tXgTmGgpVyqIcdqIAELX3s66rvaLoTMbswHFYxuejx8WdtSGeLMTxc7Ue/YuJeyE64nrfUwf1RmUveBfeI9fVTIdHqaT96iEdt2YZZvsyXmXVnpiFt3tRunK01su7w4HJ1TrRfmybmvV0URT4XJWWBo8zvxnci504P/8Pa3nF9yRtKnzZpZp0ASaW4Ek1JrrOeBtQEUaAKsdSvMDYVdKIAHCSwLjg396nvIvgNvpenKWjdDnXXgwK9Jj+IjRRRUemn/vX08ugXk2ZSzr3BrtQRjDY3CpsGDP0CoofdE6ueZ7ZKyqLiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH0PR12MB5171.namprd12.prod.outlook.com (2603:10b6:610:ba::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 04:28:27 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e72c:bce2:5835:cef4]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e72c:bce2:5835:cef4%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 04:28:27 +0000
To: Baruch Siach <baruch@tkos.co.il>
Thread-Topic: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2023.1
Thread-Index: AQHZh60TlWQQKtbpx0ORQrTTmw16oa9cTCcAgAABYNA=
Date: Tue, 16 May 2023 04:28:27 +0000
Message-ID: <CH2PR12MB500456E38569EEEB2AC632C2F0799@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230516041533.22408-1-neal.frager@amd.com>
 <878rdoc3ec.fsf@tarshish>
In-Reply-To: <878rdoc3ec.fsf@tarshish>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH0PR12MB5171:EE_
x-ms-office365-filtering-correlation-id: cb59fd47-d1af-453d-9ed2-08db55c5fec5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nr1xrSZMRRJJ3AubwOAFbjbRW50yH7IWGF5l9uZwWFVn15sq0nDhDJgLjbk2WYTy3dyCtw8g9BztjkRvgNCXzO3h0nlYiOfKv8toNFXQHh5xyjP1uqd8d/XIvjVCTZJ+fQ+CMv0TGSlCiuZWTjKrAYZQrpLxH0yFpZ1z8kmM4weh/vZejCc2C9aOLfsU3E/ZJADxAKUWscSPxiK28JX1o7fNt7edbNqTYnPeD1a2Rbxlt1iPoN6e5TnhnG6x/m0jAtFnb3lMtiHjwAvX8bqcn2cGkX2LymN42NPKCbuZAydn0Q+fEAU2or0EtF7Y08K4MKnxhfKWRzzhju7cNejTiHt+dNIzgSNtovaqHuCep5FIcqkYARuoG4vTceiHvK4nemS3QbYxYm7b+tW3MFczjjbq9ExksGADxwo7ImW19kGR/PKklsU8zftaPF1s12drvjwfu2YhgoN0HO+kR8n/C4t7dmWXYXcOoI6m7yWW5VeL0npZM2uHcHYAlIL/e/uI7Lkbrgg6M1hB7QtvLKeK3qzx7JiG+/z/AjXJYPZUUfrmx+27vc0iyQygNSXjcxQ+uDN0U97/bCMrBCSgb5b4SWeM05WzuWAsVCb/UM0tg0G9iVC5agq7GSEZvjV1rYYh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(66476007)(66446008)(64756008)(6916009)(4326008)(66556008)(91956017)(478600001)(76116006)(66946007)(54906003)(6506007)(9686003)(186003)(38070700005)(38100700002)(83380400001)(55016003)(8936002)(8676002)(2906002)(71200400001)(7696005)(316002)(122000001)(41300700001)(86362001)(33656002)(5660300002)(52536014)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?upRvBkPJKJsYfRt3kDRuCgWse2EBDDfe8MzqPk1vO0onSGKg+39smafS61?=
 =?iso-8859-1?Q?Vm5gARqn8iL6m5ysw5JQIDAH6hHMlr3aTyQ9u4BgEp7N5Dz78jsMfisdtY?=
 =?iso-8859-1?Q?pm4/8CYZaIsyJm1LjZBhK6mzGvtn8Wr4NJUAvWAmRFrQPSq46bI6374iXZ?=
 =?iso-8859-1?Q?SnHFr25ll2e09KNazmWqalcYA+qGOBUAuFpjCNNUKSQJLRIramG0GdwBvY?=
 =?iso-8859-1?Q?iOapq1HRvje+/vPDlSI92NwJw54iKrtdYMLbEweHMOGoBJUN06vKDxNGNE?=
 =?iso-8859-1?Q?jNW0PKfV0ZBJ08TTXuI/aBSLFrhhy2DwHOsBEuyc1HHIwwQSTjvmSB86Ic?=
 =?iso-8859-1?Q?VhlHZg9vHXqXrvg1mPPVqW3hGSXTmy2BgFx2+qBPd0u4JzY3ikyOGYYHc3?=
 =?iso-8859-1?Q?MtK6FwD4lP1kCksV5SjtCf8CRVYvxwtehDgi00D12/EC2fuH4pwWZuWmGw?=
 =?iso-8859-1?Q?iBBJW+TR2Q6/Jr2Cyins5lr5SxAapbvzmSFnxGUEhZAPBu9ByEi096OChh?=
 =?iso-8859-1?Q?E+dILFyawC5aV8v4i5X8JqV7Ekmq7YP/BDX1x0nu/ajAtYIRC1zPr+3KZL?=
 =?iso-8859-1?Q?DBFoXqfLI+82YFqaNK/si23jueib+TajCLe2ltp0U9X3H2CRiTmR6c8LXc?=
 =?iso-8859-1?Q?52Xaqwx9/VaeKKP3Bwiw2obLqsn+x5zYuCxYp6n9ghxMlvwQTyO5OTXUY1?=
 =?iso-8859-1?Q?KmHZZxQWSrI25zraGadhRqdgK4QDgKkjgnlI3hqpjWp1Yv7oXHaaBk4Km9?=
 =?iso-8859-1?Q?tleeNmxfbFNeNslXNDrntYgJNZfsRFklShWEie2UHlsVsSoF7Ov+M5XiVM?=
 =?iso-8859-1?Q?0L/t2+ZKYe0c78N/WQOUP/uiOVi0Q/UHWtqmedAe9BFivM1Vh4cEC5BMiE?=
 =?iso-8859-1?Q?9Dj4dgmFSCgRULTx157L6HGuLMjW1rVUMjCCRn+IilTugUbVHOCBzpJ8su?=
 =?iso-8859-1?Q?pB2GNrxjW3yXP8ENLv3INhl4yfuyRPoDGYxQK7ynbDX5YdMcsVmJaUKiaG?=
 =?iso-8859-1?Q?Q6ioHBiGNg8wO+gSMUkaoEDP6uI544PIuB9ifRKu5ls9/+i5Y8BMmT+PA8?=
 =?iso-8859-1?Q?Vl2l5Cc5cJK8LfC/VTUjrw6Ett5hS8vjpM4mn+pwYh4y9iQ48Nvc00LQsG?=
 =?iso-8859-1?Q?q5+aS7RLnUItmCaOsbksKjhqYro8xgGkK7g55Y3s/+9RM1YewQeHMkN2Bj?=
 =?iso-8859-1?Q?x9Dnjh1s4R82QKHGJeS0ErOM9G0dqWZkwAs9q4A/UdojyqBCM6jEu5FSdA?=
 =?iso-8859-1?Q?HKfsbO+xJpk45Oqe/EtzC4a1UQ+hTXStovC5yS32fXKCK6RnOZFBt5m1kC?=
 =?iso-8859-1?Q?Hz7IrUBtUg8SUjQRbzS4+35PTwxK9RaYOGGWpfpGWsjnOywgsqokd7ZxLD?=
 =?iso-8859-1?Q?FK1QuNhpWkcvpLxF2qokpSXEJNpaYNFTA8Y8oM0WnEEzpWDN60w82dEiOt?=
 =?iso-8859-1?Q?evZ2WYgCR9JEaDPsutNRUtL7/rnV0KRcR/081/J5XcqZf8zmrlDp/0nyh1?=
 =?iso-8859-1?Q?tyNIm9tjdWIPO30YYy8dUgxmZzKxNndn1QPdLmvs7eE6sSEbEb4Fm0G6kj?=
 =?iso-8859-1?Q?g+zODZcKOZ+5lYRabiIXjMTWeBU2+roIVqn4/Guh0hIK1GmM1DyYd8NDrA?=
 =?iso-8859-1?Q?h0wpu04OFZlwg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb59fd47-d1af-453d-9ed2-08db55c5fec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 04:28:27.3970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/khdWsu2PyUlu3yvsHKNShiv6WuzpAua7H6EBmb+vVdfAiMQze4NLLdjtKjPQQw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5171
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0M7SnwqH2ZDKexETewgXsm9q1JXTLB3pRznA4/wxqLU=;
 b=M0oVFc3Kcf4JrVnCThThCcxSTdHwIfUZOrxUXFaxOOF21yha84VCYoyawo6Kdzcxj7G9NwUGjzmW4Lb/JKDcPAMeKfnhMuIdDFmzBjjXgV+k2wTZgdAlD9NKFsMDm2esCLodK/hpm4ZsfYXEXJ4w+KykGlWTvVVaTKWzlRC9I7A=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=M0oVFc3K
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2023.1
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

> Hi Neal,

> This patch bumps bootgen to version xilinx_v2023.1.
> The patch for build machines with modern flex is no longer needed.

> This patch does not remove
> 0001-Fix-build-on-machines-with-modern-flex.patch.

> baruch

Thanks.  My git add command did not pick up the file remove.

Unfortunately, I did not catch it before the email send...

I am fixing this with v2.

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>=A0 package/bootgen/bootgen.hash | 2 +-
>=A0 package/bootgen/bootgen.mk=A0=A0 | 2 +-
>=A0 2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
> index 5d77c164f3..937509c859 100644
> --- a/package/bootgen/bootgen.hash
> +++ b/package/bootgen/bootgen.hash
> @@ -1,3 +1,3 @@
>=A0 # Locally calculated
> -sha256=A0 7e07c75aa3e3965c8e33faefde037877f78130451cebc2056b096db9c66acb=
b3=A0 bootgen-xilinx_v2022.2.tar.gz
> +sha256=A0 2fda35fac28f5753cfdd9c6d5c07fd2b018d55984681af79415a67ba5372ea=
8e=A0 bootgen-xilinx_v2023.1.tar.gz
>=A0 sha256=A0 4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a5=
9aa3=A0 LICENSE
> diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
> index 88bc73b604..d83980d925 100644
> --- a/package/bootgen/bootgen.mk
> +++ b/package/bootgen/bootgen.mk
> @@ -4,7 +4,7 @@
>=A0 #
>=A0 ######################################################################=
##########
>=A0 =

> -BOOTGEN_VERSION =3D xilinx_v2022.2
> +BOOTGEN_VERSION =3D xilinx_v2023.1
>=A0 BOOTGEN_SITE =3D $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
>=A0 HOST_BOOTGEN_DEPENDENCIES =3D host-openssl host-pkgconf
>=A0 BOOTGEN_LICENSE =3D Apache-2.0

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
