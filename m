Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB45CDD0FF
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 874376073A;
	Tue, 22 Oct 2024 21:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXGMysNn4e0I; Tue, 22 Oct 2024 21:51:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB3860717
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB3860717;
	Tue, 22 Oct 2024 21:51:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 318F34C21
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBF4A606E5
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WTmOHq5-nsy for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:50:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=018cbd283=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 870D660681
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 870D660681
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 870D660681
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:50:57 +0000 (UTC)
X-CSE-ConnectionGUID: qUES+v6vRTyK1fG+wrw2OQ==
X-CSE-MsgGUID: Yq+fup9CS1q1fjpdJvt1lg==
X-IronPort-AV: E=Sophos;i="6.11,223,1725292800"; d="scan'208";a="30104904"
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2024 05:50:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wP0aVQBch/FJCJr1YH/gonJ81pciRLWpbaqrLs0uL6nqofMYKz5mcuymYtVxUMtzK9XOsg2knhalU3G5J72o5+cpdaGdpILu64rLa+eWuERGXZygbiDNvKFngtOTG+udIIUwfMbbyfBqLWv0pShSq4AH0g0I58+rVVIgLZMbJAkoloz9tMJDsaO3ooiUZAn07r3EjYZ7jpsyqxkaP6IUbWLERV0dulJHABPrR6vrYcRFCxXmPA7KiXovphoRmyA4B4bJMcpl+lh1+sJgi0ONotI3r0aYljJvS6EA9Qioc9LfoC0boL356zC7S2m4xSFPK30bNRGMk5PrI0zN36SZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttbR0T4UGqcJcyZqgyMalM/Zq3rTljOX0c9MEqGJ7pk=;
 b=vV5IM0B++U7xqk+yTN8ngfNUq9DFp0zDFrxdtx6GXHkalFWRMRvM5ZLsGXOefUBsLptfJMa5/ESbjQ2WJNKxpBK00vh4Lv9LcjOF9yG3xn3JXe6MCtYM9WFtvtLEL0Di4rvejnC6Lux5X0dGG4BmyiUoWUZTJ92fcfasVergUt4buUUFsvNFuoYrmAGfGcAOacER9lPqAq9xZFuiric6AkCBXrTSp2ChtMAuQvZF56jJ7dQ51HtSHt14Ia4QcbnvJnzMTA//iSfpTwvGq4+gCuXv3/LGdaZDYcJ8ga90ZyVz0eiQNX6PGAUBRhjE2LKefrxAks7IOcTcaG5oyXuAOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by BY5PR04MB6865.namprd04.prod.outlook.com (2603:10b6:a03:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Tue, 22 Oct
 2024 21:50:51 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8069.016; Tue, 22 Oct 2024
 21:50:51 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Niklas Cassel via buildroot <buildroot@buildroot.org>, Niklas Cassel
 <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>
Thread-Topic: [Buildroot] [PATCH v3 3/4] configs/rock5b: use the arm64 rootfs
 partition-type-uuid
Thread-Index: AQHbH87dqeCkGSwLtEKpvuffHiWtirKTSDyAgAAREQA=
Date: Tue, 22 Oct 2024 21:50:51 +0000
Message-ID: <ZxgeOudkPEBVJBkz@ryzen>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-4-niklas.cassel@wdc.com>
 <20241022224945.4dc67b89@windsurf>
In-Reply-To: <20241022224945.4dc67b89@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|BY5PR04MB6865:EE_
x-ms-office365-filtering-correlation-id: e971109a-e94f-4919-50bb-08dcf2e398b8
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3x+xkZzqL37wQ77vc8w80pOhMg+O027MOjnpwMJEdOBX01WMAbt8qkqlEjwm?=
 =?us-ascii?Q?WOtA38av8aPK3eGo6/t8grnntGPXaOU8acqoY7osCLGStg81L87C17LPs6YK?=
 =?us-ascii?Q?XqWLNPC6Se9pZcxYuSloqqaxHSETbHDhOa/DlQ9uQcIJw1X6UAnlVajk6E41?=
 =?us-ascii?Q?C56Db12MDmqEEKQyIq3JL/6qDJabKz+//tl96bzjmJlgA3simwFyB472h3ae?=
 =?us-ascii?Q?bDgVEk7f3CnD/kxAaa13+5Ql2G4SfxJspGit/T0jiKMooGyu6dqfmzVHyWvN?=
 =?us-ascii?Q?ZXyIWL0FH05xSf2pSP3LPk4RMTtY/Wf4ZUOrMfXQcj7poFVRvohZ+4RFIfkw?=
 =?us-ascii?Q?hUKKhq0pyXHp+8ARhxNhtkQQNScWuZ0MXElmmk42rT33HEaq0Gi5AU9+8prx?=
 =?us-ascii?Q?33R+/xpNEvWps0c/7ick9/lJq9E6dQ/LxK41p5sPChkCuJfwl6pYJbhYs5QV?=
 =?us-ascii?Q?NdpiWRODZLECaiE07r+RnnUv3PN7OX8ZNllm8OTfg7xE2ag/RDlUhfr9AJuE?=
 =?us-ascii?Q?d1VY5Xl0dTHPCD7KWD4lh7+h0jJL/ZY0wuWbU+maTBdXYgQUcGBJXcbfU6hq?=
 =?us-ascii?Q?+syRhYgLSakaGRjEt3vsxZ2NThc4CP6hdFn/vhFrOt/XYg/0U1/ALG0eVpmH?=
 =?us-ascii?Q?4IKpB/PQfp/G1+jAe98WrRJhs3jgXCgLpH9s2Q38iu+iAugjdqTSpSbD1VKc?=
 =?us-ascii?Q?5ncOOuUpdMfw0jJwBmNIuwPT6o7lamAjY4AQmSsPUVV4EQqaWaVqTA5rKM8l?=
 =?us-ascii?Q?AZLRwmOTRYOIZcYKdRBsAIovc/HtD87gI4UE25QShNHic8yCfTLOZD2PanKN?=
 =?us-ascii?Q?XVdunMyNr6xhU57jaCPycRgVAE861ceMATzh52X0xh+gwvlytU4mDYff12EB?=
 =?us-ascii?Q?xcygQrAmprbrt8M/MHnGjGw3FrlqB9Rn82jaGwUntOcSFjpGOojQfLKb/WKA?=
 =?us-ascii?Q?a3rPHDUfDwjZw/0g2G59+HMx77Vw/BXEebOYPbpWM783cuCKUqvcQAmqlsEa?=
 =?us-ascii?Q?T9TXxRS4hBvo3daLXrBYHJDjyQAIcsjP/SoD8NWiIepZ8A2AgZPvvih/byIJ?=
 =?us-ascii?Q?CwoomRkOjQSGsjEg+by4vGKoLJtTK0y6O+TM9nRgGr799lOflO9rXn2EnkRq?=
 =?us-ascii?Q?35YVAVpilux+dXJvBfc054geFAsVx7LPqqmKtFt0ImeZ4u7t29wH6P9Ouxq1?=
 =?us-ascii?Q?UKO/N8s0gwbZ1CKbUIo4EJNwsVtSJO5h76FujWZO5V33eSFYj/Hh9+rh7q35?=
 =?us-ascii?Q?jzo068f3h/BJaAOyKFdLmbBUnzso2e5aeO5mdglavagqiMQGwGGIJwk0Tgax?=
 =?us-ascii?Q?JVKNN1mZDJ1BMkk3qvhxI6b9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D8VEZvmZ+ln83NpWe5V6mVbKELm1Zihqd5HKdoQZeonx3Mg6b8KwQhXmlyVf?=
 =?us-ascii?Q?6ywNQHnqEDMi+LPAJO6xzOZ/iaAolLbAsQSXRbY6oaq42p3NqcXjo/uJ19fl?=
 =?us-ascii?Q?PRivdNETfVjiaM8U8muNkqVUndSfCazmOtldc0dQtYOGa5mvCIOE9HK8TzE+?=
 =?us-ascii?Q?MWHD8H+kqG5f3BZAiN2nfLfT0u7NvDQifbUNS9UYFZIoHtcV4RfmuVuzxoxD?=
 =?us-ascii?Q?iiT5bQBnD7Ueyeo29mCyUSFtptATFEesVxl8ltOXnzr3CQPdS2i47ge83Nav?=
 =?us-ascii?Q?QZGidHMsplVQzTnCj33wOqewxW2TiOgypGkr26Pp3ec4zH1XSIcSPc+AMuIv?=
 =?us-ascii?Q?aax9zNzklLnZLI7xzQrT0yQhB4tYJz0kbwi0fiQCqE0eNt13Uger3JEuGkw4?=
 =?us-ascii?Q?WbNIcziK+yxGGxeziBr8721EYPCUxuTGg9x2BXDLsPa01AmoBdSn/NMVU80z?=
 =?us-ascii?Q?o2YzN7mAvfn50BdA3cRqAztSLMt84SqtJWiCaRbYJOmrMj1rJGDYVmDcmWGG?=
 =?us-ascii?Q?W2L/CEFIfgDWZkbn4U2A+T5tWFE9Qx2gZBhWoJyuG0iuq4/GD+Ue04OJXEeC?=
 =?us-ascii?Q?O3noL+2ZcfufnCvc/YL6Bvx+/P5onlZmykmJQtTyioYGAG7E+JU3qHfc8SRb?=
 =?us-ascii?Q?mtIGBMaktMDX4I8uIoJ4T4ty4CV4NTBdAS8+k50Rz5BLcIPSSQWWL65qP1Ex?=
 =?us-ascii?Q?TgQxqcfa7Unj8Yc+v+yz2sDdYJMbvKLVE87lgqQ6NEeZRaln9qJP8IcIcKlg?=
 =?us-ascii?Q?NoolVhMGhHjfwedhaBqazU3RG+r8ZBnV0ng9mkbUwFzfvsjkODAaqxpXFeW8?=
 =?us-ascii?Q?tBK57nj64ylnjF6N7Xim25VrwKdSTU8EoMqLxsWQrlZlS3S+KG3lLCjsHJS9?=
 =?us-ascii?Q?+w+tbgzRKAoAxnOOic9xc7RrCoah8Oq9PoS+EXJLmb4tt0wEg4uDLKr/mFvP?=
 =?us-ascii?Q?IruC/phtR778Ap3ahivHPk68huWSiUzaLsJKQ8NJjKm5DIeGb17frplwvWmy?=
 =?us-ascii?Q?baHAC9iSKyL/0AD9cdE7bTYXPEPSp7qtlo3FpJd+ftyk+cUW5hlrG9ZsYenP?=
 =?us-ascii?Q?3c0wOVWaiEFVstEj7eXRjJRO4XA++dS3OrLxPPiyoH1dFeWILe48tW9qNU1O?=
 =?us-ascii?Q?/hqF/l8dK0I1FYvGvFM8/mqtxHF7hbKfBOnfZT25svAoW+QSeLhoRP0BhVJv?=
 =?us-ascii?Q?1Q47BHZ/WvAZ2E9V6N7sKBdm9BnKtTdJbtSpw4PL08E1t53Bnjou7hxuXscl?=
 =?us-ascii?Q?iQK6pnuNIUgccgvhgMH+7qVUZfJA+ImGZYIVmyxc0HefyhsWhz6gCR2UIf5S?=
 =?us-ascii?Q?wHHhbBuQzys29zGQiuBLMGKnodW4Re2L84zqZDzWFxRkTGrKRNKvZP9L/gir?=
 =?us-ascii?Q?f12AYRAcn9Ai9t0bZObJ4BkinIBaFLMdsA26CXH9MLC4xm5ICNxf1kaHHqfn?=
 =?us-ascii?Q?rJdSt5q0TbxOo5LTXWWNRoM+ICtzVL5P1sJ9DhERirpgMG6OLuiGBd2PFP+e?=
 =?us-ascii?Q?zRqZJQAIGdjLZA1h7IFC/4X9cwQ7Zu6QZwc2Hz+pnSIyrW2u8in8U3g78Sp+?=
 =?us-ascii?Q?6vm/KPEj6EDc9AC89Y/xhO3+GxbJgS2E0rLBK0h4KJLu4kdVgCy0p83RGoGU?=
 =?us-ascii?Q?KA=3D=3D?=
Content-ID: <3B1FEB85DCC9E94D9AF51616073A1069@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: k9Z/F0s75bp6dmDVPGiRn6inaSuscedO8ybyz5+tA7L4Ze7aPzbJLO3LMOfQNiPorLDOhvJQzeclV7XiAj4jq1/IWPvqdZZiS4Veq+M5MC/sjSeuxHGcf+VDgU2DrtMbRAp5axOaUYaz764JPknt3kUoyyuHp6CNoHy1w+V0K3tqfOChXnJ0VtJrJI0Cwjxku2Vlf6QpoQXQFpHMa9uimb+Zk6kM2Qf7dXgBL61jAX0MdgmeT/yGvVKZViRqtT0oI8PLOfeQ4U8Cw3MRA2BXKuSgyfZUW8Vdc1gO5h6RLiYZWrzTiFndwCJSh8Hqv55dkTYhZH9gOpCjw0hADalPH4WaUapdE5Ts29mlo69myJsR0upzwbJHRI5TGdocVVVnteoU54KDA5PTXGAmyB0Wi/Pp+RF9lsum4MolkdWXJMTpVzKMwcBmgz0NhjRZTrVLveRCH5SjP9iU7htZsTtNSwrDAk9VTpO1IR0Oidbivzl/S4Xo73MfIQaNYz7mMcdTMeTjVzPkVEf8FOjWpizdZrCIG0jrAWZi6WZJosWWe+P9S0SNRFETlvtEg3AI+EPaK+YcqWYZXvSWq+LIXo5DIOqVv+TwtD5pugFuWlDMxlg8yOSt+8HAtNz2V9/cS3D4
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e971109a-e94f-4919-50bb-08dcf2e398b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 21:50:51.3413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uh8gs4KnmpMEczJrFEilWYPYm+9+A0XwyIBI/fhI3ANB7gbezlfa+v7T6jhTVo8tY8GND+7ZVREkwxwpYeBhIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6865
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1729633857; x=1761169857;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=lLEzJ5DqrLfAcvyoboBmQXt/4R3pia+U/vbxntk0gE0=;
 b=Jf9iYudstg3/uFWYF+AxsiZ3bDUEhMTA2vndGN48iQcblv+1ZlJs4Fmf
 VuVvDm0/K2Z1NiGz/qAnu7hYwlnQvWezlGcgumIn8DRITyIgSlBycaJP1
 iIiEgUJaZ+O7ovJxeSve8oJqC6Vioa9r70ohNLizN52EhL5apV0YLkIpv
 rceA5VAMZXglyU/8c/FgCjHXxfCqCZvWuDfw1xeT8/grIJoSy6DW3B1DC
 +EhJU8nSU4M4aPyHIuULCsh1g55XRPlJYQSgjiJ45RAgUo07096AWPMqf
 wKNQ/arLDNPduP1Erjek8BvMsv9Gv3qujhAD9BII5LvgOy2LZ+mKrWQC9
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttbR0T4UGqcJcyZqgyMalM/Zq3rTljOX0c9MEqGJ7pk=;
 b=W8EivygTd6amCKBxAMQhy2EL3cYnthXakoe5K2UutvXsKpdjdRO4K6yhARyprJyHVydneAYCljE5yjtGoDGqxBh1brRIFP+jY4rDReHXNWztoK+avB67SidDYIY/G3Qa8tyo+whamTNTV6LZf12F+0QjFKBwFOnTOwtlc5moUZA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=Jf9iYuds; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=W8EivygT
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v3 3/4] configs/rock5b: use the arm64 rootfs
 partition-type-uuid
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 22, 2024 at 10:49:45PM +0200, Thomas Petazzoni wrote:
> Hello Niklas,
> 
> On Wed, 16 Oct 2024 15:24:42 +0200
> Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:
> 
> > diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
> > index 43bb65bdd9..8c56251135 100644
> > --- a/board/radxa/rock5b/genimage.cfg
> > +++ b/board/radxa/rock5b/genimage.cfg
> > @@ -12,7 +12,7 @@ image sdcard.img {
> >  	}
> >  
> >  	partition rootfs {
> > -		partition-type-uuid = L
> > +		partition-type-uuid = root-arm64
> 
> In principle, this looks fine, but this "breaks" the pattern that we
> have document in the Buildroot manual at
> https://buildroot.org/downloads/manual/manual.html#writing-genimage-cfg:
> 
>    For GPT partitions, the partition-type-uuid value must be U for the
>    EFI System Partition (expanded to
>    c12a7328-f81f-11d2-ba4b-00a0c93ec93b by genimage), F for a FAT
>    partition (expanded to ebd0a0a2-b9e5-4433-87c0-68b6b72699c7 by
>    genimage) or L for the root filesystem or other filesystems
>    (expanded to 0fc63daf-8483-4772-8e79-3d69d8477de4 by genimage). Even
>    though L is the default value of genimage, we prefer to have it
>    explicitly specified in our genimage.cfg files. Finally, these
>    shortcuts should be used without double quotes, e.g
>    partition-type-uuid = U. If an explicit GUID is specified,
>    lower-case letters should be used. 
> 
> That being said, we already have a few genimage.cfg files that use
> b921b045-1df0-41c3-af44-4c6f280d3fae which is root-arm64:
> 
> board/aarch64-efi/genimage-efi.cfg:             partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
> board/arm/fvp-ebbr/genimage.cfg:                partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
> board/pine64/rockpro64/genimage.cfg:            partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
> board/qemu/aarch64-ebbr/genimage.cfg:           partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
> board/qemu/aarch64-sbsa/genimage.cfg:           partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
> 
> My point is that we want *consistency*. So either we use "L" for all
> rootfs partitions. Or we use root-${ARCH} for all rootfs partitions.
> But we don't use "L" for some, "root-${ARCH}" for some others, and a
> complete UUID in the matching a known root-${ARCH} for yet some others.
> I don't have a strong opinion either way between L or root-${ARCH}, all
> I'm expecting is consistency, between the defconfigs, and with the
> manual.
> 
> Do you want to tackle this? :-)

I don't feel comfortable to change it for platforms that I don't have
access too.

The reason why I saw this was because u-boot has support for searching
for a suitable rootfs (if CONFIG_PARTITION_TYPE_GUID).

and then specifying the type using type=
in e.g. PARTS_DEFAULT.

However:
1) rock5b does not have the uboot CONFIG_PARTITION_TYPE_GUID Kconfig enabled.
2) rockchip is incorrectly specifying the arm64 partition type GUID:
https://github.com/u-boot/u-boot/blob/master/include/configs/rockchip-common.h#L19
using uuid= and not type=.

So currently a uboot built for rockchip will only automatically find the rootfs
partition if the rootfs partition (incorrectly) has set the partition UUID to
the arm64 partition type UUID.
Rock5b in buildroot does not rely on this automatic finding of rootfs anyway,
so all good.

However, there might be other uboot configurations in uboot that actually has
set the type= a specific partition type GUID in PARTS_DEFAULT, and I don't
want to risk breaking any platform.

As written in the commit log, the patch in $subject does not introduce any
functional change, so it is completely fine to ignore this patch.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
