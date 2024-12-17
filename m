Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AC1E7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 18:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5403E80E03;
	Tue, 17 Dec 2024 18:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhsH9Z4E8b2t; Tue, 17 Dec 2024 18:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A41180DDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A41180DDB;
	Tue, 17 Dec 2024 18:57:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BCCAE3
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 790124145F
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDpsvug1mpaF for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 18:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2406::610;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02C9C41455
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02C9C41455
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::610])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02C9C41455
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 18:57:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiSTpqsewf08QDdkzmTOWKCDNpfJQKa5geDT9CDbjtw0eex/jJjkM6zF9GRKv4ttcIkK1DjEla/sKe9REvFdNTAVSeX29llV0mxzY6rL7Zs/bJ2znVWRo67eY/221qvgpFByy5dlNMPB/pUmueNdytkg3iNjA9C4xzQP9RlGNCoP6c887jlv5qeeZNdAf/K3yOSFxPb2hG8h9KSBy501edbiqFk2Pd0k2TC1n3tAqZaIoNINvD9IEn0X5iDTxuh6r+dmAjeLiKMObxvodfRIflTfbWu7aQr69kVOuP482e4RumQh1aMGW3j+/at2UqonT0Ag1iL+yjAvQSi4j6oyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4UNlC0VIH+GmyijrdAiyUmHUEQijGW30MxNn0iUj+I=;
 b=xuu5CpkUFCjGpPaChgnXlY0hbtKEqVVm4M+e8Wvfp4e3Rbka+mBp8KoF5kxJlPYE3bNuMRflXppKn+L9tvPYIs+5sipSaj1eSPhcE4T2GJnZnAjfkQK38N4MNpXcLd8o6nBjt1BC2n4eBLMXrIPhXUAVf1dpeNZfTekZd0j/WzAsJ7XjLmtc3dPovUliaMi4XPnpCSysDjNpNIny8CzoYsy0BrzP4FwquE5p/zFHNzP7qb/ZhwTd46io5JZ5kf4Lts4pC4DAkpV6wcs+YdGKq0VqY/KEbHm1n4SAClqpSXhuIuhfghb/HKUp3jAJwSou0vhEDMeu+Jb0ryn6xxN4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS0PR12MB7677.namprd12.prod.outlook.com (2603:10b6:8:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 18:57:28 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 18:57:28 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 1/2] configs/zynqmp_kria_kd240_defconfig: bump to
 xilinx-v2024.1
Thread-Index: AQHawTEMoyu+eO8XaUWWah1EeSt8SbLlTKkAgAAEJQCAAADvkIAGHYYAgABLwOCAABwTAIAAETDw
Date: Tue, 17 Dec 2024 18:57:28 +0000
Message-ID: <CH2PR12MB50045C6523807AB13F78D361F0042@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240618033849.2389758-1-neal.frager@amd.com>
 <20241213150136.0c434b72@booty>
 <1b302d1b-723e-4347-99a4-c2491b072850@amd.com>
 <CH2PR12MB5004F72DCFC7CAE9556FBB4EF0382@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20241217124300.64fe7fa9@booty>
 <CH2PR12MB50046ADE8AB8B917D43F476AF0042@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20241217185436.3751ffc5@booty>
In-Reply-To: <20241217185436.3751ffc5@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS0PR12MB7677:EE_
x-ms-office365-filtering-correlation-id: d9702898-a4c9-48a0-a8b4-08dd1ecca757
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AQL7UFhM7FkEKUVJlguyPGGJcdnvusCGMRUbqe8+wV6unouDmYvtXxgRysuf?=
 =?us-ascii?Q?KPZC/bSmbVCrXdQxENwANCHn0kJ1YEebwvdUKHClL1BNo+wA+ZuZ/PcKLpX9?=
 =?us-ascii?Q?21k/NHAc5FCi+1r2DznEnfdJDJZIknewi/Ep0G9G/eKx7+9ATkYg8/AiQmlS?=
 =?us-ascii?Q?l3VpepvxL2BiupaxbzKbpfINxnuH5lIW8cF/HcJDgjAad8By1oGUgL/c0JwS?=
 =?us-ascii?Q?gB62nj9KKrrQxnGRGAKQEbR5hz7M53Rpf7uhx/e6gvNPeaiOHq1wk7ohhvuV?=
 =?us-ascii?Q?FKEKsDwn8KxWn1TmPiGFezowELh7n8v/oRLT/fYh0Vxae5i7ge6gHyvj2TCm?=
 =?us-ascii?Q?odI3n+zddkTimEsKjtjZBZV9V0lvbxzWJjF2MHmQW6s1iHErwZB8CyjNJ3Bp?=
 =?us-ascii?Q?8CKu0d4eY/qmI/PI5qApYyLb6jyfx9WnSkofRZhfKR4Gc27SPoZ1M89QvEyq?=
 =?us-ascii?Q?0PJr9bH1C6/Ld1TBR04b1UeH6Ak2y98r5Hpm+Br77h4mIRxq0ztE9g3N4riZ?=
 =?us-ascii?Q?irXsPm3dEJB5WeMVLZqkNlSCbOh62xP1cao+wGwj/wIDechZ3uWBPtvi7bDb?=
 =?us-ascii?Q?XCQAjvHqlczyXQTUbkfPNdD6fsY49ICWCZPnKlj6/CNOHHBFJKiulqllNgV0?=
 =?us-ascii?Q?7lzFkaO63b0VvDbi2kFMjDzuQV2POVZDh35Jn5wiVMZOs9Ukyw1ZX+0zPKds?=
 =?us-ascii?Q?f0l7fMwU1BdrXousoGrjZ/QteMWRX23SSLfN5qnbXJmt1gQxCsWGzHY0pIOn?=
 =?us-ascii?Q?I89mvVCuew0eSCZn+U6TStBCAyln3qZQ8D1tEFBdbfCdyEOqDAaY/Ok9NN4c?=
 =?us-ascii?Q?OORtnDmUcWiO95k8LN3YhcSydTucCZSXn7YIhRZ6J9k4M8iHS1nuvQfxuG6A?=
 =?us-ascii?Q?EfMn38PhUpBhQZ7LrjmOqN0rwmV+iXcveDvGbufBJdSJaslFGR/G64tr3SEH?=
 =?us-ascii?Q?XF0g/nOW49Xts11UDesGPVHTI+gdVtvhyX0Xd8SnWmitlCcd52fUY+iTpbFE?=
 =?us-ascii?Q?+VaLueRBt1Mnpf3Jox8KheM7asQQFp+dA4uc/cMEli4Qr4hP5s6XCney9eQk?=
 =?us-ascii?Q?jFlU3ppYCGMTt2pIMkwGz9PhqG67Bt1RGtUt3n09aYi2Q42TmeQMI4wIug23?=
 =?us-ascii?Q?UV6GXGwdgJ5dTOvDecqOjW7WyHDXBchO+OvKT2chxbT7BI3DIT3nqv90MY2r?=
 =?us-ascii?Q?P9jMlsdfb99o16dg381w7kLnOcDK2QVopWaHcuZsydTwFmZ7Xz3wL2aYss3p?=
 =?us-ascii?Q?+wgWBe+KQbVo6ehPcvAxFInF/jrnXOrB2nEl88244hitmn6hn/TW55A7wXMk?=
 =?us-ascii?Q?r2JpNWtnxBUKoBPX4jVhtkWigsmh5FwGv410FAL1dMTTwP64o1VIdWzV9wbY?=
 =?us-ascii?Q?f/HdeMfr6MjF14jBeiT0lzTa107MuK0OFpOB64USr0aYGtniacoYMlQbKhD5?=
 =?us-ascii?Q?lcIvtftb5P4eFi8SuZOyARUYK1MXCGiAnUg/1DLWNz3S/GPffSCCNWiYQk/+?=
 =?us-ascii?Q?ZMTd3ps4oBOmTcw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZCGnOn23GxPjo21JvzPONTjmpqEPzoJlcRouABw9Z+dxm46l/QTpEdJvE36S?=
 =?us-ascii?Q?PsFxsIwHw2YPAxigOUGJLCNaVWWA2JlgLpyOCrPQX3rTEv6zbzoDbEg48N1l?=
 =?us-ascii?Q?GWeZRw44asbzd4ZIDvlKoxVPY3v5bXTq0V9qIeBOjCL+Y1tpFro++dZ7ZN6V?=
 =?us-ascii?Q?Ix0y3GgG/Qqy7NQW+kWeDKf1cMpeufaRLBx4Of/QHoMemrK/Mn9tG70pZbC4?=
 =?us-ascii?Q?5sZHV5HlqL4u32XkRfU2yiyeMX+W8bPUCz7Z9rWb0QI3WjNV/MWoxkNW1Fdg?=
 =?us-ascii?Q?g/Az/vgpoZTtEBxe87WlXfC1Hcyaj4X8KhLY3Np3poFmG9O+5WjsW4LJN3Lb?=
 =?us-ascii?Q?eNzGLoEXqgBiOEL05705TkPVAbpLYWbXC6rgWs76kw+QtoCw7I/uOMtM1Nen?=
 =?us-ascii?Q?Qv2PsCY0pCAf++eCdlqk1O90/FCbXnTjKH+3rxaOL9zDVUfsaeZz0JTuZwGh?=
 =?us-ascii?Q?iyByRAaVXx1lOlCgy67BylZpt1DQs70EvV0oVlPC0lqafadPwRunwaqOvJeQ?=
 =?us-ascii?Q?G1cTUe57K5qb2qFuovd2q9HGmAkPV2ln5BcldP6LVbq4s/+xjWnKU28z6BO8?=
 =?us-ascii?Q?IBQ7o5/UtwdygL4l1orGjYgblB1q99PuW6FjYElBwhnfIli2uQqBXJLIqpWn?=
 =?us-ascii?Q?98YqDdyIPRnLRWHOdBpF5NlMx464MiB7EstywBd9N/oKVgC8wi6/t/9Nhl7u?=
 =?us-ascii?Q?yOWniYtJL4kZytsGwYGcuoCjP5nHubU3dj/72OLGj51NqQx0AwTOYUyOqYqK?=
 =?us-ascii?Q?ZE+dszYNoO1IDhudZq2BSWq1hmMc9zC4sk5gGEXrkj9jrKzd1vakrLSIAMyy?=
 =?us-ascii?Q?vCWsqwusjNxoMrrO78rj7OwphD5jFQwKICO4N0qKqMmIELVVEx905+EGvOjb?=
 =?us-ascii?Q?n1izd2lACpAxXeF/vkbNtnPLpyZGAY9mGlKNyqmYh4NURHxyM0RXQnevejxi?=
 =?us-ascii?Q?E4KoamFCtQ/e7d3aphfYsrH5j+tvPASTU3QStqhba9M+axXD21zFE9uodv/2?=
 =?us-ascii?Q?2GEVLyc5hyW1Je014HtnVFN2Z7Gf5/sZ6VY/i8z47c6i4qRNR7SkAI9DCkg5?=
 =?us-ascii?Q?CU9pBfDxeN4ZQ9NHWpw9XmWBmnVTDMwsAx7Z2kjzF2nMD6cBW8WQ4yDhW6NO?=
 =?us-ascii?Q?TgqddDAMboA87S/cMyzQ7MMkQUDwU/cTKLgwix3nV8hSXzjZXI2ubK6lGZcP?=
 =?us-ascii?Q?202wUNRb9zpeI0582R3a0QzbFuQFCzwyvSuRN9QNRQGXoBFHwP0RJHLo8NjZ?=
 =?us-ascii?Q?Ns97ZAKR7Ui4iJ1qUqwjucGFrl/vjvT4f+zUMa02i+L4BIz1HoiF5xVxB9Sv?=
 =?us-ascii?Q?JLGzpZkSuCXmDaVgez0V8gDs463tsVrOgOd/RtGcNFCSrHye4KpTikqzw34k?=
 =?us-ascii?Q?x0kfsdf3e36OUUml/zE9Kf4I3o3zON/4NtHjkhBHTU61F6XSCrUWEHrM1QWg?=
 =?us-ascii?Q?UlerbJv/ZgEC8wQ4G0NGQ0g7+0dTAZ/GRW3JVys2PxkTa14VszMm8K2aBv6E?=
 =?us-ascii?Q?W0UvV0d3Y06Sz6yjjnaosfzu6LnaZa0G7PVXQbR9okgzhCIdr6OhAmDgmN2P?=
 =?us-ascii?Q?s6d2bms5UX424i1GNCo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9702898-a4c9-48a0-a8b4-08dd1ecca757
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 18:57:28.5645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W8DN9RdrDeSC17bNld4w5wWngneTgxDZwETULuAxPej9GD+BRX1XsujPK5bfWgis
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7677
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4UNlC0VIH+GmyijrdAiyUmHUEQijGW30MxNn0iUj+I=;
 b=gstom38uoo3HtITWzRrkzCe+YAkjQR8+wYZYz0ekbhDzJCajJIg6VSeZjhqSH9HBAF7ZiI4HSOBDHtVh7zLXTMV06GVkaO14btrRt+o569TBO662AQofzFQYM/SCAqMf7AyxNK3aAHBoWOfxb5n8D/S+wZ1hkgvza78ch7x+XqE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=gstom38u
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/zynqmp_kria_kd240_defconfig:
 bump to xilinx-v2024.1
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,



> > @Luca, that said, I think we do not need your patch.  Once we have the next
> > u-boot release tag (it is coming sooner than 2025.1), we will have binman
> > support which will clean up the SBIRT issue naturally with the qspi.bin.  
> 
> > That solution obviously looks way better. And if it is coming "soon",
> > I'm not going to send any patch to implement the cp+dd trick.  
> 
> > Thanks both for the info.  
> 
> You can find the binman patch here:
> https://lore.kernel.org/all/35bc47a4a4799c5f5dbea56a45340a2810538330.1730452668.git.michal.simek@amd.com/
> 
> Along with the definition of the qspi.bin file:
> 
> +#ifdef CONFIG_SYS_SPI_U_BOOT_OFFS
> +		/* Full QSPI image for recovery app */
> +		image {
> +			filename = "qspi.bin";
> +			pad-byte = <0>;
> +
> +			blob-ext@1 {
> +				offset = <0x0>;
> +				filename = "boot.bin";
> +			};
> +			blob-ext@2 {
> +				offset = <CONFIG_SYS_SPI_U_BOOT_OFFS>;
> +				filename = "u-boot.itb";
> +			};
> +			fdtmap {
> +			};
> +		};
> +#endif
> 
> As the patch is already submitted upstream, perhaps I could go ahead and add
> it to buildroot for the kria defconfigs.  This way, we can add this support
> now, and then back the patch out of buildroot as soon as it is included in a
> release.
> 
> Does that work for you?

> The patch is already in the U-Boot next branch, thus I'd say yes, it
> makes sense.

> However I think it won't work for the KV260 due to the quirk in
> board/zynqmp/kria/kv260/kv260.sh. Any progress on that one?

Thanks to binman, the post-build kv260.sh will no longer be needed.  The
u-boot.itb will have all the dtbs for the k26 som, and u-boot will auto-detect
the correct one.  So when we migrate to the new version, the kv260.sh,
kr260.sh and kd240.sh will be deprecated.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
