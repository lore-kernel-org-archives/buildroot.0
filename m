Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23DBC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 08:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 655EB6060A;
	Mon,  3 Jun 2024 08:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AgwpLuonZlq6; Mon,  3 Jun 2024 08:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7656D60632
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7656D60632;
	Mon,  3 Jun 2024 08:05:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1771BF2EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 08:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0836D81EE9
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 08:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBxdW9yQrVxl for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 08:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2414::607;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90E7281EEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E7281EEF
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::607])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90E7281EEF
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 08:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbITgGrTFvxCY6c+uJbZi3szT1Dh4g6yVsrgiofnYuJGwOc0Cof2NKBvhUxJxPLBbvM1mGh/FxMPsOdWNOAP3CqQmTAw6UqYKhT649nCCPNGhLXXO9gPV+0bD30lpM2ncvzFtjaY/FFAWpJSvZCYWER5riP4lcduJ+Df6mD2cjHNQIwerkqtjyjfWM3jHIHYMoYeE1xKcvzesoQooE20Almt8e3ebSYBDorG5ZhcdQDRvntjuog39dDoymduj01rU0jucADIgR1MnUvqDqHKTzbJBoqFgqdBlcNEHPwM3l28nOz03S5awS56rDCIDd0GADj2YwXCdkyYcctnnV7UKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2H5f1R7lkfiTtDk+4pXWhDnLhb+7Q0eQYkTRSl6AJg=;
 b=SYJGNk06juWdBfU3gGszfzI/sbDA8LAxhBxNmEFlXRM1SctnrpwICnQBLJVxfuGPPl+NkXfMopXE74EH9JVgQZnbmyzvh4ndpSnZmhJpYADoMQUnlBZ3H/Sy+ltQd/AwOQNUvSv7/M0kCgXDyXvUqhF7rXFJmVW6/Cyikbw7ifSjcNHBLuIUwWjIDphSq9VmrnmzcPc+ol/wpgRTYus59qZOa98uVTHkChC+SixRhNftBD6+KDn1JrKkp/x5jAzfTvfqwZfSv0uGb58hUyg18E4PQyvYRD0/yKbmnTpk9Iw/q2a2AbTrPTY/bIv/KoTd15qLlAXGpbqvU1Od29JzGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS0PR12MB8368.namprd12.prod.outlook.com (2603:10b6:8:fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 08:05:43 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 08:05:43 +0000
To: Peter Korsgaard <peter@korsgaard.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 14/23] package/newlib-bare-metal: use https:// _SITE
Thread-Index: AQHatYYfMcW1PF1nAUKBliCtgGgD+rG1rnYQ
Date: Mon, 3 Jun 2024 08:05:43 +0000
Message-ID: <CH2PR12MB5004ADCB7BEF4BFF2CB088C8F0FF2@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
 <20240603071726.532652-14-peter@korsgaard.com>
In-Reply-To: <20240603071726.532652-14-peter@korsgaard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS0PR12MB8368:EE_
x-ms-office365-filtering-correlation-id: 94e4d016-bbad-4962-c6b0-08dc83a3f797
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?dU9aeEF03dTjK9MSJEyCOYOockGwiJdVSWgCxTet0Y7MTSqrX9wi4n18cmM4?=
 =?us-ascii?Q?DuPx/ByvD6LW1WsnC/h9NN9KizyQxDO6erwaoqyYahppb7X3DQSXYw3Mf9am?=
 =?us-ascii?Q?HNlyaemMjhB+p6WsqgGIJRh9MoQeJPkPQE+nizfXWysDJqCSg4RqWESs7Zcv?=
 =?us-ascii?Q?fj9uHRoZRqsBoe9a/W10M+R4BveSEAjmq0TxiRFZV6LqQbdIGFExZH0JRton?=
 =?us-ascii?Q?526f70EuAyZ6EwDB+/o5XQ6VImcbv9LC1FpoCgu6wqTy6IcjwPLkci50cUh6?=
 =?us-ascii?Q?KAd0MRgyCxYywnxTSs55kZjfr2WGuWlSpw32EMTPJp2PsrWByGuyj5Y5UOCn?=
 =?us-ascii?Q?wd9RDvmjPPN5WAEBdG06+UAXCAahW2ds/IPxaTabQm6LbiRiCEwxoRzWfnxP?=
 =?us-ascii?Q?tIoPWmYVDGtNprkfI+aqvj9Nt1EsJg32y2IP5/QAXX1+UqTwQaqEl4UP0fen?=
 =?us-ascii?Q?vKb6olxUq6CPg0q8yGUVSB3PkkynzfehC4gXyw7pM/V1Q9P9W8NoPZQb7YxR?=
 =?us-ascii?Q?7ULJLNdsHVq7HNNYUbem9Q6GKqb8QHbAyVAVgcdJi5F4WHvrEc4JSS/HnWBI?=
 =?us-ascii?Q?mFx3hhsNNLctvtqfgqjTXOylEwZn1aySjnXTMoc3ohUW0tqZJK4iVZgGPUYJ?=
 =?us-ascii?Q?cKKsdn0IHqh+kvdCaPhQZAgXvPJY6dYLa/6aJqjsCoS48Lv6K2CkEwA4DzHG?=
 =?us-ascii?Q?pEj6NbHPKZvy5YYXHyutSP5EzkxIKrO8Z2Wrop3dQpwzKqqbQZ2QUe650fMU?=
 =?us-ascii?Q?lLieu0v10onPK/KQXSWnWZ6vCFsDFayIyIhj0HJeuZIbVWd/f8Sd0FobzRFC?=
 =?us-ascii?Q?p3dyP7tLWwK9QzYBTJxrKXf5kH/u77KS8iIfdohV3U3sFMyZIaRQfUBnWvu0?=
 =?us-ascii?Q?kMWbOOXIbtVx5J9NfR7et4DU0NJkZExs9DSWvOZP86ylDKGQyJ/GtKbpm0Re?=
 =?us-ascii?Q?m+8cuQBP09OII94rXcKWKfVaHYCwO8d+Q+8H9Qk33hfNmLIzY7J5XJu9DTKS?=
 =?us-ascii?Q?PzBuh2kyKiP8Nhr9+cfUhTXOTapkngl+oALqAGen8z/lJMEgByOBj/mtvaEQ?=
 =?us-ascii?Q?BrpQF9inYJe506RGn/GX7MnoL9PK/zlUESZ85JQ+OkW17X3YJpdrzok4gFYr?=
 =?us-ascii?Q?0ZR4qkwu67GTYrXZXZjIB0Ttfefn5rf7MlmMjOaBdu51SOr5BgrRyAPG7dJx?=
 =?us-ascii?Q?EjArAqHLbNWsqPfDyXRjyB47Jz7l+FP3TgP0Suh430qvBbf/BZMstIEewIRT?=
 =?us-ascii?Q?ILj5cOaNAlo1Zd0I0/LRgt/9F9Wn8q24nbpstZEYnP3/c+L+yTHqTL8qj+lO?=
 =?us-ascii?Q?mF9YrhlGSQmpEko4qecgpIXo0csT7hUVIJe+VsrL7A76NA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K2mC17aSaEi/YiOPcIA3I4vPhvLPd5o/fcMnTb43GUeb7Fwd9ESvRdrkyhyp?=
 =?us-ascii?Q?qmMCpWkvzIphm6l8QNsAYYW+A+t9MsrX4MT5KgCOhjsBzfWzBGyjDs/PQWAd?=
 =?us-ascii?Q?4Nxtt8SYRQPkmj+cDi1Cq6mGyFi7s2HVymTOi5mR+2dUxyYlPFNWwy8/iQfs?=
 =?us-ascii?Q?aP0A1fLiym+8yKuZtRmMh2dEdZAnJO1IX+cw9lmCp8UR+dt7LZEQUOrf+0Wy?=
 =?us-ascii?Q?feLNdDHzhCsEivRv4+K2ZsLDwee9y+9TNjX0OY1Mq2TEP9GGF65JGzqqxb5f?=
 =?us-ascii?Q?cosRm2BnqGNa4DhGXQEoF0XnGwI0/2Q0qFeLSyrBTTzoFfVR9cTDlXmhgHtg?=
 =?us-ascii?Q?bl+HlXJJ3YsSFSW2ybO+UkIQHKf8lPjFtubh86SqJ2ki9P41eMipdf5NuEIP?=
 =?us-ascii?Q?qwNS9ZVvfSlGV+dNUIY21BBYzxSE0cxCcGw7wflHsC0grH3crwElu07JOFul?=
 =?us-ascii?Q?vXqdSuwHp2aFc41YAeZ9Oq1pggiANL3yVlDkowDT7ZKfru6IiG+wyKJ1bIJw?=
 =?us-ascii?Q?ftrxaDWgGyyrtaigSrT48gRM7SgZZqMQ5PnwyfWffGCVexAaRagOt5w3+4/P?=
 =?us-ascii?Q?pYKAId7gIO/jgjzvctQaW0RxG3DVtwcmwGTn52ZrWXElpD5wA0KpMhw/N0BA?=
 =?us-ascii?Q?SO3hY8OUVWUa3sxO0Oa4hH2qfExSRWFXi8EGGT6ihVM+V13vg2CMOjtpLMhT?=
 =?us-ascii?Q?pHifVOHU7/lpbR9+a3HbrL1Zrs4XXMQl10Takk7pkeOARJiKwdbIzTjTRdA4?=
 =?us-ascii?Q?GZejQkT41ofal3/jpzSNx+JxobbTSxv6jF01jprUZq+FpYXxSjWjWR6r9pG/?=
 =?us-ascii?Q?RayTibHYWF00hzuX9AGZVDUcPKZNJg2dpmBCNuyarFceQJIQZkV/iiUfzS/G?=
 =?us-ascii?Q?5J+E8iqC0ZJ+YiE7cKdJgrFgkVu2Kl0drk5t6s17jAdSNtSqq0WynB0HvVXi?=
 =?us-ascii?Q?t577IGORqmEooCgG0lZVEDTSKQtqqoQ/BTcdTfX3tJJNwI2Ir7GztAt4TJi8?=
 =?us-ascii?Q?KxOWXZVVywvtAFLa4hZk95WyRMYkpkGNO94U+VZWpT8tIA3YquwS/QoL5oL/?=
 =?us-ascii?Q?Xl+D6/g0JaVowN/w6tlbmmQZdtp+JsSMBmlqiNyP+CXW+BPlqwUKaNbRlApr?=
 =?us-ascii?Q?FErMxw4DfEQge3IUx5cNW+eLIHtrE4ex76cuzaV8qOq3vgtR2PjfzVHnv7J3?=
 =?us-ascii?Q?TNEIkHeWS1I7vskankFe6NjIYG9KYqwtHe8H02Q5wXGh+pG7Y+68NxqjTqBh?=
 =?us-ascii?Q?jgf+8PdF9AoPf5HS9mWVwlRWkb5m/iY207gy9uwTosYW6NmwG5fFMhb/1dBX?=
 =?us-ascii?Q?zQf8KzJgZgznTpkhrZca9cIo4wKCbeBNLyi79NWM8LVHmyBBhUCO2zBWRAun?=
 =?us-ascii?Q?m+l4b+LlQ/tiieUEp2gLo2dlTVVs1qjzaaRQ1UV4wfAp8CcDVmMT4Eb3/M1X?=
 =?us-ascii?Q?gGl9qT3ROngmLTvgAUjQe+F5LQtBw7HvlMvAJPmvIt5l3IniCQCqH9U7Hgb6?=
 =?us-ascii?Q?JwP4pjRojfb/xFylOaX5j7KExRs7V2/JTFtdN0FOH2JAiZMfO079FYIxhyjV?=
 =?us-ascii?Q?G0Ypprvl3nx8WkNXrO+5RhNEHbPXsF1bn4krHCPUZ/1AJtBgTyHQs4a9bNqV?=
 =?us-ascii?Q?aiQWBWSdaU/zwqX84nimVxk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e4d016-bbad-4962-c6b0-08dc83a3f797
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 08:05:43.6085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aasEfgGTFNlkwJWyugtngH8iDhovAVOkXb1LkBkx+4oyv22ZhJ4SK/LIQDIGQKuw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8368
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2H5f1R7lkfiTtDk+4pXWhDnLhb+7Q0eQYkTRSl6AJg=;
 b=HPNdkgVwO2z0rM/SxlKRD8wjpenagCth6Bv9fOZQ0P6kW666KS/6LcrJkWhzYIjzyHTuzSpR6L8BxX90z4vjxCdM+o7KQ34A9dJ2YZgSmmx4QAbsw9iTY1ocGGcuuZ/cNfcKo59SQnlv0/73i1z6Y+tvs827OfDgtHCkHAB4KRs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HPNdkgVw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 14/23] package/newlib-bare-metal: use
 https:// _SITE
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> The tarballs are also available over https, so use that instead.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
