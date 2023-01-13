Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E81C54EBE
	for <buildroot@archiver.kernel.org>; Fri, 13 Jan 2023 13:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8173582185;
	Fri, 13 Jan 2023 13:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8173582185
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0t-YH3JDteCu; Fri, 13 Jan 2023 13:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AECD482180;
	Fri, 13 Jan 2023 13:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AECD482180
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66EA01BF31C
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 13:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DF5982183
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 13:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DF5982183
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vj_7rtsBBPg9 for <buildroot@lists.busybox.net>;
 Fri, 13 Jan 2023 13:20:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EEFF82056
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2072.outbound.protection.outlook.com [40.107.6.72])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EEFF82056
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 13:20:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KurxQ1mZKEH1kpEv8olg+8TJwr4oov31CpAkpmqjhKMpAZFBdrk2Vxz7cRjydXONvzwlokRmmTBoTkbGzJgtZwP7npKidozrRTYQBzArnaMKM3852lmHq5aMyoqA/QePaJYcNBmsN0EtEUgE9xt6sZL7Ym13lXJsgdCjAFS6Av02J1Vj5ZFfsn7ep60IctSh5IUn2rcGviFSVAQqHc77MOjA5nx5X7P7tX7neKAbBAFFKGfscbJ3z+QEZgl9zsWkMhV3wq4tMEe4j2bSNBgb9rWN+VaagsEweu2xNXQ7XW4hMyOi0IoLsx05gm+STlSKZVgUfumggvPuCeXKE5N+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcxhHdp4KGdWvryG0663yciTZM/a17Y8nzJBVXwO7UM=;
 b=Jd975H0OoXS8cKIQUHZDqzW4Dc9GKTd6j33T7oMV9i8v/3F1C4Xo7fRt0krkq2TJKWPVLj0BazZBWauS7PZMTm5UfosZpFRusSRWEdIFMAFP/A5IpA9zqz2hUGYQ0uwUT8Bb41uD1V3k0nw6EYjbXgGwlKLc8htIS2DIpgi8NrEZe/G27A4zYEDNm0qDLdAfyWCCzbHVyNg4RrQDtmDV6fMa/JjOUgUsi7SCUAWW8SfBTcu5Xyy/is9Ax1ZukB0duDISs1XUwfa6WHoamEhOYtuDX2XbPvoz8/j0XFhjuFyfeuJHX2JRgtTYgRD+agSekcSXZZM+12wSBoT45DxcrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by DU0P251MB0718.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:32b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 13:20:15 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::7431:a93b:4795:8236]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::7431:a93b:4795:8236%8]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 13:20:15 +0000
From: Nicolas Carrier <Nicolas.Carrier@orolia.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: package/pkg-generic.mk: no legal info WARNING if REDISTRIBUTE =
 NO
Thread-Index: AQHZJ1HFoR2Px2c9Wk+c612jfRFZNQ==
Date: Fri, 13 Jan 2023 13:20:15 +0000
Message-ID: <d7d0dede27d4b3a026071a3019b58c5e8df9fe7b.camel@orolia.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1+deb11u1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P251MB0612:EE_|DU0P251MB0718:EE_
x-ms-office365-filtering-correlation-id: 849c92c9-9939-4911-bb34-08daf568e867
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cCsyMtdVCidRNxpspibaJJPi7PYaRviFG0pjCAGb4iTobsXknJ5/BiLf4fxOTaUSXBgjmflmiS5/oN5Qa7qnaAIQna9M6ODP2rHQ6ARiL2Qo3JkSvpeTepnTWhw0L6TnjLXt2I10z14fgOROXW9LDVAEevGB72PVBlrkuioCwuV2wf8o9sXmDAlCUSgiVYyMKIZnx17RnBQHDi4odJLxH+PSU2TgVeUZNeZbjP0S6SWXzd+e5lLkYsFzRvjBfz1ZH9Z0EE7n6759cbcLnh1JPAVcu9wJN5G+cfywozpf6Qxch9/zH2jNe45YzwW2Ygzvq6MHL7hkLu6poBDPhkHPxjTTla8XegJcLvKVldhZtqxAaSsJUF2tf6IEoUWV6Q6gtzEZPtC626L4eyu3C1pA/IXqf3/aQGzpS09RLRZQKgQIORoft/uMUPQB22VvEnrAKWUitcUTJzn2hvWnaKXCAUYj2zMqR7xEor2h+L2nkkPSH3YkB9hXfeK/4NdKsKQHeNHqPf7w2L5axzmNpfSZyXjnQ8uhrGxLFrxoBtUWGlAhzL34w9OTBOUT6mk/d63cqeTTVThACV1r5OTPNHQehJV6IDvHbXNRzdIQ5rqhmP+pe2Eq/EOsR4EXNtBDrbcfP0VqijciZ+Pgd9LKRugh5gwMlsfSnCY9JFhpAyH4vyuEhxXpwtpNq13NLkGsU37DygtM9NmAas3vAGB2109OFeZj+8PzHqnpT1QsDs4LE0o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39850400004)(396003)(376002)(346002)(451199015)(71200400001)(6512007)(186003)(478600001)(66446008)(558084003)(66946007)(76116006)(316002)(66556008)(2616005)(6506007)(91956017)(8676002)(4326008)(6916009)(66476007)(64756008)(6486002)(38100700002)(8936002)(5660300002)(41300700001)(86362001)(83380400001)(36756003)(122000001)(2906002)(99936003)(38070700005)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjlIMnNzandMYTZBWDJzUkQ5K3FpQWllVHgreVhVNkM0bDlBaGJwZFVIbngy?=
 =?utf-8?B?M2Q2dUxmK1BWRU9iN3Q2MWs5K3dkNkxZVVNVTUlPT2Y3SWpEWUtObzJIMlZh?=
 =?utf-8?B?akNqdjZVWjVtY1dKVGtjbTlEQldoVE5PSVowdWttLzlvL0NLZ1cyNmxKRlZy?=
 =?utf-8?B?MVd5MG5ZVEZRcE5mdll0N2d2NWVXUEtyVUdsVTBJdnZqVTlSRnZkd1VkK3BV?=
 =?utf-8?B?RWRjbFdCc2VvV0xHRXRUd1IxdG82eGNFUGNOT2c0T3FnR1RjSkFYZmZ0ZTcx?=
 =?utf-8?B?SmRsVVRNSElsUUEybWJEdlgrdzJvRVpyNk5hT2pKYUl6R2x0U084R2xKWVoz?=
 =?utf-8?B?djhISHRtMFhIY3FCai9wS1BhNnh3eElRdjJnN2ovWmhyMFpCQlYxejEzUjJr?=
 =?utf-8?B?K2hETFdXSG4wd0R2VmtNKy9wZ3ZOMi9TSW1pUGE5YmpMTmwza2VBeGV6OTRZ?=
 =?utf-8?B?K1dVb0pkTG0xNytwUHFqVjJsc244bmZhdlVPQVBiaENSQkxQaVJ6NTFCYU9n?=
 =?utf-8?B?WnkydGZYZ3FrQ1U5S0Uva0pleEF4bzVmeTBDSENyRWpUK3hFTThpS29MUS81?=
 =?utf-8?B?dDFaSE80UWRveGhlNjFjelRYTEYyOUNnbG5RZmV0OTBmMnRmMXQ0eGdsbjY2?=
 =?utf-8?B?d0dkbFp6Q3RzaVYwNHlMVksxVG96SkllbFVGaloxRVdQbGxMc0xCbWhQVG5F?=
 =?utf-8?B?TzVBRVhNcm9mVExEa2plRjRzQkZVcHlSTXMwUmRpWmpKeUJ2NWtRQnRWUStB?=
 =?utf-8?B?aTVXZDFacHpoNnVKeXFEQ0R6TWxJSjRteWpqbkZqZ1FMbHNGWG5ScXV6REUr?=
 =?utf-8?B?ek9xemxkUDdONjcwakNGSnRuWWxGSk1ERmIzUmwvd091b21ZM044QVVkTG5N?=
 =?utf-8?B?WndlSk1TcjljV3piaDljbXp4YXRmblpla2tWUXozUzVRdmNxQ0xFeU1WZWhw?=
 =?utf-8?B?SWo3anlJTzRPT296ZVZLK01PcE96eEw0d1dmUGFUS3BMVnVnVHdnNDNRTVho?=
 =?utf-8?B?aC9WVEYyRXhxVjA3aGR4YmRHRlRQcFpxUnlWenNQY28vUmNxWEhQV3FYZVI1?=
 =?utf-8?B?QnByeE5ZNDdFQXZHSzFNRXVTcVZaRkFxQUoweGZ0czEyVlBNSzR2U3hFaEtH?=
 =?utf-8?B?ZHB1T2RadDVmWHNSalp5bFRPNGVsUllkUnMyYXlKWjlVMTZxWVhyNmJISnNh?=
 =?utf-8?B?NWZiWEZNZjJ6VDJjSUdFcDRzWlZkaVF5U3VWMytZUHNFSDljc0piaDVCQXV1?=
 =?utf-8?B?dXg3Wis0bUZRcm9rMW13dW8vSlJGNStyRjg4cG9MV3Q0QnJaMDRybGdSUjMz?=
 =?utf-8?B?M1g3dGJsVTJCbWlJTUNhUW1CR2ZqRU0vMEsyYURUMTBqMVg2amFKSVA3T0xQ?=
 =?utf-8?B?UXZuM0NYRnhubDI1Y3hxOUt3NWpRbTZ1azBaTk9CanI3VktqQTUvSGx5bW93?=
 =?utf-8?B?aFh4Q1NrclZxMjYxTXR0eUk1TFVRSUdlek5lYmJlTExXVkNaMEVscmY0enZ0?=
 =?utf-8?B?YTNRZ1JsQllrMTZTRjNVMm1sVDI4Q3lqQ3ZQV2JmdTRVK1ZaYmlDTmZNZUFS?=
 =?utf-8?B?WU81TE5Kbzl3S3dVMWx6NHJtV3cwbUMxM1lqaXFwK20wSmh3Qmk4eUZGODlj?=
 =?utf-8?B?L2J3UGk1anlsTTlTWmdVdVdrZTJEQXF6TnYxRVhaeFRucSs0SjhlUm5WZEFz?=
 =?utf-8?B?WmxLeGRsRERXTXFsOXBpK0VuT1BWd3A2cHF3OEhLTFpkWldFSWd3L2tkS3ph?=
 =?utf-8?B?dVBnMjlmYksvU3hucmllaUhJL0dJSW5WbXQ3dWhGWVZJZlljQlEzU2c5dXlO?=
 =?utf-8?B?K0FNaC9zdndNZXF2VC95RVdKMUluK3d1Vllvdzh3NGhabnppd2lZZUl6QWx2?=
 =?utf-8?B?blpKV1RzWHRPVy9kcGRYOHcxWG5TSXRjYzQvOG5DVVZITS9JYUJLbUh3NGlp?=
 =?utf-8?B?MXp5RjdOb3poZTFrWjJkdXliTmNaOFZmNmh5YTJhWGxvTXNWTENtcXNqL0pZ?=
 =?utf-8?B?aHlla1hBeENieHdRS1JSN2t5N0k2OHRBWEZpWUZGSHlUOXd3bWZGelZLRWNL?=
 =?utf-8?B?dDlvMTRBT0VHcGp5dHZQRVNHMVFha0tHMmtEbkdkdzkrYllTSDk0dXZhR0hj?=
 =?utf-8?B?K1U5MVRTeXFjajNlazhwdGZNNDAwTE9hSVl6ak9EM2ZwNnRrT0NZNXNzSzZa?=
 =?utf-8?B?U2VvYWtBU3UrZlpIKzhaM1NsWWozaTdZSHpqRkNrWlJZM296bHk2V0pWMmNT?=
 =?utf-8?Q?mKtwhrNBwldvbbB8X3H2pvF87Ny9d2NAw6A0wPwMv4=3D?=
Content-Type: multipart/mixed;
 boundary="_002_d7d0dede27d4b3a026071a3019b58c5e8df9fe7bcameloroliacom_"
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 849c92c9-9939-4911-bb34-08daf568e867
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 13:20:15.0394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sGohxsHEISYklAUk/Id3M2INpSy8gpoDZ5Qm8tV2v0QSL7JJ4N3FBkoxMakcPnGxXYAXrBj/ukbyRrM/EoxDbiNFB0fM4SYfU6HHdhCnfAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P251MB0718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orolia.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcxhHdp4KGdWvryG0663yciTZM/a17Y8nzJBVXwO7UM=;
 b=XqO0J1aettjgQPpIroJiLuCN2ydO9gJXcE+R4oz9nWC4V7Ca5G4IrVfvrgtpVWdtu8u08eKC2QEHURaUKXfE6UpIaDgoy0nVGVKGUqJ5+ipHdO2sE5Lrca8nZBryViBDtXL09bUIQ7Ua71hy3fUa/Z9/JUGQsbHEzTabVCKGCRU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=orolia.com header.i=@orolia.com header.a=rsa-sha256
 header.s=selector1 header.b=XqO0J1ae
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Subject: [Buildroot] package/pkg-generic.mk: no legal info WARNING if
 REDISTRIBUTE = NO
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--_002_d7d0dede27d4b3a026071a3019b58c5e8df9fe7bcameloroliacom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <45954B7681F28343BDD12F8D2B8FE1E4@EURP251.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

SGVsbG8sDQpIZXJlIGlzIGEgcGF0Y2ggdG8gcmVtb3ZlIHNvbWUgbGVnYWwtaW5mbyB3YXJuaW5n
cyB3aGVuIFJFRElTVFJJQlVURSBpcyBzZXQgdG8gTk8sIGZvciBsb2NhbCBhbmQNCm92ZXJyaWRl
IHBhY2thZ2VzLg0KDQpJIGNhbid0IHVzZSBnaXQgc2VuZC1lbWFpbCBhcyBvdXIgSVQgZGVwYXJ0
bWVudCBoYXMgZm9yYmlkZGVuIHRoZSBzdGFuZGFyZCBwb3AvaW1hcC9zbXRwIG1ldGhvZHMuLi4N
CkkgaG9wZSB0aGF0IHdvbid0IGJlIHRvbyBtdWNoIG9mIGFuIGlzc3VlIDovDQo=

--_002_d7d0dede27d4b3a026071a3019b58c5e8df9fe7bcameloroliacom_
Content-Type: text/x-patch;
	name="0001-package-pkg-generic.mk-no-legal-info-WARNING-if-REDI.patch"
Content-Description:  0001-package-pkg-generic.mk-no-legal-info-WARNING-if-REDI.patch
Content-Disposition: attachment;
	filename="0001-package-pkg-generic.mk-no-legal-info-WARNING-if-REDI.patch";
	size=2500; creation-date="Fri, 13 Jan 2023 13:20:14 GMT";
	modification-date="Fri, 13 Jan 2023 13:20:14 GMT"
Content-ID: <7515D1332B2BCA42AD914EF3835FF0ED@EURP251.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

RnJvbSA2MGE3N2NhZWJjNmQzYjA5MDBlMWJiZTU2YTYxZDgyMWY3YzU4NmY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWNvbGFzIENhcnJpZXIgPG5pY29sYXMuY2FycmllckBvcm9s
aWEuY29tPgpEYXRlOiBGcmksIDEzIEphbiAyMDIzIDEyOjQ2OjIyICswMTAwClN1YmplY3Q6IFtQ
QVRDSCAxLzFdIHBhY2thZ2UvcGtnLWdlbmVyaWMubWs6IG5vIGxlZ2FsIGluZm8gV0FSTklORyBp
ZgogUkVESVNUUklCVVRFID0gTk8KClBhY2thZ2VzIG1ha2luZyB1c2Ugb2YgT1ZFUlJJREVfU1JD
X0RJUiBvciBvZiB0aGUgbG9jYWwgU0lURV9NRVRIT0QsCndpbGwgdHJpZ2dlciBhIHdhcm5pbmcg
d2hlbiB0aGUgbGVnYWwtaW5mbyB0YXJnZXQgaXMgYnVpbHQsIGZvciBleGFtcGxlOgoKV0FSTklO
RzogZm9vOiBzb3VyY2VzIG5vdCBzYXZlZCAobG9jYWwgcGFja2FnZXMgbm90IGhhbmRsZWQpCgpC
dXQgaW4gdGhlIHNpdHVhdGlvbiB3aGVyZSB0aGUgcGFja2FnZXMgaGFzIGV4cGxpY2l0bHkgZGVm
aW5lZApGT09fUkVESVNUUklCVVRFID0gTk8KaW4gaXRzIC5tayBmaWxlLCBpdCBtYWtlcyBubyBz
ZW5zZSBzaW5jZSB0aGUgc291cmNlcyB3b3VsZG4ndCBiZSBzYXZlZAphbnl3YXkuCgpUaGlzIHBh
dGNoIHN3YXAgdGhlIGNvbmRpdGlvbnMgb24gdGhlIHR5cGUgb2YgcGFja2FnZSBhbmQgb24gdGhl
ClJFRElTVFJJQlVURSB2YWx1ZSwgc28gdGhhdCB0aGUgd2FybmluZ3MgZ2V0IGlzc3VlZCBvbmx5
IGlmClJFRElTVFJJQlVURSBlcXVhbHMgWUVTLgoKClNpZ25lZC1vZmYtYnk6IE5pY29sYXMgQ2Fy
cmllciA8bmljb2xhcy5jYXJyaWVyQG9yb2xpYS5jb20+Ci0tLQogcGFja2FnZS9wa2ctZ2VuZXJp
Yy5tayB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsgYi9wYWNrYWdlL3Br
Zy1nZW5lcmljLm1rCmluZGV4IGYyYmVhMDFkN2QuLjJmOGJhMzllZGYgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvcGtnLWdlbmVyaWMubWsKKysrIGIvcGFja2FnZS9wa2ctZ2VuZXJpYy5tawpAQCAtMTE0
NSw2ICsxMTQ1LDcgQEAgZWxzZQogCSQoUSkkJChmb3JlYWNoIEYsJCQoJCgyKV9MSUNFTlNFX0ZJ
TEVTKSwkJChjYWxsIGxlZ2FsLWxpY2Vuc2UtZmlsZSwkJCgkKDIpX1JBV05BTUUpLCQkKCQoMilf
QkFTRU5BTUVfUkFXKSwkJCgkKDIpX0hBU0hfRklMRSksJCQoRiksJCQoJCgyKV9ESVIpLyQkKEYp
LCQkKGNhbGwgVVBQRVJDQVNFLCQoNCkpKSQkKHNlcCkpCiBlbmRpZiAjIGxpY2Vuc2UgZmlsZXMK
IAoraWZlcSAoJCQoJCgyKV9SRURJU1RSSUJVVEUpLFlFUykKIGlmZXEgKCQkKCQoMilfU0lURV9N
RVRIT0QpLGxvY2FsKQogIyBQYWNrYWdlcyB3aXRob3V0IGEgdGFyYmFsbDogZG9uJ3Qgc2F2ZSBh
bmQgd2FybgogCUAkJChjYWxsIGxlZ2FsLXdhcm5pbmctbm9zb3VyY2UsJCQoJCgyKV9SQVdOQU1F
KSxsb2NhbCkKQEAgLTExNTUsNyArMTE1Niw2IEBAIGVsc2UgaWZuZXEgKCQkKCQoMilfT1ZFUlJJ
REVfU1JDRElSKSwpCiBlbHNlCiAjIE90aGVyIHBhY2thZ2VzCiAKLWlmZXEgKCQkKCQoMilfUkVE
SVNUUklCVVRFKSxZRVMpCiAjIFNhdmUgdGhlIHNvdXJjZSB0YXJiYWxsIGFuZCBhbnkgZXh0cmEg
ZG93bmxvYWRzLCBidXQgbm90CiAjIHBhdGNoZXMsIGFzIHRoZXkgYXJlIGhhbmRsZWQgc3BlY2lh
bGx5IGFmdGVyd2FyZHMuCiAJJCQoZm9yZWFjaCBlLCQkKCQoMilfQUNUVUFMX1NPVVJDRV9UQVJC
QUxMKSAkJChub3RkaXIgJCQoJCgyKV9FWFRSQV9ET1dOTE9BRFMpKSxcCkBAIC0xMTY5LDkgKzEx
NjksOSBAQCBpZmVxICgkJCgkKDIpX1JFRElTVFJJQlVURSksWUVTKQogCQkJJCQoJCgyKV9SRURJ
U1RfU09VUkNFU19ESVIpIHx8IGV4aXQgMTsgXAogCQlwcmludGYgIiVzXG4iICIkJCQke2YjIyov
fSIgPj4kJCgkKDIpX1JFRElTVF9TT1VSQ0VTX0RJUikvc2VyaWVzIHx8IGV4aXQgMTsgXAogCWRv
bmUgPCQkKCQoMilfRElSKS8uYXBwbGllZF9wYXRjaGVzX2xpc3QKLWVuZGlmICMgcmVkaXN0cmli
dXRlCi0KIGVuZGlmICMgb3RoZXIgcGFja2FnZXMKKworZW5kaWYgIyByZWRpc3RyaWJ1dGUKIAlA
JCQoY2FsbCBsZWdhbC1tYW5pZmVzdCwkJChjYWxsIFVQUEVSQ0FTRSwkKDQpKSwkJCgkKDIpX1JB
V05BTUUpLCQkKCQoMilfVkVSU0lPTiksJCQoc3Vic3QgJCQoc3BhY2UpJCQoY29tbWEpLCQkKGNv
bW1hKSwkJCgkKDIpX0xJQ0VOU0UpKSwkJCgkKDIpX01BTklGRVNUX0xJQ0VOU0VfRklMRVMpLCQk
KCQoMilfQUNUVUFMX1NPVVJDRV9UQVJCQUxMKSwkJCgkKDIpX0FDVFVBTF9TT1VSQ0VfU0lURSks
JCQoY2FsbCBsZWdhbC1kZXBzLCQoMSkpKQogZW5kaWYgIyBpZm5lcSAoJCQoY2FsbCBxc3RyaXAs
JCQoJCgyKV9TT1VSQ0UpKSwpCiAJJCQoZm9yZWFjaCBob29rLCQkKCQoMilfUE9TVF9MRUdBTF9J
TkZPX0hPT0tTKSwkJChjYWxsICQkKGhvb2spKSQkKHNlcCkpCi0tIAoyLjMwLjIKCg==

--_002_d7d0dede27d4b3a026071a3019b58c5e8df9fe7bcameloroliacom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--_002_d7d0dede27d4b3a026071a3019b58c5e8df9fe7bcameloroliacom_--
