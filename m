Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843A1E9A050
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47EA160E79;
	Thu, 19 Feb 2026 17:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PX4Sc-fbSudv; Thu, 19 Feb 2026 17:03:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FA8D607D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771520622;
	bh=PUo1RpqGxxeIKr18s7n5+0Vr2ukKL48NSaH8MGBF/UA=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q/oE4bKcf8nKKxq2/hdmHT7brna+9G9v+cdluZL3BaldsxFAvscoNHGDat02nkYl2
	 pBseGTkx/miNm/Qw7n3tUtV/GhcT8bSy67s3sAvgEIGM3kBLMaSGr91NXjy6C0NBdb
	 MfgCOZ5LrW7AQvJNN3tRIUs4VuEzEY1hNy8RlVL0qhLQWdzkwH9VJHEOBvTEpt1w93
	 0+PM53UN5jTxRYuE6vVPBwHpPnFX2GtRnGX9tl8HSqIeIuE5TNj0mh3oLQG71WC/5K
	 fySQUimDjkGcBXYov0G8CoHFFGjzgCbCk/2+YrmGRB6EqBYZoHnf0EouTNksLMpCCi
	 ox4mhGp4KQXSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FA8D607D2;
	Thu, 19 Feb 2026 17:03:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E2CF7206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E078E40132
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1z82ZdIYDBZs for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:03:40 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::625;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E487E40027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E487E40027
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0625.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::625])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E487E40027
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=V2bS9+BQvIlhSd+8/aMalIH7Pp24bjWfPHrsMGjyQEscLqsanii5jbiEOYD1DS63BLqii6tuAm4kWPLAf1t7KL5AMEAFzGgRcmhicB7Bg3cYqSFZvjvqJ3DFl6F+cJb6+i8JxcIDZXr7GxeH3cy3hNdo2Ag6FKPT1g1RNpDWN0zQp+9gkEDREXL6stpgpnPeqP+huKLGEhqLb3hA4e5Lw+fZmtHTRLr0QdPBaQckp3EmpYI7N0HNJBQMZc2SF11nsMir+FWVaVgBhDbKrnncz5aDtcRLyQkS57Q7N+gE+hR1kvPXExfWiDUPo/YBSVxiS4puJ2wk/suCfBNFrwzO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plJAeWEoZF+YzQuVqitQr5M0Mn93sI+AKda+FvnwBH8=;
 b=O3M1j33Nr0IDwO5cnxI8MJtsurZT8cji+iq92WqY5sUXdC5MA5lZepc2320IetklRVlhBdKzOR1oewuN8tv+AcIdSQJGtHrxpYuchwR2LgQgQ0OyXT8mGjhZf/Z+kAPcv0H1XcuLWVREPPjT4rayHBJaCwjyX91WY3EwHhGPE1Ls+jRc+sx3J+YXUNRGCe7VPXHOSXDke5E2QC3E2kxU3RBxNY+Uv4AeZfmOpWYxGrYC4shqccN25lNWuK8H4JPLGobAZ3lvLf0ly3BKRyiSKxQfyLqvXuMTZdaIIUvXOyLmkHKdlAqnUKIV/pCuw2/gr8gKm+eE2uigLyHJHuTFwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN0P110MB1947.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1a2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.17; Thu, 19 Feb
 2026 17:03:34 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9611.013; Thu, 19 Feb 2026
 17:03:34 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Romain Naour <romain.naour@smile.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Thread-Topic: [PATCH] package/python-pybind: overwrite 'pybind11/_version.py'
 with a hard-coded version
Thread-Index: AQHcocGufmXKHiRRgUi1XhpLGQcCZQ==
Date: Thu, 19 Feb 2026 17:03:33 +0000
Message-ID: <PH1P110MB160333834F4253E422266AAC9F6BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260218220435.1849890-1-romain.naour@smile.fr>
In-Reply-To: <20260218220435.1849890-1-romain.naour@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN0P110MB1947:EE_
x-ms-office365-filtering-correlation-id: b467bbc3-367d-4e0a-8c3e-08de6fd8d0cf
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|41320700013|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+NshICX4veG/pTjeCfs9qygX5N0Cs0OubgyVoGVpgwH8ZbUtUQr1nTkgIQNZ?=
 =?us-ascii?Q?jO7VpS7kO06wjFwZSrECNDktnBePfbuMDONfq+LkRgTn9tVPBLrxKujAU7DF?=
 =?us-ascii?Q?PXcOWgAqGq7yENjo8V69EwmCeS5aZ/0UuvoXxbpSP0VgdgkSuGKSYxlYXTV5?=
 =?us-ascii?Q?qOHw0H7tJZ9iIzTLlNPfKUHinZEofmM9kf1yO7/rm77ky/Wd2uLryt3V8TTc?=
 =?us-ascii?Q?G2oMTZOshhTgQ3GNEcPAxIrPMlWFSD8VwwZLb52xk2XK3f3F9OI6UjdSbfjl?=
 =?us-ascii?Q?BcSUio0s5bqtrChy4ftxVtzZIFTp6BTeBJcMvY/YWSbMQ59+Dbuob4UPLu2T?=
 =?us-ascii?Q?Jcb58wvMFks7P8pZ0jqB806FCAoLqazcd0ORehW6xq55IxErk4OFzDzJmKEE?=
 =?us-ascii?Q?DgC2stp9Zg7LrhIjo0ZVQl4WGWSikH2B0NfgE8921ZTEDJLXcEMqDYQcb9kU?=
 =?us-ascii?Q?pM4CmoItFTtqr1bCcjmBXnez6TwlJFYBkAVuPvrjlJnB/kGeGRCXieWVl1Su?=
 =?us-ascii?Q?Pc2R4xASEIIjKnvR1MWzLrs2AtP30tKB1yVEtzLv6NMJD4CoFXOVgPpmljr5?=
 =?us-ascii?Q?3uNZpIacXLFLSSaDHWwp/rbT2e6ZMGsm0YFK3KaihtAC2mA2MJH0eZ+vaqEm?=
 =?us-ascii?Q?p8QtFvqZB1gyKXiWolL9IrIwGXVuxe0gUmJG8RlIKx/+gLCS/fjr8C/ilo3l?=
 =?us-ascii?Q?0C1A5eUYfipqtCLWlXVksAxgKkqbml4ba8szbkz6FYDCmlYEnaRIkexeFgvv?=
 =?us-ascii?Q?dak2weGmGtXi4lXy9l3up94ri3v3lcf9SAmbeANQorZRVwTkXK53bte96yiV?=
 =?us-ascii?Q?rjm4R60ypaGnd/+Dxp/dWB6pd8jlLlRKaDsugOSS0JYkT4Yk9bjZ4SjzmNGR?=
 =?us-ascii?Q?db3uB5Q7+izASUHq/Pyj5geTlICremNGvD4VjTQB7cIQkREvqD7JU1bJHAYh?=
 =?us-ascii?Q?jeSZOky+Ikg4LNljLbXAEofhyr5HzmKpq8wyPerDyBaAyMgPWzGx0WYRUchW?=
 =?us-ascii?Q?oBqMY2zqCPq1gBJl219Wl+yH/pvr6NbBO8qZyJzAQw0nflUzmDhCRQp+iXE/?=
 =?us-ascii?Q?YNfQVmd100c+Z3/uTbBRqPN4oq+oqVVqRQhk8Gs6ih/RzKHkqaHTC1CijZgD?=
 =?us-ascii?Q?60L596C/Sll8vKqzU469WPUjhK72ftwddLJ42KEqbPnZIsF/5zfzq7mlbDsl?=
 =?us-ascii?Q?hVyOWRFWZViepAGN0CSH4Vtds5IRUszOKa3zSkyrEAD6Zx6J1hdpznSI/prr?=
 =?us-ascii?Q?wSOt7juLo+lrawWrTKa1jVkfop7BUoc7mCXmMf6xzaKNVjRUu9ldr1RsVO6n?=
 =?us-ascii?Q?B1Ytquytm2AhY/n44Ga5Ldkv1/te0FT85+/35hLsxMUSiwV70rZg0z/hSjrq?=
 =?us-ascii?Q?LOwWS+2Vll/4vjkOr9q079H5okiuWYq37wLooavMq9XEHcTDcvzNhjrSzSLC?=
 =?us-ascii?Q?cD1JpHnzTuRdpN7osnI0DQH7s6uhtX1BjdlZmRtYmW32WtDU+8XacI2GJEt6?=
 =?us-ascii?Q?5maFZ5Pnk6vZg63bcKSMIU6wXOBUT6RZ5LWO7PbBFpT+A8gAzxqCmz5D7Fn4?=
 =?us-ascii?Q?LxwNMWhH75L/oh07Ld36oknigWbhJGKT1SFop32MWEjvAvFler/UNCcJOedA?=
 =?us-ascii?Q?wsrVpN5A9GCkAIQ1R0jaG+4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(41320700013)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vwmGXay2Jx9A8USxxUEcAoF7Ox7iUEpP4QQ/fJamFteQSS0KX9Ts48TN2epO?=
 =?us-ascii?Q?x+yU0EuvvxjH7aCQZ8DaA0DDWncnZtn3LKVPbAQJrP42beEflMZqyc+MrYMY?=
 =?us-ascii?Q?Y6urQH7AqGGesutNERizH7Cjpb59Gue4gjQ2BxHMif8zhj7TXkjAr0OUkLq3?=
 =?us-ascii?Q?+pTNcVCRBQ2n4aF3jLMUCBu7ZTejZPlx/2RBX/p4Hc0ORX0+rs3csWg5pu5Z?=
 =?us-ascii?Q?ZyQ/VI0JErcJGGMt17SIXIcALkbCu59LHVhR3ittWPC3XKVzO7SwjmWhJiKc?=
 =?us-ascii?Q?5tB7PvBrZOqMDDzGCjixPt3eWTiBzaMmzlCm0uBUclmfXIE1Gt/HY7liQleu?=
 =?us-ascii?Q?I3ylaiQ9EgZV69M9rw3wG1bDuhSiYkLlbtWaNFH5KstHu9YhjCu9CH2RhkE/?=
 =?us-ascii?Q?5x9lWkO5osGds/OT/3MlMs6QwF2aYycjYqtGw6JD0fB23tqvhZTHBQTcNz7Y?=
 =?us-ascii?Q?69st4Dq3SH91fzaX/tk5QooSwFMUtpWs1y/UI4tnVhLhlZ/Ioa6s9aMSmtIc?=
 =?us-ascii?Q?/RreQe5etgk10JIXzcZCNH6kl5eL+4lv6dMzfajupImfUh7C6Qb97mcwUKhk?=
 =?us-ascii?Q?C9LYGrZoeTR6PEmwHpAthxYW/npnXbGceKxF8ruEeRc9dAAnCvEAGjyHUZYk?=
 =?us-ascii?Q?tMTyh2XyM2/j4/RNMoeJJtyBdFT2PCk/Vu5wM7xiSn4I21FzDk7r21M4r4ii?=
 =?us-ascii?Q?pyabFmEZsuuwjAYquLrJxoKS1FcIUk6mzfj8v4BumA+CIABFJz2C1MLDXHf8?=
 =?us-ascii?Q?KLXHzq2YFOsi/liTBZdshwxVsZFfKC91YGkL2W7htCqbnDA9TuUv0NC4W6gA?=
 =?us-ascii?Q?Sq5g1Pz0j27LKCEasOzSPN+tNngbGTVRNnRj8+vKP1dFKEob1Zz10f9/+cM2?=
 =?us-ascii?Q?onzZioW/8J13sAMZX5lKud63UOcP6POZNxR4N56Qd16l7NoMD69oYXkSP74M?=
 =?us-ascii?Q?52JhpDLPY+78NaWGAARrwv0zmZt7t0CLLh1BdquUqvu3ey2Ac9EhZw6ajxSg?=
 =?us-ascii?Q?2O45hDxbG8iCqvpuUYpFYE5OttvflLu0SAsMDlllgXlo+5SBfXCr7PUc+/Xz?=
 =?us-ascii?Q?++F3TdBlonGeZi+ab340DJJaK+Ie1TUSmQ3inOU2ogmzJxrGdOjCH/4y+1dl?=
 =?us-ascii?Q?8aURSgZDhgJ8OuIPgtt6qknS5ZgOKzTNW7PfiI1pGeZn3uWUrJh9EDzcOB0y?=
 =?us-ascii?Q?apaBp9Fz0IhL7oR9jFi5wMvC+MViTlk3jtchVc3PnT0Zeiz8QJ1q7GPUf1Bt?=
 =?us-ascii?Q?8MrKA74JyuwsOHMVe6N30dJBj76YgKHFNBEvgFwp1k3eZPGzotACW7EvOVAh?=
 =?us-ascii?Q?+2C1DCQi7Qwk2nyWuSI8nBU5h2WNDAWpVIwTVkfjNJmfy74cpZTJTHb5UcTC?=
 =?us-ascii?Q?Qm5Td+aPLjegXS2bS3ZiuEoOP541WC/H5HedBxMrs2pCt70/NWDS/XuG+CdP?=
 =?us-ascii?Q?hnqY/q+OycJoQ4fsa0S+EV5kqx2N40PaEJ1cweDJjMn30vNc4iRHgeWjosSb?=
 =?us-ascii?Q?DmObInXpl9xbVS8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b467bbc3-367d-4e0a-8c3e-08de6fd8d0cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 17:03:33.9675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1947
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plJAeWEoZF+YzQuVqitQr5M0Mn93sI+AKda+FvnwBH8=;
 b=gAXnj3d5SO8ULNAz6amjTeU2FXt4rHn48Kx+ZKppkpvlkNckBbJ27zuGkP5oFaWduWjzhtYV34h9PAm3XZ14TdiGf/kOsYQGoEYm6sJGEwtpg7TVQ64QCZP3uFk5wvQO0zKG7PG7BpKanO9XmnG1mqSNiccm2SsLuXJZZu1hRlNxeNOSPDXfQSIi1A2yyGOAGOSA9Kn4ymLeTvJQUez4zkB48jORE+I2cAhbFF4Urm11cOTW/IJw4on5iDjci0C/D5vKwu/qakKyIZ5a1xK43aH77zxSAZzp6ReqOf5PMXnwvkznPvDIqHSQSi4wilbIOkoGWkejQs7YyynSbBFmfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=gAXnj3d5
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH] package/python-pybind: overwrite
 'pybind11/_version.py' with a hard-coded version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Romain Naour <romain.naour@smile.fr>
> Sent: Wednesday, February 18, 2026 4:05 PM
> To: buildroot@buildroot.org
> Cc: Romain Naour <romain.naour@smile.fr>; Vincent Fazio <vfazio@xes-
> inc.com>; James Hilliard <james.hilliard1@gmail.com>; Bernd Kuhls
> <bernd@kuhls.net>
> Subject: [External] - [PATCH] package/python-pybind: overwrite
> 'pybind11/_version.py' with a hard-coded version
> 
> Fixes build error with python-pillow since its version bump to 12.0.0
> which introduced a dependency to pybind with buildroot commit
> 5f446a8d6dd8715385d6e2df2714f064bf26243d:
> 
> FileNotFoundError: [Errno 2] No such file or directory:
>  '/home/bernd/buildroot/output/host/lib/python3.13/site-
> packages/include/pybind11/detail/common.h'
> 
> Implement the solution suggested by Vincent Fazio [1]:
> Generate `pybind11/_version.py` file with a hard-coded version to avoid
> copying pybind11 headers in HOST_DIR.
> 
> Fixes:
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/13138981946
> (TestPythonPybind)
> 
> [1] https://lists.busybox.net/pipermail/buildroot/2026-
> February/796082.html
> 
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Tested-by: Vincent Fazio <vfazio@xes-inc.com>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
