Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7D0C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:42:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AEBF61075
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AEBF61075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iml.fraunhofer.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 533B040A4A;
	Thu,  7 Oct 2021 20:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCnyPNRIZ4s5; Thu,  7 Oct 2021 20:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D2ED40A5A;
	Thu,  7 Oct 2021 20:42:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22EC91BF84C
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 124DD607CF
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYJVZFH5PSYs for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:42:03 +0000 (UTC)
X-Greylist: delayed 00:05:45 by SQLgrey-1.8.0
Received: from mx-relay81-hz1.antispameurope.com
 (mx-relay81-hz1.antispameurope.com [94.100.132.251])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CDAF607BD
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:42:03 +0000 (UTC)
Received: from mail-mtaka28.fraunhofer.de ([153.96.1.28]) by
 mx-relay81-hz1.antispameurope.com; Thu, 07 Oct 2021 22:36:15 +0200
IronPort-SDR: VPoGpie7PYhIWhqV+Rn7PS84KsQ1CNXgNhKyNBKebkCEio+eaSnozWasSjZtM3vGQmvVGrVk34
 b40wt+XSrTyA4HSFGiQTS9obj/FpllCXds78pUwR/Es4D6vGZ0UQwWsQ6ASPG7c3Js7F6Un+yh
 8C1lAD2hpWwaS+u/ijLyXgUP322oLjkrxMqLY66jjSc8QEe8eVJJ5EXHiuHivkl6nLln6M2ITH
 jzX9tN23o684feEiZoCwHV2rsAxRmaNsH93kAz4P+aiHIrinmhZHyysF9Q56JYLoMaTzP/BEs/
 znMoqsPnzOeZpz2ATYWKD50a
IronPort-PHdr: =?us-ascii?q?A9a23=3A5yt5iBIUw+bR8A8wi9mcuYkyDhhOgF28FgQI6?=
 =?us-ascii?q?54rkbVJbuKk5ZuxdEDc5PA4iljPUM2b7v9fkOPZvujmXnBI+peOtn0OMfkuH?=
 =?us-ascii?q?x8IgMkbhUosVciCD0CoJuPrayAgG8NeElh/8CLzPU1cAs2rYVrUrzW75iITH?=
 =?us-ascii?q?ROqMw1zK4GXUo7fhsi6zaa84ZrWNgRNgHyze7pvKhWxowjL8MUb0uNf?=
IronPort-Data: =?us-ascii?q?A9a23=3A39Y5jK8UeqAiyj1VHlI6DrUDaH+TJUtcMsCJ2?=
 =?us-ascii?q?f8bNWPcYEJGY0x3yzQWX23Vb6qMYGv1LY91a4vj9R8BsZHXmN9rTAU9pH9EQ?=
 =?us-ascii?q?iMRo6IpJzg2wmQcn8+qw0aqoHtPt63ys/HMc5I5SGHyvBCoPuSzpHVwz/jXF?=
 =?us-ascii?q?Lv5DKjKIClsQw9jRio7zx5uwrZrjoltiNm/IgWMpdKr/5yBYgD4gWYsPzJG8?=
 =?us-ascii?q?b+HpTNuoO/25GESsGs4aK0Zp1TZjXQUUM8SKP3jL3b8RYUITOe2S/yZkeO8+?=
 =?us-ascii?q?WnY+xprB8OukvD1aEQXRL7VMwWUzHZbAvDwjh9Hry0086A6KPtFNRYJ0WrUx?=
 =?us-ascii?q?YgpxYUfr4G0RCcoIrbIxLYXXS5eHnwsJqZB4rLGfSWyvJDB1UHAaHewkfxiA?=
 =?us-ascii?q?FttZ99Bp70yUD4LrKNGbW5XKA6GwenwzqiyV+9sgcouNo/nMdpH6H1nyDjYC?=
 =?us-ascii?q?9cgQIzCGvmbu4UHgW1o3s0eT+zDY8c5aCZ0aEiSaRN4PFpKWok1m/2lhyWif?=
 =?us-ascii?q?jBVwL5PSXHb2ECOilwsuFTRGICNIIXTHZ0Kxh3wSl/upgwVPDlKbLRz9hLYq?=
 =?us-ascii?q?hpAtseX9c/KcNp6+I+Qr5aGs3XLroAnMyD6YHPgyRWPZu5SbPoEQ6Ac0nJGQ?=
 =?us-ascii?q?aHfbyVHRPGlN/GziCbsUhLxx7Nt/+MGBAGlksI44i6cAWIFSjMHZcwttIk4X?=
 =?us-ascii?q?zU30F+Okd7zQzBi2FGXYSvArfHF8nXrZnZTczVqiSwsFWPp5/H4vIw9hxSJU?=
 =?us-ascii?q?d9nDKOvptzwHXf+2TmXqig5ibgJy8IGv0m+1Q6W3278/8GXJuIyzl+OAjP/s?=
 =?us-ascii?q?10RiJSeT4a16FzX9/FHMK6TU1iFsGIDnNTY6/oBZaxhPgTlrP4lRezyoqfad?=
 =?us-ascii?q?WSD3xsxRd8/8nKmvXC5dJ1W4DZwKV0vPstsRNMgW2eL0Ss52XOZFCLCgXdLX?=
 =?us-ascii?q?r+M?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ACKtmVq1hvdLbDC7dPovVLQqjBTFyeYIsim?=
 =?us-ascii?q?QD101hICG9Lfb2qyn+ppgmPEHP5Qr5AEtQ4exoS5PwOk80lKQFq7X5WI3NYO?=
 =?us-ascii?q?CIghrPEGgP1/qA/9SCIVyyygc+79YYT0EWMrSZZjIa7foSiDPIVOrIq+P3lZ?=
 =?us-ascii?q?xA8N2uqEuFOjsaD52IgT0JaDqzIwlTfk1rFJA5HJ2T6o5svDy7Y0kaacy9Gz?=
 =?us-ascii?q?0sQ/XDj8ejruOrXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tUDYjg3C4L?=
 =?us-ascii?q?m5uf3T8G6S64aT1eUZpDLS8KoCOCW+sLlXFtwqsHfrWG1VYczCgNnympDr1L?=
 =?us-ascii?q?9lqqiJn/5qBbUI15qYRBDJnfKq4Xin7N9m0Q6f9XaIxXTkusD3XzQ8Fo5Igp?=
 =?us-ascii?q?9YaALQ7w46sMh7y78j5RPui3N7N2K1oM3G3am+a/iqrDvFnVMy1eoIy3BPW4?=
 =?us-ascii?q?oXb7Fc6YQZ4UNOCZ8FWCb38pouHuViBNzVoK8+SyLTU1nJ+m10hNC8VHU6GR?=
 =?us-ascii?q?mLBkAEp8yOyjBT2HR01VERysATlmoJsJg9V55H7eLZNbkArsAGcuYGKaZmQO?=
 =?us-ascii?q?sRS8q+DWLABRrKLWKJOFziULoKPnrcwqSHlYndJNvaCqDg6aFC06gpfGkoy1?=
 =?us-ascii?q?LaSnieevFmhqc7jSwlaF/NLAjQ9g=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DQAgDgWV9h/z6wYZlaHQEBAQEJARI?=
 =?us-ascii?q?BBQUBQAmBPwUBCwGBUFEHTIEDASZDiA4DhTmFZAGCXwGaM4JTA1QLAQMBAQE?=
 =?us-ascii?q?BAQQBAwEEOgECBAEBhH4CgkcCJjcGDgECBAEBARIBAQUBAQECAQYEgREThWg?=
 =?us-ascii?q?BDIZbLgEBFCQRASUrMAcfAQQbBhSCUIF9WAMuAqEeAYE6AosXgTOBAYIIAQE?=
 =?us-ascii?q?GBASFChiCLgcJCQGBMAGBU4EtgwCECYJigypDgRVDhCqDQoNNgi6LAIIEgUi?=
 =?us-ascii?q?BKp93CgGdfgMEA4IEgSwFhUCDC5Y3FJVmkTCWJaVFAgQCBAUCDgEBBoF3JSu?=
 =?us-ascii?q?BLnGDOFEZD44gg3KKXkIBMTgCBgsBAQMJhUcBAY8oAQE?=
X-IronPort-AV: E=Sophos;i="5.85,355,1624312800"; 
 d="cfg'?scan'208";a="69448116"
Received: from 153-97-176-62.vm.c.fraunhofer.de (HELO
 mobile.exch.fraunhofer.de) ([153.97.176.62])
 by mail-mtaKA28.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 22:36:10 +0200
Received: from XCH-HYBRID-01.ads.fraunhofer.de (10.225.8.57) by
 XCH-HYBRID-02.ads.fraunhofer.de (10.225.8.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Thu, 7 Oct 2021 22:36:08 +0200
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (10.225.8.37) by
 XCH-HYBRID-01.ads.fraunhofer.de (10.225.8.57) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.15
 via Frontend Transport; Thu, 7 Oct 2021 22:36:08 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUSItXsE4dMM7pdOuUCj6Ik2ZvU3XY1mO0DT1J64h3MJyhPWu/i6dG7nXnRr7ZMCslulwPKOnOup1/d+kV9IGO7FiSnvTYh/AbdwZT9Cy+i40V2rC9sE1aSjt9MT7nhPPJgINQJkr5U6OJlrN8BYEx9ERfS4PEuuJrZSCoXpPlCd431ufTD/2idCtKZvGHcWbX283PnA11enkt6JcpRYgbazSRwg/+giXG5m1wF6MIz9xFMj0X4rcGG/+w1S1yBLLONVniMV0sJ5uWhlTIkdoeaQmqaRwq2fQuuu7g8CdrxzZe4Q8sDH3q6dOJr0rCfIXbiIZ4M6JXDbeVDytPq8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtLf+WoqjBVRCKBG2kaofJYArGhMsfGZArDKCBl0KDI=;
 b=fMtmhorLha/yrf1cRn44L0QApopSUsY0Ffy4lYuQaTV1BY/3EFYs+j/4Ww8TRgxU8JDsu3t+6WxK79kKcAW1IXarFj/5mspNY+gs0ckTyvRwuCo9y0++3Nufse4TD4Q2PyIR/kixkb3otK4jFk6WfQaRSCOazhLKtFcINWwxfDJ/IktBKmtgj4rwRBxoINK7RkImLZEEW+DR0nR/9bMTi/xsk4lswbmhqcKd+EW43Cc/xSXlQm45HVZwJ7YH0xxM5B0wZoSUvmMZY2rW/HYn/H30tKgGiT09zWRKHij8LFQKoLOv3CO3GKLUdwHcj8Kgnrmkn7zC7qKbiMENIRCKPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iml.fraunhofer.de; dmarc=pass action=none
 header.from=iml.fraunhofer.de; dkim=pass header.d=iml.fraunhofer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtLf+WoqjBVRCKBG2kaofJYArGhMsfGZArDKCBl0KDI=;
 b=JqPhN05x0Uhe3oxCMjQ38pHR0p5EZa8KAoDMoTEqN+tTh0iBad3WxHiwk83ItIwvV2UvX4aRCKmYhLzta3sMpXQrFoaRE2rpvBLQsMOk2LxaYxo/kANSn7aW4CnNS8h/UvJqodG7OzKWZTY5iObMdvQrlcQ3Y3IhxCJFOx8q3i0=
Received: from DB6P194MB0022.EURP194.PROD.OUTLOOK.COM (2603:10a6:4:c5::16) by
 DB7P194MB0330.EURP194.PROD.OUTLOOK.COM (2603:10a6:5:28::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.19; Thu, 7 Oct 2021 20:36:07 +0000
Received: from DB6P194MB0022.EURP194.PROD.OUTLOOK.COM
 ([fe80::45a:cb7c:a65c:838a]) by DB6P194MB0022.EURP194.PROD.OUTLOOK.COM
 ([fe80::45a:cb7c:a65c:838a%3]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 20:36:07 +0000
From: "Walter, Stefan" <stefan.walter@iml.fraunhofer.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Boot process stuck at "GRUB loading.." since 2021.02.1
Thread-Index: Ade7uZXHP7nGx63eQL+BAdw+WW1TNQ==
Date: Thu, 7 Oct 2021 20:36:07 +0000
Message-ID: <DB6P194MB00220117F126EF57A84FB509B7B19@DB6P194MB0022.EURP194.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none
 header.from=iml.fraunhofer.de;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dea6882b-98a8-4f64-bd58-08d989d2171e
x-ms-traffictypediagnostic: DB7P194MB0330:
x-microsoft-antispam-prvs: <DB7P194MB0330283F322293FD3C86CA32B7B19@DB7P194MB0330.EURP194.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FDTMjMxUWoiCxGVO2ry6RO0sDaajfV6KkvQurCPZDVOb6WwUjxWYgP6REhC6M3Ro5lIgcCc9Jf0GaAp3anAmZ+sNWDWhnfCw5LSaWTFqmOHF+rDotVtBsa+HtzJLbEjPkDFqRnNleBBj8gEeeje624Svr84zXYoLGV4R97TiYcB5tW1StVgxswYCqLJeov+tHB/2fX6xQAP6Ic9QJSwp6UghTlTSXeEtDZji7FYdxBmSKfaK+7OzbAehTXoIeYrl7SS+bDi94sLG1mevWsK6+tNwsXolMA2hDmQ3hiZ9zQwIdT/+waY1BXD6jYOeKHixS5opO2eSeWm8yz8st4MgBrFa+OrFrDwUQruvwrM0OrcHfV30xgHNxDqw3q6JrnhQtIbwcGqxScC/EJBgeg6/bx2WtcokgW24E6eciJG/Md4UPfcZ+JOPoRepelQIECbq25BZismFmrXnR/n8UuSqNEDnoSSDy/iCnguWK0IipekcElwVAh+lwMnKYfNI7a/ZuPjGR/cjLLnXxI2rgicZzTxqVfjHYNxN89VncXag6jfleyfYSOINo0tqt4VVG7EtEysPK3gkJaeD5w9swYtFsAXDfXyg4qRINDOaA8egE7rhXqExLQLcGBt5NpIRDxsd9v3z3+PMi4p7NzEYp1FCP1I8mSEZB2UNmAOylku+h5BsvkWtvp/fIvol6alCBiqjNMDxbGmsuL/enrtRbHoM7A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6P194MB0022.EURP194.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66946007)(8936002)(508600001)(8676002)(55016002)(76116006)(186003)(6506007)(9686003)(5660300002)(66556008)(52536014)(64756008)(38100700002)(122000001)(66446008)(2906002)(86362001)(38070700005)(316002)(33656002)(99936003)(71200400001)(6916009)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bGwfBtKNC0C60+l3fiActVkteA3iiklsCmwhR13DMrLOzWBqHMHh4ZCcSp8o?=
 =?us-ascii?Q?Hf9bRWro/46zRKrjueFXVHLwbfbjnWpFDBX7toWRgMMc3hWmcBg/7y96OTKu?=
 =?us-ascii?Q?AbVEXVypGuehjxEdQ5gZSgZysh0R1+aoDjUjdFOxAi2Z6BZh0KPKr4tR8eN3?=
 =?us-ascii?Q?udCoxCwAToKkPL1l/bFrzoueXAleniMHrbpqpmsfnz33Dx9gKfzcn56xemYn?=
 =?us-ascii?Q?5t68jhlCCSTy/nr0idDHhHFRwVUs2l3piWD6X8bQkb/UF0GpnJ2Hup0YK4ei?=
 =?us-ascii?Q?25S1u4PXGhsAMfECeF0bfZjPUqS3PJXlExaepsw5ZkAAsDO5UFZFrj1qSCRV?=
 =?us-ascii?Q?NIIlSYcc0t51cc9B0/45deXrIXB8jSttrZ1O6LbWntk5k9GSHKZngNdhBZwa?=
 =?us-ascii?Q?NL0stwQHx14LByl4m6FVIjYaq6UEqrFKrOROM/7rPxjsj6oUFn/XNqoF7wuv?=
 =?us-ascii?Q?tYXTa0ODDR+GJfMjViVxaevA7YYukg3SKj7KyoJvViLQKUIdgTC2v9yMz7ky?=
 =?us-ascii?Q?Js0H190xzR1rmyThFkziOn+U4PXCqf0Ooumx9QchDlhQsk196YdGK/yNCc67?=
 =?us-ascii?Q?lwLdmBVgRB8ipELG6S0b1u8qunDWf8fmcRBb6BhcxzNRapjroxjzJn2tn6ZZ?=
 =?us-ascii?Q?S9epOr6Rn8D3WMzwwdQ1aF+Ub6xTfBTOtQGxjyOXG2O1936cvlMa0aaetsPu?=
 =?us-ascii?Q?V3s0I6uuMea+MjhfczyzUs0GkeXXbkumCGI9AzsMv4OSsOHwPXeODBDINdrK?=
 =?us-ascii?Q?o+TseGSzgeUxmEtVJdCuURhkfEF/l8cq1yFyQ5loHgekgWEEhcRilTkhIC9w?=
 =?us-ascii?Q?g7lFikytqKB0jTG4gKIiLh9sJt3ylzx9//U89zDSOHTR+nAVgMkTsOR0gWuQ?=
 =?us-ascii?Q?wTC/nMILTwpIegOzI6G3JnICyFAVD/Zh94IgaapG6lnn7kwApgc9VUv7tHNm?=
 =?us-ascii?Q?BHaepzemybVwnIE7BfTPvRTFRZvVQk2c0wS2Nx6lvapI/IN4oQM6R6cwIQq3?=
 =?us-ascii?Q?7zlwvix1uXrb+nFX5nSDVOd95xwodxWQnzDGM9tH9XJrncS6sNGcvaj5+jEo?=
 =?us-ascii?Q?f5qyLiIX3EDIU8pIX/8p6M7J1eDDxvJjHI0MUtGwMlol3tsPlPelO+inEG4e?=
 =?us-ascii?Q?3wbltJt2D4pWm2wVk6rsUNJYZDoZkFrlcHznSc+AipSQetEym0dEgMU9OD3l?=
 =?us-ascii?Q?mvAl2X2nZCDch9vuUKbPy2F7XhdY3mtK683FQWHC37/o2mEdx4y89/WfY/Cd?=
 =?us-ascii?Q?H7RE0H1ZNusEes/zu9a00T0fNseRnSyNW38spdH7wATtBC26Goa3CgZ1WpzJ?=
 =?us-ascii?Q?592yGho1tqJhI98CqZgpRudmBYSngnSnTC7QA6FpJByO/QgYx9Pfdw0BvJVT?=
 =?us-ascii?Q?fVmfDh8ANzD++PnreE+3/Y5J/yQ4?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_004_DB6P194MB00220117F126EF57A84FB509B7B19DB6P194MB0022EURP_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P194MB0022.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dea6882b-98a8-4f64-bd58-08d989d2171e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2021 20:36:07.1854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+jQi3oDWlTKg5AYH7ZhqoIx+350BLdkC1RbZp1sTvoj7LmkTe+xbbTYh3PuPi4R050QtE83wCqYmYJ7ymJqvMf8RNrDHZnHPywGebOtO2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P194MB0330
X-OriginatorOrg: iml.fraunhofer.de
X-cloud-security-sender: stefan.walter@iml.fraunhofer.de
X-cloud-security-recipient: buildroot@buildroot.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay81-hz1.antispameurope.com with 807CE8217CA
X-cloud-security-connect: mail-mtaka28.fraunhofer.de[153.96.1.28], TLS=1,
 IP=153.96.1.28
X-cloud-security-Digest: ffdfdd2c747c8678544da8eb57ec14c7
X-cloud-security: scantime:1.546
Subject: [Buildroot] Boot process stuck at "GRUB loading.." since 2021.02.1
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--_004_DB6P194MB00220117F126EF57A84FB509B7B19DB6P194MB0022EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

the following used to work until Buildroot 2021.02, i.e. the resulting imag=
e booted normally. Ever since Buildroot 2021.02.1 and up until 2021.02.5, t=
he resulting image does not boot any more - the boot process either gets st=
uck right after displaying "GRUB loading..", or it reboots at that point, l=
eading to an infinite boot loop.

What I'm doing:

1. Run Buildroot to create a root partition image (my_defconfig attached).
2. Create a GRUB image like this (grub_early.cfg attached):

/path/to/buildroot-sdk/host/bin/grub-mkimage --config=3Dgrub_early.cfg --di=
rectory=3D/path/to/buildroot-sdk/host/lib/grub/i386-pc -o ./genimage_input_=
tmp/grub_core.img --format=3Di386-pc --prefix=3D=3D/boot/grub biosdisk part=
_msdos ext2 normal linux configfile

3. Create a home partition image like this:

MKE2FS_CONFIG=3D/path/to/buildroot-sdk/host/etc/mke2fs.conf /path/to/buildr=
oot-sdk/host/sbin/mke2fs -d home_partition_prep/home -j -L home -t ext3 -U =
random -b 4096 ./genimage_input_tmp/home.ext3 25M

4. Create a disk image like this (genimage.cfg attached):

/path/to/buildroot-sdk/host/bin/genimage --loglevel=3D1 --config=3Dgenimage=
.cfg --inputpath=3D./genimage_input_tmp --outputpath=3Dimages --rootpath=3D=
home_partition_prep --tmppath=3D./genimage_tmp --tune2fs=3D/path/to/buildro=
ot-sdk/host/usr/sbin/tune2fs --e2fsck=3D/path/to/buildroot-sdk/host/usr/sbi=
n/e2fsck

Does anyone have any idea what's going wrong here since 2021.02.1?

Best regards,
Stefan

--_004_DB6P194MB00220117F126EF57A84FB509B7B19DB6P194MB0022EURP_
Content-Type: application/octet-stream; name="genimage.cfg"
Content-Description: genimage.cfg
Content-Disposition: attachment; filename="genimage.cfg"; size=537;
	creation-date="Thu, 07 Oct 2021 20:29:00 GMT";
	modification-date="Thu, 07 Oct 2021 20:29:00 GMT"
Content-Transfer-Encoding: base64

aW1hZ2UgY29tcGFjdGZsYXNoLmltZyB7CiAgaGRpbWFnZSB7CiAgICBhbGlnbiA9IDUxMgogICAg
cGFydGl0aW9uLXRhYmxlID0gdHJ1ZQogIH0KCiAgcGFydGl0aW9uIGJvb3QgewogICAgaW4tcGFy
dGl0aW9uLXRhYmxlID0gZmFsc2UKICAgIGltYWdlID0gImdydWJfYm9vdC5pbWciCiAgICBvZmZz
ZXQgPSAwCiAgICBzaXplID0gNTEyCiAgfQoKICBwYXJ0aXRpb24gZ3J1YiB7CiAgICBpbi1wYXJ0
aXRpb24tdGFibGUgPSBmYWxzZQogICAgaW1hZ2UgPSAiZ3J1Yl9jb3JlLmltZyIKICAgIG9mZnNl
dCA9IDUxMgogICAgI3NpemUgPQogIH0KCiAgcGFydGl0aW9uIHJvb3QgewogICAgcGFydGl0aW9u
LXR5cGUgPSAweDgzCiAgICBib290YWJsZSA9IHRydWUKICAgICMgQW4gZXhpc3RpbmcgaW1hZ2Ug
b2YgdGhlIHBhcnRpdGlvbidzIGZpbGUgc3lzdGVtLgogICAgaW1hZ2UgPSAicm9vdGZzLmV4dDIi
CiAgfQoKICBwYXJ0aXRpb24gaG9tZSB7CiAgICBwYXJ0aXRpb24tdHlwZSA9IDB4ODMKICAgIGlt
YWdlID0gImhvbWUuZXh0MyIKICB9Cn0K

--_004_DB6P194MB00220117F126EF57A84FB509B7B19DB6P194MB0022EURP_
Content-Type: application/octet-stream; name="grub_early.cfg"
Content-Description: grub_early.cfg
Content-Disposition: attachment; filename="grub_early.cfg"; size=49;
	creation-date="Thu, 07 Oct 2021 20:29:00 GMT";
	modification-date="Thu, 07 Oct 2021 20:29:00 GMT"
Content-Transfer-Encoding: base64

c2V0IHJvb3Q9aGQwLG1zZG9zMQpzZXQgcHJlZml4PSgkcm9vdCkvYm9vdC9ncnViCg==

--_004_DB6P194MB00220117F126EF57A84FB509B7B19DB6P194MB0022EURP_
Content-Type: application/octet-stream; name="my_defconfig"
Content-Description: my_defconfig
Content-Disposition: attachment; filename="my_defconfig"; size=1196;
	creation-date="Thu, 07 Oct 2021 20:27:48 GMT";
	modification-date="Thu, 07 Oct 2021 20:27:48 GMT"
Content-Transfer-Encoding: base64

QlIyX0RMX0RJUj0iJChIT01FKS8uYnVpbGRyb290LWRvd25sb2FkcyIKQlIyX0NDQUNIRT15CkJS
Ml9PUFRJTUlaRV8yPXkKQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfR0xJQkM9eQpCUjJfS0VSTkVM
X0hFQURFUlNfNF8xOT15CkJSMl9UT09MQ0hBSU5fQlVJTERST09UX0NYWD15CkJSMl9HQ0NfRU5B
QkxFX0xUTz15CkJSMl9JTklUX1NZU1Y9eQpCUjJfUk9PVEZTX0RFVklDRV9DUkVBVElPTl9EWU5B
TUlDX0VVREVWPXkKQlIyX1NZU1RFTV9CSU5fU0hfQkFTSD15CiMgQlIyX1RBUkdFVF9HRU5FUklD
X1JFTU9VTlRfUk9PVEZTX1JXIGlzIG5vdCBzZXQKQlIyX0xJTlVYX0tFUk5FTD15CkJSMl9MSU5V
WF9LRVJORUxfTEFURVNUX0NJUF9WRVJTSU9OPXkKQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9E
RUZBVUxUX0NPTkZJRz15CkJSMl9MSU5VWF9LRVJORUxfSU5TVEFMTF9UQVJHRVQ9eQpCUjJfTElO
VVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15CiMgQlIyX1BBQ0tBR0VfQlVTWUJPWCBpcyBu
b3Qgc2V0CkJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFPXkKQlIyX1BBQ0tBR0VfTElOVVhfRklS
TVdBUkVfUlRMXzgxWFg9eQpCUjJfUEFDS0FHRV9CSU5EPXkKIyBCUjJfUEFDS0FHRV9JRlVQRE9X
Tl9TQ1JJUFRTIGlzIG5vdCBzZXQKIyBCUjJfUEFDS0FHRV9VUkFORE9NX1NDUklQVFMgaXMgbm90
IHNldApCUjJfUEFDS0FHRV9LTU9EX1RPT0xTPXkKQlIyX1BBQ0tBR0VfVVRJTF9MSU5VWF9MSUJV
VUlEPXkKQlIyX1BBQ0tBR0VfVVRJTF9MSU5VWF9MQVNUPXkKQlIyX1BBQ0tBR0VfVVRJTF9MSU5V
WF9MT0dJTj15CkJSMl9QQUNLQUdFX1VUSUxfTElOVVhfUlVOVVNFUj15CkJSMl9QQUNLQUdFX1VU
SUxfTElOVVhfU1U9eQpCUjJfUEFDS0FHRV9VVElMX0xJTlVYX1NVTE9HSU49eQpCUjJfVEFSR0VU
X1JPT1RGU19FWFQyPXkKQlIyX1RBUkdFVF9ST09URlNfRVhUMl8zPXkKQlIyX1RBUkdFVF9ST09U
RlNfRVhUMl9TSVpFPSI1MDBNIgpCUjJfVEFSR0VUX0dSVUIyPXkKQlIyX1BBQ0tBR0VfSE9TVF9F
MlRPT0xTPXkKQlIyX1BBQ0tBR0VfSE9TVF9HRU5FWFQyRlM9eQpCUjJfUEFDS0FHRV9IT1NUX0dF
TklNQUdFPXkKQlIyX1BBQ0tBR0VfSE9TVF9HRU5QQVJUPXkKQlIyX1BBQ0tBR0VfSE9TVF9HUFRG
RElTSz15CkJSMl9QQUNLQUdFX0hPU1RfTVREPXkKQlIyX1BBQ0tBR0VfSE9TVF9QQVJURUQ9eQo=

--_004_DB6P194MB00220117F126EF57A84FB509B7B19DB6P194MB0022EURP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--_004_DB6P194MB00220117F126EF57A84FB509B7B19DB6P194MB0022EURP_--
