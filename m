Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A846C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 15:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF7C0402F5;
	Tue, 19 Apr 2022 15:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wh8BZUNBNyRh; Tue, 19 Apr 2022 15:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB7FF40155;
	Tue, 19 Apr 2022 15:33:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40E271BF28F
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 15:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E75484358
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 15:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=orolia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r2mu8TvctIgA for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 15:33:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::627])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E252984350
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 15:33:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hL8r5X6YoKrzqvtsV5TvqpfNumTp/dDnpzuCbP+y33NU7hxo/ZYIKkhVlC8iMBwXJHqKtFhbsTbji2+Y6fqAicHu/x+nzLZgzCwhU1jfNXuzgDzgfKqFk5TSQ2fl6+WBPWSv7AlgxQUrr5CJWUoX3ZuUDcr06aQczN9zruuOb/voLU9qVxDw1/YpW8YRMZmEJfZND4ZxFkNyIItQBQMfhBlVmE0X0pb7kAG3AgT2YV3DrUge/ZeHzoY6B/YXbr3O46qBsNyidj0XoJLSiUjnZjkEveuxhYzN9UECWnXakG7LVYiDaGOUl2RNryqFMU+5AMP8cwtO2gnClLp/Wjb+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdxS3+k1TJ3PwWlGjFBuHm3DvASc/5J5E64hblr8lAs=;
 b=d4ZKOStF0iLcge2arH6ojUQUAKZxDTyyDYbZJ0jES1hktZW50wj9qC0yq4ttA3zvrM2iW5XUpL5+CGX6wrjgxPVSUcf98fAl8USaa7wdPVqE1CtYYhseAEGjGEfDLI3LQHswvSdsH3mCcUq+2q6DjBya2fUqB339pNH5nF1NhSzHd4LcPsAfyip8GAAMllb6Bms5IrMGZmQYmkMKAlfIbDqLxpUTlMQmhBSY46h/j6Te3UjHUO2MntCpWdDnhPxdiPJRV2XEAGTJ2kTmE/2n61jmqKlfq3keVc5sZ78UBbLvvRG7Jro4NseQ634Eagk5Oh3SWt6bQ8mt13eXQWy2Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdxS3+k1TJ3PwWlGjFBuHm3DvASc/5J5E64hblr8lAs=;
 b=Ogsj2ZxrEy4dYsD6ZyCS6MmwormhCWt4nPfLkTLIv2oqvMjZehAHNo55biBrJarPj3FJFERbv6643etI/0wBT8O/u4hMC4gLin1SF7neOZCUzC+Q/As1x2c08h2Kzho0+H/MZCvJN4ckQAA6wxeg6dE3mzSzS4H3kKcBb6CIrVY=
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3a4::16)
 by DB9P251MB0305.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:2c6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 15:33:10 +0000
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::f851:b453:b29e:5ffc]) by DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::f851:b453:b29e:5ffc%6]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 15:33:10 +0000
From: Tim Hammer <Tim.Hammer@orolia.com>
To: Norbert Lange <nolange79@gmail.com>
Thread-Topic: [Buildroot] [PATCH] system/skeleton: provide run/lock directory
Thread-Index: AdhTUJtBoKQVdmm+SNalGZXXcuGEkwAFPOIAACcQOaA=
Date: Tue, 19 Apr 2022 15:33:10 +0000
Message-ID: <DU0P251MB0779728153B6892A047DCD79E3F29@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
References: <DU0P251MB077954C75D3B4FCF733466E5E3F39@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <CADYdroMTMTnVwe3z1uMLp7VNiL0PBwoqCk1YVZKvYN0yiBOAxg@mail.gmail.com>
In-Reply-To: <CADYdroMTMTnVwe3z1uMLp7VNiL0PBwoqCk1YVZKvYN0yiBOAxg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca1c0137-39f7-4724-7535-08da2219e8f5
x-ms-traffictypediagnostic: DB9P251MB0305:EE_
x-microsoft-antispam-prvs: <DB9P251MB03054BA251E7077AB99092A0E3F29@DB9P251MB0305.EURP251.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wn1jkLSb7u+b2p+kb6YUw4ovUlkMBtAqzqLmnMzimrFYbYs9jnDvZ163Wv51mxNGqPuRvVy4I15wMlIEZbpbuNFXejNvqBBafghmx4tWfE73MbV74BTrRUpmbot70o8qBRduYlUp8UFjvToO5q3w6qjYrDUvuTBVmVAplC/7KD/VchV9mc9afW/V+7HZ/FzBVfUQhNS5885a7aKN4sKmZskJrogWb0Y9zr2MI/AWZi13VPdJy/4j8E20Vb7+gPdkqDrPkdELFr9tI/t6J6XY1XxOAPM11CsnMBSLQoGfihOCUFntL/wmrT4/HtR9vCzbZmg9EFfWIalmHXw6Qm9/IqCTNSs43dRoKz6CoW3VRaHH2m+xQniCzy5/XAAq18q280ff0XEuVLrmb8b9Eio8Sleq3XKv4Q9psDpJwvGvtPpht4CR1rwf9RIciDo9vwGV6y7B4Bcq2jNaO8ORQPGkmkBwyHP9e5U3jh4lT53fdNjtU1gU36KQZz3bbZeBcMPfhWrCk00UJ2qzR6LVUHMYBsYpW9y+mLpqV3kt9ifdye1ak+fJ2z/wMBbfYt9kwFOke6Rg9+haOv77QIqth6VGquhe2/NeYwcjcAeBBKTAaEZUeKgp6wzQQSGEkg3K5q2B6pSKiWZCsh6/yPWdmvX0hgH6yW9iqGRcAVqp/sbOf7+DYjix+aZz0C5p1T7MvaEWIUbRmQwFuomDeBvV4IYeLry+mjgJW7kuhrsfJuNJRVEpRU+t8n7Db+ug6ea2xMpORcD2eCigNksP8NHCEBNr8XVvIv90hZpWnuvGg+y0V80=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0P251MB0779.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(9686003)(508600001)(64756008)(66476007)(33656002)(2906002)(76116006)(86362001)(66556008)(66946007)(71200400001)(66446008)(83380400001)(4326008)(122000001)(8676002)(186003)(55016003)(5660300002)(38100700002)(7696005)(6916009)(26005)(8936002)(54906003)(52536014)(966005)(316002)(6506007)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eCQJhQPO8dF0GEeNbseVnABGdW3U2wq/CNHYBBnbtcmRE3K993DeduZEi/wd?=
 =?us-ascii?Q?z5V4VEE2ynxXcqZ1gdj5UntMAVK8aWBP2gzNiYuoDBY8zcRoroq5a1ZuOKck?=
 =?us-ascii?Q?OTfDk+k1q9W/UMwCWAkqeBmnIGKtnYg6yztv9gIYWHEIZ4XxdKyI6nAerzuq?=
 =?us-ascii?Q?WU4B/obGtQZwHjr2JE2o5jTzENVskdfpUYN7jf08UvdWHZPFfUewPwYf9X2Q?=
 =?us-ascii?Q?Ov0f4cH0LKzs0d2ZU6xZ6AIJWW+vsvNC8C5ljfYIWyk1kDQXbCVVvPB/pysD?=
 =?us-ascii?Q?n8yVS/FJEMgVc1vJo+dXWj6e50hqH3REmyBm1ksCKBqfWyhQUOXOt5aEFYMQ?=
 =?us-ascii?Q?Fi3ru9lg+FkKuNiUbkk6Dr30gGlaHrho4j0Xchq4GBgzl/dtMTO7ENU7K6Kg?=
 =?us-ascii?Q?2lr67asu5vXJc0urfhaL+Nq4Qivfa7hG+zF+i8IiXqHO0MrKBVAzDTUvMpSe?=
 =?us-ascii?Q?BKbyXJVQIP0KaKPGjDAtk3uunCQNcsw61DL3BbHeoUxUtCrbULUKdScMlA4Q?=
 =?us-ascii?Q?Q0hgNeMEhWiy/qVf/EhdjXaHfY7bUfg/LpC/8GLuUAPKECRXgeKz4EfHf08G?=
 =?us-ascii?Q?p8Hz/40+m6qxt0TLPnidY4s4AEdVqkls7p23oKJL/R9OooxeXGovlGDyWFOd?=
 =?us-ascii?Q?ajMHH3R61awYtxvHadW1tURdSlxYdHNOsZmB/pITkgElTQDXYknD6Wu793vZ?=
 =?us-ascii?Q?kmucJ9ZszA8W+pTyGgqvFo6phg/Ka9t4sOPlwWfa0b5SOMtB9iIGp64ukMP8?=
 =?us-ascii?Q?PQuZNWtIDpgENJN4HCW9cq2lz52pPiD/cm4Z2U6BXTBJQq+I3XL//CRwFXtR?=
 =?us-ascii?Q?qnp8U6lxa1QybqVMb3sujjTEU0+djy/6ot1KGaLFgDvNbtVuvRm7qToV3nQ4?=
 =?us-ascii?Q?azbOT3C4dZYuhUYqXz2iNocxdVWnzcbrRMYyIn5d/zjiX8gGCyix8qo0QniB?=
 =?us-ascii?Q?HuqN0DF2nTvNubVzXhtDaDcTyLjbP/3MpLj1YFmaBRxCvi8fBWDUv3DNvkeU?=
 =?us-ascii?Q?j5tPXyR76OvEm1p7n1DmVXe2gLTcLRrBDsHCjVJ60RMnNvxmQj/LJ63f1Apf?=
 =?us-ascii?Q?BzDUNNBfZVpzNwGs53nBHIZRwzE8g0cXTbqz1dc29yWqhC54d4FBMAVkPmh5?=
 =?us-ascii?Q?rlkieMCXFqCybHhj3kWiifg81r+kI9yGWZCfIN6rR4886JWaOBnlD4lnGhp2?=
 =?us-ascii?Q?x0f6WRVjbpt5x/5aAj9+H2jBj618wFzan+s/IP2tjtTmo9vW5OV3OhDlLdB+?=
 =?us-ascii?Q?nyQWqSSZ/l0pDHIcBLsVmntPhEHFj585rHwtocgNPU/+TXoY16pJi+2PFzb8?=
 =?us-ascii?Q?W9eTLOusyDhP6PR9vdFzASHS1DENZF3Bb5n80DUssaCg9I1ly/WE9TLyliyM?=
 =?us-ascii?Q?s8uCj9fiRHVL3IXY3WkEBpWuRlNBHRV3GUvnPN4Xla2ufaX6RsdcFr6mHj0Z?=
 =?us-ascii?Q?HXa5BUQXRZwWIKFqmqB8vvcX3VEfidefxOGNsxlrYJr150ROAOYjuoH4Scw2?=
 =?us-ascii?Q?eq7HFxe1+6Z7RejC2fVq3r8lmsj4t8cfHet3AqRDcItvhwGxmBd5M40tt8c4?=
 =?us-ascii?Q?Z6aYvBnPUUmjKwvJbj6Gj0UmnrHQTIGWok1UytwpnuEPq5GPiLovNQygaFYg?=
 =?us-ascii?Q?C8XV2WGNiIrVSpP4m+D8Z/zkAXWiFM7/eREcQz8QtwPGmVhhyj+vWPJ0ANcX?=
 =?us-ascii?Q?8t2iq5zgXlvGoKh2wqRCJh/G8HMcW3W3GgtWdq4zqpvE3AsUjxOMHji6/HOR?=
 =?us-ascii?Q?nnvFzeKVRw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1c0137-39f7-4724-7535-08da2219e8f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 15:33:10.3805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LZ2gk7jW8nRRXzBW21chH0RmIC0om1BJr1c0xhzfbr0CvZoYJ2AfPasbDNMD6da+Xu6XAfbNZFtTYlgqLPR/wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P251MB0305
Subject: Re: [Buildroot] [PATCH] system/skeleton: provide run/lock directory
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Apr 18, 2022 at 10:47:46PM +0200, Norbert Lange wrote:
> Am Montag, 18. April 2022 schrieb Tim Hammer <Tim.Hammer@orolia.com>:
>
> > On Wed, Jan 12, 2022 at 11:10:20AM +0100, Norbert Lange wrote:
> > > We changed the skeletons in bf01e51f3c, so that var/lock
> > > points to run/lock. This resulted in build failures as
> > > some packages want to work with these paths.
> > >
> > > -   Create run/lock, the run directory will be purged
> > >     later anyway (since 5e78e7e97d).
> >
> > Yes, run/lock is removed later (see
> > https://lore.kernel.org/buildroot/20200605224858.
> > 12870-2-nolange79@gmail.com/
> > and
> > https://lore.kernel.org/buildroot/20220319190531.
> > 975B183CB8@busybox.osuosl.org/).
> >
> > However, the soft link in var/ is not. It ends up in the rootfs for the
> > target
> > and can cause problems later.
> >
> > Is there a reason the link created by skeleton was not cleaned up?
> >
> >
> Yeah, it's supposed to be there in the final roots.
> The run/lock directory is just *in the skeleton* so you don't have a broken
> symlink *during building with buildroot*.
>
> > I will be honest, I do not understand the full process and why the items
> > created by
> > the skeleton package are not just left in place...
>
>
> The running system will mount a tmpfs onto /run (and most likely /tmp) and
> will create /run/lock anew each bootup
>

Ah, now it makes sense.
Our bootstrap environment is not running the "normal"
startup so the lock directory needs to be created by us!

Thank you very much for the help!
.Tim
Tim D. Hammer
tim.hammer@orolia.com

> Means all content on you image is
>
> - irrelevant
> - prone to leaking info from the system where you built the rootfs.
>
> Norbert
>
>
> > .Tim
> > Tim D. Hammer
> > tim.hammer@orolia.com
> >
> >
> > > -   for init == systemd, create the var/lock symlink early
> > >     to prevent packages creating this path as directory.
> > >
> > > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > > ---
> > >  package/skeleton-init-systemd/skeleton-init-systemd.mk | 2 ++
> > >  system/skeleton/run/{ => lock}/.empty                  | 0
> > >  2 files changed, 2 insertions(+)
> > >  rename system/skeleton/run/{ => lock}/.empty (100%)
> > >
> > > diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> > b/package/skeleton-init-systemd/skeleton-init-sys>> index
> > 1e212cc2f7..795a171809 100644
> > > --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> > > +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> > > @@ -62,6 +62,8 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
> > >       mkdir -p $(TARGET_DIR)/srv
> > >       mkdir -p $(TARGET_DIR)/var
> > >       ln -s ../run $(TARGET_DIR)/var/run
> > > +     # prevent install scripts to create var/lock as directory
> > > +     ln -s ../run/lock $(TARGET_DIR)/var/lock
> > >       install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf
> > $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
> > >       $(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
> > >  endef
> > > diff --git a/system/skeleton/run/.empty b/system/skeleton/run/lock/.
> > empty
> > > similarity index 100%
> > > rename from system/skeleton/run/.empty
> > > rename to system/skeleton/run/lock/.empty
> > > --
> > > 2.34.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
> >

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
