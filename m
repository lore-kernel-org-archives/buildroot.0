Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942D0C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 09:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 478206106F;
	Wed,  4 May 2022 09:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a7XTmgAogkTN; Wed,  4 May 2022 09:24:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F6D260E6A;
	Wed,  4 May 2022 09:24:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 628A01BF239
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 09:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F4A660E6A
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 09:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWc2B9kIPCLZ for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 09:24:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69BD960E40
 for <buildroot@buildroot.org>; Wed,  4 May 2022 09:24:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbHHq3FPQ7GIWAJp/Erc5B05OVXt0s0PFvCOm0KRh4L0LBBmPX0wk7EitXxci1vwc3jIDnb7QBnPWTKGpQsCdnnQoAkH8dhKu+3ufzSWFblHNU0+32fGaGratkfkEfGfBL8qHEAt1Yq/zZkrTSFuadcvdYw11Y9EWPg4RzNZ/0eW3YEMyQua5238wzNRwji5FRmHBgky5pyG6xeF+7hvtSWMdqUs7Gp20emDO9n3n+vHI2sv1dRSK+8G+RgFOp/nRYCvHGVrOXQpolPH156cKVcwljT97uF4IPaa4qV40zbBuz6UQkGv1aIWeVgMVXQNFHEfpcAkM39QkvRtqkVJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlWa+uVgyTmTmVJiEZgyKeFlsFhAEsRfM6sEETpr0sU=;
 b=PsXPXwSFw6POQz3Y8Hgq9xRGYYSnevAEw81b/jcqs/sSKKYdHmAZGTzHesdR/9KsAlN3ocnYNBF8zQlxtiBDkq/6/jHfTw2ST4kxhbbB0xeHaGh3J8zdQdu3GBp8Wc/1mViJJD3nejsd+v3V89DfEW/mUE0iC3rX76/bgzxgfjLUOkwcAYEG0hW1/GT55VSyUx9WU+qZvwbF/Q0Mt70Wc++5nWbtFgoArL+V46unLgFyZx79Lx3eMySt9myFZ+K9UiGEv16Cb2aSGbGHNdbB2zwaX6cbTFDknTW7zRdVxehBtM0UGsgh5Vd7tMSbCN5ijwzRMJnYkpr4te40lwOpKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlWa+uVgyTmTmVJiEZgyKeFlsFhAEsRfM6sEETpr0sU=;
 b=pq+KUMI10yI8oiIj0UEDaqBnuFBi49+SAFP3oxOw/xWpUl5k/cW7DMsoEQe1Fw4+PoT00LMcAZXuu+t40eaTo6+M22ueu118CPV78HKoQVHYui7cNUDGpXPLYig9pvGdUtVkBZJAFQwvH/PkGEXjr5bdP4HyHeQt9tszeLKPxaw=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by CY4PR02MB3143.namprd02.prod.outlook.com (2603:10b6:910:7f::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 09:24:18 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 09:24:18 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Michal Simek <michals@xilinx.com>, 
 Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CAAAIFZoAAAYeAgAAYOnCAAAX6gIAAAdpw
Date: Wed, 4 May 2022 09:24:18 +0000
Message-ID: <SJ0PR02MB7758E5893D7211770C6A3108D7C39@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <878rrh3gvx.fsf@dell.be.48ers.dk>
 <86b8666c-4427-32c6-c015-f9b67e963195@xilinx.com>
 <SJ0PR02MB775868320C331FE1CDF57217D7C39@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <ac8c8060-7b89-5d22-c96e-a8c1dc3ea7d8@lucaceresoli.net>
In-Reply-To: <ac8c8060-7b89-5d22-c96e-a8c1dc3ea7d8@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac0f8c2a-07ee-42e3-7212-08da2dafdd58
x-ms-traffictypediagnostic: CY4PR02MB3143:EE_
x-microsoft-antispam-prvs: <CY4PR02MB3143223101458EFA73EA4138D7C39@CY4PR02MB3143.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KZ48LPMJGaT4c1J7wfMpWeMnzkYmuXbtErnaXbkoXpd9rAhJCLYlrWv3LxWoQTjxfmWKXa8+3VXr3nO7s7ms16oXcHpt33GAHDPDvVvnbQ870JFKOOYSmP+d1K7qE2ToJog3yijh+mkdjpJ2MIYOmQu4asfEfAweocjkt0Tl3EPEoLJEFb8S2u9D5TWhPCHf2dw9iMQ3Loesogg+NB+bah5xA32BFOsznBVxiQ40QMM8FIIv6VAfLDtpuDjXaNojiVwP6L6J5SAJ6V10nSb9e1WvbWDx9vuB1Vo6msZuJNpEFWCMtLkRU60DuTJnDZTRFfE0G8mr7EsWkv7p/CsUXpW1Bh8NLenDu++JdL0DoIKnjUwiREtRBzJSrhRc7YaArOPx9Vr3WprnbIbAlwM6i2KVR5K0LHiIhqVgBHvgTDwZs4L3GTPtuncp/Wh1U9ds3B6cJigvM+pqVQEqBI+Q85rJR5OnF2kPBpViYWJSLKjXloD1BpGmqiKL8kKj38rCllJUFDqjlAgs6DDw0QMzrCJTLBSVZRl8jTTll+eV0mcUE73Z0Z/Y0BZJPRyU7faZdxFdWES9MJkMQduKES8J0Zph6Mws3unzsEkfcn2IbW7tKpydScmcPH+jHKNdI2EoSKeVsH5aB33tiwwc2WlKYpbFhMn132G4Pvua5LdWRIFt1GUsC96hxOP/86DyFUfbB7K3GtVPIDPFOQBumJGjjP+KfzEDd7tbAZMkx84IBD3JTxOTyz9MwOcoKx2CkYheyKvcEIa6CHOv663TEmqg6pWxAdg9OwoC1lN0kHrP7Fo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(76116006)(508600001)(66556008)(8676002)(66946007)(110136005)(4326008)(66476007)(66446008)(64756008)(8936002)(38070700005)(2906002)(5660300002)(186003)(55016003)(71200400001)(966005)(54906003)(316002)(83380400001)(52536014)(6506007)(86362001)(38100700002)(9686003)(7696005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEpDZGJ3bWVlNkV3UG5OZ2JPcCtHWENucWN5N3RiM2dDMnVEZGVIUXg5TUdN?=
 =?utf-8?B?QkVTelFld1ZqRUo2UVZtUjVETFEwNk56endERFZ3RHFxcDM2MzJ4c0tnODIy?=
 =?utf-8?B?MmlnWVFRTlRXOHMvYWsxRkd3d29UL205U3VBYWFnVjRMalQzR3phK3JUS3dF?=
 =?utf-8?B?WGlTUkthYVQ4YlFNckVEdldUS3dZZnRMT0Z2cjJ0aVhkUldKMHhjY2htTTVy?=
 =?utf-8?B?clhYeHB3cEhaaXoranZrNlZvV3QxT050UkdUeWhpdnBlS1ViZjVQajZoWkFj?=
 =?utf-8?B?ZWpldlNLYVdNVjNZUi9QTzVEQVA5Z1d4WWxyZEFUQjZXeVFrajhPSmJQMS80?=
 =?utf-8?B?VzQxYnpFelkvOUFiV1VHVWNVOEtzeUlFNWZMZWYyeEFmN1hEekQ2YU5ZTWlK?=
 =?utf-8?B?cFcvUmhDQnVrVGxyUW5tZURJaVpUVFdZWlVRZVJPb3VWd3Y1UW1aOGY4dGJN?=
 =?utf-8?B?Z0pQL0R3TjZXMlRiRlI0MHNQa3RLU0RpNXpqMm54c0NsRXAvc09QRDlheVpD?=
 =?utf-8?B?OHBMMUV1b1lISEwyQ2RuUTlXOTZkQ3UwdWFGN2ZBMGthRDVxM3ZOdmMvWXNl?=
 =?utf-8?B?dHZjQUlvT1B2a2cwS3I1N0RHbndRd3FCWFZlTzlwemlzREQvai9LaGNmbG92?=
 =?utf-8?B?MzQraUZDOC96Z08rbnFmN3laWUdsZXVjT2IyYjI0L2k5WTl0MjlISHhnRmo1?=
 =?utf-8?B?OUhxdnB0SHhaV2hPdkVmQ3ZXQlVKUlo3VlI2ZkVRSlQzcUlpTGU2WE5lanQ4?=
 =?utf-8?B?eU10OHRSNVNTRHR6NnUrKzRza0xXVU5UUkgvZ0loTGI0bG5neG9SWU5pMlAv?=
 =?utf-8?B?NGk1cmR1R3QvQUNtUDRUMVYyR2tOZERiZFRsRGowV3RhUzBJS3dvSnpWYlRl?=
 =?utf-8?B?Nm15eVJtYkIyVnJKb3F6RnEzMWJEVWdtNVVwUjVocFp0WlQxaFMxOUpFY3pj?=
 =?utf-8?B?TVpsa3hDZDU0N25NTlZhSXd3RERISGM2ODBOb0pJTjVhQ3BYM0tsWVp1Mmpn?=
 =?utf-8?B?SFY1WVpObXpDQVJodS9tRDZ5SzZiQmdFOHpuMXo3K3owNWFJdWJSRDYrKzlx?=
 =?utf-8?B?OVRTNmYyeWpIditUYjdTelc1V3cza1lyZzdhWDM5N3NUb3M0V1BsUjU0WkN0?=
 =?utf-8?B?Uk1WUlpYeWdkelkxNUwxT2t6OS9JTWcrVm5GL2xLZm5JQUJKRi95ckhucHEx?=
 =?utf-8?B?S0k5WFhYRkxuZFJuaW1SbUJjNERxNnBrOGZMT3U5WnFDSkRHTDF1dmduTDVM?=
 =?utf-8?B?TGVlNEFkR09hMEFWRnhnWGF5azhMVEtVa2pyVFFMRUlyWnNmVGpzY0R5UlJ4?=
 =?utf-8?B?VEhVZnBtZUhFQko0ZUU1c3ZVVTJOaVlLcTY4djhVNmFCN3BHbnFPSVRZRW1z?=
 =?utf-8?B?dWVvbUN1SEt3RWt2ZmwxZklXY1BpZU5BRXBpcjRhOEF2THFCbXh1TTM3bUdV?=
 =?utf-8?B?ZzVZZmJwWUpsTW9zWjFZaDNDeGFETDdqekx5bHU1RUFwU2kyMVZ6NjRyWmlx?=
 =?utf-8?B?VGlObmUzMU02NHMxeXNmNVlGVmpXOEMrQWltVEw5NXQvSzU5RTZaeVZyTzlh?=
 =?utf-8?B?Vkd4bmJ2b09NQ1JPTThUVzg3dUxIMHhKZVBaM0trMWo3OUQveXFPd1dkMzdy?=
 =?utf-8?B?K3ZocWlEaTFIaFNQSktyOCt2bkVFQ2JLZnRiVml3OThFL3ZMSkFOYjFnZ2sv?=
 =?utf-8?B?Mi9oL2RKRWNnaTNOMzVmV1RZaHNNZUJJVk0xcXc0SkFQbS9SUEdIcFdYUHJ4?=
 =?utf-8?B?OHN5YzR0V2kyL1lOK3RZQU1BSit6OG5vWVdJS2N3a3dIcE9LTy96S1UraS9j?=
 =?utf-8?B?VTJjUXVmYitSelg4dFlyMURkZFBOOXovV0tzSHplS1dLbVVaQlBUNkJwVjVP?=
 =?utf-8?B?MW9jQjh0ZlVvWVlNclFHSS9hd1JBc3hqaXdLMDlVRGwvdHVPRXZWVEQ5TmE4?=
 =?utf-8?B?R25mS09tWHhjd3hzd1NkaFlvY0x1K2l2MGVFdUsyWEs0Nm94NDluR1U2blpU?=
 =?utf-8?B?SU5OU0xiVWlWTGUrMlZQTUhIYnkxL0laRmwyNXJSdWc1bmJ6MEljUzJ0dEIw?=
 =?utf-8?B?Zk5HSGZQQTBZUFhqNUE0YWdndVVGdU52aUM5SFgxS1JIVDkvM3JhYkQ5bVY4?=
 =?utf-8?B?OFk0UjlBRDdLZmRRNWl5M1JKOWpzQ1N6eml5azBHbzF6Sm40b01DUjI2Yndt?=
 =?utf-8?B?K0Z3USs2Q2lYNU9WblZOWFhwd2ZEZjBVOFR2WUMwZ0V6VFFIOXptcitkYXdJ?=
 =?utf-8?B?Y0xwRDlVaXIydFJHMWR4WG9UZjlzaGVrZFJGdHRkTUN4ZHBiQWZhUEZ5K25X?=
 =?utf-8?B?NHJkTVBLT2xFVjR0T1h1b3FGUFMyYXdQamdaL2lGUkxPd2hJOCsybEcva1JM?=
 =?utf-8?Q?FbyWL8VVSC4XoKLSkIqoJ7kxTY0OkeQ8VXa1X2XsZWLDJ?=
x-ms-exchange-antispam-messagedata-1: 0UibSPzpfmhreA==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0f8c2a-07ee-42e3-7212-08da2dafdd58
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 09:24:18.2120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bikEerPZg2uvq7GpczcsFdJGMDjVUM1U3DWnubxK0O3aT60sGjvnlCrBD85GVZd4/B/1DMY+AKr6qBy2u153MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3143
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

>
>>   >> [    4.384715] zynqmp-display fd4a0000.display: vtc bridge property
>>   >> not present
>>   >> [    4.393156] ------------[ cut here ]------------
>>   >> [    4.397776] More than allowed devices are using the vpll_int, which is forbidden
>>
>>
>>   > This is caused by not proper psu_init which setup PLLs incorrectly.
>>
>> This is using the psu_init_gpl.c in U-Boot:
>>
>> https://github.com/Xilinx/u-boot-xlnx/blob/xlnx_rebase_v2022.01_2022.
>> 1 /board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
>>
>> And the pmu configuration object from Neal:
>>
>> https://git.buildroot.net/buildroot/tree/board/zynqmp/zcu106/pm_cfg_o
>> b
>> j.c
>>
>> So what exactly needs to change?
>
>> I don't have this board here that's why likely taken from any old design before this check was added to Linux.
>> U-Boot psu_init_gpl.c should be updated.
>
> Could you please share exactly which register writes in the psu_init_gpl.c need to change?
> Perhaps you can point me to a known good one, so that I can compare those specific register writes with the zynqmp-zcu106-revA file?

> I'm OK with either solution, but I wonder whether it would be a better idea to regenerate psu_init_gpl.c (and pm_cfg_obj.c while there) using Vivado 2022 and mainline them in U-Boot. Would that fix the issue as well? Vivado is assumed to generate > correct files, if it didn't in the past, chances are it has been fixed in the meantime.

In the case of the pm_cfg_obj.c file, we are using the file that is generated by Vitis.  
I have confirmed that Vitis 2022.1 and 2021.2 both generate the exact same pm_cfg_obj.c files for the zcu102 and zcu106 boards.
And these are the files that are currently part of the buildroot sources in the board/zynqmp directory.

But the psu_init_gpl.c file is coming from u-boot, so if this is not properly updated, that could be an issue.
Plus, the pll configurations all happen in the psu_init routine of the psu_init_gpl.c.

I agree with Luca that it would be best to refresh all of the psu_init_gpl.c files in u-boot mainline with Vivado generated versions.  
That should fix any issues.

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
