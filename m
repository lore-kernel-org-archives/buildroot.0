Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FCCC63703
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 15:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A42B60B15;
	Thu,  8 Dec 2022 15:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A42B60B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WoY4EHAC-i4C; Thu,  8 Dec 2022 15:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2614460D93;
	Thu,  8 Dec 2022 15:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2614460D93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C6AC1BF366
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 15:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F2BC60B15
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 15:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F2BC60B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlfs9j4iXgY5 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 15:15:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2710260A81
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2710260A81
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 15:15:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PP6lYDQXcX7l2T9QvoDIkxZalR6x+yIQHwD3OQtOc3zDwoZAR4CvBudr6HrEOv8JSWclJqqXTi1i9p6DztT+exq6qfsuABptfdfqiyOpL/Ab3GbkqnfgRIYcAIpi8qbcaM42sJKMIYjLUfu1vG0ncQjtJs7yqM6vSYjt3lFMe10OGthLmA4nLUNS36ruL09FgxSErBkXMk1tu68f/HX+8mnnGHrlZt/DwlUO+w/mNUv1x2ZoJTo9N7MnlNKS/dw42wPUzj7ts2N7V6T+BNwr6Tz5yRN1RTBM06g7Hf4mqMMOfUb+4+huNtEDzRXiHKOnQr7u+ITw6dD/SSN8/2AjMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1OkMHJII2cTajuVwYCHGTT3SiaOIwYcHgg5h2Fq3Pw=;
 b=eBkSFmmijIStQSLFE5nvFP/hMBIV1z5W9scwnmIaRIOrYpMmdUYn3Ijrwayfa8SinsXYQaFWhlPJoxeO4NtlliiS2p4tXYQIIHav2hdLwGYurIApHgseL7iHDg38nKNyblZTviAVD5GWwxT5RraDZ/9TUULiOsQG59ZSkAN3Nqz7SwXvcVdLWZZgSUeEgKqeRS782+E1JiFAcTgk9mWItasLFEVi+DzIPeG0gHv+HN3fV2o/a1jZcKyubMCvGIdGJ0v1ueLFIPqQtQoPdpzJJJiDMiQhegGSAzqilfI3wRMfKm6pmEmY8LauiY+y1ZxnzXsRLY+XTrOKoeOA4XUe2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by GV1P251MB0858.EURP251.PROD.OUTLOOK.COM (2603:10a6:150:8e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 15:15:41 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::4886:9896:ef53:3d21]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::4886:9896:ef53:3d21%5]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 15:15:41 +0000
From: Nicolas Carrier <Nicolas.Carrier@orolia.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v3 1/1] package/shadow: new package
Thread-Index: AQHY3yHdMcxLwNGs8kaCEB78orb/0q5gKnIAgAFWGwCAAu8Euw==
Date: Thu, 8 Dec 2022 15:15:41 +0000
Message-ID: <AS4P251MB061200F650240CFFE6FEF439841D9@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
References: <20221013163432.18545-1-raphael.pavlidis@gmail.com>
 <20221205215558.GI2855@scaer>
 <883c29be-2a05-00f6-76d6-cf894e497da5@gmail.com>
In-Reply-To: <883c29be-2a05-00f6-76d6-cf894e497da5@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P251MB0612:EE_|GV1P251MB0858:EE_
x-ms-office365-filtering-correlation-id: 08ead861-6f21-40ee-d1bb-08dad92f11da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XAle7eNbU2tT2HR7OF/D9eFCIGXR3vLyMT82sXnswYXSDDuFosCGFruV7UdDKvnJZH2ELavXR+qTdB8KmC1MNv/5p7nHeqc6dSZT0MveaLkB0PPPRszloujN3HnDCbHf2EqRvd5RlwyvIjsn1B26Su9S6ns2xW061ro9oX33wp0Mm+7zSmEdFnJEdtJFpB4dDeaKOd1mUIkLdBOFlEybrn+KxZ4NT9YBcXTp2zGvK46EzgU5r2QzeaLrdhtDlo8ssXg7j5ioaS17wPWyWXySgivf9hwGzNnSkUsI6T8i67j//67WdcHZG7dSHb8LUHikdDky019K8ljAYdNc2vfURyFe/O1F+dm56iealfk8BR5bZB2xPgyvPO0AeUzA6KUJ//LXsgdcYbuQp/5ZM/xy1OSnsv06oQR7omkU00ui0JxHSD+jaGzb33+h5WHN9/HU5tTFK3rzGnvWd0v62xPnVCW45v1eV6733pT+3egTP+j/EssFqiGvY7Cke2gquwK8T+hU7sWsNekXiMrPMfjfR07K7/o5cwJ3p7nJc5ejHy6C2jtZsfF0Vm8Yfiub0YwRy2argrsexgP6CojCCPcMU3NCSo+OTj7xHplovTCF5wYncaci05VBX48Mveb0jKTN6BseyjxcVZ0foDwHk2evfeKus3mbQyiBa8P7q0O7rgZIo1RnZWH2ZlAJxrVxxzPtqw80sL2FtEpAHYO1ic+TPH5BOPdxeEObtaKhoREvHPA5lxWnk+jbePdLojb7JNTjj5gp0CunMOeN8sSearpBsWVdhMQDY6+KN4xh2MmiTZI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(396003)(346002)(366004)(136003)(376002)(451199015)(66899015)(86362001)(4326008)(2906002)(8936002)(41300700001)(8676002)(38070700005)(4001150100001)(5660300002)(66946007)(122000001)(83380400001)(33656002)(38100700002)(66476007)(966005)(478600001)(54906003)(76116006)(91956017)(64756008)(110136005)(71200400001)(316002)(66556008)(52536014)(55016003)(53546011)(186003)(66446008)(7696005)(6506007)(9686003)(66574015)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QbIRJEgQXO0VmPo5x8/FgKV94n+zn+2hFRz11LvZFxTni0xmxwwZvZ2rVh?=
 =?iso-8859-1?Q?KUqZNVYZPx+seXBlfJCp95AbijxyryODGpatfHOppiEbb2ZufBamAWsTrI?=
 =?iso-8859-1?Q?zscrG9Xw3GTGGv30A2qhb8ERW054Mw4T2s/KXJX5LQ+qcjjNIjY59WU/4Y?=
 =?iso-8859-1?Q?9QmtMyqnzd8xFO5gUwtEu07GcpVi7Yw88zaK8j2YnhWsp6m6fmgJPHeFBz?=
 =?iso-8859-1?Q?wEVPkKt66G35I+ZqeXCiL4p463bybXbOBfQH8acsEdXCLlVcQoaKoGyKj3?=
 =?iso-8859-1?Q?TLc+nDv5ktuXtiFo9FqTtXZGKcGMJzI0Hw5kUVcqZSTV5kyLMTL+AOw+rE?=
 =?iso-8859-1?Q?EAbvx2Lupb3uHtumIjxJMEKHViWh2fGwMFQD1qEmWbhsClB59UHscjCjxR?=
 =?iso-8859-1?Q?cHRwrnf+0XdSlMjCyxLNnkheZW6V6SOYNShmJYNtH1zXPrvxcuD9SZ7K7n?=
 =?iso-8859-1?Q?ZEHwH8JIDAhGHPl5GpECDXbnc/ZJjkLrpdWnVmM7p3NEx1KuN2UizaizYQ?=
 =?iso-8859-1?Q?YJbIvYpqHKMQwNMYCzRoqZfJvIsi50wLAbJiYRGxz3ARkAizIeIrFT2Pdj?=
 =?iso-8859-1?Q?ot3+kSQgbcbpVNAfWFU46tAyM8ISIshBJfo/pIjZi0ShlpOxuasgJscnXQ?=
 =?iso-8859-1?Q?OA6gZEOY/7z0w7kvA7568jn6YsxNpKCqD3bOxfcJMabMKOfi+VRlXHLJQK?=
 =?iso-8859-1?Q?c3O/J3bw9IFOZXCQI9qVxhQpeyvY86pczfxv7XztM9K+E20xWbXprCYTe4?=
 =?iso-8859-1?Q?GaCnUl62bq3DdA4p3DOM9raveYg6RuNd7F/JtjA88rTCPwP2C+CTJQpf1z?=
 =?iso-8859-1?Q?OQGFuEOHGOlf7BggLcWGDqR+NB0rGvWcOtUZNtu1cU5WWq2ujuEcTyDxVX?=
 =?iso-8859-1?Q?pQ7Gm6pr0O6/MDMTjAur6g3laGXDQUJIuOWmJx/DklirJNnGlSX+oUmXgj?=
 =?iso-8859-1?Q?Kj/pwtugvEf/zv8/Ok41yprMoBxfmfz8U6UbqyPA8WT47ehWGoPwHFTozU?=
 =?iso-8859-1?Q?RJFmnrNnsB3yjJfucG/QSFKklQYX1/tII/8Dh1tloyy2mNoT9HMbLOGB/l?=
 =?iso-8859-1?Q?0h4SPrl0K+QhjTQz64Yb7pKON7MVYg8UWKzwrORAVcKjgc8MKFh93Wy8+W?=
 =?iso-8859-1?Q?Pt7W6wAw72XN2e0ymhVsoDUJqfXv/uMhdt0WimmVS9gldYCXsz/NaMgkO/?=
 =?iso-8859-1?Q?4XoDi4yLnRnCUz+oX65nHzRoKhDzDmjaYULkpgijLi+KlxWFF2iHdwbiNy?=
 =?iso-8859-1?Q?wWINTiuOJX+LhF2kWSQusPyYOWif2XJrP4JNV5kOHM1TMRw0ob1mUS1Wg+?=
 =?iso-8859-1?Q?V0msdgDPMs4BTRqQxLl8qjKo0yHRpaB4z0xSNtOw4HBzT+vUpbfuJDRJ81?=
 =?iso-8859-1?Q?1Hf9YMU05ArJsOjSvN2m+NENZU/5qONFv5w9KNFYwskjd98AIIzKAZzxS9?=
 =?iso-8859-1?Q?ba2uDvEYKF9W5oiaq0veP6yqMioT3XKxeB9GlmVdB+fJOchalNHCIdpFPt?=
 =?iso-8859-1?Q?j9zQpr2nooyHSId8K6UxfiXzDPSSfdNG4pzg18xeXWmM342MAdkn9ZIrnX?=
 =?iso-8859-1?Q?AYu8FZAxeKueb8+GErCOSRMA/kWA9wgUGixSzfldciP4OgzkBgpHeXcvRu?=
 =?iso-8859-1?Q?IOvL9H+p9IOXVvPPuVLFVvhAa35FBeY7xds2mBA6PHGHU/fjXDbbUGbyxM?=
 =?iso-8859-1?Q?MHFU7g1hK+NXQXbJ3kZ8HCe2JvMGkh0riQ0x7ztGuGLpeUxzBtcM/l6XBD?=
 =?iso-8859-1?Q?bWyw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ead861-6f21-40ee-d1bb-08dad92f11da
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 15:15:41.2121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fn0eWKAbke8Zyo0+EADQAw8uXmATV4LS+0t8Q2HVW5dius5fd6eaxwP+8zjveoLFtQrTUGE0kdu1SPpRO5B92Wa2n93n1inqy4rRfDISJbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P251MB0858
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orolia.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1OkMHJII2cTajuVwYCHGTT3SiaOIwYcHgg5h2Fq3Pw=;
 b=dFN1k3bHofj4pEKU6v2roHI4A5eZRIONLf0Pj4xaRuXDcCI2sB63leUwyDu0xZfkNgGPDOQTAyUkgOO6gfr2zlAJ2JvEhAUY+xtp9BTfgig+6V2R01drs4sjUfrglAnrz55AG2RkOkH4+Je+BZLbPWALQBfUj2NxJBktiNHuGRY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=orolia.com header.i=@orolia.com header.a=rsa-sha256
 header.s=selector1 header.b=dFN1k3bH
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

Ok, so here is the (non exhaustive!) test I used to test the shadow package=
 (in the support/testing/tests/package/test_shadow.py file, using this comm=
and line ./support/testing/run-tests -d dl -o output_folder -k tests.pack
age.test_shadow.TestShadow):

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
        new_home =3D '/tmp/'
        self.login()

        self.assertRunOk(f'userdel {username} || true')
        self.assertRunOk(f'groupdel {username} || true')
        self.assertRunOk(f'useradd -s /bin/sh {username}')
        self.assertRunOk(f'usermod {username} --home {new_home}')
        self.assertRunOk(f'test $(su {username} -c "echo $HOME") =3D {new_h=
ome}')
        self.assertRunOk(f'userdel {username}')


Nicolas Carrier | Software Developer | nicolas.carrier@orolia.com



De : Raphael Pavlidis <raphael.pavlidis@gmail.com>
Envoy=E9 : mardi 6 d=E9cembre 2022 19:20
=C0 : Yann E. MORIN <yann.morin.1998@free.fr>
Cc=A0: buildroot@buildroot.org <buildroot@buildroot.org>; Nicolas Carrier <=
Nicolas.Carrier@orolia.com>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Objet : Re: [Buildroot] [PATCH v3 1/1] package/shadow: new package =

=A0
CAUTION: This email originated from outside of the organization.
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Yann, All,

Thanks for your review, again. I will create a new patch and add Nicolas
to the CC.

Regards,
Raphael Pavlidis

On 05.12.22 22:55, Yann E. MORIN wrote:
> Raphael, All,
>
> On 2022-10-13 18:34 +0200, Raphael Pavlidis spake thusly:
>> shadow provides utilities to deal with user accounts.
>>
>> The shadow package includes the necessary programs for converting UNIX
>> password files to the shadow password format, plus programs for managing
>> user and group accounts. Especially it is useful if rootless podman
>> container should be used, which requires newuidmap and newgidmap.
>>
>> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
>
> I was about to apply this, after fixing the minor issues (see below),
> but there is a rather major blocker, see below too...
>
>> ---
> [--SNIP--]
>> diff --git a/package/shadow/Config.in b/package/shadow/Config.in
>> new file mode 100644
>> index 0000000000..6b1fe0a61f
>> --- /dev/null
>> +++ b/package/shadow/Config.in
>> @@ -0,0 +1,61 @@
> [--SNIP--]
>> +config BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID
>> +=A0=A0=A0 bool "account-tools-setuid"
>> +=A0=A0=A0 depends on BR2_USE_MMU=A0 # linux-pam
>> +=A0=A0=A0 depends on BR2_ENABLE_LOCALE=A0 # linux-pam
>> +=A0=A0=A0 depends on BR2_USE_WCHAR=A0 # linux-pam
>> +=A0=A0=A0 depends on !BR2_STATIC_LIBS=A0 # linux-pam
>> +=A0=A0=A0 select BR2_PACKAGE_LINUX_PAM
>> +=A0=A0=A0 help
>> +=A0=A0=A0=A0=A0 Install the user and group management tools (e.g. group=
add) with setuid and
>
>=A0=A0=A0=A0=A0 $ make check-package
>=A0=A0=A0=A0=A0 package/shadow/Config.in:24: help text: <tab><2 spaces><62=
 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>
> [--SNIP--]
>> +config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
>> +=A0=A0=A0 bool "subordinate-ids"
>> +=A0=A0=A0 help
>> +=A0=A0=A0=A0=A0 Support subordinate ids. Helpful to use container solut=
ion like podman
>
>=A0=A0=A0=A0=A0 $ make check-package
>=A0=A0=A0=A0=A0 package/shadow/Config.in:39: help text: <tab><2 spaces><62=
 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>
> [--SNIP--]
>> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
>> new file mode 100644
>> index 0000000000..261f28dd28
>> --- /dev/null
>> +++ b/package/shadow/shadow.mk
>> @@ -0,0 +1,133 @@
>> +#######################################################################=
#########
>> +#
>> +# shadow
>> +#
>> +#######################################################################=
#########
>> +
>> +SHADOW_VERSION =3D 4.11.1
>
> Why 4.11.1? It was released in 2022-01-03, and is affected by
> CVE-2013-4235, with version 4.12.2 being the first to include the fix
> for it, and there is now 4.13:
>
>=A0=A0=A0=A0=A0 https://www.cve.org/CVERecord?id=3DCVE-2013-4235
>=A0=A0=A0=A0=A0 https://github.com/shadow-maint/shadow/releases/tag/4.12.2
>=A0=A0=A0=A0=A0 https://github.com/shadow-maint/shadow/pull/545
>
>> +SHADOW_SITE =3D https://github.com/shadow-maint/shadow/releases/downloa=
d/v$(SHADOW_VERSION)
>> +SHADOW_SOURCE =3D shadow-$(SHADOW_VERSION).tar.xz
>> +SHADOW_LICENSE =3D BSD-3-Clause
>> +SHADOW_LICENSE_FILES =3D COPYING
>
> And:
>
>=A0=A0=A0=A0=A0 SHADOW_CPE_ID_VENDOR =3D debian
>
> =3D> https://nvd.nist.gov/products/cpe/detail/11DE0412-97D8-4ABC-9807-101=
628A40DBE?namingFormat=3D2.3&orderBy=3DCPEURI&keyword=3Dshadow&status=3DFIN=
AL
>
>> +SHADOW_CONF_OPTS =3D \
>> +=A0=A0=A0 --disable-man \
>> +=A0=A0=A0 --without-btrfs \
>> +=A0=A0=A0 --without-nscd \
>> +=A0=A0=A0 --without-skey \
>> +=A0=A0=A0 --without-sssd \
>> +=A0=A0=A0 --without-su \
>> +=A0=A0=A0 --without-tcb
>
>=A0=A0=A0=A0=A0 $ make check-package
>=A0=A0=A0=A0=A0 package/shadow/shadow.mk:15: expected indent with tabs
>=A0=A0=A0=A0=A0 package/shadow/shadow.mk:16: expected indent with tabs
>=A0=A0=A0=A0=A0 package/shadow/shadow.mk:17: expected indent with tabs
>=A0=A0=A0=A0=A0 package/shadow/shadow.mk:18: expected indent with tabs
>=A0=A0=A0=A0=A0 package/shadow/shadow.mk:19: expected indent with tabs
>=A0=A0=A0=A0=A0 package/shadow/shadow.mk:20: expected indent with tabs
>
>> +ifeq ($(BR2_PACKAGE_SHADOW_SHADOWGRP),y)
>> +SHADOW_CONF_OPTS +=3D --enable-shadowgrp
>> +else
>> +SHADOW_CONF_OPTS +=3D --disable-shadowgrp
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID),y)
>> +SHADOW_CONF_OPTS +=3D --enable-account-tools-setuid
>> +define SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS
>
> This is named SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS, but [0]...
>
>> +=A0=A0=A0 /usr/sbin/chgpasswd f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/sbin/chpasswd f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/sbin/groupadd f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/sbin/groupdel f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/sbin/groupmod f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/sbin/newusers f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/sbin/useradd f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/sbin/usermod f 4755 0 0 - - - - -
>
> What about userdel?
>
> [--SNIP--]
>> +define SHADOW_PERMISSIONS
>> +=A0=A0=A0 /usr/bin/chage f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/bin/chfn f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/bin/chsh f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/bin/expiry f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/bin/gpasswd f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/bin/newgrp f 4755 0 0 - - - - -
>> +=A0=A0=A0 /usr/bin/passwd f 4755 0 0 - - - - -
>> +=A0=A0=A0 $(SHADOW_ACCOUNT_TOOLS_SETUID)
>
> ... [0] here the expansion uses the wrong name...
>
> So, I had fixed all the minor issues, but the version bump will require
> a bit more testing that I can do locally. Nicolas (in Cc) who reviewed
> this patch, said he had a runtime test; maybe you can both sync to get
> that test part of the series when you respin?
>
> Regards,
> Yann E. MORIN.
>
>> +=A0=A0=A0 $(SHADOW_SUBORDINATE_IDS_PERMISSIONS)
>> +endef
>> +
>> +$(eval $(autotools-package))
>> --
>> 2.35.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
