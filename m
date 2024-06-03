Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3BBC27C52
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 13:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94B6781F98;
	Mon,  3 Jun 2024 13:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4X4ZgxxbUMd; Mon,  3 Jun 2024 13:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7508B81F9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7508B81F9B;
	Mon,  3 Jun 2024 13:01:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B49E1BF3DD
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25C52400E4
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 13:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5IRL8G7Uxnu for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 13:01:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::61a;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 112C340129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 112C340129
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::61a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 112C340129
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 13:01:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzROJdCT8zLMSltlEu1JrQJGYebqTfzUUFZH9zRq36fjMqvZn0sRQTfn/O5jj8qWOL3YzNLPt6rlcErOBfIwyAYXYYOKVHm5YxJxbvM3KynAOISjJP57U7gYvDTLK13Loq+TzH+QJoSppYHS9e+xQN0juH+YNVRCY0ZTyWyovTvIV1dqe8LnUotQHHONOM5SUpoQbYw3SRdR+X8vvmjiX/iw01I1e9fkKTk6nonngi9KDZcs5qlovpASMJvwWKEcwNRcBVYCeyru0jSS8/A552oV1mXbxBfSLXDwjgeXUwv7aDgBYQgCiv5gpMh+t0P4K0q4JYGornAGxkvw/rXvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwBf/OWPlasjl2uanB9d0tsWJ4VxzYK6t7z/g1ya26A=;
 b=Nrq/e03kUbpv/zTIzkT0kWSl3NGHT207UOEYOjR5hHOaNLyNq8kNgJdIFFGGlXxV2c3ZuYkMZzRJsac7Xz3GBRxxe1Rl/ffaiW0ORsMV72Lz3zXDNYYzXVqwkQYLTfoIcd6Qr4KjlRWkAf+TeDpIVqDrOHziXtoGGKlszRs7z39l7oI5KIZmVNXnH5jJjhxlEcq8dF9MQSUEnOrywfFHeF91cR9qCm9rU30ZUbsDI0DxH6TWYrXjfUdxAo5wj1w4pXO2/dFOo8ifpUQwhEoiCuz2M7roaFoXGcWDvLWeldG9+P4ntUgzwfNEEfnrP6lWuJF5Kn+oMcd+NVCNHHplFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH3PR12MB9455.namprd12.prod.outlook.com (2603:10b6:610:1c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 13:01:03 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 13:01:03 +0000
To: "Maier, Brandon L                            Collins"
 <Brandon.Maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, 'Peter Korsgaard' <peter@korsgaard.com>
Thread-Topic: [PATCH] configs/versal_vck190_defconfig: add hashes
Thread-Index: AQHarGMGoz5QfJpYlEmY1g6km7tPO7Gk+GOwgAAOzACAANFXcIAPtOwwgABNe6CAADcmAIAAAQ+w
Date: Mon, 3 Jun 2024 13:01:03 +0000
Message-ID: <CH2PR12MB50041FD2B93B66E8998BF268F0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240522161338.1278400-1-brandon.maier@collins.com>
 <CH2PR12MB500492AF5FCEA01A7EE55E99F0F42@CH2PR12MB5004.namprd12.prod.outlook.com>
 <BN0P110MB16738955F9A8C09D69A9AD26EBF4A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
 <CH2PR12MB50046AE384EC6E246F6FAC96F0F52@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB5004F4FB992790C240CB26DCF0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB5004E338086FC3DF5D1A8EC8F0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
 <BN0P110MB16731A3ED7073D2EC9481937EBFFA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB16731A3ED7073D2EC9481937EBFFA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH3PR12MB9455:EE_
x-ms-office365-filtering-correlation-id: 4de8ff4c-0f3e-4f5b-81c7-08dc83cd3969
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?JweH58lxmed8vcXsjkaK48hVWnMpUIuP6SqdLXp2jOwJsRe/egyNiGMslo4F?=
 =?us-ascii?Q?ht80Uy5o+d5CttfUJJ1cB55VWG5cxoyuXw6uHWdC2Vb+EDh9Lq7/EE9w+QTl?=
 =?us-ascii?Q?18P+PAI4NfXuepq7m7pGAvDEPpRZAY1Y+coFdzNTlD3TNpNapJsCvWeBSPPL?=
 =?us-ascii?Q?o7W+iVFDw779MG+B5GlHEKYfHwxnwtsBd5DBmLKDE7ZHI+ev7PXUcaRkqbb8?=
 =?us-ascii?Q?NwW2qNP86bv2rDGWsVWYzkOeW3MUsrr4rWexLzlVyGNaBx2L70Uf5dtrIdtt?=
 =?us-ascii?Q?TtiZ8E9wkubqB7+bpUvq9rdaB3udyy1oF1qMsdpiro5f7DLvNwGTTsUK+Kwe?=
 =?us-ascii?Q?yX19bIu9zAfPVV+5n8IuwQSdGw7XJh1Dg75b4wQEBdsbq80/tlfHc7Diyohc?=
 =?us-ascii?Q?J/cJplgZ5rf0lI0y0spWy36DBS1J74rEsMT0wV6paRUra2VShhVB3g+9UhfI?=
 =?us-ascii?Q?5gcn0rDqaJ77krTb+ZyWV9WFRyv2USRtpZVd5Kvu6rOEMEnPwkfETy9gvI9N?=
 =?us-ascii?Q?8o2LgPsuUiA9tTvwKiGbrkK5xNduMvbmwqKZNb3jMoUqrhtQo39R7In5Xi8S?=
 =?us-ascii?Q?lObiVjEupsuRn4wH4GZa6Ku6fVxuu1weSn0S9QBN8EkYjjxKbRzy1ph7n0O7?=
 =?us-ascii?Q?8Hg2MFNc9ZW/CrnsAt6m08pto8dvA7t1fsNHltHJGdo4WdHIPgSCkcOQFLuy?=
 =?us-ascii?Q?hLkdIghzFZy1dFB5lqHi9bcO00Ww7tGiraZMReH0kYSXLaj/LKuvZ1leLYXw?=
 =?us-ascii?Q?GYecf2JwiFO2Yly9b/TWFfJMfRzrHu/+PbNc+GOvgQ01QFFME0G4vp0zvpbJ?=
 =?us-ascii?Q?SPQi8j4ha9EN744S4pnxy/7SAA+AAO9iMZWiK0LdRLmX4tQeL6JOwMPcTv1q?=
 =?us-ascii?Q?0VonaHSGFSD24FzzYOtBBU6V9VPOSa/wbBmLi9vFPXkgw2+wkQ4vY2g9TmzY?=
 =?us-ascii?Q?q1jw18KGeVajyLMcO0GsVOz2dwrbQot+4maVYQdh3Hh1F2yodvyJhuz627qY?=
 =?us-ascii?Q?FzDd5/Ux3eIvraKLlcr5aV8C9SBHrJgCZDgIxEpoQzKTDod4pbPz+JyzHRm4?=
 =?us-ascii?Q?/JG3ZTfNXJKiI2x5l85pR1Vz4oBwNyHo7FYQqgxeZ9F0i4fjw+GB1eKhOu3h?=
 =?us-ascii?Q?sHdA8qF7LC8XbjC2d7o6/Z4rb0hDWCpADuvvzY5rp5awcmX09/8HoQ9q28Dg?=
 =?us-ascii?Q?AUwn8Dcpgwx4J/dqzl1/fLKpV9ckNgMPAF8lBndc/Jr7G5s8c8yqqqJEPkYL?=
 =?us-ascii?Q?8wklaBcxJCCOzba/87qYBDEdWSQBYPnOrmthm/xsA2gOiDfIzzE9SIdO9jwM?=
 =?us-ascii?Q?Sh7et/cMu7s9DjmGXgdOdw4DuOZgJbaYoopEik59CsY9GA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8yrjJvjfweI6LTAAxX+1cc8hcUfiMiQ8N7PufVvdQLxfN3uqQxcLYD8H4gIe?=
 =?us-ascii?Q?6XyRxgiiSOFun6fcjqqes3WVIQu1NmvmYzMxqruUacnvNuFbI6frzD2qTkYz?=
 =?us-ascii?Q?IQMuQudqKyf1LxqaA7HyH8Ff4YwQfzKPDv9C/yUvE5NKuubNG/rUZmra5j4h?=
 =?us-ascii?Q?0c8WleMonbLa9sdCJvrzyMfCjFvHAFZbTz0IIhtxsWRoQh7xWZGz9xK6iIhz?=
 =?us-ascii?Q?le1fBfBCjffLbXT3/rWqiHmfuWRa92/aCmDJyn1pggZJuHJXwEGuETHqT5Rr?=
 =?us-ascii?Q?E4BVIUblw+TUpVwjINW16tmOjsVS0c5uz2nTIqgbv3HQlG++GHWOEy4lFV4u?=
 =?us-ascii?Q?COk34b1wFrrQ1JzYWLClyxCTJ6HKuixDigWoUruUKCaKmw6+WvAI2lsp/Ox3?=
 =?us-ascii?Q?wFh6ZxpzATzgJPuK/b9oHpk8lyvS+nmVQ+KXZQTg0iJQGGqyHEzTjJw0bJRV?=
 =?us-ascii?Q?iQ9jKD7Tf5Z+cxT4EiAcLwdWEBhNhICAn9uXkGQlQmriF9gfK83EavTF4IWu?=
 =?us-ascii?Q?XGG8yKXlja0/fQpIFTL4DJl+QhEvUPXmTB3ii68HkRlW8CpmddQRH3hrjJFM?=
 =?us-ascii?Q?8gm1nGRtYW5n8hdE3uuLwVeulAvu+8kMg4lP0HRX0YFpTRiWu9kxBpxuwgDG?=
 =?us-ascii?Q?WW2A80+F4S4URvwZth6QEJsSg4L4m1MN27Dslj5bykvpH4oWHwibJBqdukOw?=
 =?us-ascii?Q?8l7kSBkMmQFrs5cUWmsFXCnLjqcMJzjtF36pMcMR1PqZvvYbRVOmLH5mr571?=
 =?us-ascii?Q?X7JcA/2okxM/WKF/+//xcLOMlH/CWw/oAAXGYbtNAuMlbLPR+JbgU6xjIkca?=
 =?us-ascii?Q?po0onZAK6L8TY6sq0HZv5h6FU2VWUDE2l/c4lX6kcvcaBvsw7O27feosvLBp?=
 =?us-ascii?Q?LsYAMl1SpFZMefW42kvYqXOo5y5q2hpVwhD/nQVzUqxIMO1KLZEQ82aN3gJ4?=
 =?us-ascii?Q?ebIWO+58vJBWQbThe5hBcrsoV5aIAZKImn0W1pHkIFw58PTD/xHX3Mk6JAFv?=
 =?us-ascii?Q?+EpVKAyUKqTEiXFRMlglsWBKkK1+0FYgI46mjN7BAWrf1cwGdI5MTI+qIODE?=
 =?us-ascii?Q?QUKDkgQUI9jTdDhJoRBMqh08u9NqZzELi+OGcrfIOIrZNlD3b9kjYCr913JL?=
 =?us-ascii?Q?JXCaDUYfakWgqIu9LxDut/qvn1xjG8zuJm8ONPJCiG1S8AzpcIn70UD/8AGz?=
 =?us-ascii?Q?rs5BH5pFQTVxv8IG5jzqi0N27Qbmp4ZFKvz3xawi0UU+c3iz0KlGprfcFkgk?=
 =?us-ascii?Q?XkbaKCR9Qps6Lmowr1TnvwocSmOHbIdfhdYwD+Ytmf9GOdCj7I4qwsLSVw+U?=
 =?us-ascii?Q?5+jR36U9npUcT/Q86qxQh3dwMETQIS2EVinbGPf0s1Vj2oRf1W6N1YSf7WE0?=
 =?us-ascii?Q?sb2dXcH4DKHZYJJHt8swM1UOYNRwPav0maDhh5mMHXIBMPLCTiQHghN5HYMv?=
 =?us-ascii?Q?fHss4+hirlkLcUpo5bxyLlD/3ZS8x3OKjDWhaewk3JnsMlX9/JuBSEDLuGae?=
 =?us-ascii?Q?ZpBjzTBDXnprM+7J5Uuxg8RQ23UkzsnhvNU8UuOyh970iaHn0K5cw6AdMcuV?=
 =?us-ascii?Q?PD6mwoTabWO52UQYprI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de8ff4c-0f3e-4f5b-81c7-08dc83cd3969
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 13:01:03.3971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: edeAIB8GdSU6XSS6RYcWGK9jn2YoZ39vRWnsXGEGbEPHZUX6Zdcm5PmPRv9TCpZe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9455
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwBf/OWPlasjl2uanB9d0tsWJ4VxzYK6t7z/g1ya26A=;
 b=mzGqpYNcPway8wdMtNFhUBC47/cgOLyw+MDd2BgW2kJTtHQc8Go7d7BoJt5zD+9FuAoAdXinnQhE5iurqRruHx8/u7SWPH3YGAw+4daEDbdJV4yOEHy9foU3TNDtdsDSGW+TvirGVdbSP+di0NWiTSCLFY2OOcX9pUACobhBor8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mzGqpYNc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] configs/versal_vck190_defconfig: add hashes
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> I have another thought on the subject of the hashes.  All of the Xilinx hashes
> will be the same regardless of whether it is a zynq, zynqmp or versal board.
>
> However, sometimes, we may have actual patches that only apply to a single
> family, like the ATF v2.8 patches currently in the tree.
>
> In order to avoid duplicating the same .hash files 3 times, what do you think
> about creating a board/xilinx/patches directory for the hash files?  This way
> all the hashes can be common for zynq, zynqmp and versal and they can each
> still have their own board/<family>/patches directory for family specific
> patches.

> I was using the ./utils/add-custom-hashes script to generate the hash files. That
> script truncates and writes each hash to the last patch directory in
> BR2_GLOBAL_PATCH_DIR. So, this would work if the board/Xilinx/patches
> directory is last in the list, and all the boards share the same versions.

I do not believe the ./board/xilinx/patches directory ever existed before, so
the ./utils/add-custom-hashes script would not find that directory.

Are you ok with my idea of creating this directory and putting the hashes for
all the Xilinx boards in the same place?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
