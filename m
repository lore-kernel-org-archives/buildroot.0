Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDF7C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 11:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFBCE60D8E;
	Fri,  9 Dec 2022 11:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFBCE60D8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8atoa48RKZ6C; Fri,  9 Dec 2022 11:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 436AA60D61;
	Fri,  9 Dec 2022 11:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 436AA60D61
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB6501BF33B
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 11:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A337560D61
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 11:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A337560D61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ef9RVpF5h4U6 for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 11:08:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EF9560B89
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe16::615])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EF9560B89
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 11:08:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRA+RirpxVZHgIBTymc7eIJmSzXMrskvsOk4J+eBI2FnrgNcP7H5aiX8ya2C8IX53JA9fhxrgRXuLKqvJU8DJN2JSsQQfupD1kqyQRAtYEsCK+Bk22A24qlN4S60OXhIrynHX11OoKecBuYaXX+V6kCmOs2rGqVP7Njful173VcY/hGFykjAHXvKjRoKwYEPR9GFnt9B+MtrmkDqba0QrA6pQiFY3dkDn+gGeg1lNFTf7HFfaCCO2DzwkW7pNhI3pzTVN1jNb5hgMTvDKR9PLAQBEYhWZUQncLXtKspPhCO/PWYZ8RYI8xZkts0FnyiwLR60yNAZ7GXOdsorWcQuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcjKrjDlmr93mmdROzl0HXl4dH90tummwaQTF+hF5lM=;
 b=EJnW2NF4tS0ehY4N99+m+WKtedKQAnwSThmWfCc5lRlKmo15bRQtWVdLSolJ+Tuf+9P5y+2rTd43ntwXbUC8LCRNlYBKb9fG8xpU3k7pR1GiNo9YVyim5alHxwqaMzhmiZpSuawZfusgGfH8bxDEdH3OMrHrR5WI/spLWqlW2YU9HREMrTSzfoxGMeg48JX/a1AjNkVfRukMCBO1Dd2ihNpffecqySHOHCF6noYPSmnktiYdrZFpioHl1Uzv8aieKk0dy9w0kZMBtDOgOBAKu/KcLtGzaiICuzJp0RkzUxF2yLxgFuLXeFR5uKAe0fJPDdyIOTcJqUwRL4mxrqclig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by DB9P251MB0546.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:335::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 11:07:59 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::4886:9896:ef53:3d21]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::4886:9896:ef53:3d21%5]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 11:07:58 +0000
From: Nicolas Carrier <Nicolas.Carrier@orolia.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v3 1/1] package/shadow: new package
Thread-Index: AQHY3yHdMcxLwNGs8kaCEB78orb/0q5gKnIAgAFWGwCAAu8Eu4ABQuiAgAAJRrw=
Date: Fri, 9 Dec 2022 11:07:58 +0000
Message-ID: <AS4P251MB0612D4DF753A307318923B9A841C9@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
References: <20221013163432.18545-1-raphael.pavlidis@gmail.com>
 <20221205215558.GI2855@scaer>
 <883c29be-2a05-00f6-76d6-cf894e497da5@gmail.com>
 <AS4P251MB061200F650240CFFE6FEF439841D9@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
 <97b952a4-2e1b-363c-36f0-0fe2c0da26b7@gmail.com>
In-Reply-To: <97b952a4-2e1b-363c-36f0-0fe2c0da26b7@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P251MB0612:EE_|DB9P251MB0546:EE_
x-ms-office365-filtering-correlation-id: 4e29bb37-152a-41c7-1431-08dad9d5a17e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cFlRH6DIo4FmDd8YJcMQAkX2OQ9u2U1W+c+QqV0u7PjDFTWtmzPFroNzUq8LltqIMHUaNuN81OJiGRfX7GHqOpw7GgTQSsH29P/m/mONBCDS2n200jkO8sn3Gygq+QvjHnSJe7LBrdYXH/72C5lf53Fmxf0dWHmxkT6hYcEAX2soB/tYHpjAn1xx3E2FavHG+N6ZoxMo0VDkzijfw+7h8N9Hcu/5PcPSZtkRHodqfekkzonGmT8q4g/KzrIHCsX94HobHLSZDhihJcYTaoQXm7rPJROETOnWNHArCyNChV6J+b/eHoyg9tm8ifYTn+xp3gN6I6YaQbirxAHSZfovY+8Ii6ZVRjjGSu/Oq6Ia9/qTbA37urBnv9DCStRlCKV9sdrTjxrhkVrPrXv87dwZuS5ZOCs8xebpSRs5AabaC8BC73qt8tpErKKWnDzE8Urz44/s5KEEZ9jLpX+T/rN70RK1y7FFOcc/0ywhfSBKb+D5IrvkJa9IxAp9cbsybgsynzi1XD0mG1R3JpVWbo20BrpkkaXARPYtwdYkSHYVFDAeJxxZ4vOvpQj2YpFzVvq4iho+g/yb/hhUvTjBItSLAur+qkSUCxMYECzYr91+QyjMIDfMPDzjsp50h+C4raxbg+Pq2Zb0gZntCVk24yOooVWDoVYQbj6QJlf5n6QcGkHaphv1l7bx+ZmapO1yf2LUA9IQp5KuoqJyVnMHAHhRN4rCRP1+Jo5uFIrfITk8Dua1aiZtPiUcugAT5u8Xt6rwPytnbmly3oIKw2D3/5fKDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39850400004)(396003)(136003)(366004)(376002)(451199015)(110136005)(478600001)(9686003)(41300700001)(38070700005)(64756008)(4326008)(2906002)(8676002)(66476007)(52536014)(55016003)(66556008)(71200400001)(8936002)(66446008)(86362001)(66946007)(76116006)(91956017)(54906003)(5660300002)(33656002)(186003)(38100700002)(316002)(6506007)(122000001)(7696005)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Kr4OIUMJMe8YVzr4YRyGukRdgKeY+WNCA9t6OP/H7GcGRWTq6lfxhByWic?=
 =?iso-8859-1?Q?7I4MJMhVW5LGt+YSVMiZMlCpfhyKCvsKTHIMQam1h0w1xou4HG9q8Lw30U?=
 =?iso-8859-1?Q?APx4cbUZCrhjVWx8BxWsO71qZuFLn7QrYXqlJHJ9Pk3lpDsnGvH+Z1xoLV?=
 =?iso-8859-1?Q?vrYqx5eRu+EoOsxFSODKzDWDL5GBguSixO0SKKqNwRai3ojT4RL3BrkhLd?=
 =?iso-8859-1?Q?ylh+U0Q068lBzBUzrdU2rKg3zMIpY8KC7pEPWhjQGIP5EDC6SZ6BMC5k6M?=
 =?iso-8859-1?Q?0TaA81CAR3iIsCmLW+tgriwDCAac0g5GI2wulHLBAfaW1yDAfwEgyF3gLt?=
 =?iso-8859-1?Q?/4EwBKL/L0iJ0hywMN4xL6GUCQ4BaYje/hiGjUi+Lcn0sl7I0nA2wZAMAT?=
 =?iso-8859-1?Q?h/+Q/ihoxbN0nnne9EmP4dnzwn11xINEDvkFw6OmrSS1pctNxTOaJM9h65?=
 =?iso-8859-1?Q?DZKpDsxkqSOSkSsWD4N/bb/c2jXFtsbJybN+8bThfa9PWV6JMCFEoS30d9?=
 =?iso-8859-1?Q?C1tNysl2V6z/5ieWM5RgNLMxv0fu8DL7903LlQBzXT62wTVCZE7kCEVft/?=
 =?iso-8859-1?Q?Cf9HJQU9lv4o9LuLCM4ajRNaEvb0N6FOmSaQz4zwLI1vBl7z84vJ+8cldS?=
 =?iso-8859-1?Q?Pm076w56siT94XBEYn+tQhR+WbMD0xgjPmTaALFFllgYxtAQBskz1J+kNd?=
 =?iso-8859-1?Q?0ZLrRGSQPT3taytz/HPnTtXydxNw5VMmOCa9zzY56Ke3QoeLLaNxlw4YPA?=
 =?iso-8859-1?Q?K3i5/OiEFM9kX9exOxnOT2Gkhy67p4FjxvvEs8VeEn1ELDC25TYW5iZCeH?=
 =?iso-8859-1?Q?Ehk7+oShP+ZFDGUN500eqQvrXMJMgwnvcU+rxamD92KwX0Wv1C/cmmOjxt?=
 =?iso-8859-1?Q?hYPhH+AZqMH8k2gUzQAYGPm5yyaynjlJlE9+PgVGN1olHcSKWbcu9wgmXL?=
 =?iso-8859-1?Q?OVe/jo+7u3JQGWcg4HInYX+b0dU7DWnV6ADQ6Dw9CCPAyA1jlGqEEKKEez?=
 =?iso-8859-1?Q?l9dJ1hzAssxhVHTeBvlsQAYwCIBjH9ySl7AunKfkqD0JzglymGUuhsH6Bu?=
 =?iso-8859-1?Q?1MauKyr/rt+PKKg+2+SrLy+NKpWNpJ7R9H7JlcvOp3KC79TIczq1g+7+91?=
 =?iso-8859-1?Q?RLKDIidCrJNplLRaGYkSO92EhBUSePeVBYNgibJGCjKQmGzRVPw1KYEqDA?=
 =?iso-8859-1?Q?Dm6ncmKl0rxP5RHgdveOqXVKGXSgXAmuPpKzCMEe4G9GO+8I7sz5phzqC7?=
 =?iso-8859-1?Q?bEPZ0BISUWfR5zxurpkdsUKp0P1nVhwvJt//NsjqJlNpAxWJrn1a1vBSnh?=
 =?iso-8859-1?Q?6YGSDn/HJpjdNiJaraxu6CKk1TOMhGUo+0IzZYaeBA5eCCFVgJeRuA7AaA?=
 =?iso-8859-1?Q?2z7LHcf8Jp2LXFEv71kkGX81gP2OAypEEaWrwcdtURmldsgeLknmK35YBW?=
 =?iso-8859-1?Q?0uuCsgI1PKeR/Eq5BX6htbWqx4OEQsMmG1JTPGMVY3iwtBwk7sYQYuqdno?=
 =?iso-8859-1?Q?FxgCxeOcmw155FnR80cjSiKSsogFupZcFEG3EkbzDibNn6Ne/LFiEDZU0y?=
 =?iso-8859-1?Q?Fk7NXMXUMy0x1NkuloOy5G/c8TKUZ2tQ8hDU7CGbNaHMYp09vWDUrq2MYW?=
 =?iso-8859-1?Q?dP99jcltjCHJUOMPLP5xdh2hwNueUl1X3wuqYyxch4X6mnga+9emlR0iMV?=
 =?iso-8859-1?Q?Y8y6dvVOzDEtQ2v9DgLxkgyY+NU/GyUsylISipm+0ulRlc+sY4jHQmCTqz?=
 =?iso-8859-1?Q?LQxw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e29bb37-152a-41c7-1431-08dad9d5a17e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 11:07:58.6533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QgNVJVtX4OQy0TYRLtDLWK93q3HNPMzkpp7gB34T2zFFPyw3BkDn76X3d9ZuDG08OVonBIvp/5QQ+nQYrpg4xsr6c4DHlggH9xnLMX9Gq9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P251MB0546
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orolia.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcjKrjDlmr93mmdROzl0HXl4dH90tummwaQTF+hF5lM=;
 b=AGZJ9SxVVHoS0P1D7pCuJ4KECUGINfAyxzWJbRz/4LOs0U9PfXo/2IwEvnxmuvdCFN0gsgbHGlnIWCiW/KZH2N3LowYPlJx/7pVqI+1rGMRCpiF46pdUwleUL866x8QOdV4dNK7Vmppck9sAEs+b+lXYfBH3j/9a64q+uzsI5Y0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=orolia.com header.i=@orolia.com header.a=rsa-sha256
 header.s=selector1 header.b=AGZJ9SxV
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

Hello Raphael, All,

About the author name, don't bother, I don't mind if you take the ownership=
 (read: the blame :D) of the script.
That said, maybe buildroot maintainers would like it to be expanded? I don'=
t know the policy for this kind of tests, is it sufficient that it demonstr=
ates that the package is able to build something that works or is it expect=
ed to have something more exhaustive?

Also, there are those:
self.assertRunOk(f'userdel {username} || true')
self.assertRunOk(f'groupdel {username} || true')

Which I had to had, but I never fully understood why they were needed.


Nicolas Carrier | Software Developer | nicolas.carrier@orolia.com


De : Raphael Pavlidis <raphael.pavlidis@gmail.com>
Envoy=E9 : vendredi 9 d=E9cembre 2022 11:24
=C0 : Nicolas Carrier <Nicolas.Carrier@orolia.com>; Yann E. MORIN <yann.mor=
in.1998@free.fr>
Cc=A0: buildroot@buildroot.org <buildroot@buildroot.org>; Thomas Petazzoni =
<thomas.petazzoni@bootlin.com>
Objet : Re: [Buildroot] [PATCH v3 1/1] package/shadow: new package =

=A0
CAUTION: This email originated from outside of the organization.
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hi Nicolas, All,
thanks for the Test. Should I add it to the new patch then? If yes, what
about the authors of the patch, should I add you to the authors? (Is it
possible to have multiple authors in one commit?)

I already apply the comments from Yann. Therefore, I would like to
create a new patch. :)

Regards,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
