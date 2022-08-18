Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D15DC00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 22:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1519B4021C;
	Thu, 18 Aug 2022 22:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1519B4021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eul53HI7DX_v; Thu, 18 Aug 2022 22:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C22304015E;
	Thu, 18 Aug 2022 22:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C22304015E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C80251BF33D
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 22:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98DCC418DB
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 22:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98DCC418DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8T4vrqS99xu for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 22:36:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E3641773
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2117.outbound.protection.outlook.com [40.107.96.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49E3641773
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 22:36:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1FwDrF/MH582knAXZc7DtlUhclgPZvT7lbtWqHZKad/gLFl5+12gktp2ZL/MUAC/T3dxvvCYc6xTzMJ5aEeWors/jF0U/AGIlsk8cW+P0dz9pOIN80jx2JEKeA7vdyRlFF9Qr4/lHZAJc6NkxeTMj+A5xWVAgorAwNH300tWF7UpL7kMJhKuMsS6aJ9ICcJWAvrWK76PKZUrfxGT4kjw7khoO8J05WOPinN7ocCo0ZkYipY8mcy1Zo/tpZjVG79i/+AKE0zayB8emAkZflIv/M63OrZa1nifqAXl2xd3FQb+l5GeC7a1mMxdOGUnH0qNKrt3xmNXNU/CALnGl+uMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBp1x2pPAyX260lpGE3q5/u3sBKdk5WhAtQZabE361Q=;
 b=e9q7sgQCSlJUqB74Z7ffUzyv0iAM9w4Z73IvJ3/v01dKE+pAmu1TAxJJddTbm7JW3nEwLIZoDXrfQvoIdgkceuciJeNxXJs7iGpV2yjmDTtZKkiIhg09GuY2Mo6cEBri8pSbW1hYgBRGiZVVr1/0MUozKdL0RqcEXYAnN8E3eMOc47Uw5G6htzUZRMmITy09A3ZB8UgFLMAb0HEOdScqkjkbuLOh9FZBF7M/VgjzxXpUDnY+L8yTQThYgUt1TbQ3z6Kpk6AuAfMAWZFGuys3YoKQTibfhiwRpcK8Ut1wOAsWfqqcCKWyFS4FvN+FOacc4sTdEvRDILO+WXsuEuvq6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by DM6PR17MB3514.namprd17.prod.outlook.com (2603:10b6:5:204::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 22:36:32 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5525.019; Thu, 18 Aug 2022
 22:36:32 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 17:36:02 -0500
Message-Id: <20220818223603.45459-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SN4PR0501CA0041.namprd05.prod.outlook.com
 (2603:10b6:803:41::18) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65dd3657-bb6d-4005-c0af-08da816a199c
X-MS-TrafficTypeDiagnostic: DM6PR17MB3514:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1MlzzVcNmF88cS/mtqmV9CTbYh3LJp2FgEzz6EXLCFrbjnQkCYuxJYMiGHrBHK6Ij5G2eoEDK3Ckl0OR1MjuqN3V44XgQE6LOtJxezDZMW5m30ThqNpduAEv5by6dGxKpnTIhGyOHUhrIqiJcFHZggs4yLQ7DYGitFNgWzErqQnWIVH1tEzcb62bQLvMCIV7b/wlA2bTDJz75r1BkkBq03qC9173OgQS46dPt8wMR0nMtYJoCgXCjOsPapTQPEfUjW5R/t4oabwCdmOuo8D33hiaHBgF71qu3w4VuF3DQfzJv7sn0CoHgqmzGlJTp1Wjq5fcwR9gSRoETeFIM8dHMHjZgdr9q/HozOG05q4QQbXA8ukZIzcPn/GrjdK6Ftg0nsZ7kP4acqytUY/8dh3COKI59B4q5Ygj5vYwJXu/ZFZrI7SZUzqvgsyYG20YfLNtGfgY/9yQnjwG2Ll/C/mJXKpKq498DHL5wSq0NSfk4pugWB0wHS4atnjQlft0cPzNAPgMUt1sO78J108bQCfc4vQnyKbzfj39KnlqSDdUA7SV90esr7tDboBNU6u5P/5gvu71Q3xR9L17UhRVxkwv1s/Gj7MvNGr+LWq1VkrH+SezAD97AaORkptrt/0AGwieyd6c24RS6bMORI6z6czqFjAvXugUXVJB7as39cHUvDqYRCDi6y7w03rm3PMTarYM639CkiP+An6/BwGOAAs2c8vVeU1qRA9zPJRtONm4rArxNqTP2yrNbniOfYy/xesmWQOwqUDl2hOacT0HvEBDJaePg1kWsV4zOGRNy3SQ7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39830400003)(136003)(346002)(396003)(376002)(2616005)(6916009)(166002)(316002)(1076003)(186003)(54906003)(83380400001)(36756003)(38350700002)(38100700002)(6486002)(6506007)(298455003)(66946007)(4326008)(66476007)(66556008)(2906002)(8676002)(53546011)(6512007)(41300700001)(478600001)(86362001)(26005)(107886003)(30864003)(8936002)(6666004)(5660300002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rfkaWq4AC76L93IfZKXh8pZorPWJmthWuHXaS6DdndDZ+oCP3iM8GkBCLMS/?=
 =?us-ascii?Q?/m9PLPZHLoYxntr+8FVbT4EkWMY/lD+crhKfD7PeIIgyzRqL86a7hmFGkAdV?=
 =?us-ascii?Q?VZQCKZSB5+SlDpjCWEkuZ8acZ62h4pADQ2D0i+OhYPvAKuZDfabG874NAxel?=
 =?us-ascii?Q?71ePOkaZbIBBrEDAq3HJJ8Zl12e7IM2y9yohUV0l59uTewJOTddQCUrj1AGH?=
 =?us-ascii?Q?jI2Ph6gn8psApEdroTAdmTIhPmiISpTOMhGLAAZP3H53W0zHQNS0oCn9GLAj?=
 =?us-ascii?Q?8rggpS4O08TEShkFdj/YK8dvaVmC1xC5o26X43gsiQALocnnLU35MfAVfwQG?=
 =?us-ascii?Q?fKpR2URFu7qGZt0aVgcPD5X8wzE9u5BGFQ865xTGxkrLCYe5KxCP4UCNekx6?=
 =?us-ascii?Q?rqaP/CB527+aKhTdkadywqN0ByULhZIgC+WXW00R2NbmPhu4JJCeGxH2CFte?=
 =?us-ascii?Q?e5D1gUtumcsBmHoNT2BceXQK0BawJiLiRIG3pyDcqOoBAVVg4FI3LnEK+6Xi?=
 =?us-ascii?Q?Av3US/eL4n+ItHAqTdYfOQbwbilopNNFJrNR9Z1Zm1XUXti7BDTFIGA1U/L0?=
 =?us-ascii?Q?zqu59UGtzULlnalMK6OgtHfHWePt5XVW/oeZZzkrXU3wU7vsZYoDNejPCzUJ?=
 =?us-ascii?Q?OZKQ95uXRUt5DtBz10+WBdzjVH6shwoVONCoNdFqPEEK/0xdkh/SFCWLcQGH?=
 =?us-ascii?Q?CaA0GQN4jknzeOLaqZnw6jm5XRx4a2+RdZvEtpzp5kaamd3RTBmB6e9zzohv?=
 =?us-ascii?Q?6bhwACtdb3DQ52uSSQY6Dx5pqAFy9/AOPFrJhzp1BpKMvujI8p2vLovKc/at?=
 =?us-ascii?Q?zzLldnan4CseTEgq8PVVzDK6JjrkWldGUIvmQ97eVrX6dfyeeUI9g117TSVQ?=
 =?us-ascii?Q?j/lJQsYLdlwc5rTwNGp3j+1zU8e8dA2fMqZb4aXszFWhRnAls4H1CL/XLf3a?=
 =?us-ascii?Q?goC8+S1KU2XOPoJDvkyxkGZ8QzbWZmrlpj3LUW+EV6tlpVLF/7pjJKamlfrh?=
 =?us-ascii?Q?dwBezqD5LpQLOoWOhWA4UlXuqQb8pbRi4jRr7n3qXpI+pBgRlsTpruLGJA75?=
 =?us-ascii?Q?oTkf2rmYXOZrtMKnXAcA8yZRy55bRP8+msbYOykzW/GJuuYQ5Hkdq0hxOFL+?=
 =?us-ascii?Q?u3kYctZdtp8maaMivxZcuQFvSTO+Jr3dq5tPOsuGFdoB5qYJtsM3rR1NXRpw?=
 =?us-ascii?Q?ZlvqhdBCd/RPWZnvmvdGRrfOwRxTWzo30Es4D6h14iGa9QpdUZuZcyakW+dh?=
 =?us-ascii?Q?JvAip6oOq/Hq21XBO+xuJ1gfyOdmM3vC4NvUANWLQF2C+1ZzmitjFAQREvLG?=
 =?us-ascii?Q?ls11T1WxF/IPGN4/ua/Zzs9ttcCw335XuvBkCSxwlesmV10+7Vk59Xs0CpFl?=
 =?us-ascii?Q?eECBvUA9we+MQSekoSC5JVZGUlTR1SbkCGBkEi2/YUTr0FA7Abp3KbkIrcUR?=
 =?us-ascii?Q?yaCJrbh7QluaIH1FgtAy1sixxXo3OMpy1kXEPZQSM0Os7lnXGTwEtzUrkY11?=
 =?us-ascii?Q?cPnkW0TSMdhtt/mUWyNTYNYO8GJ8WJDAXVU0h6WJUjSvKfV1UBMJ2ZFF3E83?=
 =?us-ascii?Q?0N0YIQKk9xJ0XfbbzpwEtXlSvqolFFYgd3iIA1zc?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65dd3657-bb6d-4005-c0af-08da816a199c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 22:36:32.4284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eBxvmyG7YxDZJageGauYHntNfcx5Key7sPTu6y7cOvQMRH0rR+1i44a32TMQUZD44R5uVuSZg1hATvOWnRtmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR17MB3514
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBp1x2pPAyX260lpGE3q5/u3sBKdk5WhAtQZabE361Q=;
 b=lEC4JJuxCV2OnrnTlZAKj+JkqlaMPfiHW0lS7wMTYYHDmoWSli7m/0/ucLNCCbx32tV2nw0jxSD1R1kZ1OLeb31zYiH9MV5nKm3ed0B8LVYeRvuFIXa0KOX1/pOqxzClo+lJ79n5o7dnovsUdof7d2rh1bkMR/5Nf1HxbvHTAlg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=lEC4JJux
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: Re: [Buildroot] [PATCH 1/2] support/scripts/pkg-stats: remove
 useless escaping of double quotes
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/6/22 16:56, Thomas Petazzoni wrote:
> Within single-quoted f-strings, and within triple double quoted
> strings, escaping all the double quotes is completely useless and
> makes the code more difficult to read. Get rid of all this useless
> escaping.
> 
> The renderer HTML is exactly identical before/after this commit.

Sorry for getting to this so late, I didn't realize for some reason
this was a patch. Looks all good.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-By: Sen Hastings <sen@phobosdpl.com>
Acked-By: Sen Hastings <sen@phobosdpl.com>
> ---
>  support/scripts/pkg-stats | 100 +++++++++++++++++++-------------------
>  1 file changed, 50 insertions(+), 50 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index d32abd7225..572757b7ea 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -886,7 +886,7 @@ function expandField(fieldId){
>  
>  <body>
>  
> -<a href=\"#results\">Results</a><br/>
> +<a href="#results">Results</a><br/>
>  
>  """  # noqa - tabs and spaces
>  
> @@ -920,8 +920,8 @@ def boolean_str(b):
>  
>  def dump_html_pkg(f, pkg):
>      pkg_css_class = pkg.path.replace("/", "_")[:-3]
> -    f.write(f'<div id=\"package__{pkg_css_class}\" \
> -        class=\"package data _{pkg_css_class}\">{pkg.path}</div>\n')
> +    f.write(f'<div id="package__{pkg_css_class}" \
> +        class="package data _{pkg_css_class}">{pkg.path}</div>\n')
>      # Patch count
>      data_field_id = f'patch_count__{pkg_css_class}'
>      div_class = ["centered patch_count data"]
> @@ -932,8 +932,8 @@ def dump_html_pkg(f, pkg):
>          div_class.append("somepatches")
>      else:
>          div_class.append("lotsofpatches")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> -        \">{str(pkg.patch_count)}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
> +        ">{str(pkg.patch_count)}</div>\n')
>  
>      # Infrastructure
>      data_field_id = f'infrastructure__{pkg_css_class}'
> @@ -944,8 +944,8 @@ def dump_html_pkg(f, pkg):
>          div_class.append("wrong")
>      else:
>          div_class.append("correct")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> -        \">{infra_str(pkg.infras)}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
> +        ">{infra_str(pkg.infras)}</div>\n')
>  
>      # License
>      data_field_id = f'license__{pkg_css_class}'
> @@ -955,8 +955,8 @@ def dump_html_pkg(f, pkg):
>          div_class.append("correct")
>      else:
>          div_class.append("wrong")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> -        \">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
> +        ">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
>  
>      # License files
>      data_field_id = f'license_files__{pkg_css_class}'
> @@ -966,8 +966,8 @@ def dump_html_pkg(f, pkg):
>          div_class.append("correct")
>      else:
>          div_class.append("wrong")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> -        \">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
> +        ">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
>  
>      # Hash
>      data_field_id = f'hash_file__{pkg_css_class}'
> @@ -977,8 +977,8 @@ def dump_html_pkg(f, pkg):
>          div_class.append("correct")
>      else:
>          div_class.append("wrong")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)} \
> -        \">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)} \
> +        ">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
>  
>      # Current version
>      data_field_id = f'current_version__{pkg_css_class}'
> @@ -986,8 +986,8 @@ def dump_html_pkg(f, pkg):
>          current_version = pkg.current_version[:20] + "..."
>      else:
>          current_version = pkg.current_version
> -    f.write(f'  <div id=\"{data_field_id}\" \
> -        class=\"centered current_version data _{pkg_css_class}\">{current_version}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" \
> +        class="centered current_version data _{pkg_css_class}">{current_version}</div>\n')
>  
>      # Latest version
>      data_field_id = f'latest_version__{pkg_css_class}'
> @@ -1020,7 +1020,7 @@ def dump_html_pkg(f, pkg):
>          else:
>              latest_version_text += "found by guess"
>  
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{latest_version_text}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{latest_version_text}</div>\n')
>  
>      # Warnings
>      data_field_id = f'warnings__{pkg_css_class}'
> @@ -1030,7 +1030,7 @@ def dump_html_pkg(f, pkg):
>          div_class.append("correct")
>      else:
>          div_class.append("wrong")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{pkg.warnings}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{pkg.warnings}</div>\n')
>  
>      # URL status
>      data_field_id = f'upstream_url__{pkg_css_class}'
> @@ -1045,7 +1045,7 @@ def dump_html_pkg(f, pkg):
>      else:
>          div_class.append("good_url")
>          url_str = "<a href=\"%s\">Link</a>" % pkg.url
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{url_str}</div>\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{url_str}</div>\n')
>  
>      # CVEs
>      data_field_id = f'cves__{pkg_css_class}'
> @@ -1061,11 +1061,11 @@ def dump_html_pkg(f, pkg):
>          div_class.append("cve-ok")
>      else:
>          div_class.append("cve-unknown")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">\n')
>      if len(pkg.cves) > 10:
>          cve_total = len(pkg.cves) + 1
> -        f.write(f' <div onclick=\"expandField(\'{data_field_id}\')\" \
> -        class=\"see-more centered cve_ignored\">see all ({cve_total}) &#9662;</div>\n')
> +        f.write(f' <div onclick="expandField(\'{data_field_id}\')" \
> +        class="see-more centered cve_ignored">see all ({cve_total}) &#9662;</div>\n')
>      if pkg.is_status_error("cve"):
>          for cve in pkg.cves:
>              f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (cve, cve))
> @@ -1083,7 +1083,7 @@ def dump_html_pkg(f, pkg):
>      div_class.append(f'_{pkg_css_class}')
>      if pkg.ignored_cves:
>          div_class.append("cve_ignored")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">\n')
>      for ignored_cve in pkg.ignored_cves:
>          f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (ignored_cve, ignored_cve))
>      f.write("  </div>\n")
> @@ -1100,7 +1100,7 @@ def dump_html_pkg(f, pkg):
>          div_class.append("cpe-ok")
>      else:
>          div_class.append("cpe-unknown")
> -    f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
> +    f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">\n')
>      if pkg.cpeid:
>          cpeid_begin = ":".join(pkg.cpeid.split(":")[0:4]) + ":"
>          cpeid_formatted = pkg.cpeid.replace(cpeid_begin, cpeid_begin + "<wbr>")
> @@ -1121,33 +1121,33 @@ def dump_html_pkg(f, pkg):
>  
>  def dump_html_all_pkgs(f, packages):
>      f.write("""
> -<div id=\"package-grid\">
> -<div style="grid-column: 1;" onclick="sortGrid(this.id)" id=\"package\"
> -     class=\"package data label\"><span>Package</span><span></span></div>
> -<div style="grid-column: 2;" onclick="sortGrid(this.id)" id=\"patch_count\"
> -     class=\"centered patch_count data label\"><span>Patch count</span><span></span></div>
> -<div style="grid-column: 3;" onclick="sortGrid(this.id)" id=\"infrastructure\"
> -     class=\"centered infrastructure data label\">Infrastructure<span></span></div>
> -<div style="grid-column: 4;" onclick="sortGrid(this.id)" id=\"license\"
> -     class=\"centered license data label\"><span>License</span><span></span></div>
> -<div style="grid-column: 5;" onclick="sortGrid(this.id)" id=\"license_files\"
> -     class=\"centered license_files data label\"><span>License files</span><span></span></div>
> -<div style="grid-column: 6;" onclick="sortGrid(this.id)" id=\"hash_file\"
> -     class=\"centered hash_file data label\"><span>Hash file</span><span></span></div>
> -<div style="grid-column: 7;" onclick="sortGrid(this.id)" id=\"current_version\"
> -     class=\"centered current_version data label\"><span>Current version</span><span></span></div>
> -<div style="grid-column: 8;" onclick="sortGrid(this.id)" id=\"latest_version\"
> -     class=\"centered latest_version data label\"><span>Latest version</span><span></span></div>
> -<div style="grid-column: 9;" onclick="sortGrid(this.id)" id=\"warnings\"
> -     class=\"centered warnings data label\"><span>Warnings</span><span></span></div>
> -<div style="grid-column: 10;" onclick="sortGrid(this.id)" id=\"upstream_url\"
> -     class=\"centered upstream_url data label\"><span>Upstream URL</span><span></span></div>
> -<div style="grid-column: 11;" onclick="sortGrid(this.id)" id=\"cves\"
> -     class=\"centered cves data label\"><span>CVEs</span><span></span></div>
> -<div style="grid-column: 12;" onclick="sortGrid(this.id)" id=\"ignored_cves\"
> -     class=\"centered ignored_cves data label\"><span>CVEs Ignored</span><span></span></div>
> -<div style="grid-column: 13;" onclick="sortGrid(this.id)" id=\"cpe_id\"
> -     class=\"centered cpe_id data label\"><span>CPE ID</span><span></span></div>
> +<div id="package-grid">
> +<div style="grid-column: 1;" onclick="sortGrid(this.id)" id="package"
> +     class="package data label"><span>Package</span><span></span></div>
> +<div style="grid-column: 2;" onclick="sortGrid(this.id)" id="patch_count"
> +     class="centered patch_count data label"><span>Patch count</span><span></span></div>
> +<div style="grid-column: 3;" onclick="sortGrid(this.id)" id="infrastructure"
> +     class="centered infrastructure data label">Infrastructure<span></span></div>
> +<div style="grid-column: 4;" onclick="sortGrid(this.id)" id="license"
> +     class="centered license data label"><span>License</span><span></span></div>
> +<div style="grid-column: 5;" onclick="sortGrid(this.id)" id="license_files"
> +     class="centered license_files data label"><span>License files</span><span></span></div>
> +<div style="grid-column: 6;" onclick="sortGrid(this.id)" id="hash_file"
> +     class="centered hash_file data label"><span>Hash file</span><span></span></div>
> +<div style="grid-column: 7;" onclick="sortGrid(this.id)" id="current_version"
> +     class="centered current_version data label"><span>Current version</span><span></span></div>
> +<div style="grid-column: 8;" onclick="sortGrid(this.id)" id="latest_version"
> +     class="centered latest_version data label"><span>Latest version</span><span></span></div>
> +<div style="grid-column: 9;" onclick="sortGrid(this.id)" id="warnings"
> +     class="centered warnings data label"><span>Warnings</span><span></span></div>
> +<div style="grid-column: 10;" onclick="sortGrid(this.id)" id="upstream_url"
> +     class="centered upstream_url data label"><span>Upstream URL</span><span></span></div>
> +<div style="grid-column: 11;" onclick="sortGrid(this.id)" id="cves"
> +     class="centered cves data label"><span>CVEs</span><span></span></div>
> +<div style="grid-column: 12;" onclick="sortGrid(this.id)" id="ignored_cves"
> +     class="centered ignored_cves data label"><span>CVEs Ignored</span><span></span></div>
> +<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="cpe_id"
> +     class="centered cpe_id data label"><span>CPE ID</span><span></span></div>
>  """)
>      for pkg in sorted(packages):
>          dump_html_pkg(f, pkg)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
