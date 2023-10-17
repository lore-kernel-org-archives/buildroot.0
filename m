Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2E1CDB483
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 15:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41AA561363;
	Tue, 17 Oct 2023 15:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41AA561363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0w1zWnkNO7g8; Tue, 17 Oct 2023 15:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A6B860D58;
	Tue, 17 Oct 2023 15:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A6B860D58
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4D681BF867
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 15:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AB5E60D58
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 15:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AB5E60D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldM7QOQI30HF for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 15:47:48 +0000 (UTC)
X-Greylist: delayed 2046 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 17 Oct 2023 15:47:48 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18ECE60BC6
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0711.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::711])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18ECE60BC6
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 15:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=h39/KAbg8KE5iH1WS42WeBDHOulAr431utngyWRv5BguR/REY/5EzRBlJy28eblk/oboTRKQA8VJdM/JTioHCCMuPKAJ6pg52DUSl74qVRJ8+ZI+Qorbk70E97bCurucysbfb5l2WSRw31PwBlbtfz+mrwV0IsqZ022jMzmoVeOztvSgvgc7e6yacRee4dJNJkPsDOqWf5oTW7+gnuMzVuv9UN0fzkyrCaL52LA0VPMM6kki5kbf0Gaf1z6X8VKLer1BIpSbK6kAHReHvUcaWKSq99UI60U65xdXq7ugFiv0/Lkltu+Ywsxot8lGbrjvzMo79AufOWpp0V23xyZmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKkbu41PDGcPNvMziYaIlaPw867DyfTwLWApJQV/fIU=;
 b=Z5XPFSSfqZcgut2dkPvhatzi0MYg+l4glmnuacByc/TTeaGlU9ZNZuo27fAMFr37j3ekpOPV/UgUTw3S1jErkMLMMo/+ooQi2NNPcJdtGoeXW9MxZ5LbAk/1ga6lIZ7Gmrp7sHIDPbOmYdRmG7S9tJFptV0VXxEfD4yhgR+eGqbjsbR84FkMyygcNujQI1F+Z6DpQtEcHSq+po8CuPuwnfSZDjZ3Nr8gyb+ypHt3c9eNw089hdwBjs4AGjKaU7WN00nrS0soKYaEXaJ6zuFZwSFoKXzK8ohIVVOkPVtyOUV3tm6qNkt8XQClJ4+m+jpPK48fBs7V6MRoC4kupAAvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.45; Tue, 17 Oct
 2023 15:13:38 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::cea8:bbb1:c66f:e835]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::cea8:bbb1:c66f:e835%4]) with mapi id 15.20.6838.045; Tue, 17 Oct 2023
 15:13:38 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Andreas Naumann <anaumann@ultratronik.de>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] - [Buildroot] [PATCH 0/1] libgpiod v2
Thread-Index: AQHaAQhA2tyddCYWckC7H5zoMf6VmbBOFsPA
Date: Tue, 17 Oct 2023 15:13:38 +0000
Message-ID: <PH1P110MB1603AE1FC3925D2A2D33EEED9FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20231017143424.430007-1-anaumann@ultratronik.de>
In-Reply-To: <20231017143424.430007-1-anaumann@ultratronik.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1155:EE_
x-ms-office365-filtering-correlation-id: 05b7a258-2336-496d-a1bf-08dbcf23a410
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KPPyO0uoe9v6sVJWoj7tIKxBXdf9Sg6NxTn+VcMTc9PmaW+m2QjyO6m2PqHvt9xybMAtbwhaQ1FHdJE+s/ZWSHK2TzRRh+HIY5FCX7G3jxfajdhMIDTLId8DgjCoE02HIoU9yYB8Crf6NuWW/tU8FKYEjfy5ITKRDFAQI2+u1oLyEm7BOSU+EI7nZ77CYv7iqTlTC+Fz1TPPa/1JwCkvW5dSkfhU69B3dzRI+Z9ntOmPy2zjXjxK7MxPtTnKYVHXarHKJ0+iP+dHL0fDh+eaAMfMaA4zUvF/gG8aHaC1ButHX2+qMhLQFFNkTcd/cxRj6nacl7PV03HkdlX18EnMin7L/6g9ZTodgIqn86mL7lQmzNvIHbfb0y/YNOXZuo9DbB2c9JnQhR5x2jnPnr1I+EmjRuahoqaNSaaQIkUQvCuRw0ZxdO+3D3v0VVWBLCUs9t7V0ZCRavHhNQpwzPzfQb6evTqaOJAdV30b26zZ8xkNVn5N3VWvnoavVojQMZubGZGol3Ztt6AewCdNtli9FXsc6y79NgCURHaCfwTEzjJun7zr8AcSREe5oZhtUXSPF8WVFvQUHQHxb3cdo16i/EGAxBy+WIGH9uw6R9l/PzI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39830400003)(366004)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66946007)(66556008)(71200400001)(966005)(508600001)(110136005)(64756008)(76116006)(26005)(53546011)(6506007)(7696005)(41320700001)(8936002)(4326008)(8676002)(52536014)(33656002)(41300700001)(38070700005)(9686003)(2906002)(5660300002)(66476007)(86362001)(83380400001)(38100700002)(122000001)(66446008)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: bEi20NVWckfc5LhDsSFOEtODvHJDP5HwfedaMG40hEeJh7Mnt69ph2lBi4yYxZ1vYjw8nIWxCWULtUt13LAxJVZRGuE9KIMz3T7Wf9dbbO3XtQdhTpreKjDoB0+9HkvqPiweYxecrg47oeC1QSk8tQEe5DHPusyfdYt0TO+2m2cZ3/MB2GVKXzF5FjvsH7ndiJEnaaRNtHa3KxJ6OxXmlKFdvduwPg9dfb3o+SDYCwcPCBKWdUqNYdVK0g9JwYZDKwOog4yJ1Hxa1g+7znsR3JgoGER28EaZxacJ7fYu8jyhmwZdCA355rmKskfSYlw9dGNIv0McbhXjS1CD6T9GrXSZnSpGg/bAM9E/MCXl3lNZswTKQglZkdeUuPSLp67PSWtGZXbWxf/KXYEB8DXwDAW0PUPR2Nh2n9XkgSoejxo=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b7a258-2336-496d-a1bf-08dbcf23a410
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 15:13:38.6100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1155
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKkbu41PDGcPNvMziYaIlaPw867DyfTwLWApJQV/fIU=;
 b=XRBVOTR4yq1oLPEibwtsMJ64ZsyGhVjTWw88KIVYvW5NxvQ6eUPZc0BDaCFJHJWHNtHo40WsuJRha+gEYhMxtBkuBkvedoW9NlSLdqjs08C7NhgF+ZNJb3hVUUgrHvZyBMiOdw3IDagRvnxHzOsREatARRDTLhfjJiSr+QzcM2t8r0yYkvgq0XYrhhahQ2gGeRQPIM/Dr97ZtxCf0yuPWHSbAtG34PDULbzaZZP7rFqeWJzkyUbvDscapkQGKeCHMtWGve6BJIERob4qYWhlL7qiFTM2wLGOfaMjxiq8eSgw7Es+3waUj+DL5iPLRtxm4opzxu32fQ7D/FTwdnBGPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=XRBVOTR4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] -  [PATCH 0/1] libgpiod v2
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
Cc: "bstruempfl@ultratronik.de" <bstruempfl@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, All

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Andreas
> Naumann
> Sent: Tuesday, October 17, 2023 9:34 AM
> To: buildroot@buildroot.org
> Cc: bstruempfl@ultratronik.de; Andreas Naumann
> <anaumann@ultratronik.de>
> Subject: [External] - [Buildroot] [PATCH 0/1] libgpiod v2
> 
> Hi everyone,
> we would like to bump libgpiod to v2 and did so in attached patch.
> However, this breaks API to v1 which some packages depend on, e.g.
> swupdate. Is it preferred to create a new package libgpiod2 instead?
> 

I've held off on doing this series myself due to this specific challenge.

In my opinion, we should patch the packages which depend on libgpiod to 
support building with either version of the library and submit that patches
upstream. Then include that patch in BR with the Upstream: trailer.

> 
> regards,
> Andreas
> 
> 
> 
> Boerge Struempfel (1):
>   package/libgpiod: Bumped to Version 2.0.2
> 
>  ...nfigure-switch-for-building-examples.patch | 91 -------------------
>  package/libgpiod/libgpiod.hash                |  4 +-
>  package/libgpiod/libgpiod.mk                  |  2 +-
>  3 files changed, 3 insertions(+), 94 deletions(-)  delete mode 100644
> package/libgpiod/0001-build-add-a-configure-switch-for-building-
> examples.patch
> 
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
