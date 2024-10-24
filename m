Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDACCE8E7E
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 14:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7CF960A43;
	Thu, 24 Oct 2024 14:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSVbWzeqLIx4; Thu, 24 Oct 2024 14:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C577F608E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C577F608E3;
	Thu, 24 Oct 2024 14:28:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 780AD972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 14:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65F62608E3
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 14:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rU0YxMVAzA_z for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 14:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:260d::706;
 helo=eur03-dba-obe.outbound.protection.outlook.com;
 envelope-from=aleyssens@idtech.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5ED79608CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ED79608CA
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260d::706])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5ED79608CA
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 14:27:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYAVwYUZTjzSeao40llqHMpXYv0npMhyWS39Gaf8Op2DH4wWbbByxwdAEadkXJMdYIMVLxaLuc/3WmYaPDhOjFqW9s9NhbgPt5kqftFK/nNP3Q+HkjK9mKRqhwb1PhRMMDsdI5SeUdvDX8WFeMBmTk0jV8FjL3SabYz31nmpc8AbHW5KJoCv2cSCfJ4H6WQLrI3VUDCrv14158iwesGnoVlVvRjKdz2BPnlCfU8fXBfxlej0kes2EZaiak2HX8vGDljAYzeJs8BGEnljdU9Mk5LcF9VlCERKGxsPVUZivyMnx5OvLnu0TCTZ1uO9qIyB4kH7H9auBTWNTthyOobP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSMVNgvP4G6jl3EXyxO/R/t27erFmc3cAGeJUsEa8nE=;
 b=lTkiqfRr7R8ZxOzP4WNZXEClGYUMtqTXionYHCfLfMFD2s3qWj+Ubumjj8uHDEj3fpRovXwZ6i2v7R2rK1fmcuYRTpyR1CT5MgVSQCoPGbiYqxtz7OmiYxV5FDgprCW6eZNd2YPV7BlAiBIup4J91ZK15rmCEN/xnc4qiqQf9ub7jgpGZ9j2d5pAUQdWrRRhqe4rmDstW6l14+xRMHXpCTtFp0oxCaojhtFnEc5gKduZc3ONAJcitOQQ1tNnCsb/Y8E53hHeMRe+LXI5Wlg37XZjO2chF1ZCJ8rWFfRRMv7cQ6xTUsK/G11d5Qb2uOaU1q9A4qinZnwNdiZtpZ5lXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=idtech.be; dmarc=pass action=none header.from=idtech.be;
 dkim=pass header.d=idtech.be; arc=none
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com (2603:10a6:800:1dd::19)
 by AM8PR06MB7073.eurprd06.prod.outlook.com (2603:10a6:20b:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 14:27:54 +0000
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4]) by VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4%6]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 14:27:53 +0000
From: Ayrton Leyssens <aleyssens@idtech.be>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] package/libtevent: add libtevent package
Thread-Index: Adsjrr0VZCNu9HOzTAColIJnvb08jAB27NgAABoc5dAACv/JAAAAaPqQ
Date: Thu, 24 Oct 2024 14:27:53 +0000
Message-ID: <VI1PR06MB8926CDB78A8C98F253491282AD4E2@VI1PR06MB8926.eurprd06.prod.outlook.com>
References: <VI1PR06MB89260BFEC656834C6E385BFCAD432@VI1PR06MB8926.eurprd06.prod.outlook.com>
 <20241023223046.448ff10a@windsurf>
 <VI1PR06MB89264486CFDAE541386E7431AD4E2@VI1PR06MB8926.eurprd06.prod.outlook.com>
 <20241024161324.086d8f3b@windsurf>
In-Reply-To: <20241024161324.086d8f3b@windsurf>
Accept-Language: nl-BE, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR06MB8926:EE_|AM8PR06MB7073:EE_
x-ms-office365-filtering-correlation-id: 4e9b5704-709e-480e-dbd2-08dcf4380c17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BEI9maQQFWdZnICeMPaTotGj1P4wQzXHq4vNf9FfYZbUmMOpbJzD/FMNAbSK?=
 =?us-ascii?Q?9nXguebL6zGjN+JcIz0tQ/7UMUCdgEZVzavkwNGs7Uuey2lZeGOAyaLUAn1f?=
 =?us-ascii?Q?ueh270Lnfqz5NFr0fhb4rVAyk99QcuX+Zgb+mkoFC+GM2UhsPc6pk9IRn5su?=
 =?us-ascii?Q?5u/9+eZTKAoitQq/tGl9lQfuApYObtQy//hzpiT22aW5oWMVjK0oj88Oi5YD?=
 =?us-ascii?Q?49T5lSRNckPYNuqTSO8KGBOIbH3QCzHRbT97dgZst8eYrCYITHghvILtMt3a?=
 =?us-ascii?Q?Aiodbo4cNtnXG15ZlhM7xCY46lWZ2H85YBBwm4EvzUFdWJCZ2ZJtFZapIbsz?=
 =?us-ascii?Q?0EToBX0NKLSsyi7azXggvtgH8odRR2ek6NqccbVygEDi29NLjv92NB2YjZqO?=
 =?us-ascii?Q?j2ccOGzhhil1yHmbBFeuBV3PM89pA0nd5NJnrIrZRVsZ/BVgjvgQejSb4F5f?=
 =?us-ascii?Q?Bqu9s7VcbGvxdOZ/e5QmbAToF7qovIyVJnTKkAyx+Y3QX9peL1p7XTo6Lj6j?=
 =?us-ascii?Q?EuAJe6tbRkr6oZmGDL6aWZEmRzSeEZd1ko7g0fdiZY5jQI/AVKE88189TxMz?=
 =?us-ascii?Q?OC4yeMFWd7yv0xAqj9nEWe7XbjUzpdYku4I+zZOn703qLJ5NbezOfdkfZnkq?=
 =?us-ascii?Q?+Rj0DVPFUphhOjn5mec1dwLgnumoSwBC7eTz+072QbqU3yV9PpRlijXHxrv1?=
 =?us-ascii?Q?zKXv7dY6Osdi6I5lcYcJb/7HL3LUVIDU4onSiFFGZJw0VEaBG93sfURbjRI4?=
 =?us-ascii?Q?TYuiPypvrUrmyf66vC3zc+/uPcaxR7c4cUpkstl1kCWAAvuc90oX5GJbRwF8?=
 =?us-ascii?Q?4QF6JoNORDl/B00WrpB3BWaNV14ecavMuUSG8WbQCN7gg45D/nQuVONo+Wzc?=
 =?us-ascii?Q?2WEh379bCLjSFcON6mxSrfE8Oc6TmA09zielAiRH3vC7SpuTPLvIPwPQCDUJ?=
 =?us-ascii?Q?+HgLrAiUlHdsO8py1zbLN6LrGCR9hrQb0TaD7lvzyyx2/W6DzqF43Bu9mub0?=
 =?us-ascii?Q?guB9nyqC/9IWyABX6YqaeqVyHpFBMW2Im4Fbl19+Ypik0upLQmmkrpnDNUpH?=
 =?us-ascii?Q?+IOdMxYEMsTUV5z7o5BFQQJ2cLu3af8ax8i0cn9Xp+qA8vM0ExRMIkgceOYL?=
 =?us-ascii?Q?8yBYaX7GR2+svizIprUYjulSa0eKDshZTwPl3+wyFo64CMBm9SYoqff56HYS?=
 =?us-ascii?Q?6J8Ez9Lc+UPa2/F3yh+d7DpmGPlG4tcrP08krMIcq2mm0oSRze4qs6C+jC9k?=
 =?us-ascii?Q?fqF7nxDzJeng4EUVtW3jHzO/IqsZuLSlVszJkAkKpdO4POZ6p1ftJ3+UeVUd?=
 =?us-ascii?Q?CS0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB8926.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hPHpQrA1t7VOWoC2XEN5pNNKVYsAGzAAA6/lUSgo22b+wzzo9Q1CN3TWtlU/?=
 =?us-ascii?Q?JOo3rTJQMjjSNucckbLnV5EARPiWLM7fri3ghRyRnJ9sbr6UYG8TzuN0zrJN?=
 =?us-ascii?Q?mnyPE3HBBd/1oYk42BFcKmvhPTzqX0T2oKcMBfq4U/Sl7ke7atgRiFemALEp?=
 =?us-ascii?Q?SdbdqV9jOBhzNHzKw8RFBOhozSRDyI/PQgUg+qgOKT9Zv24nq++XjLUTnEXa?=
 =?us-ascii?Q?iTGXPTz/s2pZMi30SoD4no/9hGjYXfBLBlrEcDHUYPcjn+CoIZ7svwGTK8Zo?=
 =?us-ascii?Q?b5ZS/VqFOe4WFNIBeAcVdIWKsLR2L9A3PruYgsNTY4aYkRh6wsBre4oM7/b6?=
 =?us-ascii?Q?bZ4B1B/GWoFaAQnvApWp9V95MuMuCXYbHSe7DOi+HE0GQt1fHgtaHyyW/GPu?=
 =?us-ascii?Q?Ew5LzlImJQDWbKOjP86g1fqZhChx+fDxE+Vgi1nZLAURw1E2gveFZZkieI2S?=
 =?us-ascii?Q?TUc5X/UmNiPkPwSNDjyviK3Pxs2Ml6/r8d+Ffne12HRdJz+6oudFXHKkk0Ct?=
 =?us-ascii?Q?ux/L+OXgQvGeQgvxthvhBRfp2eAVbZdA1rRqrD/o6B+Ov43kihOwGPgbz6XV?=
 =?us-ascii?Q?k3mauSRCyR9KpCQ9+9UGPGdK2QOqC3x8jjwYPNYpWGDHEeicwegCCH3o2KB8?=
 =?us-ascii?Q?7ZKocRAB+LBOzaDkt+X1G+hFnQ8CmuVH8JUC5lnz/c79xmDI5b570FQKWgHv?=
 =?us-ascii?Q?gqo3zf5GdtzMVOcZa+SPY+2bWS2S39zI1dXQO1tKzbatR5BuFQO5rokQtZS7?=
 =?us-ascii?Q?nONaUIpfYbWvBLGyb8dnm6IGCaxfzUW4sycU7ZV4Znguryai44fyZJJh1OZc?=
 =?us-ascii?Q?YW+RaqC9ZH5vxK42MCPFSbp8naEN0flevbDW2CYZfmB1jUGQPX7ZmKURJlVg?=
 =?us-ascii?Q?ZnzR4eRLNvO5V7teONEepHY8mY2aQdcGOwAM6zuTgvk5mQjbrgchDjOGcepK?=
 =?us-ascii?Q?EvSMON53RMcTveKFN4HdnssGLyaDo8uvcjUe1E5XLGwwdKUUKUmUvmclRS7W?=
 =?us-ascii?Q?BF4kuGLdFOz3LPir8lJiEAe+Ft/7UzEeAG2q6DGwpalJzmrI7A2cwTGqRJ6N?=
 =?us-ascii?Q?ACi3pIizaxLf45LXmcExwR5tijqX6SzNI8XXhWZR/31obWo71kFv2ciez2rC?=
 =?us-ascii?Q?78u8Sx+4sSXCcvq/Ll9/5pP964/2ubKxkvho5HDPiAp4PtAXuSGQb5XzpGqK?=
 =?us-ascii?Q?s5xa1CWLKAn70r14awNYVgygU1FLpwBgUsNI5nzcenJLT+D7WJaDNL9VTfEb?=
 =?us-ascii?Q?1SBY3EvpIaBj4cEziZtC9F+UcpST7cyPs01n+nHS6fGpg7u0nehiwnT0QIOL?=
 =?us-ascii?Q?SHsTbet8mTkjE/ZVKP6sjer/KammoUueBAoE4cGViGH6Nk8A0zvxyy65Ch8i?=
 =?us-ascii?Q?qMzmibcCp4WzJ65/oqJcA86JuqPLvzInl95deoZw9opj2KFPVNhAHt0wAQEL?=
 =?us-ascii?Q?UZNI/eVGYaJZnBt0HcBHakpgQNwPbd5v7PGjuJ0utdXvkZEJdxg9BwwClkqI?=
 =?us-ascii?Q?UFP1ows9SuMJ32wzsPCRl4+WoTAH/uCoW7oYYrZqREFEUVmo0p/2f4BJEN3n?=
 =?us-ascii?Q?na/6p0kvkK8LPwYPZcw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: idtech.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB8926.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9b5704-709e-480e-dbd2-08dcf4380c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 14:27:53.7568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 982732bf-7da9-409c-87ae-889ccf886826
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WE6/2l6G9mQL1ugDd6wVKVM9ynkdCYTVjpasL6CdDkRyLXNlPYtzcZXAJxv4DfM+X3SxUcW47v4DxFd0F6BKng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7073
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idtechoffice.onmicrosoft.com; s=selector1-idtechoffice-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSMVNgvP4G6jl3EXyxO/R/t27erFmc3cAGeJUsEa8nE=;
 b=jOdOKjXNmO2SAjGQzebDEmQ/2RBGBpFphdevQZWYgWZs1bSdE5kmTlZKF9FXFhmFZFWCgSJEac+/WIiTlFQ5LF+sP2zNilAUXd/MFlJMCUMp0pQsc3WehWG/jidxRPtn//47nQrHzRD+xeVW08UY+94imZSE+l9BWpc1OGl8UgE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=idtech.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=idtechoffice.onmicrosoft.com
 header.i=@idtechoffice.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-idtechoffice-onmicrosoft-com header.b=jOdOKjXN
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=idtech.be;
Subject: Re: [Buildroot] [PATCH 1/1] package/libtevent: add libtevent package
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

Hi Thomas

> Hello Ayrton,
> 
> (Thanks for your feedback. A good practice is to strip the parts of the e-mail
> you're not replying to. See below how I did it. Also your e-mail client doesn't
> seem to wrap lines properly.)
Forgot to change some stuff in Outlook... should be fixed now.
> 
> On Thu, 24 Oct 2024 09:04:27 +0000
> Ayrton Leyssens <aleyssens@idtech.be> wrote:
> 
> > > This whole file looks exactly identical to libtalloc. Is everything
> > > exactly identical, and needed for libtevent as well, or did you just
> > > copy/paste? :-)
> >
> > Indeed, mostly copy paste.
> > Since both use the waf-package system and the sources come from samba,
> > they are quite identical.
> 
> Quite identical, or fully identical? Basically, I'd like to make sure libtevent.mk is
> not more complicated than it needs to be. Is everything you've added in
> libtevent.mk actually needed to allow building libtevent?
They are. As far as I know everything is needed to build libtevent.
Tried cleaning up / removing some parts but it fails.
> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel
> engineering and training https://bootlin.com

Thanks for the help on how to contribute to buildroot.

Ayrton
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
