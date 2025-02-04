Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5280C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 13:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74D6E60FF8;
	Tue,  4 Feb 2025 13:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opS4wIfWYQjk; Tue,  4 Feb 2025 13:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C29760FDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C29760FDC;
	Tue,  4 Feb 2025 13:33:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF38E12F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A36A8411D9
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKySNw0wEik8 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 13:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2406::60d;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D580640F0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D580640F0F
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::60d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D580640F0F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2hInx4GZDquXbRnZnl2sHtxcun+w1MJcfx4ZWjl2GwGEYmKHVE8LGahTq/SiYUaqEa3JqYbvcXL/xS0Bw/pAUiPwquw9yy+oGnbyzlEa1l8cEkEaY2iPh/4LbwipS4KjUoHtntSDQ2c0pxRQh8fkL3npI7SPEnnWTqXh13pwQQ5hayqmnXRv6XhCvAyB1LGyujib0bmMBTgfa2esQ6i3pp5UU02WeAa728LLNGuB1ZhPYJ6vau9xgdHEj1J417OLlnhrAAK0EtN1llP5GQj+v4wmHP3Q+HxcQuexCr55d2dxScQl6FpSqcf6asaqRZ3aYhUthY781UEgOBBI6AIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFnMoMsmqhRVPD/tQ0+fUdTAnIgVUmtVIokyy46PW3M=;
 b=gPO7aQXlepFi/h1ekPB7fVZaGbBVyZNIuuYC89Sa+3JM9GvQrOzkaNfG6wxx4pr8j4JG9QwkDkFYqEqpfx04zx/jlootIGQ25RBAtIxh9DZrbCqnDEwYp75Aqmr+7yNSlmQTAKjYsK1DdjbGqA3nT31TSQDq9y3muH6UK+s18REgKy11VoaiH2B8WEz3dZ1d8lTCrGa1YB7V4aNhvCTXHjjBI3BTFvYU8ZYBzHtTcjW2Mc9dNDs5404GfQEQfVvbtzk8i6mVcEwvGRk1LmOnpV6MzfGiRZjoNl5f0KtpZG9lt6hjwWYufv7YtEhQejpRz+cSIwj3vm4/GlzdsGOgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SN7PR12MB8002.namprd12.prod.outlook.com (2603:10b6:806:34b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 13:33:04 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8422.009; Tue, 4 Feb 2025
 13:33:04 +0000
To: Peter Korsgaard <peter@korsgaard.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>
Thread-Topic: [PATCH v6 5/6] board/zynqmp: add new qspi.bin binary to images
Thread-Index: AQHbb3txfSGI+3n+ukW5sdLQmEDkqLM3MujjgAAAj9A=
Date: Tue, 4 Feb 2025 13:33:04 +0000
Message-ID: <SA1PR12MB5615877C836AFEADE3A79E7BF0F42@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250125224930.3639111-1-neal.frager@amd.com>
 <20250125224930.3639111-5-neal.frager@amd.com>
 <87o6zhn8gt.fsf@dell.be.48ers.dk>
In-Reply-To: <87o6zhn8gt.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SN7PR12MB8002:EE_
x-ms-office365-filtering-correlation-id: 828c4ade-cbd8-4da5-bb46-08dd452073d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zyAWhb0QXxuor+rqJTXkdz0QVRqMqxgEZWqKyGhYWmArz+jdb7dYI7JeieiE?=
 =?us-ascii?Q?PDJBsofS4ElGHBusIicuxlzcRZYdv8RY+vLjMOz4o/pl7wEe9DohXTE5cRvv?=
 =?us-ascii?Q?54hTgHB2lmkH4ONwhkY92QncLyd1WjIIO3GLctUcxuE9WNeO78x2dyVfHbKV?=
 =?us-ascii?Q?lISuSaWaaoSFY7kvGb0WwdKh1DVKvsQef0OVGh7Zus9Nz8ywbkZM/vGkHaiK?=
 =?us-ascii?Q?292wRx2mDm70Yq9Zq3G/iEUn8vYowsm+Em6GLRj3YNCn2Z8zA2sOx+2UAMW5?=
 =?us-ascii?Q?pWBfx0WGggqja8QZMsjziKYMXcCVR1te4MKjbLaxokS04giQ3noM8iDdSVsj?=
 =?us-ascii?Q?iJyf+lA4Mi0ldY/Bz0cJ5F5Q74bo8WJafB56wUX7+zIuzC8/IyIeQPYryMYM?=
 =?us-ascii?Q?rwU9KTmcUlhdHxxNZtdexj75CWgJTTZty38uqldzt+EH508qIIWPU4uH/HEO?=
 =?us-ascii?Q?vpCUt+qWMN/NsLRd9M5/ESodiVQF2SR6Yir3iLI4512EJSpXqu1Gp+t4pA8J?=
 =?us-ascii?Q?uHI1sGmd5D5Y3nut4GnQslFS/pd2XBHQeDA1c0YhZE+hno4Nx3S5W2Dc7OiB?=
 =?us-ascii?Q?5BHjEFF0rd0h2wue87TqXWQP8L4ApkOONIRrNYkU5degyrwZ5yA/5D5dubEV?=
 =?us-ascii?Q?qy81s4qoXBevnPgovgcbABmK5qwb68cD363oI2LpsUKXVnBx+DgBVL97x4oM?=
 =?us-ascii?Q?AyO3NoKiSzjN84h8dr/aJ+eYP0jGJaCuCHVyLTfqkZ6aJ5IrhR2S7Eyy6Bjg?=
 =?us-ascii?Q?ozJjBtVLwaZ0peDQCU+v1lgjUFgqyBM72VMIEkCGgZTQpNCvbjy1NCiTsxZP?=
 =?us-ascii?Q?XqDkp3jvJRQdSHmL9+qkIRv65Kj5NITAEJnpLRJQk0PRl6m+jjJxlGGi8ErB?=
 =?us-ascii?Q?yHX3I1pXvP75oggjCDgkdqM0jWpVG32vW4Vp/rCRek42YpsCJPlK5UB0466S?=
 =?us-ascii?Q?RRzEY2H+BNPqLxoWUP/Z7nJ6xeTEFwCJ1ydniFtoRoteLx4R7n7HKDSLfbPM?=
 =?us-ascii?Q?5B67j8em7xgOpXH9MpkMfDRF0VPn4AVqvlfpXNr1yQZukmtFMFuZkIh/QEdJ?=
 =?us-ascii?Q?fR2xtcy/tlMH8Xmd4Zrhv1uD/Hn8pmXz0WSgwdiRXfbFgWbA6hk0kq73mY6Q?=
 =?us-ascii?Q?ZJfLjSu/o2p98tcFZgxPcYxbC1KfGRl4FaofVmojkAgLXpeW+NtkDG7dJSA3?=
 =?us-ascii?Q?WHLB6uiaHDAjsE5XqSOhDd64BdP1htEXex9I2b/VHEAiuKADPqF86E10z2Y4?=
 =?us-ascii?Q?fQa46A3nDOZIAHfDc5hrRr+iRWP9J0OI9kmddOO7yZWfBwC1oscw0DWy8+8f?=
 =?us-ascii?Q?vzrQhXp9czlxhrNmwS8vADDHh5o6lO4QFVFweO8wSXqpFBuR6V0DcTwXQbMT?=
 =?us-ascii?Q?RA8JWXxEKbnCIsCFdbeKJS2ZydIAbmQad8P1eQ5E50dwvol2XcBVyTByiP/7?=
 =?us-ascii?Q?m96t9aMV5bQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?brSzjwJvlJ05sGvgokF9hs3u/3D9dJj4t1aoIU/S+AvReIMXgD1jEs9HBvt3?=
 =?us-ascii?Q?ufXGNH+LTy8FTmtos7fxQWtRcFVwzDaKt/xUMun5EJWQxv+1PM6itD1njxp2?=
 =?us-ascii?Q?rb8FkRmraez1oKl2HsE8Pp0WdmcK2ile9GTdnzxJWV3QGaNiT6FFTDXwpB5w?=
 =?us-ascii?Q?VWYgDieiTBsj9ACi6i5ZahORgdYpfingGQEbac3pm5rk/Fe10MpYbjU0FOZp?=
 =?us-ascii?Q?e3vJ6uT8Fjo9uSlPa/xWSSgZdwmZSeOahyEuGU2gSegK6FaNTfpZfIH59UDg?=
 =?us-ascii?Q?c2JLiLNH2znLskFFGtqV04QT6uHQ6oK0k/dJIVvTrqneDbkZa6PQAAquKl7U?=
 =?us-ascii?Q?bZzUy4ZZnkJ0kevFoAHcTV4Re+ZFYRd1wiTbw1AvVtoKnOWELpCyPkCiiKEB?=
 =?us-ascii?Q?9B1qZsgrlKqZnG76GWBAkNWDBIKFX4m/1AWLzzp5uVIOZh1pRbTXlP9VMGzh?=
 =?us-ascii?Q?/NScRZgxeebBO52JL15z2hFq+27lMHeKoHzYsQTjWKnXNqTP3rRlA/PHI9Gt?=
 =?us-ascii?Q?CTh4bEJEUPg80hFrlKkuHSQXwmqVx94u2LzikQ8eV8cF6Lq1d7xbIEn7nwsL?=
 =?us-ascii?Q?x5bEi6pale3848HhF1w8tZdMY9qVgkrLU0x7GpmDxO2f84RgcIpSafTEio4k?=
 =?us-ascii?Q?sVwSySoXu5iQ4NrMBUGtfU/PVUWwW7/aGLup5EV9twJ0JmRLpimMgGIIgGTT?=
 =?us-ascii?Q?XccVnkpmMtwEzevHYNEvfQ1JY7IL2tID+eXC6H5apTht3LSoQfvVdgQUdE0V?=
 =?us-ascii?Q?jdwxLtvarbJ6uy6f504h+GXajcJDkaXTmv2JyUBnlnW7fqm08zSVKRa0zDl/?=
 =?us-ascii?Q?hyjKd7WwrD6yS6p4FZy5jk0V107F0d2OYb/ofz4EzFir+cJ8AJ2n+bZY4wZI?=
 =?us-ascii?Q?QqI1wjJ4UJEpiWSUoNXkUKRcSuHNlyXUaYqQggg0y//JFjvM8ypKBOjHWyge?=
 =?us-ascii?Q?5rzzfJb5uHBUaLWAmzI0DBUIhrM+nNXkF9sG4mAFQmYAKwVQcy5b6zvDtpBb?=
 =?us-ascii?Q?W3GWAYGOkdfD/cbvTmd8OV0cNcbfv9ubyV5rhqpd2gSX3jfx+L+kfD0dnJTR?=
 =?us-ascii?Q?WpGZVzFxM0Nl6ARJEHZ1fwsh50k61HkRiD6Xec6BxYSQU1IIb5tpt19zUe3X?=
 =?us-ascii?Q?hqLrgzIKj7wz0UWK3OxEwMrsh8ph5Sfgib//rEDSxOxbC+pEtljcCQQmxgtT?=
 =?us-ascii?Q?ZgCTrIrySemxAWsYBtTvGukjHGmTLYGwAmDRq8DdUuIhFSSA2lgLiGxUw3yY?=
 =?us-ascii?Q?4Ipr5i4QPLOVysEZEoKrtPPt3VvycNMcVucyxJwMh6SdCcrfZv9NtL+nVfb7?=
 =?us-ascii?Q?teGwPeci4yM6EYuiwO4AvDQ++rcSoh4h88Xi0gVNc3GqHYODBw6U+Bk7GXGr?=
 =?us-ascii?Q?bbOmZ49Y0DYr+eyVk/oY9dAguxSY8Cc2ZY24tMz1Esd6WLxu3wAWd7Lih2AO?=
 =?us-ascii?Q?tQsPUoSOCXA4CWkJxxzciSNN+gINUmt5QCfU4peSBsldYDvDrjTqJANPdFHt?=
 =?us-ascii?Q?v0FrrS32SARGtZHrNld3IShFI1rPXfmZNLnco/BVNdx+hQUuhsEybUYwlSTb?=
 =?us-ascii?Q?XsvJd5z7g/tOtgnmPcc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828c4ade-cbd8-4da5-bb46-08dd452073d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 13:33:04.1088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ez3xIQSdBQrlJTqyNwV3ry8/vouJ7iY/6ZaHNDuqK/3jpLamw1GtEML6Xe16A5e+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8002
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFnMoMsmqhRVPD/tQ0+fUdTAnIgVUmtVIokyy46PW3M=;
 b=K4lzSFuMljkiqueSxHWUiwfLGXSJ94PcI823Qt9uu4odpfWW62s9O9BdSsI8rpWah+E+jeBNtYMUXayDzjz5zkMyWneXPUNfuAM+aNHS2fqdHObTgsuOUq5kIm/Rlv95tRie3liz5Rv+mYjLh432/s8gDuEGFZLa9u9jRRt54fo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=K4lzSFuM
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 5/6] board/zynqmp: add new qspi.bin
 binary to images
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch adds the new qspi.bin file to the zynqmp sdcard.img.
 > For SD card booting, the qspi.bin file is unnecessary and can just be ignored.
 > For QSPI booting, only the qspi.bin file needs to be written to the flash.

 > This patch enables the Kria BIRT tool for Kria SOM reflashing using qspi.bin
 > as either "ImageA" or "ImageB".

 > Kria BIRT (Boot Image Recovery Tool):
 > https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+SOMs+Starter+Kits#Boot-FW-Update-Process

 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 V1-> V2:
 >  - new to patch series
 V2-> V3:
 >  - corrected commit message to use BIRT instead of SBIRT
 V3-> V4:
 >  - changed config to BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
 V4-> V6:
 >  - no changes
 > ---
 >  board/zynqmp/genimage.cfg           | 1 +
 >  configs/zynqmp_kria_kd240_defconfig | 1 +
 >  configs/zynqmp_kria_kr260_defconfig | 1 +
 >  configs/zynqmp_kria_kv260_defconfig | 1 +
 >  configs/zynqmp_zcu102_defconfig     | 1 +
 >  configs/zynqmp_zcu104_defconfig     | 1 +
 >  configs/zynqmp_zcu106_defconfig     | 1 +
 >  7 files changed, 7 insertions(+)

 > diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg
 > index 20d8352c08..0a6aea7a29 100644
 > --- a/board/zynqmp/genimage.cfg
 > +++ b/board/zynqmp/genimage.cfg
 > @@ -3,6 +3,7 @@ image boot.vfat {
 >  		files = {
 >  			"boot.bin",
 >  			"u-boot.itb",
 > +			"qspi.bin",

> I guess you are adding it to the vfat to be able to easily write it from
> the SD card to QSPI from U-Boot / Linux?

> Committed, thanks.

Yes, exactly.  Thanks!

> -- 
> Bye, Peter Korsgaard

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
