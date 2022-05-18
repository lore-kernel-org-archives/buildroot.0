Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C6AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 887F661256;
	Wed, 18 May 2022 19:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7oJMj_Qhan8X; Wed, 18 May 2022 19:07:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85EFB60EC0;
	Wed, 18 May 2022 19:07:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 744D41BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62F0583F28
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jackodemononcascadec.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mcJTrCOrtxCl for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:07:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29C5B83F27
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:07:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ft/7qdWVGUoCT3F/Ew6b5nBwtiyISFSEKNWrEwK+YTLHZAJN7fc2wK+i4HPUVUr079QJAbxT5vX8l//y3IhGSHVb+zeQmen06Bk7hRiYNwCIPSMKiWl8nXBbNsBwZF/cKqAnDBitgHgTajT0ZQ3qxLxEKnYJIAyBwQTYbJ1Fn75r9XL6rcVBYVyA0b6NiU6QG72jVHOZbi5mrcmzBG1LZrg6LYHVuha8yJ6dSHYW0BX0YpMRKRcQQBLGmgLnFcisT3qkwuQeWl1IupsrBy6yieec2qNu0IAkDeMnQaqs9Mb1SBOPqmJEHOppoRcuGLbN23JJlDdkgHVORh8LjSoBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+vJn4fs4gTHlKVhJXPmbNblrYB6+zkT8ADozTdT8UU=;
 b=lMwB0mAPwZafLVmvjYvgWoajgRpKsXENQUZzxAHnISQ20oUZCGxeQDz8jbefkQkqcPhA1yEVtew0NUs+ybJc73o+xgZf3+jn7eABtATw95F2XyNbXBLBGQINnFq5WodhoO2Z/cB6sY+sf0qQHcErG/NX+r1fJlrKwH19bptetVvYAHtkE63bG7vy9/ZxzDiZjZpftf+O22CajnIVeMw/1A4YI2VstCjZNmwLBSAHrhdEiemPOvxR8hcHiDY7OxG0UdJ+532svYjYFp8KF7lUYj3clkQ8OL2x4AxI8ENYIByQ7SwQNeTP2Fh9yRurU5HNFhcRZZuIJvsIhDnax/xNOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thejacksons.uk; dmarc=pass action=none
 header.from=thejacksons.uk; dkim=pass header.d=thejacksons.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jackodemononcascadec.onmicrosoft.com;
 s=selector2-jackodemononcascadec-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+vJn4fs4gTHlKVhJXPmbNblrYB6+zkT8ADozTdT8UU=;
 b=d+0b/GAtjmGWKu7Z7k7JNmPZQE5oCcn1vp46SMYcJO7mou07xG2XlP5/oFmyZJ/MB4/YlQhrofpkWfoU1ppq9vNnvDC+A7BBVAHuGXeVcJv4HYeIt9MnIz8BrVnxQ9QjK4Hpvnq2BxaWy6QspK9xgEA7/M8hhHYznjr/kWAJk18=
Received: from AS8PR02MB8662.eurprd02.prod.outlook.com (2603:10a6:20b:54f::18)
 by DB8PR02MB5946.eurprd02.prod.outlook.com (2603:10a6:10:11c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 19:07:05 +0000
Received: from AS8PR02MB8662.eurprd02.prod.outlook.com
 ([fe80::1cef:2aa7:fa3d:c406]) by AS8PR02MB8662.eurprd02.prod.outlook.com
 ([fe80::1cef:2aa7:fa3d:c406%4]) with mapi id 15.20.5273.015; Wed, 18 May 2022
 19:07:05 +0000
From: Dan Jackson <dan@thejacksons.uk>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Any way to configure "nano" to use fallbacks instead of
 terminfo/termcap?
Thread-Index: Adhq6nXbFYMwyOgoS7CGOMbQGwdh2g==
Date: Wed, 18 May 2022 19:07:05 +0000
Message-ID: <AS8PR02MB86628CB220FE769FAA9DDB7FDAD19@AS8PR02MB8662.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=thejacksons.uk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8791367-d2ef-4427-2dda-08da3901991f
x-ms-traffictypediagnostic: DB8PR02MB5946:EE_
x-microsoft-antispam-prvs: <DB8PR02MB59461C3161D9D750775C7D2ADAD19@DB8PR02MB5946.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wbxDaKYPDBvteb+1Mxt3PbaiZONkkNrsfsaLSSnRYNxmST8F5RWvbFERq3gNq9ogYULN1tqzj5nUvrwLw0EyDIN5k+jLWELzcHRbJo6nXtMjwiKCOlid7cvygpXaFG3QZBfesM6bhphS5ouMWt5cO9VhAzRoiddhuWYOhbVDECSEO6Jl9tD0fwkbMKguIV1E4tqOFQWbUck3WLgSQTzoa6wv9PGgteNoj0Ypt8dvFz53pjAe9hdJltHpX1BspRP5AMY5hoGYedmICSjWUb8ISAzznPrnJxyF9zO4P2qAl9hQC1epY951F912T0Zcex9zcu5B0EVeoTmHVn03CPW++pZxPuu+WalIAnmxRDNi7lLgoPKXAaS6IjA+IwmhTcZNPNDSjNsVIwsevbdE8nY4tvuEDpzoNd8bZKB4EkJR5sJ1Zf8csx8I2MJnoT59+9rMWiyOYxEbCUiaU6UD5WGC9/My193zVAmkJO3Yjr8YbHdvh3glrKCDG2gu60p7qsx6Z/7nmoPjxLR+dXrbpweOQJAXPKLsHsrT6zdktoKtPJ+OPHMA50VEUuGoslE5BXaaphUyop2q1MqMGCU2Jphr3s6wIUpOzP829j/RGMyWwLO92F/dLFFm580uqEWEHfqWzZm9Dd0yjomBG0SvfoRkexgKYHDuZjaGYyujkzXc/lwxNBA83gnhcEMMMAVE7Uy3ZacYv18ynWcUOFSG+WgatX0nhUAqjGAcjNJsni4ARhVsjl+IRpURXhP3OeUQ2vR1SmmYBmTfH1XXX7CmciJo7hKVr78j0rZqsQGyYyhj/aZvLtUw2E4hzG6bmX78FmXo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR02MB8662.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39830400003)(376002)(346002)(136003)(396003)(366004)(55016003)(53546011)(83380400001)(2906002)(6916009)(86362001)(33656002)(316002)(41300700001)(508600001)(6506007)(186003)(8936002)(71200400001)(38070700005)(38100700002)(66946007)(76116006)(66556008)(66446008)(122000001)(8676002)(64756008)(7696005)(26005)(9686003)(66476007)(5660300002)(52536014)(66574015)(43043002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iJnnhY84MICJPABIbq1NEGpwFi5rCsKza6Oapny3qAlmKZeFaV6Gu6r6Cdfe?=
 =?us-ascii?Q?7ABseQBgTyiARwFVp+mLJYRK1C06rW+f8ghNlDJfS7q5OAaCD8yE0AzOxqZp?=
 =?us-ascii?Q?WhLsoT+06lVYcIqZy5E5GC2NsoGrW96/7BkTDu1nk2EhSvtplfwcwol8upAG?=
 =?us-ascii?Q?S/tCY6gU5+EH3bhpISYZENTaISa4/bRj1vTlLhPjR6NBKDUiwhgvhhl5Xseb?=
 =?us-ascii?Q?ZW1Yy6Bb8c+vNLPQV9/IkeJllq5V4fCzMIVrsIjSWB96Je/mRcwmjZ5XobMr?=
 =?us-ascii?Q?qIoZOm7xR0NBP2ZErgNCBvqWqV3ol9PN0HydL0q46/eyju2abAJwYsgrEu7P?=
 =?us-ascii?Q?F/0qy3Pt1RlzsiMbgtk0RQTfHwXxsiY/4z0wWagso+EsnHlJjpfaMkMsOLCY?=
 =?us-ascii?Q?rAkDNaY49oRnWFg6Gb4BrMSqkM/wprRgmsRPvtaCSD6ah33jIG+PPpS3tBZn?=
 =?us-ascii?Q?1qlelNVY9mzIquDbkn0MoLNe0qWuTkTAA6PKdeBdXGNxcePyVqRTn9N0yHib?=
 =?us-ascii?Q?uLg4rHbG5q7BwdwvjHSZDzXSQgHNv3iFdylK+PBi3SIQnbjQw8VKVpPPuuXN?=
 =?us-ascii?Q?ogRwv3RqcMkeyM3U0klsQvVlDFKuZSHB1Or3A7tGvqdqbaVYO6LQ0KkqXf+p?=
 =?us-ascii?Q?PrndALbYt9lCyd0VgfVJR120MNDn9wInuRdf/S5JQCM9wYQ1n/2AI5XtFEbn?=
 =?us-ascii?Q?w7TBWl41RgEBGQt9z9phor07872HDIzlFij1NFu6Vu57y/f6TASQx0OePN4J?=
 =?us-ascii?Q?sfOsYrZDhPI9GI0lryv+JZOc8ZVhtHmowdGYtL3zfCpqwIvajxhJcJdxUsoe?=
 =?us-ascii?Q?gpn6mpMSi1sML9/CLw9K/buZJHl1+zkekNyx1k3fIU9kgBlFPoAUoFOEby+S?=
 =?us-ascii?Q?EzCgyK2hTQIMLjuX5xGyAFvqUXPwuj5cry243Vv2wfVEQggkhilfo5W4rHqB?=
 =?us-ascii?Q?ryan0Z2vD9EIZzsGEvcHyWt7NN3N/VvcKkm4WCgvBDIlwrqyEeUOdBhnitMK?=
 =?us-ascii?Q?IUkNU+OQrq1O57KwOz0iW2EwfQUQD4+PVS9ITCypUpRfA40ow1UkTHcCEd2K?=
 =?us-ascii?Q?A+RA2t3rEf6tI54xbzVx1SFnnWgA77F4Mi1Cp/dS5073EFQ1aFBnG/DrPyrE?=
 =?us-ascii?Q?o+mumMGYxd32mAZwbyO4i03vqw4/GN0XcXvF/iC5uDO03ekl34veJfypQDwA?=
 =?us-ascii?Q?QzdRNFdAnOgsjxrKPnDGwD3lBcQD5cPHzv4VyZCLebFn3AOIfJvRn/U/Ffzi?=
 =?us-ascii?Q?9ZmWFMRIeP7P7GTnnFKcK6h25D+MtcrHItUet9yVJ6BMAkSEY+atsW5o65gR?=
 =?us-ascii?Q?94j2EuK2Ui2+oxfSVxOMV1sHvVF7Z3PNlSzsRZd4VGCjgozv5ofYbMJo2goc?=
 =?us-ascii?Q?KdG8ereLUvWzwyh+0QaOC8CjyxrPV37CePxsfTA0XfI0FOt7DfXWbu29YwtQ?=
 =?us-ascii?Q?kflB5V5llGsxgepI96PjuZ0ItDrPVzzL+8FWpn4Ro7LqHHI4x5huC6N8gvhh?=
 =?us-ascii?Q?WCk2tSa1Sz9958uyAQlFwD2QJYPVBdz+ob5mX2c6k8JgKadJ3ncfHkIhokO/?=
 =?us-ascii?Q?bRfvdjMrennjl1X8N/9Y10Zm7i1jstryNJoquNCCyZgtdPXHFAQIZi1BT1q5?=
 =?us-ascii?Q?tFSt3iHKoPk7cYtSzQ4yj5GLXCz51VtOv8zPjrnd9DQTelt6AN4ho9li9UfW?=
 =?us-ascii?Q?K8rcSYkpTexAyepEih+zTADvKQdEUiFP6fGfj8dN1mqXD8Pz?=
MIME-Version: 1.0
X-OriginatorOrg: thejacksons.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB8662.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8791367-d2ef-4427-2dda-08da3901991f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 19:07:05.2741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3dbf3de-d91d-474c-a156-23562e023d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HqvoTcMej1AVhnxTg+l5gkTW6ZY/QgznMAmjfeW7SE1Yt4T0MuAM5ibaKLY/VA6jfRVO9cjLcrKm1KGbPJxzKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5946
Subject: Re: [Buildroot] Any way to configure "nano" to use fallbacks
 instead of terminfo/termcap?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> -----Original Message-----
> From: Peter Korsgaard <peter@korsgaard.com>
> Sent: 15 May 2022 19:15
> To: Dan Jackson <dan@thejacksons.uk>
> Cc: buildroot@buildroot.org
> Subject: Re: Any way to configure "nano" to use fallbacks instead of 
> terminfo/termcap?
> 
> >>>>> "Dan" == Dan Jackson <dan@thejacksons.uk> writes:
> 
>  > Is there a way to enable the configuration options "--disable-database"
> and "--with-fallbacks" for the "nano" package?
>  > I built a "nano" binary using buildroot to make my exploration of 
> my  > internet router a little easier, however when trying to use it I 
> get  > an "Error opening terminal" message. I found a Stackoverflow 
> post  >
> (https://stackoverflow.com/questions/53320009/error-opening-terminal-
> vt100-while-running-a-binary-with-ncurses-on-arm)
>  > that suggests I need to build "nano" using the above-mentioned 
> options  > so that terminal information is baked-in to the nano binary 
> instead of  > it trying to read that from disk.
> 
>  > However I don't see an obvious way to do this from buildroot's 
> menuconfig?
> 
> Not directly. Notice that this is configure options for ncurses, not for nano.
> 
> For a quick test you can you naturally just adjust 
> package/ncurses/ncurses.mk.

Ah I see. Can it only be done by manually changing the ncurses.mk, or can I write a patch that I can use with buildroot's patch system for packages to do it "properly"?

> 
> --
> Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
