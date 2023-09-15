Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29764EE644A
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 09:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4CE983BD2;
	Fri, 15 Sep 2023 09:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4CE983BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rl8pu2O93NcR; Fri, 15 Sep 2023 09:04:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECE1F83BC8;
	Fri, 15 Sep 2023 09:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECE1F83BC8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16A9F1BF410
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 09:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E345483BC7
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 09:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E345483BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvno5AfaX4XG for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 09:04:05 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe16::720])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 192DA83BA5
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 09:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 192DA83BA5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GARWIE9/JNw8EOY50IuzlmmscKNmzsE3vXl8SYxVoju/s2DGw50RsVioeQOoxuZAht/9ZCeO4iX/HNL2bag/k2SAi9Nx4mLhJbGKBDA+wD7CtbIh6prlcH3N0gJJCauBWlVPhQeDn+hWAEFi8sXFTGAtlEw3hLE//95zUSFqDD0dS+QW/uyGgFRn1uxnUSjW0ZniT/pT/qggvD7QYMfWeFqr9RfHb2LjO0IR5WHvqwixx/E0deBUBGscLFlPu/Iw9UEEbtc4o8w2jwR811d7ZcoYb2mHLyzlx/7ukUutmScd0clQ2r/abGLdRdxIFqTVarD76KrTNnwBhEYcqJvfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2TIQAtZBHR+ONSWAkeKanZugOa0rQOBSWgwGYNKHhg=;
 b=RZgyWehoURhgOx5druRrl4bFy6Y98bBkFqQt4G38TEtV5oXPfzhjGFDneIo+OWWT009XZviYThkNBcbBUHQZbqdt6rB0ElgAUwpdcu+5n/jtQEY/PwreIaa632xtytvcKqofGUY/OWt3zAn7Ms6Q8KrWqH6AlCtNn68fMgK5rgaMvR/N5m6DGPwbuuxqVuR/qgc1oQQOeRH3gCaezsWLTf/7C8ZU5Uz92id7tsuSJKq4nNfCr+bEFkO+dsA7c0VFqOlsN7qXJ8GWPxdNdR6xY7ulhwnLzQiLZoGwucng6AssjpYKRThad3tSaKiy5qCyUF4pa+dsWBUCXspOjuYhvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=circontrol.com; dmarc=pass action=none
 header.from=circontrol.com; dkim=pass header.d=circontrol.com; arc=none
Received: from DB4PR05MB10390.eurprd05.prod.outlook.com (2603:10a6:10:3f1::21)
 by AM8PR05MB8211.eurprd05.prod.outlook.com (2603:10a6:20b:369::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 09:03:58 +0000
Received: from DB4PR05MB10390.eurprd05.prod.outlook.com
 ([fe80::f894:e6fe:9c60:d964]) by DB4PR05MB10390.eurprd05.prod.outlook.com
 ([fe80::f894:e6fe:9c60:d964%7]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 09:03:58 +0000
From: Ivan Castell <icastell@circontrol.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Probably a bug with g++11 when dealing with threads
Thread-Index: AQHZ57L/JfS+ep80XE2bBRwO5qkIvQ==
Date: Fri, 15 Sep 2023 09:03:58 +0000
Message-ID: <DB4PR05MB103902A1CD6049B8AC3019451A3F6A@DB4PR05MB10390.eurprd05.prod.outlook.com>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR05MB10390:EE_|AM8PR05MB8211:EE_
x-ms-office365-filtering-correlation-id: b71dcc9e-25e8-4eb3-8707-08dbb5cab242
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cgHjmgdJ5Emo0lTzHA+4u0QJJEhezFQBo5trpjybMEuOpnDYejlYuK/gLU8bbjlRdWSAOJD1G+FLsc0ow+c90/nGNFaGblq60jUj/DJlgNx78y5fqlF/i1OGbnkM/n34zfsaayXmeTNT/Vts0ukEKxBo4yiLEAJGP5/8ZlLydCt03eOqujBjaVNmciwo8/cBYD/7DjfPo4rk1dtw5eVUhDhuDOX5mAzFVWKAlT/ZgC7+tzsNx51KCjCWkFPas7+kVvtD+GhC3QSZGFaBplcFqi86Li2QltEyMgFLTf8a1nPEF9Ycbg6gzVs/rVACxr9cjuls1dDda/aE2TIgJ7gTJ1AtdsPAoXPRUSmPnk8eNPx5nmZ/338k2KlBNT6sNRI5AvNKFpQoZrpyIrRsfBjQDaQ7NkWT6qLLYtOKY97BAMbok2SkJVxm5iP9mhG4l4DWbNj79iXAsIvqEFyu3RoffkKTvbwHPOlr5UueNhjN/lcoiQSSTz/QNAQrUpnwGr+ye/F8ZoxjqCXq7V/EilCPJGiFe0pVE9wZJsTASZdbtmMX+hVlXIgBUVVNpqapjPKPfUXFnEoEBW84QdnhPNrN8X3neBrQCoYeMjFLlxCyR6wOaRb1uFM0VrcB5pZzMHYl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB4PR05MB10390.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(376002)(346002)(396003)(366004)(136003)(1800799009)(186009)(451199024)(9686003)(71200400001)(7696005)(6506007)(66899024)(122000001)(33656002)(86362001)(38070700005)(38100700002)(55016003)(26005)(76116006)(66946007)(6916009)(64756008)(66556008)(66476007)(66446008)(91956017)(316002)(41300700001)(2906002)(52536014)(5660300002)(8676002)(8936002)(19627405001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vkl1QWNldGRGT0hlMmd3VW81VmJsTElaTDQ0UmZiZnNoTGhTOG5scG9tWDVp?=
 =?utf-8?B?aExTSlhHVWJKMHp5c0o1YVNJeUFQSmhFaHR1aFh3TklDcEhnbXRYVlVXM2ty?=
 =?utf-8?B?eHhIa2tVeFRtZHRWRlNJenYrbTRrelY2aEFpZ1JHWHNIR1FDU0N0S1hrelVa?=
 =?utf-8?B?MlBtYTcxWW8zbXFoNURMTW9Ybk4wdXdwa2UrU0dTTzRzV0ppOWxRM2hhdGgx?=
 =?utf-8?B?cDNDcWJuMHFTdWw4WHFOc1NCZHdhZHlGQnprS0Y5dTNBSG9yR0hISTg4S1pH?=
 =?utf-8?B?Mi9WTGh1ZUpwc2p1dTNkZXFOWWFUWXppS2swQW1YVGhjdWJUME0rb3g1VHRH?=
 =?utf-8?B?cTdNcUJzclRjZE95MlpXczYzelVKbm0rYnl5S3FlZlJUOGx2VFRJaUpHdVQw?=
 =?utf-8?B?UjM5L29ta1pUbERCbHIvYVk5OGZ5K3FCbjUvYmdHU0xLdXhCVDhNTTFNWTRo?=
 =?utf-8?B?VHFDdjhlakZWekVzVFM2T2Y1b0tkbTFNamZNc0JDZHNoU2JkTmlpSlhuaEhX?=
 =?utf-8?B?L29oN0RPOWliVDU5VUFhdXRVbFljY2NYRzJxWEExbkpJSVIzditsbmRDcUwx?=
 =?utf-8?B?eVl2RWllNzNSTFJ3aXFkQSs2TURoMUNTTkVJdHM2M3EzdmgyRys0SDJyUzEw?=
 =?utf-8?B?STVJemVDWEhjTHNSU1JyQW5QRWJTZmdZb3owNkp0NFh3NXpsb2I5T2NjZkgx?=
 =?utf-8?B?NkNvQ2h6OWRNYTBITlFMU0ZZM0ltT2VCSVg1Ky8wYVFWQ0FGQlpkbkZOejU2?=
 =?utf-8?B?b1FkdzlzRTNxNVprZnVZNzdjUS8xazU5c0ZObjBhVmpGcitvM0pyZmNGWm15?=
 =?utf-8?B?c0l6WXU0Q2d1UnJzRG5Sa3hYN0pXRkttbmdZV0E1VTVoR3A1b2tvMEszWlI2?=
 =?utf-8?B?MzdsYlAxdy9UZlJjOWRGZmEwN1FLeDJvNjN1OVdhVkRUOXU1ODZ4ekhSNlRG?=
 =?utf-8?B?TzBjcnB3VW0yQ3dtSk1qMjlWQlNFS2FrVVFvUjZsSUtrT0tkRUdrTms2cXNS?=
 =?utf-8?B?RXM2aUdWV1hmMGVGZmtWeGxjOWFNYzdGeXJ3OVJQTEh4c3lwSTRVREtrL1Zl?=
 =?utf-8?B?WWFrby9Sb0hubVhsWmtXV0xDMTVpazlubmU0UDV1TE1BcUVoMCs4ZUZ1QmdT?=
 =?utf-8?B?ZThQNFFmVHN6TURRR2Frd2VsbWlZTHB6MVFDeTU3RUZtc2NPbDVVdjRFVEFy?=
 =?utf-8?B?cVZPNkkvNVBlazI2K2VUWW8vbWRmeHg1WUxnL0JYTUxGVXhpYUdFZEZoQkRG?=
 =?utf-8?B?dDdPVnZEb0tIK3QxYjhKV2R5bzFzV2dqZDZtL2x1d0Z3bnlKOFVXN0lRS3VB?=
 =?utf-8?B?K050VElKTmpVZXRUbGgxRVVVRkFUWnlpallWeHR1b0RBT2h0ZWtJQmk4a0dm?=
 =?utf-8?B?eWNmRzZBa3ZLUmttRXJkQ2QxeG84Sm1STFJJVi9wT2FtVjFObkZtai9PVjEy?=
 =?utf-8?B?Zk9OU09NTFlpWC96Y2RyZjRVT3U0VGUwNXVWdWNnNUZwNUxrR00wOG4xTXRC?=
 =?utf-8?B?Umxoa2tKYnBwM29ZTzFDME5Sc3lMRTB0V1dWTkdMY3JsUXk3cXd6Z1VPSUdp?=
 =?utf-8?B?bWc2eC9rYTh2RmI5YVZlOEc2RW9kMXFOT0UrSWZWekF0bnpVR1h0ZnFmbWRH?=
 =?utf-8?B?bE9OWGxlNGd5VkY4NU1HZVR0b2M4U0tpS2UrMUt6OGRLbi92YWJZWGJ2OSt4?=
 =?utf-8?B?YklGSCt3SDYrdFlYaVRHa05FUmNUaGFkcWJMeDdqVWtYc0dsVEM5UWNIUjM5?=
 =?utf-8?B?K29RQWVXemMxVGVOL002ZEd2ZDdaSUdKZllUUmJCTCtSK2piWC95WFVzdFZQ?=
 =?utf-8?B?UGt3YmZqL0RLdTlubXF0NnFPSEg5OTFkaUJHcXcrZjYrcmthY3BhekhMRzJq?=
 =?utf-8?B?QXUzdzdMbnJJemZTVFg0OUc1U1haZmU4KzRCcXliTGxxL1BaOVVKODVBNjA4?=
 =?utf-8?B?N2pneTNyNDlnbUI4a2EzckkvRm9PMDlaN1Biek1zODVRMy9qWVYwNG43dDNU?=
 =?utf-8?B?RFRXb3pwTnNqdVJxTlVzMWYyM3ptNENIMjliZUVRZ3dPZjFzcjFqOVJrWVpk?=
 =?utf-8?B?aElFY3pMYTZkclIxb2RxeXZGSFVtdmxHZHVReER1c1ExYnZoWloxMlF6SWla?=
 =?utf-8?Q?Zeujm9K480RgQYWK0k9E4c0gp?=
MIME-Version: 1.0
X-OriginatorOrg: circontrol.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR05MB10390.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b71dcc9e-25e8-4eb3-8707-08dbb5cab242
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2023 09:03:58.1427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c673de90-55df-4102-975b-51c12c395a99
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00y634TQO5CKwKj1JE1pm8Ns1Eo3HRvfUaR9PTSZMgwWRbiKLGFDiIRfZUtsOawA3N2mXKjoOCGb8YNwj1XhaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR05MB8211
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=circontrol.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2TIQAtZBHR+ONSWAkeKanZugOa0rQOBSWgwGYNKHhg=;
 b=Hx+xhWbkI9AFHjYkpkLpGfmrQBwyJcO1U1SOsTQ/zTvVuHJAr+C5vG78BdK7DmoJ7k9rcrp/Ps+bj6pQStCszTLaX3z4CU7ijxU26IVkQFoYdVpfXbicmktpGBSnZg6W0MDjlXHlkTW1OGElSNA5ef8VVJAxkWQYm3pBPefCz1ISHbrTwUmg/0OfH9LbgHbZ0kyK3hIe3oD5SDmzcD/ljuMZfdutjTxHv1IiofJF5jmmFtNMfhIMZBnlNJf4C5H2kIhAWf/xakv5XT3ZM2nscBPsUTLbdZvJolNU6IV/YoTMHkfIiN4JjEt562qnY7L1tbKdwKKiJIhAKT++e7Rxmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=circontrol.com header.i=@circontrol.com
 header.a=rsa-sha256 header.s=selector1 header.b=Hx+xhWbk
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=circontrol.com;
Subject: [Buildroot] Probably a bug with g++11 when dealing with threads
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
Content-Type: multipart/mixed; boundary="===============1542460385167123264=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1542460385167123264==
Content-Language: es-ES
Content-Type: multipart/alternative;
	boundary="_000_DB4PR05MB103902A1CD6049B8AC3019451A3F6ADB4PR05MB10390eu_"

--_000_DB4PR05MB103902A1CD6049B8AC3019451A3F6ADB4PR05MB10390eu_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2UgaGF2ZSBiZWVuIGRlYWxpbmcgd2l0aCB0aGlzIGtpbmQgb2YgY29tcGlsYXRpb24gZXJyb3Jz
IHdoZW4gdHJ5aW5nIHRvIGJ1aWxkIG91ciBhcHBsaWNhdGlvbiBzZXR0aW5nIHVwIGdjYyAxMS54
IGFuZCBiaW51dGlscyAyLjM5Og0KDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3Vzci9sb2NhbC9z
aGFyZS9icm9vdC9jY2wyL291dHB1dC9ob3N0L2FybS1idWlsZHJvb3QtbGludXgtZ251ZWFiaWhm
L2luY2x1ZGUvYysrLzExLjQuMC90aHJlYWQ6NDMsDQogICAg4pSGICAg4pSGICAg4pSGICAg4pSG
ZnJvbSBhcHAvZmlsZS5jcHA6MzY6DQovdXNyL2xvY2FsL3NoYXJlL2Jyb290L2NjbDIvb3V0cHV0
L2hvc3QvYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvaW5jbHVkZS9jKysvMTEuNC4wL2Jp
dHMvc3RkX3RocmVhZC5oOiBJbiBjb25zdHJ1Y3RvciAnc3RkOjp0aHJlYWQ6OnRocmVhZChfQ2Fs
bGFibGUmJiwgX0FyZ3MmJiAuLi4pJzoNCi91c3IvbG9jYWwvc2hhcmUvYnJvb3QvY2NsMi9vdXRw
dXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9pbmNsdWRlL2MrKy8xMS40LjAv
Yml0cy9zdGRfdGhyZWFkLmg6MTQ1OjEzOiBlcnJvcjogY2Fubm90IGNvbnZlcnQgJ2ludCcgdG8g
J3ZvaWQgKCopKCknDQogIDE0NSB8ICAgICAgICAgICAgIF9fZGVwZW5kKTsNCiAgICDilIYgfCAg
ICAgICAgICAgICBefn5+fn5+fg0KICAgIOKUhiB8ICAgICAgICAgICAgIHwNCiAgICDilIYgfCAg
ICAgICAgICAgICBpbnQNCg0KVGhhdCBwcm9ibGVtIHNlZW1zIHRvIGJlIHJlbGF0ZWQgd2l0aCB0
aGlzIGZpbGU6DQoNCuKAguKAguKAguKAguKAguKAgi91c3IvbG9jYWwvc2hhcmUvYnJvb3QvY2Ns
Mi9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9pbmNsdWRlL2MrKy8x
MS40LjAvYml0cy9zdGRfdGhyZWFkLmgNCg0KVGhpcyBpcyB0aGUgcmVsYXRlZCBzb3VyY2UgY29k
ZToNCg0K4oCC4oCC4oCC4oCC4oCC4oCCI2lmZGVmIEdUSFJfQUNUSVZFX1BST1hZDQrigILigILi
gILigILigILigIIgICAgICAgIC8vIENyZWF0ZSBhIHJlZmVyZW5jZSB0byBwdGhyZWFkX2NyZWF0
ZSwgbm90IGp1c3QgdGhlIGd0aHIgd2VhayBzeW1ib2wuDQrigILigILigILigILigILigIIgICAg
ICAgIGF1dG8gX19kZXBlbmQgPSByZWludGVycHJldF9jYXN0PHZvaWQoKikoKT4oJnB0aHJlYWRf
Y3JlYXRlKTsNCuKAguKAguKAguKAguKAguKAgiNlbHNlDQrigILigILigILigILigILigIIgICAg
ICAgIGF1dG8gX19kZXBlbmQgPSBudWxscHRyOw0K4oCC4oCC4oCC4oCC4oCC4oCCI2VuZGlmDQri
gILigILigILigILigILigIIgICAgICAgIHVzaW5nIF9XcmFwcGVyID0gX0NhbGxfd3JhcHBlcjxf
Q2FsbGFibGUsIF9BcmdzLi4uPjsNCuKAguKAguKAguKAguKAguKAgiAgICAgICAgLy8gQ3JlYXRl
IGEgY2FsbCB3cmFwcGVyIHdpdGggREVDQVlfQ09QWShfX2YpIGFzIGl0cyB0YXJnZXQgb2JqZWN0
DQrigILigILigILigILigILigIIgICAgICAgIC8vIGFuZCBERUNBWV9DT1BZKF9fYXJncykuLi4g
YXMgaXRzIGJvdW5kIGFyZ3VtZW50IGVudGl0aWVzLg0K4oCC4oCC4oCC4oCC4oCC4oCCICAgICAg
ICBfTV9zdGFydF90aHJlYWQoX1N0YXRlX3B0cihuZXcgX1N0YXRlX2ltcGw8X1dyYXBwZXI+KCBz
dGQ6OmZvcndhcmQ8X0NhbGxhYmxlPihfX2YpLCBzdGQ6OmZvcndhcmQ8X0FyZ3M+KF9fYXJncyku
Li4pKSwgX19kZXBlbmQpOw0K4oCC4oCC4oCC4oCC4oCC4oCCICAgICAgfQ0K4oCC4oCC4oCC4oCC
4oCC4oCCI2VuZGlmIC8vIF9HTElCQ1hYX0hBU19HVEhSRUFEUw0KDQpXZSBoYXZlIGJlZW4gYWJs
ZSB0byBmaXggdGhpcyBjb21waWxhdGlvbiBlcnJvciBpbiB0d28gZGlmZmVyZW50IHdheXM6DQoN
CuKAguKAguKAguKAguKAguKAgjEuIERlZmluaW5nIG1hY3JvIC1ER1RIUl9BQ1RJVkVfUFJPWFkg
d2hlbiBjb21waWxpbmcgb3VyIGFwcGxpY2F0aW9uDQrigILigILigILigILigILigIIyLiBGb3Jj
aW5nIHRoZSB0eXBlY2FzdCwgcmVwbGFjaW5nIHRoaXMgbGluZToNCg0K4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCCYXV0byBfX2RlcGVuZCA9IG51bGxwdHI7DQoNCndpdGggdGhp
cyBsaW5lOg0KDQrigILigILigILigILigILigILigILigILigILigILigILigIJhdXRvIF9fZGVw
ZW5kID0gcmVpbnRlcnByZXRfY2FzdDx2b2lkKCopKCk+KG51bGxwdHIpOw0KDQpXZSB0aGluayB0
aGlzIGlzIGEgYnVnIHRoYXQgc2hvdWxkIGJlIGZpeGVkIGluIGZ1dHVyZSByZWxlYXNlcy4NCg0K
SG9wZSB5b3UgY2FuIGludmVzdGlnYXRlIGZ1cnRoZXIuDQpNYW55IHRoYW5rcyBpbiBhZHZhbmNl
Lg0KDQpLaW5kIHJlZ2FyZHMsDQogIC0tIEl2YW4NCg==

--_000_DB4PR05MB103902A1CD6049B8AC3019451A3F6ADB4PR05MB10390eu_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBB
cHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBI
ZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAw
KTsiIGNsYXNzPSJlbGVtZW50VG9Qcm9vZiBDb250ZW50UGFzdGVkMCI+DQo8ZGl2IGNsYXNzPSJD
b250ZW50UGFzdGVkMCI+V2UgaGF2ZSBiZWVuIGRlYWxpbmcgd2l0aCB0aGlzIGtpbmQgb2YgY29t
cGlsYXRpb24gZXJyb3JzIHdoZW4gdHJ5aW5nIHRvIGJ1aWxkIG91ciBhcHBsaWNhdGlvbiBzZXR0
aW5nIHVwIGdjYyAxMS54IGFuZCBiaW51dGlscyAyLjM5OjwvZGl2Pg0KPGRpdj48YnIgY2xhc3M9
IkNvbnRlbnRQYXN0ZWQwIj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iQ29udGVudFBhc3RlZDAiPklu
IGZpbGUgaW5jbHVkZWQgZnJvbSAvdXNyL2xvY2FsL3NoYXJlL2Jyb290L2NjbDIvb3V0cHV0L2hv
c3QvYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvaW5jbHVkZS9jKysvMTEuNC4wL3RocmVh
ZDo0Myw8L2Rpdj4NCjxkaXYgY2xhc3M9IkNvbnRlbnRQYXN0ZWQwIj4mbmJzcDsgJm5ic3A7IOKU
hiAmbmJzcDsg4pSGICZuYnNwOyDilIYgJm5ic3A7IOKUhmZyb20gYXBwL2ZpbGUuY3BwOjM2Ojwv
ZGl2Pg0KPGRpdiBjbGFzcz0iQ29udGVudFBhc3RlZDAiPi91c3IvbG9jYWwvc2hhcmUvYnJvb3Qv
Y2NsMi9vdXRwdXQvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9pbmNsdWRlL2Mr
Ky8xMS40LjAvYml0cy9zdGRfdGhyZWFkLmg6IEluIGNvbnN0cnVjdG9yICdzdGQ6OnRocmVhZDo6
dGhyZWFkKF9DYWxsYWJsZSZhbXA7JmFtcDssIF9BcmdzJmFtcDsmYW1wOyAuLi4pJzo8L2Rpdj4N
CjxkaXYgY2xhc3M9IkNvbnRlbnRQYXN0ZWQwIj4vdXNyL2xvY2FsL3NoYXJlL2Jyb290L2NjbDIv
b3V0cHV0L2hvc3QvYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvaW5jbHVkZS9jKysvMTEu
NC4wL2JpdHMvc3RkX3RocmVhZC5oOjE0NToxMzogZXJyb3I6IGNhbm5vdCBjb252ZXJ0ICdpbnQn
IHRvICd2b2lkICgqKSgpJzwvZGl2Pg0KPGRpdiBjbGFzcz0iQ29udGVudFBhc3RlZDAiPiZuYnNw
OyAxNDUgfCAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBfX2RlcGVu
ZCk7PC9kaXY+DQo8ZGl2IGNsYXNzPSJDb250ZW50UGFzdGVkMCI+Jm5ic3A7ICZuYnNwOyDilIYg
fCAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBefn5+fn5+fjwvZGl2
Pg0KPGRpdiBjbGFzcz0iQ29udGVudFBhc3RlZDAiPiZuYnNwOyAmbmJzcDsg4pSGIHwgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfDwvZGl2Pg0KPGRpdiBjbGFzcz0i
Q29udGVudFBhc3RlZDAiPiZuYnNwOyAmbmJzcDsg4pSGIHwgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgaW50PC9kaXY+DQo8ZGl2PjxiciBjbGFzcz0iQ29udGVudFBh
c3RlZDAiPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJDb250ZW50UGFzdGVkMCI+VGhhdCBwcm9ibGVt
IHNlZW1zIHRvIGJlIHJlbGF0ZWQgd2l0aCB0aGlzIGZpbGU6PC9kaXY+DQo8ZGl2PjxiciBjbGFz
cz0iQ29udGVudFBhc3RlZDAiPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJDb250ZW50UGFzdGVkMCI+
4oCC4oCC4oCC4oCC4oCC4oCCL3Vzci9sb2NhbC9zaGFyZS9icm9vdC9jY2wyL291dHB1dC9ob3N0
L2FybS1idWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL2luY2x1ZGUvYysrLzExLjQuMC9iaXRzL3N0
ZF90aHJlYWQuaDwvZGl2Pg0KPGRpdj48YnIgY2xhc3M9IkNvbnRlbnRQYXN0ZWQwIj4NCjwvZGl2
Pg0KPGRpdiBjbGFzcz0iQ29udGVudFBhc3RlZDAiPlRoaXMgaXMgdGhlIHJlbGF0ZWQgc291cmNl
IGNvZGU6PC9kaXY+DQo8ZGl2PjxiciBjbGFzcz0iQ29udGVudFBhc3RlZDAiPg0KPC9kaXY+DQo8
ZGl2IGNsYXNzPSJDb250ZW50UGFzdGVkMCI+4oCC4oCC4oCC4oCC4oCC4oCCI2lmZGVmIEdUSFJf
QUNUSVZFX1BST1hZPC9kaXY+DQo8ZGl2IGNsYXNzPSJDb250ZW50UGFzdGVkMCI+4oCC4oCC4oCC
4oCC4oCC4oCCICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOy8vIENyZWF0ZSBhIHJlZmVyZW5j
ZSB0byBwdGhyZWFkX2NyZWF0ZSwgbm90IGp1c3QgdGhlIGd0aHIgd2VhayBzeW1ib2wuPC9kaXY+
DQo8ZGl2IGNsYXNzPSJDb250ZW50UGFzdGVkMCI+4oCC4oCC4oCC4oCC4oCC4oCCICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwO2F1dG8gX19kZXBlbmQgPSByZWludGVycHJldF9jYXN0Jmx0O3Zv
aWQoKikoKSZndDsoJmFtcDtwdGhyZWFkX2NyZWF0ZSk7PC9kaXY+DQo8ZGl2IGNsYXNzPSJDb250
ZW50UGFzdGVkMCI+4oCC4oCC4oCC4oCC4oCC4oCCI2Vsc2U8L2Rpdj4NCjxkaXYgY2xhc3M9IkNv
bnRlbnRQYXN0ZWQwIj7igILigILigILigILigILigIIgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7YXV0byBfX2RlcGVuZCA9IG51bGxwdHI7PC9kaXY+DQo8ZGl2IGNsYXNzPSJDb250ZW50UGFz
dGVkMCI+4oCC4oCC4oCC4oCC4oCC4oCCI2VuZGlmPC9kaXY+DQo8ZGl2IGNsYXNzPSJDb250ZW50
UGFzdGVkMCI+4oCC4oCC4oCC4oCC4oCC4oCCICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO3Vz
aW5nIF9XcmFwcGVyID0gX0NhbGxfd3JhcHBlciZsdDtfQ2FsbGFibGUsIF9BcmdzLi4uJmd0Ozs8
L2Rpdj4NCjxkaXYgY2xhc3M9IkNvbnRlbnRQYXN0ZWQwIj7igILigILigILigILigILigIIgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7Ly8gQ3JlYXRlIGEgY2FsbCB3cmFwcGVyIHdpdGggREVD
QVlfQ09QWShfX2YpIGFzIGl0cyB0YXJnZXQgb2JqZWN0PC9kaXY+DQo8ZGl2IGNsYXNzPSJDb250
ZW50UGFzdGVkMCI+4oCC4oCC4oCC4oCC4oCC4oCCICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
Oy8vIGFuZCBERUNBWV9DT1BZKF9fYXJncykuLi4gYXMgaXRzIGJvdW5kIGFyZ3VtZW50IGVudGl0
aWVzLjwvZGl2Pg0KPGRpdiBjbGFzcz0iQ29udGVudFBhc3RlZDAiPuKAguKAguKAguKAguKAguKA
giAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtfTV9zdGFydF90aHJlYWQoX1N0YXRlX3B0cihu
ZXcgX1N0YXRlX2ltcGwmbHQ7X1dyYXBwZXImZ3Q7KCBzdGQ6OmZvcndhcmQmbHQ7X0NhbGxhYmxl
Jmd0OyhfX2YpLCBzdGQ6OmZvcndhcmQmbHQ7X0FyZ3MmZ3Q7KF9fYXJncykuLi4pKSwgX19kZXBl
bmQpOzwvZGl2Pg0KPGRpdiBjbGFzcz0iQ29udGVudFBhc3RlZDAiPuKAguKAguKAguKAguKAguKA
giAmbmJzcDsgJm5ic3A7ICZuYnNwO308L2Rpdj4NCjxkaXYgY2xhc3M9IkNvbnRlbnRQYXN0ZWQw
Ij7igILigILigILigILigILigIIjZW5kaWYgLy8gX0dMSUJDWFhfSEFTX0dUSFJFQURTPC9kaXY+
DQo8ZGl2PjxiciBjbGFzcz0iQ29udGVudFBhc3RlZDAiPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJD
b250ZW50UGFzdGVkMCI+V2UgaGF2ZSBiZWVuIGFibGUgdG8gZml4IHRoaXMgY29tcGlsYXRpb24g
ZXJyb3IgaW4gdHdvIGRpZmZlcmVudCB3YXlzOjwvZGl2Pg0KPGRpdj48YnIgY2xhc3M9IkNvbnRl
bnRQYXN0ZWQwIj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iQ29udGVudFBhc3RlZDAiPuKAguKAguKA
guKAguKAguKAgjEuIERlZmluaW5nIG1hY3JvIC1ER1RIUl9BQ1RJVkVfUFJPWFkgd2hlbiBjb21w
aWxpbmcgb3VyIGFwcGxpY2F0aW9uPC9kaXY+DQo8ZGl2IGNsYXNzPSJDb250ZW50UGFzdGVkMCI+
4oCC4oCC4oCC4oCC4oCC4oCCMi4gRm9yY2luZyB0aGUgdHlwZWNhc3QsIHJlcGxhY2luZyB0aGlz
IGxpbmU6PC9kaXY+DQo8ZGl2PjxiciBjbGFzcz0iQ29udGVudFBhc3RlZDAiPg0KPC9kaXY+DQo8
ZGl2IGNsYXNzPSJDb250ZW50UGFzdGVkMCI+4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCCYXV0byBfX2RlcGVuZCA9IG51bGxwdHI7PC9kaXY+DQo8ZGl2PjxiciBjbGFzcz0iQ29u
dGVudFBhc3RlZDAiPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJDb250ZW50UGFzdGVkMCI+d2l0aCB0
aGlzIGxpbmU6PC9kaXY+DQo8ZGl2PjxiciBjbGFzcz0iQ29udGVudFBhc3RlZDAiPg0KPC9kaXY+
DQo8ZGl2IGNsYXNzPSJDb250ZW50UGFzdGVkMCI+4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCCYXV0byBfX2RlcGVuZCA9IHJlaW50ZXJwcmV0X2Nhc3QmbHQ7dm9pZCgqKSgpJmd0
OyhudWxscHRyKTs8L2Rpdj4NCjxkaXY+PGJyIGNsYXNzPSJDb250ZW50UGFzdGVkMCI+DQo8L2Rp
dj4NCjxkaXYgY2xhc3M9IkNvbnRlbnRQYXN0ZWQwIj5XZSB0aGluayB0aGlzIGlzIGEgYnVnIHRo
YXQgc2hvdWxkIGJlIGZpeGVkIGluIGZ1dHVyZSByZWxlYXNlcy48L2Rpdj4NCjxkaXY+PGJyIGNs
YXNzPSJDb250ZW50UGFzdGVkMCI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IkNvbnRlbnRQYXN0ZWQw
Ij5Ib3BlIHlvdSBjYW4gaW52ZXN0aWdhdGUgZnVydGhlci48L2Rpdj4NCjxkaXYgY2xhc3M9IkNv
bnRlbnRQYXN0ZWQwIj5NYW55IHRoYW5rcyBpbiBhZHZhbmNlLjwvZGl2Pg0KPGRpdj48YnIgY2xh
c3M9IkNvbnRlbnRQYXN0ZWQwIj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iQ29udGVudFBhc3RlZDAi
PktpbmQgcmVnYXJkcyw8L2Rpdj4NCiZuYnNwOyAtLSBJdmFuPGJyPg0KPC9kaXY+DQo8L2JvZHk+
DQo8L2h0bWw+DQo=

--_000_DB4PR05MB103902A1CD6049B8AC3019451A3F6ADB4PR05MB10390eu_--

--===============1542460385167123264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1542460385167123264==--
