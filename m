Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFE3E83062
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED64482BE5;
	Tue,  3 Feb 2026 08:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yM0_KhrD00mL; Tue,  3 Feb 2026 08:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02E5682C4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770108769;
	bh=dFJ0H8/Iupn6Jeb6uCBjJ+vS4O79B5a8F7UaOjzjGJk=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=guqW5/tgo+HlJJmk+pEOkfRrDxzlJ1iHpqXf1tF8sWypJW0fh1IEw2Y7ZHBkpe5WJ
	 H6ACCSO2sP1lCCs8dzk61VzcQc846BHB72KXlYQTujVx+/BQPukMl8CXclG2d6/ZRL
	 00eSrFz0mWdQLPMKLyepeHAApVkWw88yZqB2Qu0eowpqSRL22hkV0Cnx+MYeg93UGW
	 E+2bzA5l9pra3H9gNx227ELLawyIGBSB1AmTfXQMfnZE/5xevJexSN29jQmGAMzSDu
	 1dpwckpcq9iULyfU6E3IcJ1Qvd2FF7ekGA/FtRd7HGldb2hkGJ3HGVve5E1oZ1VX05
	 BVJOiqPqB6PTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02E5682C4D;
	Tue,  3 Feb 2026 08:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4008F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8198282C4D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ano6zVlhlTnc for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:52:46 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::611;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7356F82BE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7356F82BE5
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0611.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::611])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7356F82BE5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:52:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=WsjLLYFvBiYoNUZAiSDnXNDMIuKKEIP4ATN1iN9YPtCdrdJjdyRUBISuca/BWfkIUbYHvu2ln3/cxP8T1uTeTEEKr4+F+j/6NKN/lwfZEvltCAF5mmIIaREnUAcIh+vywWDu6/RK3tVd1cu1TyX90jpRnCer0kN+qmvMlOvt/IQpeRkuUaoDg9BoknzKlX6XMcjb5keeqpiux2Zb1eI8G4LDk4X0fILvrZ4aOhtJxGi8JTlv8ekY1EuhX2pb+AiVOJdwYioMHH6+CNvjhpC32g8qvexusmjg+tJ7WltN03wc9ey27yDQfWJJ38wmsOeD/YcqItuzPVU3yZAgAIBTOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN44Zf+mlrrKWyjynfz3loIR1ACS5RxquvIG7toml+A=;
 b=DbJBgnF8Of2g9g+sscUNLNxTOIcTrfo7FkrF4WGczcqIDMhrBxbIDqu3odys+uTF5ohKiyBUPyEU8bGoPxOsyRfvrGJCBlwcqOf/AiBNbJcy9gc0TnonxW9pL/pFTwzM74nUaQpSoDODVeDt3cUgok1zNwgDDUJIU5f/k+AMPyWJ1Bb5HozWeguUiliN3KX3+SdyzbjKQNqV6KwnhrvtroSx5eFAccejtDyDkJBrAy/GvJYmm6e/uLF379alObSBSPYSiHkJPDueQgsf2aSaJvnGMTtxGbuVzg95lRqPYfe9Y2KQLcXTGQ6Hrb2i05SB12IE+Z/Xn1xG074iV1f3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by SA1P110MB1454.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:196::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.8; Tue, 3 Feb
 2026 08:52:38 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:52:38 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Romain Naour <romain.naour@smile.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/2] package/python3: add optional zstd
 support
Thread-Index: AQHclOpzYUEoIztJDky03ZyqmkO3hw==
Date: Tue, 3 Feb 2026 08:52:38 +0000
Message-ID: <PH1P110MB160398B9ABA8994F774FC4989F9BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260202181527.2584850-1-romain.naour@smile.fr>
In-Reply-To: <20260202181527.2584850-1-romain.naour@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|SA1P110MB1454:EE_
x-ms-office365-filtering-correlation-id: 5cb0f0df-a196-443f-b219-08de63019583
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|41320700013|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?d0JPUrVpZht34mOaUnCn/b4Ljp+5htgLVd0Yhq83otfzKS7bsfTL4vNZHBj7?=
 =?us-ascii?Q?mnI4ZLaUA3AHkLglbKSTSBJEkO6+Ya8OeQYiADrYKbwSNQmTfWSBBCYXfrmS?=
 =?us-ascii?Q?mqSrEB75Ou2wawc4H6po6exD8ay4R+iJ197GU8yLcSBv9Ofy4XUxXICuW2+/?=
 =?us-ascii?Q?m169wKMahyR4pikWoTvsZwksDasb8kmJcPj99Mk7ZbKi0+8Me9F9ZMWf0Cmt?=
 =?us-ascii?Q?Mv64yuK5koaJowwMAWOs1cKhujkgeGA18ojWrxSFLdAzDLNm80tcRf/PwZlC?=
 =?us-ascii?Q?xrv8hlIEwH2rhkpe9HJ1uywPxV8Zhf1OiFbE+zMEaxo2isaVPM9uBguy9r2+?=
 =?us-ascii?Q?6UQrEPajdJeszBcPXe9NWRjbk1TEYVYbZg8WomalQffHlzKjJAmGzsd7JOyg?=
 =?us-ascii?Q?1eHOMPlvLPUCuGu4HDj053pPu12O/LVHxqrRRw5XDcB9hpngRIHkCT849NpX?=
 =?us-ascii?Q?mcHL47kINkSI/29QILdNaDCmrWRHJBTh8xgNtfUNPTrzRax+qioptOgENAzM?=
 =?us-ascii?Q?aYT28PZgRuMo1E0J+RMBYGRyEPSbYGv46jE0JotDTm4yEIx60YH2jtpuwncT?=
 =?us-ascii?Q?c1zsOKvcNVNvCvzLHbY5/+uO1fod7CIS+ljf5VTAZCAbB6ztmc0rCc7OQrmG?=
 =?us-ascii?Q?LrkDgkHLIJdwJtfBSLnQVSANBmyunebHDBw/qb93/b3bvsMLy358bV3uCfWP?=
 =?us-ascii?Q?2/ZmNyQDjTmRj5Y0vz8xf6ANSnmbJoiU3LgyAyIxUpQk2CQWgjK+ezCPDo+5?=
 =?us-ascii?Q?dAiX1oK1FzGqCkiI+yHniRkC8xuVm1lzP1EkGC4ZZS0lFva5AHQl+uAhDgjJ?=
 =?us-ascii?Q?5gQ2kBJyslCZ80a0nGzNBfNe3CWiB76WL4hoAOnBEiJ23Q6O0OtoOQdCRLcu?=
 =?us-ascii?Q?Uu1RZQcz1P796U+d1hyHkeB46xs4LHhEfTeIcaNoeh99zFHmfF7gfY8g9ys8?=
 =?us-ascii?Q?2ccHY++IecMh+8+bwr0LeAiEKUV9gU3sz7kyfD22lfMvKnv0IX3hlhbn2n7f?=
 =?us-ascii?Q?TiTCfNYYlKvJrSiV/+OtSJ3mZ552UqqHhkGUljoaTvpHde43dr8mLMai2BLw?=
 =?us-ascii?Q?vPkjdaO69LjIwN/7CMEkYVimByGM1FF+JYVGabkk9hzzm7v1bJe9PGm1IOZF?=
 =?us-ascii?Q?lkzdqRDQQmDzkYwaCpXReIqiFJok0yXOWfblak+pODnssyvtjuLm1r0rPL/0?=
 =?us-ascii?Q?iiIVhxpLP4mFYtLjU+aJn+ZqFjBpaXn0mR9b0zdxUs/7oSJzU+PJ+oWZaVmg?=
 =?us-ascii?Q?AGJEscYXMaxY0bIhO3Xi4IUGi7Il3KvvkFDOtiX387pkpmJDXJC6U+g1YLyk?=
 =?us-ascii?Q?77c8/CzCzrXqqcuoUlnAQtf6hYH2AjvQm1Dg/oyg/THEzLfoYIOAC+AFCrmY?=
 =?us-ascii?Q?QRJ+CrEghwcOhRf9RriCCIq9iXHq2oUmpk1uu3TLVfIncbE/+A8tEg45vShj?=
 =?us-ascii?Q?rVdjcBuiqlU6/RkfGBj3ZEJ+5tfl+kOgM+nrYZzr0Kx6F3CdaJVMDlCbhYZD?=
 =?us-ascii?Q?ckFDQ+mxtVvjPjLDkLPAmQO6OoEDNkIyBXGN1X28xcvR6Usqh5fRu1yo44WS?=
 =?us-ascii?Q?QXlx2zQ1GDjdIb9MPU24dIRiyBscGm6pG/ymHd+11AoSgX+nAGWweIU3abwC?=
 =?us-ascii?Q?byNoTiWqd/0AKTecGuevYTU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(41320700013)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NxkjhhFBOREsfCzWNc43viKjxmawL5WzFJyQ7lDCuF/dvnwbAV9wPx/D60Hy?=
 =?us-ascii?Q?zKlttlWd2sjt3+sy+8Y9WBlCEGs7DM3/kL0FOfK90EihJdmVWy3ezS6++1vG?=
 =?us-ascii?Q?xxTQjDNVL6Tgwupsk7jIMrNGhyJ7zG5As22jLfrLuSyXVeXZOW3hn4d2SJTg?=
 =?us-ascii?Q?JQsVL/yiNLTTqH8eE/4OEWKfj4UMZPOpuNlphebBoZgMV1OBUr+Y8RW4WMpV?=
 =?us-ascii?Q?lJj6t+cpw9681n3Rw9H8webE+BKznboZH6U5iw1K//fJy6cxrkMlTxR+TZSw?=
 =?us-ascii?Q?jUlUCUI1BebCD+E/13qY/QPgI5powTW81OGmGFefgkuxzKDxLnPom0ak01p3?=
 =?us-ascii?Q?T5nOFkKzt9t2bIxcs/YYCnspDvs+LJ7dnhVnZQBuMZty/Y8+Z1oeD+nS8tDH?=
 =?us-ascii?Q?0ordppTw54cSSOLpUW4223ABC+VRUBfUp8NE2B8j60cdC/YW/Eln3Log913c?=
 =?us-ascii?Q?xKsjbwAZCKAIn88in7COodlEpJcXQbiU8XAyRQ4fvbhC+4/mwkOQVyOVTaAE?=
 =?us-ascii?Q?X9xSoK7gdhDj5+zdlmriW8q3Bq+920fO1CiX/WWVp9vi0EiNnvpwCEGAlWPc?=
 =?us-ascii?Q?O/BLitZc8iBhCMskB5LEhjMY2WybrVGT5Yu4L2go0vqeWAklD7f57k08uGJD?=
 =?us-ascii?Q?zcGSsQ3yT7MQhO5E+4WmrOI8E2Z+eCsFJGSAsSmQIPvpVgWxLFbZXGfCMs9/?=
 =?us-ascii?Q?ByJTlQRCBZy9flLihCO3HOhRKJmhDtnOaBUvZJpx3A0oxhpQf49F9mkmS06D?=
 =?us-ascii?Q?3eLgIYND4d7ghe9+4UISvK6/Se1yN8SBOwcK2VP9eshrW+RFlgg+814HFriZ?=
 =?us-ascii?Q?lIblKSRgJ02xF9momuEzflTiIoXmzlhQLhH43XBu1e+7WBdpF7SikgYm7nJZ?=
 =?us-ascii?Q?2HGjfdmiunGL9sJaZ6mJ7fiS8h4Z1zhyrZn5TyunHgdZWP++mTVZ94b+ZAE6?=
 =?us-ascii?Q?/pFFFAKmHx013BwgNA+Efx3yIcPADpK7hM7H/HPDdRzcT2SolkmyWVRAgHAI?=
 =?us-ascii?Q?qm5OUnT3Ba69YGJb762K6qLbxFmKMsIGqr+tcz+8/33FsRugnLVTQAvW9JNW?=
 =?us-ascii?Q?OyHAZgA/ZbVFVgGQYGibiyaCAvzddbacQ2S70xnKFvULBkKvoGc5AWTl4r7V?=
 =?us-ascii?Q?NLA5ViJLQR6bmgAdi4jc5++RaIEZ0FCyDN9QiPKv8Y09FY5RrVCqSxJ4ioZn?=
 =?us-ascii?Q?RjaTgn277LrhgtzTFJJYsP2DS8MoD+eFg/WyF3JqlEQ1lEzH9ypHmyZdfZwX?=
 =?us-ascii?Q?d0E8RnzWNVODSPX2ehG28J3WYWrOtK99hCaNBRH9S71lP5huoCVJo+eTiDAJ?=
 =?us-ascii?Q?Z3B7fKTQJB1HpFHk5JYp4pUoUU2ZXKzB76vOWXqOC8V1AW/xgSUm+bIZX1tn?=
 =?us-ascii?Q?vLmPIcF9We1hdy7FbTbyTU4YKKxlHy3fJk3vmgP1T4kU7zfdSni2UO/m+n48?=
 =?us-ascii?Q?RSSFkIQ4IkeUe2Vybh0M4b1wpTERiYZjS7eOaVzo/pNvA1LUwwxTS0XZ7drJ?=
 =?us-ascii?Q?lPM9suwUp1jbSng=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb0f0df-a196-443f-b219-08de63019583
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 08:52:38.7237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB1454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN44Zf+mlrrKWyjynfz3loIR1ACS5RxquvIG7toml+A=;
 b=nT9oWwgIJUKwRbc22AGzNtlAdbrmKnYnbe8cFCMJj02J1j/LYphqLY5+lSguAz1+s0FE3S1nWp6bR5pghVqT/8Z+0C3LY1RrprpDUtQFwVBCcvuKQ1saNLit9uQdZGILxOy8769KZbqoceX8nsBfYXAqXRcyEH1phdJ7OD7hDkrLADPFjseRnO12JOV/I/r5Wjx3zFInOkPw6mFY7CRURhNLRDaIVXeDA02YkayTTzeK1HsSDrlxJ0bBBTNQXFREnWYDTadhl8t9zFbnhfPH+SBL27dww5/ZLA/mo4175sRfHsW+Ex67pf09ze+2ocs9MYHcgRqxCLJD2YgcrN0srg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=nT9oWwgI
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH 1/2] package/python3: add optional zstd
 support
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
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Romain
> Naour via buildroot
> Sent: Monday, February 2, 2026 12:15 PM
> To: buildroot@buildroot.org
> Cc: Romain Naour <romain.naour@smile.fr>
> Subject: [External] - [Buildroot] [PATCH 1/2] package/python3: add optional
> zstd support
> 
> Python 3.14 introduced a new zstd module [1][2] that requires zstd
> package as dependency.
> 
> Packages that requires this new module should select
> BR2_PACKAGE_PYTHON3_ZSTD.
> 
> [1] https://docs.python.org/3/library/compression.zstd.html
> [2] https://peps.python.org/pep-0784/
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Tested-by: Vincent Fazio <vfazio@xes-inc.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
