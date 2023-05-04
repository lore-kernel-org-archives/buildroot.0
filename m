Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F67C77B78
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6068361510;
	Thu,  4 May 2023 20:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6068361510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HnwlSUsNdT0f; Thu,  4 May 2023 20:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90FB96168F;
	Thu,  4 May 2023 20:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90FB96168F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71E871BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4858B42726
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4858B42726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zAWwrr52L1A for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:07:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0A3242723
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::700])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0A3242723
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:07:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4FXcWzYiTlRYHo2Y3Tn8ZmDagh2YhONnYqYVoXbWL2jEyLBJO8mLpQ/JffqKFrmHv/o5YprePwWj01x1kG8YXJNCFCqv/BUKHT46RHl0QxuxD8PJ77a3ZDZigsg5dgP4S0b8vWzrI79bvBOrpUP3+Q+SASWmVdjDWVweyPfkl+8GIGqC72d5bfCngwJD/VFM7hU12QwfQdzFDDv3hH3iUXkshl4eSNUIZOoxXK+yIm+WIqhIaUxIBaOCS4Sj4eJko1JLXQ3hW7Bj8hMGZ7KXyfkhirOQW85czVm1XBrBP5rtmrZJlSzZeiCSoV0xxCbC6Bp4PRQWw8NI4gw+AR1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNDfsfHsWBbry1/9dSgPWXadZizIv6Ea5L6NdTkweAE=;
 b=iJJeTz9Q68r+c7TYUFwm6qf90gkJVk0M5ZDYn+7Pz8dj4d/o2Np8YXnNKeJnbRQj8LzAsPYETe4/unDxf6j/7lJABMA2VlCLt0iu15aoq+lHG7XByrOuLkPOa8hXY9xTsilw1TyoQy3FxyylNrranH6er4HrVlc+JP4kstJE4YLx63o5G9MwqWU89fDgP5PAqeAdf/EmohkkbY+k2zWAloO94VoDcK92KyusnH/ukE17HhTyBmWKgySap/8iNiIxDEkAQaFvpyhgYG/9TU5hgy9ALBa21cdlMc8XIxLVdYs5KjirIFnMZAM1CrPUYMl0Job7ri/EPOY7xp2aJ2ljnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by MW4PR17MB5578.namprd17.prod.outlook.com (2603:10b6:303:129::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 20:07:06 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::98aa:7dad:512b:a26a]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::98aa:7dad:512b:a26a%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 20:07:06 +0000
Message-ID: <bb878698-b7db-1457-6532-57f71819c67a@phobosdpl.com>
Date: Thu, 4 May 2023 15:07:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Juan Carrano <juan.carrano@ebee.berlin>
References: <20221102103428.82414-1-juan.carrano@ebee.berlin>
 <CAH2v1AqdjKmiMpDpNg_3UkV6m_L4MK_iQ=Y69D8wFL_M+FJQ=g@mail.gmail.com>
From: Sen Hastings <sen@phobosdpl.com>
In-Reply-To: <CAH2v1AqdjKmiMpDpNg_3UkV6m_L4MK_iQ=Y69D8wFL_M+FJQ=g@mail.gmail.com>
X-ClientProxiedBy: DS7PR03CA0323.namprd03.prod.outlook.com
 (2603:10b6:8:2b::12) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR17MB3515:EE_|MW4PR17MB5578:EE_
X-MS-Office365-Filtering-Correlation-Id: 060afdd7-ae7e-4fd9-d77a-08db4cdb222f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jdqlWApFjmo0i6rP8gpNAE0Un1/f2J0sx4t732ls/mJWApJHkCfZqWfhbv37b7U4f3wX4jZ3yL75qGhjJp8KNcpY1frPnevGqhuBAhU9SUTv0oQDX8hGIxjSvFaqZaRPsB8drOLf/uc+7gtfse5v447Css2zmGZZH/H1FJzhGe9ta1s11rbQIahxdfk+rPU5iwTdZmKVXVWg3TyNGy7IrIdGPbXZmKKTYPWHMTgDCInnZUOse/oU4BqJ2n9deOlDdkYkA8jTl0GhvZGjdn/OEeV88lggMhpsrV1ibAi2ZaAbz8MuuTVwnSvRbgdc7M2uQxxUlRdoMJp4kXn4UjvX0AdqcXshM4ONsr6kHCX6Fqg7+UwSXIpbm+1GPUtBilL45iiX96OVfQoLAaWeSOtoDrCoCMdis38ihl/mFukbKiA1pKlDjPSyxJTr5X2cfVBBS85SEW5JDJ5Bl4pwreoRH4zSMK/rp3gv1Jlbd0tfDsUGlVEeYtpdenGdJDl7xN7Rsir7iGKiT/RFQkAmlCePIbI64szLjW2Nbg7pBT/p82f1svStWHlgWeCBSKtqA+g70OAu73Z4QClooYlGHOXrCaycgHv138I0e91blOwW/ycSTMVxDuCvvkb/T00mmHqjwpEUhB06nJqTt7G2kkbB3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39830400003)(366004)(136003)(346002)(396003)(376002)(451199021)(316002)(41300700001)(2906002)(53546011)(186003)(26005)(31696002)(6506007)(4326008)(6916009)(6512007)(6486002)(66946007)(66476007)(86362001)(66556008)(31686004)(36756003)(4744005)(2616005)(478600001)(8936002)(5660300002)(8676002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGhBd0lWVXpYMkRaSEphZFhFdkZQYmYwOXBsSW5CSFkxNnBLNVRseXlFOGtr?=
 =?utf-8?B?Y2FJUVZROFhLd1czbXVOVHAzMkd3OElKTy9pcGsyOUJoK25wS3UrUXJkQ1Ri?=
 =?utf-8?B?OU5BUHdFb1Rwd3JLZzJycEV6RmIwWmVFNTNhT0FTNFBPT2RJbVFlMUNPUUN5?=
 =?utf-8?B?QVVoME04RmZCVjBXV0FwTWxPRmJ4TXFOeDRBZ0NlUVZ0T0FRbFY1ZTBuVmRP?=
 =?utf-8?B?eG9xalYyWDhPNmRyLzdQNlh4ZHBEZkdHSGh4NXdCUHVMeG1rZFBZc0lmUmlX?=
 =?utf-8?B?bmF4MFdXbHllSTJNaEo4UURVT1pUekZEQm1hY1cxbVpLeHhWTVk1TXVMTlVt?=
 =?utf-8?B?OXlGWWpPUHhQQU1tTGh0MEZMakpZQlFpbFZqb1h5V2MzaHgrTkhMYm1DUlBp?=
 =?utf-8?B?SS80NXhWN290NkVyeHhzZkJIaHpvcGlQTkdYbEpGNER4UVNnL1NVTDhtWXhR?=
 =?utf-8?B?dnpmdkhjVHFpeVZmQ0ZlM0wwMUswMXI0cFU2ellITmp6RE8wS2hMamdST2Uy?=
 =?utf-8?B?elNmc2cvdFdjNUZ4ek5oN2VueVNYeEV1Y1JSWTBUcXRtdElxR2dTZmdSbnNL?=
 =?utf-8?B?YXhHa0FJY1hNT2ltWndFeUZiVXZxNHZJNFF5RUZ3R0s1TjdxWFdpZTRLYlJI?=
 =?utf-8?B?WC96MFd1bTJ4R0FVQmx6dk9CdnVXTHJRNDF3UnBKU2d6QnVHNm50eUFoME9s?=
 =?utf-8?B?T050ditXMU9uTzJxYmpGdnNkM09lcTZqdXBDUytWdXFPV2FnbnNwUFloRjNT?=
 =?utf-8?B?aFJTdEpQeExpdGtaalQrRFdqajQ5elBkYmNtZUxTT2lLdmVWQm4vUDVQZmFZ?=
 =?utf-8?B?SlJ1c211cDNEUDdDT3ZYOVpaSy80bmlkSFJsWjJsLzBIQmpST3QxWjdkYWo0?=
 =?utf-8?B?ZytSbnh3Z2w0dkFSb3ZUa1lXVDdaTi9EdlAzd1c0WkJJOW1kQWNHeVlUUVBp?=
 =?utf-8?B?SzJSWjF4YlQxM3VYZGFVemp5SmFPbVZNVi9KLzE0b0xuUUdGd0luQmZMb0tK?=
 =?utf-8?B?OEszYkNnRVR3YlBPcUh3MlBjYmdUNjQva3VXQjlOaUR5VDBVdUNpVElBN2Yz?=
 =?utf-8?B?VUdXOWpaQ0FYS0tiTGd0YlVEcDk3Z2RQejZtS2VhM0VaanJlVFNPSitkZmVC?=
 =?utf-8?B?cjlkMWxtY0dJYzJhbG9hOUVPckhOOE9YSnlhTTVMRTVTeFNQNWc5VTZVcTBy?=
 =?utf-8?B?a1JrUUJLNFhhdnJIK2RORm5pZ3FlOGpyeTUzSHl4Y29wM0UzOTdHNWVpVWhN?=
 =?utf-8?B?amplNVZzdDI1allsSGVab0s0RUg2a0ZJNnY1V05xN1F6V2tnVy9NVTUxaXpv?=
 =?utf-8?B?SmlyMzdrZkpNMlE4RDZWRW03bTJOT2RDcEhEOXhRandvS0dKRW1zQ2V4MHl3?=
 =?utf-8?B?bnR5OWVKMDdsditFSEhPT3ZNdTdrcWN3UW5xbk05SDh2RHRma2JUWlFvNDVC?=
 =?utf-8?B?SnpzblhuYVhaQlpkeHMwNU1naGVGWmFRTG16NVJnT2NCTXlnOFljTE8wRTE2?=
 =?utf-8?B?SExaWW5IOXh5ZXA4amEzRjFJdGVoSHRJekVscGJmU213Z3VZUXdpRU1udnpV?=
 =?utf-8?B?TG9ReGJCbGtmYlIwNTBndFNEdC9vNytOSXVnYUFaaG4yYVprTDIyc2xqNXk2?=
 =?utf-8?B?elphbk5UWWpvRzlMTEUyOVNHb0FpMkRJeGFVclQ3UkRKaFhYc2RaVTBtUE02?=
 =?utf-8?B?OTlHOFA2QTlGc2VGQWxidm9oOEhHcHo3Z2FUc0xUcnJZNG1OVXNIQnZEQXIr?=
 =?utf-8?B?UU1nZjU2enF1T05rWHpQaEw2akN5UnJzWjN6bm4xNUVEbCs4bnF1TE1aaFVL?=
 =?utf-8?B?NUlJRUVWQzBnSnZMMmV0UnRZVGpFeGtQc0hIM3Z2cVNscm4vNmQ3WVMyaXZv?=
 =?utf-8?B?MXVhaCswWXZtSldjV2VqWlBuTkJrdmxWWEcxN3VMTVVyRnZHVU1Oa2ltYVJJ?=
 =?utf-8?B?clZxY2EzM2VpZXA0Sm8vemsvUWhYZU50bDloUDN3dkpSQzYrWnhoZ1dEVGkx?=
 =?utf-8?B?bVNvNTNCNXZucmlQU1grZDNTK3VHTDV5czA3SGFHSmZFRzRoYVhmZkVxQkQr?=
 =?utf-8?B?M0laVkdmejNRWWJBQ0RDcnNnRVY3dkpydGtVaUttdGtiVFdpOFo3bExaZ2du?=
 =?utf-8?Q?vioBvt13d2p7ut3YtAwdve4bZ?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060afdd7-ae7e-4fd9-d77a-08db4cdb222f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 20:07:06.0287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hW2Y4ak/RT89TG0Kec+D+4JPaT5bcq5pyMGMt5YHTImSA099NDiiEqSInOjMZbh+oRLwreqcxZjbqqJXeKSdbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB5578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNDfsfHsWBbry1/9dSgPWXadZizIv6Ea5L6NdTkweAE=;
 b=Sfwt9PvCDIUFDGnMpRKdRj7VpIWMnRPN1qjDKTkEXBE0o0tJm5d8ILc4c/llhahIMqK95+6Yfx4S6Cxu4+S9dE8Q4PwtDtBqpUjZQ8qfz71nMv1RhWcZL55yImBQ5YDrdBNZRnACQpVox0JTM0Y409tP70g7iQ88jjl6mf/bVFA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=Sfwt9PvC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: Re: [Buildroot] [PATCH] support/pkg-stats: list packages from
 external trees.
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
Reply-To: CAH2v1AqdjKmiMpDpNg_3UkV6m_L4MK_iQ=Y69D8wFL_M+FJQ=g@mail.gmail.com
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Sorry for the late response, your patches for some reason seemed to 
evade all my email filters.

The patch looks good, but I would like to see an example of pkg-stat 
html with packages actually using alternate trees before I sign off.

If you could send a link to a hosted copy, like on github pages or 
something that would be best.

Sen H.

On 1/24/23 10:21, Juan Carrano wrote:
> Hi,
> 
> I'm bumping this email. Is there any interest in this feature? If the
> implementation is lacking, I can make any required changes. For our
> use case at my work this is very important, otherwise some packages
> will not get checked for CVEs.
> 
> Regards,
> 
> Juan.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
