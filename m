Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4401E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 17:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92BC660767;
	Tue,  7 Jan 2025 17:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9g_byY1RvAAN; Tue,  7 Jan 2025 17:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22299606F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22299606F2;
	Tue,  7 Jan 2025 17:20:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C96A6B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A62980834
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rE05UZnztpp0 for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 17:20:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::623;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A39B80DC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A39B80DC5
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::623])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A39B80DC5
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:20:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WT548PLYOqKyRDm+CzirECvBiPgNa/YqfrekljJbQhcIfD8fVd1V9Usja0QtjeHQqSiqtEJtiZDvLxgoy5fdb3GTGerwrO4P7r36hB4E+nN1RIQg21250cQpUoQ64dxVI8g4ZfNm2EdLMrRGU7m6elO+OBWPe/YSPBhNM3dvkGqYMmJIVKqFvKAV+rzhZK3KqaaWgM4s4QBKKPLq7HvAn1UQh1hJVJbvr2EV2hsivpA1UnCT25xZeTeWEvivtx33wWr9LOsqnn9RuAevHLsvvZVEmg9HsHr5maLX3qkhkjZs9Rbj9jmCYapKTjg8Bb9Dnc2QSqiAzIqaU1yus0Bshw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQl+dIL0CTRj+9KE85JjAGVD3re7IjvmjxqyOu+qep8=;
 b=WVZt8rWXYzoCsfJRq8r9iQF/1DetQRcrMWXgEixpR+yiEwJlV73zuE0J2miO0LOXXvJQm10FmB9zoMhjFmu02JJGjxrxdqU9Wux01s+H5juckqbM5BFNclXIkUU5fYB24DhXaM1hZrj/vxAKHoChOjZz8dLiwS7G928mNMh40vap3sPq8SVqwioK1QoHu+rZm//OIcLoh2Y71HPyUiMZj71NUGcJ0Wkm/FedvpuHNmKAh9DWGz8VaLoPOmspwU5f1Zg6kNhjdPCYVQ6aX1hrJ6BpE3jKX9Jr9G1k6Ka9qVZb/0/ozggM41pUvZMxRIOFVGF03U3MWaA8cC4N+6JwPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MW4PR12MB6684.namprd12.prod.outlook.com (2603:10b6:303:1ee::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 17:20:13 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 17:20:13 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 1/6] boot/uboot: binman generates u-boot.itb
Thread-Index: AQHbYM3SSI5DOZogoEaP7D9rl77QrbMLjluAgAAAjOA=
Date: Tue, 7 Jan 2025 17:20:12 +0000
Message-ID: <CH2PR12MB5004F3A488D821F8C7AD0092F0112@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20250107063136.787314-1-neal.frager@amd.com>
 <20250107181709.13aef4d2@booty>
In-Reply-To: <20250107181709.13aef4d2@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MW4PR12MB6684:EE_
x-ms-office365-filtering-correlation-id: 7604bee1-d00a-4940-3718-08dd2f3f8bc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aVyjJvV+B5Jo1l11b64xmF/i0/gnWZXciti532ZQg5Sg1FdXsh+w8hfhcPMc?=
 =?us-ascii?Q?bfCsEtoQaNWETmu42xXWi3u2bByNtz563WlQHVtkWeUcxtjWQ+qF+8A76TiX?=
 =?us-ascii?Q?OadweGbQpQEYyXU8U4ZZ7KDIZJ8RMauKaaPbAsdj3gEQett89x4gp4H6S9Qv?=
 =?us-ascii?Q?jGrr1exFXJ7JLf2bEN6lEs+4yKfqM9ydQx+Gmrql/1DA2apXjAIO1mXHdQND?=
 =?us-ascii?Q?dsuXjPl+fIysMhyGjwTnffVZf4aWNARPdyJi0UY8LH2v8mMVuV/JkmZA4lYH?=
 =?us-ascii?Q?5ZVWwEQ0ezg2gGmItgjLW3SOzsGAJRoYH7onweac9bAHjVOeSEa1v1Dai+Um?=
 =?us-ascii?Q?XeL+HlqADukNCdbneESQ8KVz6AFKeUwg/ljRFXLOi/mCWplHdCouNUuN2OKZ?=
 =?us-ascii?Q?Jqi6msy9EMsOHLqYCGpE7insfSeGPsQ19kLcjVgGfUhCD5UJiSRNtd+68Hx+?=
 =?us-ascii?Q?/wGTzYpBdUAY1DEmWAQsPgDlSeSauAXIOMf39znw5EMPFxZqW3hyb3lbkFaa?=
 =?us-ascii?Q?8VLGy2AvAwLWdrCOVbF1z5TiWeOJdoPfOTHfOtrpUpCKFgf5iVfgKiCq+nsQ?=
 =?us-ascii?Q?MFXxzv1iD/It4wDAiBiksx89eEOSb5JrtluZeGuUmpGOjKxXeSf0TfLAKUR0?=
 =?us-ascii?Q?Zjmm+YBr8dN9LTKdFCMaKTfrN2jJYbMYdvoIy5U+L5QGfveZTNbyDM6J6VlY?=
 =?us-ascii?Q?2Z1ch1CB1SN00ljstXPi0ntstDYNKXDKRXkxzHc9eGtM11dE7r30lP1IXD/y?=
 =?us-ascii?Q?9uctmyQYs4LNM0QSQpUk5IWbYCD6ZpUPMd/6l8LY1gDqQIPn1JAirOcyiQIO?=
 =?us-ascii?Q?NJuwFjwfwxpgcnjsjTKzjsbUX/B/VUjKTMXO/pBSF+926O7ZheWgtuJ6iAe2?=
 =?us-ascii?Q?2MFET2BziQQKsXjYgThafcwFDkEMPKSmdm7LMzKC35ASEJjIWLR9PjjXOrYy?=
 =?us-ascii?Q?BBNAzNkVKBhLRMepkVeP079WeaBW/nBQV+URc718q3vSvMSt0PRnCIdvO0dT?=
 =?us-ascii?Q?dJVQRZo821RUwmTAr6SJzepEBOwt5PB+EcqcOR86iJIzSwvobqYpcX8oIrVT?=
 =?us-ascii?Q?Y/6LGSH593H2FLgbDaxFy/qUjudcFFX+8xji1uFkLLp4P1MpC1fm6dp9EiPA?=
 =?us-ascii?Q?JKqKyJVzPSRWjr2eabWlw7HxlNnUb06ZPB6g97N48t4P/bX/EJPoO1PEH7R7?=
 =?us-ascii?Q?NipW57lAGTt+THv6AeQsvT4xeEh0d+94ANlwPpcMbbse2XTFy8RMdUj94dhD?=
 =?us-ascii?Q?7JwJcecEKjQ1XkTqPozspFIYgrpnDTdXcN0IU9nfS+Di8HYdky0eB4i1AiSk?=
 =?us-ascii?Q?7/zTdmTbkWHLQX5GzQWrXxlEpwbxsILkppO62qWrzVmLdvUdzOvrGLqhPvlj?=
 =?us-ascii?Q?zbV8PpW5ogpihtJ4FMPNSDwIqcDdfZFzor3X+XmrqbmYHPnTPRSwasTNZIvb?=
 =?us-ascii?Q?/sheiobLfu4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IpB5wQZVPcZg5pGrLQNU5cy+89vERpM0higc9Es9oWQgb+PuL0J/Gh7wq27h?=
 =?us-ascii?Q?QUH6uaZFjX9gBtK7td/gVUJ3kccqzwAi3L+kfY72uly7CA+tBU1oog/ks4W6?=
 =?us-ascii?Q?gWeXyQxGanTghMCB/ZDbi+4ox6WkYe4pVEjn7vggjj6JJG8JEUvHzQOcVyfN?=
 =?us-ascii?Q?rRqQiWPTi2T9YD6EEn8bKWMxlVw0isRpSzqIQGvrzJ17qlDNhhiC9zeHRXCX?=
 =?us-ascii?Q?HMUwlwpFgsIRPMWBDA4q6T4eLJD0NmwNnagW941AYqlNvsP/voFDdlqt8scl?=
 =?us-ascii?Q?+0Yf3mAkFIuQACSuYhpXh9VrLlfJS/GFBUBffQftHfO5hbl4qXKrPH+x+vk5?=
 =?us-ascii?Q?M6EQesr6AM8aclPOfiweWAH2bQDUOtd7LDP522t/Zk0tKoJ5NY4WNe0wnbCt?=
 =?us-ascii?Q?h1H2OLqSSQmzZ9J1/1fgGpcWkWt2MxAKK0qGYmEbizAipNQB5Ej493scTMiN?=
 =?us-ascii?Q?Ke4WB74llQjWi4jI4lg31xqj07zzC+HqU0nxiXZAAXxv04u+IohBjd4NBEYb?=
 =?us-ascii?Q?1m8UyC/Pjtdaddu3q5ssF0VCGzgHZI+4FqBAZqt2YKbf8onStxajq/tcX5pL?=
 =?us-ascii?Q?GhjVRGcKUlozWJLVgZn4mBwz1OuVdkMCvhrRzi82daPifmgmFYTc34TszcDI?=
 =?us-ascii?Q?02mwkS1AuX4t7g1vBtEDC4tCdfqA5YSR0mWT/69axxvAFfSAfzWUSgqiLDrL?=
 =?us-ascii?Q?bBT6aNjnFX91ByEB2+uuYNYXzLIWJwmZ6aD+6htzmeK3RfkiOco/iqGL5fxR?=
 =?us-ascii?Q?28GAGoXtoeHgU3/GfHPNZFw3bANXUG1AZNq4MSdYN6/WEokHXcFcwPO4e5bA?=
 =?us-ascii?Q?xOqjgywkWrs0UTrwBQ6iF2lGY9Yr77VTmb4rkOf7vlFSRn7XUntBPVMXgD6t?=
 =?us-ascii?Q?Mh6kMCoOrA+kuNsyi6LVBm2xHXpp6PsTHGBU5suw4UeiFT3bFDArAqhXPecx?=
 =?us-ascii?Q?Mm+QNIwGUU0+BDnxeaYjPA+ugGkXZMipEh4ErwIxvVv3kvWBi67dBgvh0o3P?=
 =?us-ascii?Q?qh26AS2FqJEZWHvLBY0CypoZIoS1hGd8AsYvzF1YZTJuuimZqnr3JmveIe1f?=
 =?us-ascii?Q?UXyTh85zEhaLCPWv9da6tLOVlc4bLbEd26dKdCaO5Wg9LyIh1s3ApB+CzE8z?=
 =?us-ascii?Q?DyHwMYyHfdYEJf/tVn7pQ5gZ8Wy/6EpfEUE5mR4X3DdLZjpb9XG4souMs+5T?=
 =?us-ascii?Q?IQGh7BzcQkBh+o7wWFIaI8DxC+5fJ1aVNZd1p7DdKIWVP07z7xFr6HMqxc4A?=
 =?us-ascii?Q?3jvih2O3YcYqmEt1aAiSOn1csxtkl+mgsJbDUxfFk0uJROQysvBnpLI3Eow1?=
 =?us-ascii?Q?MYl/O5UD07xO8QzdamDGVtIBxAU3DzQFoNGQNw8E+eH72lTK9c+Bf9KytLD1?=
 =?us-ascii?Q?FtChRJuf9d2oj7pgfu3xjyvn/+RaRdQ6UicBefK5Q+uY60rqiUT1Qq3aqRdo?=
 =?us-ascii?Q?GRDLWxOdFoQEWzKfNLbBmzkahjYaO5E5x94E8MuWEJboUPhjAbkgjQUWbojN?=
 =?us-ascii?Q?gUgX1fGoBbVIqaHlqVsX0smRYD4/PejQxorbJugG01gT86tzS0lfmRbeqIiC?=
 =?us-ascii?Q?Si83sODFlII4el9YInY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7604bee1-d00a-4940-3718-08dd2f3f8bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 17:20:13.0123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DUyFSnSb6OBID1THK1dXREgxjRDjAWa8R149dcjGnPHgNbOIPxOOeQOSrYNiCQm1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6684
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQl+dIL0CTRj+9KE85JjAGVD3re7IjvmjxqyOu+qep8=;
 b=yKMIwe0JMdB+aennzbTOD4TDH1GkNCC4j2IinuK6rS+lXnv86dwp/ji9FJd4zujkF5KJOKIyPocn6yskVI+tEVKGoYbomrZdZaelisuab4AO27eC6sOsbz7ip6eNy+oBCH4UvPd9xBUMOuqG0Oa5py0r3XeohUjITz6ZU1BcriU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yKMIwe0J
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/6] boot/uboot: binman generates
 u-boot.itb
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> When using binman to generate u-boot images, there will no longer be a make
> rule for generating files produced by binman.  However, these files will still
> need to be installed to the output/images directory.
> 
> One such file is the u-boot.itb.  If the u-boot.itb is generated by binman,
> then the file still needs to be copied, but without the make rule.
> 
> Here is an example of how binman generates the u-boot.itb:
> https://source.denx.de/u-boot/u-boot/-/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> [Tested on Kria KV260 starter kit]
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

It worked this time!

Thanks again for the review and test!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
