Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899FBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 11:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28CE183E00;
	Tue, 12 Apr 2022 11:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srXOTWUVRZuh; Tue, 12 Apr 2022 11:43:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B0F682F6F;
	Tue, 12 Apr 2022 11:43:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2D791BF865
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 11:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF7DE6100A
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 11:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="EIpNlEOd";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="WNwND1cc"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BJobr3Ovrfam for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 11:43:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07AA660E4D
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 11:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649763801; x=1681299801;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xQRTwnpmocfmdlJDGCPifWPCk78AuyVf3XxQWBYXxbY=;
 b=EIpNlEOd2Jw4MvSikbvoBDTk8FchCEvsho7ipDXBJl+RHMMR7bPV9UVr
 dB3C56KsWLmodGDZnLMl9XLzPXfUheJ+lobmWrMgcPNR+mJJhl4xiokSO
 CpjkrkChPAJj+1ZcoRu++b0gHkODwIDF5v9+Qn0hNnPYsoBSy7/0lH3vK
 Q9esbQvunyoxis/Cu/62AcX6D+PCrOGd0+txm8y/9M8G6FEySzcE2PNe6
 GSz0WZXOJFA8TSXl44LFe6hFDTMa9vAUpSB3ue/hkEp6gHlY1oRn+6Gbb
 yv43d3dw7U/TvdyNI7L09UdpE7o2TJExstBRQqEt0iCt0GsAzjE5MrGuk Q==;
X-IronPort-AV: E=Sophos;i="5.90,253,1643698800"; d="scan'208";a="160226165"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Apr 2022 04:43:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Apr 2022 04:43:20 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 12 Apr 2022 04:43:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkWsD2m6SQ+vfz+d4iMpwbjvj9Dn7OCzrtYoWO7UvkY77Ll5Gu3vaeGBTRT8SvJh4rkrzbLuzaqFp4kBeY5fAYsivjvvVHqorXcVvuCEACZS3K4AnTAKCtaQSTsc4PR8W3OFRItQW5bTN2HQVcztOHhApob+xtT5SAFjTgZemd4VOKt5R4YiBnqh6/+Ze3YXISCJu2IVkqz9+T46O+3+6nQ9A6s/YU+2fLp3h8Fd1NDD2JX8TgVYXmYFtgZ5ZdKcYbRy4q/7ms4dkQIdioboBG6jLAOh6EUjI9wyooReJs10Orkj6WpCNxYJcfC6WHP7LAR0w8fItokQpzUUKJ20/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQRTwnpmocfmdlJDGCPifWPCk78AuyVf3XxQWBYXxbY=;
 b=ehlxxBPs9cPb5Fa52LaEQNwe8jY/D91FzPTxP6cLxFWODubZu/wurvXzRrhkdd3pla0a3ySd51s95xqAv2vxenAB03xyrs4aAhvew2bAItvCdIaV4mND3iOQHzFgvQuzYwZC/+A2d0ZnnO9sVELos6GsseknxD/SdbViJsASMsV0Bquq783cSss4iLcqRb0MMz6MGvE5J1vrBH/CeE/jl993wQE4zQT85SMDedApcH/cRL0DQILVNfv6LXca/v2pCYsUKJrAv4Mf4S5a7ACXskbYO/K/CHGqbfY1KjkigucwZgugIBwG8qPmsiLWsH4QNQ1tvER8gTE8ubxiKanhnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQRTwnpmocfmdlJDGCPifWPCk78AuyVf3XxQWBYXxbY=;
 b=WNwND1ccTxxStN9OiogxYjYyhyJb4Up5ZsnlRfpXhNvKtzNQIH9NlbV/oOnlwmkYoEHDSgvkVtbPJqtIfWL3unuDa0Xa5talOPcnW9uiRWj4GQ9Ef/whXGz3JmVUgBiU042HxUGXIv4NFhWrrb2+XpqMQWLNpA9JkelIUjzMTVw=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Tue, 12 Apr
 2022 11:43:10 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2%7]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 11:43:10 +0000
To: <peter@korsgaard.com>, <fontaine.fabrice@gmail.com>
Thread-Topic: [PATCH 1/1] package/dhcp: use internal bind
Thread-Index: AQHYTmEZ03FYkSO1E0aa3ZrEpJPiy6zsKDSA
Date: Tue, 12 Apr 2022 11:43:10 +0000
Message-ID: <34fddc8f-8710-65f9-330d-81fefe64354a@microchip.com>
References: <20220403100318.2581647-1-fontaine.fabrice@gmail.com>
 <8735ims60b.fsf@dell.be.48ers.dk>
 <d1a1ead3-98a8-35fe-4c4c-e7fd3f02e058@microchip.com>
 <CAPi7W81VbAArhoyDEJrNMeseVXgmJzu2+K39njx1j5y3_5mb5g@mail.gmail.com>
 <8735iifser.fsf@dell.be.48ers.dk>
In-Reply-To: <8735iifser.fsf@dell.be.48ers.dk>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94b1ae13-8362-483b-69a0-08da1c799e7f
x-ms-traffictypediagnostic: DM6PR11MB4721:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4721BDC366C4F7BC5728C54EE8ED9@DM6PR11MB4721.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sqSWDJEKVGA/83JZ26JlTfkPrlcWgm4Icd38VaKYJqtyYlCSXR39bLHCBsfkA2e98nkMtJYjMROXnekCAAsfDp4hiqH43lzpVElmZYlp/d72JWrs0WJIbpslFSCSkj/tSya6xAywadcOKer514uST6Hu9RUrAJJjYBLkPTOpywaAcqGuaPrERooXhIIfVyblfnC/u6hl6l2Sb7BU06OY9sr8/ZtbGQrUKNVGFUQurS0aoItoaiWfo3ndMkAg2NnUs9gnM2iMfJb8ABoYluU85aPnGRtI22m4Rll9eNshGyGZ4uOZVHIJfoTO8NJ6k73PJF7vYNrLmtDwJwExdMbilSESahIjwVEAhZ8qX5CwblDYRebBxSfQ4CmEhEYGfyEuxFJJuGMd8t8r40UyH7l2maqRQleEo3k8F/2vIdNte3WtUshOEk/PAREOAyr+XO6yQ7lANM3213KmyC+J/7q92JaASP0E6NUqkQN/CW+HClx7tbD9LNgCV88xTERcgRy0IvT8T9pLTeAXxjehZt0xfJcZD34sxOY26QFZ+OB0Z0A3ZWWyRVjMDJ+y+kRQVsLELg0Rhw4LThZWW0qn6vJN/DZT5aWcCH6/o2DpgP2IKClr7gl/BWaJeclRuIqDzGm0K36DNb3QqG1fcrUn1OX55T/+kuWGau9w8DgcwULmjDTKGZJYp1jZeu80d0U4oXLaKIEGHEEdLmS8auxQOlCXKywzadnu0AxH72OykqQDa+FMML4ZCj7IboEeGeMK+32bhJo2DXEqdUIgwKJxiR6t6ZJLdtuvpH3b5grwMc9rpsHgW+KA87sktkqOFDtd7JhHjiViO94YuLECiPWRgRlbAASgcDX/Cj1VmQ61DK7r9Es=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(8676002)(36756003)(2906002)(91956017)(31686004)(316002)(64756008)(110136005)(76116006)(4326008)(66556008)(38070700005)(38100700002)(66946007)(66446008)(66476007)(83380400001)(6486002)(508600001)(966005)(6512007)(26005)(6506007)(8936002)(5660300002)(71200400001)(45080400002)(186003)(53546011)(31696002)(2616005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TStUNk9mMVVoNDJ2V09wdFRnMFRSUXkzQ1VldXowLytzNmhxdEc1UExQRVZz?=
 =?utf-8?B?Y2lYVC9WZTlGWko5TTBVdzlsUmljK1pVd1VSRzZyTUp1RVV5cGN5VFhSS1Nw?=
 =?utf-8?B?Y2xQQ0w1WUROV2haZ081RmhSb1h1SUxaemVjZloyZXIvQmdYelIyOHpxSFd4?=
 =?utf-8?B?aFVBeDFRN3FCNll0Rk5SazFqM0o2WkZQT1htaFZIWDFqN2lCdUhaZ1VOSytm?=
 =?utf-8?B?NkNyRU5CWHRjMXdPOE50QSthcHlUakN5K2JBWXU3eWs1RFA1aXcvN0xvU0h4?=
 =?utf-8?B?d0dxTHhaT25PYUF4KzJuNHRTWjBWL0pHZ1BUbUI1Z2dmNi9QTVl6ZWpwOGc5?=
 =?utf-8?B?aXVUR3EzSVY1MGJrbnVDU29GRmtZbU9CQldza0xoK0dHQThENDlvcnQ2L3Nu?=
 =?utf-8?B?Yi9WNDI2dnoxZ0ZIQ3dxVzk0dXRWditUcDhsbjZYTFRGSWhzZ1dlK1c3UWU1?=
 =?utf-8?B?UmZ2WVJ6VXlUYTNscmxDNVdFOFR5bXNwaitIRG90dUN0eFhxY25EMUs3WnNs?=
 =?utf-8?B?Y2lramt0dkNmRW9TQ3U4ajdrUFo5YXRjWXNYQVZhcERNTG9oSFdpR3VjWkRI?=
 =?utf-8?B?a2VyOUhkSEE2alB4WmtMMUVJNFNhU2J6SEFRWjNXeDBtYlFUTWdVSnhoTERG?=
 =?utf-8?B?MFhtUXU3QzVYeDN6Qmp4Y1lXdHNTelVQWSttZTVvSGk5R2JXM3JHV1F3NFV6?=
 =?utf-8?B?VjJVeTFWQklBZEhVT0VTMURhUDRQVHd2RVlOTkJLWUtobzMyVGo2bGppTzFJ?=
 =?utf-8?B?a0ZvcFhOZ2NjUng2UWFBSUdrQ2hjK0dGak1jci9DTXE0cEpsNUc3SDZDNWNI?=
 =?utf-8?B?dTk2MkRuSGlkMjlzeDdvem96RW5tdFgwcS9XeXcvdDRGK3hBR1I5VnRXS2g3?=
 =?utf-8?B?ZHN2TW85NmhaV0R5TDQ3Ri9kbDJma1Qra0M3YTU3TzNia2xjWlRCdllOZ3Zh?=
 =?utf-8?B?R0RCaDVFZ1VQaFl6b1Fac3pVdkoyOFdRQVMvMm9paHBaTGRWancvSGxZbUNN?=
 =?utf-8?B?QkRRVGJheUtvNlUyWkVGZUJsM0t3ajFaalF1WmJyTmxMS2VQQW1Pays0dTBj?=
 =?utf-8?B?VFBqcCt3NTJ2MG1xUkZIeGpEYVFKOFBYbkZ1OE9LRG1PcklJTHp3bS9KM0xO?=
 =?utf-8?B?ZEpBRXArN2NwTi8zVFo0dnlNUG5oeTQ0MUFMdzJiWU0yMUc4Zm9IUzc3M3k1?=
 =?utf-8?B?dzEwdGxCWnlTVDMwZ2V3ZW5rclh3NUttSktQaENRTmxkd3RabVRnSjJJelVS?=
 =?utf-8?B?b2I4SnhNbEVyUWJuR0dQdXdLVUVOZno0aGJWTThPQ0o5V3daVXRyMVJEV2Jw?=
 =?utf-8?B?MDJaZCt1cjF5SkdlQW4yUEMzbWxTbjVGeW5SejROaVJIVFNxTnd0MDRGbGtV?=
 =?utf-8?B?aUdTT0tLWTVnM3JRSTd1NmJkUXV1MVRXRFV0aTl1M3phcW16NUlMRCtadU9V?=
 =?utf-8?B?NURBSUZVU3ZDbTNUNllLQjNjOE1MWWY5YzVJZldjemJQaGtpYi9FcE9jaGlx?=
 =?utf-8?B?WGJrN0FVUHpTZ0o3a3laYks5dHlPMUxUZzJxdHZNVkUvOWtNOTMyTEVaMHM1?=
 =?utf-8?B?TnVWU0hWdGZxekVaQWphOE50WTVkT1pYRndKbk1SZ0tZVDhYMmpqOS9tOVJT?=
 =?utf-8?B?WThTSmN0NHdFaFQzK2hlcEpFMENmV0VzQmtZNkpFTjdyWGROdjFiWGtPM29K?=
 =?utf-8?B?YmRtQVUzYXppSUVqY3dRcUZ3UW9kL1k3SkJ4aWY1RVVYalNkOE9IOXpQNWVj?=
 =?utf-8?B?Z2ZoMzBCV09DMi9xUnllZDlSWUcxUExaUlkxSzAzT0UxUTNrQXhON0o0dEtu?=
 =?utf-8?B?ZWp1Zks2eElLQ3g3TnFlV2hVajdPWTNXWTloUFJZN0N4ZnM4eGlqVlNxeFM3?=
 =?utf-8?B?WVhLbDJzYTQ0WEp5OXhpQTZGWERnWGlDSWVHNjQvbFM0bVU5WEVwWnpYRExD?=
 =?utf-8?B?SzM2SCtPZ0NDSDI2anc1SGFTK0xFaUl6SFFUcFpOc21POGhlTDJGcS9jU3U3?=
 =?utf-8?B?ZndURVhXMTVSc2FhUnBQc3lVdExDbXZ0R1hwVGZsaHRIbG9jWkRiOXBrdlcz?=
 =?utf-8?B?aFo5T09URzFrTThDVGo0ZWhhOUEyQjc2UGV3OWhnQmhZNTBDMUI5bUhTWHox?=
 =?utf-8?B?cnBTUlR0YWdPc3krYVhYUEh6UGtONFpxMUJWa3ZBd2NVQ1ZjY0pBdkZLZEQ1?=
 =?utf-8?B?Rzg4VXg2ODZIa1g4WmlGS0lKcW9zaG00ZEJxRVpEQlFlcERENkxrTmVOdkFa?=
 =?utf-8?B?ODl6VTlOSWZIa1d1aVM0akV0Ukdkei9hL3VvLy9ubVExNG1ZUDFBZUJnZlVB?=
 =?utf-8?B?VmlKcmE4Nm9rMTJCbUszNi80SVpqSTI0OGhEbjRvaFNVS3NRS2hWa2FPVTQr?=
 =?utf-8?Q?BfP00XLkdL0jekTc=3D?=
Content-ID: <0A7B6686B1E4B84E87337DEE845DFAAB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b1ae13-8362-483b-69a0-08da1c799e7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 11:43:10.1008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sP/ggtejNFUS17HkNDLxQlu3nwI2WJMR1zN7tEeBiOvTbZVb3RbbRTwnNlpYw19Y+DOiMvjlAmdNNCmoj5R0Ig+IFZgbo9Xmi33BdqzqjxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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

On 4/12/22 2:33 PM, Peter Korsgaard wrote:
>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
> 
> Hi,
> 
>>> Hello Peter, Fabrice,
>   >>
>   >> While your patch solves the isc/boolean.h problem, now I get several
>   >> other problems when building an arm926 platform with this package :
>   >> (sam9x60ek)
>   >>
>   >> Could you help please? 2022.01.1 is broken for me atm.
> 
>   > You should apply:
>   > https://git.buildroot.net/buildroot/commit/?id=789a08dac5808401629d6fc586b7377f54ebb316
> 
> That is already in 202.02.1:
> 
> https://git.buildroot.net/buildroot/commit/?h=2022.02.x&id=0397064a9a147903e9e0c16b2506319ea4a246fb
> 
>> as well as
>   > https://patchwork.ozlabs.org/project/buildroot/patch/DU0P251MB07797CAAE80C985DC8976335E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM/
> 
> Is that an ack? ;)

I am testing that patch to see if it improves anything, but as you said 
Peter, the commit above is already in my tree.
> 
>   > Having said that, I fear that dhcp will have to be removed soon due to
>   > security concerns:
>   > https://gitlab.isc.org/isc-projects/dhcp/-/issues/233
> 
> Yeah. Eugen, is there any specific reason why you use the dhcp package
> over the other DHCP clients we provide?

Historical reasons, and the fact that people have working configurations 
using this package... I was unaware that it was due to be removed.
We will try to switch to a different package in the future. Thanks for 
letting me know.
However, if the package is still in this buildroot release, it has to 
work right ?
> 
> --
> Bye, Peter Korsgaard
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
