Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E07C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 09:52:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EEDD6108E
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 09:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EEDD6108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=abatec.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F24A605A1;
	Tue, 28 Sep 2021 09:52:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sHd3KLMUqqvv; Tue, 28 Sep 2021 09:52:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9281860AE8;
	Tue, 28 Sep 2021 09:52:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E18341BF29A
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 09:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC4D580F3C
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 09:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=abatecgmbh.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qdj5YyhHP1EG for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 09:52:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30081.outbound.protection.outlook.com [40.107.3.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A01D280E41
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 09:52:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpSdQ8NKOqJdbM4xo14ZZ5AOQVaiJ88B3vZd3+bVEzAHtWYUa5s53eGI/6AFPR3Y3kyx5fCPqmY44s8CoKMdy0WeSBMulq+rP5oiKZHIjqVESny7VT2DlUkR5I6FdSF4Btx5heDZ7eKKmRzZxbgETMmMlWOphsn6utm61hP/7GDR8k1LpgwlKix/PPNUtmeEdFjhpjAzj8DD6SWManiKrzTI+eAIDVTg89M1jOpw7WWVT5vIAs51p/rXoN9+/ifyVpi5F8eRVbnoNPRImv9cTzp1UxKmBm9aBpuYigxmU8ixreWXMFE3xZDswCUZnsq60NFltk4i2iBehDMLXna0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=5ZYFK59Ii8fEX1UxjvoA+rZ9c1BVOToKMWr1HObRjCc=;
 b=Z5hgHXhoJg5UDfXK+Vw47r2fTkkV0pMvuSuv9PVOsQAfXnaU5yAHMC4athymnVplwB3HMp4W8pJg6rUXGsiygOc/tpILRkh7BCRn5n2zSWP+3p0wsn9wMUeeR6jiM2981HKmaQrlRYKtLrf20agVXbLLRLVzn+NdxzEFcdX5GYkzMehGSTrial1c8CHlGPExkIZ8kSiQiav4GFA0LWhmVORQpd/OirPabQM3vr/b0D3iDw/0gA2y5g4z3HHBWiKb7MSUAzfAzFeEOm640a5BcuhvMZ9r2XgFcoX0+zs7bLHwc7d/t6s4fi4wYl1+tkiImb5iqFFLzhCHcgurhA2a7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatecgmbh.onmicrosoft.com; s=selector1-abatecgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZYFK59Ii8fEX1UxjvoA+rZ9c1BVOToKMWr1HObRjCc=;
 b=ozy/VkISdJ6nmFNh5iCOz8RqmsPNzMIiBb8PGY1sGuCr9G7eg6+zy6zzP5i95B+N9jzDw6fKUnq6ivaYhXufzzhzimKE2bP1jukOpdTI54gZAKGKkeVpi+YPB3dRXx5h9P0HwZVgpVvdH1Yk2wh0h03RKcKZvUoYq6to62rZMPs=
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0543.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:30::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Tue, 28 Sep
 2021 09:51:59 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a599:6569:1134:70e]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a599:6569:1134:70e%6]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 09:51:59 +0000
From: Lang Daniel <d.lang@abatec.at>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Question about adding dbus-cxx and updating libsigc
Thread-Index: AQHXtEoyrg/NSp7prE2q7tHcnS4IQA==
Date: Tue, 28 Sep 2021 09:51:59 +0000
Message-ID: <VI1P190MB049315D372F7D5E516E916319FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 0c20aa0e-681c-ce1a-bad5-b772f25a6234
authentication-results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none header.from=abatec.at;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40745ed5-8f05-4bb1-e075-08d982659d96
x-ms-traffictypediagnostic: VI1P190MB0543:
x-microsoft-antispam-prvs: <VI1P190MB05432DCE1884F026893395B99FA89@VI1P190MB0543.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3BBUsDXPWb1Amz2G3B6xli57hx7sCCmTq5jbc+oiWSmH77W+8QlpMo1Qm/xO6Ex93ob37dE3wegvuETilewELgV2qJ58yPfinEGSDEEYS2rkzk8F3hLslTFoNmCb4atnpbTwCHZj6LbaBsBeXMLnbE7MDYPLG2gLYWnmT2ZVx6wnUmoqVRNwNzqpxynUIWSKvfsWoacqMU7dR1w1V9u/e3j/Tp3uahXGFs9SN9uFJTX0mjKO41dW3M8VaWnFZUqQU6mGJCLCZs6iOkq0PEZ7DUDjb1En9pJvRa47wFI6kNF2NDKeAMOQDBnv5Ya9trKIYg0QEZAOsgYlu0a+2cmTzWzofIYoyTVJflgWUZSpYHLNFVJyviermjc+QaYE6qQQZAureY/SO35R/SIpbfg/B/dyoD+HFoZbbhvyPXGlvnMODmdE7AGJGuM1JXwdyh8o84pxn+cJIqGGyMKaPMW93htVXKF88aJeE9LGu1iATlHerdknLHG+kXMnDbRG8NaqDVu0g0v+vWtuJaBFVkn50+ah+FkAlt0fIV3D/JWptPvzlMMcQ7x52oZdy3VMsZuAi1Ru0vhI9sVLXFQYPi9qpKreL+GwAmYpdTtuJ1KTuhCkmMe528r7kQxjfMnF7EgMtepYyTZZdHWKa8lfT1EwDuy6SB/rxJkPdDzzq/GIpcsebrtjY5c2mgDxjpS35KQOy6NfEN4r/k9Nyu5wiauLSNUKwUOVePpu/E1d/jm1uL4nJMVivTbYbdLVzNp/PMS87l3Y02a4FUQZPHucPVqsu/S3ROGUaEAIXpOsMNizWXU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(366004)(376002)(346002)(136003)(9686003)(316002)(8936002)(122000001)(4744005)(55016002)(5660300002)(6916009)(33656002)(8676002)(38100700002)(76116006)(38070700005)(66946007)(66574015)(508600001)(66556008)(66476007)(64756008)(52536014)(66446008)(2906002)(186003)(83380400001)(26005)(86362001)(7696005)(71200400001)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?z0K1Nqiyq569xapxjhA8Zp1SZ2Knq3BMyXbaVQVdgf5F3Th0NwMreq0AYZ?=
 =?iso-8859-1?Q?fDTzvwb5oMHmJLtG/5jljpY008o4PtKBnq1qi56NJPVa1KlbxhygeOYCQh?=
 =?iso-8859-1?Q?vfwhn4AeNQLIGryO4KgoRH8LHHX35OazROiip08vlA1IgmgzuJUQuOsgD/?=
 =?iso-8859-1?Q?DbOV8zLSvixjREEe6q/QdLFxXkrTkv5jWYgovpfVtQGVO7afwJg+3lVG2K?=
 =?iso-8859-1?Q?cwnTs8JK0V7ekjCn4Wtm6unpt5JVa/qin6x2cK+XI/b3BWkMIyg5PK6bUs?=
 =?iso-8859-1?Q?5xNxQntC5Rl/G+C+QW60Efl67YM30OMNvS+MskFfN93WbuoYoUy5036RKn?=
 =?iso-8859-1?Q?wIp7aKRBhCVSGee7CgEvORS1paAtJXGd4YLef3DBmyqKihcuZW+xGOLp+Y?=
 =?iso-8859-1?Q?Dw0uZliY5ky4bMhN8T0CUtv67xAzEzIOaymw581d9rueQEe8CpgHUIH6Ng?=
 =?iso-8859-1?Q?35CFCliIcRzfrP46Dbb7BzIDgIb7QoNNMpfvhuM104kpHDi5klEm1QTFck?=
 =?iso-8859-1?Q?473VsXdIp4fFENu1G0VPt/xOMFP2stdDo7LA8M309ZoSGkB5hZ33gjnMIH?=
 =?iso-8859-1?Q?/GCp9wpK8fkqnxgPETXK/Cjy6fij22YZM8hXEA/guKCQv+lKCKiFGJjIQZ?=
 =?iso-8859-1?Q?5KEhcPz1ba7C6UyHDKa8qXiNoiWZ+E9e7NwgbHy+gJcaa8a6bZ1VRrRjzQ?=
 =?iso-8859-1?Q?CamatBI8w5XIfiPjFR19TTP8gPo1jAM6UtiefR9qMNxSwvHPHdVQT/Qjo8?=
 =?iso-8859-1?Q?ZgVbloniUfBqSxAIAPhAYrY9/it7HXMBMoZgAmcXeZfGOsN/DExfeZ490d?=
 =?iso-8859-1?Q?uoQxTnab5XsINSxBLEvrcPDLAc4eklH4Uy/ojJ/PN8GdP8F1H/Im2hqvJL?=
 =?iso-8859-1?Q?QsSCVV9lH4cl770b10pmQSjTz1kFfYuiWXUr+qqf5lG8sEEkNY9bqV58ho?=
 =?iso-8859-1?Q?fWLgT/L4au614B12a3viZkdWMTF6QjPJrqne15N54HV5LFzORKe6hEcA7M?=
 =?iso-8859-1?Q?PGBEn+fDWg/fu05P9GsyXdVI/hHciQzhrNXH++T0wZAYf5ww7qrJJ2yWb2?=
 =?iso-8859-1?Q?865NEiIP/eIezE44o/GN06vAzPYwt+5+iKEtOQomCqc4u+Mh42DTCbqFCy?=
 =?iso-8859-1?Q?JGioACB/5IQCXPCyU1lD60D+i70CbUBgtqsQf7ryGVg/bXCRxxxJugfval?=
 =?iso-8859-1?Q?5xoR+TTBPMj/2kybvw2oGyu0NleD1frCpVR8uq9LBtxRix/T9MyyQILwKl?=
 =?iso-8859-1?Q?yIU3l//Jl9BXqRFiHdAnR90n1TT3TSY/C5BcSBDxO+M9hXbyCvuCEDLDKe?=
 =?iso-8859-1?Q?nk+3+fKGu4syoKOO4tbtxEjIX7CIqalB4PLLy4k+krAVZwc=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 40745ed5-8f05-4bb1-e075-08d982659d96
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 09:51:59.6124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KwnVZgbSLGZDNP5ct8i9va/CfNPI4fukkSIFNpF2Ja4AjrvMvT9NKSoseLwoBu4G7iOGiaDPLmDvZuz7+57GLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0543
Subject: [Buildroot] Question about adding dbus-cxx and updating libsigc
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everybody,

I would like to add dbus-cxx (https://github.com/dbus-cxx/dbus-cxx), which
compared to the existing dbus-cpp package is in active development.
The last release of dbus-cpp was in 2011.

Is having two different  dbus C++ packages preferred,
or should dbus-cpp be deprecated?

dbus-cxx depends on libsigc version 3.0.
Version 2.10.6 is currently included in buildroot.
Updating libsigc would mean updating cairomm, atkmm, glibmm and gtkmm.
Those updates bring GTK4 into the mix, which isn't a part of buildroot.
At least I couldn't find it.

I can try to provide patches to update everything and integrate
or create a separate package for libsigc3, since both versions can be
installed at the same time. Which option is preferred?

Regards,
Daniel Lang

Software Engineer
abatec GmbH
Oberregauer Stra=DFe 48
4844 Regau, Austria
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
