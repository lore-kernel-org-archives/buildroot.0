Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588FFC433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 15:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D25DA41D09;
	Thu, 13 Oct 2022 15:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D25DA41D09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1JD-iPRIXtX; Thu, 13 Oct 2022 15:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD1941BE5;
	Thu, 13 Oct 2022 15:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACD1941BE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2ADAC1BF387
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 15:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0310E4023F
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 15:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0310E4023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id woPicCFO0HF5 for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 15:03:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE87D4010E
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE87D4010E
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 15:03:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1dYZ28v/lauDdgjmC2uk91dk1zozfXU2JUBndutLWNnwvJd+7HwTlDNNoPfC1eZQdHsWT/H0tbS9kCPBURARDBO18fDenjZKDMF3j74hFjVnQjHOfHLVVFpcIpvyhazQiNEJzrE+/lFkE5hwPNxVJsb1gIs4PZgYFYialxTeOoTlO2Rm1CSA5bsg2rUEicL9SXSa/B5YidWAEp3MfOFygHTNB8fyODojvz7BM3nsgb92ZdjWSa1BcMmsigIiBgUJpOHYRqsQQ7xcNmonr183PwSzycjYHR1xK1B0cQxKifwgMIRjT02cQ/v9j1B6kZ8nvY5qB9SAKrz+G9YZ7GGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAn1u3zJ3rrfEE2rG/nErbIrWr5fswTFuiXbRKDUCOk=;
 b=DVb3gUef6T4FgsNmZCesv4ci4r4dHzg6cCisaeIacoxIy8AWT9oq1VtnWc6iIak3OyG10p8Q3/ADo60eJqXf9v+Rx3sujIAlgJkvAfDNw1neMam5417XbRjn03oS4774A5r/G7m3By7BGmtGeI320JDyMEUPSchSN3QLDheHZMCk2I1W6bchl0KAOoWiPrb9gxpEHJcm/IaHwGfIJYtsCcDRoXhd4zJbc73Fqj+WMRnwPI6e6c3WgR9Hl1CR3p2KKPhOGwmF8xhYhFL3qN91eFG+Mnx/OJsuXxQ3Qe/WriH9esstmdpdKRgUQ0VBEVlUUBtnf6JjLY/Woe6h2B704g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0682.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:125::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 15:03:09 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::818c:f70f:e157:b158]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::818c:f70f:e157:b158%5]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 15:03:08 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/2] package/iwd: no autoreconfigure
Thread-Index: AQHY3xTBbLa0exWFOEyRk3c+tLdLSQ==
Date: Thu, 13 Oct 2022 15:03:08 +0000
Message-ID: <VI1P190MB0493D844A699B7C2DACF6FFB9F259@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0682:EE_
x-ms-office365-filtering-correlation-id: 7d2f203a-b969-4da7-b616-08daad2c0a51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YlIiSCGbIPkFWIb906gdVSpUQlQLz1fRCj7K0MazciYbEtervEh8p5EFbv1gK7eBWzgdd01J7iehWAUu1JKm69cASo+I54yIGhWV4ncTIDKxQ/xZip4jgd2VNjdRW8cGQCGyatEE6g6o2AUn7WM1AATU35FD9ro1bmLBqAXpoa8boO8oxdxn304werLP9wCGGXxX4Rns5DBjO5mVOEsin+4lsVC5+3dYlEzj+UPnHhPlWXbGsHfQG3I5GY97vq+5/VKveMQogtWOnw/74wNVU2Hsh45xjwBkBQ2ZQ7Jx44ROCrgogp3DRqGIVn72e5LWK8rEMcupwwM5GyMBUEt0fs4p7ZJN6zE2V8dkCldvTFo5Z4D8kiyMow2h1AlNrWhEXeTgZCnU7hZSn/2z7DlswmFsCHg5IR3SA0WnQ8WQmN4vMkN0cm0kjb/F4gW4PoWhKLd0vKNTbFqfTN0ZnUnFoToL2G2DkqsN10QSzgdEZX/Wv5HXDN1cOaB3y8LiHTiKs2rfzJjhmaZ67bSzvTftILulAqO/ldUiaZybUsJXF7a1FB99wJuLUfPVAr7gHzI7IzbxRvYVmpEAFOJeUfCNYpqDKRUA53+CcJ/y8F4BYv+sDSVSUVh9lBHY/HuuJM/mOAt+THHFaRs9UsUYHcUVU0wLBlQkciSsdxP9o06u8bPGc1EPUIPJdf5v5Op6K/XchjQqHUydnUqp+iSAEnfmWIyyM6s6Jc10qx2KY2oqJqiNzlcovOFs5YN3+NqsxJmWlVjVBht/9stDHiJaD7YDyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(366004)(39840400004)(451199015)(186003)(9686003)(26005)(55016003)(2906002)(122000001)(52536014)(316002)(33656002)(66446008)(6916009)(86362001)(41300700001)(66476007)(66946007)(66556008)(8936002)(8676002)(64756008)(76116006)(38100700002)(7696005)(478600001)(6506007)(71200400001)(5660300002)(38070700005)(4744005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0Ia6glgiAEb67VBRX34B9vZw2MoCBLRkYxeIeA6AtUiycXEictUCqv2m5q?=
 =?iso-8859-1?Q?jQKyyUcrrZGAeCH4k/x1WpCmg9fEi+znPKuBb/ezpPBWYkP7lRTcOsZVwo?=
 =?iso-8859-1?Q?MA0VXCtuPEUOrjQHJF3BuFPfnoh+pw4fhCK7u4j2AIVYMDL6MoTTkpHvy5?=
 =?iso-8859-1?Q?Sc1EBDNNYMGxA7yrkenFw0BTTn7PUSVoN2swE0KB6/v+zVjxRUDW6MJrl2?=
 =?iso-8859-1?Q?RZmSM3K0TPU+Cg99WQ7F7nF6IPsUpHBVyGoi8KkRNRhsrcO7KGoDfggrsn?=
 =?iso-8859-1?Q?KvnkjmqyI7LPrm7uaNoqxkE3eZIPkuz9VVJ9cOV0JiMOeUGyYl3WrEJS9w?=
 =?iso-8859-1?Q?QkXF8dzCzlfh0ctMjPn2LZOjg8PJWqO8ceIn9HGAhQ8Vs9XC3cV+4AQV+n?=
 =?iso-8859-1?Q?6SKne2DMwqV+Dernb6HMKqaf1vlVDye2b2JTAwp6aVwdDSaABFnj7Gn1c4?=
 =?iso-8859-1?Q?WNnZ+XyJHo5eHLAvhl5mBz9Ezi2RQqUFlyN32dImA4DSO1+muZ9XNhA63B?=
 =?iso-8859-1?Q?ejojCg7l2QW+rz3mRQ4UBaT13fTF1g0r7N1qtHGLOdB0JYg/fgvzqvqX+Q?=
 =?iso-8859-1?Q?6gE+7BpepnjYEmRXJw07qW6kWUMiYYj0aPUNFi4mHHuIWcqWBBwGd1pxQz?=
 =?iso-8859-1?Q?UsLVEYF7y85uNKwXxfg9EP4HuYxLyReqTz/ip3J432PBICBCFqccU40Hmi?=
 =?iso-8859-1?Q?qaeSQucG5ch16R22MzkPujY4/uR7560swLV9cLyZbo6BvaajndJiWBM0JZ?=
 =?iso-8859-1?Q?quX8v7fgDGqUX/g+GtrnsMQGhzXW85903mIY3v3oxxN3SjTHLR2CwU/vNK?=
 =?iso-8859-1?Q?og7RkdafiuTrJg3fQerSgTHCtZbYgm8TMBT9SOvwX6/EWe9fK3AIb0IapY?=
 =?iso-8859-1?Q?dCMsr+9AZ+J0m1xBOaosM/U1lF8OtDcJvs43sJDq4op5X8gwSg2G4pzlaW?=
 =?iso-8859-1?Q?x/2MfmTumX62LKwDm0YRxUuKTlWNL3ADxAOpH13RvVDxxLhuKRhegIz3M+?=
 =?iso-8859-1?Q?eJQU9sfiM/r3LBliZWOwHyuqqfS21h/adJIT8cj17BS1OTl+enuvBA2/D8?=
 =?iso-8859-1?Q?hYx1T0nziBvLTRNod78+Rf1M+z3CNGaCFzncW10i0W69n90732NHNsC9s8?=
 =?iso-8859-1?Q?ilr21lvfPm0Rv0YWP5xNoY1YYIb+H31Qph452fn8+ldYhNeGwawiEMYuC3?=
 =?iso-8859-1?Q?V+jZsRXVgUDOS6D6lTH1sYeHVVYLA7ONwpnrS8suEUex6NL+fHCkkBmjRL?=
 =?iso-8859-1?Q?FZDcLzZAQzLH0pkaOlO58C3sNjg9Vc0mRSNXFYm+BfWrcCbNH2/QWOTApX?=
 =?iso-8859-1?Q?UQSuT91QUjqcoNn5qOpw+LzxAz7wKz+0LXwylJpR9GITHkQFl5dVVtCZ8f?=
 =?iso-8859-1?Q?P96p2o6aLAWIwK6Ay3VDAMGkRS21p2oQYMeGcLyGs/DtZLImzaKVHxZsVS?=
 =?iso-8859-1?Q?HfUc43eWPpAZiuJ55USGQ7jLhSNXp1F48oTLkn8IQb8BuIEgoAHbmOY/cG?=
 =?iso-8859-1?Q?gvF2j9NN//C0THxBJjjGF3QpdNYtRCN/nos/HKe9FUlt/M5x/vOOKG0BNY?=
 =?iso-8859-1?Q?DrsCOm14VnE5KT04e1xnwxXXET54HTV/3M0jW770opCcWqcH9GAL88z/Bf?=
 =?iso-8859-1?Q?EYFph0nJwzldk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2f203a-b969-4da7-b616-08daad2c0a51
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 15:03:08.9171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BzMGjaI2w7fJr2Z5BwSw8RN1Cu9vT7KsHWhlBRdYkXKpAIb7Sn7m0w4u6OcH86rlUymGEvv+pTR3Pcle5GJ3RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0682
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAn1u3zJ3rrfEE2rG/nErbIrWr5fswTFuiXbRKDUCOk=;
 b=GmSaNPItIO6ifpSM41xc5f1hI87O/nw5vCmNxcemXuFJOvDkZNehKHtTbVtD3OMHKT/hIpKrGzWb5vHm2hT+WjJWlTMPC60MQdvqEDzKElbxFyye4at6X522hYL/Hv5VHYO/37Ap1N0aGz+oDpF6oEXzH2RVpM1CQxkV1JMvaS0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=GmSaNPIt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 2/2] package/iwd: no autoreconfigure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

configure.ac is no longer patched, autoreconfigure isn't needed.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/iwd/iwd.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 8497fd1141..fe79704641 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -12,8 +12,6 @@ IWD_LICENSE_FILES = COPYING
 IWD_CPE_ID_VENDOR = intel
 IWD_CPE_ID_PRODUCT = inet_wireless_daemon
 IWD_SELINUX_MODULES = networkmanager
-# We're patching configure.ac
-IWD_AUTORECONF = YES
 
 IWD_CONF_OPTS = \
 	--disable-manual-pages \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
