Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE60DC432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 06:32:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ACDD60F56
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 06:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2ACDD60F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ginzinger.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07DB660A57;
	Tue, 31 Aug 2021 06:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7VMfb4RGiZJm; Tue, 31 Aug 2021 06:32:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C7D460B9C;
	Tue, 31 Aug 2021 06:32:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 381B71BF377
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 06:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27B3F81D4D
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 06:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YmeU0mQGdIS7 for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 06:32:02 +0000 (UTC)
X-Greylist: delayed 00:07:20 by SQLgrey-1.8.0
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29FD781CA3
 for <buildroot@busybox.net>; Tue, 31 Aug 2021 06:32:02 +0000 (UTC)
Received: from mail-he1eur01lp2053.outbound.protection.outlook.com
 ([104.47.0.53]:21590 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps
 (TLSv1.2:AES256-GCM-SHA384:256) (Exim 4.82_1-5b7a7c0-XX)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1mKxCA-0004W8-2h
 for buildroot@busybox.net; Tue, 31 Aug 2021 08:24:31 +0200
Received: from AS8P251CA0005.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::10)
 by DBAPR06MB7077.eurprd06.prod.outlook.com (2603:10a6:10:1a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 31 Aug
 2021 06:24:29 +0000
Received: from VI1EUR05FT018.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::bc) by AS8P251CA0005.outlook.office365.com
 (2603:10a6:20b:2f2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Tue, 31 Aug 2021 06:24:29 +0000
X-CTCH-RefID: str=0001.0A782F26.612DCB1F.0018, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=ginzinger.com; busybox.net; dkim=none (message not signed)
 header.d=none;busybox.net; dmarc=bestguesspass action=none
 header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 13.81.10.179 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 VI1EUR05FT018.mail.protection.outlook.com (10.233.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 06:24:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.104)
 by westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Tue, 31 Aug 2021 06:24:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jT+maaCO9iIxUIecHbHi3i8YNIIzSD6jVDCxb0z6HKSXjHbjjEzRUMMQ1fShebqSljP8Q7nrlw0EdRjeGU4uGpQ1BHGLekXlgwLdbe1hitEnTnJ1LKlfq+XfoUJQOd9K7YxJCAiWoncT2WAtERJhZGT3gjhneBwOKbD6loc2I8WjXYv3BlhWqKJSGM6XuPPthFDYaoUp9rLBnH6e4LkHYM4o1rEhjwMYIWw56N6qxBEKTcg/+XjCU0iKmR3OK73ilITR+6vMJ2IcH/jWyxceHotVZXmdZ6VZdivXLUY4r8mZTrF7Im6B+W1poU2aM/NAys/0956Xmw/ji+lrDOwUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Zn3U/1ssR4C9k2rdTPmUkLY0xMGrSfwVdhSGt+CuzM=;
 b=Qj1IdaHFKObMX92Arx4afuXkzruogUFbORaVedX5z8TOrzsrnxLU5dDJnsMXc2Us4zkmZLzyoFAPk2CfiHg2jjZZaF6W7urz4tpcdJBvUk59Tb7lbtucQpsMoFyM/XEB6RF0tJadlCJSMtOQ/XXnIAjlpqpD7Iu66C+MU3Q+2ebi+lCDz589FxNUSM8W6WG5YXCTyJNbanSQCcBxD+vjDZBueFUgWkRpwSA8pCAFT0dRErU0urH9jFyYNFhlnxquwDYVE8JbJR+O2Arm6NsiaLXrfsd757f3XIa6BoCUdlDEH7CJxxzb6Nzb5rgY63O6KfjlNI4r2LzsQg6SW8kJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by AS8PR06MB7223.eurprd06.prod.outlook.com (2603:10a6:20b:254::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 06:24:25 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::479:c79a:74df:fc63]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::479:c79a:74df:fc63%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 06:24:25 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: "buildroot@busybox.net" <buildroot@busybox.net>
Thread-Topic: [Buildroot] Tensorflow-lite as package?
Thread-Index: AQHXnjBymJPBZ2V7x0OzeqjWPl0vsw==
Date: Tue, 31 Aug 2021 06:24:25 +0000
Message-ID: <AM5PR06MB315372DC33325D77D69C6E1984CC9@AM5PR06MB3153.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: busybox.net; dkim=none (message not signed)
 header.d=none;busybox.net; dmarc=none action=none header.from=ginzinger.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 03cdf018-47c6-4730-0d89-08d96c47fc3d
x-ms-traffictypediagnostic: AS8PR06MB7223:|DBAPR06MB7077:
X-Microsoft-Antispam-PRVS: <DBAPR06MB7077513E0C6685F77F6850A784CC9@DBAPR06MB7077.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: oBc6MQP9nDxTvWCkQwgSYfTnYLZT/+DKxmkOaHG6rnpgHP8vm+FChmVHmwSDnw4J5jStMIumxX8HQ+oM7/yp+EloTxqlVlatzCqOPdg+rIqrqKcgEG7FNfJ9PmCI5P4eYBSl5yHkSIxt8L/rd1XysUxrgaGVxkZ7iEE9veocClW2u+XGHxhwnnwu1dzdbJU7K3UlTEKTVeUlffFOfQ9qXsHQDYm6W3LeyPbTeBwbk4SNvelI/8Q22IvFtS0GNEkwrIzHMOeprH1rpiQNyJKv+rWhBVwCrETmz6EVIb2AqdCe4CJ/ZKXIoS5iZmONk629JHCH8HzlzwJYdUwHCBqRzsyHJLKaOKphAZHUEADhYDnWv41F32lkG8NqRc7jIfDfDaNmQRk/NIfVlH12ZyPXL2tP5EXWN5ditg+4wzVrNTyvjjUlOPJZDZ6cs4zAXyL7usoavAqgpAb4qoUjQAKeERQ4pBPZ2hOP8GNQCShDrW2hk0uRfv6tl4ciLRo+XMwhnjFcX9dPMDtZnJ6USbytDW9wF+Z32vUwXrqvveUK/mgBJ/2Cjf2l6OXwKy6eRDWQBqFmRl4e3IUDlmORnJCrFbxBCXd0j/svIY0l84clDdYn5diT/s/zoW9U2mV0hKA2B0B4Uo+E6tny7VRMolKVXTpch/zINfvbqp/g3TNyM3Pw2mrnOMxs7Sql6NJqz+hohGQB3q1ZKzl69M5sGbQTiw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39840400004)(136003)(376002)(7696005)(6506007)(66946007)(558084003)(76116006)(66556008)(8936002)(2906002)(186003)(38070700005)(71200400001)(8676002)(86362001)(9686003)(55016002)(6916009)(38100700002)(478600001)(64756008)(66476007)(52536014)(26005)(122000001)(91956017)(66446008)(5660300002)(316002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7223
X-CodeTwo-MessageID: e62d3c92-e317-4019-b8e0-2beb33103e45.20210831062426@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: <b1013791-e98d-4543-acea-65fd9ce8d248.c516e98e-fc1c-4197-847c-feec798fb1a1.a28525cc-33b9-43ed-b9bc-c35c32acecd8@emailsignatures365.codetwo.com>
 <b1013791-e98d-4543-acea-65fd9ce8d248.67bdf025-9d7d-48dd-b0d0-cdaaec3cf4a9.4573a150-d1eb-4ea2-ad89-03a806cffdff@emailsignatures365.codetwo.com>
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR05FT018.eop-eur05.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ed8c0d3e-c838-41a7-61fb-08d96c47faba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lBStXRIgebVahgHIZIIBJEpAU/1RXeNcM9A5fXXsJ7T74fox7CMHsMalLzEgLVL8ATZPpQqgVH94FTXIB8Fq5cWFCen+v8BnM/1gvh+OslGu9vaRRy8EdY1Ah0IueKRxTWKobKjGBDKjQq4iMYeYy0ViLajwvO1lsIOYPDljsg2Qaw7rR9UU88cepTC6aCBTY8PCcBYpN/flD6FF0JFeGuUVTvAujduA9w10RvvMMWG/q7vRMA4vABzIH65axEv3KaYhJjUxsuOEcCHYtCEUJL81+4CWWPNxoinf9DEFYERu0djCP+5d1Ro319Z7oqR2nmz4jgrr9fCXHd9EdKDvutDDpuKRTla1BDXO7wcFrIZ2Frqu7hrL4E4CvwxseQx4os6Qsb60n1JA6lYI5Ofqb6LtJCJlS31WXfM20DI9byHTNRIl6aKJhFoIj7Qjv5HBZIgPEyYW0AI3AiZ7rAQIxs8R+fqyyXdl+AoDPTw2/QCpV8KkxhULGrb2Zb/5YGYabkVgpP0VrujSL3O1l1r/AO2rgwChSRsH09YOvsN3v5xGWbAJDMUpLwzIKpeBg89NAzmolAo8JjXjrZ46ptpNfwVc/UYVZwujkW1NuprHVZr5XCpGtkbH6Y1i44j3azyvWgCo93mEr0qTCFil45FJDimyt+loTBkn62anb1A0shDBFygQJ1h0BcRYB0yQbPC6ADgioPjJaErHTxQkxcoj4+cFsDEhS4CCBbvUUM72FX5b1ke/MCXJ2b80ffRM1XyUKY9k1frZBv1k2qoQ/5RiTLag0kIEM7NDuhZJ4opzsdk=
X-Forefront-Antispam-Report: CIP:13.81.10.179; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu13-emailsignatures-cloud.codetwo.com;
 PTR:westeu13-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39840400004)(136003)(376002)(46966006)(36840700001)(15974865002)(7696005)(86362001)(6506007)(36860700001)(33656002)(52536014)(5660300002)(9686003)(70586007)(55016002)(70206006)(26005)(316002)(186003)(8936002)(336012)(82310400003)(47076005)(83380400001)(8676002)(478600001)(2906002)(356005)(7636003)(6916009)(7596003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 06:24:27.9413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03cdf018-47c6-4730-0d89-08d96c47fc3d
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[13.81.10.179];
 Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR05FT018.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7077
Subject: [Buildroot] Tensorflow-lite as package?
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

I am wondering why tensorflow-lite is currently not available in buildroot as a package.
Is there any technical reason for that? 

May it be beneficial having TF-lite as package in buildroot
or should other solutions be considered if one wants to use this library?

Best regards,
Stefan Hager
-- 

Stefan Hager | Entwicklung Software

GINZINGER ELECTRONIC SYSTEMS GMBH

Tel.: +43 7723 5422 158

Mail: Stefan.Hager@ginzinger.com
Web: www.ginzinger.com


___________________________________________


Ginzinger electronic systems GmbH
Gewerbegebiet Pirath 16
4952 Weng im Innkreis
www.ginzinger.com

Firmenbuchnummer: FN 364958d
Firmenbuchgericht: Ried im Innkreis
UID-Nr.: ATU66521089


Diese Nachricht ist vertraulich und darf nicht an andere Personen weitergegeben oder von diesen verwendet werden. Verstaendigen Sie uns, wenn Sie irrtuemlich eine Mitteilung empfangen haben.

This message is confidential. It may not be disclosed to, or used by, anyone other than the addressee. If you receive this message by mistake, please advise the sender.

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
