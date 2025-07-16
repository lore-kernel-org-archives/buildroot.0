Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE643C83F27
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 09:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7192961414;
	Wed, 16 Jul 2025 09:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcfCeQC9v5oo; Wed, 16 Jul 2025 09:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74AD661426
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74AD661426;
	Wed, 16 Jul 2025 09:01:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B458F234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A50A361414
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id On9B7e3d21e4 for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 09:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20a::7;
 helo=pa4pr04cu001.outbound.protection.outlook.com;
 envelope-from=maik.brenke@continental-corporation.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57CB8613FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57CB8613FA
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::7])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57CB8613FA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 09:01:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckBU1XfLqpByEwfT77UzfPsvCfSpAMtnIH63Uyh9FwOTkIOmGGg1jbWfb43FWxJUiDINmkW5d4Y8Wca1IWk+SWY1u81TO/03mX5XG91gjyFnfOP8XJKgdWOEEbHgtSMgNS8vZiwFj7Tj6TO1QSrlyttMTe0C3jK9Dnul93Ns4xA1a505FEtnCgiy3EQz6nIemAL/70w6Zd6+12XQfSj+xr9CavIFHwDmhiSDYTjUEatPxxpHq1Z6KodFlpko0rS+whyf1UUya9uWIoLpnxo5pCLHCONIlGYeC0P34Ch/1SME6rJ/PYRkh1EGjGQVJqxGCJhk0r0/MYnIZNxyu7cRKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYM02zvbbewIxe/AELrw1aiJNizNBPX3V29AIcsOn/o=;
 b=Gac4f4yOMEjcCsXyabi03YTtGjysB4WyJEwYY4KJ3bhm6Gx67Y9jAlXYr6A9BfTB5VOHNIfQ0twKH0aqyeCDpHnUQvlp/5o4OjZC33SQvHfz9z32F9WRfAniXJqO+3LrOaOfAtn2xokbjaIbQP8/mEGb+aQhoELEPGmLrn8gXEaBXqn9MpWy5R8YgyMJ4ahxaxjN6tfjvG+t/QcwKhzLAFrV5uLgM7NK3GK5aq+HEbryUl8fAM7XXK/rt1aP/tZrZrnE7mfEXryi0UhCiE7qofrYMmrQAKhzCQNL1fmjenQpwAS0Q/yNic1/aFNfDGUHZkY7P+JvKewImRkYcRR02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=continental-corporation.com; dmarc=pass action=none
 header.from=continental-corporation.com; dkim=pass
 header.d=continental-corporation.com; arc=none
Received: from PA4PR03MB8245.eurprd03.prod.outlook.com (2603:10a6:102:26e::5)
 by GV1PR03MB10329.eurprd03.prod.outlook.com (2603:10a6:150:15f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Wed, 16 Jul
 2025 09:01:20 +0000
Received: from PA4PR03MB8245.eurprd03.prod.outlook.com
 ([fe80::9977:aeeb:dbe1:8443]) by PA4PR03MB8245.eurprd03.prod.outlook.com
 ([fe80::9977:aeeb:dbe1:8443%5]) with mapi id 15.20.8901.028; Wed, 16 Jul 2025
 09:01:20 +0000
From: "Brenke, Maik" <Maik.Brenke@continental-corporation.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/figlet: new package
Thread-Index: AQHb9i8baBTK4/dgyUG4HJKqvLPrJg==
Date: Wed, 16 Jul 2025 09:01:20 +0000
Message-ID: <PA4PR03MB82453FEFC1AC64F478F632E4A056A@PA4PR03MB8245.eurprd03.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6006a9c5-d130-408c-bc8e-3b5ecdb17aa0_Enabled=True;
 MSIP_Label_6006a9c5-d130-408c-bc8e-3b5ecdb17aa0_SiteId=8d4b558f-7b2e-40ba-ad1f-e04d79e6265a;
 MSIP_Label_6006a9c5-d130-408c-bc8e-3b5ecdb17aa0_SetDate=2025-07-16T09:01:20.2480000Z;
 MSIP_Label_6006a9c5-d130-408c-bc8e-3b5ecdb17aa0_Name=Recipients
 Have Full
 Control; MSIP_Label_6006a9c5-d130-408c-bc8e-3b5ecdb17aa0_ContentBits=3;
 MSIP_Label_6006a9c5-d130-408c-bc8e-3b5ecdb17aa0_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB8245:EE_|GV1PR03MB10329:EE_
x-ms-office365-filtering-correlation-id: 994a3d8c-8307-42f4-307e-08ddc4475508
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|38070700018|13003099007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?8EchyzzQ7o58v0LQmoI8lYF34WGf12CPCXQTtemqZLCfmey6Qiq1s6d0xi?=
 =?iso-8859-1?Q?7ETEhNZ6mxEMsNjmGfAnRPNXMAJQScpugUAsTHANni0MJrmzDFnEg8yCYR?=
 =?iso-8859-1?Q?kT5Io+wKulkZFegwJgNH5z8MP0zLQbspppSigkIjPoI9Z1yfZzGmwS9GFv?=
 =?iso-8859-1?Q?kz8HCaLUzAt/FcGJml9Cui9WCKWacY7snKqoGXWWGk6+Kf2034ib65f2kH?=
 =?iso-8859-1?Q?4LOelPbihaX2ah2p9HGERvDDEdl41MDulDYQH6UawVvdjOsr4ehP5Y+rEH?=
 =?iso-8859-1?Q?FlPXCdBMJx33QvxTnUFaK2cQVqq1MEAYKMoAhkSHemwI1Yo5DWSZ/1bbew?=
 =?iso-8859-1?Q?IClkZjIWzFEl7Hf5nXgeAddD7PhD3rny3V85FdfKSJ21s1XJvDMh4c3+IQ?=
 =?iso-8859-1?Q?UrIWPXhfVWsbjYc18KtJGpkx6K3V6dnN9s4Sbv+zTgig6R7+iO8Q96cYSE?=
 =?iso-8859-1?Q?BzVQMK9Bvuvobp7zMfb3HmZSKzgwvCa5QPayHjmeMbqN669ATmcpamUsIV?=
 =?iso-8859-1?Q?TvJEuhKmoUU4JGQ2zELMoLApoYtY8QqVSTbU2hmPkuRcIil/b5haDHPq7X?=
 =?iso-8859-1?Q?RvSpwWsBR/FacTZAEZucmQjXTGbIHrt41QGx5ENf5/wkncLuRX1rDVStUg?=
 =?iso-8859-1?Q?nbzbqBDQPnjwz/pfgclH38SAHnL8HDthwiePVeeznCgrQNB6GwL7+fqQ0s?=
 =?iso-8859-1?Q?EwkgbB+eDS7DQjq8voTFzqXcdB2re6zecCxRx+kHk3YyMtffKmlBYhv9Iz?=
 =?iso-8859-1?Q?3jEN2/XjbrAUsR9QPUqforAdU4xFocpL/96FfKDNJ6/vHxQpf0gu56SPTX?=
 =?iso-8859-1?Q?cYv1jlemi5UsOEVIf7st4t/TaA9SBc16NL5ccq4M9GihT1D3d340gSFu74?=
 =?iso-8859-1?Q?Tofn9pBAZOC10wiCaas2D90kYCbqQQz2bx3qVnn6wGFgjBBIFFyLpGMcBG?=
 =?iso-8859-1?Q?faw/povnpCyup5cgZsdXJPeYgTD0FsgwRbJ4PuRySoKHf/GGZTS9LKTBKx?=
 =?iso-8859-1?Q?l2jxRgp+E3Wlxx5bGdBDn+69pQ7JEmPWd3uTnn0I5N5K5ujHNLVeiAw4w9?=
 =?iso-8859-1?Q?25O+zQSMn3MouUOUaSyFtVLIy2SVmtqSprQ+E8Jc58BB6nvV77AdkovGXK?=
 =?iso-8859-1?Q?yjPLKfjFgOjQ7uPq7MRlXYcpM+ZcGtOUPXG78nha+IUcjHiXTlbBUEn9s/?=
 =?iso-8859-1?Q?Ytquca8uO+duB1Z2DfJbrXtOxQy2lxttoJP6u1YSpSybd/vGjjVlpzBNJr?=
 =?iso-8859-1?Q?b8COK+yQQj6X9vKqCm3A5SyPNHt3LUiLljb1oUBboxcUvmWy3zAN952MTf?=
 =?iso-8859-1?Q?kj02Qggna+QSP29tn0exs4WJZSCAtMsiyW5y6Z4xNakYLJVNnnWEtbgajp?=
 =?iso-8859-1?Q?VNiJB59GjgsUHFUQhjWqEZa8bNNtJRvTCjN9o3Gz4fMSz7kWBJ+ooFxhFs?=
 =?iso-8859-1?Q?+WHl4XOhKilZSxoRgfZcorgQOGjITmH0zucvZ/6ZnIOYoT1EdkafArHpMa?=
 =?iso-8859-1?Q?M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR03MB8245.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(38070700018)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0V+8Q9/VLfWmnzAvVgzdKSWUro9gs5JVUdh/U1sLfEOApt8H3CCJbr5cWE?=
 =?iso-8859-1?Q?pfDEOFuLckjdTJlOlZHJgAw5n1dnJ4UwpNCWLEf775BDG0ClNzFM03iPYB?=
 =?iso-8859-1?Q?Vz813qT8frnNtitMFtwHcqsvvOrClog1qVuaYGrRBnlg2L5ch00WVY+6g8?=
 =?iso-8859-1?Q?GgZXjmNhy2Y6L5xNxv3ACC+jZ0xF55KBsprSh8bzhdpojB2puq/HeWJRsX?=
 =?iso-8859-1?Q?t395AkRfjKyptigS+nUcY01cCYdGgRR78EWypH9sFgzDHZhtyQ688Z6Ot9?=
 =?iso-8859-1?Q?I14QNhQ0GEkotHnXcC4GMmFsU24M4IG64WL7OBCJE1mkuQYsTy4T6k6puG?=
 =?iso-8859-1?Q?3yYQJRnp/9Ytjk/2eHEP5LVBWBBzuleLv5UuViWSDHuqmIvw3PtRtIz8QA?=
 =?iso-8859-1?Q?slMUTvZuSSRHFF6THgi/DCf+EocyS4GYCUFRuzqRCgWLhTfCuCh23LeOsW?=
 =?iso-8859-1?Q?9JsyUHhVcoeS9wHhUmH3jMgtqjQ6SOeQaX4uydGLeHVlQN6Df7Xqj/IqZg?=
 =?iso-8859-1?Q?8J1H2nU5di3VDGRoLmmCXfEsk85aGEUCg3w1Zrv4vHb7sP/bBB9K/gEsM2?=
 =?iso-8859-1?Q?FvZBXY7kcOKVvw0KFuyKXac50WsBIPBz4d8aRxxJnhuQ3OQo7BZzPzlKGL?=
 =?iso-8859-1?Q?PPqmahi0a7nt7DLvJR1I/kAXytZNx6Kugs0Igd4nk+m54e0dZAh8DmdEVa?=
 =?iso-8859-1?Q?hXHR7B04Pj3dtrKUxgS/wdJn6Atl6Liom1gU/cYemD3PA13Ts8Vegsza19?=
 =?iso-8859-1?Q?SFGTo/doGoYjZy9y5qed60bVrhkyett1iLXfEFsBSy0maJymuxgUMoalnC?=
 =?iso-8859-1?Q?3LQ1ckMo1GKfAbe1/UAqKOEkZJPC19N3qYktfZZLx8yFIDIvYfOoszbeVR?=
 =?iso-8859-1?Q?P4JAgTeFWedtUv3m2IcLP/WadURDK9Lgt3kbk+Ry9jF5dCRxyiHIG2DN/W?=
 =?iso-8859-1?Q?SjK3nVnCampqTyzPxQyeQPMqRrP9A9Mu2G/hRrN5hq5i5WCyRhv7a/wndQ?=
 =?iso-8859-1?Q?2WpxMzstsOO37C8XjLwSAs8gGkrlCE107IRZvlEm2Ujs6jJIxHcry0FeIq?=
 =?iso-8859-1?Q?GqIGC9pvXd00+OwsfnJZRhQF14Mv6+gpKIgxBXpNrnx0QK9NThK25bwwV4?=
 =?iso-8859-1?Q?wi2zm82U3KJYPpvBfyoCTpaAc2GG4evnvu2ASmFDpJMjRDrhBy7u9rxjLU?=
 =?iso-8859-1?Q?OS5mUPTc6T0/jbJqC5BjVWiSw37NAs3d+XQ5iz44YjW/d/rYkA0cSPLeg9?=
 =?iso-8859-1?Q?Yohd1kNeGaUZOeu/k1oHr70PvXBBTcfmd+DCkCbSkC/V2GgkdeqOrVLJWd?=
 =?iso-8859-1?Q?eGpbjx/44DY8GPfMhbKirOpt+g2LSTKGiSAdaNF8oJW4w8FBgQxnBckzyz?=
 =?iso-8859-1?Q?TJNJuFBhViydRQ259NcZ8GFc8qYmYP6v7Ea+FbeXKAeg0OiRe/o6wFNF1l?=
 =?iso-8859-1?Q?E00qwSHC5hNMgqQTcnz9r7EPbsn8NoIdBqBzsLffRVBI+FJUm39eK/m+b6?=
 =?iso-8859-1?Q?wusU/S7hewcbnnLv8UsfsZK7rcrvkm+hkONJ7DEtH8UZ4F19VmF+d83Zkb?=
 =?iso-8859-1?Q?VzBTxNsI51olPtuS8WPxQIodZGB3ABJ3SoS4J6DWeU5UIRx4e401UTKq7j?=
 =?iso-8859-1?Q?2iTdcrKUQ36nQqriM/ImN8uZ9xQ+q2amig?=
MIME-Version: 1.0
X-OriginatorOrg: continental-corporation.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB8245.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994a3d8c-8307-42f4-307e-08ddc4475508
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 09:01:20.4213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8d4b558f-7b2e-40ba-ad1f-e04d79e6265a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ou074M1zoCzwCGwRzqx+L1cN6kbZa5hi3A+WYIn0r4A/I99QJZQdsvBvnmAgV+HoZM2ukCHAuiH3aR89Bcmo6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10329
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=continental-corporation.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYM02zvbbewIxe/AELrw1aiJNizNBPX3V29AIcsOn/o=;
 b=lmK0Ip8bUwU3jQvJvkaT+0tVgEASCUdUw6aBCGjprYmtpfASeLFLLKsZAx+mOBxrR+vPYsnVMkjam2HeQFctnzyGv6hrrA1yO60R6pQTN8PviN3MYP0kBNYOQdEcQJVSDahJhmFlZxc9uUxfMZxKUA+6xlmfSnbmLpmsUAHKy+Ep1E+SKPois8Xrvp9cJ+1LMUA6de6vGB+PtXnVRZ1LiE0vOcFJgnRabpZZL4SeQRKsDrICaaZr4h6Rlz5wWD4fF5A/WbcndLt709xLyBShRkYqzIaGVy6B1VVjJBEnmcW70O1wLcFn10b+v9mLdb8j4OdMy+4QXJxbe5qEaaXUxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=continental-corporation.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=continental-corporation.com
 header.i=@continental-corporation.com header.a=rsa-sha256 header.s=selector2
 header.b=lmK0Ip8b
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none; dmarc=none action=none header.from=continental-corporation.com; 
Subject: [Buildroot] [PATCH 1/1] package/figlet: new package
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
Content-Type: multipart/mixed; boundary="===============0583988404416833640=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0583988404416833640==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_PA4PR03MB82453FEFC1AC64F478F632E4A056APA4PR03MB8245eurp_"

--_000_PA4PR03MB82453FEFC1AC64F478F632E4A056APA4PR03MB8245eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Add package FIGlet to creates large characters out of ordinary terminal cha=
racters.


Signed-off-by: brenkem <Maik.Brenke@continental-corporation.com>
---
DEVELOPERS | 3 +++
package/Config.in | 1 +
package/figlet/Config.in | 12 ++++++++++++
package/figlet/figlet.hash | 2 ++
package/figlet/figlet.mk | 21 +++++++++++++++++++++
5 files changed, 39 insertions(+)
create mode 100644 package/figlet/Config.in
create mode 100644 package/figlet/figlet.hash
create mode 100644 package/figlet/figlet.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f04dd2a..89f30122 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2195,6 +2195,9 @@ F: package/mpv/
F: package/rpi-firmware/
F: package/rpi-userland/

+N: Maik Brenke <Maik.Brenke@continental-corporation.com>
+F: package/figlet/
+
N: Marcin Bis <marcin@bis.org<mailto:marcin@bis.org>.pl>
F: package/bluez5_utils/
F: package/cc-tool/
diff --git a/package/Config.in b/package/Config.in
index 4a81a62e..2a220266 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -279,6 +279,7 @@ comment "Sounds"
source "package/sound-theme-freedesktop/Config.in"

comment "Themes"
+ source "package/figlet/Config.in"
source "package/gtk2-engines/Config.in"

endmenu
diff --git a/package/figlet/Config.in b/package/figlet/Config.in
new file mode 100644
index 00000000..2808c048
--- /dev/null
+++ b/package/figlet/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FIGLET
+ bool "figlet"
+ help
+ FIGlet is a program that creates large characters
+ out of ordinary screen characters
+ _ _ _ _ _ _
+ | (_) | _____ | |_| |__ (_)___
+ | | | |/ / _ \ | __| '_ \| / __|
+ | | | < __/ | |_| | | | \__ \_
+ |_|_|_|\_\___| \__|_| |_|_|___(_)
+
+ The official FIGlet web page: http://www.figlet.org/
diff --git a/package/figlet/figlet.hash b/package/figlet/figlet.hash
new file mode 100644
index 00000000..442c197e
--- /dev/null
+++ b/package/figlet/figlet.hash
@@ -0,0 +1,2 @@
+# locally calculated
+sha256 4d366c4a618ecdd6fdb81cde90edc54dbff9764efb635b3be47a929473f13930 fi=
glet-2.2.5.tar.gz
diff --git a/package/figlet/figlet.mk b/package/figlet/figlet.mk
new file mode 100644
index 00000000..c36d110b
--- /dev/null
+++ b/package/figlet/figlet.mk
@@ -0,0 +1,21 @@
+##########################################################################=
######
+#
+# figlet
+#
+##########################################################################=
######
+
+FIGLET_VERSION =3D 2.2.5
+FIGLET_SITE =3D $(call github,cmatsuoka,figlet,$(FIGLET_VERSION))
+FIGLET_LICENSE =3D BSD-3-Clause
+FIGLET_LICENSE_FILES =3D LICENSE
+
+define FIGLET_BUILD_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+ CC=3D"$(TARGET_CC) -std=3Dgnu89" LD=3D"$(TARGET_CC)" figlet
+endef
+
+define FIGLET_INSTALL_TARGET_CMDS
+ $(INSTALL) -m 0755 -D $(@D)/figlet $(TARGET_DIR)/usr/bin/figlet
+endef
+
+$(eval $(generic-package))
--
2.25.1



Internal

--_000_PA4PR03MB82453FEFC1AC64F478F632E4A056APA4PR03MB8245eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Add package FIGlet to creates large characters out of ordinary terminal cha=
racters.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Signed-off-by: brenkem &lt;Maik.Brenke@continental-corporation.com&gt;</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
---<br>
DEVELOPERS | 3 +++<br>
package/Config.in | 1 +<br>
package/figlet/Config.in | 12 ++++++++++++<br>
package/figlet/figlet.hash | 2 ++<br>
package/figlet/figlet.mk | 21 +++++++++++++++++++++<br>
5 files changed, 39 insertions(+)<br>
create mode 100644 package/figlet/Config.in<br>
create mode 100644 package/figlet/figlet.hash<br>
create mode 100644 package/figlet/figlet.mk<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 1f04dd2a..89f30122 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -2195,6 +2195,9 @@ F: package/mpv/<br>
F: package/rpi-firmware/<br>
F: package/rpi-userland/<br>
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
+N: Maik Brenke &lt;Maik.Brenke@continental-corporation.com&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
+F: package/figlet/<br>
+<br>
N: Marcin Bis &lt;<a style=3D"margin: 0px; text-align: left;" data-linkinde=
x=3D"3" data-ogsc=3D"" title=3D"mailto:marcin@bis.org" class=3D"OWAAutoLink=
 elementToProof" id=3D"OWA33655ebb-b100-f672-cd8b-fd6f0a713415" href=3D"mai=
lto:marcin@bis.org">marcin@bis.org</a>.pl&gt;<br>
F: package/bluez5_utils/<br>
F: package/cc-tool/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 4a81a62e..2a220266 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -279,6 +279,7 @@ comment &quot;Sounds&quot;<br>
source &quot;package/sound-theme-freedesktop/Config.in&quot;<br>
<br>
comment &quot;Themes&quot;<br>
+ source &quot;package/figlet/Config.in&quot;<br>
source &quot;package/gtk2-engines/Config.in&quot;<br>
<br>
endmenu<br>
diff --git a/package/figlet/Config.in b/package/figlet/Config.in<br>
new file mode 100644<br>
index 00000000..2808c048<br>
--- /dev/null<br>
+++ b/package/figlet/Config.in<br>
@@ -0,0 +1,12 @@<br>
+config BR2_PACKAGE_FIGLET<br>
+ bool &quot;figlet&quot;<br>
+ help<br>
+ FIGlet is a program that creates large characters<br>
+ out of ordinary screen characters<br>
+ _ _ _ _ _ _<br>
+ | (_) | _____ | |_| |__ (_)___<br>
+ | | | |/ / _ \ | __| '_ \| / __|<br>
+ | | | &lt; __/ | |_| | | | \__ \_<br>
+ |_|_|_|\_\___| \__|_| |_|_|___(_)<br>
+<br>
+ The official FIGlet web page: <a style=3D"margin: 0px; text-align: left;"=
 data-auth=3D"NotApplicable" data-linkindex=3D"4" data-ogsc=3D"" rel=3D"nor=
eferrer noopener" title=3D"http://www.figlet.org/" class=3D"OWAAutoLink ele=
mentToProof" id=3D"OWA0e8e715b-01ab-9029-14d3-cfc3b1f97f8e" target=3D"_blan=
k" href=3D"http://www.figlet.org/">
http://www.figlet.org/</a><br>
diff --git a/package/figlet/figlet.hash b/package/figlet/figlet.hash<br>
new file mode 100644<br>
index 00000000..442c197e<br>
--- /dev/null<br>
+++ b/package/figlet/figlet.hash<br>
@@ -0,0 +1,2 @@<br>
+# locally calculated<br>
+sha256 4d366c4a618ecdd6fdb81cde90edc54dbff9764efb635b3be47a929473f13930 fi=
glet-2.2.5.tar.gz<br>
diff --git a/package/figlet/figlet.mk b/package/figlet/figlet.mk<br>
new file mode 100644<br>
index 00000000..c36d110b<br>
--- /dev/null<br>
+++ b/package/figlet/figlet.mk<br>
@@ -0,0 +1,21 @@<br>
+##########################################################################=
######<br>
+#<br>
+# figlet<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+FIGLET_VERSION =3D 2.2.5<br>
+FIGLET_SITE =3D $(call github,cmatsuoka,figlet,$(FIGLET_VERSION))<br>
+FIGLET_LICENSE =3D BSD-3-Clause<br>
+FIGLET_LICENSE_FILES =3D LICENSE<br>
+<br>
+define FIGLET_BUILD_CMDS<br>
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \<br>
+ CC=3D&quot;$(TARGET_CC) -std=3Dgnu89&quot; LD=3D&quot;$(TARGET_CC)&quot; =
figlet<br>
+endef<br>
+<br>
+define FIGLET_INSTALL_TARGET_CMDS<br>
+ $(INSTALL) -m 0755 -D $(@D)/figlet $(TARGET_DIR)/usr/bin/figlet<br>
+endef<br>
+<br>
+$(eval $(generic-package))<br>
--<br>
2.25.1</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<br>
<p style=3D"font-family:Arial;font-size:8pt;color:#000000;margin:5pt;font-s=
tyle:normal;font-weight:normal;text-decoration:none;" align=3D"Center">
Internal<br>
</p>
</body>
</html>

--_000_PA4PR03MB82453FEFC1AC64F478F632E4A056APA4PR03MB8245eurp_--

--===============0583988404416833640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0583988404416833640==--
