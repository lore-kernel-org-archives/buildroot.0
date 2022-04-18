Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95427C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 20:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 363D681A3E;
	Mon, 18 Apr 2022 20:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZpMMFuYEIVAe; Mon, 18 Apr 2022 20:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD06A81970;
	Mon, 18 Apr 2022 20:19:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A5A61BF28C
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 20:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 366E26125B
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 20:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="rlkFr+oQ";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="LrD0/o/G"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TE2onIRdXUny for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 20:19:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D48460DDF
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 20:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650313171; x=1681849171;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JmyfjmQWmyriwlBhumd4TPWMDmYuZGh5qLtGKFBnn3A=;
 b=rlkFr+oQKieYY5v/hE7T5o59s+5XVyr4ixP71HIoRLA+QYCb5kXALlBE
 eQHN8w8pEtxZF1SxZ6/IZT10aeX90ZB4VnGMekt7nHSI6I9eaffEPx4/j
 fG40rWmOFKl4pRVmyXhdrNKCmT8lJd2uLg6HntxS/nhUkgVKYXUw2QXrn
 o/pomTLstI8ZhrcWHBhaOkT+s1BrbqO9KXP2IMYVqxMWNjnH/ioCFADqp
 hcmOHYp6ggshDTF7aj73vjT84nE4aQ8H9fVrqIAyrLZeODeHnMY/88FS4
 5JnZyAPQkswcRO5EpHe1H7oFPCDHw6uhmS5eM4QU/E31LSsbxMpnTjmuk w==;
X-IronPort-AV: E=Sophos;i="5.90,270,1643698800"; d="scan'208";a="92708597"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Apr 2022 13:19:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Apr 2022 13:19:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 18 Apr 2022 13:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcHYV5+fw11I6cE6P1d309E4fyuOCyAosQ4lSea9Bhkr6hTxeC22LVN2eUaLywCTlDOndHHu0o5qsmAhbL1jNxcpnlH889+R/yEk0iSm3mM6L+FiZKSFt6+x+09hXV+VnyW3R3f+oyg5rYN4PZcGwjqmgge+rIle4rZCm87lrxho1WLv6TZFrjF//lhMLHXhfavoJNDprIEQjFzfSU5PIsew6RBUhQb22dyntdKtIDDpCi1bmTOiY40AhWOgYw18UaACaqSRI7Uc+L4tyCw7bTY5vgGqB7ZbpQktsRQdUuGZjtLFiac7ap81z7Trh8/BnH7i7w3PVajsyb4Ojspazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmyfjmQWmyriwlBhumd4TPWMDmYuZGh5qLtGKFBnn3A=;
 b=kAstPCBEohHPX108zQg+y+gN9BhBcoE5zEWavlMacVr4fxINABmpfAiaxoRASvlxuPtNTFc5C/IVN+E5Jif4gtEZk5CfsktCYvGFPA5HKrGkiJZFycQEQ1S3iWkB2o0aqQpNuMMzf4+v4+rhKiAXMjs40Swp/PrMWR289apzgZIJ5W3bJJTGigiLNkns4ZmsueXSDk9ogQUU0QMa0i1laxnoxWZwrXtSEE+Ow67WcUtMPWcue5qHd18m9zxXaN2yXXIuvjAGHxLv8ePYfYu7cMEGQWAv01xu8hYNTCCiSi4iNO5rYY/KmLRQQi6EFLTjkE+vhBHF0sgHTXf2eputQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmyfjmQWmyriwlBhumd4TPWMDmYuZGh5qLtGKFBnn3A=;
 b=LrD0/o/GqQ8SEv3BKBGsRc0MEXKEp5L0jAUxHMqQjvxrPm47OHPEwBiYqlUxUmoXSzIihQp/lWAMFn7UAcfl2TtT170Q1RDDivHGF2DOPiWKsUyjDc+4g/tVN7mk85KHn676drUJ3Hv+9ptuWg7yklBnXkp/g2jaGqhkccvOb7A=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by SN6PR11MB2781.namprd11.prod.outlook.com (2603:10b6:805:62::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 20:19:14 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::39cb:eae2:1dbc:a5f2%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 20:19:13 +0000
To: <peter@korsgaard.com>, <Jason@zx2c4.com>
Thread-Topic: [PATCH] package/urandom-scripts: do not seed if initial seed
 doesn't exist
Thread-Index: AQHYUYWUXoPhbrra30Oxsp5sg12jOqzyjhoZgAOR/oA=
Date: Mon, 18 Apr 2022 20:19:13 +0000
Message-ID: <0f4e63a3-6b82-aaf0-47af-54102e91ccfb@microchip.com>
References: <87sfqd8eo9.fsf@dell.be.48ers.dk>
 <20220416113138.72159-1-Jason@zx2c4.com> <87bkx187ig.fsf@dell.be.48ers.dk>
In-Reply-To: <87bkx187ig.fsf@dell.be.48ers.dk>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51d1c5d1-f8cc-48a0-0db5-08da2178b4d0
x-ms-traffictypediagnostic: SN6PR11MB2781:EE_
x-microsoft-antispam-prvs: <SN6PR11MB27818364CC7617DE98DBEEF4E8F39@SN6PR11MB2781.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vcNFvAnNwrsm0oYeJRUje5OkhXpe7mM/16OGyOG72vwYPptHwj1DbvO0RJ7Vx5TU7ncM+0POehER9oSxrtNFToSg+rMnm6/Al2kYHbqTrt2wJFEBV2u17y1Y2h2wjgCQOfDjjrO1jPhvTTKrQUj7ZltRefQuMtdM3OBkNoM6jJZ/8IiU01WlvCmUzW9hqq+mgWa+z1pebeK78BCjWovMhnGTG8YBJ2CGLaBOTWFmv0b0JySVGEYLsUGDyUZlHPQU05JtNCK19kyJ/ov2xl8yDOAPSr3+cKK84Q9dwrHYGoIoFdohQozCwqh6j+LUtlQ24HE3IQtUBz90vWK9tvIO5eTgohUbwdYmAfnJc3H/jqmvP9a6rL9n1U3FGRS+5Lfchy/RQLZMaRdkSH4PbF5yGSzFsATFzRDKcEKS6IbMzAy5C7BZsyo9FyGr8bD+8g3huC4EJwEvCW60e5om2waBCVsmdx0Ub7jkbN6I0BuBNgOl79zOmx2DoC6UxBwodJndLN4QOzQwICFa0xB3PoJZxdCDBKtJZ5gbpBUmvGY6LrLaXouEW2ra50CSnnJ7Upwax3WP7z+acLu0fnAKsdQygsmpZ+prjw8kHretun8G00ZO2cfhDVRbT8u0/g91gVX74kJZlT4Ug5Gxy/s/RGNCOT7aXAH1cZAPFO8N9LP70ARbVUzOdRKB74P7dkWNgxrq2d22hM7jbefdCnhZkiSAqVJ6dBkX3YgyvlkNmYHWLYK3M7GqhL05UAzv7/AAFeW4K6RwoSRuSWspvf7NqAK6Fw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5384.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(71200400001)(8936002)(31696002)(6506007)(26005)(36756003)(83380400001)(4326008)(8676002)(66476007)(66556008)(66946007)(4744005)(64756008)(91956017)(76116006)(31686004)(66446008)(2906002)(110136005)(6512007)(2616005)(38070700005)(38100700002)(186003)(122000001)(54906003)(5660300002)(53546011)(6486002)(316002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjZ0V1VRd2RCYndPcjVTNXdCSVNzRm1xTkNleDRqNWlGcmJXS2hwakt6K0hP?=
 =?utf-8?B?cHlrdVhpdmJYYmJpYS9WaW43MHdaWUszWjQvS1pIQWhZRmdrdFYxRDFNOVlx?=
 =?utf-8?B?Z0JweUxiWWMwV05tRlhKNG1XSDBoa1JrZWdMb2pGcVRYWk9KemU4Zm1yRGMy?=
 =?utf-8?B?YmhlN1dBL3QybXJkR0JDdTRjTzlGbDBKZHc4T3ExWWtiZVVuSUJYRU5QVmNY?=
 =?utf-8?B?bmFFbXVDd3RQYksxWkpaMmdwcHFSZ2ZIamJiOHVQUzFadXdIVUp1TXBxTTVL?=
 =?utf-8?B?dnJtNEk4NkVTbytvMmZTVEdyOUo3aTZNRHpTa0IvRnlVY3FUMDNjdjZ3M0pF?=
 =?utf-8?B?TW82anJxOEpoMjNQR1U1Zmk4bDVaU3RpOXRVVWlvRlN5dnc2c1ZXZGtXZWMv?=
 =?utf-8?B?YlJNaTk1QVNyT0lRVXhuTkpFZ3Vsa0NjWmd5Snc0UUZGQi8xeHlLbkNlOXIz?=
 =?utf-8?B?RXkzMnJIRngxVEJUMVdGS2Qrb0ZMbkZUWkh2RTM1ZU5HcWhyNGk2Qnd5dVlw?=
 =?utf-8?B?OFFucWtwMHI3bXRQbG0vcHFERlJHVHIxcm9nTFZHRFJDbGFhYVpVZm40ZFNY?=
 =?utf-8?B?cDFwZzM5OWpVSlFMczUrWTd4eHY4OXJ1a1lsNnJOdmhXZ0lzdFE4UHh6SzJN?=
 =?utf-8?B?OURITUV4S0lZQm5heTZFdStWYkFiSmZYKy9TU1NBL2Frdk1xcGwxdk5VaHBy?=
 =?utf-8?B?UHNTeTRSdTNtV1AzOEFKc3hwVWFlQzIvNWlqQVdmZnV6NW8weVd0UXdUclF3?=
 =?utf-8?B?bFBRcU9SYW1ubVV1cGFvTnhxM2RJem1ncFpWZlNDR1pyTURkVS92M2lNYlo3?=
 =?utf-8?B?VDhQR3hYS295cnlXMVFkZkhiQzlQQVVqOVROMDBvM09jS25qSEYvQVJnWjBR?=
 =?utf-8?B?L3pCSzJ1eHA0cFdRanBWSGFYb0lEcWJQaXg0ZDFjZE11dkM5OExCV0h5Qnh4?=
 =?utf-8?B?RlNjWG1TUDRDaHBoM0poNnkyZWpWWVJ3YW0yQzZyTGVRUGZTNjNTUHFsMkVl?=
 =?utf-8?B?N09Sd0IvbGdzdGZvRDU3ZkNxUk5uOW1sQ0c0VGs5TU1HRkNZVHZ3NjlJRXNP?=
 =?utf-8?B?SjBJUnFZd3hqRHR6Qkh1S0NVRGxZSks4eEFaSkE0QWU1T0gxUjNmanpOZTFC?=
 =?utf-8?B?cS9qQUtPUzJkMi80T3RVRXQ0U1NyVEovcEZYREtjd1d2aHFQRUwxSDRseC9V?=
 =?utf-8?B?RUs4MVhuL3ZQdEVpTHkrRTMvQXk3NDRFUk1PaCtYTzlRMk1FNnpRRUthUVIw?=
 =?utf-8?B?bVdlV3ZBeWlGbno5ejNZNDI1ZWlNLzlVM3RCYUdZL2haQnBsc0krenMybEQ5?=
 =?utf-8?B?ZVZtZlNpVFVNcXY2RTVZeC9jNmNDQkZIdXhsQjV1TlNUMlFadGxFa2dJcXAy?=
 =?utf-8?B?R1lFUXpwRytNMWF1bTZSYmZuNVR2UGdGbS9mQllyLytFY1NROU00N280Qy8w?=
 =?utf-8?B?RkZBOXNmMjg5RDhhY0x5MUJhSGRHVDBIcDlJNDMvRmdhS0lQZU1DOUJiWEFv?=
 =?utf-8?B?MzBWVG9qaWZwamN0bCthdEFwaS9vWjdtS2lEclJjMUlyWk9SVjRTczNEMjhv?=
 =?utf-8?B?SFpVamptVEJmQk1FV20wdjI2dFJBMGMxdzYwaHhUYlBlZEpRMWd0aW1ia1Z1?=
 =?utf-8?B?eVVla1JhcjZNUXBGRGpjdDRhaTBzQ1plQXY5Z0twb3pDWjZoRWY5OEk4Z0NZ?=
 =?utf-8?B?VkFqeDNlTHJIZURsa1EzcGdxOW10Q3FMaElLTWt1dzRpN1NJNmFrV1daV01q?=
 =?utf-8?B?MGpjaG5jb2JkV1JOekZPSjhLNDdab2x4VEozWTZRQjIvTmM4WFAySHo2enBt?=
 =?utf-8?B?V0p3c1dxYzhwc2VGNjVvOVZWc1duUHRUTjBlVStWTVZJdmdnQXBjcnZKSzQy?=
 =?utf-8?B?R3dYUTU5c3ovRkM3dGxkZVlJZFROYjZ4UkE4ZTIrRC82NmJTczB3Skx0Z3d1?=
 =?utf-8?B?eVBVclZNL0JLbEpOMEJGTWs5K2NEMkJiRmpZd2NTQ25Ca3VLM0NFRFA3em5v?=
 =?utf-8?B?Zk9CMWFBTHdPQlZtOUtiZGJvL1dkRmlVQ2RDaGpLcktoc0I4ZitqdGRjY25w?=
 =?utf-8?B?a3RreW1VdlVWMzMwbEhEZGZBNWJkVSt0MUtUSEhIQ09oUzNTUWlWMGg1RThI?=
 =?utf-8?B?ZEZtYnl1Y2VCWEg4Q1FmOWFrODZ2UWY5ZnBvdEo1djJydGsxbGNEd0RBSFQ0?=
 =?utf-8?B?M08xV2lrWlZtcTJXSjcxSzFyOHpSTno5SjBzbllZZmY5TE83azVLUk1Ib3lM?=
 =?utf-8?B?TnV5a2VXcU5YWDlDU0l0anFGUkJRaXY4M2UyVW94Kzh0WlVqdld6dGNJZk1s?=
 =?utf-8?B?Tnd0d2V1OWR5SmdRbTkzNWRmQW1ZdlN6bi9hblRKcithOURWN0FTaHVSVXhZ?=
 =?utf-8?Q?0W7/hz136CEHAAaI=3D?=
Content-ID: <F785F827D0DF5045948406CEE4BE2085@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d1c5d1-f8cc-48a0-0db5-08da2178b4d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 20:19:13.8276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c/knlTY6Mx66PcWJgGnBCNmVTAjI3Yq7za21hurPnsTOHzaMiLH8WtjL05G5isfgDNhPNPzs8uw4Ox/RCjktIuKBIjb80s/Xys76EWiZu8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2781
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

On 4/16/22 4:47 PM, Peter Korsgaard wrote:

>>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:
> 
>   > By returning a failure in the event that the initial seed doesn't exist,
>   > we'd then skip creating a new seed, which means we'd never in fact have
>   > an initial seed, and this script is therefore useless. Fix this by
>   > checking for the existence of the seed file first, and just returning 0
>   > if it's not there.
> 
>   > Reported-by: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
>   > Reported-by: Eugen Hristev <Eugen.Hristev@microchip.com>
>   > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> Committed, thanks.
> 
> --
> Bye, Peter Korsgaard
> 


Hi Jason,

I cherry-picked this patch to my 2022.02.1 tree, and rebuilt my images.
I still see this message at boot time :

"Initializing random number generator: FAIL"

Any ideas about what I could try ?

Thanks,
Eugen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
