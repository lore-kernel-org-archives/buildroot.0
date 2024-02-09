Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148BCC48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 19:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69FFD85296;
	Fri,  9 Feb 2024 19:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6dRo92RRLrw; Fri,  9 Feb 2024 19:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A5BD85251
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A5BD85251;
	Fri,  9 Feb 2024 19:02:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A38D71BF30A
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 19:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 906816082E
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 19:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPZa5rrlbIpk for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 19:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:260e::600;
 helo=eur03-am7-obe.outbound.protection.outlook.com;
 envelope-from=roy.kollen.svendsen@akersolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE8CB6082D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE8CB6082D
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260e::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE8CB6082D
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 19:02:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwBgKPubmk8MuFiedK8qOqcnzN7s3QvTfI0HhMxYeHg2YHbW3Va8vKdy93oeWl8uhZ0nLEfRWY8Rdj5zjOSpuhqDNGz5Wo0fHvUAGYNPR2n3UdlhSMBuqC0UOwYCEWHsO0LimJHoWBL4LwXUQYlt+WwpietEba3cW2AUI28USvGQlqtA/LYhll2G3XFHrXCkJ3POx2gCYLPI6shQ3AEOc36MCA08BI18uKNKM/VC6EPNYxbR4OmBeGcKUsYOO/1YL9ISRKAYp0fqaI++1nXpk/jawR97WHGHtSidaAa+F+lSpltksn6f1up5r2uzp5D0RC21Bv0MaMYYIZjamYmQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUQJ1zwUzcByP9ZkBY7b/U7+QhrbHe8LhL8YvrHlvw0=;
 b=NiLkTQAdwTmk80173ICDHcl4aj+4MkJNMs19IRk1KK8xTJrITTqup08B40BRJr8oXscV/010pIcDG/+W5nnSwe7QVCo7jKTV/YdqeFz8AFwjqFoYhBGF0gIFSMoMhY0cMmAStkWowZvlzlLF/SZ4Blqi1Y/IVNXYfnI/X59qhtZqkw0Z3Y5NFO3OYcbjaqPbYckyEdUmxSCFmIgcdeezXGIFXaHLeaAa6PbXsdCJDFASq126QIGqVG93bEL3pDU07X/XuWXbAu/MeyMvYUglOHrYlrv7/dmAV/GKJBusR2l5lsd8OOKRWsid6FzNgYInU8c7FjX1qMdzaCAq0/zurg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=akersolutions.com; dmarc=pass action=none
 header.from=akersolutions.com; dkim=pass header.d=akersolutions.com; arc=none
Received: from PAXPR06MB8505.eurprd06.prod.outlook.com (2603:10a6:102:2b9::19)
 by AM0PR06MB6468.eurprd06.prod.outlook.com (2603:10a6:208:19d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.26; Fri, 9 Feb
 2024 19:02:18 +0000
Received: from PAXPR06MB8505.eurprd06.prod.outlook.com
 ([fe80::526b:5fd8:6925:d387]) by PAXPR06MB8505.eurprd06.prod.outlook.com
 ([fe80::526b:5fd8:6925:d387%4]) with mapi id 15.20.7270.025; Fri, 9 Feb 2024
 19:02:18 +0000
From: "Svendsen, Roy Kollen" <Roy.Kollen.Svendsen@akersolutions.com>
To: Peter Seiderer <ps.report@gmx.net>, Roy Kollen Svendsen
 <roykollensvendsen@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/qt53d: bump to latest kde
 submodule version
Thread-Index: AQHaW2Oi2dOt8nsx8EaMgswdG8p9T7ECG/EAgAA/0tM=
Date: Fri, 9 Feb 2024 19:02:17 +0000
Message-ID: <PAXPR06MB850591BCC38808B38041C322BB4B2@PAXPR06MB8505.eurprd06.prod.outlook.com>
References: <20240209104705.1825396-1-sebastian.weyer@smile.fr>
 <20240209142326.2570138-2-roy.kollen.svendsen@akersolutions.com>
 <20240209160504.1d6f7ae5@gmx.net>
In-Reply-To: <20240209160504.1d6f7ae5@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR06MB8505:EE_|AM0PR06MB6468:EE_
x-ms-office365-filtering-correlation-id: eefd6102-dabc-446d-1103-08dc29a1a2f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1WFmFTveuPZH22RVTLGQ1xoqvqZyySC3qJ5f6AIch+xPU5lGTKJjswuyznGoswbUCLRDFqit41L6wBNGYyla4SwG/a1cGluigZlUWZnkfX7eSsP1kzOD+VV7lC0r8CximqXilBXbyWquSN77bucfphHKofCEZ42x5TjjeeNtd1Wslf4XQaiZ7VVeOp/Oa7+KbK5tpVOjhUJJYfbmYW+1uoOO21AEek2VORbAYpJiB1a/iO9vymnluI/sUsjK8yvgfdDm86YDFeE51IZ5a5zUpQuXOhbv5/D8YOWCTxl5bN5AGdEm+QD7mRF8bDnBcaG5fsE1Zbf9Nha3q35Tr3YzgWYZ8+zP1mAYNWwdUXxgCorhzz5vEdgILizicgzjuoZ8jr8dZe8vh16gfirL7Qt45U025s33Wo1clfOCD7WTSEomsQw9MMFu9o4fmHoXb56t5xu+ZEL43o0Uc1rOoY8/jiyEsgd9YIEgnWzox9CgLCy5stqIEUdtLefwXlkmXWO7xgAv0NdfYneUht/ukIL10aBTMMxRszSvbIGycUIoDi9WLVe3GckesKafeliZkNC7zyBG88jkx1BsKuiUe1vSY19507DnqDBGN66ZSIK0M+Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR06MB8505.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(230273577357003)(230473577357003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(52536014)(8936002)(4326008)(8676002)(5660300002)(2906002)(83380400001)(38100700002)(33656002)(122000001)(86362001)(26005)(166002)(82960400001)(38070700009)(66556008)(110136005)(91956017)(76116006)(66946007)(66476007)(66446008)(64756008)(54906003)(316002)(7696005)(1015004)(6506007)(71200400001)(53546011)(966005)(478600001)(45080400002)(9686003)(55016003)(19627405001)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NI0SEyI6tfCMOhkf3T7rZ3iE67AUmizbcsTDTNOoF5eoxNBIdwH1Z6V52Z?=
 =?iso-8859-1?Q?yeBaljTjDzrx0oXOOp6C1dDzcChdQBRM2yVAx70B2tvK2Gzz3cdtQI0pOL?=
 =?iso-8859-1?Q?f/bYM3TCeXznyR6cskJpdKcuwESBCpe/kLqDJuFPp6zyZcrDvwzurgcNB6?=
 =?iso-8859-1?Q?8ZVO3f1IQbEzQd6eJ+swxtQyoj5KgeIqRp/6zONNht9hU3KiCYxREbUKCl?=
 =?iso-8859-1?Q?kgxrTq3agDOxAoIW22H5aCKj05O6q7Oyoh7TWT1DicfK4mRmiv+Y37m6OB?=
 =?iso-8859-1?Q?iTBWcr4d8u9WjZICjzvFGKMoFeHczCpu12AK8sI5hVOJN+8Splzf6d9NVT?=
 =?iso-8859-1?Q?yziCcdmHwuoVfx4kthFWyRBBk9v2cRTpgQUM7SqdhZ6UFPnodYOayU2gXU?=
 =?iso-8859-1?Q?metdNFIoIbLxV0/0/ukAuiDCZSLvO1uvdKwHuHAo0Bwl87AFuoL6AcKGJl?=
 =?iso-8859-1?Q?aNEy7X7RNbz+63Nd6h9bCCQQplPT9QFqZT8unxfMF1h+crY3kkZNHxytDY?=
 =?iso-8859-1?Q?PmFSSMkRYjAy5DIfRWmQkzt+lEa+P8ljI5yE1ybNQZFbwp2Zfv5TMzweyP?=
 =?iso-8859-1?Q?h1SiXiNKTfbTltEaWypJH20pxn9n+fPmuHeM6iRdN+sPqfsfgLlpnA3qmT?=
 =?iso-8859-1?Q?YJTvG/0wIYzwPN0qDm580C+y+aJdjyfyNRf6vCdR7Z6rT/la5ZBzl/5den?=
 =?iso-8859-1?Q?irTaZJoHqrVlZM2IXq5sz5pgcCHSqF9YbSHtG+Zb9LroIZPbbIf5VT9dCx?=
 =?iso-8859-1?Q?SvStuM7fKA6bfe8wK4yCiY2WKOnGTdWp4wDYOhWEOMZBkdT/GmW3TPND0W?=
 =?iso-8859-1?Q?kIF88pcL3MsKbpYIXDkELdSxbkOJGxj7ihQr8q+J/OBs7SgJbz+pnPZkRq?=
 =?iso-8859-1?Q?P8Ldq7lw0IK1TWIEdyUr4yL6MzyFJAcIUldH4A5AgAxwwRTdHnq7vBruEi?=
 =?iso-8859-1?Q?6bleSdWuenBgmXN4MKnC3ps9nVgYUIlJEz37R4QS2nIf0WJuncmv/1x7s0?=
 =?iso-8859-1?Q?JXobFBX8M7w+h1rVISytoopawjuaJCV1fg7UiC5Fo7AfOemK7msvtzkV9P?=
 =?iso-8859-1?Q?xrThbluzMgLuCQtqzq5a0yGmlBSman5cb/Fgcn+JCPdVf8CO9KP0F8okFi?=
 =?iso-8859-1?Q?lTbKzxaKG1CGuQ60A1jmbesGjz1s/piMakQhR7IOYMtAnte94k/ZRbrKdC?=
 =?iso-8859-1?Q?srI326RmqsRI0sag6jDSugL89ncz52RhN+zG9yDnxl/031H/+Hw5clhhf9?=
 =?iso-8859-1?Q?JLr+UvoLsa37leToBaPrf1oufgCKKQr65Pk0aGrxYkz4n8uo4tfzHgDx8O?=
 =?iso-8859-1?Q?8TugDi56AIHOTJuTOzNuKb0WigxIZIdRCVxYXbKJFpefV6GOWijwQ5cy1V?=
 =?iso-8859-1?Q?XxyjNFQgCrMarbMJn2GAuw9AGtv4IC5wuZo+pLK1oO5Irw+vY22ZXObz4s?=
 =?iso-8859-1?Q?khlcVRA02F+e0i5xUXppWFIVZsDQ81K44rTd+WhlRn+WAnx4cE9K0mw9u/?=
 =?iso-8859-1?Q?hwElkxpUnMdyNxJe/ffpd+Kg1KjtTWbetbYEEiue3YwlLclsa9QE6EPBca?=
 =?iso-8859-1?Q?fjaAtqhLqoVSaEkPHZrBIdHRNgI93+TPLZD45NXBMLReALaZc/Y/QjXEKZ?=
 =?iso-8859-1?Q?QGgGh80YeEGJgzsz85EnqR1ZOuHwzXG5vnH1YT8DX/QbAvPF6Tg/CSbldd?=
 =?iso-8859-1?Q?7SdDj3y1gAfywqFioe8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: akersolutions.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8505.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eefd6102-dabc-446d-1103-08dc29a1a2f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 19:02:17.9821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 26b749f6-8c72-44e3-bbde-ae3de07b4206
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ngbn43L31twMwUD9LynZtgwad9lRbR05RM7nkkcxNXa8fBRVQI0kPZQQmC5dJy0L2KKh7h4jg0GoeEIR+daiwgo12ishSdPwSfei8gJAD/vDnsiexOcDe6LY/lBDqW7i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6468
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=akersolutions.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUQJ1zwUzcByP9ZkBY7b/U7+QhrbHe8LhL8YvrHlvw0=;
 b=i9MZZ/BqIBajP77qfdl+igUOMh+EIlTmQq4ir/MLS+QXV15OJjRfsMgaiOKHA6T5uTMN7nPh9xDkiWFzzGKXUJ9PFUyegUk46Yz7zb2AcbhvtNqwZOR0AC2aHFDRj2bzuISqEPAz8MeQupIKjpZpEdV+NjcQSsPLu8c/EXAL90W8p5Uvq62kzM5pAm48A2z1Ivc20ayeM/6kKnhGcuAyfDbkGHEi64RDqV4utcGcDicalj2C2ku+7NqxX+RPBkVMsyTYzNvNevKHuQTu38vFoJIrmDeCrSeE8x6p4FCrWnSh4dFgb7u6eqj5TCzHAawEgnXUnYie6/qe1g/yXQJ33g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=akersolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=akersolutions.com header.i=@akersolutions.com
 header.a=rsa-sha256 header.s=selector1 header.b=i9MZZ/Bq
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=akersolutions.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/qt53d: bump to latest kde
 submodule version
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 "sebastian.weyer@smile.fr" <sebastian.weyer@smile.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5205204860119157605=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5205204860119157605==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PAXPR06MB850591BCC38808B38041C322BB4B2PAXPR06MB8505eurp_"

--_000_PAXPR06MB850591BCC38808B38041C322BB4B2PAXPR06MB8505eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I will change the state of this patch to 'Not Applicable' since the version=
 that was recently pushed to master builds successfully.

This patch was actually meant as part of a bump to 5.15.12.

Regards,
Roy

________________________________
From: Peter Seiderer <ps.report@gmx.net>
Sent: Friday, February 9, 2024 4:05 PM
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Svendsen, Roy Kollen=
 <Roy.Kollen.Svendsen@akersolutions.com>; sebastian.weyer@smile.fr <sebasti=
an.weyer@smile.fr>; Giulio Benetti <giulio.benetti@benettiengineering.com>;=
 Julien Corjon <corjon.j@ecagroup.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt53d: bump to latest kde subm=
odule version

[You don't often get email from ps.report@gmx.net. Learn why this is import=
ant at https://aka.ms/LearnAboutSenderIdentification ]

CAUTION: This email originated from outside of Aker Solutions. Exercise cau=
tion when responding, opening attachments and clicking links.


On Fri,  9 Feb 2024 15:23:26 +0100, Roy Kollen Svendsen <roykollensvendsen@=
gmail.com> wrote:

> The build failed because assimp was missing.

There is already an assimp dependency in package/qt5/qt53d/qt53d.mk (see [1=
]):

14:  ifeq ($(BR2_PACKAGE_ASSIMP),y)
15:  QT53D_DEPENDENCIES +=3D assimp
16:  endif

Regards,
Peter

[1] https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
lab.com%2Fbuildroot.org%2Fbuildroot%2F-%2Fblame%2Fmaster%2Fpackage%2Fqt5%2F=
qt53d%2Fqt53d.mk%3Fref_type%3Dheads%23L14&data=3D05%7C02%7Croy.kollen.svend=
sen%40akersolutions.com%7Cc9ad43b7795d4a21fbb008dc298082d7%7C26b749f68c7244=
e3bbdeae3de07b4206%7C0%7C0%7C638430879122415164%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7=
C&sdata=3DVDhBLxcvmZSPA96XrMcW9EDA%2B0%2BCM6DxSj2F7AKIWto%3D&reserved=3D0<h=
ttps://gitlab.com/buildroot.org/buildroot/-/blame/master/package/qt5/qt53d/=
qt53d.mk?ref_type=3Dheads#L14>


>
> Use git instead of downloading the tar-ball so that
> we also fetch the associated assimp src submodule.
>
> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com=
>
> ---
>  package/qt5/qt53d/qt53d.hash | 2 +-
>  package/qt5/qt53d/qt53d.mk   | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
> index 0f63aab72a..81de91558e 100644
> --- a/package/qt5/qt53d/qt53d.hash
> +++ b/package/qt5/qt53d/qt53d.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  44955f90a9af19d80136cb51a929f330ba9e3319d30d1f5d0c2bb4adc7fd7173=
  qt3d-5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016.tar.bz2
> +sha256  bab48eab35184144fc8789d2958a983a60bfc8dfa242cb65966a3d129fddaea7=
  qt53d-e1b1a0d2970fd384bd52c734a72536d8452ad070-br1.tar.gz
>
>  # Hashes for license files:
>  sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253=
  LICENSE.GPL
> diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
> index 4b748a4972..8fcfb72fec 100644
> --- a/package/qt5/qt53d/qt53d.mk
> +++ b/package/qt5/qt53d/qt53d.mk
> @@ -4,9 +4,10 @@
>  #
>  ########################################################################=
########
>
> -QT53D_VERSION =3D 5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016
> -QT53D_SITE =3D $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)
> -QT53D_SOURCE =3D qt3d-$(QT53D_VERSION).tar.bz2
> +QT53D_VERSION =3D e1b1a0d2970fd384bd52c734a72536d8452ad070
> +QT53D_SITE =3D $(QT5_SITE)/qt3d
> +QT53D_SITE_METHOD =3D git
> +QT53D_GIT_SUBMODULES =3D YES
>  QT53D_DEPENDENCIES =3D qt5declarative
>  QT53D_INSTALL_STAGING =3D YES
>  QT53D_SYNC_QT_HEADERS =3D YES

This e-mail and any attachment are confidential and may be privileged or ot=
herwise protected from disclosure. It is solely intended for the person(s) =
named above. If you are not the intended recipient, any reading, use, discl=
osure, copying or distribution of all or parts of this e-mail or associated=
 attachments is strictly prohibited. If you are not an intended recipient, =
please notify the sender immediately by replying to this message or by tele=
phone and delete this e-mail and any attachments permanently from your syst=
em.

--_000_PAXPR06MB850591BCC38808B38041C322BB4B2PAXPR06MB8505eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I will change the state of this patch to 'Not Applicable' since the version=
 that was recently pushed to master builds successfully.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
This patch was actually meant as part of a bump to 5.15.12.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Roy<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div dir=3D"ltr" id=3D"divRplyFwdMsg"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Peter =
Seiderer &lt;ps.report@gmx.net&gt;<br>
<b>Sent:</b>&nbsp;Friday, February 9, 2024 4:05 PM<br>
<b>To:</b>&nbsp;Roy Kollen Svendsen &lt;roykollensvendsen@gmail.com&gt;<br>
<b>Cc:</b>&nbsp;buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;; Sv=
endsen, Roy Kollen &lt;Roy.Kollen.Svendsen@akersolutions.com&gt;; sebastian=
.weyer@smile.fr &lt;sebastian.weyer@smile.fr&gt;; Giulio Benetti &lt;giulio=
.benetti@benettiengineering.com&gt;; Julien Corjon &lt;corjon.j@ecagroup.co=
m&gt;<br>
<b>Subject:</b>&nbsp;Re: [Buildroot] [PATCH 1/1] package/qt53d: bump to lat=
est kde submodule version</span>
<div>&nbsp;</div>
</div>
<div><span style=3D"font-size: 11pt;">[You don't often get email from ps.re=
port@gmx.net. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification" id=3D"OWA076a3882=
-e198-4007-9dc4-f381b299dabb" class=3D"OWAAutoLink" data-auth=3D"NotApplica=
ble" data-loopstyle=3D"linkonly">
https://aka.ms/LearnAboutSenderIdentification</a>&nbsp;]<br>
<br>
CAUTION: This email originated from outside of Aker Solutions. Exercise cau=
tion when responding, opening attachments and clicking links.<br>
<br>
<br>
On Fri,&nbsp; 9 Feb 2024 15:23:26 +0100, Roy Kollen Svendsen &lt;roykollens=
vendsen@gmail.com&gt; wrote:<br>
<br>
&gt; The build failed because assimp was missing.<br>
<br>
There is already an assimp dependency in package/qt5/qt53d/qt53d.mk (see [1=
]):<br>
<br>
14:&nbsp; ifeq ($(BR2_PACKAGE_ASSIMP),y)<br>
15:&nbsp; QT53D_DEPENDENCIES +=3D assimp<br>
16:&nbsp; endif<br>
<br>
Regards,<br>
Peter<br>
<br>
[1] <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/blame/master/pa=
ckage/qt5/qt53d/qt53d.mk?ref_type=3Dheads#L14" id=3D"OWAd67ffadd-c805-0e95-=
5f12-7507bc8e3bde" class=3D"OWAAutoLink" data-auth=3D"NotApplicable" data-l=
oopstyle=3D"linkonly">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
com%2Fbuildroot.org%2Fbuildroot%2F-%2Fblame%2Fmaster%2Fpackage%2Fqt5%2Fqt53=
d%2Fqt53d.mk%3Fref_type%3Dheads%23L14&amp;data=3D05%7C02%7Croy.kollen.svend=
sen%40akersolutions.com%7Cc9ad43b7795d4a21fbb008dc298082d7%7C26b749f68c7244=
e3bbdeae3de07b4206%7C0%7C0%7C638430879122415164%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7=
C&amp;sdata=3DVDhBLxcvmZSPA96XrMcW9EDA%2B0%2BCM6DxSj2F7AKIWto%3D&amp;reserv=
ed=3D0</a><br>
<br>
<br>
&gt;<br>
&gt; Use git instead of downloading the tar-ball so that<br>
&gt; we also fetch the associated assimp src submodule.<br>
&gt;<br>
&gt; Signed-off-by: Roy Kollen Svendsen &lt;roy.kollen.svendsen@akersolutio=
ns.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; package/qt5/qt53d/qt53d.hash | 2 +-<br>
&gt;&nbsp; package/qt5/qt53d/qt53d.mk&nbsp;&nbsp; | 7 ++++---<br>
&gt;&nbsp; 2 files changed, 5 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.ha=
sh<br>
&gt; index 0f63aab72a..81de91558e 100644<br>
&gt; --- a/package/qt5/qt53d/qt53d.hash<br>
&gt; +++ b/package/qt5/qt53d/qt53d.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;&nbsp; # Locally calculated<br>
&gt; -sha256&nbsp; 44955f90a9af19d80136cb51a929f330ba9e3319d30d1f5d0c2bb4ad=
c7fd7173&nbsp; qt3d-5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016.tar.bz2<br>
&gt; +sha256&nbsp; bab48eab35184144fc8789d2958a983a60bfc8dfa242cb65966a3d12=
9fddaea7&nbsp; qt53d-e1b1a0d2970fd384bd52c734a72536d8452ad070-br1.tar.gz<br=
>
&gt;<br>
&gt;&nbsp; # Hashes for license files:<br>
&gt;&nbsp; sha256&nbsp; edfe70e99be2a7c109d860b19204609e582720b211c50caedac=
729da372a1253&nbsp; LICENSE.GPL<br>
&gt; diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk<b=
r>
&gt; index 4b748a4972..8fcfb72fec 100644<br>
&gt; --- a/package/qt5/qt53d/qt53d.mk<br>
&gt; +++ b/package/qt5/qt53d/qt53d.mk<br>
&gt; @@ -4,9 +4,10 @@<br>
&gt;&nbsp; #<br>
&gt;&nbsp; ################################################################=
################<br>
&gt;<br>
&gt; -QT53D_VERSION =3D 5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016<br>
&gt; -QT53D_SITE =3D $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)<br>
&gt; -QT53D_SOURCE =3D qt3d-$(QT53D_VERSION).tar.bz2<br>
&gt; +QT53D_VERSION =3D e1b1a0d2970fd384bd52c734a72536d8452ad070<br>
&gt; +QT53D_SITE =3D $(QT5_SITE)/qt3d<br>
&gt; +QT53D_SITE_METHOD =3D git<br>
&gt; +QT53D_GIT_SUBMODULES =3D YES<br>
&gt;&nbsp; QT53D_DEPENDENCIES =3D qt5declarative<br>
&gt;&nbsp; QT53D_INSTALL_STAGING =3D YES<br>
&gt;&nbsp; QT53D_SYNC_QT_HEADERS =3D YES<br>
<br>
</span></div>
This e-mail and any attachment are confidential and may be privileged or ot=
herwise protected from disclosure. It is solely intended for the person(s) =
named above. If you are not the intended recipient, any reading, use, discl=
osure, copying or distribution of
 all or parts of this e-mail or associated attachments is strictly prohibit=
ed. If you are not an intended recipient, please notify the sender immediat=
ely by replying to this message or by telephone and delete this e-mail and =
any attachments permanently from
 your system.
</body>
</html>

--_000_PAXPR06MB850591BCC38808B38041C322BB4B2PAXPR06MB8505eurp_--

--===============5205204860119157605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5205204860119157605==--
