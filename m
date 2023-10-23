Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF43C001E0
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 12:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50A5441FBC;
	Mon, 23 Oct 2023 12:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50A5441FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5x53qv-jt3Fb; Mon, 23 Oct 2023 12:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FD1F41FA7;
	Mon, 23 Oct 2023 12:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FD1F41FA7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 180BD1BF385
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 12:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7C9460B8A
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 12:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7C9460B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnQvTr2Q2nKS for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 12:40:49 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::60d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3129E60864
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 12:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3129E60864
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmfMaSKbJjB/nQmp05wt6nZk1PqZyt+HcMfuPbZEwRsZHcqw1+KWgeACSdA4Opb/VpNIwnvCTCqk/apsMbCFfvxO85SLaEWsB/MwSL+pDGWCc8XgN5k5HM1Mj+UVa/um6NVlDuUVrO4CV2BPGG80lRLfWAb5yNMWktgbaLsW1VCezWUrx+rcqMF2EDysGH/L1bc9smiJYLz5Yh2TT9De3fqFm8T6hu/WuPetnQp/+n3+Zxvyo6zNfWMfUHxcw1otAHsT9eiboRFY7u7ILiCoBg5b0Bs/Vk6MwSpx+wXleKUQ4C5Qg+lRaqMuS+KM9Dfe9YZi6NpQEaT4kJWNzDz8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0hE6tOb5SpCkX3HvcxqJ+ExffHKe+S0VrEPTpsAJOg=;
 b=kVaJxBy9cDee0koIni0ukv/DtdzSyx90+ANP19CI3dGcYs+/XkiGNz5iBORpmFpjBybsyhAdHRZq+2jb+cO5fCbgb7h4suOjjCBVt6ojO4bQgw7vn8Cn6NjNatDGvhEclKccS6DM7yrLrsMnJ/zYK2d2qq+Xb5DWBtT/jVAYdWSYj5sLbHyDpcYL7m+qH6iWCxnyQ1mNCX2SyNBXGbk9adyFA35NdhgtnR6ihHtczeilY9darX1QKTSYdqT065WlnYtnKZl7NDZbj3H3PA45XHPncsSLzqgLMRx1Z7PxtD2EdVgvIbikmpUyh4Ka+BNN5Ov/eNB8WKsPrTyLpy1jrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by DB8P193MB0664.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:151::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 12:40:43 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::67a4:c94:e069:11a7]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::67a4:c94:e069:11a7%6]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 12:40:43 +0000
Message-ID: <e1ef03a2-8f5f-4cd3-a433-e180eb3203d5@othermo.de>
Date: Mon, 23 Oct 2023 14:40:41 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Carlos Alberto Lopez Perez <clopez@igalia.com>
References: <20231020142041.25503-1-clopez@igalia.com>
 <20231021213800.GG2607@scaer>
In-Reply-To: <20231021213800.GG2607@scaer>
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|DB8P193MB0664:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1b251f-2b92-43db-7a08-08dbd3c545b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QGmJpiORcuXUW8Vv1zVzo8n3DErloUjh7owrAGCFrZFd+FjfSZUBL8Ku5XkcGSeICQUObHlKe8jiDh2kqbzY4whyZXrERuAtkEAunbzBUkek1zr3DTTXaENGSeTBvLI+jtKL3aGr+PU+bl3WtxCU17Yooc1v7vut0TRsBXwFipL05dV7ldlDduxA8ZoeuIt/8/rd8m+9mLimqjIJNVK4BXbPgCUOfm8jDQVOn8EwXVeln5ZSq7e3YgFzHGE0RVtvFif51t23iZX5H6pG8WKRA2eLzwLGoAiLM9QOITRwyUJ35ej3XEm1QQM6c6D1IfTljAhFlorMYHBWyKeEmZ6poT27qQjqdwqWCuaTxcczTiV3r0SDzcRvv3zPNto5h5eYhIdYGvQz3hl7PB1RNpdDHBnAZCJics4VVWmyhsTQR7037yqWW5/eLZE6no3drcI1ZHW5sxiGnwtmbra5A+S+1upUHtsZVjtTNGaqZ4W44KWP/dRDrexuDN/6gI7wGH7XwhMV9Mx7WScX2gX0cKa4btiI2U/BQG638VatxM1FK0FRDmMtp+wK71ZzaAHyB5L3P+9Ewv571ljSElNvi1VCwgx3lyX1SmwhdDPIY8lNcB20kbz8fqYVAkW6w34H+utOYLdWrIVh3XS/Nzt3ym7d94vvWDUscb/zVvzZH/S4ET0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(39830400003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(31686004)(4001150100001)(38100700002)(2906002)(44832011)(41300700001)(86362001)(31696002)(5660300002)(36756003)(8676002)(8936002)(4326008)(2616005)(478600001)(6506007)(110136005)(66476007)(54906003)(316002)(66946007)(66556008)(966005)(6486002)(53546011)(6512007)(45980500001)(43740500002)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emhBY3BGS2lGbUNFTnF3RE1kdlkvYkNVMEdiSTN6dUM2MXNKWXRudEx3bUh3?=
 =?utf-8?B?Q3dycUtMSGZuM3JQbFJTWG9ZSmlvWUhGZzZ0M1ArZ3JEOTU5RW5mM2FoYTZX?=
 =?utf-8?B?VDhPaTBFbmJTbS94MC8vdGdHRlA0aFl4LzAxSjl1RldKblcyNFczUzdOdkxU?=
 =?utf-8?B?aXhIeTNxSTRpZGlhWkxmL0hwNnlSTTIrSjJLb3NkalJiaFY4VVRTN3hEajFU?=
 =?utf-8?B?Y2VabXVQSVdHYkFYak1pR3dORWx5SkI1SDNTNXlNUytZaElBL3FwSUNYL1gx?=
 =?utf-8?B?eU9IUFBodWFuSDRQQjNVWmU2SzBWdFpGY0Q4amFmdVhtMTZsQVJDYTV2Y1VL?=
 =?utf-8?B?SmdtOWdGZXRQdnEyTWNZR0VEbndsNXhlSmlPbDB0VWYzOGhuL0tGbHpJbENw?=
 =?utf-8?B?WHE3b2VqSkJIUXlDRExHN3JlWlc4NGVIUnJzVVdhRzNXWWlGS3pLQ0MwRGdR?=
 =?utf-8?B?dXhLTEJQTUU4eVEvSzJtVXhKSDRrSStxTTM0RkdsUTdCTmRJYTBweTg5Wmhv?=
 =?utf-8?B?UzE1VUlXdVlDRTFYbHdrY1paQzNZdVBTMEVXakdCbXlrSW1uWTVCSlY1ejBH?=
 =?utf-8?B?WUlQdUtqckwvazg5RktoTjhwU1dpeWd4NTJuc1B4blAzYzhiMkVtdXJ3QW5j?=
 =?utf-8?B?TDA2SGo3dWxORk9BRVV5dDc5YXEzemJ1dEVOd0paaDdjYnlsT1NzaThsWm52?=
 =?utf-8?B?YjJVTU5RMTZRWjQxSnJrcnhuSGZHNlF2bWJBL3BTSWpqZkJ1dlE2Q0NUWW94?=
 =?utf-8?B?bURuVUN2NThNaXcrYkQvN25IdVo0c2lWQVFUYmhvYXhRRjlZamprbFFkZEZk?=
 =?utf-8?B?WlBZL3VnSEpuNDlGMllUTVVMaWhzbjhzenAzWWtKWUpNb1VBTTVBa2ZLakRS?=
 =?utf-8?B?UmxKS2VqRVk5b1pWM2k1c2hsTTFQc0ltTSszRGNUSnhPektJS2JKQTNXTlpk?=
 =?utf-8?B?dTMraW9oSmNweUZjem91WEM2Y0VaUmtrM0JrM2ZvQWR3ak5YOUQvdDNqSHlo?=
 =?utf-8?B?SlUyNVFVWk10bU5DUTd5S1JPZGxicFNVNUFTMlVZN0xGeEpUSzBTb2d2Z3VU?=
 =?utf-8?B?WDNHdjN1bXQ0V001V0pJNzloSkhxdEo4TVBibVRlRGpkMk55amtMa2FROTdi?=
 =?utf-8?B?M0d4SmFGbG9xSDN4K2doVUdSTmFMdVZ0NlN3OEtvSFNLeDJoNkJKblZQL2ZM?=
 =?utf-8?B?SUt6am1hRVhsRDBnYzJaUEhId0xjTHhidmM2QkZ3cTBJaWlZMVlzQWg0ZE9n?=
 =?utf-8?B?WSsvVFFTMXdNZi93YjFhUWpPeTFvcEtJcFhScXc4cHRMdGJ6SGUvK3ZZS1Nm?=
 =?utf-8?B?SDBRNFdVd1J0dStua21uZmxaMnhBa0ZuNlFWbFhyS2ZGWXR0elpsSVd6c1A0?=
 =?utf-8?B?N1ZaTkRQSUZEMk8wMXN3SHdJTmJMa0l6MjNTZjJhTTE1NTZ5bmwvYnJLcXJO?=
 =?utf-8?B?dWlsOXZxaDFuL25ZbS91U3NrbEd1TjJyMmo4ZkNLdEsrWUY4N2NmbVdOVmZs?=
 =?utf-8?B?LzZoYjhvWkY2R0dVckl4c2ZtQUpDeXhUSnlkRllqdjhlenNIRnRXTzA1dFll?=
 =?utf-8?B?Y1gyL3RESnRiMnY0Q2dhWXkveS9Kbzl2TjZyN0dBNmFoK3Vxb09Ja3N3eUNi?=
 =?utf-8?B?U3dIakUzMW5HKy8reXpqU1cwMDZ0NGpYUXZQSnI0NDNwOTdXeTgxMEFZaDBO?=
 =?utf-8?B?OTVUUm5XRXlRYXpVdnowcWprNlcrZ1ZsblRrclBNUmxzd2hCaUhGdGxVWDBM?=
 =?utf-8?B?TlFVWWFjckdSSkJPR1ZIOVh3N253ZFhFTkp1T0daK0R1bzB5K2xvU3NWV1pk?=
 =?utf-8?B?MmJEWndCRVlna05JTTdwZ0RLcmdmbXdZbmZKaWZKQUFxbUJmWDV5dmVsRmp2?=
 =?utf-8?B?M3phUXc3WkJ2ajZyT2UwWU5zdjU2azJuT3dGaVIwMjdZS3Z4S2JsUllEa2t5?=
 =?utf-8?B?ZGpOdXJUNEg2aVJtd3lrdCtRV1p4ZlVvMzUxdmdlQ0NwYXRjVEhBdlNneU93?=
 =?utf-8?B?MG1BR3VoSnpqaGlyQktFdHhzUHg1RFIwTHJPbG9wVTV4ZlRrQlRKOERMWDN6?=
 =?utf-8?B?ZGVrVEJ5ZDR2cUx4S1R2MkFhV3lEQ2pRK0xXa0JmRUMzVGhESnh2VFlES0xE?=
 =?utf-8?B?c0VrR2h1T0ExWUUxZVgydEorUGVET0RPajN3eXZsYjlLS0UrZDluREQ1UDEr?=
 =?utf-8?B?ZmJkNVo2WGFKYUhRZ1hPeFM5WHkwbnVEai9NZjN3M29YWS8vcENma0Qvd2VO?=
 =?utf-8?B?OUh5SU5aWkQ2ciszZDBwZm1JWlp3PT0=?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1b251f-2b92-43db-7a08-08dbd3c545b9
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 12:40:43.7174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jr15QHN23jQjIHB4fIabphc+5Ov5G43miFiJ/fA0nM7ZGDmHYEJudU41/f4/EyVOceLDIGtCWHcIVRVS1EQmCUWneYVEe35YRtPywnvpyoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P193MB0664
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0hE6tOb5SpCkX3HvcxqJ+ExffHKe+S0VrEPTpsAJOg=;
 b=NLl8Qtng43j9ydER/RyYEC5p5jRfbQ3RMq/YbeFZnzZUzQzE6zLNjgF15Dw4Zx5PAm0Kv0pVW7d2VTmNe47Rpf69I8Uo2FgqEYoiGatwOoyLuGfSSb+UaWFlEFwGMBwaOtClwWFbt2P/2xo5O2KqFjIja2Ny1cdlUj/AIzIsRog=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=NLl8Qtng
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypi*: stop setting
 powersave as the default CPU governor
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgYWxsLAoKT24gMjEuMTAuMjMgMjM6MzgsIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4gQ2Fy
bG9zLCBBbGwsCj4KPiBPbiAyMDIzLTEwLTIwIDE1OjIwICswMTAwLCBDYXJsb3MgQWxiZXJ0byBM
b3BleiBQZXJleiBzcGFrZSB0aHVzbHk6Cj4+ICogVGhlIGRlZmNvbmZpZ3MgZnJvbSB0aGUgUlBp
IEtlcm5lbCBzZXQgYHBvd2Vyc2F2ZWAgYXMgdGhlIGRlZmF1bHQKPj4gICAgQ1BVIGdvdmVybm9y
LCB3aGljaCBpcyBhIGJhZCBpZGVhIGFzIHRoYXQgcmVkdWNlcyBwZXJmb3JtYW5jZSBieQo+PiAg
ICBzZXR0aW5nIHRoZSBDUFUgZnJlcXVlbmN5IHRvIHRoZSBtaW5pbXVtIG9uZS4KPj4KPj4gKiBJ
biBjYXNlIG9mIGEgYnVpbGRyb290IGJ1aWxkIHVzZXItc3BhY2UgaXMgbm90IGNvbmZpZ3VyZWQg
YnkgZGVmYXVsdAo+PiAgICB0byBjaGFuZ2UgdGhlIENQVSBnb3Zlcm5vciwgc28gYHBvd2Vyc2F2
ZWAgd2lsbCByZW1haW4gdGhlIENQVQo+PiAgICBnb3Zlcm5vciBhbmQgaXQgd2lsbCBzbG93IGRv
d24gZXZlcnl0aGluZy4KPj4KPj4gKiBJIHN1Ym1pdHRlZCBhIGZpeCBmb3IgdGhvc2UgZGVmY29u
ZmlncyB0byB1cHN0cmVhbSBoZXJlOgo+PiAgICBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5
cGkvbGludXgvcHVsbC81NjY2Cj4+ICAgIEhvd2V2ZXIsIHdlIHNob3VsZG4ndCB3YWl0IHVudGls
IHRoYXQgaXMgYWNjZXB0ZWQgYW5kIGJhY2twb3J0ZWQKPj4gICAgdG8gYWxsIHRoZSBzdGFibGUg
YnJhbmNoZXMgKGlmIGV2ZXIgaXMpLgo+Cj4gVW5mb3J0dW5hdGVseSwgdGhlIHJwaSBmb2xrcyBo
YXZlIHJlamVjdGVkIHRoaXMgY2hhbmdlOgo+Cj4gICAgICBodHRwczovL2dpdGh1Yi5jb20vcmFz
cGJlcnJ5cGkvbGludXgvcHVsbC81NjY2I2lzc3VlY29tbWVudC0xNzcyNTMxMDk3Cj4KPiAgICAg
IFdlJ3JlIG5vdCBjaGFuZ2luZyBpdC4KPgo+IFNvLCBhcyBtdWNoIGFzIEkgdW5kZXJzdGFuZCB0
aGUgc2l0dWF0aW9uLCB3ZSdyZSBhcmUgbm90IGdvaW5nIHRvIGdvCj4gY291bnRlciB0aGUgdXBz
dHJlYW0gZGVjaXNpb24uCgpUaGUgdXBzdHJlYW0gc2l0dWF0aW9uIGlzIHRoYXQgdGhlIGdvdmVy
bm9yIGlzIGNoYW5nZWQgYnkgZGVmYXVsdCB0bwonb25kZW1hbmQnIGR1cmluZyBib290IHRob3Vn
aCwgd2hpY2ggSSBkb24ndCB0aGluayB0aGUgcnBpIGJ1aWxkcm9vdApkZWZjb25maWdzIGRvPwoK
U28gd2hpbGUgcnBpLU9TIHdpbGwgYmUgcnVubmluZyB3aXRoICdwb3dlcnNhdmUnIGdvdmVybm9y
IGR1cmluZyBlYXJseQpib290ICh3aGljaCB0aGV5IGhhdmUgc29tZXdoYXQgZ29vZCByZWFzb25z
IGZvciwgdGhhdCBJJ20gbm90IHN1cmUgYXBwbHkKdG8gdGhlIGJ1aWxkcm9vdCBwcm9qZWN0LCBi
dXQgd2VsbCwgSSdtIG5vdCBnb2luZyB0byBhcmd1ZSB0aGF0IHdlCnNob3VsZCBuZWNlc3Nhcmls
eSBkZXZpYXRlIGhlcmUpIGZvciBidWlsZHJvb3QgYXMgaXQgY3VycmVudGx5IHN0YW5kcwp3ZSds
bCBqdXN0IGJlIHJ1bm5pbmcgd2l0aCAncG93ZXJzYXZlJyBnb3Zlcm5vciBhbGwgdGhlIHdheSB0
aHJvdWdoLAp3aGljaCBpcyBtb3N0IGxpa2VseSBub3Qgd2hhdCBhbnlvbmUgd2FudHMuCgo+Cj4g
QmVzaWRlcywgaXQgaXMgbm90IHByb3BlciBrY29uZmlnIHN5bnRheCwgc2VlIGJlbG93Lgo+Cj4g
Wy0tU05JUC0tXQo+PiBkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvZGVmYXVsdC1jcHUt
Z292ZXJub3IuZnJhZ21lbnQgYi9ib2FyZC9yYXNwYmVycnlwaS9kZWZhdWx0LWNwdS1nb3Zlcm5v
ci5mcmFnbWVudAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi5l
MmUyMDFkNzFkCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvZGVm
YXVsdC1jcHUtZ292ZXJub3IuZnJhZ21lbnQKPj4gQEAgLTAsMCArMSw5IEBACj4+ICsjIFRoZSBk
ZWZjb25maWdzIGZyb20gdGhlIFJQaSBLZXJuZWwgc2V0ICJwb3dlcnNhdmUiIGFzIHRoZSBkZWZh
dWx0IENQVSBnb3Zlcm5vci4KPj4gKyMgVGhhdCBpcyBhIGJhZCBpZGVhIGFzIGl0IHJlZHVjZXMg
cGVyZm9ybWFuY2UsIHNvIHdlIHVuc2V0IHRoYXQgZGVmYXVsdCBvcHRpb24gaGVyZS4KPj4gKyMg
VGhlIG9wdGlvbiB0byBidWlsZCB0aGUgcG93ZXJzYXZlIGdvdmVybm9yIChidXQgbm90IGFzIHRo
ZSBkZWZhdWx0KSBpcyBhbHNvIGVuYWJsZWQuCj4+ICsjIEEgZml4IGZvciB0aGlzIHdhcyBzZW50
IHRvIHVwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvcHVsbC81
NjY2Cj4+ICsjIEhvd2V2ZXIsIHdlIG5lZWQgdG8gY2FycnkgdGhpcyBvcHRpb24gb3ZlcnJpZGUg
dW50aWwgdGhvc2UgZGVmY29uZmlncyBhcmUgZml4ZWQgb24KPj4gKyMgKmFsbCogdGhlIGtlcm5l
bCBicmFuY2hlcyB0aGF0IHdlIHN1cHBvcnQuIFNvIHRoYXQgY2FuIGJlIGEgbG9uZyB0aW1lIGRl
cGVuZGluZwo+PiArIyBvbiB3aGV0ZXIgdGhlIGFib3ZlIFBSIGdldHMgYWNjZXB0ZWQgYW5kL29y
IGJhY2twb3J0ZWQgdG8gdGhlIHN0YWJsZSBicmFuY2hlcy4KPj4gK0NPTkZJR19DUFVfRlJFUV9E
RUZBVUxUX0dPVl9QT1dFUlNBVkU9bgo+Cj4gSW4ga2NvbmZpZywgYSBzeW1ib2wgaXMgbmV2ZXIg
c2V0IHRvICduJzsgcmF0aGVyIGl0IGlzIG5vdCBzZXQgYXMgYQo+IGNvbW1lbnQsIGUuZy4iCj4K
PiAgICAgICMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX1BPV0VSU0FWRSBpcyBub3Qgc2V0
Cj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KCkJlc3QsCk1hcmN1cwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwoKb3RoZXJtbyBHbWJIIHwgU2l0eiBkZXIgR2VzZWxsc2No
YWZ0OiBBbHplbmF1IHwgQW10c2dlcmljaHQgQXNjaGFmZmVuYnVyZzogSFJCIDE0NzgzIHwgVVN0
LUlkTnIuOiBERTMxOTk3Nzk3OCB8IEdlc2Now6RmdHNmw7xocnVuZzogRHIuIERlbm5pcyBNZXR6
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
