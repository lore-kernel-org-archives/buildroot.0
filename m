Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A71C636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 15:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED0A341558;
	Mon,  6 Feb 2023 15:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED0A341558
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sicGT0Y88FFf; Mon,  6 Feb 2023 15:18:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38E5408FB;
	Mon,  6 Feb 2023 15:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F38E5408FB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B95041BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C2E281235
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 15:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C2E281235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYF_nGph6k82 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 15:18:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BED2680C3C
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::604])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BED2680C3C
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 15:18:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzhqFy64Rn/fZYgzEcHG5mg0tZJwFec5w2PMawcWIimiZFG8Ov9lRzQY5FtIzNNCg9agkTYwr685liHfawuZ78/KBHW/GEiJS8LmVkEpQeLfaCokl/oPe7r+rSvBwURBDSgMbSHL5J+izLedZImVckCLvNt7FNNMoJREpB/D3BTaeAX4Io6hcAVJrFIeFvts2qvxsn56CKfA5rjQbVVhxd5J8/MUWcGhHYqZtN19hp+g+Vt2NB2uC1rUg0dk/ijS2TrrnZjzF6ja77qm0NeicgpzRDmI19h0CPD5NR5qXnuS0+y4+0kkONzIf56SZIPd8dUNRQ39wNolNilPm1MAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ulBS5R2bPqVP191IjQCv2Wau90tBxwg2dijSqJil5k=;
 b=c6H36uR8+Gk87zzV2Pe3nhaG3J42gNNQY5rrGsvCntbO+7VCk30oHKBtFjvkdCiWO5wzmPHBxg6LAbncPEUfvVWbSEiLpU1HemFMArkG6xYeFPx/iAm3+MseU9ErPomV6rL27WeyPgjzDZma8NkyaKjZE4pCfyP9HrKJBSIbk1hBfaP9EDRXT4/xc26La6NxZQa2HSUVo9ELrB+hDIgYqGb/UeUS7daJvowxm5sSMfa76CAgWByLzF00rTQo06xHUNB+W4n3c3AXMEk1FZ49FlQVefqfp4hIF0WHfjGc6H0PcxWliF921pur+KGcI6PzgAZPyBSx6U1rXFn2nMGnnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8499.eurprd04.prod.outlook.com (2603:10a6:20b:342::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 15:18:36 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%4]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 15:18:36 +0000
Message-ID: <cd550b66-e9ff-da45-8477-567f92f0d1c3@theobroma-systems.com>
Date: Mon, 6 Feb 2023 16:18:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
References: <20230206151514.1579632-1-marcus.folkesson@gmail.com>
In-Reply-To: <20230206151514.1579632-1-marcus.folkesson@gmail.com>
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa0ccec-76a8-42a9-c3da-08db08556ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGRUDoekwzhAzqIEGqewXFhaWr4o+kr8IQxv9PxK+iXgHTIyuq7xZro/9HBJYkDUlMjqgmag8sy64vFpTcBFsgIf6XDsGUkDVxLYzIe169GtFMMDF4m2YmjJ1j+1J+JmnKVc+wxlozZHB63BqrMB+tGmtENRsITB/Fickq3Vrv8n28Z7lKEM0AmeD8Ar2Xo1+TEEWb6xMVkVqhChUVW0ctkebGQ/RIG2XJyOEgXQcQlbE6PhNde4Ac+qzdRn+whMzNjLpRo8ERi/Cj5+fHj90V2vTZLIry2Za65+HDo8ALQrwb/hdCMs5O4GcnQBys1qm6rdbrbdV+94LBIXCERH2W30mxoBfSu7QNmOxA7kNy0ubJzWcvn8TfO/RNpIDN08wjoJoAEZ729NBJ8EuhGUpo3Nuutl3LBm08PPYeADWymz084nLB6ENaDLQMzSUeLwQ+cY8ZAzxaPWuyhal/x5O33tYIa07wVP6zOk8Jkok2mcYS6VtO7AIqSIKX5MmdAM7i7FkHmbFfeO8mor3WpR6Lmb+ruUlus8Twy1Mnjr9WRlJLEBz6/AMo0JnVisqCQ506aIH/4sHTBF+NuUe47k4ZomJK5fcYtiwYHjEJyYrlkepB6M0dxVZTFwCSr2+4VJkGzbBbfA3D19bLFL2zqGDtVJ6B8UtSLIlUWSaBMatM0ijWFceoH3XtTCdelZG7IiRBpIRslsPETme0gPOyVMkbiD+qoy1eERMXLoqNz896I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(451199018)(86362001)(31696002)(38100700002)(558084003)(36756003)(316002)(2906002)(6486002)(478600001)(5660300002)(66946007)(6506007)(41300700001)(8936002)(66556008)(6666004)(8676002)(4326008)(186003)(26005)(6512007)(44832011)(53546011)(66476007)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEM5UXlCZFdtZzJZMW13TG11bXF3cVRXcG9TTlJabVJUdGh0aWlLOVoyaHRL?=
 =?utf-8?B?ODYrV0huZHNkZXh4R0d2NEdFbG9YblJPTm5BWU5aS3hRN2NqWmEvMnVSV3Ro?=
 =?utf-8?B?SDl5N3huajhXSzVVNkZ2d0taSE8vTnBkRWdZbGp0amlnUlVKdHIxaEFNRFZI?=
 =?utf-8?B?QUc5bkZGWFFPbjI5ZzA4SG5oWXQ2UVZkUEtNdENSTmxGL1IycUpzOUkyVnlo?=
 =?utf-8?B?R2hsZkhXZUxYVXpDVVZmQ2toWWZZWVZMSUpVMFpXRnFQcStKZXpMKzZXQ3RD?=
 =?utf-8?B?Rk9IeXNDSU56TFZqSWJSNDArKytpSVlFNGI3S2xiR1pYT2xBdm5iS1BJSS94?=
 =?utf-8?B?YUlCVEJnK3R2bXIvTkpDR0Y0UHRQejZRdmwrTEVleXZ0cWlUbnZDeC9ZdTRx?=
 =?utf-8?B?VGJtdHJXa01JbGpRdmZ5aEhEeEhBQkZiYlBsV3Rwc0FWS05OY3BQTnRkc0FX?=
 =?utf-8?B?bGQ1bjBVeGdxMDBvZFkvczdlYXk5OFdDQW1hRVZaZENzeEtnWkc1L2NrTlNX?=
 =?utf-8?B?WEJ2Y1Y5Z2c0OWorYXZNV095OUQrSWJQYUlLT21IQkZlSzFLbFBGWkxoRHVN?=
 =?utf-8?B?eDRKdmNBNHJJeHdGWGFYWXBoZUQyWVJ5WDkzbE55aGlldnBPQTdaZGVSM2l5?=
 =?utf-8?B?azNuajVzNDJkWS9GNE9SUUhXNlJ5SlBBNVdOdm5WdUtEVCtQOG84eGNhNlhM?=
 =?utf-8?B?enNmTG1SQTJudHVCTUE4OFZreGFKb2c2RWFhU2lJeFEvNUhkeXFIWGNNVGZ6?=
 =?utf-8?B?NlVCY1kyU3hLUkNGRzdtWnhEUnQ5UmFnUDZPOXdXN3dmc25hM2kwcDZqZzBp?=
 =?utf-8?B?ZGoxRzdCdmhyRWx0UmQxTWhKQ3lrWEd4UzBvVjQzb29PbUppQjJqOVlBMjNs?=
 =?utf-8?B?MHRCUjIvUnJaOHR5Z2gzMWtIVUtaTVVXNUU4amFScFc0UWt3TEVtNWp4RUY1?=
 =?utf-8?B?VEJ2VWRVZUpIdTZ2NWRVMGJtYXdyWmpVdW5SVHBBcWo2Um9SMlZEOTFHV3V6?=
 =?utf-8?B?M0l6K2tGbzNUclFqSVVCM215MERRYlZpejcrb1dmUEZRSVNqalNqci9RMSs3?=
 =?utf-8?B?enNZM2hHT3hNMituRTVoUjlGbE16a1VML1ZrUlBqN1RiVFpwWHNpY3RQaGhq?=
 =?utf-8?B?TDFUZ1d2ZmNoYjdlVFhkYjB3YVVZdG1nWERaSmtBN0grank3TFhnRVRwMEEw?=
 =?utf-8?B?S3lVVDkzT0VxYlpCcTlMTW1RLzdUSmpYSTBUdHp1ME9kWlNzTEhaNXhFa3Jy?=
 =?utf-8?B?L2NwU3Nobis3aCtIYlZGM3pFN0kzRFBNZnl2R2tiQXNud0RIWVpzMFJrVDBi?=
 =?utf-8?B?bDVSWmlldThWWnM4VVhMNE4xL1phdDZOb3B2TDV5VUdSSDF6WGxyWTRDM1Rx?=
 =?utf-8?B?QmFXUTlyYlU3eEhDNys1MDl0cnhNbUdDYUZQQVlHamJMUzFBcEhDTDZia2R3?=
 =?utf-8?B?Z253czFpNCtsRUhUSzNYTlhFbmJ3NzBEaGlIbEliSk9vOWdDNFlrVHFTdGhn?=
 =?utf-8?B?TThCY3dEK1ExS0k0SG5CcmRlYjFwT3hRSFdnYTR5WDV6OVRmNHhlZi90QW51?=
 =?utf-8?B?OVN6bTJtZ0JzaitpNTlXbXI2WkNSRjdleFRNMk1KUDVwWlZkVzlTeVJxY0pL?=
 =?utf-8?B?b2dlcGNjKzBTaExPUHdVNnNXdkcwN2pOSEpTamdMSFl2WkNQS3FzQTQvRXpT?=
 =?utf-8?B?d1gzSTBOVERwcE1TMVNxS3ZOYTNBelJUQmVsbFoyajdUeW5GSlYvRGg5SkFM?=
 =?utf-8?B?ZzRlZGlGeTV1N0h1VVpYZWtpQ1U2cnFBWmYzUlY3emlPNlBLSWpJRFNTMUhv?=
 =?utf-8?B?TjBWbDhIZHlzZ3g5Y3psc2plMkxmVFl5R0h6RmtRQVhKRkZHcU5WV25lSXpH?=
 =?utf-8?B?aSttdzg1MXBHUUJFeUtNenBMNkwrdTlGV0lHRTRVY1J5N01acVR2T1NDK3R0?=
 =?utf-8?B?b2V2ZHpYYjFUNFRsUWt6RjJXVXUrSXp3TSt4MUZ5QkhlNEVlT2dQbU8xZVZR?=
 =?utf-8?B?cFlYVzFMZHJZQzg1cENWaUVLZmhTQzA5QkUzSzVyd2dNOEpyck5BU2RGNlFv?=
 =?utf-8?B?WWprZUFWU3VITXhDVnY4ZzhCNFM4OG9wK09mekFrUmxIb0lLOUdVNFM0d2VK?=
 =?utf-8?B?NTdXd3FSbWZTVDJqUnoxU1NHNTNFWWVXbXgyTVp0M1VmcDVWU0FFK1N6TnBs?=
 =?utf-8?Q?/kAUwiHLSmrMTSv5qCnwcJw=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa0ccec-76a8-42a9-c3da-08db08556ae1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 15:18:36.5541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFk1jtiKgyxctd1AVX9wAZMnwn76CpXOcqlcBrtGFICVJ+Z8dVSXMvLdqhsWS7KFGT4krgA6GQgAn21LIkNATr4VReTucDmf3D5gK6bEf1SmhRv5BHqT1O0ZG5yJoEKX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8499
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ulBS5R2bPqVP191IjQCv2Wau90tBxwg2dijSqJil5k=;
 b=KHygzM4B7kNdv/9rEsqqtQ+j1HuAlIUULpf8PCQ3UFRT87lm8ktH6pOiTmdthkTa/iKE46nBQADwofL1FJ2wRZlrkTp9cn/CmRVN4eGgko0RXV9Txe5AdpVRk1GFxo78wso44MqGbbbpf0dpsv+CriMVvdsb8Xz6u/TweUOOBMguGvUWJoRcj1TnmEnPNEth1XKrnGakM3C+PMZk6WLJvAsijgmGPZyeHcr0Zg895gy7pd65BzzYAp0+wXRbRamNsadYR+w66kDzO4u77d9zaqooYa1dXSM9kdFBa4geSpG4MxOqH+H6ZnIOyme3C+f7Djzmsk5KaFLUnFZsK8lJww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=KHygzM4B
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH] package/libcamera: bump to version 0.0.4
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,

On 2/6/23 16:15, Marcus Folkesson wrote:
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

You beat me to it by like 5min.. I was just writing the commit log :)

Reviewed-by: Quentin Schulz <foss+buildroot@0leil.net>

Thanks,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
