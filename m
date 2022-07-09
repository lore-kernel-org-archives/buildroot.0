Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFC3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Jul 2022 19:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 209C18458F;
	Sat,  9 Jul 2022 19:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 209C18458F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5_WiZlc2VG2; Sat,  9 Jul 2022 19:13:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21BE184586;
	Sat,  9 Jul 2022 19:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21BE184586
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EDED1BF2CF
 for <buildroot@lists.busybox.net>; Sat,  9 Jul 2022 19:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18EC640519
 for <buildroot@lists.busybox.net>; Sat,  9 Jul 2022 19:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18EC640519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3gfhCcLSn0M for <buildroot@lists.busybox.net>;
 Sat,  9 Jul 2022 19:13:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0646F401B7
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2090.outbound.protection.outlook.com [40.107.94.90])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0646F401B7
 for <buildroot@buildroot.org>; Sat,  9 Jul 2022 19:13:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4/r6FiGp2JdFjQsW2k8PEABl/Kt3XdLc1cIsehzkUD/88LuhaJBykivev0lzfmahbMRfv/a5smSpEgCjGnK6tDBAdyUgJaU6I91G1evE6hMEDFpZ5t9brZc1jg+nA2oU8C0S4Xx3nkvnkRQmHlpAquxiPFXEMVoT9vbW1TPOQ69M0xVI2Prp6x9jSt39Q7J25LeFxhEJTEqfaTxYsHGyWEyoXqPpasBo580dcPk0kNBLQiFXwhLm6EQJJcJcy0SCFZ80rU7J1TaHfpWqW4ga/RpiJSwPZfeSsW9j4iFOPAVHi89Iqj0IBZ55Yl6AUorg42rMCI0EtSaye8hxQp/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHaFbKUfWNmXQtNP+ojtU6oxelnG/QV6Cnesm5haWMY=;
 b=bu+6MFHYQdcrSIyXPvwKkmWPgKO0ISj2qGbnzm5tB3nSeQtE4KgMLwaEAH885+4x7+4qfbp4bhhAkDzvpSqm1gC+xEZ0ERhkGkboReSVrphf6bKwnkPVJN2YledjOaK2oMHvFiI6z/YtDZjKp+S8ZufHqhXO1c6E5shszw8jyiWmW4Hdo95PUzucVlWUlbqr+HTx9OhmoUWlQhTHOliJ1SK+C9zX/rMmWJkhvMfvZxPezUMD4SyC7qxN4X4aa4aCPyH8YfwQMkiGTmn7rkt3W36GuUpeG5oh04UT878ZGb8xuVt7w+xCJETaFHnS6+EkVyig93OQgYvnJf0ixkIYMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by MN2PR10MB3918.namprd10.prod.outlook.com
 (2603:10b6:208:1bd::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Sat, 9 Jul
 2022 19:13:09 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::712f:6916:3431:e74e]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::712f:6916:3431:e74e%6]) with mapi id 15.20.5395.020; Sat, 9 Jul 2022
 19:13:09 +0000
Date: Sat, 9 Jul 2022 12:13:06 -0700
From: Colin Foster <colin.foster@in-advantage.com>
To: =?utf-8?B?RnJhbsOnb2lz?= Perrad <francois.perrad@gadz.org>
Message-ID: <YsnTQhXxL/ehR1J9@euler>
References: <YsiEyscz0S5b9zj9@colin-ia-desktop>
 <CAB0FRsv0ABHJtw=dZ4TsmGn6X3gD2KPD0jEhhENkQnn84Gh3OA@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAB0FRsv0ABHJtw=dZ4TsmGn6X3gD2KPD0jEhhENkQnn84Gh3OA@mail.gmail.com>
X-ClientProxiedBy: MWHPR18CA0059.namprd18.prod.outlook.com
 (2603:10b6:300:39::21) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9443057c-d59e-4034-29cb-08da61df0f4e
X-MS-TrafficTypeDiagnostic: MN2PR10MB3918:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FHGSzL4gOcQUb7aKfCEMYDdaDOc0g0utEH6U3xTAlBz+O041vVDvyclJ1sxuWdoB92HeiUrAfengikQpMgtDD0BqAWaHpeBb1dFmq61SIxjIkVy6CPqi8fQBOrymKRFL92JVs6VJ+4ntooNz1UG05/6cZ7AC2WJI/nY9VgU1rkHHDHKFrz9ldPgYKqXxJU62Bvv1kCZDW1Aw9zk4SK74k95jqYClO31ZKmbqb7OKDFkURGv+zfTLZpIt6/rtOEAi05UvaQ1dt+Zz7MGqHHt5cWcQD10Ia4X9oaFi/U3CfCfKN0hi1fMXCZXcX9Wwf9zev43zQQ/9nL/KiwHB8CatgWmRVZZHz53DCZcI589hDOYCnuDeIpQuvHHTpTNyyecR//fpWJwyj9xFo7s0t4xZmh1Ehicpf/nwHTJVGw8vX5T1OxChiQB6np7FNwoUP2gzM7+HOsVSvRH4Ce8z03N5KurZJua3NguV2R2LJR310ofW8L2UYm+YYAiitVg3LoiHeCrF0QgIGajBWK0BZr28FgmSO40sBrIuVEjsh4psAsbjRZ+14WumzHl72gQwnKBVS+vm+BNaoNvnZOjfwcO/YxDBR9E7j5NNwZ7QfktfUfvpRBr2JHwooBbsEfL2f0KNeDvAXUarXIgqv/P0cdfbvcO06SpNbpQv9jPNSDC2rifsI0JOuCdDuo2Xt0BUDDHz/HwXGoIVG6F4T6Lsyjq6fhGJon4fVG/1Jtva2UTBiPRd4aK9LdgwuTTnEVgS2uuw02IWpRuysxslsv87g/UUO7ak2kBU+2We+vkH9apUtx8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(366004)(39830400003)(136003)(396003)(346002)(41300700001)(4326008)(33716001)(66556008)(6666004)(83380400001)(66946007)(66476007)(316002)(186003)(8676002)(38100700002)(9686003)(6506007)(5660300002)(44832011)(26005)(6512007)(8936002)(2906002)(6916009)(966005)(6486002)(86362001)(66574015)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2F2WmJoSjkwK1NKNC8vck1BOEtxM2JKZmp3clRWU0pOV1orb1dmdEI5aFhO?=
 =?utf-8?B?ZWs4UHptUjY3TVJHckwyeW1kVm1GZ042NmswSDVHT09KeFdmTktZUEJuSkha?=
 =?utf-8?B?MVlXdXZzLy9McHNRQy9PTUFrRHZQelVBQ1NhVzFEYmlFOHNROW03aWVEd1U0?=
 =?utf-8?B?OTFtQkNrM0krRFViOGh6NGRicjlzbGZOUXlTZ3pFamszejI3WTZwMm10R0Jt?=
 =?utf-8?B?WnhCUTEyV1pxbVNtQlU2MW9EUU14dTlPSDMzeVNjdEk4cW0rRWg1ajlKSnJo?=
 =?utf-8?B?aU5ISk9BQmhYUFJyKzNaU1BtMitUYVJpdmdEVjJnRkNNNG1qOGJtMHFET241?=
 =?utf-8?B?MFY2d0RkWFlwY2R0NXZPSUFJZzcyVnVoMG1pV0xwa2hSeGRoSUdBZW9adGhB?=
 =?utf-8?B?ZGFNSk9lME9zdVlpb01VN1BaQ01XMUlaSWdNdy80bUh4MXN4NCtqMnZuaWZX?=
 =?utf-8?B?b1hxKzkwRGRhdkZJeGtQcWI2aGkwNFE3SnJUbVR0WFowaDAvejNjb0lBNWl0?=
 =?utf-8?B?L3padnNObVVOaEQrZzJxVUd6a3VBQ093SktETStwcHB5TktLdndHVnJmQkl0?=
 =?utf-8?B?eURaRy96QzJMKy9rME84eUJKbWtHaTViQURUREU2V2VkY0dNbkJCbSsvQWtV?=
 =?utf-8?B?YjNoRk16NFUvRGp5VjRic3RvMmhiQzQrdWxRQzdqVWxqZm9jNkxveCt2YTdm?=
 =?utf-8?B?b0NyWTM4bUhzdmZnTHk2c3BtUG9nS2U0VWVUUUJJaDlQTGhVNjVHWXF0SGRt?=
 =?utf-8?B?UWM3dmZWc09OOFJ3REc5Rm1WMkdHS1NidkhMTFlpN2prV1VBaVdxeFZDRDNs?=
 =?utf-8?B?THA3UEM2S2NGSUg3NUpJYzRnUi9RSjlvNHZSaWd2ZnRIaktBaEtWSXhXeDlT?=
 =?utf-8?B?QjljMi84cmt5a1FmT1hFdk9najBNMHB4RzE3Uy9ENWEyN2RiQ3prakJTOXRj?=
 =?utf-8?B?dWJJOTZUVFRoYXV0UEd3ZENidXBualBoSTdkajFHS1BNZFI5ejdqOCtoTE1m?=
 =?utf-8?B?dTRJSnFNM1JSWFZGWkFmWnQwZFdzd1c1c3AveVBMcnhiUVBGVXNrVUpSK3Jt?=
 =?utf-8?B?bkZreUVLRDFkajlTTTY0L0pZT09QU0hURFdpU3o1RkZwaUphL2RobzJJeEM2?=
 =?utf-8?B?bzZXVHp5WUd2dEpaeHRqS0hRQ1BKOFhGUjN2UWhtZFI0am1jVGZCY0M3OVB0?=
 =?utf-8?B?QjhvOVRjMStzaTBoS1BKR0RiUU1rTEI2Z2FpQXVMTkpuZGZrL1NDZDkvdmps?=
 =?utf-8?B?REsyQ1JFS1hHcWRBVEhhNm5RZmlwYTBKRnBSbHl4ZGZsb3ZpaDZKNlBxWXJT?=
 =?utf-8?B?YVNjUjVJbDk3VmFXZ09RVnBNNTRUdkY3TmlzRldvTktIdk9RbFUwMktBVnN4?=
 =?utf-8?B?ZTBKQWNnWTA0Sm5YdVdWdTZEZlpzazM4NHJ4TDFXWjN0cGw5NXo2ZzJiQzZV?=
 =?utf-8?B?WlVGSjQ4NXgyOHUzSG5mN05wajVRaFVzdjBjM3ZsdE9SbVVIRThDclNSNnh1?=
 =?utf-8?B?QnZXbUg2WXU5ajRZdjFXem96ZXlrY3Fpc2NCdEFvU051QkgvSDRmUDdsWXdk?=
 =?utf-8?B?UVR4TzI0Nm4zaXE3akt4b3ZjVEk4NXhMaDJUVXVnRHpKay9DVld0V0R2VzVp?=
 =?utf-8?B?eTNBNmFmY0dKOWcvVlpYZ08vN1NSK1puZWo4MG96OWRjM1VTdHRTdEMxRmxS?=
 =?utf-8?B?M1BVUHpKT1ozTW5NbjRzaHhGZ0VqY1ZSaG9xa1NQbkJhU3lCY25Uak00aXNW?=
 =?utf-8?B?N09aUytQbkZxQWxWOUVoTkpuVDNGTkpwOEVSMHl0cE5UbGtiNXJvTTZCYXhR?=
 =?utf-8?B?TmZ2MHMvWkx4LzdrVjNFUURyQWEvZm5EL0Qwem1aMkUzZTdUTThENjFDTHJj?=
 =?utf-8?B?WTB4eUNiSzRMTDNoZWVPY2FmUVlybzUzYlhKaExyTGREaUdJekRSRHgxSENL?=
 =?utf-8?B?ekFyK3A0UWJralY5bTlFWnljVVRRL2k1RXRNYmJaSW9qa01ZYjdYM1dtaFR6?=
 =?utf-8?B?MGZFeWNSWVZHWnJ2anlRS3ZMTXdnM3BIUVhLVUtPbjNLNXBsQ0s3SW01ajlt?=
 =?utf-8?B?QkxUN0ZuWVRESVRab1FnSVdpWmJOTkRRSUt4TkZHMnlMRW1DbGZzTW8vKzdm?=
 =?utf-8?B?dDBiem5RcjV5em5GeElrcHdiRjlPTTZTYlBTc0FBbHBmV1RMQ0JibGZ2TG1F?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9443057c-d59e-4034-29cb-08da61df0f4e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2022 19:13:09.0447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2F8HWTzQtALZgiyoiFiqyOiQ/EjMYHNs+nY5MD0QJKlGyAohJZBEiGdTYVjkKrv+d1rs+QWuZRErVXhfieB7ezP9K8mH+0nEgSSDMFNxns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3918
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHaFbKUfWNmXQtNP+ojtU6oxelnG/QV6Cnesm5haWMY=;
 b=rpf2oDrmH4mmZxLeyz++w0UcI/bf1iLZkvXOJhXrXYDL0j7edwkWmuiDJuSPY13+VJtEqKGkFAKKb1Tu2MK3+AOw8r75vnn8qzat+PtzxbyN2aUrHQE3t/Qhru8sPtN0vwg9bh91K+FVoZWkgNcWv6XilQ248l08nAaB68rotE0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=rpf2oDrm
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] mstpd install location
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBKdWwgMDksIDIwMjIgYXQgMDU6NTk6NDNQTSArMDIwMCwgRnJhbsOnb2lzIFBlcnJh
ZCB3cm90ZToKPiBMZSB2ZW4uIDgganVpbC4gMjAyMiDDoCAyMToyNiwgQ29saW4gRm9zdGVyIDxj
b2xpbi5mb3N0ZXJAaW4tYWR2YW50YWdlLmNvbT4KPiBhIMOpY3JpdCA6Cj4gCj4gPiBIZWxsbywK
PiA+Cj4gPiBJJ20gZmluYWxseSBnZXR0aW5nIG1zdHBkIHRvIHN0YXJ0IHdvcmtpbmcgaW4gYnVp
bGRyb290LiBJIG5vdGljZWQgdHdvCj4gPiBibG9ja2VyczoKPiA+Cj4gPiBtc3RwZCB3YXMgcnVu
bmluZyAicGlkb2YgLWMiIHdoaWxlIGJ1c3lib3ggZG9lc24ndCBzdXBwb3J0IHRoZSAtYwo+ID4g
b3B0aW9uLiBBcyBhIHJlc3VsdCwgbXN0cGQgd291bGQgZmFpbCBlbnRpcmVseS4gSSdtIHdvcmtp
bmcgd2l0aCBtc3RwZAo+ID4gdG8gZWl0aGVyIHJlbW92ZSB0aGUgLWMgb3B0aW9uIGlmIGl0IGlz
bid0IG5lY2Vzc2FyeSwgb3IgZGV0ZWN0Cj4gPiBjYXBhYmlsaXRpZXMuCj4gPgo+ID4gQWxzbywg
dGhlIGJyaWRnZS1zdHAgc2NyaXB0IGdldHMgY2FsbGVkIGJ5IHRoZSBrZXJuZWwsIGFuZCBuZWVk
cyB0byBiZQo+ID4gaW4gL3NiaW4uIEhvd2V2ZXIsIHRoZSBpbnN0YWxsIGRpcmVjdG9yeSBpcyAv
dXNyL3NiaW4uIEknbSBjb25mdXNlZCwKPiA+IHNpbmNlIE1ha2VmaWxlLmluIHNlZW1zIHRvIHVz
ZSAkKERFU1RESVIpL3NiaW4uCj4gPgo+ID4gSXQgc2VlbXMgdGhlcmUgYXJlIHR3byBvcHRpb25z
Ogo+ID4gMS4gQ2hhbmdlIHRoZSBpbnN0YWxsIGRpcmVjdG9yeSBvZiBtc3RwZCB0byAvc2Jpbiwg
b3IKPiA+IDIuIEFkZCBhIHBvc3QtaW5zdGFsbCBob29rIHRvIHNvZnQgbGluayAvc2JpbiBmaWxl
cyB0bwo+ID4gL3Vzci9zYmluL3ttc3RwZCxtc3RwY3RsLGJyaWRnZS1zdHB9Cj4gPgo+ID4gSSdt
IG5vdCBmYW1pbGlhciB3aXRoIGF1dG90b29scy1wYWNrYWdlLCBzbyBJJ20gbm90IHN1cmUgd2h5
IG9wdGlvbiAxCj4gPiBpc24ndCBhbHJlYWR5IGhhcHBlbmluZy4gSWYgb3B0aW9uIDEgY291bGRu
J3QsIG9yIHNob3VsZG4ndCBoYXBwZW4sIEkKPiA+IGNhbiBjZXJ0YWlubHkgbG9vayBpbnRvIGlt
cGxlbWVudGluZyBvcHRpb24gMi4KPiA+Cj4gPgo+IEZvciBvcHRpb24gMSwgc2VlCj4gaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDcwOTE1
NTU1Ny4yOTA3NTE4LTEtZnJhbmNvaXMucGVycmFkQGdhZHoub3JnLwoKR29sZGVuISBUaGFuayB5
b3UuCgo+IAo+IEZyYW7Dp29pcwo+IAo+IAo+ID4gQW55IGZlZWRiYWNrIGlzIGFwcHJlY2lhdGVk
Lgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiA+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
