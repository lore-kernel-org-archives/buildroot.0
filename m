Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F145DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 10:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7235782F40;
	Tue, 31 May 2022 10:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkBleXcvKfe6; Tue, 31 May 2022 10:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B33B82CD4;
	Tue, 31 May 2022 10:13:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD0EA1BF271
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 10:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B90D2404C0
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 10:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ve1EDe3U0SMP for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 10:13:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::615])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E93CB4047D
 for <buildroot@buildroot.org>; Tue, 31 May 2022 10:13:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTEje0mzOIaKyviRaXrl40DJx2+IYrVPrJkTqV6JFcHvtNXDiBOx4akIHY1+ucfN1d1gXBqyBI8xgGDgffVxIrcLcLDK35rfVPlBIXsKoYAORiSmRAKgApRS/sLmQ79zRJb/Y66vQtmRe7Oq4NYv+GiUx3mA8PQ275WJ+qeicgHFrh0u6l2LQXiPCEXPK2l8+YVI3d1V2wRVgY9sdP8N60FNl/UNr9/sl8f+DG8luEH9rPTfQ29Fe52Tm1AjZQf3RW0J19y6+1fyEZZY8FvyowO+HinPF583YAMc4zYJcyq3dvwP4d6sr8htoeYHa2RTYHnVVXzGUyBN7ZP/GiNmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUN2Iwo3MoVCXA7Wc10IoRoieqeXQcJL1Cbr9qEEaY0=;
 b=mORNAJ2Tz6VqpWVd1uq4t8+gs8oOokjaiseYerQ6YEkMHK+KL/s3SnHg25XYGOGOsDkFWhcMupuN34TSwl8vT01YZD/kHdysXsUuNyh4lGjSHs9As816ynZo6/VAXc1qiomtcwYpzchFlDblTd122ZoYHZ+/FFs9nyG5aRXtJS6SMUbPUlyi4fGsUZtokeCuSL9Ud5NIBtB7pz8IgiZrOqCc82hzf8uCO4W2AfrJN/P2aAeiKpV9EQFbBzm1eSb7KAM1CwRRzy3DozvjHIg6xHFTEv26s+NlZ135vESEbv3hl/1eYdwluxdrVCmbKEZf1T97md31t4SV6d8VTxWLCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUN2Iwo3MoVCXA7Wc10IoRoieqeXQcJL1Cbr9qEEaY0=;
 b=NwgbjuzaQzEorzae9+IeKSzIoXzArY4zGnqvCU8V7LG2g6izPD2J4wURX4tqE0lzc37d8bWMVZCcADO0xw5HWwDZg0km/2M+iXI0OPdlvK4B5t6N5Hi8wcarpKoKGuEso4v/GVYj0BEJLh4PTlLtXGcN3GV4zS6CBftvIjlJhXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 10:13:10 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::880a:6606:6f57:dd0a%5]) with mapi id 15.20.5293.018; Tue, 31 May 2022
 10:13:10 +0000
Message-ID: <615471f0-f1d5-40e3-607e-3d4f114507c8@theobroma-systems.com>
Date: Tue, 31 May 2022 12:13:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220506104658.3174243-1-foss+buildroot@0leil.net>
X-ClientProxiedBy: AS9PR06CA0768.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::23) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1108b3e0-ec4a-4c1f-a52f-08da42ee29f7
X-MS-TrafficTypeDiagnostic: AM9PR04MB8438:EE_
X-Microsoft-Antispam-PRVS: <AM9PR04MB84382580BF2ACC62E77DB29FC2DC9@AM9PR04MB8438.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gKVrK1VAZQgiMc1wt8pAxwkiwWDI0PX+zz8xyeVuZI40ndItxOoZgfGTFaGCpWNh4/M6mgbIAJn9Inoifxqi43UZclwkBzOF2DSaY92yiaF9TE5K34YrewW48m/mrVOZZRPp1ylgrzuAykzQvI/8rH1UT9gAfuSW/kCwanubPnOEU7UQalc6i4rR1fwbNIP/D/jUSnGscDZ+Y8g8wGQ1IShcUAECIIgFdxK7SeOLf8OTNFN6ud2ay3WZRMAOogoYnZbpjCF7M83ywZnHcoaHrDzOBChXou0Vp3gt3wCGQHDN+U+7Ev4GJpmLHGaSeMklEw6sJXUb+/LWHOcINSXjwPSVMbXjDRIlIKcujDb8Qi+XJJgjWp4sySvQA4Dbu1C6WaaNLGSZJ+n9TC7UW1gC2W6B0JeYovdo8OgAJXoX7u/RxMo9dF7EnzMHT2AziWwS8MCaPlRfZHvAIDDKZB3xEqRNW7SL+Ra26AUQg/++FRobdDG6VkPK5szF44tmvn5Eo/cRQaHKP92mUX0Zn/o9p+CkCGdi1E3FC3aYTWCBlzYJgnP5ozzAZ94YFkM5yzYdAp/YPNpnY2BKIKb52AIuI7eTIwGtpAmVOQ44x6BytbBDoXlbf4Dxg/zxP4nsoAo93ZxJfu8DcHpPtuVtarRIZv6DALSsONgTwUsLilYlRq2pKKKYFLEpZdw94Ks9wFo1WCTanJZwhuN4tVDEdG1UMn42iqhdivnlyal1CPvbYuQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(86362001)(38100700002)(8676002)(8936002)(5660300002)(4326008)(31696002)(316002)(44832011)(36756003)(66946007)(31686004)(6486002)(66476007)(66556008)(26005)(6512007)(2906002)(53546011)(6506007)(186003)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlNqWTVBeWkzQkN1b05IT1pNQXVjNjdIU1dISktxRzNxaVRNUmNRMTZ4OHhm?=
 =?utf-8?B?eFZLb1lZYUJ6Sm1RRE53NXl5WVhMbWhNYlBGc0RCUWw4QzhwTWM4WmRvNFFk?=
 =?utf-8?B?dFFQaEZVVldqaUdlY3RrTHA0SHAzalQ2WEkyK0cyQWNnQzZwT1JxdjBxSUZJ?=
 =?utf-8?B?NklIRW5lWWlKYXdQVThiajlYZkJmd0cvdFRpMVZBQlBsSCtZZzRWYklLZjdZ?=
 =?utf-8?B?OU9ERU5VNDB4MWlZMFplR1pxR2Z3SVdxOHNSazd3bi8rSGtNKzl2RUVlT1FJ?=
 =?utf-8?B?ZU53T1VJUXdsa21LQ1p3cWZVclJrbEtwLzVNa0RFMkNudmxBelNxdndPNzlj?=
 =?utf-8?B?SnJOa0JtVE9nNlhWdHNkbkN5dnBNOExWS1RkZmFhaTYzSXE3ejRUd25NbTlD?=
 =?utf-8?B?VmtVSitneDhvNEhJcHE5SjVwTjhHSXoxdWZJYTFWSDJLQ2xmaWJxNnFWb3lS?=
 =?utf-8?B?UFl5cXV1clEzdzZtdXRERUM1Zk5heVdjVFJhZXJ5R3pXblFxa3NqOE1KOWhX?=
 =?utf-8?B?a0lXRlY2UzRMZzR5RVg5QVFCNXRPRkdCK2RkTXpZcXA5MjBwTndCR1pZeHNI?=
 =?utf-8?B?SFlFOCt1VlZ0NDVVNWJ4NjVpSmgwc3NGeU5CRlZIaHQxckw3RFJSVnV1dDVq?=
 =?utf-8?B?amcycW9NdWlpbm56ejh1eFBiYktJb21lR2xwcENvNFlGYVNjellYQURBM0s0?=
 =?utf-8?B?QkQ1SjZMMlg5OEVJc0tVajV3QmtQK2ZqRlBvZTN3Yndsa2tpM1F5Zmlzck5G?=
 =?utf-8?B?YlQ0UUVwcjVJajlEY0xJZE5DZ2NEM1Q2Mjdqb0VoQXlqbWVjSVd0ZzUrOEs4?=
 =?utf-8?B?NWV2QzlzK2ljWGdRcU9sR3ovNVFqWU13WE5ZQlhGbU14dnNlVDBiSWp6Ni9n?=
 =?utf-8?B?V2ZNWkdBNENhRmxBWlV6Z1FkZ3hBQkFZNDhuQWt1WkVMc0dZNkxMdWJvMGNi?=
 =?utf-8?B?ZTAzUSs4bGxaVSsyMGhPNjdDNGl3bVY3MmxYRHZzUzU3SGR4Y21vc1FGTHps?=
 =?utf-8?B?b29SV2RCa2tYRUxBeUhWeTZtUXQ0RnoxR1NMS05NTEM0bzBXZ3c4am1BT014?=
 =?utf-8?B?aks5b1M3VnEwb1JtbHFrWVBtRmt1SGYyOS9telVlVGowWC9vOHJFdDM2R2w2?=
 =?utf-8?B?dVJMNGpxRnVUU2pWYmRjUWIrdnlIaWFETGlHWmU4RVJldnc4NkdISDVDVnhs?=
 =?utf-8?B?a1hSMVVaZVFxejhxVTBWa1Q4Zi9DMGJ4Nk53Z25sN1hIdVpBamNya1JUbk9s?=
 =?utf-8?B?UjRvNlBZWlNFdWlEMXhwaEttN0xrVWxIeEVTdVVhaUVuTmI3d3VYTkhEeFl6?=
 =?utf-8?B?dlVVOWZyS3lTNzRReU5EMk1SSkxzTkd1ZldsMVNCbExDVnAxQitHRmhKazkr?=
 =?utf-8?B?aHgxQ1VFK1pMaWw1eXZZUlUvYk1yYitBYm5ZbGhCOFpwV0xoZEdZbFVqeTNa?=
 =?utf-8?B?M2lLSm9BL1RxMHQxbmVQK0JZY0pIYy82WFlSUXIwT2wzN28rOGRoNlZlb2pB?=
 =?utf-8?B?S2RHOWEzU2hGRkpWMkJ4SXRlKzhacG5kN3QxRlBrTU5sQVpmU0MvdWpXVlh4?=
 =?utf-8?B?UXh1TERteG9QVnVtbVlyNllHQXQrMjBTVGdGVysvTjRFY0dVaG11S0NiVXpY?=
 =?utf-8?B?TFFmbm9CUUcxWGNYOHBQTXFvOEZBR2ZLZUhtOWdISU82emxZeksyLzJYV2J0?=
 =?utf-8?B?Z2RJMzNWSzZSWjZNVjV0MWQ1THJkYm00UkZiRlQxSTBTTTA5aGRvcmQyWDJX?=
 =?utf-8?B?VlAwNHpJQUIxVThXTE1rQnVRc3NKMHFmS3B3R2FBaFNENTV1NFlLYjRjQXM2?=
 =?utf-8?B?bytSU2x6Mkl6T2ExNUZsUW9kS3p1TS9EVjZHSzNUVXB5aUR3b1E4dmx0dkZS?=
 =?utf-8?B?Zi9jOG95azJuWlM5aENNbTd4TnQ4cEVCMnFaTWJOSXdyWFhBb0JMOHdnN2k5?=
 =?utf-8?B?dUZuOW5yTWZQSEZnRWxqaTgrbnhVcllCcjluaEdhV3NJRVdQVmVrOHhMOXZt?=
 =?utf-8?B?bTZtaHM1S2lEa2VQd0p0dml0WDhUNW9leTk1NDhvRHFPRnk2c1RPQ1JHSk8z?=
 =?utf-8?B?NVF3Z2V4UXVLeC9QZzdtSC9TU2pHemZ2N01yQmliYTBYdENpVDlHM3dpWUlu?=
 =?utf-8?B?eEtlSmlpZ2pqZ2RGNDJ0RmhJV0E0dE83THlaWFVRN2x6UFBkcXdPTE1mbm13?=
 =?utf-8?B?cHBFV2hjU0FWSUZrbFR1bW5kY2JjWS9jeG83a2R1N1ZCNGsvTUU3MGRyQm1Z?=
 =?utf-8?B?YkRWSWF4VUVMWGlzWnA1QjB2VFY3NWlTdldGMlhFWjZYN2VnTnFmaE1NcXp5?=
 =?utf-8?B?Y0ZucHl0Z1BoTi9TeHBIVGE0VGp4dld5R0JPeURsMEIvUXBtSTA2V1AwOTJU?=
 =?utf-8?Q?Ml/LYDtZTHICfVFcoaMxgWuRCvG58NLaXXeJD?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1108b3e0-ec4a-4c1f-a52f-08da42ee29f7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 10:13:10.1653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cRBnwk+d/Tjk7OGsLYgb97otiat9Dv+LOBPINhDeu4oJwDnvio3N4StwsxMHW4cjsnx+AClhU2L7yEOiJz4u7IFnOPfKhIsC+45e376SOY0LEN5LZKBlQu2k+KgHr5C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: strip symbols before
 signing IPA libs
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Any feedback to offer on this patch?

Cheers,
Quentin

On 5/6/22 12:46, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> Open-Source IPA shlibs need to be signed in order to be runnable within
> the same process, otherwise they are deemed Closed-Source and run in
> another process and communicate over IPC.
> 
> The shlib installed on the target should be the same as the one signed
> by libcamera during package creation otherwise the signature won't match
> the shlib.
> 
> Buildroot sanitizes RPATH in a post build process. meson gets rid of
> rpath while installing so we don't need to do it manually.
> 
> Buildroot may strip symbols, so we need to do the same before signing.
> Since meson install target is also signing the IPA shlibs, let's strip
> them before this happens.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
> 
> v2:
>   - use LIBCAMERA_POST_BUILD_HOOKS instead of replacing
>   LIBCAMERA_INSTALL_TARGET_CMDS,
>   - add handling of BR2_STRIP_EXCLUDE_FILES to not strip files which
>   shouldn't,
>   - added --no-run-if-empty to xargs, in case no IPA is selected,
>   - removed stderr redirect and pipe to true to not hide useful
>   information or fail the build if strip does not work,
> 
>   package/libcamera/libcamera.mk | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 77381ab3ca..41d6a5abef 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -104,4 +104,24 @@ LIBCAMERA_DEPENDENCIES += libexecinfo
>   LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
>   endif
>   
> +# Open-Source IPA shlibs need to be signed in order to be runnable within the
> +# same process, otherwise they are deemed Closed-Source and run in another
> +# process and communicate over IPC.
> +# Buildroot sanitizes RPATH in a post build process. meson gets rid of rpath
> +# while installing so we don't need to do it manually here.
> +# Buildroot may strip symbols, so we need to do the same before signing
> +# otherwise the signature won't match the shlib on the rootfs. Since meson
> +# install target is signing the shlibs, we need to strip them before.
> +LIBCAMERA_STRIP_FIND_CMD = \
> +	find $(@D)/build/src/ipa \
> +	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> +		-not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
> +	-type f -name 'ipa_*.so' -print0
> +
> +define LIBCAMERA_BUILD_STRIP_IPA_SO
> +	$(LIBCAMERA_STRIP_FIND_CMD) | xargs --no-run-if-empty -0 $(STRIPCMD)
> +endef
> +
> +LIBCAMERA_POST_BUILD_HOOKS += LIBCAMERA_BUILD_STRIP_IPA_SO
> +
>   $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
