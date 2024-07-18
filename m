Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C52FC3DA63
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 14:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C50381973;
	Thu, 18 Jul 2024 14:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olas2znYqwGB; Thu, 18 Jul 2024 14:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4A4581EE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4A4581EE1;
	Thu, 18 Jul 2024 14:57:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC3BF1BF982
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 14:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99AA3606CB
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 14:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNrtAcPvLqWk for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 14:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::702;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=murali.karicheri@sandc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4978960648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4978960648
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::702])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4978960648
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 14:57:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FewwZYnGBTLhK/BUELfQ77jhQDAFzQuUZW4gXV+l5K6MbUG0L4PBpSVfwcCNWKMf7Tv8JLfrFkbVkH2GtlRwP6NQESxv4jo3sSHt/ew6EIoanweLGW9WzVtjav6GpdYR0II0/ZJQqZG9qeGHKlrKS/9HRSDEcjIuj9O6WmA/ktnMPkLnxcZgk2Rwk/6qyBPSf2uDQfmctrLZiT88G+6NecN+4rpfXt8qSzHN4b2o/vGs3/PGNK9cRmZ4nMcr5KCb3DBruDdt6TMqHmiZxBc39eMiIh0bBbTw2zaaaIGqGZKzK64eTXIaMxEAAKFGLS0xHT0wgi+sw/LE+K3h3W656w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rs4ndYPvr/f/++/i2eEiKJTH1JlPIY8PK+r2ECfcI20=;
 b=i9pkHnc4j3YE/LOr+/kgTg23aWDshVM/oL362GqbGBe7sslRlgSdL26cl6ETMOl9T6c4FMPC0HdK4Nv7TSieMDlgc91lYIELVPRYhhBPY6QgQAhmJvjmR1vJOB+psdyDg/zoP4tFgDaGuJ3cA+cWCYRz6T3WbcYIvvoK6h8aO7I7WXuU+6WPyv6yEU/3S8/d4YnyDZPOu74PfQglXFz9HjMbqCpHV5L8cA4tS9ZO+Ek3N4aKEVyemwy+qqJOzM7I1DT/EczatvYqMkNA3lpr9g64apYRHOwLCVrUOD8guh1DgXZg/dC+4Tuvk4Keh+u1f3kpSE0J3FvBC/jegSKsaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandc.com; dmarc=pass action=none header.from=sandc.com;
 dkim=pass header.d=sandc.com; arc=none
Received: from DM4PR02MB9216.namprd02.prod.outlook.com (2603:10b6:8:104::13)
 by CY8PR02MB9225.namprd02.prod.outlook.com (2603:10b6:930:9c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Thu, 18 Jul
 2024 14:57:39 +0000
Received: from DM4PR02MB9216.namprd02.prod.outlook.com
 ([fe80::8975:c8f4:ef1f:3023]) by DM4PR02MB9216.namprd02.prod.outlook.com
 ([fe80::8975:c8f4:ef1f:3023%4]) with mapi id 15.20.7784.013; Thu, 18 Jul 2024
 14:57:36 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Florian Fainelli
 <f.fainelli@gmail.com>
Thread-Topic: [External] Re: [Buildroot] Year 2038 time util issue - Build
 failure in 2024.02.x
Thread-Index: AdrYdRrLI2+dOxCgSY+eBBejGyACkQAEDKAAAALmhoAAALWmAAAjtniw
Date: Thu, 18 Jul 2024 14:57:35 +0000
Message-ID: <DM4PR02MB9216F6962803F13437B7CFE88AAC2@DM4PR02MB9216.namprd02.prod.outlook.com>
References: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
 <20240717221000.5ced2d0d@windsurf>
 <b03840bf-6a53-4db7-ac58-ce1cc2587b8c@gmail.com>
 <20240717235322.5f90b271@windsurf>
In-Reply-To: <20240717235322.5f90b271@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR02MB9216:EE_|CY8PR02MB9225:EE_
x-ms-office365-filtering-correlation-id: d7e47715-cff1-4133-b202-08dca739f5cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?QuKrKW7QP6nEM/as/7048K4HzGLouLHZWZ1QYJYI9bk86DCRzLft68gyJi?=
 =?iso-8859-1?Q?D4TmLXLY+7G+CepjWCV8RPDLJd72OgKR1cY8kwFY6ZkIaPbD5B8o3CURDi?=
 =?iso-8859-1?Q?aODuGWHH17YAh1cBvynPH19UZqMSlojOUlPX1ivHVR25wehplcm/PsGZBl?=
 =?iso-8859-1?Q?W4+IKYhjd3LUKKIdPL6ERYEEUx0pj67nDJID2zP+H9A9a9e21WQSEvHh/K?=
 =?iso-8859-1?Q?MnKAqg/dPrYzBXE97E5/6qaskdHycr+c540h6eQrtm0rBFmSkt9vjszxdU?=
 =?iso-8859-1?Q?YA02y859zKfWo2ivZFMVOr6A83cVaoKNrkmaTeYi1YDlAf1CYc35Xclmz+?=
 =?iso-8859-1?Q?fRNFeJi8bMaKLt7s2rRMH2orVwN+iCp4K9UG+GuiuCkTsLwjEFFm53nVkg?=
 =?iso-8859-1?Q?usZqmaqOtfjfdMnEGGWoCVCZXSRVVxDkPq5dokGPv5RkOVVmtaByiybrCK?=
 =?iso-8859-1?Q?Hp36lNTpSn+o8rJySpHh8N+TYFmluYKMSm1dQ9SBWgLWadA1up5HfFG5xY?=
 =?iso-8859-1?Q?PPIiXe4c0icA4cSFKwAXP1qcGjKQZjzlrBeNgp0U3+2AaimFV6RMEj4tkW?=
 =?iso-8859-1?Q?YO2mAXWN7nwEr8RdpZ9zjCX3VKYmLgvA0k8N8HN9zEGCvl+w21OkMmYt4h?=
 =?iso-8859-1?Q?fLIFSo9ji9ocKtvU7UVugwRiI6gpojVPdm3hwX2DYB5xz5ri6Ok8Q7N/mE?=
 =?iso-8859-1?Q?6vHLKRJplAn5kUNKfYy9swrQAiCwaXFPAtDoMdjh3fTNIDU9JO1WeLQUfL?=
 =?iso-8859-1?Q?KBfVwvaIoHtIS+d5G9At3JErgOEV7tAAE0dmSlxpq1KMxQr3gLzo3iji7Q?=
 =?iso-8859-1?Q?KIFGGDC3Uscs4Lj8m5Ck65hsb2c1UJYNgSUbrPR9Y9VBVTdZCtPavm0tZD?=
 =?iso-8859-1?Q?i6/GPnyB/gxWUzlepZA3dVVCcAJq5kx+iWWJXkv4W5/hg45bkqIOEjbq7b?=
 =?iso-8859-1?Q?oePB6PCNbZ888NPVPTdMSmT272QzkGyX+qLLkpN1aQjeHZBVyvT3IoB63m?=
 =?iso-8859-1?Q?r3O3A2qRebzHyiFNkXl/tYA8K5glPP4oNbjt2CXt7dEIg1ZJW9JL75KNP/?=
 =?iso-8859-1?Q?rQdYyDodRDtMU+Fez6X45iDr2lCO6vz0+hBCc5HhqgJgzB/eLTgPvNi4k+?=
 =?iso-8859-1?Q?/Ai5BzAaX4pwLRq7dWJDd3zdPj4pJV6r3B98/WveqEsT0eA/Dv6yhfMrAt?=
 =?iso-8859-1?Q?lXMs/i/vyc3ECuciUO7S4sXCPe1u585RQVG1KkU7XFcS1/MU3Rgb7ZP9/+?=
 =?iso-8859-1?Q?Zgsy1M4e1DLegrtd8nRBBZD+QD4fphruPOGo0DaIuJyLtu/SOL6YgrbkFn?=
 =?iso-8859-1?Q?XHoOpTSSVNAcy5v9gWgi3a7Btwy8YmdpJ7Ui8/sj+y+4AlK2C7DBwKLuMr?=
 =?iso-8859-1?Q?7fPk5yE+dcEv6eOZpd314feK49mW2Svw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR02MB9216.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6YJyKecwWS9gx6P8ohUH7O3lR3k19IBJeAiE53NnWlaH3iU3xM9tc/0H+W?=
 =?iso-8859-1?Q?9qiftGSvJ02m9aW7LgHPS++SDzHrTcSjtPJLgTBb3zPJyf7gqOsx+i07K4?=
 =?iso-8859-1?Q?QI43N8i0bDtyivBE5P5ozHXQseDRxJOAJQ95gNMqHfqxDyBfipfBxfqYQN?=
 =?iso-8859-1?Q?jsluyWx9R11HI5opCySYKTIiFYICCTh5i++CG6LYtiaf4BzpUfv6M6eE6z?=
 =?iso-8859-1?Q?nuNpqPhK8qC64ThgxyfrDC5Ojm0OM+hOPE78it8mM6SAu39gWVvt72b47u?=
 =?iso-8859-1?Q?qcGVfWSa9xbKrotNjH4E3hziF1TNUDUvPVDl0reVN//QlDzgmI5VW5c2vK?=
 =?iso-8859-1?Q?XZqhDKxg+JAFpFa4H2sKseHPX1wMNano61sVBGbfMo2nY4KlxEMeZbFCU8?=
 =?iso-8859-1?Q?S9hbdZdzJ6nyokwrFplRDXVqt4+b2zSc4L4JEOYSEzZ9RSA9OUgi2rJfTS?=
 =?iso-8859-1?Q?Crr4MqGcXy3lFJxy5fGtkHN+T2cVm0PI8N5bEmaJ3O1sIIIfOtvADEBuJt?=
 =?iso-8859-1?Q?X/CYS8MSDFtqwPJsTDhFHiFXtcjTQzSVapWvVMkb8R25+mJC4k9pvno7gJ?=
 =?iso-8859-1?Q?wOFJI4uj314V/Hk3B3yEB7C5SSd5poh4DEQclU2nrVjLV4oBjSf3LrrsRk?=
 =?iso-8859-1?Q?at0s9k5Yo7x9QG0aeiCuwPKpAe9+cmEpB2XAohRLM0JipRhxOhSM5/ARNI?=
 =?iso-8859-1?Q?XtUcu7/rZ1SYcj2e2BAU+2bzd48Hwzd096dCWTqjqJKYmBXzs3+8UBS3Hc?=
 =?iso-8859-1?Q?rJjFy/T+FmASjC0JkA1PrVnxfn0g52wEjWD0W/10fvOBpaBNB3CGnbhPnj?=
 =?iso-8859-1?Q?GUGy8ZcD7FlBE9sGBUIh1nhhfFe8E4KftNOr91nqqEmtVJL67h/Nl+EGtF?=
 =?iso-8859-1?Q?E8N+nIWwmXFY51Ayx4GTYucFFdXMJXCwlDGX/JyVB6IkRfOgSrIYmw/6a8?=
 =?iso-8859-1?Q?k6qLeZV6Inky6L6n5x3p4e1+uiP/FKsI5ZRMp0ifRHoFaoUOjG0IeQH1dZ?=
 =?iso-8859-1?Q?oG2PflW0UPrJnosDv+EN8ck1RyR8HWas6/waCjnLB/mk69lgPBb0Kj0rjW?=
 =?iso-8859-1?Q?jOsPg496MzQ3RdFfYh047iDcQnqfp4Fd3K4dk0aZlPMhF4uEmZx4Zr8l7l?=
 =?iso-8859-1?Q?XYS1GJSNasu5FOnklOjrnmM/G3NponIBC75v+910GA5sxDL8ji6YzGOc3m?=
 =?iso-8859-1?Q?rHAUJhfx0UAV+7K2mJPYMshvMQ+74LFtIcsh+U4Jv27I9TSmwCaASahUE7?=
 =?iso-8859-1?Q?DY7SY1q78kTHgk1RZJ33nfXOM3H0EBLaiCEdQtDrwzq+GfFDsvlA275vjN?=
 =?iso-8859-1?Q?JLiowdJRGHKIUf+iaXvII4bMd3+8wSkmq8X1/n81WvfOcWK9IJJshO/T8a?=
 =?iso-8859-1?Q?RnV1gagHu/DOI9DKRpvIPnSDjJPiUg1G01PmwF4DzJ6Kqyg64JcObinW3e?=
 =?iso-8859-1?Q?sprxkbuZjyHjjgkKMaWctAiaQuq5KLJep83esWWf/JNVjMmBNklBW3p8sg?=
 =?iso-8859-1?Q?QzXlnoDb0yOaowxTqZ4UiB9+vpORwe8Ll4SKk5jQ3vuSETXHdXv4Tsol7O?=
 =?iso-8859-1?Q?0byR60NRo7MQlMdJjPw6i3FFgU+mjy0X8cqP8WEb6Y8tBLDyCKvkPsHZlh?=
 =?iso-8859-1?Q?F/dkM425mOQCj53cgMJrcG6khURS33MeZz?=
MIME-Version: 1.0
X-OriginatorOrg: sandc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR02MB9216.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e47715-cff1-4133-b202-08dca739f5cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 14:57:35.7934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 21c4b724-f908-455e-813c-11c8d17f3e9a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VcgmRIb/Qg+1boFfQ5Y1ALkpEI07c33Oee6rd6E2VhIf70sFi1lbDd1CJMGvIihqRlNQtaPImbrhhRTzP3fxtl+YslybcKQbvA90eayR9rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR02MB9225
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sandc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs4ndYPvr/f/++/i2eEiKJTH1JlPIY8PK+r2ECfcI20=;
 b=aslKuDmfdfc4Bkm9eTQIT8te8/lHUp4taA4NouRbXMIjXFRFwJnWrYNx6EBiNei3ns+O4fKOC3fDZWchaoxTRUuKlIH2g61kWRG9BeICSCKY1jLrFXcyOKyRjM6poWa3qx8Bm+1Uh1nWHNRmH8SeZHHgHuxubZnqIMJXH2xW3EjMp5OZlTu0SXoi37V760126g7vmCoJtrsqUrl1E2B4ceQVEX/wn5CLisDrIgmgJ+nWMqOiPFITUWQLCsYakIyAvIgz7+Un2ykodllg4WSB5j/unARyM6GTF0ODk+84YqtapZ+5GiiB+zHbyLlMDXknoxp3DEtuVw3f/Lacnw0mRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=sandc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sandc.com header.i=@sandc.com header.a=rsa-sha256
 header.s=selector1 header.b=aslKuDmf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandc.com;
Subject: Re: [Buildroot] [External] Re: Year 2038 time util issue - Build
 failure in 2024.02.x
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
From: "Karicheri, Murali via buildroot" <buildroot@buildroot.org>
Reply-To: "Karicheri, Murali" <Murali.Karicheri@sandc.com>
Cc: "Karicheri, Murali via buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Wednesday, July 17, 2024 5:53 PM
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Karicheri, Murali via buildroot <buildroot@buildroot.org>; Karicheri, M=
urali <Murali.Karicheri@sandc.com>
Subject: [External] Re: [Buildroot] Year 2038 time util issue - Build failu=
re in 2024.02.x


Hello Florian,

On Wed, 17 Jul 2024 14:33:03 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> This looks similar to what I encountered a few days ago, the actual
> issue was that libsanitizer was referencing scsi/scsi.h (sorry about
> the message being in French, he he):

I think I should be able to read French :)

> ../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix=
.cpp:128:10:
> erreur fatale: scsi/scsi.h : No such file or directory
>    128 | #include <scsi/scsi.h>
>        |          ^~~~~~~~~~~~~
> compilation termin=E9e.

I am not sure this is the same issue. Indeed, I don't see why this missing =
<scsi/scsi.h> would be caused by BR2_TIME_BITS_64=3Dy.

However, I see some host-gcc-final failures in our autobuilders that seem r=
elated to BR2_TIME_BITS_64, such as http://autobuild.buildroot.net/results/=
ff2/ff2dbfdabf0bb6a0d82ea8a80122ab97fd75bd3f/build-end.log:

/home/autobuild/autobuild/instance-0/output-1/host/i686-buildroot-linux-gnu=
/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=3D64=
 is allowed only with _FILE_OFFSET_BITS=3D64"

Hi Thomas,

I have checked the above log, and it seems to me the same issue.

Murai
I don't find your <scsi/scsi.h> issue in our autobuilders though. Do you ha=
ve a defconfig that reproduces the issue? <scsi/scsi.h> is supposed to be i=
nstalled by glibc.

Best regards,

Thomas
--
Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engin=
eering and training
https://bootlin.com/
________________________________
NOTICE OF CONFIDENTIALITY:
This message may contain information that is considered confidential and wh=
ich may be prohibited from disclosure under applicable law or by contractua=
l agreement. The information is intended solely for the use of the individu=
al or entity named above. If you are not the intended recipient, you are he=
reby notified that any disclosure, copying, distribution or use of the info=
rmation contained in or attached to this message is strictly prohibited. If=
 you have received this email transmission in error, please notify the send=
er by replying to this email and then delete it from your system.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
