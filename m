Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D82E80A96
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 06:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F9BB822B0;
	Wed, 27 Sep 2023 06:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F9BB822B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIOW9b0rZUvP; Wed, 27 Sep 2023 06:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAC408229C;
	Wed, 27 Sep 2023 06:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAC408229C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89B631BF855
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 06:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4949E8229C
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 06:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4949E8229C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mG4Cmb3QA5C for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 06:26:50 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::618])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21C488229B
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 06:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21C488229B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hV8bVv+xMKgEyNasOwxaZ6j9vLkMtFQF4cQM7kvQSyX+FNz9aUFwSUmzWDmYglaoCKafHojsc2tfNk71Ug4RkGOe7EM3rtVP80pUXSLdtTIeeK+/BfOoR6D9uxXDNv4jEz3UbBHZ0RwjveQr7dIqqLE5hA9vI3ZHMYKe8cRKBfAhWQ5EpOgQckbo7zoA1r7d2nUbNZUqgeNB0qx/LwNDpyXvFgnXOxtxoIkSe3T64tKNySYRBP+6Tmwj/fE/X3zIR4mDZvPcWjFRjhzMaSE+JlKa1z1NW2X8rQZ8a/vkfrVz/wq8S/ZlGhPNX3MFJWFsjiAqpja3KLktNYbVHyUCuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFqNGRD5hTZRCaZeyAJDl2F/vFs/m/+UTrYMX6Aq4kw=;
 b=H5eTMxr2I82KeV6u+UCGfRLKdRip9AAs49mWqPEK/QU2Qteb5/ODwBawC+L9Fzr93LaMlMTv276vstX8jmQVjh6SSiazwUYgDDoKpIZGe0/lfH3qffWkkCUyDwukgku/1UHbtevv+LRC3yzDBf1nV2hpHdH4IiMggUw34RKck1bnEKyZJIVpkn0u4w1vfCOJ+0Hk5/hP9pR+wkTmiRQ8el5CCcFX3xLfctcexSMP0PLPfU8QPk78G+mmGAeJodYPhKFyySxzTbl6nDVwEu/eDQGOwy6EvMHJwXva2w1IGWMerQI9HGkxifj3AQeG9fBpMBjZ5Wc8w7dUq9q2wbHHCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.32; Wed, 27 Sep
 2023 06:26:45 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20%2]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 06:26:45 +0000
To: "Bespalko, Dylan" <Dylan.Bespalko@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/python-loguru: add python-loguru
Thread-Index: Adnw+s0EXQgB5rXJR8O2cET4WJ9W1wADsN2Q
Date: Wed, 27 Sep 2023 06:26:44 +0000
Message-ID: <CH2PR12MB500470942B73AF4160EDBE7DF0C2A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <DM6PR12MB4121A46C8C581412B839011F80C2A@DM6PR12MB4121.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4121A46C8C581412B839011F80C2A@DM6PR12MB4121.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB5805:EE_
x-ms-office365-filtering-correlation-id: 5295f5a3-228e-4347-68af-08dbbf22b898
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 02PpaYn9hpRgRbxNw28WMjXs5zVRxSIfdetZR/+plElaWkCBKumuV4O9zx8usD3WVua0Fu/0+Hqor5ThPbyEnDqu4zMIxzMorcNP44KbRLdm3nFA0yBbjIlwdTTXG241QNYIt/zbS4ue+aqJX8suxF64nYD3Q33VeFSrQQq/lJsts6ftx8trMQvZFQMRbSflwEllp8HrU/vkhupShLQq9mw/YhOdruQ1vfKrnAGGXyvkh7MERW/9MPpltuE4XO34LIHrljtiX2LaWgZiGAu1zK2L0rKxhV/n3LILpT0v9JWJiQM4t7xZotZMNoDgf6QwQ/zg96KuG1MtELA9afot2bX4pBFbZ9nKEZivxTODVrmhDDSIWx2nR4EUCu2AVpyXB9v55JDbNx1Q+fcIfYnIFwBfLEA1i3nfzAQW10umowSdfXEhGb0znsargIRi3IjEvnZzoTPz9AmllberNnpWJAowGj9yXSN3IKhEI+TTZTg2mS2dIxg9VTFVE6hPSBkxc8zdn5XJqhhXzG+oRNNYLEs9gOc7Nm/uFtSMKyLTaBSCuR+g6l9uOteAy9ciSYnl5bQCTwbj7ReTXyvQZd+7yE51nCw4WvyKpaYfJ0Ly0MV+u15lMIai8djnzBrqXfabVhfuVB2M6G8ExXSYKDyJxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(230922051799003)(186009)(1800799009)(451199024)(6506007)(7696005)(9686003)(5660300002)(2906002)(52536014)(38070700005)(38100700002)(71200400001)(66476007)(76116006)(316002)(66946007)(66556008)(54906003)(110136005)(66446008)(64756008)(8936002)(8676002)(41300700001)(26005)(4326008)(122000001)(86362001)(966005)(478600001)(55016003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cMUeKS2sVA5bOtbzzdb0jClWsMfAVS6UM06BFwkCq+5ODdxizL1pxOHhjU?=
 =?iso-8859-1?Q?b7lCjyzTomgroCFrNSNlE/qURmTRipXNpDmPWZddLov6XHa7Ea1Mr/hZfp?=
 =?iso-8859-1?Q?6wk7N5w2oxvLc5HGJf3clWcpAr5YVS0pDoc2Vr+Pp9MmqFwef40I+1RON+?=
 =?iso-8859-1?Q?BdVeE+9M0/62WZ6wtt9D4d5e4pYNaIpnSr5GQHiyb0e6x+OY87bdHSO/j6?=
 =?iso-8859-1?Q?2vVH6PLBeZoQkWUB3ohfFNXULg0Grt8vUWQZfOK7qdAa5tutefh/qAFWtU?=
 =?iso-8859-1?Q?h7hitHmyUSHWxXdveOlGHdzMF4hBUBcgpm4XdBjeGFEHQJaIU5GRVaB3B7?=
 =?iso-8859-1?Q?kABBW1gfc6DdKD/fNEZW4B4Jjzrwf+zOn3SnAjQL6geclSEaOH0yOdi6jk?=
 =?iso-8859-1?Q?pCD08BxInrCoXAAk0SL3IMes+8GCvPfGjOgOU6znfEVi/ERgIfGiTBbUwQ?=
 =?iso-8859-1?Q?MBCh3uRM+EwcZqimZDtW02kpgpRpC4URf9qKvfOKjdYUj/jvGsLL29siRF?=
 =?iso-8859-1?Q?j5KwRTTSrOCNhjAhzvsp8LKeLjdDITvLbzOLWa4eIwrmxfA7vqRx/pVTUK?=
 =?iso-8859-1?Q?2V7JwgHwx3cXo/5s1jYJSR7m+h2jE3O3bXb/EKzSEk3QzRZPDQ9fDj2xW6?=
 =?iso-8859-1?Q?ynKeWIk0oJyzCJApZM0AtHBWFkj10FUGqn9w3fisa7Jjy7aAzSOKmA2OgI?=
 =?iso-8859-1?Q?cIbAasRVJLIro29r+0RCR3k/hYMsW6vYlzMm9eoEz4fF8S4qpA/H6p+Lpp?=
 =?iso-8859-1?Q?Hzw/Qy0afgG3zSDvNIIodMxRuI+l1MbW615L8/0oQeQOFOYGzlF4YOc6/b?=
 =?iso-8859-1?Q?Ebbgy6RJELTCX9p8MDtMmiNfWHGnSrpbCCyLpgdwJPOyGz3fxUp5ziSutX?=
 =?iso-8859-1?Q?8l2na4VAAQmybWgNqD39susXqWW3qonmkbWv35k1cebe72l+N4kdJ+OR6y?=
 =?iso-8859-1?Q?MkSKYVpfr2KZiR2rNmRHvP+0KhEIlZ+04cY4sMRRIb2+4yRGwGmxEtNcvm?=
 =?iso-8859-1?Q?kMtFb12ZUpj0Uo3L/qhU1CHQVdBDk+Tk5rVYpEttuukPswA81cUDk2wYDs?=
 =?iso-8859-1?Q?VWFWV4dsAvyc4jBVIdMPie6SG9SRcAKl6BA4kF+aaW0skriUyEsLPqZtUS?=
 =?iso-8859-1?Q?v0XsUzBOskcV1pKx0FqGNnaL+RD/y+6oiwJPcxKAmmsL9kf2gQl5ZP0iO+?=
 =?iso-8859-1?Q?NWaneGkI4dyWyqP/0ptDVdzVsCT+zrw20phOMetGZoBLdSMv9SBagqcadA?=
 =?iso-8859-1?Q?Lw4R3zNwelnz+o/IAdbUfYotTXWUql0bSaO4EsM2LPMwpXdtUMpIGvQFs1?=
 =?iso-8859-1?Q?L96WKXnRJn9gj5dxB/Tos5VuEXHYYppU1DuFn2Ov3sKhShcS1HLyqPsMAl?=
 =?iso-8859-1?Q?TayH0NOzYD/bNSAp28Nu0057uvoKcTZMb2cCQ5ah+jS68b6V7TeQ/WKSVa?=
 =?iso-8859-1?Q?RCPmjH2HuxbRDSwnfqPIT8x/bo/oZWXBWD1B94y0Lw63VprgaW+sdTK8fF?=
 =?iso-8859-1?Q?tcpVEQ8jL1OV42U+ndFooEjHzepcb+gzJvD3IhNToJE/Irn6zSTCrpelok?=
 =?iso-8859-1?Q?UPw4VfTrt/LGAjsyvwRe+EKDL0qIiwBWPDkeKKlyy0cNA6m6z6GKbRhqNr?=
 =?iso-8859-1?Q?I0kAzHfwVFUu8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5295f5a3-228e-4347-68af-08dbbf22b898
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 06:26:44.9299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g54ZQx/QWHUyVRWNKeiyrS3Fj3xVT4NtCpdyXkukR7qJi7eEMmPTetHUsz0OMYGA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5805
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFqNGRD5hTZRCaZeyAJDl2F/vFs/m/+UTrYMX6Aq4kw=;
 b=OfW+edxyNqTKdz4vLl3VswM6ceNsSDsWCFb/IGO71k/1f4NreiQZ0yRdGir+b4FB8IMO0aeq/x+i2De9tN+RRJs92yXM80etEBFtJPXssyZfdxGTJFw2RhHH3wWkNBJWS4H4WGmz12Iy5N0s9K+LMJ/c+6mge5hWT2iebPRYC10=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OfW+edxy
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/python-loguru: add python-loguru
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dylan Bespalko <dylan.bespalko@me.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dylan,

Thank you for your first submission to buildroot!

> Subject: [PATCH 1/1] package/python-loguru: add python-loguru

Could you add an explanation of what this package is for?  You can add a de=
scription by using the "git commit --amend" command.

> Signed-off-by: Dylan Bespalko mailto:dylan.bespalko@amd.com
> ---
> DEVELOPERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 3 +++
> package/python-loguru/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 6 ++++++
> package/python-loguru/python-loguru.hash |=A0 2 ++
> package/python-loguru/python-loguru.mk=A0=A0 | 15 +++++++++++++++
> 4 files changed, 26 insertions(+)
> create mode 100644 package/python-loguru/Config.in
> create mode 100644 package/python-loguru/python-loguru.hash
> create mode 100644 package/python-loguru/python-loguru.mk

> +++ b/package/python-loguru/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_LOGURU
> +=A0=A0=A0=A0=A0=A0=A0 bool "python-loguru"
> +=A0=A0=A0=A0=A0=A0=A0 help
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 Python logging made (stupidly) simple
> +
> +=A0=A0=A0=A0=A0=A0=A0=A0 https://github.com/Delgan/loguru

How does this package get included?  =


I would expect to see a "source package/python-loguru/Config.in" in the "pa=
ckage/Config.in" file.

Could you add this to your patch set?

> diff --git a/package/python-loguru/python-loguru.hash b/package/python-lo=
guru/python-loguru.hash
> new file mode 100644
> index 0000000000..980a233485
> --- /dev/null
> +++ b/package/python-loguru/python-loguru.hash
> @@ -0,0 +1,2 @@
> +md5=A0 572c233002a3ab88ffb727a916716ad5=A0 loguru-0.7.2.tar.gz
> +sha256=A0 e671a53522515f34fd406340ee968cb9ecafbc4b36c679da03c18fd8d0bd51=
ac=A0 loguru-0.7.2.tar.gz
> diff --git a/package/python-loguru/python-loguru.mk b/package/python-logu=
ru/python-loguru.mk
> new file mode 100644
> index 0000000000..898753b5d8
> --- /dev/null
> +++ b/package/python-loguru/python-loguru.mk
> @@ -0,0 +1,15 @@
> +########################################################################=
########
> +#
> +# python-loguru
> +#
> +########################################################################=
########
> +
> +PYTHON_LOGURU_VERSION =3D 0.7.2
> +PYTHON_LOGURU_SITE =3D https://files.pythonhosted.org/packages/9e/30/d87=
a423766b24db416a46e9335b9602b054a72b96a88a241f2b09b560fa8

Wouldn't this be better?
PYTHON_LOGURU_SITE =3D $(call github,Delgan,loguru,$(PYTHON_LOGURU_VERSION)=
) =


> +PYTHON_LOGURU_SOURCE =3D loguru-$(PYTHON_LOGURU_VERSION).tar.gz

You can remove this line, if you make the above change.

> +PYTHON_LOGURU_SITE_METHOD =3D wget
> +PYTHON_LOGURU_LICENSE =3D MIT
> +PYTHON_LOGURU_LICENSE_FILES =3D LICENSE
> +PYTHON_LOGURU_SETUP_TYPE =3D setuptools
> +
> +$(eval $(python-package))
> -- =

> 2.25.1

We look forward to seeing v2 of this patch.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
