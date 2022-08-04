Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7495FC19F2B
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 11:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00289408CC;
	Thu,  4 Aug 2022 11:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00289408CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqGyGQbdG65N; Thu,  4 Aug 2022 11:58:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E48AC408A3;
	Thu,  4 Aug 2022 11:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E48AC408A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7ED391BF255
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 11:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 665BC80D69
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 11:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 665BC80D69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjtrnQBJG_aE for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 11:58:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED6680D5A
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2083.outbound.protection.outlook.com [40.107.114.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ED6680D5A
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 11:58:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/I5noXlX2abosU194f51veZFy5IS7TX9+YXhQlMJ8x9VRZB+1mEgLWJDiy3rtHIoOmfOPAF/pkNRFN+0JMcC5j9XlBjS9EFx/scwSI1K00aFn9GWkd2mfupeGbd1JAGCw6dg7peH8m4Cep4jpi/wSDt2qgIpeE75F7UDKtYBy42KJFA3EvMnUlij2WdIuKbUdXrSlnQ6WGQBRV0mtTuaqc47NYpzWeBIh2ywyXQTMapk/1MrDrj1Siw+aZf/1SrCgY/37CKDEsyC5+qg2HW5w6vNbbTCtCEgNdiMJRIkBG+0OnKhxAUUxH4rrY7bmvpFsByOP9q58leXSG0jGkoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pEf905OcADKyNFcBs5mphTNTxLKkIMZWmJOOiWdWPY=;
 b=kzr5IeWvpAwAn0JjnjTxK5N53qVXSQyTA+Gk0vY0+n7Zp6/aDdx3aNKxjaT42c3vqpCUqNfh29W+bv0zTNTCwFOIIyFtUNpSq/7NvV7c3v4Kvn2vc0+lqZnkpfraWjDYw7GEAyvjr+h+BlrNwY4hrdHpo5A1xglCtN4Ajhw4ZJ7q2buvPT+PofZaRXqk3OSsDamZTyUcVDWOVBpbbQ8dQQ0DbsIdy6ErSMzFoTKh2dLDBkASCRI1Q66mC4bnuKRf2I+rNhjLfJGC8R1ElJ/n9uxJARAn3l9c3sqmc5LEqwVBWdnYiIK47IitOVYvAxU0Wn3sVDTn5RbAiesRsPgfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sord.co.jp; dmarc=pass action=none header.from=sord.co.jp;
 dkim=pass header.d=sord.co.jp; arc=none
Received: from OSZPR01MB7049.jpnprd01.prod.outlook.com (2603:1096:604:13c::13)
 by TYCPR01MB5694.jpnprd01.prod.outlook.com (2603:1096:400:41::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 4 Aug
 2022 11:58:41 +0000
Received: from OSZPR01MB7049.jpnprd01.prod.outlook.com
 ([fe80::b5a6:325b:bcb0:e238]) by OSZPR01MB7049.jpnprd01.prod.outlook.com
 ([fe80::b5a6:325b:bcb0:e238%8]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 11:58:41 +0000
Date: Thu, 04 Aug 2022 20:58:40 +0900 (JST)
Message-Id: <20220804.205840.1377195008687521594.atsushi.nemoto@sord.co.jp>
To: thomas.petazzoni@bootlin.com
From: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
In-Reply-To: <20220804125707.7d37891a@windsurf>
References: <20220804.150530.297560290822781428.atsushi.nemoto@sord.co.jp>
 <20220804125707.7d37891a@windsurf>
X-Mailer: Mew version 6.8 on Emacs 27.1
X-ClientProxiedBy: TYAPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::20) To OSZPR01MB7049.jpnprd01.prod.outlook.com
 (2603:1096:604:13c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4966087-713f-43f8-8766-08da7610ac90
X-MS-TrafficTypeDiagnostic: TYCPR01MB5694:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k1QmVGukj6vP2GvC8FYvq6MFE8X7OpALwtezORRe/qSu6d8h4uqnx7rgizEkQGoZ3Y1kYNlBVqu8Ugzzm5OloCAeFlL+qv3fwX5ne453vQp37+3IjemV+/3V1VZFHp+q3yrMvB/ljq2yMV6vO77IvwMZ2qH/94+HiTTInn2qkj/LH0FlG8P11Qt7jTr0LgnQfVvUmMKoG0TNOm0Db7wJpwCB/iAxNTZCluitAJxHbo1El01JMGiHKvkRYsaxZ00uc1rmvl04pTvGzYt/VIvNVqtB9Sa96f0wY/gJAAejrbLOFftQlXA/v9JUjNEXnE5vES+EM2CGQnNMLn1bMlxla6KMr3NBuWdJX7xRPmP55nrjugo+sYYBzIeTTezaTJ8MO0nZr6gptWr1b1cxO8JRLJ+G4hUNXq7dz0z1ItsQt/C3xs2H4jOAzgDScZCVcin+Uwb66oF1OyHZp0J9sK8hW7/u4urkczeC2eJFjJ2BoP6Ctaue7FgXRdaPdpiwY4O2yCZbA+kofRwCfKTgAiVFWOTxS51J0rSbP1FWx2JlJVyMtXUcCvekpv5dztwvQSCZzqaGHquFkqGIg0SW+cnhsekbNhY43Mio6rXF9aZdl2xp1KCwknydQvBXIZgLqwUkzfN7cnL7nn9BgCvw/OOTkSbgxrTA0EE2dze+hRIF/dJUnkBSLAlibSGDbPi/niQRMKhZ3ONbTOQ6NXs5X4GBnjHv+WSCFsUOOuMgZphujEfYj6NfV+O7kFKirTnvXcNYBhtkbaajLE8zG0FWUUIA3YrkOu8Lo8MYE/2iJki7OYuhaCtypcT1Uj3agEmKu0qscEzuuj1EGdBMH5p5/MfeNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSZPR01MB7049.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(39850400004)(366004)(396003)(136003)(6916009)(52116002)(26005)(6512007)(6506007)(86362001)(41300700001)(316002)(6486002)(478600001)(38100700002)(38350700002)(2616005)(186003)(103116003)(4744005)(5660300002)(2906002)(66556008)(36756003)(4326008)(66946007)(8676002)(44832011)(66476007)(8936002)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IR0/rvm3SZQzh3NmPiQx7ePmdLYr4LSvf7hrPgRkt1MqOhryq2fVW5OBqqPR?=
 =?us-ascii?Q?wfJR4Ho8W/Dv7+qQeDxcEtgoEevm1k42c6RuCdwDRV+oQPcrSzl1Iu437nqL?=
 =?us-ascii?Q?b9MDfK87hA20/SaAFA3U3AvQj5iOCZ6i9yDSKe41XPwv34vWT/ASidFxgJKE?=
 =?us-ascii?Q?4XW47breZaXidUy3zNII228JmrRqICZYnsBN2+AkXUVDTF7dUVaUa8Or1p6D?=
 =?us-ascii?Q?oYNYqMkUiQ/6ncAXlGRGG9Pe3X4BBWPbMkNcWW4KQHJJovr3m/SpWQjnG1/D?=
 =?us-ascii?Q?Ln/rvVzv+kFPira5QOwn6Qfx9ZYZaO5Hoe/Zmh3Gd49B2J7AI+fxx1mKIcG8?=
 =?us-ascii?Q?OyQ7l0grMmBbZO3KtelCZ8oJLJNkG78Rm2ugQyXObNL8FJ0f/fgI1kjemYK2?=
 =?us-ascii?Q?F8xPBbA8qM00koR63DGJkYHC4DrmK83oaJnV9py1vzaFHUfh2c29rneMBetk?=
 =?us-ascii?Q?zdU/5FhfoBX1RmvkA8mIqZk7BMvjlSkdF4gc6psj2WlRwQZoLAIdMUwAZXgr?=
 =?us-ascii?Q?J+DlcbWyRnExqDykk6VNnIxVkuicnPUJa4m21g4n5rXuWuvwUgXIGiDEKmVK?=
 =?us-ascii?Q?JAEX0V8Z/jJgcLaWKYfxaMyKhYUAAn7+k8dvw5ka3FWRJZ0a8ncmvAX6bag6?=
 =?us-ascii?Q?YVl3jETl4uUSILlA5cFOZoSg4qeglZGGqU4O0gVc80j9QssDmGMcHUHD6dfT?=
 =?us-ascii?Q?EYOoBQPGRYBrXVbR3+1x6s73oUKEEVxWbbE44Ezo8uLjGKVXkVLJrVC9rmwA?=
 =?us-ascii?Q?OuYDR+MLINhVbBwjsBH1zUeP0nzDTV9jY+Z3CvIXZsqtZjsC76POkXVsjWC8?=
 =?us-ascii?Q?8CFm2fIgTQmNKFXPCA6eLXjtgcYf7sJPNQrt4cx+OP0hwlMj3+8zCDTBACMh?=
 =?us-ascii?Q?lWulK11Cvzk96FxiGWqomBVKok+d+ba+ypM+JfaRjN+D7JYRJWY26XX543UB?=
 =?us-ascii?Q?oAi6AqO/zPXstmmb9wXw8rALa6Q4+Eig8ZGy3gBjltZcsQcRjWXGGeTPFHwU?=
 =?us-ascii?Q?8PHdHKrkMihTdhGUj3p0DUuEUUnywfoQjFQH5PlluJljHobJE8u2qBkbaSDc?=
 =?us-ascii?Q?Y4HenCqNJ6I/227rbqfiQGpJjt94RFQIDxfiJRVdzHmJCy2S63gDtXEAm45y?=
 =?us-ascii?Q?7X19WPYvKiiYjsxtzzxJ1cBaDvFtbBO0ocD/MnIyr9elWJgAvhbK9Ykb4alu?=
 =?us-ascii?Q?/e2ZbAYp+clrDe4bcLawsh4rhMdL6FS8lG7haW9gJnGyDFkPhTRhcnKa6CkL?=
 =?us-ascii?Q?lUGxGbKEc7pe7HR4rOQJJaDvF0iK8JIQB1RLtaD6Uu1UY3HtDa5g/wq8L5OA?=
 =?us-ascii?Q?qQ0oqveiHZQJsOr29yyB6Tkk8NHBERkEe8H0lndJjDXPSHT6ws9orpjzb5NT?=
 =?us-ascii?Q?RX/Ftxsw9OrboudtIrspLPDw1OT4/aDHRwdMHW7QU04A5SAUJbzEbRMXKsjT?=
 =?us-ascii?Q?0KfOP6n5v/gdB9o7yO2W6xR3KZcmnYXBC0JpA2/qTQjbcEDN2pYsP/kv624C?=
 =?us-ascii?Q?5IYCmsNTcoK5tP1xo4RYXMc1PAECU/qaUANTEomqwM6fFLwM3TkO1dd1kyqY?=
 =?us-ascii?Q?ikYU1NkcYoRzjj2zAHNdqBX4abOvYewa6lt/7bIbC4XDguwhOpYASoD9aDHN?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: sord.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a4966087-713f-43f8-8766-08da7610ac90
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7049.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 11:58:41.4303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: cf867293-59a2-46d0-8328-dfdea9397b80
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KxIH8HtUjvKBUJGjr1uUvBnSfLjQNpuibEgD1SZ6vJ2gowqMVOt8eHFr/FPUdoE8aovYFZF7lGhPZ3A6gfaXA0hSAVvYSngjr0rQHrmWWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5694
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sordcorp.onmicrosoft.com; s=selector2-sordcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pEf905OcADKyNFcBs5mphTNTxLKkIMZWmJOOiWdWPY=;
 b=H1rp6V52upE8J5tbd92UFxCbLCt7WYzOXy/bszGYMemOrR01zSTaaHo2qwkm9PZ78SckbeKpX6JJTwcTr3NITUDqJ7akXBn0RyyGRBcbawjRLzWPawDXCo+F7Z1AlbloDwj4MfZNGKp6GSzrsVRLBh5vhkaSB1pWSWGfL+rBTYI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=sordcorp.onmicrosoft.com
 header.i=@sordcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sordcorp-onmicrosoft-com header.b=H1rp6V52
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sord.co.jp;
Subject: Re: [Buildroot] [PATCH] package/uboot-tools: fix dumpimage for FIT
 image
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
Cc: matthew.weber@collins.com, fontaine.fabrice@gmail.com,
 yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 4 Aug 2022 12:57:07 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Thanks for the bug report and proposed fix! Could we try to keep this
> in the style of what is already done in the package, so something like
> this:
> 
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 7cd527ad12..b6429cbbed 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -33,7 +33,7 @@ UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
>         STRIP=$(TARGET_STRIP)
>  
>  ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
> -UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_MKIMAGE_DTC_PATH=dtc
> +UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_FIT_PRINT=y CONFIG_MKIMAGE_DTC_PATH=dtc
>  UBOOT_TOOLS_DEPENDENCIES += dtc
>  endif

Unfortunately this does not work as expected.  Yes, I tried it first.

Maybe CONFIG_FIT_PRINT=y affects Makefiles only, not C sources.

---
Atsushi Nemoto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
