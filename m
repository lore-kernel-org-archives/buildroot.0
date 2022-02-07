Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AC6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 13:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA92740148;
	Mon,  7 Feb 2022 13:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hcQDFoDLV6fW; Mon,  7 Feb 2022 13:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A28A840153;
	Mon,  7 Feb 2022 13:25:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C82151BF29D
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 13:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C39A660A80
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 13:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06iKq-e0-EB8 for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 13:25:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5C79607FE
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 13:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQJxHCzAHYHRrF7mJSptthedoBjwcE0ofxJLEasA80/oGP0oxIhyQC9rYicYCvR124LsmPyyxUX16VdbYueLQMSV8VEiwWhVJ2fFpse3UWeVRtnInJOEFj0AYO7zKwPpptFOR16F8UySBcwLk7Bxa4MoDd8G2CEB4PUwEs7MOhowyPcDfIW4qAbYhlz/xeVrhOsoA6kF6Kf6bKOD7DfGMJHBfr44Zbyd7Co4RceJcu4yrBYel6DGpPWel7z7VQl/GdDKS1tzjO2icv9dJ2B/GTf3OgJ9u5iUv7JtTWSaYTsL82dWdTU9hJvlV86F/pwikFmnvDp/Pz1du8W6ECjkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Qyc+Np5dP5Qfs/UtMw6LBaV2rPcbswQgBbSXxVXJa4=;
 b=Q1aZ714Djiqy03xlV7zhY9G+tE9Zla6+1bjmFiujwovsTKGIYhQVvBChDOCI/mtx//qxjQrI/AjxvNr+o0+Z0JfiH5UtyZ8T+XYK7M3JMVpHBwip2UaTFykim4S3N3GUtzdijStT8UHOvBYcbANddI7i1IaeHv1nLd57rwN8ts7S2vUxqX8nM9kC7zJaoxoBA0ASaTq3+FU1EwN6nfrzXgUbbRKszQHMwh78PuxJXhw36CqbAj9TsPAjT2lplLOz+pozCMvpI6kGmE6TZ1kEdGRkv4qNCrgvLO8kEJtOsCTERzj32QuG1e8wmPH+OUo3GYhKhiB/lcLJXjdFPW0TYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Qyc+Np5dP5Qfs/UtMw6LBaV2rPcbswQgBbSXxVXJa4=;
 b=ZPQ9DN+40fIHsRqoSKr5Lg4B0sY7hXuzjsAG5EyfeJ9T84q55AFLHl0KuV0/DXWMzdAGgehLn3J3mzlIJT6uoQOCKhB0TlbPgkMj8ql4EC9HjfSL+zqe+52279preWASbYiip5CsFdFXglJg7MrNSH2L5tajo403jHOJpyvcSkk=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BY5PR02MB6722.namprd02.prod.outlook.com (2603:10b6:a03:209::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 13:24:57 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 13:24:57 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
Thread-Topic: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
Thread-Index: AdgbjfGkWVHh+j9fQheB50HkAzQTuQAGb/sAABRcuQAABPdHhgAE9RdwAABtZwAAALcScA==
Date: Mon, 7 Feb 2022 13:24:57 +0000
Message-ID: <SJ0PR02MB77583693DE78A399C95E5395D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <SJ0PR02MB7758F655ACB4D148D78E403BD72B9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <0a82d8c7-a0c6-06a5-6a0b-788fd5c4a935@benettiengineering.com>
 <8be136a0-1263-3b17-0b78-b7d34ef146c2@lucaceresoli.net>
 <SJ0PR02MB775843B513EA2CAFD0FEBD82D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <032d657b-eb9a-2dc9-f60b-8536f1fc6c57@lucaceresoli.net>
 <SJ0PR02MB7758A5DBC6DD4DA837E0F47FD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758129FFD78D128D3393198D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB7758129FFD78D128D3393198D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28a72bff-b9bd-4c26-8770-08d9ea3d3c2b
x-ms-traffictypediagnostic: BY5PR02MB6722:EE_
x-microsoft-antispam-prvs: <BY5PR02MB6722CC2CAEC1BEC47DC18903D72C9@BY5PR02MB6722.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YU1Kva1Yfqdj3WoG6r66MXpRym2ScUa5ddlNcAm7f/CUe50nblibFV1Olw889CvLHvWyIF9Bq0LuRYDLkYrV1O+/umwRPyXuh7oFep0lYAFJD0bIMWX7S8GI2KxqS4mpKq4NFFdxUx6I9X5Bx5V+OOxObH+GaMCD80/w2NUCaukwuJaqLqO6pyJd/HRUnHfQt0mUDVOyVc8hWwdugrKlpn/C2Jc2bSjm5I5bmKwFMV+VSbNHbrPivpu61vjEY8YJSlRu9X/vYiZIsdo65K5ztgCxmMMxRDjhgi7U8sYk8e+PjXQTrivTOq/dMFucjh5Lvf5yy/8BltrrzOgT8cPSUWGEEXJ93nqsf/vhFn2+OvIawd1yW4Xk5icZhPx1MZYk7IAHzoiQ/+pVtYwbJIdO1nC6OUH8K56dffrGY+uHZyU1JjMG510Pn9uVYBGdV13VYhL+WKh+jNUbNeP8ItCuGLoJ7IcTVFuZlsHJk0gBT5omHryUfG/sma0PV3XB6SIACF80jQ7VJGnmzyTxyoRt7NTWW+uDHeN+JxLUA56dcBf9V5v9Ce4Q8ImySbGNR0/5Zkuz1zv5VnzrXCzrLi7sYovo0aMcnCR4ZCFgUJfB6R9CChNnnqut93kilN4cR8Ef1FbcadhsXWwbDT4ACr43tnnzDHnQEUppuba7lSSnvfL1+0DDOlFhQwyFXHDtWK/CmFISbh6k6y5ZR8IAm+P81A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(122000001)(66946007)(64756008)(66446008)(66556008)(5660300002)(66476007)(52536014)(186003)(26005)(2906002)(38100700002)(33656002)(38070700005)(966005)(6506007)(9686003)(110136005)(55016003)(71200400001)(4326008)(316002)(7696005)(86362001)(8676002)(8936002)(76116006)(2940100002)(508600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3owZG1EWnNxNEVVaUhuWHhaR3NMZERQTGJIOExNZ3NBcE9keXRmd1RGazFX?=
 =?utf-8?B?UG40NE5uOVVJK3hkN2VhVkhhNVVEUEtWMWNaZmtERVZtanlIdzZTT2VTazlp?=
 =?utf-8?B?eTgyMGZRVUp0VFZ5ZmNQZmc0T0w0OWp6akFsVlU0YjN0NmJRS3dTb2FqRkll?=
 =?utf-8?B?UW1xbXI3V29KVlhBR3pGR1I2cExLeTQyUXplSXlJRll6bjBabmZNK3FqMlRV?=
 =?utf-8?B?NkdVeURreDdkeFZlM1Y0cy9RS2pYZFdzM0pFMEVpWkxmMzlHT3dNNnRmZXRJ?=
 =?utf-8?B?V2V5UVVwTlZVVWEySHBxNjRVWC9YQzBFV1JoZU1qcnE0NGhGaWtobjQrSnJV?=
 =?utf-8?B?OG9mdzM5aC94VHZKWUIrUFYvY0RORzdaSFN6UW5tNDNYMnJYc3YxUno2UXhB?=
 =?utf-8?B?elJXbVkyTUIyS25abGdNdUpVYW8xU3dvMmMxblN1VnZKc0xWSG1qRCtONXhl?=
 =?utf-8?B?aE5pSUdUcUxvMXl3YzFiMkl2MTFSeVhkdGJKZTBqWExrM0dqbjFGT1pOR2RQ?=
 =?utf-8?B?NngyK1JDSTdaejRuYXpHRlF1QXVKaEVPbmJtMXlVRmwzdEdmWUpTQzRKcmpF?=
 =?utf-8?B?ODJBbEM3N0FUb3JFS0t3Z1pqYld3L1VJVExiZmE3d1dCTkdYOHJScmRoeDZ4?=
 =?utf-8?B?SUhBUmhvME5LbGtQVFhSYlh1bDFqZEQwZUp5WXlkMFhDOE5Dbm5oL1A3VE5D?=
 =?utf-8?B?eWJyYWJHNEdiRklPZ0JYNjhSVWxQVytzMWhHd0t0U2dHY0pWM3dnZDBmcVQ5?=
 =?utf-8?B?aGJSNytCNVZVSDhZRVlSNXZWKzY4ZzJxdGFhcnd1VkNOYzJYZldmM3pvMWx4?=
 =?utf-8?B?cHRDMFFTbng1dGJvMDZHd09wVDlsNlhHS2FqUkU1Y3VOVkRPTUhmWDhHK0Ex?=
 =?utf-8?B?SG0wSUVpYmIyd243NThnT0ZMZ2Jrd1Y3WUxwYWp5OHRkMTRlL0hLVU4wQWJ3?=
 =?utf-8?B?M0hYczE4czNiRkxuODNWd0lXeUY4enh0SUZkdXlBTVF5cXVyb0graitndGhZ?=
 =?utf-8?B?VWhPY25mMVNnbjV2TDcwQ05sTWNGNXgxaEpYU3VrN0h3VlZSdHgvWFlzdzgz?=
 =?utf-8?B?RExTRFNsUTl6SGhBZTdnKzVLZkVjbVAwTmJJNEJVRmNFb1pZdjFzWHVJeDVR?=
 =?utf-8?B?UEt4bFVJV3E2NTFkWk9HZmZ4aHdUUHRDbWNqd1lSL21SN0VuTEwrMkQ2UjFP?=
 =?utf-8?B?QktiNWxNR3BKb0JnTUFCL2pBanN0OStCdjZsWlJVSzdYV3lDak54RzRzcm1W?=
 =?utf-8?B?WFRTTm5tRmVVcXRhcGcwejF6bWh2YkxyMFVPQXBjWVFaL2hrVnJER1ZLZVBI?=
 =?utf-8?B?Tmd6ckV3K2YwMjltYTgyT1dHeWJScjlyNXZyVnZkNDIxdjlUbk8rRDFxd2tX?=
 =?utf-8?B?V0ZxT1habTBIR29oSHJhM3dVNFRmUDVOUllEYTlBc2VreFMzVXE1TTVwSHNE?=
 =?utf-8?B?QjFoeStqRnErVW92dHE0N1dCSmJOc1V0djJzUU9OTi9PVUNRMUVLUUFvMVZC?=
 =?utf-8?B?a1lBSWxDcW80MTZMREY3TG42ZmFSME9zQlNQRXJDNVFSL21tdE1TbUo3djZB?=
 =?utf-8?B?VCtVQ2NEK3VxaUdldlppK1JEZU9GSFkveGJuRnVoQUNyMTNBS0t6UG42M3VV?=
 =?utf-8?B?OC96aExKbzZwVzY2L3loeFBZeWJZK1l4VzI4V1lCaGZjMU8zVWE4NllDV3h4?=
 =?utf-8?B?TksyVGNrdUVweHNGVU9tRmczZ0F5ZFZrNlRrYUZRRDRaOUx1U3FXNzFxaDNt?=
 =?utf-8?B?Q01WMFpUZUQ2b3V3VXZPNTRFQWV3TklEdHdZbzIxZmd4eDB4QzVlQjdYQUxQ?=
 =?utf-8?B?U2k0ZjJaRlVleXlNemFHNGdnRXlrN0E0VlQ0MDk3eXFyaHREQjhyRy9obWl0?=
 =?utf-8?B?aGRndy9VNldGd3Q4RkFnVS9VMEJ6TU5obHRTc3FhTmhlVmV0VXRQUWZEOEl0?=
 =?utf-8?B?WGRVQnZkM0JVV0E1SERreXFFcmdsZmhyb2UyN2d4Tk8zU0pCVCtsVUplTVkw?=
 =?utf-8?B?Z2Q3WHZLWVNwUVZ4WWpHM0MzRlQ0Yk9LQnhQa3RXSkNTM0tQVytkam8zL0ZW?=
 =?utf-8?B?YzFUZzFrL2RpNFgrUlJDWEdtT2N0QTRuV05sMzVLUXQ3N3ZtaHFkR1RVMS9u?=
 =?utf-8?B?TmJGT2NER2V4Sjk1VTg3TTN0aDBJbFdsalNGaWxESmhsR3kxbWxlem9LRkpj?=
 =?utf-8?B?U0E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a72bff-b9bd-4c26-8770-08d9ea3d3c2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 13:24:57.2206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: reHo8B34hAHphS0E4+ZMld4XIvrI32lCT3smLkNutfuujLb4a9Eytph+VuvFfzfboDXUnx4Sc8jWkkpYYOBHuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6722
Subject: Re: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
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

Hi Luca,

>The zcu106 defconfig currently in Buildroot uses a pmufw that has a hard-coded pm_cfg_obj for zcu106 in its default Vivado configuration. It is an old and unflexible hack that required a different pmufw binary for each zynqmp hardware _and_ peripheral configuration (or other solutions like a "wildcard" configuration).

> Nowadays pmufw images do not contain a pm_cfg_obj anymore, as it gets passed from U-Boot SPL at runtime [0]. This allows to use the same pmufw binary for all zynqmp designs.

> This means you should provide a pm_cfg_obj.c file in boards/ and put the path to that file in BR2_TARGET_UBOOT_ZYNQMP_PM_CFG. It will be built in U-Boot SPL, which will pass it at runtime to the PMUFW.

> Note that you could handle similarly the psu_init_gpl.c: provide one in boards/ and put its path in BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE. But since U-Boot has a builtin psu_init_gpl for the ZCU106 (and 102 too) then you should not need do anything. It's for other boards not supported in U-Boot.

> [0] https://lucaceresoli.net/zynqmp-uboot-spl-pmufw-cfg-load/

> I tried this method, but I am getting the error below.  Do you have any ideas?  Attached you can find the pm_cfg_obj.c source file that comes with Xilinx 2021.2.

> cp /buildroot/output/images/bl31.bin /buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/
> /buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/tools/zynqmp_pm_cfg_obj_convert.py "board/zynqmp/pm_cfg_obj.c" "/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/pm_cfg_obj.bin"
> package/pkg-generic.mk:289: recipe for target '/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/.stamp_built' failed Traceback (most recent call last):
>  File "/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/tools/zynqmp_pm_cfg_obj_convert.py", line 293, in <module>
    code, flags=re.DOTALL).group(1)
> AttributeError: 'NoneType' object has no attribute 'group'
> make: *** [/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/.stamp_built] Error 1

I figured out the root cause.  Our newer software tools provide support for the IAR compiler for customers using IAR and not Linux / gcc.  This causes an issue for your script as it does not catch that there are two places now where the XPm_ConfigObject is defined, one for the gcc compiler and another for the IAR compiler.  I can work around this for my current patch, but could you work on an updated zynqmp_pm_cfg_obj_convert.py which can handle the new pm_cfg_obj.c file with the IAR compiler support?

It would be great if you could make a new version of this and push it into U-Boot mainline.  Thanks for your help!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
