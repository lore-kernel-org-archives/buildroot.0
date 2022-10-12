Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7DEC433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 00:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A3D610B7;
	Thu, 13 Oct 2022 00:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8A3D610B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17DcbkEkVoK0; Thu, 13 Oct 2022 00:19:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3A42610B1;
	Thu, 13 Oct 2022 00:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3A42610B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83F901C1148
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 00:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49A68610B1
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 00:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49A68610B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JuP2WtQP-6Ld for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 00:19:09 +0000 (UTC)
X-Greylist: delayed 00:29:27 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BEDC60ADB
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BEDC60ADB
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 00:19:08 +0000 (UTC)
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CHNohh006594;
 Wed, 12 Oct 2022 19:49:40 -0400
Received: from can01-yqb-obe.outbound.protection.outlook.com
 (mail-yqbcan01lp2235.outbound.protection.outlook.com [104.47.75.235])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3k3643jq8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 19:49:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaA0kYo0a7dgGlakFW9ZhAtLTxRKzv6QLxa54KIGALv+mRLWoY6YwJOHat9RK/+Zd+kA6vBEKMuZTRuoRuolwifDFGrtBXnJAuJiH47yPq7CH4XO/wyft/0K075/NIN4iekX+YyTH9PpyqdQAglfP87f6VBbr4SYIglFVD9gJ9ok2YjVpwxhifFUX0wVbFLx6o3asoKifN52ZH9g1+Z3pP2yBgeDWnuUQT5g16lc4MiD6ZzIu+YoGf0XWD+hC5YfGqyDw9ki9fU0gGlvUOWRC3WS9AdPMRMyLNdIUEh7yU8Dw26sHBrzSCxBRnMKFWQr64QaqKUnIStdIC5IkERfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvAzx2V+dClGkYyMOFg7kmkuV6IFbJdoOePMiZZ6brs=;
 b=Vr1TrHjwPT1EDwd6GFNTsmhkjYOukD90I0vEmtYtwm5nt+yMTI0DkQYeJvP0BkndzNkymazYcWC2kc9vABlARkI4e+D7vDgcQ0wF2kMLJxppjInNguSL2bZjGTAqRKIHmHwzpmFfdb/zXngtDF0DH5MffybuKbnCz7YArDdqucQlA74PpSOXO4B0wzYtK0iM1ODlvskm1Lv5CNlwh73/+AzckXwVmS2IBB/dhcjkI3McZ5GtPEkoPjv5vxXdmm+LB6w4HlqBNEExyL6O7a1L1CiSitR0yd0btp9slFZvSDfCTrr4omD/yiKSjScTrzRiLUf5ombT4eYeTfg5y05JTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YT2PR01MB9061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22; Wed, 12 Oct
 2022 23:49:37 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::1fb3:6df9:3684:6921]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::1fb3:6df9:3684:6921%9]) with mapi id 15.20.5709.022; Wed, 12 Oct 2022
 23:49:37 +0000
To: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "arnout@mind.be"
 <arnout@mind.be>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "peter@korsgaard.com" <peter@korsgaard.com>
Thread-Topic: [Buildroot] [PATCH] Config.in: introduce BR2_TIME_BITS_64 option
 for Y2038 compatibility
Thread-Index: AQHY3oSs9t2TxLnT80+TyAdTZCbS1a4LbYmA
Date: Wed, 12 Oct 2022 23:49:37 +0000
Message-ID: <5eebf7dee2a585f50a4e986c214677a157bfd22c.camel@calian.com>
References: <20221012215008.2918444-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20221012215008.2918444-1-thomas.petazzoni@bootlin.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB8838:EE_|YT2PR01MB9061:EE_
x-ms-office365-filtering-correlation-id: 65a64010-706c-4bbb-1eb5-08daacac6c60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LD9tWm/VVwo5hD6w7/VkQIO24rpdqfAcJfSR63Ag+ohlnzlEruBAmNpZtI4fCblqJoh58H7/W08tnb+GCRSbwAcwGkee/VL8FF2LmkRI9T58b6LAnwoXr3FaHpLztEBKNnn6SKzydcapc2ALtxDMzVmkTcqu2vgmRC5u4Jsl2Mt/tFhqwVl9Ny8HAFpSk2swSYdXkiEcvHssF13rUnMTWYgtaTLkv6f70VRSkH7hmwSkP5GyNhVAMUlGsDDvRQdPkrW2WYjpfq1NU1dh3L54gnnTpH416eZtLeIKRlz3eaLui82t0ck1FMfKQiTAbWoIQP4BpR0OFmLKeKfD6+Ef4PXZaVP5jhSgSSijaQhVhwyrVRjvtjZKHYw4vhPJ2irL4OAlw/nK3tmtOqL8+/zn6Zii4eKNc2CY3sc51Qq4pzkTf8cyz2JjOnS0yiSParXiwHfwAsqlEW/mKbuuhQEdKWIOr1HbByLcVNhA3zzh3D7Bpqw4wt9wFljtKDYWewMdGQOGS8TLi1DMsS4E0zAjYIxA9qzYSplESLwaOefJ8zSbTYMyp5CrqKKS0El68fYlwt5hAVQDjB38IltjynzCo6L2Qn4sgg3dpXOIREHAhhizPeIfy/Lvbt6h75wwLnawLJiTRk85F7u7cGi7jsD3eWl9OOXUK4/vu2Suc33Pzx1j9bbtyr37D/34yDyaqFdUyoAYnuqWLtbZnREWOKVFSFemORPjBQqgByIcN5adHRmRsWvYFzWnW7XagutKA8r2wEZkyTeaBsV4QHYZfFtdkudWclN/ifm209aEd9Ep+UHEZ5N3ZmEzvs1aI3d/dA87CbbEWn2lqgqnDA1LeTZwqaIFupMZe4A76RKWqMDQ0ao=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199015)(122000001)(86362001)(15974865002)(36756003)(38070700005)(38100700002)(316002)(8676002)(64756008)(66446008)(66556008)(66476007)(66946007)(76116006)(71200400001)(110136005)(4001150100001)(2906002)(44832011)(8936002)(41300700001)(5660300002)(186003)(2616005)(83380400001)(478600001)(6486002)(6512007)(6506007)(26005)(41080700001)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjVWcmVRZzNqY0pucHVhK0Y4dWRwSHV0OXQvQkY2bEgyc0dadzlEUnVJZG50?=
 =?utf-8?B?Wklack1xWEMrVjBXRHFoSXRIMXNwSmtMNzdBVS9SNEZjajEzZDNyVUJ0d0lU?=
 =?utf-8?B?WjM2V2t2Mnl2cGtHNFUxdlR3OWdsTXE5VlRydXg1cWRZOFRkTWdkS2NVSFln?=
 =?utf-8?B?c2cxQXdMbG1VWGZET05YWXpiemo5T3NnWFBxc3VXOHp3RDBVclJJWS8yU21E?=
 =?utf-8?B?cE8ra0RNc1hHOFJRVmgvZXJiVnphWlBuRWNjY2RaRXMrR2V5cEpZMllyT3Z5?=
 =?utf-8?B?NW5YRkdoOStxdHErNmxwZ25tOHdBWXliNTZZVHZZeWJaa3lISFBkZFNXekF2?=
 =?utf-8?B?Tko0Qis4T2dxOHZTZkdxYlBqZXJuSkNkWUcrSnhzNVFrclNkVGx0QTNMNGxt?=
 =?utf-8?B?M3dqR0s3Y05nK2ZnemV6ZGhOOFZSVm4xa0JGekxmaE5BcDEyN2lwVzE2ZFpj?=
 =?utf-8?B?azgyWFB1aVlXQnpuVFVtUnhaM3dpMEMvYVlIMHJKV21IcEpmNnpzQVJrSFg5?=
 =?utf-8?B?K3ZKRkhZWldwM0tuSXdaUHR1QzV0a0pCMVhoby9Bdm81OXZ5eXlWL3NHVWdS?=
 =?utf-8?B?QjN6cE1sM25aWVFJdExJcE9icWFqTlA5Z2dwOW02REVMUFBqM3V3cHE0bVpB?=
 =?utf-8?B?Z2g2NW16bGdCKzZRbk9qTCtienRlL2dYalZ5Q3QrOVV3Z0c1OTU0OWw3MFhK?=
 =?utf-8?B?d3RMdUFUV2Vsb3ZLbjQrQzQxdVREdTc1RFZRTUx6NW1RWWZ0VEhxNGc2ckk4?=
 =?utf-8?B?T2ZSYkVCTFlac2ZIVWZTQmhFcUUwL01OTVhXMTNFNDdVdzBGMk0rRmFzTzRm?=
 =?utf-8?B?U0tvVVBJUUVvTWhNUG9ERzRkcE51a3J2dFZ0ZVlSYmJ3T090eGRQRnR3Q2cr?=
 =?utf-8?B?RlY0cm13WlZWZ2RBZW1QSk53WmpWM1FIY1BJdndubzVHdGlZSy8wNTBrTVBP?=
 =?utf-8?B?ZklSWTFXVTBmTExsZGRQRUF6Q3pWZ2wzbDFUTVBPd3dLdXhET3FzOStiSXZm?=
 =?utf-8?B?MHJ1bDhPNUR1eHZhTzNZWmszZmJ2c0VaNkNQclJ4SVJYVG96amNQN0JTT3FN?=
 =?utf-8?B?b25MQU15TjJPREhWV3EwaWVtemtpNUZuQmx1YzBkWTdiQUV4bGJEVWU2ZFRw?=
 =?utf-8?B?KzRKeFlKOVEyRTh0ZmprUHVtbk8yMHIya3RYNXNLS1ptQmZRLzR6eERkcXRh?=
 =?utf-8?B?WkZHOHg2WDJrZStDM1owQktZaXZtblRtU1pDNFFHWFB3eXhydzlaZllmWnRv?=
 =?utf-8?B?S2pwOWgwem1rVjRwMFV0TjdwNW15RmtsbmJ1NE9KcjIvRUlBRUpFcHZSY0hU?=
 =?utf-8?B?YXZoOXpiUTZwcCt3THk2VGh0MlN6aGRiME40MDBIOWdSeUNlaWlXcUY0L2Vm?=
 =?utf-8?B?Vk9FOGc5WjlMZkhSRk40WlF3Y3RrRmYxM0RLZ3ZUY3pQSWlvVzQwelpvRHR0?=
 =?utf-8?B?bkdoRUtBQUpGOTlnRHA5Q2hGdlh0NUpOZUJHTzlpQ0dyRTJaNDJqMzh0bEQ5?=
 =?utf-8?B?UXlueDBuUnhhYXhtWjZOUVA4bUhxbm1ubi9IM3hlOUVQVTliOGZVVjIyMnB3?=
 =?utf-8?B?Q3RwU0ZuakcrUnNlSnc0M1JDRzViN0NQVWhDelVjMEUwLzlmU1RidWtycVZG?=
 =?utf-8?B?ZGJxekZsTVFZVm9SczJPY0NENVk4OUJMcHc0UkRZc1J5NERoWjR6VUdMMFJR?=
 =?utf-8?B?MXFWZmhSem00WndQdnZxekJlWXFPeVlQRTB6a3hDZlV2ZjNQYVplTHFybU94?=
 =?utf-8?B?NEdScWdONS9PaUdNQWJzK3BzMjhkVG81WHlzOGtIU08yVjgwa0kxaUdBRFZs?=
 =?utf-8?B?Y2R4RVV3c0YwaUdpZHZKLytiLzlJRW9CbEJiUXU1Vk1sU2tqMGpyQnJuNXlj?=
 =?utf-8?B?VnVtbUFNeWxoanhCdjBvSW1DQy9qNnF6WE9PUHY5eEFGTEFBem9GVmtpTUNQ?=
 =?utf-8?B?UloybWtaTHBwYzBTV1FtMzgyZkRZNzhQMG9RUzdKeEJDdUxqWWYzQ1UyS1Nt?=
 =?utf-8?B?eXBsR1NEdUxwZTRQMnZPYlR3VnJzNTJCTGkxZURVWk1QMHlaMWZrR3RnWmFK?=
 =?utf-8?B?TXNUb0RySlJoVUs3b2IxTGhVQVRQTU5aSUFTNFhydEczQU1uQkJOYVgxemNQ?=
 =?utf-8?B?STI3QVkrenBmTzdkUURITDdXRHMxOUE5WThDaDJsMGZIR3Q0MktENDFCbncz?=
 =?utf-8?B?QXc9PQ==?=
Content-ID: <B299EA04EE1504438B03FBAEF702813C@CANPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a64010-706c-4bbb-1eb5-08daacac6c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2022 23:49:37.8312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: klLJFhIHsdpswhuH9UB7uoBSo8ItVBE+euX9lxH4UqtZe4FN0bi3yxnZMHBIJ5X6WKrAqba8Ku3JEquNKeO2c3IGPHod19X5K6hKyhFwfSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB9061
X-Proofpoint-ORIG-GUID: grD7qxG5r3nxfS5-OvpOHmYQJPxsAhsp
X-Proofpoint-GUID: grD7qxG5r3nxfS5-OvpOHmYQJPxsAhsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_12,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210120148
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=calian.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvAzx2V+dClGkYyMOFg7kmkuV6IFbJdoOePMiZZ6brs=;
 b=q5WerdzMAsZR0gs2bvP6d/gcGkruvuRFUISO4p3Fj3qBdx6u8QTZmOPclP5jxsrDpbEvFDjU6QldGScSKXHAdGxcw+wD8j+TTS4NZC4nUL9WMOSCKnim/rnglseZ3CKm1TCGEIfvqqcs/ycWlRVhJ1LruQgW3755H1wN+S7fmLM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=calian.com header.i=@calian.com header.a=rsa-sha256
 header.s=selector1 header.b=q5WerdzM
Subject: Re: [Buildroot] [PATCH] Config.in: introduce BR2_TIME_BITS_64
 option for Y2038 compatibility
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
From: Robert Hancock via buildroot <buildroot@buildroot.org>
Reply-To: Robert Hancock <robert.hancock@calian.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyMDIyLTEwLTEyIGF0IDIzOjUwICswMjAwLCBUaG9tYXMgUGV0YXp6b25pIHZpYSBi
dWlsZHJvb3QNCndyb3RlOg0KPiBZMjAzOCBpcyBub3cgYWxtb3N0IG9ubHkgMTUgeWVhcnMgYXdh
eSwgYW5kIGVtYmVkZGVkIHN5c3RlbXMgYnVpbHQNCj4gdG9kYXkgYXJlIHBvdGVudGlhbGx5IGdv
aW5nIHRvIHN0aWxsIGJlIG9wZXJhdGlvbmFsIGluIDE1IHllYXJzLCBhbmQNCj4gZXZlbiB0aG91
Z2ggdGhleSBhcmUgc3VwcG9zZWQgdG8gcmVjZWl2ZSB1cGRhdGVzIGJ5IHRoZW4sIHdlIGFsbCBr
bm93DQo+IGhvdyB0aGluZ3MgZ28sIGFuZCBwb3RlbnRpYWxseSBzb21lIG9mIHRoZXNlIGVtYmVk
ZGVkIHN5c3RlbXMgd2lsbA0KPiBub3QNCj4gcmVjZWl2ZSBhbnkgdXBkYXRlLg0KPiANCj4gSW4g
MjAzOCwgdGhlIHNpZ25lZCAzMi1iaXQgcmVwcmVzZW50YXRpb24gb2YgdGltZV90IHVzZWQgb24g
MzItYml0DQo+IGFyY2hpdGVjdHVyZXMgd2lsbCBvdmVyZmxvdywgY2F1c2luZyBhbGwgdGltZS1y
ZWxhdGVkIGZ1bmN0aW9ucyB0byBnbw0KPiBiYWNrIGluIHRpbWUgaW4gYSBzdXJwcmlzaW5nIHdh
eS4NCj4gDQo+IFRoZSBMaW51eCBrZXJuZWwgaGFzIGFscmVhZHkgYmVlbiBtb2RpZmllZCB0byBz
dXBwb3J0IGEgNjQtYml0DQo+IHJlcHJlc2VudGF0aW9uIG9mIHRpbWVfdCBvbiAzMi1iaXQgYXJj
aGl0ZWN0dXJlcywgYnV0IGZyb20gYSBDDQo+IGxpYnJhcnkNCj4gcGVyc3BlY3RpdmUsIHRoZSBz
aXR1YXRpb24gdmFyaWVzOg0KPiANCj4gwqAtIGdsaWJjIHVzZXMgdGhpcyA2NC1iaXQgdGltZV90
IHJlcHJlc2VudGF0aW9uIG9uIDMyLWJpdCBzeXN0ZW1zDQo+IMKgwqAgc2luY2UgZ2xpYmMgMi4z
NCwgYnV0IG9ubHkgaWYgLURfVElNRV9CSVRTPTY0IGlzDQo+IMKgwqAgc3BlY2lmaWVkLiBUaGVy
ZWZvcmUsIHRoaXMgY29tbWl0IGFkZHMgYW4gb3B0aW9uIHRvIGFkZCB0aGlzIGZsYWcNCj4gwqDC
oCBnbG9iYWxseSB0byB0aGUgYnVpbGQsIHdoZW4gZ2xpYmMgaXMgdGhlIEMgbGlicmFyeSBhbmQg
dGhlDQo+IMKgwqAgYXJjaGl0ZWN0dXJlIGlzIG5vdCA2NC1iaXQuDQo+IA0KPiDCoC0gbXVzbCB1
c2VzIHVuY29uZGl0aW9uYWxseSBhIDY0LWJpdCB0aW1lX3QgcmVwcmVzZW50YXRpb24gb24gMzIt
Yml0DQo+IMKgwqAgc3lzdGVtcyBzaW5jZSBtdXNsIDEuMi4wLiBTbyB0aGVyZSBpcyBub3RoaW5n
IHRvIGRvIGhlcmUgc2luY2UNCj4gwqDCoCBCdWlsZHJvb3QgaGFzIGJlZW4gdXNpbmcgYSBtdXNs
ID49IDEuMi4wLCB1c2VkIHNpbmNlIEJ1aWxkcm9vdA0KPiDCoMKgIDIwMjAuMDUuIE5vIEJ1aWxk
cm9vdCBvcHRpb24gaXMgbmVlZGVkIGhlcmUuDQo+IA0KPiDCoC0gdUNsaWJjLW5nIGRvZXMgbm90
IHN1cHBvcnQgYSA2NC1iaXQgdGltZV90IHJlcHJlc2VudGF0aW9uIG9uIDMyLQ0KPiBiaXQNCj4g
wqDCoCBzeXN0ZW1zLCBzbyBzeXN0ZW1zIHVzaW5nIHVDbGliYy1uZyB3aWxsIG5vdCBiZSBZMjAz
OCBjb21wbGlhbnQsDQo+IGF0DQo+IMKgwqAgbGVhc3QgZm9yIG5vdy4gTm8gQnVpbGRyb290IG9w
dGlvbiBpcyBuZWVkZWQgaGVyZS4NCj4gDQo+IEl0IHNob3VsZCBiZSBub3RlZCB0aGF0IGJlaW5n
IFkyMDM4LWNvbXBsaWFudCB3aWxsIG9ubHkgd29yayBpZiBhbGwNCj4gYXBwbGljYXRpb24vbGli
cmFyeSBjb2RlIGlzIGNvcnJlY3QuIEZvciBleGFtcGxlIGlmIGFuDQo+IGFwcGxpY2F0aW9uL2xp
YnJhcnkgc3RvcmVzIGEgdGltZXN0YW1wIGluIGFuICJpbnQiIGluc3RlYWQgb2YgdXNpbmcNCj4g
dGhlIHByb3BlciB0aW1lX3QgdHlwZSwgdGhlbiB0aGUgbWVjaGFuaXNtcyBkZXNjcmliZWQgYWJv
dmUgd2lsbCBub3QNCj4gZml4IHRoaXMsIGFuZCB0aGUgYXBwbGljYXRpb24vbGlicmFyeSB3aWxs
IGNvbnRpbnVlIHRvIGJlIGJyb2tlbiBpbg0KPiB0ZXJtcyBvZiBZMjAzOCBzdXBwb3J0Lg0KPiAN
Cj4gUG9zc2libGUgZGlzY3Vzc2lvbnMgcG9pbnRzIGFib3V0IHRoaXMgcGF0Y2g6DQo+IA0KPiDC
oC0gU2hvdWxkIHdlIGhhdmUgYW4gb3B0aW9uIGF0IGFsbCwgb3Igc2hvdWxkIHdlIHVuY29uZGl0
aW9uYWxseSBwYXNzDQo+IMKgwqAgLURfVElNRV9CSVRTPTY0LCBsaWtlIHdlIGhhdmUgYmVlbiBk
b2luZyBmb3IgX0ZJTEVfT0ZGU0VUX0JJVFM9NjQNCj4gwqDCoCBmb3IgcXVpdGUgc29tZSB0aW1l
LiBUaGUgcmVhc29uaW5nIGZvciBoYXZpbmcgYW4gb3B0aW9uIGlzIHRoYXQNCj4gwqDCoCB0aGUg
bWVjaGFuaXNtIGlzIGl0c2VsZiBvcHQtaW4gaW4gZ2xpYmMsIGFuZCBnZW5lcmFsbHkgcmVsYXRp
dmVseQ0KPiDCoMKgIG5ldywgc28gaXQgc2VlbWVkIGxvZ2ljYWwgZm9yIG5vdyB0byBtYWtlIGl0
IG9wdGlvbmFsIGFzIHdlbGwgaW4NCj4gwqDCoCBCdWlsZHJvb3QuDQoNClRoZXJlJ3Mgc29tZSBj
aGFuY2Ugb2Ygc29mdHdhcmUgYmVpbmcgYnJva2VuIGJ5IGVuYWJsaW5nIHRoaXMsIHdpdGgNCmVp
dGhlciBhIGNvbXBpbGUgb3IgcnVudGltZSBmYWlsdXJlLiBGb3IgZXhhbXBsZSwgYXBwbGljYXRp
b25zIHRoYXQNCmFzc3VtZSBzaXplb2YodGltZV90KSA9PSBzaXplb2YobG9uZykgd291bGQgd29y
ayBvbiAzMi1iaXQgcGxhdGZvcm1zDQp3aXRoIGEgMzItYml0IHRpbWUgYW5kIDY0LWJpdCBwbGF0
Zm9ybXMgd2l0aCBhIDY0LWJpdCB0aW1lLCBidXQgZmFpbA0Kd2l0aCBhIDY0LWJpdCB0aW1lIG9u
IDMyLWJpdC4gSSBiZWxpZXZlIEkndmUgc2VlbiB0aGlzIHdoZW4gdHJ5aW5nIHRvDQpidWlsZCBz
b2Z0d2FyZSB3aXRoIHRoYXQgb3B0aW9uLCBzbyB0dXJuaW5nIHRoaXMgb24gdW5jb25kaXRpb25h
bGx5DQptaWdodCBiZSB1bndpc2UsIHVubGVzcyAgc29tZSBidWlsZCB0ZXN0cyBvZiB0aGUgc3Vw
cG9ydGVkIHBhY2thZ2VzDQpoYXZlIGJlZW4gZG9uZS4uDQoNCj4gDQo+IMKgLSBTaG91bGQgd2Ug
c2hvdyBzb21ldGhpbmcgKGEgQ29uZmlnLmluIGNvbW1lbnQ/KSBpbiB0aGUgbXVzbCBhbmQNCj4g
wqDCoCB1Q2xpYmMtbmcgY2FzZSB0byBsZXQgdGhlIHVzZXIga25vdyB0aGF0IHRoZSBjb2RlIGlz
IFkyMDM4DQo+IMKgwqAgY29tcGxpYW50IChtdXNsKSBvciBub3QgWTIwMzggY29tcGxpYW50ICh1
Q2xpYmMtbmcpLiBPciBzaG91bGQNCj4gdGhpcw0KPiDCoMKgIGRpc2N1c3Npb24gYmUgcGFydCBv
ZiB0aGUgQnVpbGRyb290IGRvY3VtZW50YXRpb24/DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPg0KPiAtLS0NCj4gwqBD
b25maWcuaW7CoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE2ICsrKysrKysrKysrKysrKysNCj4gwqBw
YWNrYWdlL01ha2VmaWxlLmluIHzCoCAzICsrKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0NvbmZpZy5pbiBiL0NvbmZpZy5pbg0KPiBp
bmRleCAzYzU3YzU5MWE4Li40NmM4MGZlMmYwIDEwMDY0NA0KPiAtLS0gYS9Db25maWcuaW4NCj4g
KysrIGIvQ29uZmlnLmluDQo+IEBAIC03NTMsNiArNzUzLDIyIEBAIGNvbmZpZyBCUjJfUEVSX1BB
Q0tBR0VfRElSRUNUT1JJRVMNCj4gwqANCj4gwqBlbmRtZW51DQo+IMKgDQo+ICtjb25maWcgQlIy
X1RJTUVfQklUU182NA0KPiArwqDCoMKgwqDCoMKgwqBib29sICJCdWlsZCBZMjAzOC1yZWFkeSBj
b2RlIg0KPiArwqDCoMKgwqDCoMKgwqBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fVVNFU19HTElC
QyAmJiAhQlIyX0FSQ0hfSVNfNjQNCj4gK8KgwqDCoMKgwqDCoMKgaGVscA0KPiArwqDCoMKgwqDC
oMKgwqDCoCBUaGlzIG9wdGlvbiB3aWxsIHBhc3MgLURfVElNRV9CSVRTPTY0IGluIHRoZSBjb21w
aWxlciBmbGFncw0KPiArwqDCoMKgwqDCoMKgwqDCoCB0byBlbnN1cmUgdGhlIGdsaWJjIEMgbGli
cmFyeSB1c2VzIGEgNjQtYml0IHJlcHJlc2VudGF0aW9uDQo+ICvCoMKgwqDCoMKgwqDCoMKgIGZv
ciB0aW1lX3QgYW5kIG90aGVyIHRpbWUgdHlwZXMsIHdoaWNoIGVuc3VyZXMgdGhhdA0KPiArwqDC
oMKgwqDCoMKgwqDCoCBwcm9ncmFtcy9saWJyYXJpZXMgd2lsbCBjb3JyZWN0bHkgaGFuZGxlIHRp
bWUgcGFzdCB5ZWFyDQo+ICvCoMKgwqDCoMKgwqDCoMKgIDIwMzguDQo+ICsNCj4gK8KgwqDCoMKg
wqDCoMKgwqAgTm90ZXM6DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIFRoaXMgb3B0aW9uIG9u
bHkgaGFzIGFuIGVmZmVjdCB3aXRoIGdsaWJjID49IDIuMzQuDQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtIFRoZSBtdXNsIEMgbGlicmFyeSBzaW5jZSBpdHMgdmVyc2lvbiAxLjIwIGlzDQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5jb25kaXRpb25hbGx5IFkyMDM4IGNvbXBsaWFudC4N
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIC0gVGhlIHVDbGliYy1uZyBsaWJyYXJ5IGlzIG5vdCBZ
MjAzOCBjb21wbGlhbnQuDQo+ICsNCj4gwqBjb21tZW50ICJTZWN1cml0eSBIYXJkZW5pbmcgT3B0
aW9ucyINCj4gwqANCj4gwqBjb25maWcgQlIyX1BJQ19QSUVfQVJDSF9TVVBQT1JUUw0KPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9NYWtlZmlsZS5pbiBiL3BhY2thZ2UvTWFrZWZpbGUuaW4NCj4gaW5k
ZXggNDNkMjE0YmNiZS4uNTlkODhiYjk3ZSAxMDA2NDQNCj4gLS0tIGEvcGFja2FnZS9NYWtlZmls
ZS5pbg0KPiArKysgYi9wYWNrYWdlL01ha2VmaWxlLmluDQo+IEBAIC0xNjMsNiArMTYzLDkgQEAg
VEFSR0VUX0hBUkRFTkVEICs9IC1EX0ZPUlRJRllfU09VUkNFPTINCj4gwqBlbmRpZg0KPiDCoA0K
PiDCoFRBUkdFVF9DUFBGTEFHUyArPSAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0
X1NPVVJDRSAtDQo+IERfRklMRV9PRkZTRVRfQklUUz02NA0KPiAraWZlcSAoJChCUjJfVElNRV9C
SVRTXzY0KSx5KQ0KPiArVEFSR0VUX0NQUEZMQUdTICs9IC1EX1RJTUVfQklUUz02NA0KPiArZW5k
aWYNCj4gwqBUQVJHRVRfQ0ZMQUdTID0gJChUQVJHRVRfQ1BQRkxBR1MpICQoVEFSR0VUX0FCSSkN
Cj4gJChUQVJHRVRfT1BUSU1JWkFUSU9OKSAkKFRBUkdFVF9ERUJVR0dJTkcpICQoVEFSR0VUX0hB
UkRFTkVEKQ0KPiDCoFRBUkdFVF9DWFhGTEFHUyA9ICQoVEFSR0VUX0NGTEFHUykNCj4gwqBUQVJH
RVRfRkNGTEFHUyA9ICQoVEFSR0VUX0FCSSkgJChUQVJHRVRfT1BUSU1JWkFUSU9OKQ0KPiAkKFRB
UkdFVF9ERUJVR0dJTkcpDQoNCi0tIA0KUm9iZXJ0IEhhbmNvY2sNClNlbmlvciBIYXJkd2FyZSBE
ZXNpZ25lciwgQ2FsaWFuIEFkdmFuY2VkIFRlY2hub2xvZ2llcw0Kd3d3LmNhbGlhbi5jb20NCg0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
