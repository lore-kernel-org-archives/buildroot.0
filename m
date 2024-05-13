Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86D2C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B13B60611;
	Mon, 13 May 2024 20:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oCqLqLg-vaU; Mon, 13 May 2024 20:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 067586065D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 067586065D;
	Mon, 13 May 2024 20:04:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59A141BF34E
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 408774018D
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIbtdccJhc6X for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:04:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=210.130.202.134;
 helo=mo-csw.securemx.jp; envelope-from=nick.whitlock@eizo.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C0F50400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0F50400B8
Received: from mo-csw.securemx.jp (mo-csw1800.securemx.jp [210.130.202.134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0F50400B8
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:04:03 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 44DK40Z82069213;
 Tue, 14 May 2024 05:04:01 +0900
X-Iguazu-Qid: 2yAbrn6vFfi6LfxN4L
X-Iguazu-QSIG: v=2; s=0; t=1715630640; q=2yAbrn6vFfi6LfxN4L;
 m=J4O+XqI3KvOC7CDw4dqaQWwI1UA/ZEdQCkA5u3rFPrY=
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp17010002.outbound.protection.outlook.com [40.93.73.2])
 by relay.securemx.jp (mx-mr1803) id 44DK3wbh3998951
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 May 2024 05:03:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8x4EqwhlVL9sNi3GJGjhvvqSDZI6s7jt/vl5XX6+gWR9S0Jv8Pb2vScxLKUT0asUSc6sAdfEPwqWHUFZVTrd6QUFFgsGb8ea2/wW0/SIhXz6gi++XiuFdjDYp2WpR+n9qif87cABfDovb8wy7lsXDmKla1Sj86Aoqznil5Bm18GM+49PXnlitzlY9aNURLEzGlyvYpbU7zmeA4KKNeFtPijs5bcHvcEotM68OwoYMdTIohRK/KGjG/Im32IAo6Iup8dOSNhFC8wr451hFUaRSd06Rt0nGTfu7PiyadiMmDCcVUpc5Y0HJ/mE7JIUa+PleYjmK+B5sqSdYc96rJxwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZmNFQg5rUzBvd8nGj47fCXTJOlx0XaKnzKhxvnCchY=;
 b=UT6WjZQFjpdShdRvEh0M6dDJ+dDOwljGfu3GTGjDSarVEyfuyklVG5Yw3UowpzVDOeRRz+JBO9mBz7250Im8CUTm7U2Nvj9ulXXwaAmjA2LuMJExfcsUbx4U/JhncBcNgehkmPUDxV2RbEeWg2dghr/E5ZTk1H9kuiCFtkovSfqzJ8e89DTskHbFbBBdAp2gooYB3ovay3U+Uu/yJhnRXKWy0/pBkbZc9jyOGJWufEHskHNyyd7c7Vf4RoXC5fi7/gmCOdNbFOkAjmMNR8RZYyU/fJZEfeoVGNnMlEbXSIGk3ubHOYPVHxEDjNdZRmRKEwnEROJPdtz37z6g7e/Z4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eizo.com; dmarc=pass action=none header.from=eizo.com;
 dkim=pass header.d=eizo.com; arc=none
Received: from OSAPR01MB4561.jpnprd01.prod.outlook.com (2603:1096:604:63::12)
 by TY3PR01MB11475.jpnprd01.prod.outlook.com (2603:1096:400:40d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 20:03:57 +0000
Received: from OSAPR01MB4561.jpnprd01.prod.outlook.com
 ([fe80::8de6:8b0b:a38a:d084]) by OSAPR01MB4561.jpnprd01.prod.outlook.com
 ([fe80::8de6:8b0b:a38a:d084%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 20:03:57 +0000
From: <nick.whitlock@eizo.com>
To: <vfazio@xes-inc.com>, <buildroot@buildroot.org>
Thread-Topic: [External] - [Buildroot] [PATCH] package/nvidia-driver: bump
 version to 550.78
Thread-Index: AQHapU6ixgXs/g+wxkWgy2sPLxFq9LGVdQ0AgAAgGGA=
Date: Mon, 13 May 2024 20:03:56 +0000
Message-ID: <OSAPR01MB45613F3A13D852BB4C96256D84E22@OSAPR01MB4561.jpnprd01.prod.outlook.com>
References: <20240513155907.104270-1-nick.whitlock@eizo.com>
 <PH1P110MB1603A56A788CF657472E9F8C9FE2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603A56A788CF657472E9F8C9FE2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB4561:EE_|TY3PR01MB11475:EE_
x-ms-office365-filtering-correlation-id: 5a519505-9456-4330-e97e-08dc7387d290
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|366007|1800799015|38070700009|15866825006|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?EkhwrIvH9uX24DXb6SuaFJ99vsAkRoYngm9n6J2tkg01y7sKpuUjBdpVphD9?=
 =?us-ascii?Q?rcwwrvg81v4WKfLECUfiqJeAGCiw+cD4Fbn2lfqdn98uKAcdnMefLQiSBKyS?=
 =?us-ascii?Q?89sv+h2SCoEx53/A10/rLGHy7UT02K+TlmF7zlKEBKwL+NQmn7S3TqhwozGR?=
 =?us-ascii?Q?TFIeixJaMOqicFo/uUX0IWH28YJMVBHaAo11KJPL08V2Ids61xgr58SgPQBr?=
 =?us-ascii?Q?F1P4gyuu7U4ipmDj28nxiwe2iczxzfuCXsdP3qt4RUplpBCwJgwsab8GSXAr?=
 =?us-ascii?Q?PoqnhBom0Z6OhmyLim4dynWuUPgkQTB8v3B+Y+Y8SfzU5JvLXDwDwt5xqS2p?=
 =?us-ascii?Q?29nwa85f7QQMe2bi+4dYurOTkKsbcKnk2ueDbtVVIO8HQOxwIRIjncSVN4Go?=
 =?us-ascii?Q?ZXiZkE243C02HXbKLh9Bh20rIma5/iTMQ0wHKRIivQHoBDXQKuaCxKjnoOle?=
 =?us-ascii?Q?+ZQy9CVxEJIJ/VW8zm4vnuI9iWY/Vv20JDy9t7rsLnwTyuAUD/K1x7PYlrQO?=
 =?us-ascii?Q?8lYAe8Q42WjvUUgVcInaTQjmPM4XlfM067BohDUq6sAOfPISaB4etvRfR4c0?=
 =?us-ascii?Q?2Z2d0AEedBbZliRHZ6BjnJtar8v7gQJtOk49EkPNYfVUpZlguCrJlTrERecO?=
 =?us-ascii?Q?XcCvT3wthFs/abtvHl6JI0jiPtdDMGVHqtHpVrMg10s6QkX06Eeu55SMzNIn?=
 =?us-ascii?Q?PlkPO3L+hda/iUMUjoPTpliFnQr2CiKRxUfnkGTn4e5j03CXIlXNXsjj6u6y?=
 =?us-ascii?Q?y4hqEQl2NNUzFpc/MoUaFWMVYfu3U9x/ll2Gy+LBpzTAgnn2iygG7jT0A/nA?=
 =?us-ascii?Q?EoZ+HvFUCPD1dmMRcAVUAqoP3h+hFw0CTaZ99kdkv28LYTqkONT54IW5uUFO?=
 =?us-ascii?Q?f4mjVCTpdKQVgD9rfRN5Gyye5ASzTZicRQwKn/UVqeeYyw04WWWpvM03bSAa?=
 =?us-ascii?Q?k0EprC6fR3X3Wkp5PQcoOLlAjvu6VF1O7G79HeFcTuDm7PZscP/MI4PONr1q?=
 =?us-ascii?Q?xtFOpGEKFp+ynAZHpOUO9oTujiJfUyxsAmICc3nR/pvrNGVryU4SV+A7GOH1?=
 =?us-ascii?Q?pgbWih3zWC62VvD7z6axL+hytvNVnhRPD24v3j9fbv9M8bELkFx5k1Bt32K8?=
 =?us-ascii?Q?E8Fvh5sIgZm9sEcY44aOwziGZ8TaKCefgNuAs93V+6xgaZzHu4RGNXKxEcJm?=
 =?us-ascii?Q?mZHzLGT4XfO2uJyyoye8TqxtqB8U1mjbeinSjbBsLZ+Y/tA1fSxnRePQVuqc?=
 =?us-ascii?Q?fqAxw3smVT2FGU9otrrlln0zchRa/PBQvEMurD5prSrnn8oRVgaDbnB/X3ic?=
 =?us-ascii?Q?4UOSwihAgapCf8zg+Lij/Sdl0kYB8bHGcm7x57YBwBd9FA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB4561.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009)(15866825006)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8NrJGX0ffmsEvVRzife+LpAQvTeyDcru3KS8cHfv2zH6EfisOaJhEPzwbUyG?=
 =?us-ascii?Q?MFrpRH6u+rOSpZ3rRVhCXYY8V0kCxxp7MDtdTjl2+AGJvFlgXcpzQ71zTOYl?=
 =?us-ascii?Q?nEBNWDm0WXtWpj/VBrEGQzWmuy/SzpB0Hj9MLlDVM9MsXf6E0usnMrGcksIt?=
 =?us-ascii?Q?jad72NELvBIEF0IRQu5K+qWd6MZjuFLGXl6ll9gUw2vo7ccm7EYHiQ3z9+/+?=
 =?us-ascii?Q?wNtzJuu7Sw1KugcWr5vzsZW5nE01B4vNR57C4pxOsguPQJLvRlpERb1WzVCN?=
 =?us-ascii?Q?oo4QRuvNxU9/jHFAGUh39bQ2nVBhHnYSLD9qKYF2pTSd8/dILT7k5eos1qsd?=
 =?us-ascii?Q?4t6Y/yz18aC76dAKHTRbbbuHXdCMsovKDEMAQCHzJNqjQIQqyCKT3a/ebN3M?=
 =?us-ascii?Q?aitxNYzgu3LH99VXXsf7jOwSB6vFg2NT8Owo+Dws/scHkEPU1fjoen+o49II?=
 =?us-ascii?Q?JwDHcYH1q8EWDOoSsMP6gC3+2izxCRplcjK80+tIjgwai1wviMWF13gAQoNM?=
 =?us-ascii?Q?lLyZQdK5Awqkat/oYTL/vZYqaIRKwl5Nf972UDg8KnevzIbP4NECdS9slv/q?=
 =?us-ascii?Q?boDNzUgvUTbcncdMWlb5g8SMTawhSYi9F7V9fdHfVfqwsYpVCGf/f9WfQ4Zl?=
 =?us-ascii?Q?dxVfRP6XdTCecBgF8QLCbmYNwOOW9EI1R0YSUiPlypJsRJF2g9xfQvgPeMaD?=
 =?us-ascii?Q?w8BMwhOxS2AVnW8JjAt33FqRvMGhI4lXcjDoxJwakJpLjJ1jdJWrUCOn5a+S?=
 =?us-ascii?Q?mXEFjzpx58QkvGAWC+e/oAYTTJJRuS+tLAUPNd8GhlFhepLUd4jwLaFbcmJI?=
 =?us-ascii?Q?BSkbHS+xQgi8fdQYKoCVio2nzFHI0pJxd73MQTck5kCLSJXMYCQ8+50F4ibM?=
 =?us-ascii?Q?3AsohD4jS8u10xiOvxCvuMR/OGARa0uwA/2Zg7s2oBBjzrdZ3o/PdVHrRZpQ?=
 =?us-ascii?Q?8Hqh51Zi7KjUesSez3unXF0wJu8zjFez6gmIwxoscjqB/WJUJbJVLDU1C9No?=
 =?us-ascii?Q?VAzwsMaQqLFwX1EMWR/v84WKltNKYa/fhrGoN6ETA99/jICBbjIkvnEF+oWL?=
 =?us-ascii?Q?tTTaA9fNclUvCfLHlhV7lqOqR2R3cuiEuT6hhf6zelNMbZE4h5TQTuU17Yny?=
 =?us-ascii?Q?hutAwEamkWHenOyo9MTNYuwG+h5fSpc1oxetPe60o5eezMZAsnooy7yRprgc?=
 =?us-ascii?Q?vvWB/4Fu7GOxKbnPzPGSasgX6Z3DxSKM9AfySB7t2CVZ2Y8A3HHLy7gTwfZL?=
 =?us-ascii?Q?GoPFrUMTU3Dy5pZtV2Nep1/wYRfMtIQNuyq5Z9tRLJQWd2z7TaSK33r541XI?=
 =?us-ascii?Q?C58cWip3W+V1IE/2TNK5cehp9W/MCctfOEBUcWYY18XLK0W3tzKnomO4j9RG?=
 =?us-ascii?Q?hJyXB3KHKc1v8R1ESjSj3QImnnXd4n9iYc53pt+RK93Sy0LbcJKqxWP4QhV3?=
 =?us-ascii?Q?JfkhP1RJ4+Dn/hmufFxNcDwqNCG/uzmwb3xRflwbuy4S6CN/LN0LAkcAmdev?=
 =?us-ascii?Q?llvHWolPdez3Akc00nW474lk8cXu6b9QjGf9+7JyfS2Y9aLgit13H+r6LvFf?=
 =?us-ascii?Q?YPMGNL30DDCVe8xg94umaHZaDHvruyh1FHUa+Vai?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dXPu8VrcPdnh2xcpDaJ3BPaIeosxavqVw+dbEBPN6duleLmzRj+O+riGl74DeenM8TKEh/NUlX47mwEvhebXiL+jMRtP1sv+axVr5K+j+pUcEqnTXbKxXU4FP0zGVzz0Uj7DHFEhuTsG31UN22X2DmGajzV2bq1kQuhP1L/SJTqxkP444t6KyEmrYDy45wJLBHDnWynyxxtm0X6hHBrF2b/FWYYigY7fb/KPUcGLN0SNz4JsCQ/WUXvtoVHxHdgLwidQc5fqs3q5F2gnMFNm3FmNmiyhTP5hKc+2LEnaiXVpke9CPeJucKEk6QsUTFrRaGWirdVHJpgdA8cLrLF+XAXPaohpGKHjQ3aGw890hTtKGIzdfOvH9L/O3DUThn/aqkqSWFvI++rHjFRDbIG3WTWJRR84Q736XnbzwR8OE0FqBykehXc4jn+eHgLoIiBbwGPk8rmRs1KLewhLgbX7Zf2rc4Ybkdv8PO8y8+iwNPSU6CwWQbGghlKkbUjNCb5RYunPzbboRDV2dQPT8/2L5SfMwgzrxT1EK0wEvLPKUwUw6Q05LZEew5uen98cLxcWs414bU9GVtNcgavrUjawgA==
X-OriginatorOrg: eizo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB4561.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a519505-9456-4330-e97e-08dc7387d290
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 20:03:57.0022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2329f911-3157-4dd1-9105-ef837241b69d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V1ZflKgOXcJG5FSh1iQdTdITAbmDnry/HICpv3edkSwkjyhz//ZM8lwSR/jOy+CSEL20hD98/Q2DaiC9ONnIRmO8LCTiz+fVKLM+BRcOS+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11475
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=eizo.com; h=From:To:CC:
 Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:MIME-Version; i=nick.whitlock@eizo.com; s=key2.smx;
 t=
 1715630641; x=1716840241; bh=DaobwU+6oM4USFTU47dv1m1+uLZNwKZ7ImvoEcVZyU8=;
 b=Pz9
 wRjdhb2hPW3CzKObiKd0z9Jcs0n2DmnfQ5PWF9BasLS2k+uzmnU9xCl9KBXshvfTGGVQ1xctg9KrV
 F1pyEO4aGGyPBqQ5VOYkQvUciIem5p9j1q3rQC80bEEU8cSUCaiHp9p3/BpBwepEwrLVxciPLNHLZ
 ToVpseDntPPk7WXOpSM9+rZQBbtD/L4Pp5z0PBr5sP+eeGROAdunpFUJqqMErrqIlkanTSLdYz6v8
 NnvyxiuBCPKvnn5xGcdTL3lsbqcnJHeOCB78zj3FyuM8T/D3PDCiL1X2PLGulCU2rwbYGMwCbaR7V
 /pT9aNY0zde6/R88WB/4s7mL0OEEhlQ==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eizo365.onmicrosoft.com; s=selector1-eizo365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZmNFQg5rUzBvd8nGj47fCXTJOlx0XaKnzKhxvnCchY=;
 b=DX+luRjXLcFVEvPxROkeHmM0Qr0OB5IxWxIinU1cjb3uCxwZvTcthz3AbV/2GPcC9fG5cB3TrQYLI2KZGmmi3MnlAaIdLNvD6KLJnkSdDubyPdTW9ilQgkwST2P1TsszRam9itw3Bhk7XaF+92K/PagmDyGSuGRJLsTAKggYUEA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=eizo.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=eizo.com
 header.i=nick.whitlock@eizo.com header.a=rsa-sha256 header.s=key2.smx
 header.b=Pz9wRjdh; 
 dkim=pass (1024-bit key,
 unprotected) header.d=eizo365.onmicrosoft.com
 header.i=@eizo365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-eizo365-onmicrosoft-com header.b=DX+luRjX
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eizo.com;
Subject: Re: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump
 version to 550.78
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
Cc: yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

If a selectable (or user-enterable) version number is the consensus, then I'm all for that.

There isn't currently a way to use recent NVIDIA discrete GPUs (read: Ampere and up) for GPGPU in embedded spaces until this gets resolved though. 


-----Original Message-----
From: Vincent Fazio <vfazio@xes-inc.com> 
Sent: Monday, May 13, 2024 2:03 PM
To: ERS Nick Whitlock <nick.whitlock@eizo.com>; buildroot@buildroot.org
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Subject: RE: [External] - [Buildroot] [PATCH] package/nvidia-driver: bump version to 550.78

Nick, All,

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Nick 
> Whitlock
> Sent: Monday, May 13, 2024 10:59 AM
> To: buildroot@buildroot.org
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>; Nick Whitlock 
> <nick.whitlock@eizo.com>
> Subject: [External] - [Buildroot] [PATCH] package/nvidia-driver: bump 
> version to 550.78
> 
> The NVIDIA drivers now have 64-bit and 32-bit versions bundled into 
> one .run file.
> 

I believe this was always the case. See the /32 folder in the x86_64 run files for 390.x

> A configuration value was also added to check if the user wants to 
> install GTK integration for the NVIDIA driver.
> 
> The legacy version of libGL.so was removed in favor of the vendor 
> neutral version.
> 
> This has been confirmed to work on kernel 6.1.4.
> 
> Signed-off-by: Nick Whitlock <nick.whitlock@eizo.com>
> ---
>  package/nvidia-driver/Config.in          |  3 ++
>  package/nvidia-driver/nvidia-driver.hash |  7 ++-
>  package/nvidia-driver/nvidia-driver.mk   | 69 +++++++++++++-----------
>  3 files changed, 43 insertions(+), 36 deletions(-)
> 
> diff --git a/package/nvidia-driver/Config.in 
> b/package/nvidia-driver/Config.in index a8617a939b..0fcce93e28 100644
> --- a/package/nvidia-driver/Config.in
> +++ b/package/nvidia-driver/Config.in
> @@ -90,4 +90,7 @@ config BR2_PACKAGE_NVIDIA_DRIVER_MODULE
>           provides Unified Memory access to the GPU and CPU memories for
>           CUDA programs.
> 
> +config BR2_PACKAGE_NVIDIA_DRIVER_GTK
> +       bool "nvidia GTK acceleration"
> +
>  endif # BR2_PACKAGE_NVIDIA_DRIVER
> diff --git a/package/nvidia-driver/nvidia-driver.hash 
> b/package/nvidia- driver/nvidia-driver.hash index 
> 620112e6c8..06e3314d53 100644
> --- a/package/nvidia-driver/nvidia-driver.hash
> +++ b/package/nvidia-driver/nvidia-driver.hash
> @@ -1,4 +1,3 @@
> -# Locally computed
> -sha256
> 94e399b459659c12b1344e8c8f4f5eee1ed5915ff459fc8bb831c9e1d44677
> db  NVIDIA-Linux-x86-390.151.run
> -sha256
> 6e4fd2258465f5d5527fe80abd46de925a30348b4a84658498a6d75caf42c4
> 7c  NVIDIA-Linux-x86_64-390.151-no-compat32.run
> -sha256
> bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997
> 526  LICENSE
> +# Locally computed:
> +sha256
> 34070434527ec9d575483e7f11ca078e467e73f6defc54366ecfbdcfe4a3bf7
> 3  NVIDIA-Linux-x86_64-550.78.run
> +sha256
> 5ac626496a6388d37cdd53e0300525267a4b8c89fb5980da060783afd561faf
> 7  LICENSE
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia- 
> driver/nvidia-driver.mk index f1217b00aa..9ea97a2a9f 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -4,10 +4,9 @@
>  #
> 
> ############################################################
> ####################
> 
> -NVIDIA_DRIVER_VERSION = 390.151
> -NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64) -NVIDIA_DRIVER_SITE = 
> http://download.nvidia.com/XFree86/Linux-
> x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
> -NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-
> $(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run

I think we did this so that 32bit builds didn't need to: 
1) fetch the 64bit bundle
2) handle the /32 subdirectory based on the target bitness

If we used the installer's native logic, IIRC, it would install both 32bit and 64bit libraries, hence we stage the files and copy out what we need.

> +NVIDIA_DRIVER_VERSION = 550.78

We had some discussions about a bump a year or two ago and there was never any real consensus about what we should do.

The challenge, I think, is that the 5xx series drops support for some common NVIDIA products that may be more likely be used in embedded environments (like some of the Wolf GPU products).

https://www.nvidia.com/en-us/drivers/unix/legacy-gpu/

At the time, we discussed having different selectable, but mutually exclusive, driver versions so that users could choose the version that provided support for their GPU.

I had intended to do this but never found the time. I was also rewriting the installer to be manifest based but that too stalled due to lack of time.

> +NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-
> x86_64/$(NVIDIA_DRIVER_VERSION)
> +NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86_64-
> $(NVIDIA_DRIVER_VERSION).run
>  NVIDIA_DRIVER_LICENSE = NVIDIA Software License  
> NVIDIA_DRIVER_LICENSE_FILES = LICENSE  NVIDIA_DRIVER_REDISTRIBUTE = NO 
> @@ -23,30 +22,15 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_XORG),y)
>  NVIDIA_DRIVER_DEPENDENCIES += mesa3d-headers xlib_libX11 xlib_libXext  
> NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
> 
> -# libGL.so.$(NVIDIA_DRIVER_VERSION) is the legacy libGL.so library; 
> it -# has been replaced with libGL.so.1.0.0. Installing both is 
> technically -# possible, but great care must be taken to ensure they 
> do not conflict, -# so that EGL still works. The legacy library 
> exposes an NVidia-specific -# API, so it should not be needed, except 
> for legacy, binary-only -# applications (in other words: we don't care).
> -#
> -# libGL.so.1.0.0 is the new vendor-neutral library, aimed at 
> replacing -# the old libGL.so.$(NVIDIA_DRIVER_VERSION) library. The 
> latter contains -# NVidia extensions (which is deemed bad now), while 
> the former follows -# the newly-introduced vendor-neutral "dispatching" API/ABI:
> -#   https://github.com/aritger/linux-opengl-abi-proposal/blob/master/linux-
> opengl-abi-proposal.txt
> -# However, this is not very useful to us, as we don't support 
> multiple -# GL providers at the same time on the system, which this 
> proposal is -# aimed at supporting.
> -#
> -# So we only install the legacy library for now.
>  NVIDIA_DRIVER_LIBS_GL = \
>         libGLX.so.0 \
> -       libGL.so.$(NVIDIA_DRIVER_VERSION) \
> +       libglxserver_nvidia.so.$(NVIDIA_DRIVER_VERSION) \
> +       libGL.so.1.7.0 \
>         libGLX_nvidia.so.$(NVIDIA_DRIVER_VERSION)
> 
>  NVIDIA_DRIVER_LIBS_EGL = \
>         libEGL.so.1.1.0 \
> +       libEGL.so.$(NVIDIA_DRIVER_VERSION) \
>         libGLdispatch.so.0 \
>         libEGL_nvidia.so.$(NVIDIA_DRIVER_VERSION)
> 
> @@ -57,13 +41,18 @@ NVIDIA_DRIVER_LIBS_GLES = \
>         libGLESv2_nvidia.so.$(NVIDIA_DRIVER_VERSION)
> 
>  NVIDIA_DRIVER_LIBS_MISC = \
> +       libnvidia-allocator.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-api.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-cfg.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-eglcore.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-egl-wayland.so.1.0.2 \
> +       libnvidia-egl-gbm.so.1.1.1 \
> +       libnvidia-egl-wayland.so.1.1.13 \
> +       libnvidia-wayland-client.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
> -       tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
> -       libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION):vdpau/ \
> -       libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION)
> +       libnvidia-glvkspirv.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-rtcore.so.$(NVIDIA_DRIVER_VERSION)
> 
>  NVIDIA_DRIVER_LIBS += \
>         $(NVIDIA_DRIVER_LIBS_GL) \
> @@ -87,13 +76,26 @@ endef
>  # wants to run a third-party program developed under such an agreement).
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
>  NVIDIA_DRIVER_LIBS += \
> +       libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION)
> +       libnvidia-ngx.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-opticalflow.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvoptix.so.$(NVIDIA_DRIVER_VERSION)
> +endif
> +
> +# Include GTK libraries (if required) ifeq 
> +($(BR2_PACKAGE_NVIDIA_DRIVER_GTK),y)
> +NVIDIA_DRIVER_LIBS += \
> +       libnvidia-gtk2.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-gtk3.so.$(NVIDIA_DRIVER_VERSION)
>  endif
> 
>  # We refer to the destination path; the origin file has no directory 
> component  NVIDIA_DRIVER_LIBS += \
>         nvidia_drv.so:xorg/modules/drivers/ \
> +       libnvidia-pkcs11.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-pkcs11-openssl3.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
>         libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
> 
>  # libglx needs a symlink according to the driver README. It has no 
> SONAME @@ -107,11 +109,13 @@ endif # X drivers  ifeq 
> ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
>  NVIDIA_DRIVER_LIBS += \
>         libcuda.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-compiler.so.$(NVIDIA_DRIVER_VERSION) \
> +       libcudadebugger.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvcuvid.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-fatbinaryloader.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-gpucomp.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-nvvm.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-ptxjitcompiler.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION)
> +       libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION)
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS),y)
>  NVIDIA_DRIVER_PROGS = nvidia-cuda-mps-control nvidia-cuda-mps-server  
> endif @@ -152,8 +156,9 @@ endif # BR2_PACKAGE_NVIDIA_DRIVER_MODULE == 
> y  # virtually everywhere, and it is fine enough to provide useful 
> options.
>  # Except it can't extract into an existing (even empty) directory.
>  define NVIDIA_DRIVER_EXTRACT_CMDS
> -       $(SHELL) $(NVIDIA_DRIVER_DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --
> extract-only --target \
> -               $(@D)/tmp-extract
> +       $(SHELL) $(NVIDIA_DRIVER_DL_DIR)/$(NVIDIA_DRIVER_SOURCE) --
> extract-only \
> +               $(if $(BR2_x86_64),--no-install-compat32-libs) \
> +               --target $(@D)/tmp-extract
>         chmod u+w -R $(@D)
>         mv $(@D)/tmp-extract/* $(@D)/tmp-extract/.manifest $(@D)
>         rm -rf $(@D)/tmp-extract
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> CAUTION: This email originated from outside of the organization. Do 
> not click links or open attachments unless you recognize the sender 
> and know the content is safe.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
