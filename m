Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03ADDC64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 21:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 761DB408F0;
	Mon, 27 Feb 2023 21:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 761DB408F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q2NKqmS_O3CA; Mon, 27 Feb 2023 21:33:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5840A408FB;
	Mon, 27 Feb 2023 21:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5840A408FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27F8F1BF28C
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 21:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 012EB60FD1
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 21:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 012EB60FD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Nlgicz5PLjG for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 21:33:33 +0000 (UTC)
X-Greylist: delayed 00:15:48 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBA4860FCA
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on070c.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::70c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBA4860FCA
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 21:33:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ZlIS+LzCrpnUC6tAADS/Fu5j+1/MnY98ZgRog32UB9WaACFeYr41KVEP1J7EDDUkFQ+Fc/3BREYPTxIkFEShkX6qrNo+fVXSEQHZwUiYkMVXswCjU+L9qUz0LozGGN57PQg7UHti32XG5HpXaDxNKjhJzMw+KOEV2JlIhgmEHhZhxx5Y1wPIa5UwRINNCGrPv3lKk6bbc0DswJtxwwOklneuOfWkqqvgIYaRgJjpy6BDxQfvp69aYAiRlghr3qNjcHMXS+N3dz0VOM5KsOjsL+OMwYgB7ilGyWcxAlItCjjRIiuqnuaYZRa6e8UlzBzOe/ObBHT4i/brk3bEJr27Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Myzfxu2DT3KUVRxgsz2M2+R2xUzAvGeGDCVWeSUqFNU=;
 b=ou8XJkLqHuY6WLgoVEG7p8lWbRyeKSbyWcPovt8AXSC2u+jGj+xTFUwRceED4QnXxmQL2Sp9IawEiRteC4kPTJMJWVaHK3l5SZ40AqnyjSyFXDDssDZlqkp5UT4RFpzodUMn/YL7mUbkH5Xl+97eTP+ndmdFaJPC6VHwIhitl8/OG6ttMVo6xKiJlGta9SIVsyPj39xNy7h/pN6GgbCyrdp88JVajpcFCEDAEynnBontbWoKCxu0vKrUC8lV/mnMvjMoHaUF3Xop6PWOxkNcDr+pjBEVoCMdIG96LKQtXN6wz4hhcEraG39loHToAzuUeFXNUqD5vIz7VPQcNQReqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1602.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:188::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Mon, 27 Feb
 2023 21:17:40 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::7add:5946:edfa:6242]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::7add:5946:edfa:6242%7]) with mapi id 15.20.6134.021; Mon, 27 Feb 2023
 21:17:40 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Peter Seiderer <ps.report@gmx.net>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1] package/speechd: fix gettext version
 mismatch
Thread-Index: AdlK8ImJARRH02RSREyn0/UBc/i82g==
Date: Mon, 27 Feb 2023 21:17:40 +0000
Message-ID: <PH1P110MB16030F6BC0949CA7477F0B829FAF9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1602:EE_
x-ms-office365-filtering-correlation-id: 50a27c9d-85d0-4c21-e8a4-08db19080f1a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HPq6HhXaEPjujPD0BIcK0dDxixfqkwY4c3PgIIrL32hs1NCvKE+P5kDgiJgI0vVtkTtE7cv9y4OdbzLmJte7r0+YPbN+n3j4QdCo7S95sYfigSTOaDbU8k6Jk65enSvnkWX1WTPunugrjdmtfhYv5SLyhGb3kbUSSsKJ0ygx/j07AKfRNV/hzUH06/FdRWHUbJZx18xyYeolsRPMGwF0v67JwF3QXwPM+UnQkkgRXn3kmRwUAn+D70xn23B8KfPnnL36HsvYudnq27gaCtb0td/krPdu6XLoJk0BV9X4wB1i6FXxaGxxC3tBFgb8cQKZ5ZvTJrFzpzSU/Ay+iEpgYIeKybGFaNDpBviDpM9PtLzD7lh83cYZuqeqf/dK0W3PLEab8OsIWJiLlCA6yYufi1gbOhcTEukfWGWr2fyY9T9efQgTwTnww4YfxvwH/EgrKQenlCdgf/6LTYmGkBG/ycorcWSiTAKwsTg3CYY+UX8tkSoQVwwhk3h3M2jl4Fv6sCU1eXubWh4yokSV85YrRSeylEf2oENJ2cbE2FujvcRrS12mlxrJki8IGYZUiqjjcTeqZEo19LsxswGCmD+jOGd6FL7eAMTnDqQAh0KlBzw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39830400003)(136003)(366004)(396003)(451199018)(71200400001)(966005)(7696005)(33656002)(9686003)(6506007)(76116006)(66446008)(66476007)(66946007)(66556008)(64756008)(8676002)(53546011)(508600001)(186003)(110136005)(26005)(41300700001)(41320700001)(86362001)(5660300002)(55016003)(52536014)(2906002)(38070700005)(122000001)(8936002)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: ajL5yRerr6d3yY8KBMpiehEYPy5NfilOq5RYuMYWeLYdda0Gf+ftjfJk1KJBtVPrfOb1ipNthIWCm0gQWt2fFCe2vKPkMqxZzCzMzxt2jX8EmHQb73r5xxlzZZcZS6Z1Nny65KGiUN4zYBgU1Ugf5dFt++wu0TjZdDtW+UV3rG3OjUmEvVaqADOz2o/j/xszVzXNx5Wjl1nhWN1gOYDIl4zki6OVqd4iZR3/50DTvb/kiwQi1zsW4CscaiC3xrWXFoIX181tjLhZdfuY11km0l8729ahiE51ZROdAMmbuA4fIftUDgbNuWpNzJ5EDDlvVV9swhIY3sQAeP7rH0HoGm/ozwmmwy9lXI0PAZahLHc6zLJl3QvenU8dv/o7oVCgXpGQS/V4AhDSSc/NFtynCLt2EjY2jsNnkuO0RQkXuu8=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a27c9d-85d0-4c21-e8a4-08db19080f1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 21:17:40.6442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1602
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Myzfxu2DT3KUVRxgsz2M2+R2xUzAvGeGDCVWeSUqFNU=;
 b=61dmr56RjkBIXWCm6zqsfLRmaoMrTX4sCBUMbx6NsiE25vcRs3T0XvymgpujrTVHqyG1c2DqP6CqsnVQ5qcHIkqi853dPwY+rYa92xynwupFnpLYIIS7UBEgZqt+C+Gn3aW4WaYLV5XcJdh+lER8K2xzzh/bcqZWrp3TEUGqUfNqONZw6kcqHfeOrlTysMZXqBQGYDkQMu0D0FQuMdxtcpOBbZTQk2dAcXKrlCGcU+bv+bwwG2BHXz+YB1siZtBMQ434iWzrFph5aV0CH4YDjIXlqO01C7l8BpMHPmT576VTgsyuYmG1s0jokOXymNtKjHuvh0dIDsFbydU9x4m6XQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=61dmr56R
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH v1] package/speechd: fix gettext version
 mismatch
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

Peter,

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Peter
> Seiderer
> Sent: Monday, February 27, 2023 3:08 PM
> To: buildroot@buildroot.org
> Subject: [External] - [Buildroot] [PATCH v1] package/speechd: fix gettext
> version mismatch
> 
> - fix gettext version mismatch in case of BR2_SYSTEM_ENABLE_NLS and
>   BR2_PACKAGE_PROVIDES_HOST_GETTEXT="host-gettext-gnu" by setting
>   SPEECHD_GETTEXTIZE
> 
> Fixes:
> 
>   -
> http://autobuild.buildroot.net/results/283333290c5adb48d0c6e592b3261992
> 537f92d3
> 
>   Making all in po
>   *** error: gettext infrastructure mismatch: using a Makefile.in.in from
> gettext version 0.19 but the autoconf macros are from gettext version 0.20
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/speechd/speechd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
> index dee94a6752..ec62980986 100644
> --- a/package/speechd/speechd.mk
> +++ b/package/speechd/speechd.mk
> @@ -11,6 +11,7 @@ SPEECHD_LICENSE_FILES = COPYING.GPL-2
> COPYING.GPL-3 COPYING.LGPL  SPEECHD_INSTALL_STAGING = YES  #
> speechd source code is released without configure script
> SPEECHD_AUTORECONF = YES
> +SPEECHD_GETTEXTIZE = YES

I wonder if this will actually be necessary after https://patchwork.ozlabs.org/project/buildroot/list/?series=343029

Can you test to see if it's still a problem after applying the series and using autopoint?
Otherwise I'll try to find some time to test your patch with autopoint to see if there's still an issue.

>  SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
> SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
>  SPEECHD_CONF_OPTS = --without-kali
> --
> 2.39.2
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
