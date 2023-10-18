Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A124CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 10:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA2DE400FE;
	Wed, 18 Oct 2023 10:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA2DE400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1cRdPEvWKLeA; Wed, 18 Oct 2023 10:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88C1B40168;
	Wed, 18 Oct 2023 10:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88C1B40168
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1B11BF5F5
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 10:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D926E41F43
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 10:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D926E41F43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UxjrUOYE_TDt for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 10:37:04 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::625])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22E1041EF3
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 10:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22E1041EF3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C26CSbiGkfsbWKYml5Z2grSOWSqBOWBzMg8acRKz0L+NVoWYpsenaUb15BimGsPkrUrxm0DxAafyXZpCCH+4S8HUzSXh/acRzbhfEMGlj40QqM3cxW7NUhK5AsFZG8hNFQnRym3q72uft2gXuEVbeXYrf7bWCsMRS3TskNw6VP/2zGcKWzKrj5wXkc19H+vCzl/R37dBwrDCaihnqo4GJ+mJFzfPWeGEXI1Luid/egLavAxxfavUAC+tLrRDpShhjwycAA+XE53azp7qIRrO1DtsARiMquijt4hGhuSGbY0izyzUR3cU9YcSZpXfVI+8QySXhaJLgfELufQZdBTCVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91X8UVYscQ6s6Z9Z2oeskzWhUlUAiDjJZWz8QOs/Ex8=;
 b=CLq57cryKpYtxbf+c5BiuGkdxfhRoOON/PElBR2umpP7MLViZW+a28oJJRbbQZPY4GF/fjVLIPTT/1isqCM1Bj6b/DAjfai49OStfvsvVLSKnS1pmAozUtXkcvzmSFBlCFLgoX758KxZ9ZSs5rsLxreBaI8b24DtDCMUuQWmcKD7XV1TvvD0Y5Ac5tuEnD1rfEuucThrtPkvO9tP2Q/qSl+ROsKbaeNln2beSu3Ugpnoj6Zf8WjsZCHzhp7qe5OkVvhWX80Gr2YNapp8wYLdoEPUnVvu3hqbkomtAudIVPIwKNF9EWS8jEZrHhUElKYTdQsc06ok1P5ReNTAP8t9NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ0PR12MB8616.namprd12.prod.outlook.com (2603:10b6:a03:485::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 10:37:00 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::53cc:feb5:431:6de1]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::53cc:feb5:431:6de1%4]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 10:37:00 +0000
To: "Simek, Michal" <michal.simek@amd.com>, Peter Korsgaard
 <peter@korsgaard.com>
Thread-Topic: [PATCH v1 2/3] configs/zynq_zed_defconfig: bump to xilinx-v2023.2
Thread-Index: AQHaAaLs43FKgLQKdUev5BO+lw+rQLBPS0ORgAAGXVCAAAaKgIAAAU5A
Date: Wed, 18 Oct 2023 10:36:59 +0000
Message-ID: <CH2PR12MB5004328281E2B7ACDE8B5A2EF0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231018091002.2162735-1-neal.frager@amd.com>
 <20231018091002.2162735-2-neal.frager@amd.com> <87h6motghr.fsf@48ers.dk>
 <CH2PR12MB50049ACBED004D0940741439F0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <f88a31b0-b6dd-4bfa-921b-1f37b737847f@amd.com>
In-Reply-To: <f88a31b0-b6dd-4bfa-921b-1f37b737847f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: peter@korsgaard.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ0PR12MB8616:EE_
x-ms-office365-filtering-correlation-id: fbc94d16-60f3-426c-861e-08dbcfc628dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m9lrieAXEkA/xT8TGrH4o3x6UToxeEXISr/BkzB209SMwEApatPEL4gwgxNNzUh/+Iu2sh5Io/R+/fGWioML44P0UfoF/O5Bi5yjQgl9AzWOSc3GKyf2gaZJl7OvmOBB4n90l4ydOev5LfFm7I6XMqw9AG2+YRkV1cUFac6f54K4SwMD+dEg+SbhDxVo4WHFm5h6C2z4fCwqs6tqKE8OUNZ2gPkqSoF8gx2XXrRSy4H5l7POowpMihLPuQs+lH0ISpQ5SPqCwjjJQ6ABRYaP1eJmw99UNu/UbOK74f+B1GIOY5KrmIOQly3+yZn2BWFCJuqvSV8x4JWDgPkBYQHJXkwUgaaJJmK5Qc/5HMe4IXxHnfduolY1I/FovwT1vbZc+V/KnJyz52xMLRkd3S87hO88eayzQnORvu1BA1U0drF1lso2RIadi5P9qC9gaQMHnZxoxa2zIoat+IgFyXE/8wfAmkRGTlcjw8SlxQamdbnzIayRtylHLmfzy5fKoo9k6ECbG+Az5h6UzN6fgqkm+nuM2fLAUQ3gkfqOgPHli4fpSERGqoWsz6yWBNxsUQ3YcicJ4GHrad0ZiOq11i/fDsbFRF7A/9dsuPYL6jQZHH/n5ndoqftO1d9OwZRmHBRY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(55016003)(33656002)(52536014)(5660300002)(2906002)(316002)(41300700001)(86362001)(26005)(8936002)(71200400001)(8676002)(64756008)(76116006)(66556008)(66476007)(54906003)(66946007)(66446008)(110136005)(38070700005)(7696005)(6506007)(4326008)(122000001)(9686003)(478600001)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUhFTEh3TW1YbWxTMVluMDk2ZFM1c3ZmSzRFazBoVWk2ZDJxZHdwb3NnQnpu?=
 =?utf-8?B?dUlEY1FrSytEZllyRytHWmNMZ0d1cnYwZVVvNVpmMzBRYzBYeXgzek55Zjc1?=
 =?utf-8?B?NGNsdXpGYkRKcjNnNVlFNWliaVYrYzZlaXhaV3VjM3RHUXhLaG1YelZRc0ZH?=
 =?utf-8?B?N1pDT1BtZHNMZTdBM2lpMnI0RlZPdzhucjViaUZCOUx0TmVTcDlCOFFBcm02?=
 =?utf-8?B?WU84eUw4K1ZBNVBST2tsbGU2NHNaT3RXQ0tva01FS0k5Ni9sM1hwakZnd3du?=
 =?utf-8?B?QjVORkYwZDNQSTJ4YTRHRHlpRFZqVkVyT0ptSHdIRGNLQWpIU3NFeWxrQjQx?=
 =?utf-8?B?SDVFVjZnRVZCNU9WeVJNTHVXckQ1R05iT25pRDZxS2MvYTgwanZVS1doYVBl?=
 =?utf-8?B?STQwRGg4UjZXRDFjUjRrQ3VTNDlRYW9UeE83ZnFpa21OdnR5Mnp1UytTQWhV?=
 =?utf-8?B?Z2cxd2Z1dFhWYzFta3FFMzR1cUNVR2g2a2FyY21hUDlQQ3NYdUNhdHRnbCs0?=
 =?utf-8?B?b0lLUEQ0cklCcmJGRStDbmJsTVkvNEtLT1NrL0V2dklYWjBka1dmeGgrN1FV?=
 =?utf-8?B?Rmc4TGtyeTJBUEUyeHVyWkM4bXFXaTN0U2x2bktTaDZBQnhicmxMc1V0YWxN?=
 =?utf-8?B?SnpjL3R6TVNJRG5GWFNJS2toWUhoNE5UZFc1WFphbDhCRzh2MUFQYmdkMnhI?=
 =?utf-8?B?Z2FvZFNORGtVaGRtM1NoVGtUTHRRUzNYM05zY1BSbURDenJjdVd6dUswQ2J6?=
 =?utf-8?B?c1lVSUt3RHk5ZC9CQncwUjlBZ3c2YjArUHdQV2l0aFQyR3hnQlU4bkZPdFU2?=
 =?utf-8?B?cEx4K29BVWxBYlovbWphamVoWk9yTmlScmZpQkRwQmJmZGN3WWZ0UEpRS2NG?=
 =?utf-8?B?SlV4N1VYY2x5eFpucnI1bzVWQ01jZUFtNGpkQk5TU1VnNUxNRVVRdkZNajNB?=
 =?utf-8?B?NExFMlRJdzk3NXZtQzUrSmQ3eURYV2FlcGx1RW4rRjkzYklPWElzV0Nsc3h6?=
 =?utf-8?B?SGNMUDNicWdDZVYzWUxPcEtJZWovVFIrN0xaWFhEQTFJcUJLdy9KYnpBbG0w?=
 =?utf-8?B?K3IvaDJtME5GYVcwR29JcDRXRlVKRjV4VGdXSEZGdFFCSUphUjRoOE50T05V?=
 =?utf-8?B?VFAvTHhTQUxUV0JXME5XcTFCVHk5UFhNY3hxMHBTQXpIYW1XM1VWWmlQVUVX?=
 =?utf-8?B?ZngySWV2YUVyYndTcUg0UGQzKzdsRktnYUNJeTIyRXE4UzVoa1BkTFFrbHNv?=
 =?utf-8?B?ZnJZQXo5amFzUmJYdERzSlBYRjhhZ0NpSkQwVlNHZTY2a1RzRWYvdlRtR3pi?=
 =?utf-8?B?UUU5WXdkRzZ5U04raHBQbTNxNHNJdEliSTJVMEtkN2ZOTm5YdXQvM0hUSWpU?=
 =?utf-8?B?VkFvQytlMnBZd0YxYVQxb2g1V3VybWlSMmFXR1NFS0ZxUmJTeTl5WnpMOFR2?=
 =?utf-8?B?d3ltM09VUDNESlZXcGdBaFdERFA4a2NETnIrWlA1VkVtSnBxVzNsZ0prdFVB?=
 =?utf-8?B?NEM1Y3RmWjFybCtJZHF6dElHOGlNSk5JWGtsdlRveUpMb0dYU3ZnWEhRSkNa?=
 =?utf-8?B?ZXBBWFJQQWdZT1llQUF3TTlTQ1RSUHlWaWRpbUl0clJBclhRQkUwZTkwWTdK?=
 =?utf-8?B?YkYxOWI0RlZtMVNvcGZMRDhiVGVWdTBPdWhIWm1HQWpjbnZRc0J5akg2bFha?=
 =?utf-8?B?VGE4REE5VnVCUkppRW95TWFyQ1NDMi9UVmFNU2xkNWRPcnFXcmw1cm4rNDh4?=
 =?utf-8?B?WlZmSU1DZkI1QWMwVEtwZS9vZjNTZlk5L0Q2YlRMcU5JYlJDSyt1UU9zK2hN?=
 =?utf-8?B?VXRWWW9VSWx4V3hKR3kzSnlHZ2VVK3hGNUdjc0JUZ3pJWmpEeHlVT1BLVEpW?=
 =?utf-8?B?UTdnWGEyTUg0dGM1S1ZrUnhPQjhLckZZSEdudXNmNUMyTktib3lUVkl4VlpT?=
 =?utf-8?B?OTdFTFBvV21OZ3FWZDFzSkNTNUtDb3A4bFR1VTl4TXFmdURhYWE2TVU1UlpR?=
 =?utf-8?B?ZHFyWmhJcVFzZXVMbEFyYzhwK2lBZHhNKzNBczNUYVF4bkc0YkJVQ2hLQlUx?=
 =?utf-8?B?KzVRcTRzS2pFVVlBZmNoTFFuaXc0OHdnc3llTWgwdGN6RFAvY2xsYVZhNXox?=
 =?utf-8?Q?6UA8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc94d16-60f3-426c-861e-08dbcfc628dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 10:36:59.9059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VHDdor3g1r9C7fbMRLXRW6+z16fj6dnia5W4gcZiXFZNVycWwlVxueCfRA/oBsO3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91X8UVYscQ6s6Z9Z2oeskzWhUlUAiDjJZWz8QOs/Ex8=;
 b=4915aw7ewrWcvUtCGv00oCulLE/j98r0oIczgjLhXCFF+UfF5vdQWBoo0S7LosHN80ORYCpDjlvO7Av3QUIcmtTJTFueg0gz25BwrfPtbqW8cY1rtXUzxEm4UMNxPYaa/ihxM7gkTvWl8XnimnLATmaYu2lZbSS9Rvj4XU6Dv/k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4915aw7e
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 2/3] configs/zynq_zed_defconfig: bump to
 xilinx-v2023.2
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
Cc: "Chaplin, Kris" <Kris.Chaplin@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michal,

>   > This patch bumps the zynq_zed_defconfig to xilinx-v2023.2 which includes  > the following updates:
> 
>   > - Linux v6.1.30
> 
>> Out of interest, how come this was "only" based on 6.1.30, when there were already rebases of 2023.1 based on 6.1.40 and 6.1.50?
> 
>> commit ae6daa717cb4cd4d8234e6f91b99af68ef438252 (tag: 
>> xlnx_rebase_v6.1_LTS_2023.1_merge_6.1.40)
>> Merge: 9299ac26ca51 75389113731b
>> Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> Date:   Wed Aug 2 13:28:10 2023 +0530
> 
>>     Merge tag 'v6.1.40' into xlnx_rebase_v6.1_LTS_2023.1_update
> 
>> commit 496752408d031f93159fcf1aba2831c807a389a3 (tag: 
>> xlnx_rebase_v6.1_LTS_2023.1_merge_6.1.50, 
>> xlnx/xlnx_rebase_v6.1_LTS_2023.1_update)
>> Merge: 0f7f048016e0 a2943d2d9a00
>> Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> Date:   Wed Sep 20 17:50:18 2023 +0530
> 
>>     Merge tag 'v6.1.50' into xlnx_rebase_v6.1_LTS_2023.1_update
> 
>> - U-Boot v2023.01 with additional bug fixes
> 
> I noticed that and I actually have the same question.
> 
> @Simek, Michal, perhaps you can shed some light on this?
> 
> In addition to Peter's question, should we be bumping the Linux kernel release tag we use with buildroot each time we merge with another set of 10 upstream patches?

> It is because our internal deadlines and associated work in connection to our releases.
> When .1 version is tagged we are merging every 10th LTS version on the top of xilinx 2023.1 tag.

> On .2 version we continue to do new development and we reached the time where there shouldn't be major changes merged to that branch. That's why .2 version stopped at .30 for running all regressions and .1 can move on .40/.50(coming soon).

>I see that xlnx_rebase_v6.1_LTS_2023.2 has been created. That means that next step is going to be that we will do merges for both branches to 6.1.60.
> At that time both branches will be using the same LTS release.

> And we should be doing merges to both branches till ~ April 2024.

Thank you for the very clear explanation.

@Peter Korsgaard, if you would like, I could start bumping the Linux kernel release tag used by the buildroot zynq/zynqmp/versal example defconfigs every time we release a merge of .10 patches.  

Since there are bug fixes in 2023.2 that are specific to AMD devices, I would think that 2023.2 with Linux kernel 6.1.30 is still a better choice than 2023.1 with Linux kernel 6.1.50.  However, I am happy to bump to 2023.2 with Linux kernel 6.1.60 as soon as this is released.

What do you think?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
