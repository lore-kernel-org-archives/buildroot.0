Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52733C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 17:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D25E160C13;
	Tue, 11 Jan 2022 17:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CUM3LUKqIjb0; Tue, 11 Jan 2022 17:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6CEA60E92;
	Tue, 11 Jan 2022 17:37:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD56A1BF368
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 17:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A997960E92
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 17:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uC-eYFCBZc_m for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 17:37:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2098.outbound.protection.outlook.com [40.107.236.98])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47ADB60C13
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 17:37:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbRA8Kb2J0+Xt6Cqbpru2t1AeN37P840wplAEbrR2u5reSxrzaTVK5mR0ED7xOPNp45hKg06jirseS+2u4nebXlp0pNQy97Jn03eyDV8sAkMqcRSz40e51wj0AmmHT2UMdxQuCQ75fZuXPnHC3G86y/034kOlFmAp/ddn+KwGlrdc3Xf51GMpnVQFqPmL3nkGq1GWLKfDNw1+hJfnqtql3orEFpSzhhT/gcnbUD6KW19sf0PYQ+c9Zxp6yfRFsReyMdCw9NLHGK2CL9MyuvGY1PdICtkmOod5d7RaWzVwE3tmiulybD40T0Cj48vHoxFcXDU52/iAYfJOU+aeUuGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpUwIJEu2ZxSJozUSeIi7JwCnkVdh8Z+/2icWvu78SA=;
 b=TLc/b/mkCfrrjvYjP/JzJbAUEj9s++/lLe6Q71fK0Xf9QiEFUIyvgAtehSy2/woeRVX9OJ9NA+OetK2i9DiWPwJ74nP7z2IlWqvshKmHXu9LSZDfdZLgLShe5hI8YBvZ6JTuS7MD4gh8LFoA2ovcthu0Bd9+E/ZHJUBbQVjAZ6j+1wgqXvxkPH4Nd47apdmKTuFPrkZJYfsdCKD/F8GlqZKNy2SXIl2cx3eR2ppLshzCuN5ZwE1EjBgA+pOsuMfa403+Y1+Ey3OoXST/uvSNsK1knsop6qnNYhu5rAzpVgIP8sxhNRk+18RjZLQlYNq1BAHjHYAs2bAUOoBx81xEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandc.com; dmarc=pass action=none header.from=sandc.com;
 dkim=pass header.d=sandc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandc.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpUwIJEu2ZxSJozUSeIi7JwCnkVdh8Z+/2icWvu78SA=;
 b=oZAYc484s+IdLMZSy0qqtpG7aNNcP8c1oRszntcOEFc0rdMdBX9105A3DWweEeMNsPLgSJeov7azMYFTKt3+Bcl9chTx8mnQEmiA+NstWP2OS/m7AcdzzCiHgsWVpb6HFjl1tgTeMLrSVIntiOb1Jm5+PfyWSfxtwTn4jhPpcDY=
Received: from DM5PR02MB3291.namprd02.prod.outlook.com (2603:10b6:4:66::11) by
 BL0PR02MB5683.namprd02.prod.outlook.com (2603:10b6:208:80::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.11; Tue, 11 Jan 2022 17:37:37 +0000
Received: from DM5PR02MB3291.namprd02.prod.outlook.com
 ([fe80::20f1:fbef:b95a:cb33]) by DM5PR02MB3291.namprd02.prod.outlook.com
 ([fe80::20f1:fbef:b95a:cb33%6]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 17:37:37 +0000
From: "Karicheri, Murali" <Murali.Karicheri@sandc.com>
To: Baruch Siach <baruch@tkos.co.il>
Thread-Topic: Re: [Buildroot] creating packages for opkg for buildroot based
 embedded platform software
Thread-Index: AdgHDue2tXdUdpm3Ro+u5TzcAxCNkg==
Date: Tue, 11 Jan 2022 17:37:37 +0000
Message-ID: <DM5PR02MB3291BEB37006D28524E582C38A519@DM5PR02MB3291.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1648de9f-58fa-4325-9e9e-08d9d5290f53
x-ms-traffictypediagnostic: BL0PR02MB5683:EE_
x-microsoft-antispam-prvs: <BL0PR02MB5683014B7F03B2E92AE57D078A519@BL0PR02MB5683.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w4LXrMvclYSGGQOGrVvEnekOpzc6NA6nys5drkbWwshHnZ4Jdqtbs2Zc8BUtem39VJDKdffYVELU38aXu74urkFTRLPmnL/DqxNX1700gSuvTvO8KAzdkfIIkW9rg7CU0fsikMnNpGel/lsLhLhTDZlIo4Ym+W6A/gyMk0RpL42sEa+2Wz3Ien38KW3zg1VPeBr2iZv9e2oGHJ5P+aaM8JcVbo1yhFFgW8iTmXn7hAzykFFHkE+VL+IVlx4h+mtRNj/EebZMNVYw4DivMxZ+DITOhfNamCaaRvm6mLY+r4K6KoMxssM9+VnGSYbzdJB6Fz35hehOHmxPBtwG6bZ7zm9I6T/seXjybrRS1TEPvHFzK1woMKTr5FkzZ+7seP4YyrzMmvffV5FizX7y7f9QROtVQYaoqFpaZUZv5wLjyI945aYk9VVmk9lL9kznu/Zin9UAsliZOP1S/Bzm98quC8bSqGk/DU8YRlXb5DN5XHMs/6B4XBoboFJcv/T5jpkonXpvmHzKaEgZM0UOBJeYoMJVvjcO7J3Ur+IIwebRA6IzWvVRYgACF/rw4V18onfn00y3Tfs3R3+lWAkO3CfQRP45tdePHBRZ15aAON+a/qHcjKfYDu2hXbNeHMj33MKmyYtYyekhdD+HrWlpEjSaz7xeGroz16x7bo8heV/dCGqX0DwdSlOZF7G0KrNlZelu1cIT5+08owypEsVXeRWImN07t4H3BZm35giuUCaahhSr/2Xxndp1A3/SH9ZMzMNMKeUrpcRJ9mD6n17/9R76OH86z2aB3o16u8l9Le92spA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR02MB3291.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(38100700002)(186003)(8936002)(66556008)(64756008)(76116006)(4326008)(66446008)(66946007)(6916009)(8676002)(52536014)(86362001)(66476007)(26005)(5660300002)(55016003)(83380400001)(508600001)(38070700005)(53546011)(7696005)(33656002)(71200400001)(2906002)(316002)(966005)(45080400002)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xT/IYz60WU5LiuCnCTTEUP3uI/O7+Q3vmvMfHNBwahsiQPEepp/agm1LDcew?=
 =?us-ascii?Q?xJbfVs04eM4EMQ8ixOW2oUGhPlAN4eoezmL8uQA0L8fd30LpLldokROsnt4c?=
 =?us-ascii?Q?3Z1G7MhZJPdDFBXiQAKLaJKELxLolD04IkQqmI+122FcA2E7+Er+SX2hewwc?=
 =?us-ascii?Q?HkWfiR0qn7Cb/jTiQitQ3okNSwazC+kjWV+oInIpDofDKsRVzma/WXpQVnQM?=
 =?us-ascii?Q?0SGC7KUnApcahUqdAl8m/yiKccOfHIkqhlttflGJonHe9+rxRoY8gvouzmRJ?=
 =?us-ascii?Q?9qmODq+nDRbpY7djROywq8PJKB1LpN1rbWhcSwzhvrg5FYV+TGCp2pwXjH6d?=
 =?us-ascii?Q?HXLDauMqiSknYthd9q1BF/COLDFjOYaXmpaQHhqrIe8rhLohZI8vDjUlq2YY?=
 =?us-ascii?Q?EL38huYst68XNOXZ6yyjoNO8dgMRYno/gX9PRldnZSjuwkH7ktSJ4HoosHqF?=
 =?us-ascii?Q?PuR/dJ30CSVOoEaOTD5xxBYbJTGziDh5E0mwKjvbAH98HkKGABApeQbzylsv?=
 =?us-ascii?Q?F1QXay7vet6fUVqsmyw8Nh5jHbDXtYqTGYwUJk5/bcTsoiYu7x7mPdSJoLX4?=
 =?us-ascii?Q?1jTW4Wd+jpiZIFCHeYT4iVd3ZvjszHama6S03nEE9BngQj7lajiXK1QpqkHe?=
 =?us-ascii?Q?bWPCSuiBy2JVSwaOc8iKqiweSMACovRob2PMrovJ7OPZtmjPxXX39yw2TdtJ?=
 =?us-ascii?Q?nujhLewIqHr/sotyWOspcKjVOrPICkvCdwzDIe/T7iHLgfLgPGX1U4kvP1Tn?=
 =?us-ascii?Q?ggJiHmrJnnuG2NSugoVMKV9xgB9xf8/nfboj7NywUkeMcOamVI2rB0XtP0Rz?=
 =?us-ascii?Q?jM3/s7RSsuDeD/x3n+RnMiKVany/p6328pJSyVUx/0qHfrycHTIDhB/yWpYN?=
 =?us-ascii?Q?jl1Q+UVnLNQpVku4g5rcRc0hpuCB1EEom8Ia++iQCtLCHD6aUnLP1/6gi153?=
 =?us-ascii?Q?qS8o96Nv8wT16PQ5mP9LiqRnZuCHTQBMP9eQvGjIuBc+4DpqvpF/8zCVwrvh?=
 =?us-ascii?Q?r2F28IzmJ310mOV1UJvkXHb6L8eo4S2LPeqjRooqfitBoptvMCVV1w2ThLz+?=
 =?us-ascii?Q?WOiYO13oIy8CugZ3GHeeLS1rso/ZxtMmz7OFvDztCT/Q3bVlFeN3X6eSVhXI?=
 =?us-ascii?Q?pqDy8/wB0YnCKlfDU86Wch9V4fSFtwmgBoIxdHNkXiBUm+pBh08db/SsVK8V?=
 =?us-ascii?Q?zDgdstvKXAjAJeTxmWWXsVIA+VB2uPOHjqN0NQBxI+2CLSoE6OY1DhU+EG7g?=
 =?us-ascii?Q?wq2rt0xreclABiEprUDPGWAjW8pNU/Due7NbgjHB8HejRp5KjAYPs0fXY6nL?=
 =?us-ascii?Q?Is40jCnB06XeXXZ0Cj7cjcfQVKVse6Y2+83eDxBa2XvICHC9AQZu1QLjHkrq?=
 =?us-ascii?Q?mHX5Vpiz1sANIVYWMYmhTgM64YBl6CBT/rzl2OBuJSkU1xIKdvhL+uCF2YQc?=
 =?us-ascii?Q?2iP35Kr0znbaTEHddPSfv8OqzRLLY4bfHUcpMx2meaL9dyb4L7qloMpWuxAe?=
 =?us-ascii?Q?bKVZp7YL4iWSkB3zJzngVc21wsEQSOrQJQvTGWTNJTxUs1q43iGbY85L/OK+?=
 =?us-ascii?Q?LM8n1L5oa6N8kKWXh8biUouHTq2RKxXA2YW79xDIg4j2FYVyLYfE6BmftXLa?=
 =?us-ascii?Q?nwHJonh/CyTgFtQmk/JjIl5e43Kx3exnWsa/dWtUHDIvIyHS3YnZrFtm/oD6?=
 =?us-ascii?Q?tsSixg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sandc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR02MB3291.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1648de9f-58fa-4325-9e9e-08d9d5290f53
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 17:37:37.5010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 21c4b724-f908-455e-813c-11c8d17f3e9a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j//sqfaw03lZwKXrLW1tb/G23b0QHZoLkiDybxt8i2AUto4r03XodyH+CGm/z3zXGXp2a/EfSaqxI3wJfWG/l22FJ0UbOjMn4v8Do/DXzQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5683
Subject: Re: [Buildroot] creating packages for opkg for buildroot based
 embedded platform software
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

-----Original Message-----
From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Baruch Siach via buildroot
Sent: Tuesday, January 11, 2022 11:13 AM
To: Karicheri, Murali <Murali.Karicheri@sandc.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] creating packages for opkg for buildroot based embedded platform software


Hi Murali,

On Tue, Jan 11 2022, Karicheri, Murali wrote:
> Hello, buildroot experts,
>
> I am new to buildroot and was working with a buildroot expert for
> migrating our yocto based build system to use buildroot.
> Unfortunately, he has left our company for another oppotunity. Ever
> since I have started using buildroot for our build, I am very happy
> with its simplicity compared to yocto based build system. However, I
> have learned that buildroot expect the entire rootfs to be updated on
> a running system for updating fixes which is very expensive for
> deployment where there is limited bandwidth available to update the
> system. So that is the challenge that I am facing. Good news is opkg
> tools are supported in buildroot which is good. Typically, we would
> like to let our customer do periodic update to the system to have
> vulnerability fixes and other fixes released by buildroot. For
> example, let us say we base our system on 2021.02.x. So, when there is
> a maintenance update to this branch say, 2021.02.06, we would like to
> create an ipk file with the changes and provide that for syst  em
> update. Idea is the file will be smaller and thus requires less
> bandwidth and will result in quicker update to the system. Do you have
> information on any project that is working to create a package manager for systems that uses buildroot for their build?
>
> My research showed one resource but is for open embedded or yocto or
> openwrt and is here.
> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraym
> ii.org%2Fs%2Ftutorials%2FBuilding_IPK_packages_by_hand.html&amp;data=0
> 4%7C01%7Cmurali.karicheri%40sandc.com%7Ced2996e04284449528fe08d9d51d6d
> f3%7C21c4b724f908455e813c11c8d17f3e9a%7C0%7C0%7C637775144649082517%7CU
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=VUvduRq9pPaHLRGnflGcQNzDo8ihorz8hOG
> GJp%2Bd%2FhA%3D&amp;reserved=0
>
> Do you think this is what I should try or any other relevant information on this topic?

This Buildroot FAQ is relevant:

  https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbuildroot.org%2Fdownloads%2Fmanual%2Fmanual.html%23faq-no-binary-packages&amp;data=04%7C01%7Cmurali.karicheri%40sandc.com%7Ced2996e04284449528fe08d9d51d6df3%7C21c4b724f908455e813c11c8d17f3e9a%7C0%7C0%7C637775144649082517%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=4XHwDcvvpLQiwcSTMDuJ3vF%2Bammr84VU013NXlhwoxM%3D&amp;reserved=0


Thanks for your quick response! Hope my email client (Outlook) doesn't create any annoying email format. My company also process these emails. So not sure if it messes up the format.

I fully appreciate the intentions of buildroot to keep it simple. I had already reviewed the FAQ you had pointed out.  What I am looking for is something outside buildroot. Typically, embedded systems that I am working with have firmware update mechanism in place. System doesn't modify the active rootfs but update an alternate set of partitions and switch to that once update is successful. So, we could potentially generate two rootfs contents using buildroot. One using say version 2021.02.02 and another with 2021.02.06 for example. We are using ARM tool chain for our build and assume we will keep it same for incremental updates. Understand that we might have to change the tool chain as well since there could be vulnerability fixes to tool chain. So, wondering if we could do a diff of both rootfs contents and create an ipk for the diff and update the alternate media for this purpose. Also, we will do extensive testing of our product software. So, this will be QA tested before pushing 
 to field. Is there anything work done for this type of use cases?

Regards,

Murali


baruch

--
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, https://nam04.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.tkos.co.il%2F&amp;data=04%7C01%7Cmurali.karicheri%40sandc.com%7Ced2996e04284449528fe08d9d51d6df3%7C21c4b724f908455e813c11c8d17f3e9a%7C0%7C0%7C637775144649082517%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=CI61wXVl0JJizrtYTd16lsPIUvw6s5nRLm0ez7XVZDQ%3D&amp;reserved=0 - _______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.buildroot.org%2Fmailman%2Flistinfo%2Fbuildroot&amp;data=04%7C01%7Cmurali.karicheri%40sandc.com%7Ced2996e04284449528fe08d9d51d6df3%7C21c4b724f908455e813c11c8d17f3e9a%7C0%7C0%7C637775144649082517%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=SVbBPgU%2B%2FMgWtx%2BDdXQ3AlSlkMBi2D96hDxDXXk6IMA%3D&amp;reserved=0
________________________________
NOTICE OF CONFIDENTIALITY:
This message may contain information that is considered confidential and which may be prohibited from disclosure under applicable law or by contractual agreement. The information is intended solely for the use of the individual or entity named above. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution or use of the information contained in or attached to this message is strictly prohibited. If you have received this email transmission in error, please notify the sender by replying to this email and then delete it from your system.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
