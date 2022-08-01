Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B539C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 13:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29A3660BB4;
	Mon,  1 Aug 2022 13:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29A3660BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SjWq-074uPy5; Mon,  1 Aug 2022 13:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A21605B5;
	Mon,  1 Aug 2022 13:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A21605B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CA111BF29C
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 13:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71A94410C6
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 13:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A94410C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXuIRh_PBVHf for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 13:59:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC6F409F1
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AC6F409F1
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 13:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4VIH2FBkT1OmfMjq/DME0h6h3+mjbRznZke7208hHxXwj3k5tFa+ptIlBChtWhxtdoW21bjViuUMVVyNJ6McFC582G40GSllWRBIPPdCMbWiX0uPJCoTTfTAVSeL6QSZvPendOhqwK6OPra238BaC8vBQb+T+R2wPqEp2DnwgCzREWnfBsJMaUf8/84ZimmjdxstpAhv/sMtmwAYct/xen8dPHIBbfLL21o/WmN87Xtxhsq8X0nutUWOljXjx4ENanh+bBIIOCoYXo2+ClC6oULksNG5aBi+R787twdhE8HmrJ2cr0QKLYk7FLhI7uTBX3n7+D7Fd1a/rwHqyhSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDd2HsTZFnQ+Y9XCtbeWCV6an1ff+FqP/l2o1LExxRs=;
 b=WFSa7hYx77kXE+ndGvl73G8rz9/H54Dst6N37Kw77dggxahZlrcY3HjLRjy9N9Vw0tA+/+iul1jWJQo5ZcgSlSJCFha9oLe8QvEDarrju4RT2Ve19XheoBr35RaY6sX5jL6TMmjwAfWvqQRgcXqQTIgRDh3twh0xv2ZG1RA7X+ukkmHcxAZqGeOfjM+QDdxCVfMrqifR6VmTpdfVOvOAWnBdd9ksWk3bwXnIkU6uRsZAAa3Pw2WtgYW+6Ad0wO7AxaG47gaZ4m23CgztYndgYpeFT8O6nFeyrt7JcBxBToXRId3kOuNkVwGv66dFte9H1WRes2gpjdp3so94lGIpBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM6PR12MB4218.namprd12.prod.outlook.com (2603:10b6:5:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Mon, 1 Aug
 2022 13:59:12 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::253a:804:ec0f:f545]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::253a:804:ec0f:f545%4]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 13:59:12 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 'Peter Korsgaard'
 <peter@korsgaard.com>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CACyHP5oAAHg6ggAAnsZCAACrQ24ABfTcAgAAZeWeAADjQu4AAk5KBgAAxKwCAABaNAIB+E1Bg
Date: Mon, 1 Aug 2022 13:59:11 +0000
Message-ID: <CH2PR12MB5004860BC0816E61B757266AF09A9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758FE7F237530275606A745D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <875ymcawvb.fsf@dell.be.48ers.dk>
 <56c3feaa-cbd2-eaa9-7800-cd2102fa8545@lucaceresoli.net>
 <D9EEAC86-D8CB-46E0-A019-B0F792B0511C@xilinx.com>
 <874k1ua6mw.fsf@dell.be.48ers.dk>
 <B695963F-1D4C-4D05-B152-54F424FE025B@xilinx.com>
 <200341c2-809e-8d14-686c-8bf838a15df6@lucaceresoli.net>
 <SJ0PR02MB77589186692C36CA8975DE4ED7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB77589186692C36CA8975DE4ED7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05fc97d5-b61f-4162-415d-08da73c60321
x-ms-traffictypediagnostic: DM6PR12MB4218:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zdYiVTyO7RNUjUPwkAaDSq+L2wdOpJAaxtNxlyT9256uKu6BSl40iu1UqYUgyq4Gwy3mwQdUSuU+ubIwyLgmNbTvmoP4j8YGRK8ex1fVdne7kyGYULHb759OPltGIsZa5ch2VyZnwqRtFpf/DBy7NxjKzBGVCHCzV4/JRa67V8joDIjevNXuAnImjuoPIgS2ekQgL50yXFFUg0+sTiyjBWpSN3zRGLG2kUQ37pcJ/12JbJFI2d1mklVjnEeNDYKVv63hWOvgnzhKQ4RYzsf1RuAgWMi4+kYckQQeQaL16eg2RtUIUitHDiXzqnaDIMaQamQQ+2VQ8XOqtWbBTpMDGwO/F2eMtSCOHodcSkLW9dmp5346alUxpvXr1NOyqYh8XS8LWMBrUW9KoixaxsvSlejsxlGAnMb+oLomr8Lh6fhGOfx2X3zZmiN+AKBHMtaEGTwlN2mYU8ueNCidmgAma/kfwVPKKlcSDuSBzeDYo4PQaT/Icn9dQmOZCZf3RisznFtTpgT6cXA+lwBNXcYphgba+5O2s2BVybxGmb+PO7rII647JxijP3FDYAQ3ajakeoXuXzF/SSsSqEGFfIkLjpIsszyoWH+606pgLum0Rr9o7oW+CPjQsE/gggVs5rw18LFvzXBOYkdb/0DNkQi1zpirHmoDDNMr6ePXZYrU9DC10HVLYZC7BkkI5pTGTBPLBrQM/jZdZv0NcEGdAhsuHkPz5lpfqrwXtEbHoTNd/phZG8B5e3b7P5r2fcShmB11FDuNAsyPFkugQPtUU5WuhdDOMqrkB4LOb24oxUEnPdAS+JW64MaWEKkY5aowfj63iA4Urqfwp0Bo31qDuFjdfmQ35+gFv5rsfEqpaHPcfQ+NeAq7cHJrcZwNLt4Ha8Dz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(66574015)(186003)(2906002)(6506007)(41300700001)(7696005)(9686003)(33656002)(26005)(38070700005)(53546011)(38100700002)(66946007)(66556008)(83380400001)(55016003)(52536014)(86362001)(316002)(8676002)(4326008)(71200400001)(66476007)(76116006)(54906003)(66446008)(64756008)(110136005)(122000001)(966005)(478600001)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2tuN1FMNS92YTRwUjR2YS9Hbnc0QTNXSWVHc2JpdktNTjdjNllyVStWN25z?=
 =?utf-8?B?czdiVmxpSzVUTDdpUURiWkpLWSsrb2JuSEpEREtHMXNuNm9GYk0yemEveWQ2?=
 =?utf-8?B?MTdUdlI2RjE4RTVGNHNyU3kyV3BETVBTOG1DRnA3RlFQTE1BYmltL2ZCREdG?=
 =?utf-8?B?QlZuZ0hxZlJpL1ExS2pSRWdjUHJSRWptczdOd1Faa1BOeWsyYjg1L1lsZ2pq?=
 =?utf-8?B?T096SzhobSt6T0IwaVo1bHcwNHZrVHFsWEMrb2lKNnlYK3dOMjBoV3JKVjBI?=
 =?utf-8?B?WGdsVUQ0VlNGaFE5aENjdi9uQ3NRT0R2Qm0wL015ZWp2ODhoWEFCUzBTR0pr?=
 =?utf-8?B?UW1xZ3VRZUpBRFNZelpJYWpNbkVUaWVzRWlMQms1aHB6emNHQllxanVsRlZz?=
 =?utf-8?B?WTVOdWFTUTNwM3pCelhwbUJKSzFrWk1XbkVmRDNKaUhkRVJXS0RxTFJMOXlR?=
 =?utf-8?B?V3lJeFJ4S1AyYXBGRS9RNVZWb21Zd1hQL2w5bGpWdVF3SlZvNUIzakF3QURr?=
 =?utf-8?B?QUNZc0lVZlRQWTNkSEdMOTlvMGRHRVFhY05aMXhrVDZyTWdlSE5HK2ZXVnBH?=
 =?utf-8?B?OWlML0lPUDJieWJ3UGhPcG9aSjdXdG5mcmljUlozWFFjaUNoenlwUDVrNWp1?=
 =?utf-8?B?UXljenRLMVQ5VzQrbit1U0Y5Nk1QdWRMN0U3ZFdvSzh1YXdXc0d4TGI4Y1hw?=
 =?utf-8?B?MW1IQ1R6QjFCSDcwL2tieVZpYkl3aGk2bVN2ZkV6VllrNk1mK1p1NzZRamli?=
 =?utf-8?B?cDhRcVJ0TlNFTjZsNUlRb3ZaeURVZHNITE1zbHNHNDAxZlh4aTJabUh3N3BX?=
 =?utf-8?B?VFFDUEN2aTFVc0pMcWNuV2RPdkljejNyQ29TVm5tQ2gvK3lIRHlyanFyTDln?=
 =?utf-8?B?Y3pDbzVOTVBlZnVhV2lzdXphbG1FOWhkWXRFTithb1hnTEtFN1pNRkpsaFZh?=
 =?utf-8?B?VkY5OExwYzMvZHV4aTVxUmdLYzZrNVdmeHJzY2xHU0VmU0xWVW1MR01kSUJB?=
 =?utf-8?B?ZTJqNHgzZmpra1lYUjhYVVN1dUNWWHNzZFBTRUtyeHNtblJkYit3RTBaSmF3?=
 =?utf-8?B?RmNKazQ4YkFIN1QybFQyQ2N2dE5ITGVhS29xb0ZnZ2ZTQkNhYlVFSk4rNUFq?=
 =?utf-8?B?ZlRCcnM3RFc5NmpFUFFmdVNXeHhrNFhyWVBPWW1ZbzJjNDVpZHNEMFFqQzlY?=
 =?utf-8?B?clpKN0NFWVM3NVRYNzJMTm16TmNWVWtuS0dGM1NVblNla3RlTWJ3UENpOU9m?=
 =?utf-8?B?dWpzdXhUUVRmeFNveVVBS0RpQ0dzbDlWSmF1UXB6QkgrMDJQanp3TVJHTXo4?=
 =?utf-8?B?c1M2cCt5WVN0eXd2UHJqTGJCaVNXcGVHKzQxRGliV1QvbXg4YlMvZCtWTU1o?=
 =?utf-8?B?ZzFqZnJMdkdqYVRyRFEwVE9JdndiU3lScXJqWEZrUWFvaEIwUXUrL2IyZ0dG?=
 =?utf-8?B?YmxqMTVCMk9EeThvZzhKYXYvWHNKOE5LcFo1WlpOSTFrRVNBYVpLTVIySHNQ?=
 =?utf-8?B?bHBlbWtnckpQUUZrN3pNamhFSTczTTR6Rm9wK0Qyc1Q0MTdLQnhjcTVjYm9T?=
 =?utf-8?B?Y0gzTG8ySExyRldNZG9iMFJSNFJNR3g5Rk0yc2VJVktPRVhiWUQ3MU8xejZV?=
 =?utf-8?B?QWp6YTlrMTI4NnVSUmpJdW4wN0ViZUlVMW5RN1VWeXZvWlZQQVQvcEZrS0Vv?=
 =?utf-8?B?Vy91dUxRbGFjZEVReG9DQWFWWGl1V3diRm5KUVRsdkhrVCtNeFhnVmZrMEVu?=
 =?utf-8?B?MWNjYzFNa1dkVEN5bjNOaExlV2QwVG9zTGVySVlIeXRtUjlzWkVXV21BZEJ6?=
 =?utf-8?B?ZHowazYyOXZQdmJ3anF3S1ZOaG0yUjhBMmNTUmhwQU9HakZndUZvM1hnNmZU?=
 =?utf-8?B?YllMcDRKVW1ZaGpaamtGR0tJWTlIb3Q3eG95TTlLaUQ3dDdXcjhLSzA4Smo5?=
 =?utf-8?B?UTlPRlhYaDNXR09MbXR2NkkrSlhISVBzWWNlQjlscFk2cy9PKzBvcjlVTEVI?=
 =?utf-8?B?Nnc3clFVY3dpOEE4WDFpS0NNaXRtVkV4STVHdHNFMEpVQzBBeGkvLzA2QmJh?=
 =?utf-8?B?MzJIcW03dm8xVmpJdHpiaEpHWlZhcGNSTnVYMTNtUGpQZ3NaOFNhNkVGbC9P?=
 =?utf-8?Q?53Rk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fc97d5-b61f-4162-415d-08da73c60321
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2022 13:59:11.8972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SIWAhAi6GhWUzKhCgbXEIl7tP0A6FwLwP410rKB9jA4VX5nRnlznDbd2K0Ieywgt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4218
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDd2HsTZFnQ+Y9XCtbeWCV6an1ff+FqP/l2o1LExxRs=;
 b=CVjdgDy8KfWyNEUSbDvFO4liVLNJmZ+lnUcbKFs4eLga8oAnGxhwFUAJFYHISkSJGPaUwIWcIiwxE+wip55ZQZ8f5vgiazNF0jMKDLv/IGmMEGCuNaV7X53gLX03HSvqVYzmI2iT76IGhDnABCRrlJWGkMpi0hMAcMmj/wGS9sc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CVjdgDy8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "'giulio.benetti@benettiengineering.com'"
 <giulio.benetti@benettiengineering.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "'buildroot@buildroot.org'" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KPiBIaSBOZWFsLA0KDQpPbiAxMy8wNS8yMiAwNjoyMSwgTmVhbCBGcmFnZXIg
d3JvdGU6DQo+IEhpIFBldGVyLCBMdWNhLA0KPg0KPg0KPg0KPj4gTGUgMTIgbWFpIDIwMjIgw6Ag
MjE6MzMsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gYSDDqWNyaXQgOg0K
Pj4NCj4+IO+7v0NBVVRJT046IFRoaXMgbWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4
dGVybmFsIFNvdXJjZS4gUGxlYXNlIHVzZSBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hl
biBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0
aGlzIGVtYWlsLg0KPj4NCj4+DQo+Pj4+Pj4+ICJOZWFsIiA9PSBOZWFsIEZyYWdlciA8bmVhbGZA
eGlsaW54LmNvbT4gd3JpdGVzOg0KPj4NCj4+IEhpLA0KPj4NCj4+Pj4+IEkgaGFkIHRvIGFsc28g
cGFzcyB0aGUgLW0qIGZsYWdzIGluIEVYVFJBX0NPTVBJTEVSX0ZMQUdTIHRvIGdldCBpdCANCj4+
Pj4+IHRvIGxpbmssIHByZXN1bWFibHkgdGhlIHBldGFsaW51eCB0b29sY2hhaW4gaGFzIGluY29t
cGF0aWJsZSANCj4+Pj4+IGRlZmF1bHRzLiBMdWNhLCBhbnkgc3BlY2lmaWMgcmVhc29ucyB0byBu
b3QgcGFzcyBDRkxBR1MgdGhlcmU/DQo+Pj4+DQo+Pj4+IEknbSBhZnJhaWQgSSBoYXZlIG5vIHJl
YWwgYW5zd2VyLiA6KCBXaGVuIEkgaW5pdGlhbGx5IHdyb3RlIHRoZSANCj4+Pj4gc2NyaXB0IEkg
ZGlkIGl0IHRvIGhhdmUgdGhlIHNhbWUgbG9naWMgYXMgcGV0YWxpbnV4LiBMYXRlciBJIGRpZG4n
dCANCj4+Pj4gd2F0Y2ggZm9yIGl0cyBjaGFuZ2VzLiBJIHdvdWxkIGxvdmUgdG8gYmUgaGVscGZ1
bCBidXQgSSBoYXZlIG5vIA0KPj4+PiBhY2Nlc3MgdG8gYSB6eW5xbXAgYm9hcmQgbm93Lg0KPj4N
Cj4+PiBXb3VsZCBpdCBiZSBwb3NzaWJsZSBmb3IgeW91IHRvIGp1c3QgaW1wbGVtZW50IHRoZSBj
aGFuZ2VzIHRoYXQgDQo+Pj4gUGV0ZXIgaGFzIHByb3Bvc2VkPyAgUGV0ZXIgYXBwZWFycyB0byBo
YXZlIGFscmVhZHkgaWRlbnRpZmllZCBhIHNvbHV0aW9uLg0KPj4NCj4+PiBCb3RoIFBldGVyIGFu
ZCBJIGhhdmUgemN1MTA2IGJvYXJkcywgc28gd2UgY2FuIGJvdGggdGVzdCBhbmQgdmVyaWZ5IA0K
Pj4+IHRoZSB1cGRhdGUgd29ya3MuDQo+Pg0KPj4gU29ycnksIHRoYXQgaXMgbm90IHRydWUuIEkg
aGF2ZW4ndCBmb3VuZCB0aGUgbWFnaWMgaW5jYXJuYXRpb24gdG8gZ2V0IA0KPj4gYSB3b3JraW5n
IHBtdWZ3IGJ1aWxkIHdpdGggdGhlIHRvb2xjaGFpbiBidWlsdCBieSBjcm9zc3Rvb2wtbmcuIE15
IA0KPj4gZGlmZiB3YXMganVzdCB0byBzaG93IHdoYXQgSSBoYWQgdG8gY2hhbmdlIHRvIGFkanVz
dCANCj4+IHp5bnFtcC1wbXVmdy1idWlsZGVyIHRvIHVzZSBhIHBldGFsaW51eCB0b29sY2hhaW4u
DQo+Pg0KPg0KPiBJcyB0aGVyZSBhIHJlYXNvbiB3aHkgd2UgY2Fubm90IGNoYW5nZSB0aGUgenlu
cW1wLXBtdWZ3LWJ1aWxkZXIgdG8gZG93bmxvYWQgdGhlIHNhbWUgdG9vbGNoYWluIHRoYXQgcGV0
YWxpbnV4IHVzZXMgYXMgdGhlIGNyb3NzdG9vbC1uZyB0b29sY2hhaW4/DQoNCj4gQ2FuIHlvdSBw
b2ludCB0byB3aGVyZSB0aGUgcGV0YWxpbnV4IHRvb2xjaGFpbiBjb21lcyBmcm9tPw0KDQo+IElm
IHBldGFsaW51eCB1c2VzIGEgcHVibGljbHkgYXZhaWxhYmxlIHByZWJ1aWx0IHRvb2xjaGFpbiwg
cG9zc2libHkgd2l0aCBzb3VyY2VzIGF2YWlsYWJsZSwgdGhlbiB0aGlzIGNvdWxkIGJlIGNvbnNp
ZGVyZWQuDQoNCj4gSG93ZXZlciBJIHN1c3BlY3QgaXQgZG9lcyB1c2UgYSB0b29sY2hhaW4gdGhh
dCBpcyBzaGlwcGVkIGJ5IFZpdGlzLiBJZiBpdCBpcyB0aGUgY2FzZSwgdGhlbiBpdCdzIG5vdCBh
biBvcHRpb24gaGVyZS4NCg0KPiBUaGUgZXN0IG9wdGlvbiB3b3VsZCBiZSB0byBmaXggdGhlIGN0
LW5nIHRvb2xjaGFpbiBvZiBjb3Vyc2UsIGJ1dCBJJ20gDQo+IGFmcmFpZCBJIGNhbm5vdCBiZSB2
ZXJ5IGhlbHBmdWwgb24gdGhpcywgZXNwZWNpYWxseSB3aXRob3V0IGFuIA0KPiBoYXJkd2FyZSB0
byB0ZXN0LiA6KA0KDQo+IFZpdGlzIGFuZCBQZXRhTGludXggMjAyMi4xIHVzZSBHQ0MgY29tcGls
ZXIgMTEuMi4wIHdpdGggdGhlIGZvbGxvd2luZyBwYXRjaCBzZXQ6DQo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9YaWxpbngvbWV0YS14aWxpbngvdHJlZS94bG54LXJlbC12MjAyMi4xL21ldGEtbWljcm9i
bGF6ZS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTENCg0KSSB3YW50ZWQgdG8gZm9sbG93IHVw
IG9uIHRoaXMuICBIYXZlIHlvdSBoYWQgYSBjaGFuY2UgdG8gYXBwbHkgdGhlc2UgcGF0Y2hlcyB0
byB0aGUgY29tcGlsZXIgdXNlZCBieSB0aGUgenlucW1wLXBtdWZ3LWJ1aWxkZXI/DQoNCkl0IHdv
dWxkIGJlIGdyZWF0IGlmIHdlIGNvdWxkIHVwZGF0ZSB0aGUgenlucW1wLXBtdWZ3LWJ1aWxkZXIg
dG8gZ2VuZXJhdGUgZ29vZCBwbXVmdyBpbWFnZXMgZm9yIHp5bnFtcCBhbmQga3JpYSBzb21zIGlu
IHRpbWUgZm9yIHRoZSAyMDIyLjIgdXBkYXRlLg0KDQpEbyB5b3UgaGF2ZSBhbnkgaWRlYXMgaG93
IHdlIGNhbiBwcm9jZWVkPw0KDQpCZXN0IHJlZ2FyZHMsDQpOZWFsIEZyYWdlcg0KQU1EDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
