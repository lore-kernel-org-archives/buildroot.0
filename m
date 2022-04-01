Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF17C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 09:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B90E4127F;
	Fri,  1 Apr 2022 09:50:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdB5IHFnKsCP; Fri,  1 Apr 2022 09:50:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 567EF405E6;
	Fri,  1 Apr 2022 09:50:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 153671BF376
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 09:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3EBD84077
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 09:50:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=cherrycloud.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FCJYtzCuzht9 for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 09:50:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::602])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A680E84002
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 09:50:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lp5C31FeGFHGnCD0NtlSTkqPupGqNVcDFJFJoygRXR+7VJAnfEILKErHPMQ3vkO6vAV76Rb/3xHQ6yP16FA8hDNmnUGwwzRaHt4vlGQvD+tN7emMHd9Nwh/CztuevCgIpYw4K80sUV4Ra0bX1WDsqC3FmGKHcuKYYtDn0w0eS65ITzHE8h64J01OhSJhxCQB1HzWBs6PRemzxGdJ2O4W3GGkv7uo6Q4dO2T9RREaxFRsRd7UEVmLfVaayXXVeKjZnnP2GJTrU7SjnN/FBTbXTcBfjWBVYiEOE7iSE5aK2F381NpZAiTJ3tVBXX5LPzvoBenWDz1lnBSwc1zjEN5+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+vDfh/2sTaBsB48xqeEs/v/qrV6vUOcFpGRIym2EzM=;
 b=N3no1ZgzI3+jj4rIqPKKiaSHhis8DVXK/en+rT/5VfQXSyEPH1ISyAPap4enMaPw6MLEcqbSU1Wo6lySBilYcrDnNoJh4KeXdgC21jAq9WJ2T0S9cTgxFHVPGB9wbcydHWDUBtL8uDZFGAB8zS6q51fd1VJPQ4BGFSb0Ow0+GOJPdjG0Jmip++Go2NK5mg6abF7bYDkUAFSWKsc6Bs3Sr7quFWYS3fxZnsluRJTSoCeXm4fHwUl9R/HTvY+QAxN23UXP6om/0WoNgAS8nCs76Up18MAqGuSj9Bap/YH7VOcR4YqgJwT8GL+UHMumT3ltZOK3ugY7NZcChv6B3FcCXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+vDfh/2sTaBsB48xqeEs/v/qrV6vUOcFpGRIym2EzM=;
 b=VWPzWjdFDGcjmc5HdYRH8mSLFMvjkRoqB6KZzPPneU8vip7kNdJTYnfZ2oJkcOReREAR2j/pw1U1WeNd4e8vnOllqjOv195gz7TDaUk8mDk8DrwU84LHe7umu4zwxbxJ9mfLzILnlb/14SIdqr3OvTg3V0lU7iEKHYpWk0TWNQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB7PR04MB5100.eurprd04.prod.outlook.com (2603:10a6:10:14::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 09:49:58 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::8ca9:a2e2:60c8:95e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::8ca9:a2e2:60c8:95e%6]) with mapi id 15.20.5102.023; Fri, 1 Apr 2022
 09:49:57 +0000
Message-ID: <a44d36f4-05cd-1198-5788-1a5e1ec84c6f@theobroma-systems.com>
Date: Fri, 1 Apr 2022 11:49:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Sourabh Hegde <hrsourabh011@gmail.com>
References: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
 <f10fe951-249a-25cb-b476-20cca3122e65@theobroma-systems.com>
 <CADYjeSt9V+WjTfms4pM7J_g5-jSVE9ngc5uRjXRtfcq0iOtJNg@mail.gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <CADYjeSt9V+WjTfms4pM7J_g5-jSVE9ngc5uRjXRtfcq0iOtJNg@mail.gmail.com>
X-ClientProxiedBy: AS8PR04CA0207.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::32) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e09c23d-026f-4086-76b4-08da13c4face
X-MS-TrafficTypeDiagnostic: DB7PR04MB5100:EE_
X-Microsoft-Antispam-PRVS: <DB7PR04MB5100CD4FDCB47EC7D421D245C2E09@DB7PR04MB5100.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PGFZTPS/cRQ1JJuXRpJbihzXk05EIlgFib24Sz/TFvzBBFTtTYXWv5LPT+vma1/Jan6gYA5dpsaJvFWufivNK8wRF3xQ8H/ti3EibHQ2ztwzj/gcGmE9TvsOSvwBNnjRZt19KZ7yQQd0arpegRaqweTsdhXpeLK5T00XRGR5Ph+4gsFN1DM02rdnueZr2L0t+8czyBzvBaYSkra1urbb2bW1dB/+NsPsjBnH2xdegZCaSPiBRFOBiI0EeM979zE+PneeEzfd6ZGlQWUClKVG9k42nP8BjvVWzF1ObsPRY9YDpVnrvKVUA9JWxaa0tmidzI+cqUc8ljgYgRa7++6j76DXZzbDQuY/GxE2PsFBrKBVPBv4wGne3Zj0zzfvlmBRkX+UGJcRNQw5/+BBPapxmUQyQUWCnclyjxLpX+y+rWqWHml26mLSymEY61/bYAJM+zusLQkPygEX/EFy2mPvjhwzdEJH7Dyc/EnI5bhrqGK1ZxJ+GJm6h+o7UHbiPMvW5hspD8IZHO7WQ53RMLzGTIrRDhaWBse0grtkwRh5xU+yhwSdWPO6dQNcw9McDGVGTMVWYBJoHswivdJ5qFC8trWylv2Px1aeUwSTq+Ca8KSuvGhtjRS0uEj5e4QPX7IoWHvg2p/j8OB8h3Mt0MJFRVyTFKuN/xCol8sB0oEKk2mD/xZjLb2+fIo2V8hPPIFeIrXjQSZkbberq2B5uYVbzu8DYW22Kc4HP6KTGwYy80w415YHVTfQvrKKajcVzbWJ2EwoRw6GVIeukJkRvlyRmU3TquHhOgyIo6A3SexqrdOCM7QGhdooE6YXbajWZBUKSVa5HmYVkR6yJffNI8KqLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9367.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(6512007)(8936002)(86362001)(966005)(6486002)(8676002)(83380400001)(26005)(4326008)(186003)(66476007)(31696002)(5660300002)(66556008)(66946007)(6916009)(316002)(31686004)(2616005)(38100700002)(2906002)(36756003)(53546011)(508600001)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVhoQWZwVlM5UUdWS2J5NWs3aHFhY2pxWW42RGRrc0JTc2EzaWpvZzhObnho?=
 =?utf-8?B?d0laTjEzaWdHTnJKZFBmWGpUVVdoSVdJcGQrL0pzZ1BZekM2VmtvK0NHSUtz?=
 =?utf-8?B?ZjBBODFiTERZRHdSMTlFWnhMNXd3OXVEa1l4WUtub0hIU21pbDF6UUQxc3hj?=
 =?utf-8?B?UHRVSjlobTFxaytOd2gwMFpGMUtXcDJKLy9EZG1WZ2xwVUlDZVA2V0wwQ1dL?=
 =?utf-8?B?MjFnYm9sYkx1ZEN1ZTJSZDk0Wk05WmV6eENIaEl0NmphWXNQQnlpbWhYUm9m?=
 =?utf-8?B?OEdyZmNaeVlsNTVZK0ZMd2JiVHpQWUN5YlRGOGZuS2xCdTJVKzBhOVRyWlV5?=
 =?utf-8?B?MVlpeFpsV09iNThFQW9qeWExUmgxM0NNaWF4Q0R1TnhCdWhYeU5zQmNodEN2?=
 =?utf-8?B?OUJkR0JHc2hxWStiblBUV1hML1lDOVJuZjJqblFWV1JRaGZYYTluWFAyVnZC?=
 =?utf-8?B?K1E1dW80ODlrU0dkekE2aXFFemxTbDJJMllqWUFtclZwMmFIWGJqbS9yUGsw?=
 =?utf-8?B?b0xKWjZhdWtCdTRwam5rVjI2ajFtOGdqN1EvcUpCUUN0YlRYZUNuN28zRWo2?=
 =?utf-8?B?YnhuNng5VVdzdmdrTDlIMXlZRzdrYnV4cENKZEx0dFVwck1UT1hJS1B1enk5?=
 =?utf-8?B?c1lnZmhJcWYxaW9Tc1JPaU1YN00wOHBzdmxVZXd4cWhiRVFPb3dlSGVCK0dT?=
 =?utf-8?B?b2xIYitsWGd5THdBTkpOZmI2Wk1aUlFwK2t5L2lKeXY1VFgzRVVxMmswbkk5?=
 =?utf-8?B?bWhZQXp5eHViSFZkYjdWcVppakpOUXJYVFBYUUpESjlEVjhuTVk0QnBYRUNN?=
 =?utf-8?B?Z2k1R3VQMUpjaXIxTjcvZ1k0RVJiMnBMZEVGVm9UZFJwOUhodk5tZmJOcUNt?=
 =?utf-8?B?M3luc0JMMldkbFIvejNXVWRrOXJmWnlIUmJETU92eDZnc1hHVWp2ZTR5aFdZ?=
 =?utf-8?B?ZkNwNGlrbHVNUC91czJ1Q1crZGw1djJ5Q2Zva2ZHR0tFeVYxNHFnSFJNL3g4?=
 =?utf-8?B?OXY4ajBsWHc2WGF3cFdiQlRXMXNRTnZzc2VyS0ZydllnTVdUSzZZREI3Uzg2?=
 =?utf-8?B?V3dDc09OR04wdjRYOGFUbldadW02YzRSZWpNOXEwUUV0cEV3UU9YMXJ1dDRn?=
 =?utf-8?B?dnJJNDVOeHVLM0FsY0Z1d2pxOHBKbnp0a1lhN3dnQ29yQmdYVDBaYWJpaXNz?=
 =?utf-8?B?UlVHUWpkQW4wdzVKRGVTb1A3QzJwbHE3ODFhVjJMdE5sN2dGV1FBeG1vOGpG?=
 =?utf-8?B?RDBPalRrSnJCL05rWjVwSjI2SUUyNzZEd1BEY3A2U3ZsMjRGTlNHNG5XNldl?=
 =?utf-8?B?R0tRM0ZwVHdpem9rV2VVdVhMVUNpTWVGbUdQY0dYbXZsSU5yZE5YL0tEYUND?=
 =?utf-8?B?SjhWdUVZeG5kWXMxQ3o5cHdwUjRnYnRLTHpYRVhUa0UzQlFsVnFvL2RWRXBE?=
 =?utf-8?B?NGVGNEJNbldoNWZEQUJFMzhiK3haNEVVR1ZLbHhSTHVJUTVHb3dJTjc4b1hh?=
 =?utf-8?B?SDFpMkR5dlNCTkdjdDBLRjlvK1FHN2E1MTRWRzVrYzA1MHYyQ1pQa3dzNmNN?=
 =?utf-8?B?eTZMaC9KblBsRWNQdkxiMVB1cXZFQjZEWUdRN0k1Y2ttL3hFUE1pN21qaHQ3?=
 =?utf-8?B?aFdmNzZleW5FVHJObHh3NEdoT29FcXp3R0hnWGFQS1JBWk9WNndjeTJtdTA3?=
 =?utf-8?B?d0dEeFJLaU5FZ2Zua0RMY1FhNmppc2gzK3RXR2hZK1hCMm9hRE5tYWl4cXpr?=
 =?utf-8?B?UmJvRGQreWdOL25XWFRtVFlhb3dPMnJock0yOVV1dURWbGpFTWxXUlVHcHdK?=
 =?utf-8?B?Vm5TMW9IZjBrN3R6VHd6LzVCeHZsYzE2ZWxxSlF1VVUvem9jV0srWW50d3BH?=
 =?utf-8?B?b01mZWlmaUdJb3c1QmhvcGNYQ0Fhd29uK1ZQaXFwUk9rQW9WSHFPbnFpNitZ?=
 =?utf-8?B?TGZoUi96QXdiMHpGRmloWXJ4UHh2QTk3Mmh1NTRRbENKNjB5NmloSzYvUFNi?=
 =?utf-8?B?dnFCSnlvQURoWC8rRUJZaTFOTWZjenhiTlh1cjEwVmNXK0Z6Qy9oRHJDck1p?=
 =?utf-8?B?dTN2bjFDWWdJeThZMUF0M1NPcFNYZW5tampVS2ptYTBaWTZjd2tKL3F3V1Mv?=
 =?utf-8?B?VVZoNXNYbFBlL1RDN0ttbVhDTmpTMzBrb2RsYVI5MWpKSUN0My9IeEwxSGRB?=
 =?utf-8?B?RG9tNXlLUkh2QzgyOU8rOFEwSm1BSVhoUHdzd2QrNUF4RHlpNmNhV0JqMHIz?=
 =?utf-8?B?N1g3SHQrMnA0YkhJMEY2WWlOdERBQlUzWXdQdEphbVBkSmY3bjNSVGExd0RM?=
 =?utf-8?B?RWNKYStpQmRpU1UzNUNwUTc4ditWYWhuMDBIZjRUclREL3VpTzJ6ZUZ4ZVc5?=
 =?utf-8?Q?LjxCC5k7xdaMLzxkHt9cwzZjpmgUH1COIIjKH?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e09c23d-026f-4086-76b4-08da13c4face
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 09:49:57.4166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAZBfuhzcBtUh8Vj9fdnckPrvx9Ga0OoXz80LECs8qS3AFKRT3xA+fSMIQIEcX5Qvyp6XtXtTCOni3B9P/cYZbhxDEC9LJxNAOxCLyz0zFrnp+kmeQr1gKrlTXSmN5i6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5100
Subject: Re: [Buildroot] Buildroot | ninja build error | /usr/bin/ld:error
 adding symbols: file in wrong format
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 4/1/22 11:42, Sourabh Hegde wrote:
> Hello Quentin,
> 
> Thanks for the update.
> 
> I am following this guideline
> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_systemd_casync-23building-2Dcasync&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=E7Vx6coYDXRY655Egik49UZpZDdQ2JWKiYWJBrFF9kw3yPPVRGS-GvW7LrRZTcZV&s=Rs7PUiLj89kkH7rFu4ocmrVT20cGAtkh-dF1BLw4Dns&e=  . It says to build casync
> run:
> 
> meson build && ninja -C build && sudo ninja -C build install
> 
> Actually, meson-build is successful but while running "ninja -C build" I am
> getting above errors.
> 

Upstream projects usually don't account for cross-compilation and some 
tricks might be needed for build systems to correctly compile some 
pieces of software. So just reuse whatever the build system is giving 
you first before trying without. That means using package 
makefiles/recipes if they already exist.

> Having the actual package makefile for your casync package would help a
>> lot if it still does not work.
>>
> 
> I found this in
> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_buildroot_buildroot_blob_master_package_casync_casync.mk&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=E7Vx6coYDXRY655Egik49UZpZDdQ2JWKiYWJBrFF9kw3yPPVRGS-GvW7LrRZTcZV&s=qykqjQKn5qe2ldZRFFEFO8SkK7wArzNb80WRnjwPc3s&e=
> 
> But how to use this to compile casync?
> 

make casync

if you want it in an image created by Buildroot, modify your config with 
make menuconfig and save your changes, then run make.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
