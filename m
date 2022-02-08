Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA05C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 11:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDA3580DAB;
	Tue,  8 Feb 2022 11:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XfXB-R4VZqmd; Tue,  8 Feb 2022 11:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A99A80C44;
	Tue,  8 Feb 2022 11:13:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39F381BF5F6
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 11:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 277A640897
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 11:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfQi0smXh4_u for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 11:13:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::615])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 347D540882
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 11:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqBClBJ4FpoHF23XtrsLMWuFYA0mKPRgZTQzydsZoM9kXG5zI/uTXxJuirDjuk7Zdt62/42SzTfZrIYUe3g1mXSuUbHzKWM/datSADHxOjvCAcciIiDJxlgxLwW3p7UUnXjNcbA9cDihOuYSJYUo0cQRNV0PG7Yrttqvkgx/x0Nh6TK8g/a22EYp2BcbUVLqGFvyKO34J7fxvPZxbNRjhYjnfW7FI7ib+Gk64ex32aXqryABBwgipo45/EOWz+2HGxWypgwTkRXLwAgismL9M2HlkHsrVTuRXsM/mJ6WYNIr1zp5POwyrpIMJExLKlafBdySoFoAJUyllxHOUBmoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3tPfBXlOX4LRxMIgQmjNd7JeNX4G7zXb8E47Dhkjd8=;
 b=fkiJX7VC/H0HlpGG5Rr8SWS/dSpKVyIkyKhVcPwM1F7ZV+UNP3qFbRZZlgxQhkwKUikUhPdBjD2WR9SIpSLGR4fKSjOCTQ6KTWScR7hRlWWQitIyLygI512vlQBhTOE2zxOWZgOGP9qCGp0MyV6DJGj1zkCR2Rh80C1A9VvKcDJZ7M8n+l8s2DOkov+j9WiYfa2IQx7L45v4oXRmyOW9VMXH7dpP6Wx+l4V8uqooILzF18poQT/zs10ErMiq4sPwf5vFWdKhC99n4x/3rhbYbbxwXfd4qAddW5JYVC1vui5EDEIqwmhJH+VbvI1sLrHvWAw5JR75tpheICmEK8UPxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3tPfBXlOX4LRxMIgQmjNd7JeNX4G7zXb8E47Dhkjd8=;
 b=Oh/4E+nLRCq6OnMXidWS8uExVsS5StHUsoLUXFo5ixug5LyHsyS+5Ek1au1Ad4PD6bGaiFhXRsE0UGwvYVFylYrwkwkTeviCc0YLJjs6mqZJqci0dBNi1PVm09gNMWH1t3t+uQSZUWCIIctvww6J6JlMRIc0RqvIx7Vzh23WOK8=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by CO6PR02MB7780.namprd02.prod.outlook.com (2603:10b6:303:ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 8 Feb
 2022 11:13:41 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 11:13:41 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Thread-Topic: Xilinx mainline ATF v2.6
Thread-Index: Adgc3Oy3XAK4QW8zQv2B3w/LH9LbXw==
Date: Tue, 8 Feb 2022 11:13:41 +0000
Message-ID: <SJ0PR02MB77580A9E2B0D263EE239D46ED72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62afa18b-65d9-4e82-0d5c-08d9eaf41021
x-ms-traffictypediagnostic: CO6PR02MB7780:EE_
x-microsoft-antispam-prvs: <CO6PR02MB7780D40C9655B822CCF8564CD72D9@CO6PR02MB7780.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GgWUPM/CpLvaDGfcOssht2Cbx9cJLG8+mz8JWfnSrWd9oCbIM/jpoGU+7eJmLGtAunsNTiZm+OhJ3kOvn1lz1KosJSfJVmMVYiWXtCHppDVO4yYh727ZGH9/A9GW5NgDkQphuB4Iy8HQKMnhSENHOlYf+n7j3WJTwe6sto4maBvDuQv051McVBfgw4ZNhTxY43Gk1md2oWT1GEkzz31t8nsPWNf1eXQEGmUJ1T7zlSNLAAHxOdjPOekMqkZUdI0Qv/9aU8KXa1PvRzplG7+Z/UrNxkicJKW+ZdZwxniOB5zbYlFA/Jypi5sESDvEp2C0j9j4gtGTuCe6N5pqvyQabBq1Q521wlGUfn5d/ouKeYOadIMQm+7GDXZymQRdTU6ZNPM4H132VS66JYa+GkFafvQ715a2UwKfgP5OOxrj2Pufu8RYeQIjn3+voFbW5tHmZH0Kp/XqtMxeX7qYiW14gicInNfiQ823aGLnakJsVCk6wktCpUbovRDBezuVs5tH9iufnYmcVbPJlKNqKujn5YLPne80jGPx0oJ8GMTOBc+04mUq9lkAB9kV2X3PN8MNF3XCDMkDfMszM5kDk2zENPe2ZCGPjCCGKeofVf2O2zVQcegD5Xqb3ByC3K6B/hQ+knVSEeihzfvcZB7VTEHF1yvQdG6ssUD6tpTH6D/DMMAWp9KNTRjVIY/gEh6SvtI+lx7xdPkexK8uXSHqadFv8J7i2qIjaC+GqPeK873laI+N+P7CaR1TGmBl+ikIR0mbida1ZpYCjkxj9btCsh5RKhFSYbbqYi6RWIolKK5bruA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(38070700005)(86362001)(33656002)(38100700002)(122000001)(52536014)(71200400001)(8936002)(5660300002)(9686003)(6506007)(7696005)(53546011)(54906003)(316002)(966005)(6916009)(4326008)(64756008)(66446008)(66476007)(66556008)(8676002)(66946007)(76116006)(508600001)(83380400001)(186003)(26005)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVVMSWVDdUpSWGZmMXdHNzJ5Rng3eFB1T3ZBWUpZT3h4UnF5SUlBeUVrQnVZ?=
 =?utf-8?B?QTVIbEZQSnhmZ0Uram4rcjNhR0Z3MEQ0c0FMME1OTC9iL3d4Y1l0NEFvK1I0?=
 =?utf-8?B?dFVDc3dEbHp4cklmNkF6bnpzcm5xUHdLb0VRNk1LeElnWWNzK2VXbllGWEg5?=
 =?utf-8?B?N3phRWU2YmIwZjFpc0k5WmpObEU2N0FXL2ZLNm5OT0JrVjRYemx4dmFwcFU3?=
 =?utf-8?B?Rnd2OVQ2QUR5cVRlSE5FVko0Ri9mWjVlVVY3Y3QvWkVQSlAxM09PYkZZZThE?=
 =?utf-8?B?WDAwNVp4RHUyay80YXFMd0hGUzhjTWVMRFFaZWo0NjY3YzAxcmdnV3d5b1Zi?=
 =?utf-8?B?TWgrZElDZkRrMW1KUFJlYTVaeU5vZ3RqOHJkNXAvQTEzVXhJTXJQSUZkdXBZ?=
 =?utf-8?B?aXJtODZzK0RvY0NUaWUrWExEOUVmOU8rUlBjMndBMTZYRW51WStwT3NMbDBM?=
 =?utf-8?B?cC9oaHdzRGhxS2NZbHMwTWJQa0FiM0VtWENnVkVwVy9JeDFVd2Y0ZWZwK3lV?=
 =?utf-8?B?Q3hyY2d0Q0YxSm9MUWRhQnE2bVlSSzVCK2laRHZqdDZ0bnNaTzFEcmcrb3Ft?=
 =?utf-8?B?Ymh4Rm53K2RUQUJwZzR0Zzh5b1IxbHh6azVkWTZLWjRIMEEvaDJKNnNQVkF5?=
 =?utf-8?B?Q2JvU2t1cytuYWt5OFBJeUpMeEpzbk11dmpSdVpLdXplSkk3dEtPMzYwR1lz?=
 =?utf-8?B?UDh5N3hDbVZlVmoyQ2YxSWUwNnpQck8vMTJJcU16bCs4TFJreXkrd0g2eG5u?=
 =?utf-8?B?TzZLbVpLZ0RYQmlEc3pTTUlOVFFXSWZiWXZHWS9NdmlFSE12VkRYcG5SWndm?=
 =?utf-8?B?aG1GUjRKdVdiSFpTU29KNHlTeDMxdnRURWYrNkJpOHZUWEdTRUkwdllHOEZs?=
 =?utf-8?B?RjdGZEZYcWp0UDMvblZodnFBZ2N3VUFwZ0pGNkRtemR1UG95b0lSUlVHb0c3?=
 =?utf-8?B?b2xEMkxrK0hPU1AxNEZ0UCtWR0JxaWdzQURuaVByTXUrWG96RkZkMUVoL3hp?=
 =?utf-8?B?L2l3ajk0L05rVzFNaWUzb2o3TVlidGVwN2oyNS9ILzlLVkRZMzRHMXQycURM?=
 =?utf-8?B?TXpxN2dVNmtkM2JOSFdnY0JnVStlaHFaY29KVzlXT3cxM0poekZVZ1VYVTZP?=
 =?utf-8?B?ZEQ3czVRY3U4TlNLQ2h5WnNPZU5xb3lMckJSNUF1TDlOam0rTTN2Ujl2VVMv?=
 =?utf-8?B?cGtLMUcyMmlGTU5veHpnWDBSWWJGeTBJNHNhWmxvVW9hSWYyY3NqbkhjdGkz?=
 =?utf-8?B?S3pMMkJha1phaGRzc29ZV0t2YUpTVGJCL3VFM3Q4aWJOeGlyejlyS3NGWHVQ?=
 =?utf-8?B?T011MEZGQlpqQnByaHhuc29acUsyd293Vk5KbCtEeldEMWhoaSt0RVR3TVZr?=
 =?utf-8?B?K3FiQk9GZ2ZTNE54Q21HZHQvd1JGclVEdldkOEVOK2NZRUNjS1hUeUNlYzhy?=
 =?utf-8?B?QituekhoU3d5Z0I4Tmx4a2FTRGpsWDZTS2p3TW1yUStkcEFsQ1VCMjlnMDF3?=
 =?utf-8?B?S2dpOWNkd3QwRThqWnlKbDc1LzEzOHYrTFNkRHNQVUw3VjhMTHVtbFlvMWNN?=
 =?utf-8?B?NEUvTGxoTUFEeGtFK2lmVG04MVk2R2RYNzY5aHIycUVOaUFmdDk2QW04THhN?=
 =?utf-8?B?aERacEtrbWY1eEIwU3VNUmY0TUhiTzdYd0ZibCtNZnRxUEpzaFAvd2diM3Uz?=
 =?utf-8?B?YkRMKzExeGlEUlhvbGM3dGNBTmdlT2xEeWJReHFRWUF3cW00UXF5a29PZVBO?=
 =?utf-8?B?VkRWYUFOcEZ3QkNkS3FLNFNFLzh5TzVuNm14OVF0YmZUdHFMQ3FaNzlCbTYz?=
 =?utf-8?B?SmVQT3hBa0VFT2hWQTJyMVZ2SW5iakNTNGRETk1mUE9KanFYdy8vUHk0NGZ1?=
 =?utf-8?B?SkwwdGx2T2lDZXk5VDdPWUJPTTFpZWRUMTNpcHcxd0p3NkxYVTJTcmM3N0lO?=
 =?utf-8?B?OTNTNVFKYlJabEQ4dlJwR3plVVllVHorT3BkVjhvYWhoS0RQMVF1czcvaTFn?=
 =?utf-8?B?MjZjV2hOaVoyaDNQL25MTG8za0M5MEdOdUNLNnJ6WlFBRkROSDNwMTVsSXlw?=
 =?utf-8?B?d0RoVyszY2JzcW9wZk10NjF4Y2MrUzc5STlwZWNRTzBUR0FQU1JJN2dkQ3o0?=
 =?utf-8?B?VU9JVmxXYTlFcmU2dUREYkNHZjBHVEVsZVRTMHVvM2tMVWNGTGNZU2orQkIy?=
 =?utf-8?Q?fD4BtCIIVw2wtyzoAqNQCWo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62afa18b-65d9-4e82-0d5c-08d9eaf41021
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 11:13:41.2219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dGfWvD7N2nbzzQ9GSdnZBHZO3CKwIuzfBeaERJhC47M+nOxWuW2V0tjmz5jAVlVKX6L0B6ma7yXlIDM5gc5UxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7780
Subject: Re: [Buildroot] Xilinx mainline ATF v2.6
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> today morning I had couple of hours and I've managed to fix the build failure and sent the patch upstream:
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/13800

> Can you please give a try to that patch?

> Here is a fast link to download exactly that one:
> https://review.trustedfirmware.org/changes/TF-A%2Ftrusted-firmware-a~13800/revisions/1/patch?download

> But its name is awful. So please:
> # git clone https://github.com/giuliobenetti/trusted-firmware-a.git
> # git checkout bl31-zynqmp-linker-failure # git format-patch -s -M -o . -1

I am trying to test your patch now, but when I follow your instructions, I get the following error upon checkout:

error: pathsec 'bl31-zynqmp-linker-failure' did not match any file(s) known to git.

Any ideas how I can obtain the proper patch for testing?

On 04/02/22 14:32, Neal Frager wrote:
> Hi Giulio,
>
> If you simply modify the defconfig from my patch to change BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.4" to BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.6" and rebuild, you will see the build error when trying to build the mainline ATF v2.6.  If you can fix it on your side, that would be great!
>er
> Best regards,
>
> Neal Frager
> Xilinx
>
>

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
