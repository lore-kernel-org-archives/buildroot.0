Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D850C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 11:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBB514128B;
	Fri,  1 Apr 2022 11:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JhKcEQ0WwwQQ; Fri,  1 Apr 2022 11:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C20DE40538;
	Fri,  1 Apr 2022 11:54:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC0D11BF355
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 11:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6966417DA
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 11:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbtqQfvsgVhP for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 11:54:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 863CE416F9
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 11:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWReoOnmgNa1IBOfMLBY+eQsyYi1apdmeClMdSK+ey0qXlyh2m+HqzqaA8vxfYbZfjvYkUSCiKanP0KvRv+hiKEVoKa23IqrHLY52R/e294QdCsONNM2jJ5YNT+8qlyfxNgF4CB+ouVh5rMTQ6VZsBWCqTuY+A3TG34VmRE0AX39dRuszTplxbhwx8cGuNuzC2Abb3bAnI63nUExpsgfFK45k5g3qRycBeBnAsBPg6VK1MKAdDezum6/G6NadJrYMyMGGTdQF6HyHCfIa3vhvYExFwlwQmioKK5a2oLM/c8rM+a9a01VcZMnBtbRA15Hx59ATDJ2si0gkqrpCn9tsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+zF3RQp/8KTsEJ0cidTQAoYNrk4kDdBZbAARNRrR98=;
 b=b/0fNDPJCefehIzMewd7VHJQdzNAJrSxObM7B32Lmln6LZDjA9JettUHpPGzXrjEreuRXPo5o+uTuvYfr/RPAsXhjeRIu4IPtVKhLqZdUd2ZJdDQoflmhIbSBv4laL2veb7bZztZt/yGwkylcGly0HBjTK6eW/fVbgTA6h4RPbeG0m5HJcqHIf0xbwcABcpLm8hMkrLR1Wu0PznkYL3U5EU15v4cln6xtvgPhP78tNvWqqFbmWtpHlqEnwCrwWKc5kYFMgAO4Ua4Km55IU3OLWUXaE1ijeKZ9bm3BN6/RjaUrfVPbhotAJJORDwxmqIDAA59/AN8OmPzNFjSZjDlZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+zF3RQp/8KTsEJ0cidTQAoYNrk4kDdBZbAARNRrR98=;
 b=LULB6kJ8/RR0rr9kekXKEAZymGTXItuoIvsnwuODTqaCyDOATTlAV8k2xfpelS8DQu61oE44cmcIY30L3iDC0WVl3Dc/8/MJI4BDX2vPYZt36hWHz+FfA5C+N6UI/QEOFWdIu5ahSYjH3bMNgdgGKVDc7ln9Z/u0HpSK8AzK6d0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM5PR0401MB2675.eurprd04.prod.outlook.com (2603:10a6:203:35::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 1 Apr
 2022 11:54:26 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::8ca9:a2e2:60c8:95e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::8ca9:a2e2:60c8:95e%6]) with mapi id 15.20.5102.023; Fri, 1 Apr 2022
 11:54:25 +0000
Message-ID: <9271680c-ab96-f8c0-ff76-fea5e8e5d2ba@theobroma-systems.com>
Date: Fri, 1 Apr 2022 13:54:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Sourabh Hegde <hrsourabh011@gmail.com>
References: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
 <f10fe951-249a-25cb-b476-20cca3122e65@theobroma-systems.com>
 <CADYjeSt9V+WjTfms4pM7J_g5-jSVE9ngc5uRjXRtfcq0iOtJNg@mail.gmail.com>
 <a44d36f4-05cd-1198-5788-1a5e1ec84c6f@theobroma-systems.com>
 <CADYjeSunuDshm9E8t9y+39tT9a1tu6BT3m=eKEgVG15uWgaM0Q@mail.gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <CADYjeSunuDshm9E8t9y+39tT9a1tu6BT3m=eKEgVG15uWgaM0Q@mail.gmail.com>
X-ClientProxiedBy: AM6PR0202CA0072.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::49) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f835bdec-767e-4a7c-796b-08da13d65e36
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2675:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0401MB2675864A5A99B43ACB305FF9C2E09@AM5PR0401MB2675.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ky0TS33Yw3h+FHJpECAb0EHS4R6NgZ9+V5r7ZonoNrh5+hnQnrlYSCpePCs/jKVtA/Vu2Ox8psVzKUdH8RVR1vyXMaZgzy9TOyg2lg6h+wM4t0KOzNu6xGgNaiowjvLWY0EFQ99l5kSU+aFm8Parszqthr727nu7HGlfRHXhf/GVhYZO01i0Z1vGsHu0zroVd4agA4m63WdDC9c1UpyQXgFRwCq16xNtgYz0wsokgq45NLgLNTuKPgsmFIF9xvj+mT9JsBJjkYgR4WXXtI/Hh4dH9cJfUeWlLh/9Xkfs5i9jyYsS0X9uwlGZiQDeNSMcUmYzNKDyxhKlueD0p1DoU3GEdbj6k4dQ2XqNMR4iOpFZYZkJSao5o+gCrc98fZ6t46rYdZZ2BoJyzmpVqNb5h1W1lWySKXM+8lOubli6AObLWO91FZ9+pG5cn0Hf7HYM2uYKm/c/VNGMlltEVqakCC8+EolO73P5jsol7l7RW4H5u/HcgL8ASpyUtDAzk4qtOwA+mNELwEToa0eYrzMBw/7mCe4GGJL+CPOVbJkjl+GC7aMxlt8a/8hViiIUbh4hw3amBgYCte3S+HsHxWLY4lEsi+q9tscmaZpD6wmJkhxwIt50wbWxlGU5Cz11OKTEc5Z+XNiBS1RA3gHi++OeDhcZH5IuDM1tvSiT8d8ARCsecNqB1+s5/0bCll9w06v5mMIexyPI3FGPW+w2rDycjHd3zQdOGi9kRkYntJ5vSP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(8676002)(6512007)(26005)(5660300002)(66946007)(2616005)(86362001)(31696002)(53546011)(44832011)(38100700002)(4326008)(66476007)(6506007)(8936002)(966005)(186003)(508600001)(6916009)(6486002)(31686004)(36756003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk81TjhHSUdwZTNOcm1mazU4dWdXSkhzUGpIclNtNEp5YjRPa2l6U0h3NFQx?=
 =?utf-8?B?YXhCc1NEdytld24zZ2RXdmVVVCtnTHc4cGRrQjlQNERFMk1VTGE5cCtHZkJD?=
 =?utf-8?B?THFDeVhWY3J1OFZCNFFDWTBicEsybWw3V2psMXBheGFTdkxGMUdJamR0NC9J?=
 =?utf-8?B?bXdVUmpUOVFnWGdlcUY5cnZFNzd4bm12cjlHNjdOdGVBU3BKU1ZWREZnUVhz?=
 =?utf-8?B?MmM3SHZnZGc4NEkyTlgvcGtrVVpLeEFmbjVNVS9SYjhLTjRmUHNaR2tYc1Zu?=
 =?utf-8?B?WGgzNWtUT1NTZGNtaXMyM0Z4WEFvVm1GZGZnUVNpZG0xVkl4Vi8zWFBmMHpm?=
 =?utf-8?B?aHEyWHVsTFg4aUpYNXBMeGNrcy8yOXZQVmYzZXpDVzJ1UHRjWVdoUmpTVTNr?=
 =?utf-8?B?Nk9Wa29TWC9pK1NmYUtyOVVkWjZ6QldXa1crbTN3dW4wM09ZOURic3dJWCsr?=
 =?utf-8?B?RnFjNWh3L1BheHRBeVg5L0dCMnZ4aFFsZWVkNjhvZDdQOFpqY2syKzU4TXVN?=
 =?utf-8?B?RWZWSXViZ250V1NzZjkvUFBsbXg4SDZRRVZMVnBPOU5qTUtsYUxXNENReXFp?=
 =?utf-8?B?T2o4MWtaNnhXRytHMnloNlVBQ2VMemJuRmlCUldEV1p3QWxWRm42RDlsMDl6?=
 =?utf-8?B?eExEODhUS2sxL0VacUIydHJzVmUwelFnM1lwWnYvOTNPS3BhRnoyUlJEVlZP?=
 =?utf-8?B?cVNjdnZTeU1RaG9YenE3dDFqL0F3U2J5WGtFU0ptdGtGMDhLMG00dnY0dk9P?=
 =?utf-8?B?RFNCaVhDWjdESXg3MXF2NStUVHErUGp3MERUcHVCeXYra0VsYkRRa2NHR2RU?=
 =?utf-8?B?c21RWFgvVmFPM2VYWkV3N1NWV01sakJoOHpBSkZGMXNqZUwrdmE4OXFKeExU?=
 =?utf-8?B?dU5QR2RPUEVKY1pWQUlramxSSTducldKelEvN1JDSlI3OHJjc2syNVc5RUpq?=
 =?utf-8?B?a3NIa0JHeDBRTVQ4c3Y3Ynd2QTBLVlJOSFhvekU4bTFoYXZ2NGxBb0g4Uzcy?=
 =?utf-8?B?RkFxZXFTeHYyN2FadWlxYW8vV0Rzc1k1eFdUdzNYV0dSNjV4YzFJR21QODhE?=
 =?utf-8?B?d3FnV0dLVUlVa0NaUWdlRkdMb0dybkVaSlV2ak1FRS9md3lFczhYOXloOXND?=
 =?utf-8?B?S2l1QmtGQ3pnUEU0MnNMWldTZFYwcnRhbTNJN3ltN0Nad0xtK1B1SzFOMWlS?=
 =?utf-8?B?K2lLbXUrVkFlUEViRGxaWWcyTGdrYU4rZ1lsVDBnOWdPQTFHMGlOQ2ZTRDlG?=
 =?utf-8?B?SFBEREdrYytxMStNOVkzUkV5OXRWR0JIclVtSkRiQzcwWlhNZi9iaHVqRlZW?=
 =?utf-8?B?cThFQXR5YTN0M2Z4Nk1LbGVFK1NHYTVYcTlSQThQTVZEanY3dUJpYlZuZmxq?=
 =?utf-8?B?UzQzdDIrdjgvV3ZHRjlEVFlyeGdmWWljaUorZ3hlWnIzZUZwZkpVdWVSNDRD?=
 =?utf-8?B?NmNTVmtpZU9JUHpNOGhxYXFJVTVDWGhRTzI4aE00dUYvV3lvTzBHN3FUc2Jp?=
 =?utf-8?B?bForUXpGK2VPcFF4TVU5dlZ6Y0tHaGVWZUpTaVFmd3NxWWsxRzdNaHpHblo4?=
 =?utf-8?B?WHUvcGk3WG1GYVdQZ3R1OGVVaVlESkZzODUwRUVRRytCWkRWdjVXK2JjOWZF?=
 =?utf-8?B?VmhXeFVFSy9oWmVqeitlSG0zS1JuZHk0UE1qVGk5V0NRZ0w0NGh1dU1nM1pF?=
 =?utf-8?B?TFZpUkVUejRGR0ZYdFFJVWNoMFVBdlh5WVdYTGlrQ2J6d2Y5MmVCNGYvcjl0?=
 =?utf-8?B?OXdGK3JBb0hiZEpzUEN0L1NJaGJXekR3aStEQ3kvbktYTUVzYzFzN3VmbU5E?=
 =?utf-8?B?M2dZYUovRlZtUzViQ01ILytLQkp2VmlCWDFoYjlhRUFJRkZRSGtmYXhYRVRI?=
 =?utf-8?B?dzJRYVBJZG4zWXAxM1hhbGk2Q01HYm9RVHpFKzU4N01naFlOdWlBVDhIbllP?=
 =?utf-8?B?OTdPckRQRlFZNjhBOUJpMEVvR2FXQkROQXEydXBwSFhSTlovL0kxL1ZEZWpy?=
 =?utf-8?Q?CH7r1O/CUr3Ps7zgaMay82AQJ27Qrk=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f835bdec-767e-4a7c-796b-08da13d65e36
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 11:54:25.3718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dotEE2YDw69RvafXks1OjpWWIHoYsq8UDhVRpWy/G1Xqz8nu855yOxCfBCBJucgcSc+GOkWOUZjqeuPqglAwORIiPl3lDfOmmtPWDo+ixXlW796vaAsuy7KQUbCnqsld
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2675
Subject: Re: [Buildroot] Buildroot | ninja build error | /usr/bin/ld:error
 adding symbols: file in wrong format
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sourabh,

On 4/1/22 13:41, Sourabh Hegde wrote:
> Hello Quentin,
> 
> make casync
>>
>> if you want it in an image created by Buildroot, modify your config with
>> make menuconfig and save your changes, then run make.
>>
> 
> But will this create binary for host system also? Sorry, its bit confusing
> here.
> 

No, host packages and target packages are compiled with a different keyword.

make casync is for target package
make host-casync is for host package

> I need casync tool use with "rauc" as given in
> https://urldefense.proofpoint.com/v2/url?u=https-3A__rauc.readthedocs.io_en_latest_advanced.html-23creating-2Dcasync-2Dbundles&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=AiN2bNa5EFj79y22K554djuFBBXe_MMEIRS1-gwEsbw3ch69jBq4q9j0tm_wz1V8&s=6mSs1PkEXKk01AMnuQKyCAPV0A9euTiPrj_bP4mGHJ0&e=
> 
> When I do "rauc convert --cert=<certfile> --key=<keyfile>
> --keyring=<keyring> conventional-bundle.raucb casync-bundle.raucb"
> 

I assume you need this at build time then since you are talking about 
binary for the host system. In that case, you need to add host-casync to 
your config.

However, casync is currently a target-only package.

To create a host package, you need at the very least to add:

$(eval $(host-meson-package))

at the end of the package/casync/casync.mk file.

This might not be enough and might require some additional tweaks to the 
package makefile.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
