Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C20C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 12:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB39A40849;
	Sun, 16 Feb 2025 12:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fOwf8TUVS_9; Sun, 16 Feb 2025 12:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 483BF40765
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 483BF40765;
	Sun, 16 Feb 2025 12:22:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F28FC8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6349E8133E
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9GbLJslc8Uu for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 12:22:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::604;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D7CA80CFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D7CA80CFF
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::604])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D7CA80CFF
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:22:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYz+5qSAeCT8Zd2NfkpLU++FbFQmtsxI/TjeVCDa8kkMg/IfHM9fh9GrpGvegI0qhHLWX7rVuhTaDpgpNW4p9gUGPw5dAPv8bRQtI2FXJifsZ6ij8tiWTIi/WhoO5O/KinBv/0tl8t47RQfo5JsyeVW63fS/6TFUttIO+XvmAOiyUkKCo8IalOu+boEwuaA7L1lKgRrQNENsCJpglCs4QTnFf/wbVfWSsC+IHNgAJUrwhl8Z29Wk+UBwiKJtZKyUh6BSOpHFbaajdRCBzCRWNvYrg3bFn2JOG7fpPfJq1PGu/dx1tXigeZm9QYrqFeOO4lWkJ0wArOkQl46Suk8QLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwjoRfET9If65iHR9XGfX3pYmPtwL6mNTI0/+hhhALQ=;
 b=f4GpIrQ3BW8E1kM8kabsNpckxQB+/eaoRl15jU9daDtdqUdATUyeaMlZr5+PLBvwvvvzABL/OY49E6AsVy3fcGY2utm5R3d99Vl6HwDSA3Xs8lX9Ssna9hWN4D5VJeMiAb/LUGnsXxtINb9I9YivrBP3pv9dPN61a5b//UJsY40MFYySD1AJS4/FeutOUsva2YRn5B8DPCbh1OtQO7assrkUkDPFG11dVph2fXk4heiSG2BT+IMb10JZV/U3jbQnrcdRbp8bj40Fyi9u2nFWh0iKghTVNkvZnFsjWkHTdMrGQe1QJcTXAEvKjQIjrrICetHRQXfhccagYzoDusncZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by DS0PR12MB6608.namprd12.prod.outlook.com (2603:10b6:8:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Sun, 16 Feb
 2025 12:22:36 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Sun, 16 Feb 2025
 12:22:35 +0000
From: "Frager, Neal" <neal.frager@amd.com>
To: Arnout Vandecappelle <arnout@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v2 1/4] package/binutils-bare-metal: add
 multiple tuple support
Thread-Index: AQHbfwEU5tKPK+VZW06b30ul8C4XmrNHWSmAgADZeXCAAabggIAAAgpb
Date: Sun, 16 Feb 2025 12:22:35 +0000
Message-ID: <SA1PR12MB56150FD6D7047F9A6929919EF0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250214165402.1128194-1-neal.frager@amd.com>
 <20250214225831.23731a2d@windsurf>
 <SA1PR12MB561562D664DF42BDA071B195F0F92@SA1PR12MB5615.namprd12.prod.outlook.com>
 <5649b489-e2c5-4504-a928-58409a547768@mind.be>
In-Reply-To: <5649b489-e2c5-4504-a928-58409a547768@mind.be>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|DS0PR12MB6608:EE_
x-ms-office365-filtering-correlation-id: 03d7a3b4-ae03-403b-81a0-08dd4e84983e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700018|8096899003|41080700001;
x-microsoft-antispam-message-info: =?us-ascii?Q?WJqHz9T2KtQLbURB9/V8/BQZvgg8nQdnRrvufWY9eAViRvqheylluKrWGHDc?=
 =?us-ascii?Q?EBNTkmX8wxLIuSOIMB8L71wvDod9o9myOsbTOVm28yQ9WSS3fjsZkGtPbtUR?=
 =?us-ascii?Q?jtynLPiRUlx9fkK4gU/L2af4tlXzyZtqHum6RBZEXIMtk7BX6yqCaMaKTkHC?=
 =?us-ascii?Q?ejN0TVc/RIMoHgNJ3h7fhzVuVcwJ+jUeivm/ptXuhL8Nz3dHbPtHK3vaIxJD?=
 =?us-ascii?Q?eVJsItliED4L8F1uvgEPh3TVBgzGo5dIFv4zlAI3OTfM7bBjy2l99YGb1xke?=
 =?us-ascii?Q?ncicwOViKj4cmVWmvuu49dWQr2xlXeMGHIsykivpnN+Is0CgCGBmCsWnV+q4?=
 =?us-ascii?Q?ZSKsKcOajodcRQsO9/WFHB1M+r9q6DofWLbvAOnoYCNxNSJs8IAv5xgCY/fx?=
 =?us-ascii?Q?WNLK+yCHDbPK8zbUk2A9o9656ZrIqJxTw77DhJl8tY/kHUfoRT6cWiROeGnA?=
 =?us-ascii?Q?1nlDCEe+yyDR/2iPVMxsijpXz4q4FIvBxDZIoKDFFvAB/EN5weUjmdtYPVjV?=
 =?us-ascii?Q?+4fL7Fs8aoLssUau/Xocq8mIkJyYM+VUoH8f3KjYqylCXNsv+x+VVDrh2jG3?=
 =?us-ascii?Q?SlTO48ZlPSuUiFv5UwZawuZPdud7KKBZsqMykt/FeqGMn+4/Bx90C1KmWOzN?=
 =?us-ascii?Q?9hr4bjJWXIlSE1CaqVrxE2I+Wpe+e+pR3vTn+xq3m9AUjoah7G4Iay5DyNci?=
 =?us-ascii?Q?X1h5yQquLPjKh+73halwjHFiSVL7XHrsxHyOlEKNuYluk5Ao5mvxjhvOpgSF?=
 =?us-ascii?Q?CvSbfRAXy45wDOXMltukGCngmLfySM8ZMjV4Im2gM4qQjssIwshM5dTNKtbw?=
 =?us-ascii?Q?NBZyTgPDrhEMxiPJiVPdHzWnAGIqqw6FTCOz0zuAmvfVjd3rcae2KCXRjO/g?=
 =?us-ascii?Q?FGxGW9jU6d3/Y2lEXgLtVpKXPnYvPQJ5Lvl+VvqGmoOsLxxyEJ3vPhbAybjC?=
 =?us-ascii?Q?c73AmhAL5PfvE++pZtUe85e183RR07H1xwsZ/3V9OLF7G1/k3Fi0yvMGdv09?=
 =?us-ascii?Q?VrMhMMMZzTNWLU0Wv8j9v4KUX0VOF2xTUekoezE5PNSHy6QuoJTURrPMg9D4?=
 =?us-ascii?Q?3ZEJpIQcQbglt+F6Nz4xEcaIjqKPlvRXlRga+Onz7ZcMIUSpvNz98mVABHAE?=
 =?us-ascii?Q?7EUaZdSmu0lkrgiry9vOATaKf0vW0POiooGYB9kGxLDR3cUeeO9RJgD8xyOT?=
 =?us-ascii?Q?A9afXFYVMhJ40bZNCwNY0CiRUGLXHZI6ngCkVqDn8UjsoSXjS4M7iuefBvdA?=
 =?us-ascii?Q?rbxtMO3E8jLFpkIYtWl/ePY4t0RiiawqjJbmz/bpvL6GqElgOcdYBOmKTBZs?=
 =?us-ascii?Q?af2iUIGokrHfywlcW8vvsZgZgmD+jafHF6XyGWitiY6aE1X2o2NC6TBGRu2p?=
 =?us-ascii?Q?f4kcX+8hmLSfH1ctdGcsi3hmf9QZd7vPXeNELbiZ8BoWzl29d0Q0ic4TowAY?=
 =?us-ascii?Q?mWU65o3bZP1tyPMKhjOQFmZjmJNxWGg6QptglOQtLKirFt/k/YT91A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018)(8096899003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vePrxC0wpqL7GPZKlAjpxrL5pSUG2t2W5wA5tTF+SsTmYnhtmWile1EB03w4?=
 =?us-ascii?Q?Vgv6bAl+nwWv2HahNKy+GiZjcU1gJOK22wMoygzP4gNEzEzwgJbjbivfYmvt?=
 =?us-ascii?Q?V6WPi5jH8g3KgfpjORvByoaf9WKJa8jnRSXz76sRUik1qxVZ9SQcOix3VrjN?=
 =?us-ascii?Q?QtEPWtx1F2GhJvFpV02vDYlirzZknvyyqd68Sn2jb1PL7QNrDraMeI2CxhT/?=
 =?us-ascii?Q?++MXMIyoV6aAGGOLy57hN0NMXAZjO2Th5/WHlV2UB0i4xlb+yJJtyI8yroNm?=
 =?us-ascii?Q?mB9Vm38aGUrRL5dPgBrTUGQj8jHs/djZWDsgBDFKq2Kq0N2LIj7hRUZ2jyFv?=
 =?us-ascii?Q?ESjSz5uOIHBbOpmnnThNA1sT0FRnG5IN1FFAX7mWL2LwvmThSaBrzB1UZUSK?=
 =?us-ascii?Q?grEmOzOq1AJyBHMUJHbgxtLyUoHOhoDlDejaZXmV/p5MjOYFSef+avDo8sND?=
 =?us-ascii?Q?8fCeFo/qVvu2e6PxfL09pwkJy8TJ3mf7rDUjODNgtHOSXyXOtpN/co43xNUc?=
 =?us-ascii?Q?iZKBewY2I2bz7fgTFMj3ieCtYmxDdqZMNBCkmgu9W8XJW6aA6XdE3oB1qsxR?=
 =?us-ascii?Q?fl0G+ANNi9a/fV3Y0CbtBmBj+CeIuvaXgjhukX0Q/ZrXNebl3zYnpKlvNQPC?=
 =?us-ascii?Q?GWOfTcCrYndJM1ds0xS6Un9BYU6V7eftt4GEEBB3Y4oM88tHWaB+IDz7lmqp?=
 =?us-ascii?Q?bf9D2PcyZGSbRpJG/VFIZ2fP8KEAUkiq8JPpA/4QmiVpSSN1k0Dq0sy7QXdk?=
 =?us-ascii?Q?D9Lu2WrWVCEoI2SADF+L04dcOZLZL8iuPDgj6XYSBA9RDn9n9WrscwNGMRw6?=
 =?us-ascii?Q?dQvHQ9X6mlPbOcIoRyhk4tntHvuokQdJflC9fDH2/sO+YH/FV8Zx29SK+zMC?=
 =?us-ascii?Q?ooe82IP+hKKxv8MMzl2zuTOTbt55hTlVHI5JIYJfO4uVTJBoZhMnE2MoPc2K?=
 =?us-ascii?Q?LQtA7SBsQIANz36jg+B96uI6VS0g/rHpKE354tHKAnIYkdsXJ6vETAt6t/K+?=
 =?us-ascii?Q?SPXtqoc6dwfFpxDagwLB15wMdVNJy9zbmpGEFvn3p4zWWIwig91mNVjr5wfr?=
 =?us-ascii?Q?pCARG2nLxgI4GeIt0F8ootB3XIkW57Czb9ED1KN8nbRn7/rao0sN1Yw8kAbH?=
 =?us-ascii?Q?Cfieo5S17T2HHjIbqSyWlGMtvhmFVnV5NMWDyNcCSfPbyu9rjwgHjZUKNH2Q?=
 =?us-ascii?Q?3xSOmV7UZm37s+6K2HboDkUSJUk2T02BTbWxaoK8T8x7JBQ6s3W5xvLwgnC/?=
 =?us-ascii?Q?axZVHSb8uJuLHUZ1/IIbR6K4QPv24Qj2G+xMp/QOOHmqqZFIYQAkxOJtcNyf?=
 =?us-ascii?Q?LuTd0bAZz9xAJxPkp/y561/u2p7Q3+qb/1fhzuK90HyBiteVsET6bzK88AdQ?=
 =?us-ascii?Q?Mag7nun7JOjQFBjTu5N4SVXTx2WbhkFUHjZrtCBesgN02NlQraY5B9gTOXib?=
 =?us-ascii?Q?EftpcaVsqA3hmL7MoImJnnwtRN0lYGotGt4iYyldX63MQiDi4si9s/Eoqadd?=
 =?us-ascii?Q?ZCp0ULTtRfSZUXnSHELx4qSpAMB/qHr1vr7LdZv0eW0mylFiG0ZuVumcW3XX?=
 =?us-ascii?Q?avoYQoNnPb2RKvK63E2NUVFKxWFYbjpwq58ND+qwExZKrlqkwvVBhAbwPJcC?=
 =?us-ascii?Q?4/HnsTb2qgc0WjNApNMKXidQXJX2dIR81Te8RaVncSyZ?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d7a3b4-ae03-403b-81a0-08dd4e84983e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2025 12:22:35.2794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rFDAQX8Rjk+RPsQa0OIW8CfQDEkuP1mLNrTXNfBnurgM2v9q7Rxa2x20BE7w5eAX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6608
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwjoRfET9If65iHR9XGfX3pYmPtwL6mNTI0/+hhhALQ=;
 b=p1GgGyy/HBJdy0lh9NQ7rUbveOLgQ73uO6QOhozh6BUyuMby8I/pfOc9O5A9w9ge43+BdaZxwZRhOpbGtAN6MSqBQSzXn30N+//wbL8IRNxZsJP9iSA2DkN/BwVfOHKmij3X8gSbQIcAjUuFFOqZdTuVd0mv+br9QawaBVeGR3A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=p1GgGyy/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/4] package/binutils-bare-metal: add
 multiple tuple support
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
Content-Type: multipart/mixed; boundary="===============3725864495704196829=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3725864495704196829==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_SA1PR12MB56150FD6D7047F9A6929919EF0F82SA1PR12MB5615namp_"

--_000_SA1PR12MB56150FD6D7047F9A6929919EF0F82SA1PR12MB5615namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Arnout,

> Hello Thomas,
>
>> Hello Neal,
>
>> Thanks for your work on this topic. Overall, the approach you have
>> taken is exactly what I had in mind, so that's very good. I only have
>> some implementation details to comment on below.
>
>> On Fri, 14 Feb 2025 16:53:59 +0000
>> Neal Frager via buildroot <buildroot@buildroot.org> wrote:
[snip]
>> +                    --disable-initfini-array \
>> +                    --disable-multilib \
>> +                    --disable-werror; \
>
>> I think the final semi-colon here is not needed.
>
> Without the semi-colon, I get the following configure error:
>
> configure: WARNING: you should use --build, --host, --target
> configure: error: unrecognized option: `-p'
>
> It seems that the loop wraps around the next mkdir instruction with the
> configure unless the instructions are separated with a semi-colon.
>
> However, you are correct that the semi-colon is not needed for the
> build and install steps since these are single instruction loops.

>  That shouldn't make any difference though - the newline and the leading =
tab
> tell make that this is a new command. It shouldn't make a difference to '=
make'
> if there are one or more commands on the line.

> Also, where does that '-p' even come from? I don't see it anywhere in the
> configure commands...

I agree it should not be needed.

But if you look at v3 of this series and remove
the semi-colon from the end of the configure
command, you will see this error with the -p
seeming to come from the mkdir command
which is the first command to run in the next
iteration of the loop.

Best regards,
Neal Frager
AMD

[snip]


--_000_SA1PR12MB56150FD6D7047F9A6929919EF0F82SA1PR12MB5615namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Hello Arnout,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<span id=3D"ms-outlook-ios-cursor"></span></div>
</div>
</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif"><b=
r>
</font></div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">&gt; Hello Thomas,<br>
&gt; <br>
&gt;&gt; Hello Neal,<br>
&gt; <br>
&gt;&gt; Thanks for your work on this topic. Overall, the approach you have=
<br>
&gt;&gt; taken is exactly what I had in mind, so that's very good. I only h=
ave<br>
&gt;&gt; some implementation details to comment on below.<br>
&gt; <br>
&gt;&gt; On Fri, 14 Feb 2025 16:53:59 +0000<br>
&gt;&gt; Neal Frager via buildroot &lt;buildroot@buildroot.org&gt; wrote:<b=
r>
[snip]<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --disable-initfini-array =
\<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --disable-multilib \<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --disable-werror; \<br>
&gt; <br>
&gt;&gt; I think the final semi-colon here is not needed.<br>
&gt; <br>
&gt; Without the semi-colon, I get the following configure error:<br>
&gt; <br>
&gt; configure: WARNING: you should use --build, --host, --target<br>
&gt; configure: error: unrecognized option: `-p'<br>
&gt; <br>
&gt; It seems that the loop wraps around the next mkdir instruction with th=
e<br>
&gt; configure unless the instructions are separated with a semi-colon.<br>
&gt; <br>
&gt; However, you are correct that the semi-colon is not needed for the<br>
&gt; build and install steps since these are single instruction loops.<br>
<br>
&gt; &nbsp;That shouldn't make any difference though - the newline and the =
leading tab <br>
</div>
<div class=3D"PlainText">
<div><span>&gt;&nbsp;tell make that this is a new command. It shouldn't mak=
e a difference to 'make'
<br>
</span></div>
</div>
<div class=3D"PlainText">&gt;&nbsp;if there are one or more commands on the=
 line.<br>
<br>
</div>
<div class=3D"PlainText">&gt;&nbsp;Also, where does that '-p' even come fro=
m? I don't see it anywhere in the
<br>
&gt;&nbsp;configure commands...<br>
<br>
I agree it should not be needed.</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText">But if you look at v3 of this series and remove</d=
iv>
<div class=3D"PlainText" dir=3D"ltr">the semi-colon from the end of the con=
figure</div>
<div class=3D"PlainText" dir=3D"ltr">command, you will see this error with =
the -p</div>
<div class=3D"PlainText" dir=3D"ltr">seeming to come from the mkdir command=
</div>
<div class=3D"PlainText" dir=3D"ltr">which is the first command to run in t=
he next</div>
<div class=3D"PlainText" dir=3D"ltr">iteration of the loop.</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText">Best regards,</div>
<div class=3D"PlainText">Neal Frager</div>
<div class=3D"PlainText">AMD<br>
<br>
[snip]<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_SA1PR12MB56150FD6D7047F9A6929919EF0F82SA1PR12MB5615namp_--

--===============3725864495704196829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3725864495704196829==--
