Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B64C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 609CB404D5;
	Thu, 19 Jan 2023 10:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 609CB404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DoVB02RtW7zF; Thu, 19 Jan 2023 10:08:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F93740377;
	Thu, 19 Jan 2023 10:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F93740377
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5EDE1BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ED6F60A46
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ED6F60A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HJOYw1LApTo for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:08:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63F2A60644
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2086.outbound.protection.outlook.com [40.107.241.86])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63F2A60644
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:08:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffy9Zm2x3y7yKjo03UQvjcoTC8IDU9HO8YDWumic+dHhRZ7NJYR4wu2Qkr4lTLVOD9NSqjqD+RlqbMXM3zMDUccPV7Dwl18+LerriLA8l6Hxs+wHGIggO+541k97QfGuxLZDgC6MAP2KVZ9hDkfvJMWrBZrNpbHZmCVwWIV4PmxJDWACXkOkgEdGcoOSOkuhJ/x3cMc5e7mUfSGxDufpAi97q3HjIninRtZ/6fKjjUeBcYp0u6u5ulUlZlV89NGxaMozdUuStVnJ0qnhWbiH4erH4cv+FP/J2lLkRIlKDbvIaS4NPN8PE2oJdcO2MIlt2T5iuJWrr6jydfIWYLkXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKno7VakeYd0tYwPS2qQW3jl3aD+8tFgMfonzyIwQMg=;
 b=cucXFNoIdNu2LWukI3Ol0+QHqI7RgKvO9wlBgzdXlXR/v3ewkfrHx++wNdz9vmUApC29q14yuAOkjt/7f2KcNW+9TsuiZ2Gwvewctwu+FhgplcOfse/oR/pTb3OyFnacQu+4EHj6V5Cw3V31XF1jnPkpO3AbLY9GUIJaW9aq2IHhwyScPEyt6WsQV3JfTaOCMPKOYVQJeIPCIeUHsrVfQ7zhdfivnJesbYSXyuEs2KTGXEl2EtEJ7Jo9LN5JQOge1IT+SiRBCyQWRz6yMUM1phJEeLuNiyUzlND5brkP+H8AvutAN281wkDMEnR7pfnX0i3IkrgMKvYIu8N5wXQOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PR3P190MB0826.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:92::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:08:02 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:08:02 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 25/45] package/libgee: switch to https download
Thread-Index: AQHZK+ya94gN925mlUC9CSAaLihg5A==
Date: Thu, 19 Jan 2023 10:08:02 +0000
Message-ID: <VI1P190MB0493F3419CCAC9DC9FCB06639FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PR3P190MB0826:EE_
x-ms-office365-filtering-correlation-id: ed3aaba0-366d-42b9-8dc4-08dafa050cd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iF6jj/70+1jvdS16tebq/IC5RR+bagThSK03WznDwjZ1PJln0Fl2plq8KwBIJQTrPrVom7bmK2c3VYWqLwPYB+IWXgg5lmzg36zxyUPLRww1P9rARRxNzSWWKHsH2YYcOR+tvtRZQ872peKWVqCcMhEC5egQTgd7T93SL8aoqrVHKmhcpZ3m7upjj+Wt4YLBUIrERknLTM5+CKsPBfBEmBp9PMLK/NZdCiC8lpk+iIqpAR2oQqnZZMVDoKtGKBmIJ6u36qMFqx/8BEnP8lAc/N7QAAWvDKrQEZMK7SslwFLbfutQvvK741u6pQMOCkl/b9nVR3ovo7A3bQz/+AHJch+HKTafYCg8FDFPayDmRxSN1MsAtkJ4xBvZVRetgzTU32SsQzMMxf3VZrNQ9XnuO55iOhr7iYsrvMqb5ujCMXs26QQZd6MfI+ZTaXa9rKApsN848oriy2pfsDiPB0qywB22TKw7mxAi1Jo2eUimykvW3NtdmP0PY4a7fjk7/6TGZuri8b4fpIFxF3cNujIB+55tQTYxCDTkC6AQNarjKpQT65LC1oor9BWlRNkUYfr3O4rQuMqor0BG17tExY86jCUEciz7uCsIFdShGfV5dH0Oey6EwUu0zeZwZgfqh3i2UbdyxDg/g7Sv05vSh4ABdmKJReqMCEavwka1eUGgHmPekPntJbQ947+uQpPdKu8jkhtzrBFCYrnqd9jbQmpBVJcs/POZeSMp9q6LJSeDnKE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39840400004)(366004)(451199015)(86362001)(6506007)(33656002)(966005)(478600001)(7696005)(71200400001)(8936002)(122000001)(52536014)(5660300002)(316002)(38100700002)(66556008)(66946007)(66446008)(66476007)(4326008)(6916009)(8676002)(64756008)(76116006)(41300700001)(9686003)(186003)(26005)(2906002)(38070700005)(55016003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DfRWuComTyk64ZgKeH4wEebYSxALZRT8Kb3Ys9fgh3LLozYBatnLvrj013?=
 =?iso-8859-1?Q?iQLTLYya5/uIqaPhMyZtxlT90OIDsBEWCbIymoMEXqUNKKEBvCuMFNJcUB?=
 =?iso-8859-1?Q?ASvYxlZtZeGT91ucHB+zSBPvJ23Idhrkbds2cEPr8Q3YvjcmwaRP4hmJWG?=
 =?iso-8859-1?Q?K3E2Upyv7iwVcsdpSc6sEN0Km0tmpktGvf2FYNmHTHOTjJoIksYKV5b67b?=
 =?iso-8859-1?Q?uY1VRz73vdj7iqaMrvDyG098OTqUF90k/55br02TvvZtV0ROBeXDnUhtB5?=
 =?iso-8859-1?Q?7uk1Vlg7jKalQ6cp+NStwTCFY1m4kqSc8cJvYQINfg2yRo3goqAQkBoutq?=
 =?iso-8859-1?Q?tdIHx/S7mwni7+KPeH9hyFFcaoihgr9GEG10VluBR1krHZeMhl1di395yK?=
 =?iso-8859-1?Q?TTYzO/h+5BAjcum699vD/ds6y4ac5CZG5KObccBZYZsf0KL3zy5OyRfiMe?=
 =?iso-8859-1?Q?HlbJssehsd5WJF0YPV+X1mJZzv2QGdgQoC0NHJkEZPDZ7MdKJ/ScgLvS44?=
 =?iso-8859-1?Q?ZuCKqJhJAJsmFAtfvB+xjtcceljOAdMZi+gdowzdQbzcXEny6PA/GsvkNp?=
 =?iso-8859-1?Q?25KqTCdJuTT6sVHe6zF1mBmZRZKDj7GZ25zAR33FWtMg0Zw3yjf3BL/Lhu?=
 =?iso-8859-1?Q?WankgZZPt30gGbLNPhfR7sITXiir0Dao27fxQjD8MMobAaBcTyuAogm22O?=
 =?iso-8859-1?Q?XtThJqyThyWOFAgntnkccczzN+IMGkZgd3NJRP5e8sr6J7L2HBeFd1TZjB?=
 =?iso-8859-1?Q?4YvDFgHU/HYXOZgew+53bieLroexsm7C3NGzb71C2s+z74rqov3QTnbi6Q?=
 =?iso-8859-1?Q?/3bd54vxXBdjUqR4hO59MM/WwP4Hlj4s5vo7RsseTBndBt9fUwkk0iYH41?=
 =?iso-8859-1?Q?lO039rBzprp14ZAKDH3rfrQXTEWjQJRf4flANDujtdWwkalb/vP540X3QV?=
 =?iso-8859-1?Q?2He0HgEgM7n2b+GzIltOJYi24vfNsJtBl6POWy1e3dVZHqhxcszStK3u7x?=
 =?iso-8859-1?Q?D57+3jd1GjyclH241qjx0bSfGwHzVJQVxzDH3OjkcnQx0b9jLusivNsk5z?=
 =?iso-8859-1?Q?3XsjsOK/eer278KHJNWeEG/ueh9eExkQIcuElMc3KnX9Qrv/AC/7q4wHHN?=
 =?iso-8859-1?Q?TNp1hRF6gWlGXNSYjdAGwTgtoCiEnvMDJO2tN1ygU1EhG6WNKF3Y7wZpyu?=
 =?iso-8859-1?Q?6jgwtHO/PaJ9mkMJbSFQEsgSvyfM20VyJjGhXAVY+dPFOOUWU+XTfSQKoV?=
 =?iso-8859-1?Q?0IW50vL0AooIrush88EOO5XwbWElo3C3o3ZJeiTJEi/vDOzFnhRGYlBs37?=
 =?iso-8859-1?Q?AP+dZJQxYhyqDYW2R5pnKgJW5SXZn113VMthvsGrXpDvsapTwcesM1PeD7?=
 =?iso-8859-1?Q?3uQt7H0sseT1VZf5KxuqhFTkRui9zUkTO4tblvygqCJvxShOXnqliWUA96?=
 =?iso-8859-1?Q?lvTh5Ms1aC7yDuysIz2D0pxpSDwS6oQjYsp3IjZDkiziAboB+YoDqqO0dn?=
 =?iso-8859-1?Q?UGR2JD61T8UiR+AYbDJtvqy5Y33ATGj1xfUjF/8DO/L76tnFo3YUJ4P4ys?=
 =?iso-8859-1?Q?3T7yg/F6iE4QqfPG+TOfAi+qYOc8dyIdrhhmQ0DtAgpm5ikUlSkbusxOZk?=
 =?iso-8859-1?Q?3OpVkIPU5n4YQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3aaba0-366d-42b9-8dc4-08dafa050cd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:08:02.3227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T98zgr8WGUcdB7Ic5FpvoShZOE+9ytgF5kyArGCDn91WB7rXJNSsGFatkZDgyae0mgDH4iE7A5m8Ju+cVYHwoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB0826
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKno7VakeYd0tYwPS2qQW3jl3aD+8tFgMfonzyIwQMg=;
 b=ojs/NKjCEleEzJ0aDGBcrsiz2nmao9Mw/RPFGD2hrSEpnqKSXvUq83+u8e1wUdZilKnj4HhpJS0k8YnWyLGr5g+mFbjkhrT3NGxsKxFA4inxjsnVczsR8MIX17i+NrSj81XA5Rv2wbj+lYoIfJAX6P6UFrzf7whVFe5WrlY2TAE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=ojs/NKjC
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 25/45] package/libgee: switch to https download
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libgee/libgee.hash | 2 +-
 package/libgee/libgee.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
index ea723481e4..f733bf34a8 100644
--- a/package/libgee/libgee.hash
+++ b/package/libgee/libgee.hash
@@ -1,4 +1,4 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.20/libgee-0.20.6.sha256sum
+# From https://download.gnome.org/sources/libgee/0.20/libgee-0.20.6.sha256sum
 sha256  1bf834f5e10d60cc6124d74ed3c1dd38da646787fbf7872220b8b4068e476d4d  libgee-0.20.6.tar.xz
 
 # Hash for license file:
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 5ce56a2b3b..36eddef171 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -6,7 +6,7 @@
 
 LIBGEE_VERSION_MAJOR = 0.20
 LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).6
-LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJOR)
+LIBGEE_SITE = https://download.gnome.org/sources/libgee/$(LIBGEE_VERSION_MAJOR)
 LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
 LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
 LIBGEE_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
