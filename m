Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A469C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 10:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1251410CF;
	Fri, 13 May 2022 10:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWiK2hvWKEKt; Fri, 13 May 2022 10:48:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E2BE410B0;
	Fri, 13 May 2022 10:48:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA9C21BF289
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 10:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A74E94055E
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 10:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g46cVnySG0cq for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 10:48:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::61b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0B9740117
 for <buildroot@buildroot.org>; Fri, 13 May 2022 10:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAyRb1OFlsYHGZ/PiKbOeEeGzMrobmoA1O2ODQ8N4/XfWvSXzL4hCEUz+NE4Hy4aqaOF9UUQQbWM7wut3b8LKQys7aK1WPTDLKShDtUqfM5Lkcq/iCjq93GQh3CpVS019AtmRpxxnP+MnSd7ISRbinKPcJNp1KnDTaTj00KQmy48o51YYrYfj4GBWttGnS6Q9GPx7khIq3WI/JaRGQPcY+IjXI6seG9nx8B+spz/Y9c3tSCLoEB0ryzNlRjt/eIbugXrhobUbhKOZaEovT8JPWhkS4/7XgRNoQ4qZedFJXhIzSf1gdMfyx1v9X/FsPDjzUQxLW7CYUvkVfruTquRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTndtkSMcOxtW/YkEs3Z91myafh/X6UMLbexPDKdKIw=;
 b=dS+Jx8e0e9ow193jAnEKNkLQ5Ue0VYcx9FjKVDnRJMzTDbOMwc4byDbsvEK5RTssl4WRBJhS1oY0eJHdQRJ/AsuKo4ZdP2c71B1L9HdJKvCqmz2rYsTgKSCFS/MnnhetyPIdTh37Ma1SyJsKfoZm3bfcL7AYt4AG2E2HS1eXJOO8Pstpe0DzJrOCUeNDKI2LaUY7Bd2SzQzCtdqa107xvJKOmUhYzR6y6HxdOvIKYFoZ+6FwGWNsrcv7eFrMdLX8THrx9U5mNzf3I0AWzGJYBYDXAOeQ/Mmvp8j0iK9mceYQqOblHVzHOvFh8qMB8pIUjIcAoJh4+sXIDEOmeNqZKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTndtkSMcOxtW/YkEs3Z91myafh/X6UMLbexPDKdKIw=;
 b=egWFx1AJ4ZwPXHPqS3Z6yCv2IrESoN0LuKcug3JnboMHnDhEzGF02iRApMyScUM2g6vdMXsLQfS9KVoUruGlG7eYLwI4uygfLaZ9iBmByA4ap85QQFvO6fn+1dn/VY1SPr3bLkn/TtDCrvCx6JIJdjdlZfS3Fg7qNftH8/SENQg=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BN8PR02MB5746.namprd02.prod.outlook.com (2603:10b6:408:b1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 10:48:15 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5250.015; Fri, 13 May 2022
 10:48:15 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Peter Korsgaard
 <peter@korsgaard.com>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CACyHP5oAAHg6ggAAnsZCAACrQ24ABfTcAgAAZeWeAADjQu4AAk5KBgAAxKwCAABaNAIAAB08QgAAchVA=
Date: Fri, 13 May 2022 10:48:15 +0000
Message-ID: <SJ0PR02MB7758610ADD04816CE25C00D9D7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758FE7F237530275606A745D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <875ymcawvb.fsf@dell.be.48ers.dk>
 <56c3feaa-cbd2-eaa9-7800-cd2102fa8545@lucaceresoli.net>
 <D9EEAC86-D8CB-46E0-A019-B0F792B0511C@xilinx.com>
 <874k1ua6mw.fsf@dell.be.48ers.dk>
 <B695963F-1D4C-4D05-B152-54F424FE025B@xilinx.com>
 <200341c2-809e-8d14-686c-8bf838a15df6@lucaceresoli.net>
 <SJ0PR02MB77589186692C36CA8975DE4ED7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758C4D738BDB949E2A2C0DBD7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB7758C4D738BDB949E2A2C0DBD7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13509e40-13e8-49e1-efd5-08da34ce1588
x-ms-traffictypediagnostic: BN8PR02MB5746:EE_
x-microsoft-antispam-prvs: <BN8PR02MB574690B8972EE0DB371AFBBFD7CA9@BN8PR02MB5746.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4uNueLBHA/z/HDSIGubgJvM6jAo1TxxEhOp7VZCEbX9E1OgsCiG0OxgOT7D/tp2/A4LMgctDaUfZtpN4YFCbwoXLDQyaNt3iYFLxL/fpC2l8cN7G2V+XudJT6vWaZJTE8A1+MHPs6Q3GsCQeGFUJzeoknCrARbNcZJ8tcI97EqTueOdVCeDiZFy/+MOOqtXz0EyCAKPDCRqS8Hsm7FMQzwsxUyp6L9t33ctzqqjdwCgbUNkuAnPn6Q1YymcnuNtPOu7oUYV07sXz53ebyO/2qCIcd7MFZP1NYlU0Vkbseu8DsWWyTR5bspxH/1rA2kLcB9vxph9SQ3+Tr2BSUMJ84W7g3LZnMeXPl7wsUk4PtxtXCYbKPQfKi7UmEs0jEuc0ZIBVLytXgaf5KW8jPFCaf2IWerGBKpncr3kADWUzRlLfl0SNY3H9NX6VOIyfXVkl105pzgKb/XLKQgpbK3UBBDGd9kwkvsdpIwjZQ5HKzfV6jMhExS0/Q8juQ8vmt11ulRoa6XTaSxP+sHbw7nAlceTDcLvsibEeKKHipuG5K3xjvAFYkTmevfOkDNgB7sBaHjCVcbcKMpmq3AYgBzL4s1ioRYflpWky1uCOay//0QEncAP3pCfsKTYqEsB0/azxhLEEcNQFh6ca7yW6DicSle8hmko57jKvnuNDx4EGQaf5/FK45mPY1vQb6wRE6IcsCj/k6F3QOh/w3XQC4U0Sgbf/Z43tXjmX2TTm6E6itrR5xndeHt3EhZEzKFl/JyQ61SF0nga1lDXbIRiN7J7c+I6XbRZFf4/vYF2lY/bc04ejIf15BUjmKRw+oUzBwijkeHLq7M74RylSIP+4Tz2hGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(52536014)(66556008)(86362001)(66946007)(66446008)(4326008)(8676002)(76116006)(8936002)(64756008)(33656002)(38070700005)(122000001)(110136005)(54906003)(38100700002)(316002)(7696005)(2906002)(6506007)(66574015)(21470400002)(9686003)(186003)(26005)(83380400001)(2940100002)(5660300002)(966005)(508600001)(71200400001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFJpQVVSNGxTMzRQNG9RYnlLV3ZwYmhlSlpTN3RNcnZNbzNzYnk3Yi9saVZ0?=
 =?utf-8?B?bHdpVjF5T0owc2Mzb3RFMW5XaEZGNWVISnFJMVVWdXBGeHlIUTBKUUxxeng1?=
 =?utf-8?B?WjhHZ3dDZ2pwcnNIbEZUNytzbC9BU3NYMk1YTmNmcVFxRDY3VGJ6TUVmUXJ3?=
 =?utf-8?B?QXd4dHJPK3Q1c1dnbTJrU3R1S2VlVXgxaVkvOE0yaVdiaGZsV0h6R2FSNFFH?=
 =?utf-8?B?T0JWTWJKVHR5TzVEZ3VkYkkvbXk5S2dLK1FDbS9XdHRHbVhKMnUrMXk5RUpu?=
 =?utf-8?B?T2RqcGtTZDV2UUdwWEhZWGpxT1JCTnJ0QzVZWXU0NE5UZnNIQ2ZRU202Tjh5?=
 =?utf-8?B?TmZNb3FhSjVYQ1pnSkxsVlpEeEFiQXhZVjJpMzNLTVpCUEJVcklmYkxyQW56?=
 =?utf-8?B?akRNdlFWUW5aTlJDRCtmRmRMRHYwZDRjVGM5c0hsOGRyK3NJTTFRTXNNcGtM?=
 =?utf-8?B?TWhXL3hMNDJtYlJhZ0hPb05nSE80Lzc5bmYyQ2FubGV2SndFQjN4eGtzdk9J?=
 =?utf-8?B?WmY0ZVF5TVdmdHVKN2hpSG53WlBDMWR4bVgxOVN0aENNb2FGZ0hjMEgvbUk1?=
 =?utf-8?B?RDJxOFJUQUZtU2hBMDdpSWs3S1VDOUpKL1RBYWRBWDNzOVdCazYzQ20xY3kx?=
 =?utf-8?B?WHNvWkZBNVBsQmM4V0Nta3hXclVHTjB5VXR4b2lWVzY4SDd0eEdLZ09ObFhM?=
 =?utf-8?B?ZHBldXZJQ0dEZklHZ2NiZEtpZFZvWUVncUU2U1dRR1RDdkNnVHg4TU5uMmVw?=
 =?utf-8?B?bERjTmtJMUNuV3hVTXZ5YVNnVUVwWmJjM0RJNHZSQXdaN2lGSEozWkN6ei85?=
 =?utf-8?B?SjBiRFQreUE1ZUplbDVBNENla01QWnc0MEtJOVRiUTN4TTZSbitSRUhydUVC?=
 =?utf-8?B?cjBlMUhMamVwTGYwdjJVYmRlSkhNSDdTWHo2M0l5UzZlZTkya0tzR3BTVnNh?=
 =?utf-8?B?Rk84ZlhjYlVkT2NIeDZLZEN3L0RIMndyMkZNQXVoOW45VzVNcy82R3U0Ymhx?=
 =?utf-8?B?anJrYUdMUmg4YzUxUjRscThRZmk1N29qNllYQUowY3gyVnZ0UEU1SnlqVmNt?=
 =?utf-8?B?QmduQnloOW9kOHU3OSs2aGx1TzhOZEd4YUVSalVWWFNCc2N4Tk8rUHFtYlpt?=
 =?utf-8?B?YXlFVzU4Y0JBMGRyam9RTXRJeTdWMEdjN3dyNG9tdzNDbDlmcFJicjNJNXdS?=
 =?utf-8?B?ejFNVFFvKzdEN1VvQUUydUtGdjRSSzFMYnhFYUphMWc4U2tNanZUL0hpZFRp?=
 =?utf-8?B?dk1mcDh4ZzdTV2JNNHFsUEZYdTB3aVZRRmF2VTNkNUlCbXR3ZURldU9YMUJl?=
 =?utf-8?B?ODQybGdoMlBFNmJ6N0FzR1dmWTdkMnUvSGJvTXRrT1VhS29mN2FFN2ZIT2xQ?=
 =?utf-8?B?VHYyV0Z3V2ZWNW9sUXprdEw2R0VocVNiY0NkT1RLYnFGMjBYbkxITXVlWHdQ?=
 =?utf-8?B?L0NRSVpTTlg4QmpiSjd2OWhGVDdYaTNQTHh5czR6YjNZOE5lZkt2ZVRndUtP?=
 =?utf-8?B?ckh3ZVFqcURwSktJeG8yNkdTMzdJenZtTW5najN6Wkl4L2Erd2szY0lQRWpQ?=
 =?utf-8?B?VWlUTmp4YnFNS1E5Yi9CNEJqN1ZTTDkwbDRHOHB4ZW9obWRUUWJsMkdpbHF0?=
 =?utf-8?B?SmlmaUw4UHNmKzdlY3dkNXNuemdueGl4dnE3UEpZbVdIbXpQeXQ3Qm9lSFNB?=
 =?utf-8?B?UFc1TjZaUVVPL2RsZjlQdExiYXBzNU4rTW8yOExXNXh1SEdJeTNDN0MyMEVN?=
 =?utf-8?B?UUw4Y2lPN0lKYzdvaW1zUm1pcUk0UHA3NEl5UGZYUzdLMUVwM1VhS3FnMjBJ?=
 =?utf-8?B?enJ6V1NwME0yRTk5VlpRNUpPditaMG9vY2VSVWZiRmFnWFAwOXpoTDFFc1Ry?=
 =?utf-8?B?d3ZPVjBvczllbFM0Z29GY0twem1lWU9FZjZBVzI1NTlhNk4xTU1JaEs4aHFD?=
 =?utf-8?B?STZncVdQcGZUKzh5QWdhUGYyY2RxVURSS00zNjIyZXpwSVJCRHJSdGpjcDRa?=
 =?utf-8?B?cmp3MDNQVGxnYXk3d2NJZHM0SngrMFErUmttaEFEUHE1MHlLN050L1IwUDNs?=
 =?utf-8?B?Tkt0V1JBVlFEbHRlOUZ3VTVOVFJ4cTRCMG5XUDlKT3NUT2hQV2l2K21rWmxp?=
 =?utf-8?B?Y2VwMUV4aGFkM0xkMjBranZBdktiaVFlUVhQVE5FSlRiUmsvWTlDOHBNZlVB?=
 =?utf-8?B?ZTgrTVBnK010R3lNOG5iU0RZZnF4VnB4R1Y2NWNKUDdiODBLbXBkNWFtS1d0?=
 =?utf-8?B?RmpXb1NGZE95ZkFHbE03MHhndFNxSzd3VVdXK2t1ZVJRY1hja1YvcnpDRzRu?=
 =?utf-8?B?VDRUK3ZWeXFYS2MwTGlIRXkxVml0alA2K29ZRHVSY0FGMm5ZdWxyUT09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13509e40-13e8-49e1-efd5-08da34ce1588
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 10:48:15.4924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0iqinZ15DfwZeRlZD5f9fWZGG+jwA8HM0qbX4mrAPnYWWu+Kyz1FeQDksTkNYvGt92vEJySQp9gL9t0kPBnWBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5746
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Michal Simek <michals@xilinx.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KPiBIaSBQZXRlciwgTHVjYSwNCj4NCj4NCj4NCj4+IExlIDEyIG1haSAyMDIy
IMOgIDIxOjMzLCBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0
IDoNCj4+DQo+PiDvu79DQVVUSU9OOiBUaGlzIG1lc3NhZ2UgaGFzIG9yaWdpbmF0ZWQgZnJvbSBh
biBFeHRlcm5hbCBTb3VyY2UuIFBsZWFzZSB1c2UgcHJvcGVyIGp1ZGdtZW50IGFuZCBjYXV0aW9u
IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcg
dG8gdGhpcyBlbWFpbC4NCj4+DQo+Pg0KPj4+Pj4+PiAiTmVhbCIgPT0gTmVhbCBGcmFnZXIgPG5l
YWxmQHhpbGlueC5jb20+IHdyaXRlczoNCj4+DQo+PiBIaSwNCj4+DQo+Pj4+PiBJIGhhZCB0byBh
bHNvIHBhc3MgdGhlIC1tKiBmbGFncyBpbiBFWFRSQV9DT01QSUxFUl9GTEFHUyB0byBnZXQgaXQg
DQo+Pj4+PiB0byBsaW5rLCBwcmVzdW1hYmx5IHRoZSBwZXRhbGludXggdG9vbGNoYWluIGhhcyBp
bmNvbXBhdGlibGUgDQo+Pj4+PiBkZWZhdWx0cy4gTHVjYSwgYW55IHNwZWNpZmljIHJlYXNvbnMg
dG8gbm90IHBhc3MgQ0ZMQUdTIHRoZXJlPw0KPj4+Pg0KPj4+PiBJJ20gYWZyYWlkIEkgaGF2ZSBu
byByZWFsIGFuc3dlci4gOiggV2hlbiBJIGluaXRpYWxseSB3cm90ZSB0aGUgDQo+Pj4+IHNjcmlw
dCBJIGRpZCBpdCB0byBoYXZlIHRoZSBzYW1lIGxvZ2ljIGFzIHBldGFsaW51eC4gTGF0ZXIgSSBk
aWRuJ3QgDQo+Pj4+IHdhdGNoIGZvciBpdHMgY2hhbmdlcy4gSSB3b3VsZCBsb3ZlIHRvIGJlIGhl
bHBmdWwgYnV0IEkgaGF2ZSBubyANCj4+Pj4gYWNjZXNzIHRvIGEgenlucW1wIGJvYXJkIG5vdy4N
Cj4+DQo+Pj4gV291bGQgaXQgYmUgcG9zc2libGUgZm9yIHlvdSB0byBqdXN0IGltcGxlbWVudCB0
aGUgY2hhbmdlcyB0aGF0IA0KPj4+IFBldGVyIGhhcyBwcm9wb3NlZD8gIFBldGVyIGFwcGVhcnMg
dG8gaGF2ZSBhbHJlYWR5IGlkZW50aWZpZWQgYSBzb2x1dGlvbi4NCj4+DQo+Pj4gQm90aCBQZXRl
ciBhbmQgSSBoYXZlIHpjdTEwNiBib2FyZHMsIHNvIHdlIGNhbiBib3RoIHRlc3QgYW5kIHZlcmlm
eSANCj4+PiB0aGUgdXBkYXRlIHdvcmtzLg0KPj4NCj4+IFNvcnJ5LCB0aGF0IGlzIG5vdCB0cnVl
LiBJIGhhdmVuJ3QgZm91bmQgdGhlIG1hZ2ljIGluY2FybmF0aW9uIHRvIGdldCANCj4+IGEgd29y
a2luZyBwbXVmdyBidWlsZCB3aXRoIHRoZSB0b29sY2hhaW4gYnVpbHQgYnkgY3Jvc3N0b29sLW5n
LiBNeSANCj4+IGRpZmYgd2FzIGp1c3QgdG8gc2hvdyB3aGF0IEkgaGFkIHRvIGNoYW5nZSB0byBh
ZGp1c3QgDQo+PiB6eW5xbXAtcG11ZnctYnVpbGRlciB0byB1c2UgYSBwZXRhbGludXggdG9vbGNo
YWluLg0KPj4NCj4NCj4gSXMgdGhlcmUgYSByZWFzb24gd2h5IHdlIGNhbm5vdCBjaGFuZ2UgdGhl
IHp5bnFtcC1wbXVmdy1idWlsZGVyIHRvIGRvd25sb2FkIHRoZSBzYW1lIHRvb2xjaGFpbiB0aGF0
IHBldGFsaW51eCB1c2VzIGFzIHRoZSBjcm9zc3Rvb2wtbmcgdG9vbGNoYWluPw0KDQo+IENhbiB5
b3UgcG9pbnQgdG8gd2hlcmUgdGhlIHBldGFsaW51eCB0b29sY2hhaW4gY29tZXMgZnJvbT8NCg0K
PiBJZiBwZXRhbGludXggdXNlcyBhIHB1YmxpY2x5IGF2YWlsYWJsZSBwcmVidWlsdCB0b29sY2hh
aW4sIHBvc3NpYmx5IHdpdGggc291cmNlcyBhdmFpbGFibGUsIHRoZW4gdGhpcyBjb3VsZCBiZSBj
b25zaWRlcmVkLg0KDQo+IEhvd2V2ZXIgSSBzdXNwZWN0IGl0IGRvZXMgdXNlIGEgdG9vbGNoYWlu
IHRoYXQgaXMgc2hpcHBlZCBieSBWaXRpcy4gSWYgaXQgaXMgdGhlIGNhc2UsIHRoZW4gaXQncyBu
b3QgYW4gb3B0aW9uIGhlcmUuDQoNCj4gVGhlIGVzdCBvcHRpb24gd291bGQgYmUgdG8gZml4IHRo
ZSBjdC1uZyB0b29sY2hhaW4gb2YgY291cnNlLCBidXQgSSdtIA0KPiBhZnJhaWQgSSBjYW5ub3Qg
YmUgdmVyeSBoZWxwZnVsIG9uIHRoaXMsIGVzcGVjaWFsbHkgd2l0aG91dCBhbiANCj4gaGFyZHdh
cmUgdG8gdGVzdC4gOigNCg0KPiBWaXRpcyBhbmQgUGV0YUxpbnV4IDIwMjIuMSB1c2UgR0NDIGNv
bXBpbGVyIDExLjIuMCB3aXRoIHRoZSBmb2xsb3dpbmcgcGF0Y2ggc2V0Og0KPiBodHRwczovL2dp
dGh1Yi5jb20vWGlsaW54L21ldGEteGlsaW54L3RyZWUveGxueC1yZWwtdjIwMjIuMS9tZXRhLW1p
Y3JvDQo+IGJsYXplL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMQ0KDQo+IEZlZWwgZnJlZSB0
byBwaWNrIHlvdXIgbWlycm9yIHNpdGUgZm9yIHRoZSBHQ0MgMTEuMi4wIGRvd25sb2FkLg0KDQo+
IEFub3RoZXIgYWx0ZXJuYXRpdmUgaXMgdG8ganVzdCBkb3dubG9hZCB0aGUgcHJlLWJ1aWx0IGNv
bXBpbGVyIGRpcmVjdGx5IGZyb20gdGhlIFhpbGlueCB3ZWJzaXRlOg0KPiBodHRwczovL3d3dy54
aWxpbnguY29tL3Byb2R1Y3RzL2Rlc2lnbi10b29scy9ndWVzdC1yZXNvdXJjZXMuaHRtbCNnbnUy
MDIyDQo+IGh0dHBzOi8vd3d3LnhpbGlueC5jb20vYmluL3B1YmxpYy9vcGVuRG93bmxvYWQ/Zmls
ZW5hbWU9Z2NjLXhsbngtMTFfMl8wLXJlbGVhc2UuemlwDQoNCj4gVGhlbiB5b3UgYXJlIHN1cmUg
dG8gaGF2ZSB0aGUgZXhhY3Qgc2FtZSBjb21waWxlciBQZXRhTGludXggYW5kIFZpdGlzIGFyZSB1
c2luZywgYW5kIHlvdSBkbyBub3QgbmVlZCB0byB3b3JyeSBhYm91dCBidWlsZGluZyB0aGUgdG9v
bGNoYWluLg0KDQpTbWFsbCBjb3JyZWN0aW9uLiAgWW91IHN0aWxsIG5lZWQgdG8gYnVpbGQgdGhl
IGNvbXBpbGVyIGFmdGVyIGRvd25sb2FkaW5nIGl0IGZyb20gdGhlIFhpbGlueCByZWxlYXNlIHNp
dGUuDQoNCldoYXQgZG8geW91IHRoaW5rPyAgQ291bGQgd2Ugc3dpdGNoIHRvIHRoZSBzYW1lIEdD
QyAxMS4yLjAgY29tcGlsZXIgdGhhdCBQZXRhTGludXggdXNlcz8NCg0KQmVzdCByZWdhcmRzLA0K
TmVhbCBGcmFnZXINCkFNRA0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
