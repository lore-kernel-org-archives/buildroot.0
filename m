Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FA7C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:26:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0FE160F48
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0FE160F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFA8E8305C;
	Tue,  3 Aug 2021 08:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ErxRoeHGFV76; Tue,  3 Aug 2021 08:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E77E383046;
	Tue,  3 Aug 2021 08:26:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9CEE1BF357
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E65F340423
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="0uAGxq0n";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="R98wz11i"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYpZPgcxUy5l for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 08:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D49D940412
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 08:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627979200; x=1659515200;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CTB7yUIaWSpjEy+E1E0nG/+HrTSEPeJMhXJKxLbAqIY=;
 b=0uAGxq0ngBqo7I5oshOUvrJkxpEhxxEhb7HcRJNV4t5zBou3S1JjeTtm
 HClMkcrCj0UNdF7YRPMwAW2mnR7q9FlldOT8pjvP3xDtTLy11I8dW2rTF
 UmtBlvCDIcw7F7qulBNciVNAJB6+3/Jm9WrWuzIP+iz3WFBaUmtBFl+qT
 I9cb04AuDHyaTNMTckfaa7yIi0ATxv3wvbmPXazvy3pHWKdflRYKCf9Aw
 8dPV5XLRAT22b4xZLz5sgsT/utM7XJysQdFnfTPA1ZjlwnPZz7Yv+pFQN
 t4/o/tElVAQ+GpRfKiXDoj1zXh4Xu1a6t7kpiQX1+ffFT+akR38mprRyF g==;
IronPort-SDR: QVUrMtDV+kbj9/ajWVhdU/7DS+fu9Ni3jHDGmsypDAO7UBabMOj2dqp/rZOC/C9NcXZ3/8YItH
 +ln1T/FvSf3uFtFX62tkCTGnCokdKPxRx3EBNKq2y5/XnCQldrz0h7AmTCBY2VwaPY1OZO0bZW
 6nwlXAHXoLL9FO9Z2/ak/QTFY9ACFYXaWbNzIbJIHRikFc3UyqpteBGJrL8qtXAMM2r1iUcJ05
 a2GwPKEB+/87etjzrMtU9VcCn3IQq63XpLeDHbLHYV1rPi/mGCmWhoNSLV0IXBI4RTMNC/X2qY
 IeCup6O4p0HqUuhFV/+yc2Ww
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="130824409"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Aug 2021 01:26:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 01:26:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Tue, 3 Aug 2021 01:26:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agjvmyd6NCH57amr/79CnyYJqMJSyT78FiJO2Epy9Ffi1lGBfk+CBGhDyO9iTDZr+hOyECI414RcZxBYSUpPOisgfXh9rG7qGkm796M2GeE+9uahUtqibb4X3ZfowoNJxIyuS0bL8sPbEFRm8ebwLUSHTNq8S/TJfSUe+XANtcYev2jAf7YJh5KxLTiY6a3sumVSvTLfD5zDmNluzehMugdurw7gqnAuzvjFKQ0wzelJ9526g43aefuZ+bz1hjCjY8FE75JGkR6lGRgtia7GWxn5n+VjQMbSiiZbiX8V/rcOdmOxhzuqPk2Ya7/B+D1fvFDHm1iIsgSDb9swMxfUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTB7yUIaWSpjEy+E1E0nG/+HrTSEPeJMhXJKxLbAqIY=;
 b=ddDvYKG0EkwhQJcW8XJnT+kQ5dPd15XnARamxPnKSN92Zbv6XZ0NLWcW9JU4UX7V56HpQ9DOY4CqctZ5cmwM7wfSgiN5eIFhhMxaqrt3vZ3Ghyb+INqcqeF66/pIY45bJgidgBnPy8bfazAXm6+O9OOGs/wuOsV4XDVk7JLT/RRZ53OFs9qggmpYEYBS2tY6qTE/irUCDT4W5/T3I6e6YQKnaI+u+8aNG8eSiyb6U44bA8yeeToFw+nMjJraCqcbOxYoLHToRySqYaCaWYDutqswQeGTS9ip6PZDN+FRrR1vVWr+0VftHxtC1oIUTWBa4apjHWYHho7oNuJ0n6481g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTB7yUIaWSpjEy+E1E0nG/+HrTSEPeJMhXJKxLbAqIY=;
 b=R98wz11i+4lgcv1e//RxcTUitXMjaZued3jtS09btoZU6xvxLEPaGouPJXdQBO+DSJ8UWieuY6VSCzjOIzpcmpSnQxs+FSwqNH7BQh/4ljhWTVBIWDdeBMDNUY5ovpd7GsCBS3YSvvAzhYxEmnk3Z3FPPjvNgZmAv1CdzFO+Pcg=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN6PR11MB1665.namprd11.prod.outlook.com (2603:10b6:405:f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Tue, 3 Aug
 2021 08:26:33 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6870:66e9:7cd2:ab12]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6870:66e9:7cd2:ab12%9]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 08:26:33 +0000
To: <thomas.petazzoni@bootlin.com>, <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH] boot/at91bootstrap3: updated to released
 4.0.0 final version
Thread-Index: AQHXhS82HF/cjvibTkGNi1Q8ywWljqtcDT4AgACe9ICAABGBAIAEuneA
Date: Tue, 3 Aug 2021 08:26:33 +0000
Message-ID: <549d574f-fafb-42dd-a07d-9a4b40210240@microchip.com>
References: <20210730103908.11270-1-eugen.hristev@microchip.com>
 <20210730234234.31bc6aa0@windsurf> <20210731071129.GH3189549@scaer>
 <20210731101408.7e90b369@windsurf>
In-Reply-To: <20210731101408.7e90b369@windsurf>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 037c5599-2240-41ea-c9d3-08d956586741
x-ms-traffictypediagnostic: BN6PR11MB1665:
x-microsoft-antispam-prvs: <BN6PR11MB16650B0A32F8A777086996BAE8F09@BN6PR11MB1665.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NpvsdjmukBAEnBZpnLAWCQMt6w4vO5ajldvZLZD46RRm6D3cNDar8yJ/piUOndYbm4xuUVYAKNlexQ9fcZQw1eL2lkMeQiMK2w+Yc5AXNBmY+UB2+qBa0k3T4vZPLEg2+BUhcI6r39zOvQ3NkpTqx48FCdeIgFkGhoOL0Ap2O3mvirtxLfQoP7XyTXcWgAABdNlb8LqJCpLKWIXXpWY1MmisciPl4zAlfS08r9lJY/JM/5CEE6a3XsJkzeBDRNacxBf6jue6gEoo2E8ZcPbwoyd+L/2ikzdJQFG6kJkyuZdmE+syuCD9NW/GKKk1BGU/SUzCWTko3QhisIkcUdup8/UiHI5UMFe07oj7JSzXoEBwi6+LTPgFwppnYNTFKaf70+kHfK3HjU/DwEj1gVXnTaLYp+SbbHnxHE7CSf0EjuFT0WauailEJQzPUc4DyG+wBktTNRq8BZV4RiY+/CBKUetcbFEV+XSl6OKN1KefhRLILOpQ5eMA5P6LKu9UPpitvquwRYd7BagGwNc45/T846qC++7SyEZE5HayLDefleLmCJXQeymSi+5pP8qeYmXdbIDhfY0mCLCoSKcuoYOZoAiEwUWTSOyjx9T3XKdVlZN/9kleJxqxZfguxfCxFD3jtgIN8Tiu98M4fE+aI/TGXcEBtOEeOyQsOvMHpnuVrDNoMyBXQTR8UASmSjPfvszsKi+cRZdcCLQnk4O+2iLMM2mVYwiV7HLWBASEA9kgfqJsS2jadEfJCofNRY86hTk/aGh7LzC3rvZfBkFjmgy4rMiPDl4PzbcfDbR+UoAatEBc5YHJVmC0uTpISmSmpInYJXWPxLPcGHd2wsv1u5TgV4kAoE0k9FAX9lF19L/YC3ZG5W9w+7sAMAghDbg6AIO7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5514.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(366004)(136003)(346002)(31686004)(83380400001)(6506007)(6486002)(4744005)(110136005)(6512007)(2616005)(966005)(8676002)(91956017)(76116006)(122000001)(5660300002)(316002)(478600001)(36756003)(4326008)(38100700002)(15650500001)(38070700005)(26005)(66556008)(64756008)(66476007)(86362001)(8936002)(53546011)(71200400001)(66946007)(2906002)(186003)(66446008)(31696002)(43740500002)(15866825006)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXpGS2lrMmdnS3RsSU5Tc2YrRGtOYU1kTnRoV0ZLYU1VMklCMFlpUEtxSUo5?=
 =?utf-8?B?K0lBaUczSmw3a0I3QlZiWE5wcGlMb2lGQUtzT0F5OWcvM1dYZE5SYWN4WXNX?=
 =?utf-8?B?Q3hWRTh2aDRkZzgya29Vd2N1a3NiSUJuelJWZHlSS21FekkyTmRhc3BKaFU1?=
 =?utf-8?B?Mk9TRkNrdUVSSWZ4bDhKa2kvRkgyVE1Md0RaY2hCYUVzT3pnZWI3WEZJbERn?=
 =?utf-8?B?YzZXNjAxUmRzamVYWjRmdGd4TUh2TlByYWI3NGJ0eHVPdGthUU1pM05WRTlj?=
 =?utf-8?B?NDZLaGlKVlN1NCtBSlpiRC91b0RJU2RqT1lmcGRlWGZweG1EbnFqdDR1bHlW?=
 =?utf-8?B?c3VadGVJbVFBRlNYaGJsdFNPNm1ER2hyWS9UVmk4VE9kcC84NEQyQWhOV2J3?=
 =?utf-8?B?MUdDS3dhbmhWTWhadFJyS1ZqeWxUeVdqa0NGRnJZQ2RobzV0V0M1SXdmRE43?=
 =?utf-8?B?R2JLZkNZZU5yUFJEQi9GMkhmYW1WOTlMdldtMXZwTVVXcDJyMzBXNXJ3amtY?=
 =?utf-8?B?L1pWTm1aZGpiVkxTQU52ZmROT25na2p5NnpmMGhMblRORitKZUlWU0xXTVAy?=
 =?utf-8?B?L0wvVDJTUWZ4UytxeHY1Mkt5VmJuSEtqQ0tFQ29ON2oxa252ZTRobTRNVlFQ?=
 =?utf-8?B?a3NUQXZnU0c5WG9iWFdOdUcrYVZSK1FSR3laTEFnZ0JMaDF1VHRBdXZVNHQ3?=
 =?utf-8?B?dlZTS3czdVJZbXlGZEt4RGg2MkMvc1FqQU9DK1drTDZRdmdLTTd0T0JUeEN4?=
 =?utf-8?B?SHF3c3hXNDE3STltcVc1TWJUYXdYYzUyYUJOd1lnZjBCMXBpeE04WllzN3Zt?=
 =?utf-8?B?Z2lRWmJjZ3FIbS9mUjA5S1l2VmFNKzQyT2VHSkxBcWdMSlF5Q0VnQ1NMS2lN?=
 =?utf-8?B?emhCVUN0bllGWk54VmVDMGRFdzhFQWFYaVR0RFB2UGRKWGk2MW1LM2FSV3ZM?=
 =?utf-8?B?VUJQeWZQaEQ4c2RNSksxSUVHVkZaMjNVQ01mbWlTZVZ5UXRUMmk2dmg0Qmdt?=
 =?utf-8?B?TkttTWVFdTFyS2lselNjRUIrblNIeUtDRzVOZ0FlZGtNL3UvdEY5TGRtVjJ0?=
 =?utf-8?B?ZktGMEJmT0FYT0F4RVpxTkhiWC85c1pXYkJJUlpodnVMYUM5VGUyRGlyZkJD?=
 =?utf-8?B?Z0p5NzNpOUEwVVprZW9OeTlIaDIrTDQ0Tm9PQXRJaU5weDEyS2w0aExVZUpn?=
 =?utf-8?B?a0hsWERSeWtRSzhlVCtIUWY2dGNNZUVqODNiSHhQUWlSTE1VYzRpMWNwRUJ0?=
 =?utf-8?B?K0NMRHRyaHRQbklOSGtORitqWFU0anNFTW94K3ZBdW9QOFJpY0Rrdi9TbzUv?=
 =?utf-8?B?NFNoWmVnRGR5REpSTnVrNUF5dFF6aXI0SVQyYklJWnRUbUNzMnJYQU4wR0JL?=
 =?utf-8?B?TVV1UEc2VXFwMVlSeDMrZTR5eldTcUc5MHhyZFcrNkVIWGVLbVhIQzdlTGlp?=
 =?utf-8?B?Z2wrajhIU2FaZUE2WTdUME9kY3grbmFoSkxwMXI1cDRGNm93eDJsT3pVN3ZY?=
 =?utf-8?B?cU1oNUw4K0d1OVN6aGxDRWJiKzRNYWNndTZDK2hqRzVNMlYvcHVkT09RMUh0?=
 =?utf-8?B?R2lYckkzdDFxenNlMEVEYXVSSmJnY2p6cDFEVy9jWXRHSjR0YW9CaEgwS1h6?=
 =?utf-8?B?NVhNeGFyZjV0cFd1bURkMUpUWFNIZTJFbklOeEU4Vzd2bTJtZFZGbkN5N3RD?=
 =?utf-8?B?b3FnRFc1YVJnd2FqeXhPYUdLbVYvOXN4b0grc2VIQmNZV25RUWdNYTIyNnVV?=
 =?utf-8?Q?ciSU/fN8PZScT3wuvY=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <AA0AF290E929B94D956F5FC3F3C73303@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037c5599-2240-41ea-c9d3-08d956586741
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 08:26:33.7309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jIzsWlZSFeV/4MtwmnkgpWbccahNfefyXYmqhehb+wjC7uR9fGA8YPK1GHSPtcHyzlAwf9IviHyv+rhONQKuuIZno5C9c5ZCS/R6bVZSkGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1665
Subject: Re: [Buildroot] [PATCH] boot/at91bootstrap3: updated to released
 4.0.0 final version
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: "Eugen.Hristev--- via buildroot" <buildroot@busybox.net>
Reply-To: Eugen.Hristev@microchip.com
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 7/31/21 11:14 AM, Thomas Petazzoni wrote:
> On Sat, 31 Jul 2021 09:11:29 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
>> So in this case, we'd hav something like:
>>
>>      ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION),y)
>>      AT91BOOTSTRAP3_LICENSE = MIT
>>      else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X),y)
>>      AT91BOOTSTRAP3_LICENSE = Atmel License
>>      endif
> 
> Indeed, sounds good.

Hi,

Do you want me to update the patch with this or you want to change it 
when applying ?

Eugen

> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
