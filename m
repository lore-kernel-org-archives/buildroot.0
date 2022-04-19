Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666ABC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 10:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE941840B2;
	Tue, 19 Apr 2022 10:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfLG_aXREuCK; Tue, 19 Apr 2022 10:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 030288406A;
	Tue, 19 Apr 2022 10:23:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F10ED1BF8B4
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 10:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9A38424B0
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 10:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="H2Y4IttH";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="Z+t0Y6f+"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTePrz95Lrwc for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 10:23:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 044CD4247B
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650363788; x=1681899788;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PikFgo6hB+gX1kvadyS43OvT6gHWA31ioONBV5qeHEA=;
 b=H2Y4IttHVgi2/q5iNKy+03VORjtnLhdEGQ+A1aRfw44fqlkg0OG0m7go
 Svyj7Vd/NSp+efhp9TC2qG8aT7bWUe50JhCu0t07r/AoPGjw6ElWUnGrU
 DVYxL1u6Li2ZKFMWm9L0FAXRlkuk8QdeUzryqSlmcYi7jp8y7zoUcjtCT
 cog3LpAYSg3CyCRa1ReY+wN6gruRQ4FY+ruIivyaVZJpqNrz68PmU60uq
 XJ4m/b+KGTMyx7aLE7jwe64PVHaLg7lWXLOt5cDwGl46MiA3ENwGvaD5+
 sDPbFEvZOHn7kjGcr+EYkSkiB264hFxD7Kt2FLIdiOyboBKuoJTAaBm9g A==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643698800"; d="scan'208";a="155980057"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Apr 2022 03:23:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Apr 2022 03:23:06 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 19 Apr 2022 03:23:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n70+25LuPzMXykCbo3Cr5h8VHCoKZpaQWIcOlYm/x8k7uIaZUGaoScmIpOcdDbXKJglT6pJc+4O70Hi3ZtleR1++s0PB0Fhjp8UvHDmOfaxNIQL2ypAnQPW0LHepuB9BKklX5SPs4ne8V8q42Uh9WYf45pN3H/I+NkfQAVU8ZSjN1MDDraV5t5j6NNTLCGh6rXDzn4mVGrxH1zgzTiENlfmzP4B3mfHfg53nWtqA5VDUebymYTBDuJPxGgD+gx3c1XOczDMxYnJ5cBJezzy3rapvofOtK/K6kRY692tnNObzDiGys+RhWjq+8LbQ1kiO2PVHKTj7M30GkqZb6aSxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PikFgo6hB+gX1kvadyS43OvT6gHWA31ioONBV5qeHEA=;
 b=cyPbu4sl+xHFZO+WaV1mrxIlfcl7bDD0XV3Q18J1AWqZUgb70gjtquBKzdRaJTnN0B1WdeeviEuGuL4UNr7NYShBkf5Jj9ur2n93dpem2LCzsHM5BVTioTFti9EUW5jZOXZoSkKbyvl8vBB4StoMzsFqMobia569lXtPSe4eey1CcZ0uCsCdzAZV0NSa2JYL8ZhftpYdNuGVKbY7kkVcoPydB0EDvF1SjsxqkmZIs6qVsb4dWbxSPycIoKJZLVpYpZ3EcGkjl2/s7EDb2dcGB+9VTaItYvi6TqtzTgSoYIJeHQA/0oZX46gpXoWoex2KP4jJRprI8VPJuoGJ19MEkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PikFgo6hB+gX1kvadyS43OvT6gHWA31ioONBV5qeHEA=;
 b=Z+t0Y6f+zyFTt3pO5SOx7DBozuisPOGigeAHeklt/QWueP6Ze5VUAxFk2BHZ4K7VaDcKxn0TMb71B0Jx2sbkmjtQfzrFiJuNoEWZWb0RhttLE0Wdw5/8n0JU0+GQdvti35mekWXaT/1WX3fDfkjV7fzgPrau2h7sUjrBZd8W+Fc=
Received: from DM4PR11MB5392.namprd11.prod.outlook.com (2603:10b6:5:397::10)
 by MN2PR11MB4520.namprd11.prod.outlook.com (2603:10b6:208:265::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 10:23:02 +0000
Received: from DM4PR11MB5392.namprd11.prod.outlook.com
 ([fe80::e186:1a12:25e2:dc01]) by DM4PR11MB5392.namprd11.prod.outlook.com
 ([fe80::e186:1a12:25e2:dc01%3]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 10:23:00 +0000
To: <Jason@zx2c4.com>, <peter@korsgaard.com>
Thread-Topic: [Buildroot] [PATCH] package/urandom-scripts: do not seed if
 initial seed doesn't exist
Thread-Index: AQHYUYWUXoPhbrra30Oxsp5sg12jOqzyjhoZgAOR/oCAAATIAIAA5veA
Date: Tue, 19 Apr 2022 10:23:00 +0000
Message-ID: <1e909158-2660-108d-7cf4-c7dc0325f603@microchip.com>
References: <87sfqd8eo9.fsf@dell.be.48ers.dk>
 <20220416113138.72159-1-Jason@zx2c4.com> <87bkx187ig.fsf@dell.be.48ers.dk>
 <0f4e63a3-6b82-aaf0-47af-54102e91ccfb@microchip.com>
 <Yl3LxMttmg5n91CG@zx2c4.com>
In-Reply-To: <Yl3LxMttmg5n91CG@zx2c4.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3501313e-a451-424e-3377-08da21ee94d1
x-ms-traffictypediagnostic: MN2PR11MB4520:EE_
x-microsoft-antispam-prvs: <MN2PR11MB4520A2A33FFB61035996F745E8F29@MN2PR11MB4520.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fazhM9DeRvWmmNMR7cTG9E8nLoEVRbMlqJ58Hg/sU9niEFJ7X1g67LWooBn2dZ0oUj2iE/FGfAG26tqbA1fPM6cxOcfekLCZJsI3SzOD21BDvWTd1GY/0i52+SpMewgfAjy9lI8knb8sNI0z375bTqevOFMcSNU8Rydh//Vkc6am1fsmsE1rmgIvaT1BmTKfa/EFLFhPXKRsfeWZowPdN22IWaRc8M2dHFdDTeCzDHBLDk8Qd0Ie4LQC0TcSx16SiWMU3fLZoBLNunrTfbKO5Lk/gjsPCIui98yZfkjC7qEn54AkR0WpENwcKq4lJoqw2qypTr1pPCixqby3EyIjT4Az/3Dhol9m9/ibeSVswFQ9NW9I/WHlb0WgEDon0KL3xglnHUZJkQEwDHrQxc8ODReLvgjSY6ynbE9vm1s3mzUQxEpKuCH8oaCnAMNsQIUioZO7irlgg5yB6ebms7p3boVcRnDtGOrsNuSFLyGriaI0CG7w/PULoF5b/NKXZSObtR5xlHYC9QUH3OZkTJigiHM6FqqDGJsX5+xaH1Ph7A55yeJKHIqt3NjHKcHQJVOp5Y2GesuHP8HNEyTOfJen096iiTyzu0KGlkgVWvUcYyzEc/SMugbi2kctAVraoopQSzksu05zxwx8/kkSk6VONOzIj4HbVrP6SDl4bNoIfkFgSJMZ7A6S9Wtxv7IDEmAjAWOFiU2XM2mvXDRUP3qaBM146sur5o5fOm6nE61eoiVydv88X0XKy6n6YWYat2AU7pLd3yuey3a0iQV+uBO5Jg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5392.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(316002)(38070700005)(66946007)(8676002)(66476007)(186003)(5660300002)(36756003)(8936002)(83380400001)(2906002)(31686004)(2616005)(6486002)(64756008)(66446008)(122000001)(38100700002)(110136005)(6512007)(31696002)(66556008)(91956017)(71200400001)(6506007)(76116006)(508600001)(4326008)(53546011)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1RDYmpzVWZRb3UzS0NueTB3TlR2bFJKYUQ5UmRxdHdKQmt0RWF3NkJPU0tE?=
 =?utf-8?B?MGNTb0lQWWwrOWFoTTJMajk5SWlQTlRwTG5TYXAya0xUSFh2WDFPTG50MTJP?=
 =?utf-8?B?TXQwcmF2Q201RkZOeHlCY2ExMm56ak51NW9hbDdwNktaOVZ6NlI5TmJMc3Vi?=
 =?utf-8?B?bldLWXRkcHhhTzZHSzFUMysxWHpQV1N4MWdadHNOMHJ1N2FKUUpUczdTaG1t?=
 =?utf-8?B?djRKTlJGQy93RE02bkpEL0Vjczl0NVlPSlJFRHFNNS9Ic0Z2OHdLYSs4THpr?=
 =?utf-8?B?Yjd1c092akVBT2tGMG8wNnpGVGJNbUpac1RvQUJyV2ljNStXR3NJWmRwNnpV?=
 =?utf-8?B?Wmw0UTcrRVVKQUxoSHB3U29BNWNOQ1FZc3lPYUxyMklFYlYrQkxrbVp2bXIv?=
 =?utf-8?B?d2tEQkc1MWpySFBmOGx2aXZsNnhOZThaRXRJbXA3OThLeGpMMmpPMEl3bDE5?=
 =?utf-8?B?V21SblhGcVlhdlFBMTMzc09KZFJ5OUZIc25XajNEcVhsY1ZKemVvb3pYa1ZP?=
 =?utf-8?B?M1l2SnZGVHd1RnVwVVNkbytnVHI5S25pbC9ielhNOFBtSFRQdHRiMnBSQjdj?=
 =?utf-8?B?R09OWlVVak9qaElsWVFiaFdjSlRRVVB1M01uZzdtd3ExdnZnekZaeXVGZkEy?=
 =?utf-8?B?L1BrQ3doWjI3cWd3dHdid0ZlWlljZ1JlOGRTOWdmTWdBVk1KNFMxOStpK043?=
 =?utf-8?B?S2lBVHRyc1R0cGxyM2ZNcHE5aGxzM3crd3FqQmRGZk8wanIyMHljNXJvU0hQ?=
 =?utf-8?B?UmNTYUNuQm4rYUZNYmc4MHE1b3Z1RmJFbDJQSmlUSDQrNWVKaExqdXNHNTdL?=
 =?utf-8?B?RHZmb2tEdFd2UGVUaU1TK2MrWFNoc2tvZnUza2gxUWlPR1FIRklnVmJkVDRr?=
 =?utf-8?B?d1ZjL2NqR0kvR0I3T1VyUkFFYVVPbytyOStXelNJalNZZ3VZRVpOYmI4ZHVs?=
 =?utf-8?B?eS93WkZYZGNTT1c3akdMRlkzaXhZajBBMy9vdjMyYlZJOGRzQzRqR3BBd3Nu?=
 =?utf-8?B?UVR4RVJrNTZzZzZFMHg5aFMybWs0bzJUa3ErSXNzdlBlWlJBR2I4bS9FTnV0?=
 =?utf-8?B?MGxzdndYZGg2SURuQm55OUJmNWVQQ1BzQk9YK0F6UmcwUUpFVnRMaHhoRGJp?=
 =?utf-8?B?UmlHTzRtbEQyT01aeVRCTllkbnFuZzFLZk9IS01JOWVnejgvWTdvc2JjQVFN?=
 =?utf-8?B?cXBmVjRFWWllSkoyaHprN1RJZ0U1QmlvUVdwQ0FESFNTeUhZaHpNQ25JSjRB?=
 =?utf-8?B?aVRJOUlqemVBUEVJVEYzVDhNODU5MGUrZk0vTGM1QkYxbkpFOHdVU09uMlJQ?=
 =?utf-8?B?NGFITG9qWFE3ZXhmTEFHRWJWSkZERGFxcExXRmo0Yk5oR2pSTWxVWFBiQ3ha?=
 =?utf-8?B?RkRUcFBBWGpJS3VXQi84R2hkOU9Oc2ZKdmJjQVp5U3Vzejd1Z3VMczNEZzZF?=
 =?utf-8?B?U3dwQi9vZHp4OFphUnRJbldzbUpseGFEOEh4ZEFEUzRod3pqcUxLSitDYmh3?=
 =?utf-8?B?dW02QUxxNDc4YStnQ0FiM2orT0FBQVdIaW5iZnFpZ3FLYmJZSmxvU3NQc0Y4?=
 =?utf-8?B?Rm1mTUs0SU9pS0thSjBTbHQ3bzVrZmN6ejRSM3YyeGNDRDVYTkFPdG9reXF3?=
 =?utf-8?B?eHJxOTRCWTJyQTk4cVVZS0FkM0wrRXdZR2RHeXYydk40b3ZrTkVSaHN3Smo0?=
 =?utf-8?B?WVlXRU81RHpqWVZmLzdxMnQ2MUNwWWZzMUZjOWUyRXBGamx3V1BNMFFmd1p5?=
 =?utf-8?B?OEdIYzQ0MFFnRVFxTVlIUmU3WFpDQ2xxcVNXUXFDUWJrR0UzV3hMSVFhMEEx?=
 =?utf-8?B?V3dFYlI1TEFmYnZuN2FRZkkxZXRtNXlONkQ2eW9CMFVHM1F4emFicFB5N054?=
 =?utf-8?B?RktGdnAzRDBRL25EODA0MTdIOHQ5clE3eUJCNHVXZDNVVEZzQ2FKekRHUSs5?=
 =?utf-8?B?eDFTZlJNQjBuQnNCWVZ4TG55TWVZZExvWlF2TFVlejc5R2JjRFNWTFM4T1ph?=
 =?utf-8?B?bHgwVTh3aGVGRFRjWlRRaUc0M3hja1JNWExZRGhnV093NG52bW9wRUhsVEND?=
 =?utf-8?B?TUJsTGJGZWszb0xxM1BxWGJuODJjSzMwK2RDRytScmZydzZ0MDYrc1ZmSFVz?=
 =?utf-8?B?WlA4S0dBYy9memR6TDZseFJvelQ5d0VHY3NhcmN1TTRsbldCK0p2cHRDODVL?=
 =?utf-8?B?c0Nmb0RHK0NQeXdtU3pRSkJHMHdGT00xekNpbzNHR1Y0QW5rODUwMEZoOTRG?=
 =?utf-8?B?UjNHczRRS1lLYkVncGpkWXVmaFJ5YnJ3bDNTUnRXTzdrcGVpd0xPSE5iVzlp?=
 =?utf-8?B?c0ZXRExpS043TWxUYU4reWhEQmFiTk1KS2pIMnBRQzZDd09hOG8xWDZ5RFlS?=
 =?utf-8?Q?HL6K+xFeOcTvPns4=3D?=
Content-ID: <0847001D1C4B9648B29DE2F4B56FF18F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3501313e-a451-424e-3377-08da21ee94d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 10:23:00.8080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3mlQPpwbnP5gmHsDYUoNGg4A2t5OjPfFNm4E7dLTpaelic2AcsesivpdgVd7BWpLQFYmVgF0mbaqGf/f6DyvradXd2T1RtjAnhY4LtrCzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4520
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: do not seed if
 initial seed doesn't exist
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
From: "Eugen.Hristev--- via buildroot" <buildroot@buildroot.org>
Reply-To: Eugen.Hristev@microchip.com
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/18/22 11:36 PM, Jason A. Donenfeld wrote:
> Hi Eugen,
> 
> On Mon, Apr 18, 2022 at 08:19:13PM +0000, Eugen.Hristev--- via buildroot wrote:
>> On 4/16/22 4:47 PM, Peter Korsgaard wrote:
>>
>>>>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:
>>>
>>>    > By returning a failure in the event that the initial seed doesn't exist,
>>>    > we'd then skip creating a new seed, which means we'd never in fact have
>>>    > an initial seed, and this script is therefore useless. Fix this by
>>>    > checking for the existence of the seed file first, and just returning 0
>>>    > if it's not there.
>>>
>>>    > Reported-by: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
>>>    > Reported-by: Eugen Hristev <Eugen.Hristev@microchip.com>
>>>    > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>>>
>>> Committed, thanks.
>>>
>>> --
>>> Bye, Peter Korsgaard
>>>
>>
>>
>> Hi Jason,
>>
>> I cherry-picked this patch to my 2022.02.1 tree, and rebuilt my images.
>> I still see this message at boot time :
>>
>> "Initializing random number generator: FAIL"
>>
>> Any ideas about what I could try ?
> 
> Huh, no, not sure. Are you sure your new images are running the new
> file? I've manually run that function and I don't see it erroring...
> 
> Jason
> 


I apologize, it looks like I committed the patch to the wrong branch.
It's working fine now, reported OK on the message.

Thanks for helping out !

Eugen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
