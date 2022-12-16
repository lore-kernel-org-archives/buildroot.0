Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7205EC4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 14:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07F90605A1;
	Fri, 16 Dec 2022 14:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07F90605A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtSj-3S3HpTg; Fri, 16 Dec 2022 14:34:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 466B0605B5;
	Fri, 16 Dec 2022 14:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 466B0605B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5493A1BF2A9
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 14:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3000B605B5
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 14:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3000B605B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AizTHO9oNCow for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 14:34:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7545605A1
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7545605A1
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 14:34:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmJ3jW/MpisSKkz7zbtm5N54urf2gJSya65Ke77N/fTFkBddO7t+/Kp5Oggv0bCr/Dt/AkI5+8oSHzRp+29hZKlNURe1FOZ2ZeRKK8KyXONARgNL9GmowpY+MEMwHvbBz4ZD9IZH611e+iKXg+bWbmRC8i2euhPrNRxjUtU6c7OCfxHQlTVajRNAEGjcgpIDMYdkuCiuH4KXgjbdCOlClIHh9vdsUU+/dm7J4Ekn5QNZps4xE4L44WVVwBnpsTGew7S89Fz6N+nKBcK3yIYeGsppcoS3t17AVqJwDZy9ocJ+W5wPvvhFoIu4Xi0FEZm/lYUnJtKrzP+WIMsT96Qc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKq+bZ9T0HmtU5LVQtUu6QIJ3k/ny38XnHuAuoiIQTo=;
 b=a/vVDoRJFhTD74VHxoF+F/RVwfBxH/XPfr21tqRqrnlZ942WVp2NyjLlt701TcRT94k/rq9WbxcJvpM1tUaPyQf5O8a09sdU5BFsO4KP3UGZ325Ut7W2XwykAD+OxI6XhgBLug3/mqaGsjxs1qgrGFNmIyUCOVutXjDzEjt5k1F0Tb6Zl3R5PraiG4XOGeJz2Uex92P4uLsSCSUpaExpvy9nOtiCYHOhgxGEaio/mJUUXPrdvCrNSYLXlC6/sGcnmyYAijfmFR5UCi8N1DhK4f9VtQtGHnM8gOlurOH1eyWjVmXX0nOEVkq0qQEY23BSowOOFz+OMw0OxkAuI0Lo2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by AS4P251MB0735.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Fri, 16 Dec
 2022 14:34:34 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::4886:9896:ef53:3d21]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::4886:9896:ef53:3d21%4]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 14:34:34 +0000
From: Nicolas Carrier <Nicolas.Carrier@orolia.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v3 1/1] package/shadow: new package
Thread-Index: AQHY3yHdMcxLwNGs8kaCEB78orb/0q5gKnIAgAFWGwCAAu8Eu4ABQuiAgAAJRryAAWjhgIAJgmqAgABE8Ms=
Date: Fri, 16 Dec 2022 14:34:34 +0000
Message-ID: <AS4P251MB0612A758AB937211F2BED99B84E69@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
References: <20221013163432.18545-1-raphael.pavlidis@gmail.com>
 <20221205215558.GI2855@scaer>
 <883c29be-2a05-00f6-76d6-cf894e497da5@gmail.com>
 <AS4P251MB061200F650240CFFE6FEF439841D9@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
 <97b952a4-2e1b-363c-36f0-0fe2c0da26b7@gmail.com>
 <AS4P251MB0612D4DF753A307318923B9A841C9@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
 <20221210082857.GP2855@scaer>
 <41c39dcc-95c8-d949-9fe1-f53882e680ac@gmail.com>
In-Reply-To: <41c39dcc-95c8-d949-9fe1-f53882e680ac@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P251MB0612:EE_|AS4P251MB0735:EE_
x-ms-office365-filtering-correlation-id: 3979925e-0e3d-4eb6-85f2-08dadf72a6cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EDEfqIjjCOL8hO//tImyfwX4j1OrYJc/MZywkdmN1r2/FeE7NHMRT2gD5WqQPDqs3kfWlf18kOCVOmNkz/8oYSwqPUhJdJC8HYkcXn1JN7Ma00Qkk58y8RwXYl5etJcTq/NoLk93elt6IHE2JSyQUqn1r2U6syelwds7bWNmmf30DjVogWQ+7TrVvyppvW1tV5PnuPMLGeSKTL0oOicFhVjUtZxmnLnGt2BGT8w3KhKQeMYwiQadPqDwRoqmQie2y98s2fmwpC0A8WMkhxDVTO+D1VmvS63imEUpXLnWyb1/sfWn6NmQl0JLKtHWbsIpPK0lV4K0juO6RNf+5ZLtryOkGLtqXQQ1VB36DuhZmMUjdtYpIPuOcH82aS2JL3GiNCybuqPFWYba2LpnBqahKktAemnVrAs9Bv2KoCu+J5gDPRMvxFD+X1jiUurIEFghpsJjk9PkWesgBGsZQVSYX50V6hgXYenzQYcw54lK/Jn1v0RfGyUJUAHli0eVbZdFHAT0H1pJe1o6LZK0cANpz5AN5aYB0uD8P+7lbXq4H7AUd7z2taKwF+FYy21zKVOORH1QV33HA9Yb/uNEMUIlK3P+ZeumQVZ05yUJ9sqXnx0oyIfQzStRTYg1+CZgqMIr9Rkld3rlFRbYpHakqV+e5neLnCxjrhRcLCRGs/o33HO5F7EhhmTTP/1xRNecjGkgH8Sw2tWd6xt9zd8REFK7VDSTY/rbrhhElhe+TLU2qhmlRTGuMHld3p8hgHSe/iBu+EPozuS0wuEsNl9xrRJhog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(366004)(136003)(39850400004)(451199015)(478600001)(71200400001)(9686003)(186003)(8676002)(4326008)(66446008)(91956017)(64756008)(6506007)(7696005)(66476007)(2906002)(33656002)(316002)(66574015)(110136005)(83380400001)(54906003)(76116006)(38100700002)(8936002)(5660300002)(66946007)(66556008)(52536014)(55016003)(38070700005)(86362001)(41300700001)(122000001)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?POZ+O13/Fa3RF3Mh+CSHpaqISvt5XkHbvWvyKs8DPegF8XiWjEnYLaF8iP?=
 =?iso-8859-1?Q?xlMjCT2U/N/dqi/Mp2SiA9BWMGwugXit/g3V98wZx4bmCpaDBX9MNHEkPW?=
 =?iso-8859-1?Q?TNgxMbYkrpIXP79fwDC/Ivnr3fwOU1rGiLm4TLWnFKFDXjtf2f0jBokhh3?=
 =?iso-8859-1?Q?kfGfYgI0o0/OgBlaLsY9D/79oUqMKiPpRxkwCqLCIRJmzHGVyEm5OKTy5+?=
 =?iso-8859-1?Q?T6T7+zUl7hgxWik/iQpUeWLEkVbpeCkqZgp5TI0112cgqpXqbfu+rDI7vQ?=
 =?iso-8859-1?Q?QZ1CGtKhiVHkQg8rQRJMBRdlU2xdIwYfkWY2OLQAczxd2/DqsemW++tjTG?=
 =?iso-8859-1?Q?eQtJrocuzyYKvt37lUc68J/h6v4fuKO0IgKHvqLaTDPlQeqF6yb7gT8O+H?=
 =?iso-8859-1?Q?YdhR85fPNAZOeVch27STuKUFtBmwF9bn4hqZCl6kFagRbJso1Z5eR1rtce?=
 =?iso-8859-1?Q?NDveO5Yw5A/gkCoEW4+aFTfMZ4Gof38fTP19AmjdH3o9Ip4VmqkpafFdTZ?=
 =?iso-8859-1?Q?Kd2CuvgZpDa2SGgyhOy6z9ibCIyy9aKAyrfaCehyQYjuUTNlG9xdWMMMs4?=
 =?iso-8859-1?Q?vZvZEBWWc4oLNVSohvmnIsZ46VtPoMyduNlIxbKflJjM4fTcUL2Qyf2RvX?=
 =?iso-8859-1?Q?gfC+SdMGfmeVY86Ptrf4Hy1yx66S2f0eH12oLM2EqYkBxePoApKFm28LAD?=
 =?iso-8859-1?Q?aXHhj64+fHOaJHCaICq4fX9OLxaDLhKKen6xRUaQ1H+l/y5EJn2LDD6Krr?=
 =?iso-8859-1?Q?xFd7szyOqDzsWNwZfbXlgskIO/zq9TYQs7GkMmgtr56OoahvRvOIPDay9q?=
 =?iso-8859-1?Q?sL6CSWsUTgdyzBvSbSYZlrb7RSBUpDnUwqsfn7QhhhKVYCHPan8t24oEzH?=
 =?iso-8859-1?Q?HnKif5hlwgwWoGSBgLUUhvaoo9s8Kf6Ibx/qRHs+5c20gdW3oYl9NpZfun?=
 =?iso-8859-1?Q?rn8nn925pQVechhCyVBvn4ShngiErvJ6saYgLImlyUW65a0AYiPztmbtf9?=
 =?iso-8859-1?Q?9xSaOpxVh5TslUluvmGtSDP807VgXsvXwhmLTxbszn3y11Li3WvfVFh7NN?=
 =?iso-8859-1?Q?/OVtI5iKn25BjOpSDu8FP4DD06qZtcnkjlYFOOZIgaPEHNnAufy5uHvvMo?=
 =?iso-8859-1?Q?zgiK+03I9msK8Q+ERMNTHXZt7mv8JQjxyDp1JWAjRrtvZoM4rfgQZJRPBG?=
 =?iso-8859-1?Q?y95RbP01dTnZQcQZ8JSyzxuq9a0OmwUaKg7I1EhjymJtTv6yUdD5fGbYvU?=
 =?iso-8859-1?Q?p59qTRdByEstz/vUB3aCrmeULKKRJo3i5P+1vdYu4XQjDG0i2ZBzBXOZvN?=
 =?iso-8859-1?Q?Y3wfMIqCrPswx07EKlauFK3O/6jY3dAcxxDtN6w5epzZ5/ln7Ygw/46VP2?=
 =?iso-8859-1?Q?meB3x3FppnpESQp41OeHChgQavIqnNnnCV1YYR2yjyAaiteeTceOqiO/d2?=
 =?iso-8859-1?Q?SvelLX0OqppXK/u0/FGgRjIFkn62k6TlRKuEWL1JeVM16QOOdxUIyzChbB?=
 =?iso-8859-1?Q?5ivxGTL/K+8YBwATIKa7qXmPQh/T+3Zl2uBeR2Gr3GE9ZYp8gelEUR0Et7?=
 =?iso-8859-1?Q?RJ4jh3+ujP/gkwThUzoWeSF9ECgRYGSKaftHbph9pvLz3xfBQmVwv+Q44c?=
 =?iso-8859-1?Q?ukHcyiXksn0xfvgK9v9MQpwTg61oWaUy2wor/aLGdRdaM78ZnRWIcQVpzp?=
 =?iso-8859-1?Q?AVUJNIMknKDweiiAQTa4nys3GpKWquj2Oeo3e8+MLrKMDwKl1xsSlwxxAc?=
 =?iso-8859-1?Q?LR9Q=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3979925e-0e3d-4eb6-85f2-08dadf72a6cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 14:34:34.3877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAvEDsPsmiRgxhjb+jsaA5g/ntOjEdJ4ekN3SMkR2v/fyCnfCDW7KXgxulJQBI4u085C/71y+spYHa+P7TdI2caucFXqUdWPut37MwH/VxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P251MB0735
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orolia.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKq+bZ9T0HmtU5LVQtUu6QIJ3k/ny38XnHuAuoiIQTo=;
 b=DLbfRMD++ZYwIuixufWUdSgvLU1Do2+s7LBoJtlzTCeL6eJPRXRMbo077M/3tCeSVlCApjtdYyhD7y3tlz2nWUyFZ7b+kiIiwEJHOkNIW2TTRCUuF2hIAdHBCUuqo+96jc+SbgiiJyAh6kpmJbKYoI0hQZwDTysJqLfZ5Dw2v+I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=orolia.com header.i=@orolia.com header.a=rsa-sha256
 header.s=selector1 header.b=DLbfRMD+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] package/shadow: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No you didn't do anything wrong, I did :/

FTR if you want to troubleshoot a failing test, you can inspect the output_=
folder/TestShadow-run.log file, which will give, at its beginning, the qemu=
 command to run, in order to replicate the issue.

Here there were 2, the /tmp/ string should have been /tmp and the quotes fo=
r the su command were incorrect, single quotes were needed to avoid the int=
erpreting of the $HOME in the shell.

Here is the fixed version:

import os

from infra.basetest import BRTest, BASIC_TOOLCHAIN_CONFIG


class TestShadow(BRTest):
    username =3D 'user_test'
    config =3D BASIC_TOOLCHAIN_CONFIG + \
        """
        BR2_arm=3Dy
        BR2_PACKAGE_SHADOW=3Dy
        BR2_TARGET_ROOTFS_EXT2=3Dy
        BR2_TARGET_ROOTFS_EXT2_4=3Dy
        BR2_TARGET_ROOTFS_EXT2_SIZE=3D"65536"
        """
    timeout =3D 60

    def login(self):
        img =3D os.path.join(self.builddir, "images", "rootfs.ext4")
        self.emulator.boot(arch=3D"armv7",
                           kernel=3D"builtin",
                           kernel_cmdline=3D["root=3D/dev/mmcblk0",
                                           "rootfstype=3Dext4"],
                           options=3D["-drive", f"file=3D{img},if=3Dsd,form=
at=3Draw"])
        self.emulator.login()

    def test_nologin(self):
        self.login()

        self.assertRunOk("! nologin")
        cmd =3D 'test "$(nologin)" =3D "This account is currently not avail=
able."'
        self.assertRunOk(cmd)

    def test_useradd_del(self):
        username =3D self.username
        self.login()

        self.assertRunOk(f'userdel {username} || true')
        self.assertRunOk(f'groupdel {username} || true')
        self.assertRunOk(f'useradd -s /bin/sh {username}')
        self.assertRunOk(f'test $(su {username} -c "whoami") =3D {username}=
')
        self.assertRunOk(f'userdel {username}')

    def test_usermod(self):
        username =3D self.username
        new_home =3D '/tmp'
        self.login()

        self.assertRunOk(f'userdel {username} || true')
        self.assertRunOk(f'groupdel {username} || true')
        self.assertRunOk(f'useradd -s /bin/sh {username}')
        self.assertRunOk(f'usermod {username} --home {new_home}')
        self.assertRunOk(f'test $(su {username} -c \'echo $HOME\') =3D {new=
_home}')
        self.assertRunOk(f'userdel {username}')


Nicolas Carrier | Software Developer | nicolas.carrier@orolia.com


De : Raphael Pavlidis <raphael.pavlidis@gmail.com>
Envoy=E9 : vendredi 16 d=E9cembre 2022 10:42
=C0 : Yann E. MORIN <yann.morin.1998@free.fr>; Nicolas Carrier <Nicolas.Car=
rier@orolia.com>
Cc=A0: Thomas Petazzoni <thomas.petazzoni@bootlin.com>; buildroot@buildroot=
.org <buildroot@buildroot.org>
Objet : Re: [Buildroot] [PATCH v3 1/1] package/shadow: new package =

=A0
CAUTION: This email originated from outside of the organization.
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Nicolas, All,
I added your test and executed it, but I got an error:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL: test_usermod (tests.package.test_shadow.TestShadow)
----------------------------------------------------------------------
Traceback (most recent call last):
=A0=A0 File "/tmp/buildroot/support/testing/tests/package/test_shadow.py",
line 53, in test_usermod
=A0=A0=A0=A0 self.assertRunOk(f'test $(su {username} -c "echo $HOME") =3D {=
new_home}')
=A0=A0 File "/tmp/buildroot/support/testing/infra/basetest.py", line 94, in
assertRunOk
=A0=A0=A0=A0 self.assertEqual(exit_code, 0)
AssertionError: 1 !=3D 0


I used the following command:
./support/testing/run-tests -d dl -o output_folder -k
tests.package.test_shadow.TestShadow

Did I something wrong?


Regards,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
