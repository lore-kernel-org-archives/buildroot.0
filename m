Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F27CC04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 14:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE22840A9C;
	Wed, 28 Sep 2022 14:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE22840A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aH9f8-yTVZ2y; Wed, 28 Sep 2022 14:34:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EED24097E;
	Wed, 28 Sep 2022 14:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EED24097E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8D61BF368
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7984640A20
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 14:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7984640A20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEPnJIzqith3 for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 14:34:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FBD34097E
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FBD34097E
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 14:34:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+ussLh0rvU4erEF4Jc9jybC91G9wNFvVbJYt4PjFLcAjmgvEOrUH3q+DeGpxjalbMZK5zy8yInS8+2o0H+WTqib+6t4d7Aws807hVQEoKRBDFY5KNf/FP0ThZTN14c65xKgJ5FCGLVc1vLp7oFNR6YvDx3Sfxcs2y9EXNBEjTVmv5fUzAWuu+3dJ2RNSN1st02pNTnA6na/s2/4N3Rb3D7ZYZ+C5XAASdkDLEF4SVebyJu9jdYz9FlYg3NOzM7rcdIVJrtr4q5Xt12Q74/ykN6t2PaACZZY8+Nqn+9iBBJHtLNZyQI6ZnYQv3mgRc6GNOa/DKOWnncpDlQNArPWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3u0ZZS+S+vx5fRJNNkqCKh1Bkqg/zd9xy7aUJxJx5E=;
 b=a+1udylEPJyiggBPkId+FyQgmZ4L+lI9VZmfjZC6AgTCOfNY3ziZnIdC6OQ8C2fpL+GiJ5Fz3ftfz4XPiTpUJG02DwD1KZWey9F40WDtIQo+5LRxbZ9pGj9ZxSpcA/3fg1J7rsMNiGx/rAIQjheSANkDrTJLEz2e7pSzVBRvsGt7ZJQO44cPXrCCJg4oelhcRd/AgdpkPPYL7Hg/2tOOpu6eZihtYTo5xKhmJ0QPegXJIZzG4XCxJMQiPqPqTKwCSnFV6h/H6wSqXEm7ygpf2cqjzy627SVPF+sCvD9vC52+eyvmETOV7+2hf0uRXUlC50SxWRBnsV5U7fP15G4bNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:32::11) by
 AM0P190MB0673.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:197::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Wed, 28 Sep 2022 14:34:28 +0000
Received: from DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b]) by DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
 ([fe80::b4f:d4c7:8621:7e5b%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 14:34:28 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 11/11] DEVELOPERS: add Daniel Lang for llvm-project
Thread-Index: AQHY00Zw2jv8wzY7wEGdDdCG1yyShw==
Date: Wed, 28 Sep 2022 14:34:28 +0000
Message-ID: <DB6P190MB0488023BF0D01612874A11709F549@DB6P190MB0488.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0488:EE_|AM0P190MB0673:EE_
x-ms-office365-filtering-correlation-id: 7c594787-6f23-4de9-2dc5-08daa15e8c66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VboZyewJu2WpGiULZQPZPD//RNhcBxO3mjwcUEZ2bSAZA7yKV9vkOPBFGFXqMKt6xohJ+y/ECsbAO/lz2r0vtCItytth8bwduuC2QRt8MWdUT0gchxKQ67yxoIfcJTI/LIgTMaugFIru9BwIguI26ap0UYuLvmuBraa79f1OaWrEhpFyNz2PSi9RUJ51LPRm9/yUIobYLACVUxr3FMeMbcgR4K+c9ZyEITaPMNVyT25c3x32M+MAxqvAKKFXXf6b+QigQlIAnva+i37IgPbSYnXQ8uqX3DIlkiwSpRPyRcCh2ViqY7iUeInAyxIU7qH0P08KLoLCAg7bfVMuu+Pf89FspdHhC5NCyR6s1qffcpCJ5Gdq/M2VYlboVMX39bUHlUrPuMBRSXCpwQHCBifzHkIuy1mWMmeZ3zymMSNw1XaH272nu5886SbqV+MDxeb9gPKlc2nZfWhuQQjkDj5XtA4jP/6Q5ruUGtj457xP6hMSgxN5G1XEgPxwF8UCsaY6myixxJWVxzUr5GG6tF+UvOui8V1nndTAmiooKKc/81jO/gYjKE5P7pYD+yEfm5f3OU1NG7Fjx3755bIM3M0y/P55a0NjIkFlfuI3zl727Vm/cN0YiETJ2dklT5+7ccdwjK2geU92lPHB+7341b6jyPWbDkT97+hxFbyIFWKktQEHQU0/5F3igaoploP9VOoBpReRe5viFcWZCMaGq480RqpoJHVHS9AjsyXpTF0rIEi0/byu7S7MxHdB9KhMLP8tEJn1DnQgKFel1CXqMTy6FQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P190MB0488.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(33656002)(54906003)(6916009)(86362001)(122000001)(5660300002)(4744005)(9686003)(38070700005)(38100700002)(186003)(478600001)(91956017)(26005)(52536014)(6506007)(7696005)(66946007)(4326008)(71200400001)(76116006)(8676002)(55016003)(66446008)(64756008)(66556008)(316002)(8936002)(66476007)(2906002)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zlMv1ThZ+Ar6G71GqN+TN3QDoNkpwdtfcke+Fz6uaXtHE+wk0B0Lu0pw2d?=
 =?iso-8859-1?Q?1HV3yz9QU2hBig13Q61kiUXwX/WKj/Tzq3AMWetEtM7YkOcHsdpRRP7C1o?=
 =?iso-8859-1?Q?1TtLTv6zmDNr0LRcohlVTIVAuYX+orbixwoe7qXwd8jCCHf0hRMaA9Eg61?=
 =?iso-8859-1?Q?uQtUKhd8dJTy/yhmE8LKK91nxVONG7psNmt87Ogg6IA2pMg7ZFXKRBv9AP?=
 =?iso-8859-1?Q?bzj/JcQ2/McFtmQOh6ncC+/2wlN2QEHiWZ4QJg3O36oT46n9/6H/lo3yx2?=
 =?iso-8859-1?Q?mPPEeQpZF/ERWWuRVG0QncJIuD49vrbHG2YsAR8ByG9ioCfp4P7Dq9s9on?=
 =?iso-8859-1?Q?qOjLepl8aN3tGnTo5u0jK/LeF7NcinaHa2+V1viTQ7/EEm/GfYY9Cz+biS?=
 =?iso-8859-1?Q?YymywXUS63PCPPmf8k72DRzrCS+baijnVowj4OygpTV0UlRIkDK2MGdUMr?=
 =?iso-8859-1?Q?J5yCn6w+3tbs5Rk8E7S73/Y4ksCTU21moELsFWlUxUfWZYnbv/J6/Le0kR?=
 =?iso-8859-1?Q?lVl8WWMxBaeDzJzuqovR7gySMj9k7FzuUu+xiwwzZNjy/4+J/IBJutyhQz?=
 =?iso-8859-1?Q?ThOS802qS5g+NTw22Lkt0xQdImAFo6DRfyrgEUCDnVuNqo1efhEOJEgq1m?=
 =?iso-8859-1?Q?tKzDHqzXwcwV+OigICzcNaBYRPSa+l7kXCXZmm+RTYpHaV9KMA6ZTPCGAC?=
 =?iso-8859-1?Q?hqn0CcZJQX4xIhI2ZzMKhuTrZtB2RjyQu5xCPcSa4NnJhag0GD7ufHwaWO?=
 =?iso-8859-1?Q?7tE4F6Acg+Kn/67KCdhCDIntRsp/lTJpmgGnsxXYYLamlg6u4LxXQFgerA?=
 =?iso-8859-1?Q?v7iNVXwXbTbk5C/htMNuHHP37Ku9/ZGR6AgMXqN279jVcFLxF7FBvw0ofy?=
 =?iso-8859-1?Q?ImT4SVgPhlQTt0GHXknfGbC3TIghrpBSbyLoNS1hD+2/xIV6QhVwco3ieY?=
 =?iso-8859-1?Q?mMXSnKGcRa0MZW3UiftYkvf/O85OaFNcc3kUzmH7xJH3xRxlESVrbPkJqq?=
 =?iso-8859-1?Q?MLJNrVULXYrbN60tZklWOal8MUTdIRP4az5deKyvTUc/M65TVjGYX/o87i?=
 =?iso-8859-1?Q?GsqUOnXcUA5eJrmCPnuixYyczR1rp15OEX2lW8+8P2Sd22KywuQTmb6p9B?=
 =?iso-8859-1?Q?HwLCx6mmYnjFzHvuODcrkupbxAXZsNdeI+uP0SXg5kFMS0cJPtB1cnxIXy?=
 =?iso-8859-1?Q?ShmEeO6i2JeaoVG3Wvwh/kYev8iTe4Igf4BfucZTv9Ajbqqmr5j4fNQ4ju?=
 =?iso-8859-1?Q?G9wgyfmUEJlAwbkLIjSDSvZzIDLXJaaFB6HAJk03f3BYSttIGCgmFY9wf2?=
 =?iso-8859-1?Q?Ybx5xGrjK/gWiWkErbrgPlejIdHsdbt1QUayFf2wdv1C1M+VzrQbIF3dsA?=
 =?iso-8859-1?Q?wdrIQBFYr+yCGsw89RacSse0KkKAAQnJBkOpocLPxG+iZm7TmpsScBLzbO?=
 =?iso-8859-1?Q?nKlRcQ9NlbPapiYo1tZ9QrqvEzMHq+2ihfg5EYmIPgqxD9qykH8vvlCkq9?=
 =?iso-8859-1?Q?I3+Dyd+IlT+qb23WAKYQy4iAniYkxwYgB/jKoMobguK/JEN1Saq9j1ccQr?=
 =?iso-8859-1?Q?vwm1BuSOCz+jQbqzYyRyVfExdjBgR9ohOq5HqT8JjKtIM8xA3WntHjB9Vl?=
 =?iso-8859-1?Q?zlsbpAAtpaWnY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0488.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c594787-6f23-4de9-2dc5-08daa15e8c66
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 14:34:28.0538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3nFfUp9P8Ns9g+pSyb/4NaMJs+HBvkkRok5B2PKl1NXuMuVdNAc7l1tEtSYcDVGme96sUY50qpjUUeCXjlcb0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0673
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3u0ZZS+S+vx5fRJNNkqCKh1Bkqg/zd9xy7aUJxJx5E=;
 b=GjW/8sH8HKocZK8pTKyT0LOZhT9jb/tg9orooah5xsSigj7r/sQjey9sJYH80hty7CJP+X9Dlr16tXSYfmSFoez0CZrQFMdc7FpZclP1vZ7AiPNGKa0YZXZos0KnBMXbuE1JquvYmpw19r3MqgDAslOMeTN0tUjHr+7VB66pDzw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=GjW/8sH8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 11/11] DEVELOPERS: add Daniel Lang for
 llvm-project
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index facb8ce58b..418f439bda 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -633,6 +633,7 @@ F:	package/dacapo/
 N:	Daniel Lang <d.lang@abatec.at>
 F:	package/dbus-cxx/
 F:	package/paho-mqtt-cpp/
+F:	package/llvm-project/
 
 N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
