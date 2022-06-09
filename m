Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CA2C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 10:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D014E40BF9;
	Thu,  9 Jun 2022 10:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFxLFi0OwNtG; Thu,  9 Jun 2022 10:21:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A6D840198;
	Thu,  9 Jun 2022 10:21:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 509FD1BF3DD
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 10:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D90483E63
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 10:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K_6BgIZiEjLY for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 10:21:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::610])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AF9F83E2F
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 10:21:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpmZxFSyFPxfOO1eZiCKualg5kb/5PzrBSYQFYJIY5iwHdNbiu0g6wv1AfNN5j3sP8/+mzx3eEb4rNMrwoKRsQMSEMGcRjQFD6MbRFVDWz0chjmXIlxCZMqmUT5SL8jsySpxg5/RkDAo7ZnbdGUB0Q9IUjRUpQXSt1ZcQ7eJjmTCcM0PVKS++Jtw0vaZLu1lacBFHA1Vadeciy9ZDOP1ICEQgi2JDgssz8walq3wLxi70ZgEN5CcVyLUM1eEvZ5RncIXTvPaKrBSRuHxlaI3G9h1uu1mppXtyTtsgo6tlg1QHr4Q2k3a4IU8ztE1oI4gArJgKmMTCW980fPp8PUUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktLAE+a6Z7TY5wrfKz/jX1ivms6btkytn3KhrzJqqOw=;
 b=CuNP0aElm9r2jezR8FiaLEXUg3cu12mIMvbQ0los0FjB9/kbXgd85PkG00CRaxDEZxyP5F+2Vfp1xLpmhNbYAOkHgod8/RYFDx7rm/hKQ9c4O0dDrR81KwjarSl3s6hwlhGALX37ne+2u/d9E+puN9o2R+goSCVulM4UAzAhqmV4ebBV31rA0KbzYVNEhEmHQhrgoEBhvRnEiBYvD5xJ4xOG2YwSJ3UtIfuVE5EA7RF3pfQgwT4x/tztli0XdNsY4PFZ9i++X+MERf1AA/RkObP+CAfXs2Ch3x/rPy5qQCSSjiO582OH15+bbVf903+FHmQHx56igPB1JLKhDOSGiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktLAE+a6Z7TY5wrfKz/jX1ivms6btkytn3KhrzJqqOw=;
 b=CZKSRCtmv/xR1bMGegFll3Zcm5I1BN68zgaxCsc1BG8iGcFYmVmPtfViZXMvArOdZ4zk/SLC3uvEI5cegHYVKQ2bXcj5Y3kVpsbuweVkmPFchMejn8rzAosYFSqhFs7pVXE3SZV/dEHSndFt+6vwt9C3LEE4iJoAwlItkfsEo3o=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB5914.namprd02.prod.outlook.com (2603:10b6:5:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 10:20:55 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 10:20:55 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Neal Frager <neal.frager@amd.com>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] configs/zynqmp_kria_xxx_defconfig: uboot dp pll
 patch
Thread-Index: AQHYbmd9gaU+9UDylEGY0VVZaYvTQK0vqcaAgBdOTIA=
Date: Thu, 9 Jun 2022 10:20:55 +0000
Message-ID: <SJ0PR02MB7758323D519C1EAAC34AAFEAD7A79@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220523053921.4076488-1-neal.frager@amd.com>
 <16f0674d-b933-730c-7600-45453d1d21f7@lucaceresoli.net>
In-Reply-To: <16f0674d-b933-730c-7600-45453d1d21f7@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fc8e254-a1cc-4bc8-8d70-08da4a01bce6
x-ms-traffictypediagnostic: DM6PR02MB5914:EE_
x-microsoft-antispam-prvs: <DM6PR02MB591420AFD793CBB1ECC21D35D7A79@DM6PR02MB5914.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BM5sWCP6lbGpWWfOBXuIp/eALqE6V8xCXIlUs46XgQ2FoTXGm6Aupld3X1YKNkYiSoHF0HuPoIPNzV/oKUCb6DjFR3+sGYALHOtbd6pKaZniX/ac6zaqLklIRVB3Wg24geYpiebh19t1/tT75X/BeO8OICjRbNpLKn8kCxmeSqYXRmTddJ9O2n+gEQc5MH3WJuRTltvvF6WAjXGTu3lRGQMqUONOTAAB2AMvfwfo7JCHNaxbdTs1YKnVLNdFR73WzfNghC9pEBKxt0+nQIGo0z3PZXXBmNKJoMuFro1Cjst539uD3+HHo1Ou6hNgJx1Qi06dPAnzWpAIi0UoOBuVH396UKgyS9BoEiT+wt6j4vqXxfGaZDGVlV2ja7kLaS8uv986DHRsZwNwNmfxG857tA2+6FTTaw3LljuKWdZYYJ00mOjF4bUC7dl7YX0KRQ/V6yPSvgrBFevf4Qfd2XZ0FuwGQGVoL95ldrr39SaEra9sqhu6rlmTEbfguqqYi6Aezyonr86XYUFHa6cM1sYkOIrVMxbvMC8eyQpFQREWCEt3Zg5p1yKoMpv9PxhQB82wZyUYkKwCPKtapGMVWHG3oZkGBq6vmq67vKz/2sCqZU7ymeNrzqI13oRD3yrX0AVK/Jmv3TE7fBdJPchygnhOCRhzdB4ML6f9PJ+xIC6fmeK5ImDE8NpciSJLagUc8OG/hW9H4JJm9fml5Vdkf0erzyR6gMtS9N7JfBwGQ83GosFMlVX2mQN2bMzxIF2gh0wdAW6zt0QsYTUnLNHQbQD5WTeWSL9aYtxQJIDrRqOhHqk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(2906002)(38100700002)(5660300002)(71200400001)(122000001)(33656002)(8936002)(508600001)(83380400001)(76116006)(186003)(66446008)(66476007)(66556008)(66946007)(64756008)(55016003)(54906003)(110136005)(4326008)(8676002)(316002)(9686003)(52536014)(6506007)(26005)(7696005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkJod0pTSU83a0plcTFGM2JaeFFXY1dzUWxrOUx2NTcwNHVOeFRYQXN4bFNl?=
 =?utf-8?B?UVBJRVpEMHpLQ29oaldpbUh3LzM1anRsa1ZlTjE0RmRGNml6dmI5OWl0aHNU?=
 =?utf-8?B?ZEVzc2hyeFpQS05jQ0J5T3pISm15blZhWmdQaEN5UG5sT1cwTXhHVEtSSEhP?=
 =?utf-8?B?RHl6bDJPcWNtVzkyeVBxb1BVam1wcFd1cytPcmZvZW9qTnArMXlzdGdBanVp?=
 =?utf-8?B?RGRxdGI5ZmhkdWJRV1pRU2JlVDZiTGhXbUdSc3pIMVNPSVdUSXY5ZmhOb05n?=
 =?utf-8?B?dWE5RHBnZ0lWcWRkaDdNMittcXhyQ2tjTTBhcmNMdzFCekI4Smd2WE5vNitP?=
 =?utf-8?B?SUdSVy9nMzhpdzJTMTBXZitHRmVIN3Y0YzVSM1k3TGZ4RE1kWEh2UDhMVVZQ?=
 =?utf-8?B?a0E4NG1NZzR1ek1NZUFHMk0wNmdNUnVERThXNjJqM1pVN2Q4RTlvY0pMYUlX?=
 =?utf-8?B?RTE4MU55a1BCY1VkbkRxWHZ0YS9Lb3hhaitqeGhPZGhicnovT3Z0WURiMllp?=
 =?utf-8?B?dnhNT1lJWDRqd2JMZy9LSlZKQXY4N3RpcWVYTVhHSDBDenM2S1o1eGZobG91?=
 =?utf-8?B?YU1sMzlyY3lQMjFZcDIyc3crVlV6TERRUzZPVGlEQWpsQlc3dk1sRWVZaGZ6?=
 =?utf-8?B?RkttSUNUejJrd2E5MVdoTU9JVSt5cnh4MXJpVWNLa2cvVTRlbzhqVVBQZGtZ?=
 =?utf-8?B?eCtycCs4M09sakJyREhyMENOYTdPcDZhWDh1VnRUN0p3WElhT1dmQU00MTNr?=
 =?utf-8?B?QTdzSnhXUHdlakt0QkJPK0F1NGpNekpjQU5QQmhRdy9kd0M2ZHVyTUorZWgw?=
 =?utf-8?B?cXhBWkl4OXY0WjA3bm5nVGdiMmd6UG1ROUZzREdxa0xwUFR1ZUpQSnF2OUFw?=
 =?utf-8?B?Z0ZkZUNKdXVHWEFCNG1BWXZTQ2ZFcFk0VnFXa200ZzN2RVc1eXg4NjFEREx2?=
 =?utf-8?B?Y0FkakdabjVESXQ4UjRIN0g2b000ZUtzdlVSelhnOGwvdjM5OGQwQ1gvRGxB?=
 =?utf-8?B?TjdVVit1clI3S0ZJZk1LaXZFSHRrQVJIVm0rNTFJdExGbHAzZjBqWk5ZUEdS?=
 =?utf-8?B?cW92N1EzTUdNalNqbDAxL2Q3azc1SWM3K2ZZRzI0Q0ZiMUxEU25jOWwvKy95?=
 =?utf-8?B?WmRYWVcrOGh6a3J5bnc0bVNZNms3MzdxSVJCZjFYZUQrU29uaTF6MEE1MExL?=
 =?utf-8?B?eHhKSFovSkhIZFBoczRrQnhZWDdlTGFKdy9TV3dCU1hlaHNjSHM5d0RreURS?=
 =?utf-8?B?clB3NmZiTldXRFRnNWNvZEVqMEJ5K3M4RnJEcnBGVDJ3czVuMVg3RnJnZUNO?=
 =?utf-8?B?RDhnMEJpZFd3Z0NOVGhXVm55c0NITHNsR3FYdWp2MnZHN1krbzJxUjcwQ0ZK?=
 =?utf-8?B?RTAwNEdQMU9LVEJWSW8vbjJsU1hLcDFJTU5jSndSNzBBYThOalpsMHFJZVZK?=
 =?utf-8?B?MWRCL1lpSU93bUpzbzlFMlVidS85aTZxajJEVHlibVRQNEpVN05IMFpmemRN?=
 =?utf-8?B?TCs4L1RERE92Q0ZpVVFxaG5CWGlXTUtBSEFBVFVrTWdHMWhYdDFaWllKU0Rs?=
 =?utf-8?B?UEYvZXU2aDBDZlhSOGM3dDQ5SHZSZXVvVEVuZGxON2diZjdhaDk4Z2NlUXd0?=
 =?utf-8?B?dW5Kb2FEQ0tUL3VQZENmTks0Q0Y4YXJYZHBQODdwZ295S1M4eTFkc3doaU1X?=
 =?utf-8?B?MmFtZ3dDMitaUkxWZkViZmdUeUp3NWg5d0pJV1NiRWFYYjV0UFlzck9JTDYx?=
 =?utf-8?B?YnRLTElrVHlpd3FGSFpIM0NnQUZxRnNxVWxVSVpNYkllUElVbTRROHMzZnNQ?=
 =?utf-8?B?SkJTKzBFMGxxS05CNFdhRlc0QWxHeUxERFhzaENFeGQ0Q2RiaDFxWjdMQjFE?=
 =?utf-8?B?ekkySGxKL1Z1NTBiMmJCTnFrNkNlR3JlU1BhTE1FVE1SYVJuemRGUlJNaUhZ?=
 =?utf-8?B?dEp0MWVERWlWOUVzUndidHFOME5IT2doWFpOc2M4ZUFrOGZLVC8wSlBtNnM4?=
 =?utf-8?B?VGJSbFdKYkUxOFo5d2J6WlU5dm0wZXBOdW1wek9ZdmRZSXcvV3RiK2JOVG0z?=
 =?utf-8?B?dWVZRjN4UVhQVnNoRERBcmZPOWp6S0ZKM3oyRkluczhEaU5pV0kyaGxOUlBU?=
 =?utf-8?B?Q29hQ1lGL0dhS2Z4Qm9XY0FKeHJEdGJ1amwzSEpIN2VTM3FFTVNVOU11LzNp?=
 =?utf-8?B?ZXMvMkh3dCsyZ29OQ0txWUdoV096cXUxYWRYaS8rd3BZU2NNbnBsZnJwT0hW?=
 =?utf-8?B?SWN0eElmZ0Y1UU9nY3VFV3Q5OFhoTDRuZHU3L05qNzNzaEJ6MDdORDY2RTV2?=
 =?utf-8?B?QmxOOTV5MzNncC9JSkJvNHJQN3duWEZBRjFQYmhTK1ZTZFJ5eFhaUT09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc8e254-a1cc-4bc8-8d70-08da4a01bce6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 10:20:55.0682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZjzCLm2AFvPkTtiq0oBQtWnR6Q2/mu7qvVx3AUVhBvPSjoz9+XD1Nqy8gxhtUtguOIy5GGbemUkQn9M7U/meCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5914
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_xxx_defconfig:
 uboot dp pll patch
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

> This patch fixes the DP audio and video PLL configurations for the zynqmp-sm-k26-revA som.
> It needs to be applied for both the kv260 and kr260 starter kits.
>
> The Linux DP driver expects the DP to be using the following PLL config:
>   - DP video PLL should use the VPLL (0x0)
>   - DP audio PLL should use the RPLL (0x3)
>   - DP system time clock PLL should use RPLL (0x3)
>
> Register 0xFD1A0070 configures the DP video PLL.
> Register 0xFD1A0074 configures the DP audio PLL.
> Register 0xFD1A007C configures the DP system time clock PLL.
>
> This patch was build and run tested on a zynqmp-kria-kv260 target board.
>
> Upstream-Status: submitted (https://lore.kernel.org/all/fa7e9abc419c9d7648405d1c62367dbe701d09b8.1652709736.git.michal.simek@amd.com/)
> This patch will be removed from buildroot in a future release when no longer necessary.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Just a friendly reminder regarding this patch.  Any additional changes needed before committing?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
