Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56CCC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 06:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4513B403AA;
	Wed, 27 Jul 2022 06:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4513B403AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9p-UELGk6ZK; Wed, 27 Jul 2022 06:36:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 344C040132;
	Wed, 27 Jul 2022 06:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 344C040132
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48B7B1BF3A8
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAF60817D3
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAF60817D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wfqnk2ozYBik for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 06:36:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2AFC817BA
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2AFC817BA
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:36:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfsX5WktSh4zhQhbltxcLdmJIYgYwiEJl3Jl82yYGnOMPcgLjMfJdJ5baJUI3PVsNDB9Axb8+XF3wo1seXpbxFlBgQStaJNB2Efg+wo5L4GrWGabYtG4KMNrBaJ6bUoaH/iNMfs+h5lsH4rEQYnG454rOGsoX5N4ZVx1+gVbEI3xo4eB7VtjsbvWLUD6MZ5OO7KsBjVnBjmiSoVpnWxGLcZDna0UQoIZrx5DX4EIWIXqc2EzxMPCUqN1B0oDUJJKHlMzf2075N3f1gssoqJdE5aKZnec7biexxpfks2Qxvd133RHcM04YNno3i8marHIwtEA5Dq5wUovhXAMOF+CHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHWXCHVpp+kXALhuqE37hqXBHryGmniDHe2DqUjEue8=;
 b=Tx7lFK8TQ8GcUVfXsYULH5jlCSVohGuOeXqBKlLV3Eb493jlY5FdYRKYYS0pwU/iuhQ3JZ12PR0Sn/8oeorPvfRYalHL3DN69Af9c4cHEgmqyB0jWbhg4heK7g4d9LUN1zfH0vDhPSZ0KCqe5p2uO0GXqqeMefwOgOTv0HkXBwLV4IuRpaDD5KG+H7bC7B+LWUkSvmRReCtLiqNrGXP17KBP6Sz87cU9t9MDhMsJHX0Cm5Q3gJAaAMlDQ5HvANDn0e2RluMBL3+SBa1VUhLr9HYYukdtGYkskTlZHBNjwRxDRcWQDKroIdSDl+TlsqTsM8tG9Z59CheJQfl9PoFF3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PR3P190MB0972.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:80::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 27 Jul
 2022 06:36:14 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::fd1d:ab76:5962:e87c]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::fd1d:ab76:5962:e87c%5]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 06:36:14 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] toolchain: handle white spaces in
 sysroot path
Thread-Index: AQHYadkWqxFJBE20SEaWLcpm3s8gFq2Rmm2AgACP5GM=
Date: Wed, 27 Jul 2022 06:36:14 +0000
Message-ID: <VI1P190MB04938F3268FC60B09BB31E5C9F979@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493383AF3C4D4BA08C5CDC09FCE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <20220726233127.1ceaeee9@windsurf>
In-Reply-To: <20220726233127.1ceaeee9@windsurf>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21b94e24-cebb-45d5-e2ba-08da6f9a4db3
x-ms-traffictypediagnostic: PR3P190MB0972:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vtEbkxvBxc0O6GsQvTNmebC4G4dUO7Tf3sFkdZVKVRdTQO7CFFKteXz0Q5XQ2nj3gMsEmzdT5hHgq73phj+cDiqZSUBmkB+WPOaC+WnF4b0xWIjwE61X2fATT57izP/SaLyCMzLRJ83HPV/gJcGAu4sQvDenJfkqPKgCMk93MPHBjxBKRPaXcytU4meSbuOg48kmLh41di5hdEJL5Jv2jVC9nHobk3nLjrrBP5KZPn1vCRlohvO9YONkYLkDAonsptRItrz4QqclTiZ4HLLPXvbXl6FzZ6Vjtz9ka5IO00phPyAzFeiqg/dtQmmEYnHvIy55n4AxjuSc7SQKC4yhgUf1+iIOyqsHsU57BQx3lQb2De/cnICWLHqC+9a0GCoK2ILRouvbAD6eYU1GXP39tYWZ7Vlr/D3mrqphsAldGaGKJ1PNlXJ9wReqPJUYnnH57g4IMXT4g/XqAe15Rs3GKDG4+fZxpM70YB7EBUdIdSGPgWUk7PEMEaQ7wliaRSr4jia/QYRoz+Fd9DfK4uMEjn3qx/GdCMGsXBHAXknrSAvZ7zzy0hcXyvwbszo23YU2vX1tBxhoNGh1/a0gBW02lF2E0KDpVBQ18xuWGAikQUXRp4NRy1M5p6azJWmfYM6qg/ZWW/lRO0paiopbEsB6dKSd7OLk0S52cNhEAoZqYSNYfXMFbayTay/6U8S+VLYJA9XCwBCdBRCfKquNArdy/zTwXuj1hy3q7O3OQCZWj+G15p7LcDxKW4GjfmJeFYHF11PIurob9wQD76Zji1vKtgOVm4CZ3TXk8PLCTOZmJD4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(366004)(346002)(396003)(39840400004)(76116006)(5660300002)(38100700002)(8936002)(186003)(83380400001)(2906002)(4326008)(122000001)(52536014)(66556008)(64756008)(38070700005)(66476007)(66946007)(66446008)(9686003)(7696005)(6506007)(41300700001)(8676002)(71200400001)(55016003)(26005)(33656002)(316002)(478600001)(6916009)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iKzBTA//LpU2kNDk72uCYlOfnrNJMf88ZLjL9rhFNhUFnbnIlK4UKmYgn1?=
 =?iso-8859-1?Q?AMmTMNw2iC/6cHivWr3FqI8AcS/FU49I+qDJ7mU9mTheVAXcl8w33rU8+A?=
 =?iso-8859-1?Q?KLoGtHXf450y8/U2KRyrvYC3oRCdvu3wcdrt+7fZLt7WkVSI2vKyBH/FB9?=
 =?iso-8859-1?Q?9UNQceDu3a4z/4eyi1xL2Bs+K9IB3cqmz1eXBvbr7uq/xTQHWOyHcNpfV/?=
 =?iso-8859-1?Q?xGXME/fhYoEwGUfO9EsGbwGgNojphOE5RULkUYpD0vsQA2ZBMsXaKc1F3O?=
 =?iso-8859-1?Q?NvlNkfRhGbD9jE/nku/pwhQ9aP8zsz1W0YTeQY3bKPzC9g687QPMsNGzsV?=
 =?iso-8859-1?Q?Spweh4qr7qFW8YQidn5tUL7/4EtD/nHblViuHHXZjxxuG1ZEPdYLYBuyzb?=
 =?iso-8859-1?Q?GwkUX9IIRXmh479sJmcVT/zfGtK41BACXHRqBjErPa6+Cg+smta0079Af7?=
 =?iso-8859-1?Q?54Dzr9KmJQ0PI9shaIOwVTzbq73F0bnjU+lS3pRtfS6ai8qLAaCFdHO2zN?=
 =?iso-8859-1?Q?jVrjgvFY9UGCvc8G9TAHZI4TsfYs/bMZOz/RBjfQNC9E0dGvZoIeSLjVbZ?=
 =?iso-8859-1?Q?X9NnbbdhTt9dluxu5NjnWN17t7e/oUNzAtjbhQdmY0B3+atwvZtdT114lu?=
 =?iso-8859-1?Q?jSmEIcVG9gysq4T07S9SyLdUNolxCxGs1F54okhHDm0TuVKzv0HpE1xJt2?=
 =?iso-8859-1?Q?8jkdML7tZ5jh+NgvJWGIlpSQbYTGZalR8i0l6tbt/2U/AA46rIQiwP2gF1?=
 =?iso-8859-1?Q?VIT+06JS6332IsPl5IMnkRdIdCDEThtCym7ZEL4zl92V7jTqzG6St1SrDv?=
 =?iso-8859-1?Q?jieuAgFL2XTpRH3ToBJoOQZfpE+VbP4JMcNEaJTlgyY4wIFcl9Z7i6a/Sf?=
 =?iso-8859-1?Q?9TBCombFSOVzcjhevsg1FfsAmPVgBA5lRLZd8Ux+FS1JSJSQw5Q2G86A+i?=
 =?iso-8859-1?Q?JV2cETcD4AA/so++bt7kyQXPwn+rwQ5vwZJfR4WIiwdKGUqyWOC07hr2pn?=
 =?iso-8859-1?Q?9bU8LN8qH2D9klLx0fjFb2RyOTdKTArB9NiSqX3wLAhtVylRuI+taeFNct?=
 =?iso-8859-1?Q?yQlMq+SznBHJ3qRDrevuaoKOhTRTKpDf87BaPKo4CA2ucl7aDP6HQi8a79?=
 =?iso-8859-1?Q?RUAyfLRuESUeXCzbSOjeSPSebs1HqHvyVoZj7pVRe2or731aQtlusZbBlC?=
 =?iso-8859-1?Q?wlqe83J3yfX2Dx5QlLZTI2stHbWcmriD5TRPk9bM7aK58/KSQ0cJ0gdwu9?=
 =?iso-8859-1?Q?Nb5UHe9kbLUwsHOJ/+2ZZ3/4zC3SafdlB4Tu6E6WX3Jb0lbsIFSCRba+8Y?=
 =?iso-8859-1?Q?9JimEp6Ao7SV3N3oONF+mxE8DyRdq7fRjZYtUjIh+lG7QEyLfxyK1XWdW+?=
 =?iso-8859-1?Q?qSJr7Espn2Lgms2GFP/aaORMcmVa2qQ8DlZgoQe41o0S4mk/Z8JZSodMUs?=
 =?iso-8859-1?Q?2SyYdm+9ZbmZCNEduPcXAeqOKU8Q7G+UY6Eg9s2yHS+EFdyDigA93TUVtt?=
 =?iso-8859-1?Q?QSvZ/OenoBnFblzex1feCJ1ve1KLRdpNmpBBhDh+6Mpy7tv9U1skFTV+Gc?=
 =?iso-8859-1?Q?iCUMVBv49iY3uQIEzCDEMwNakSZ2QDojU2YlErYTSysgsY1gqfKkuCZ/xO?=
 =?iso-8859-1?Q?c9Z6VppXz9y28=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b94e24-cebb-45d5-e2ba-08da6f9a4db3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 06:36:14.5471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zOUQo2Aju5jCgwZosi4VUCq6Qa3uOohk8eRHZNUDDRDsUH/16NWLeCj9NeHA4vhxY0hH76z498zQS7llqPrHpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB0972
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHWXCHVpp+kXALhuqE37hqXBHryGmniDHe2DqUjEue8=;
 b=HmgYINRDFSem/x1JeVBCBn3EcbL5K8NX6dJHhu8UWDabntXlED/LO8PvwiCQ042/Xa5B+Kr8ErvW8Fw4ALeVQtgKnOaMC4xNBT6MJnt9TZV7FOIvrLsWNKyPZuRm2I5F+UYg7cFocXA/lsBFTl6FB30uBUPgmBK9RLwE7B4XTzE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=HmgYINRD
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: Re: [Buildroot] [PATCH 1/1] toolchain: handle white spaces in
 sysroot path
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

> Hello Daniel,
>
> On Tue, 17 May 2022 10:32:12 +0000
> Lang Daniel via buildroot <buildroot@buildroot.org> wrote:
>
>> When changing permissions on all directories in the staging directory,
>> after copying sysroot, paths that contain spaces break the call to chmod.
>> 
>> With -print0 for find and -0 for xargs white spaces are correctly interpreted.
>> 
>> Signed-off-by: Daniel Lang <d.lang@abatec.at>
>> ---
>> Backport to: 2022.02.x
>> ---
>>  toolchain/helpers.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> To be honest, I am not sure this is sufficient to use a sysroot path
> with white-space, and it's a scenario that we are not testing, so it's
> likely to break in the future. But your patch doesn't hurt, so I've
> applied it anyway.

I came across this problem while using paho-mqtt-c with a staging path
that doesn't contain spaces, but the package creates
"$(STAGING_DIR)/usr/share/doc/Eclipse Paho C/" - which contains
spaces. When changing/updating the external toolchain that we use,
the subsequent build failed:

toolchain-external-custom  Copying external toolchain sysroot to staging...
Fixing symlink $(HOST_DIR)/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/iptables-xml from /usr/sbin/xtables-legacy-multi to ../../usr/sbin/xtables-legacy-multi
chmod: cannot access '$(STAGING_DIR)/usr/share/doc/Eclipse': No such file or directory
chmod: cannot access 'Paho': No such file or directory
chmod: cannot access 'C': No such file or directory

>
> Thanks a lot!
>
> Thomas

Thanks for apply it!

Daniel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
