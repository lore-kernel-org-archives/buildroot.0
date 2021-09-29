Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA50C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 09:59:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48887613A5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 09:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48887613A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gallagher.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D671240012;
	Wed, 29 Sep 2021 09:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psBDkXFYgcVc; Wed, 29 Sep 2021 09:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB9BD403B7;
	Wed, 29 Sep 2021 09:59:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC4971BF23F
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 09:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB39140683
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 09:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gallagher.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igk6UEJNvbfe for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 09:59:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01on2094.outbound.protection.outlook.com [40.107.107.94])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D705E404E8
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 09:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnCguKHx8zNRXUm0qzGjueN4D3JSCQtk2G/FrxERVcKUcHaUOHVqH/HUmimgXwyvtK025Z8FwEpHWILcljnGsckmy8Fxzf8QCTGKkr5VzIcedLyp/tHw3FsTd0tIDYaWqwn5xrbRr5jlilshZGVHwNuQLIcevz4acg/uQEt4la++Gkqxpvx0z6hzhQgcp/ShcCdPFeTrnpKKeLUMeGWGhVKd7vrSSV/nPjtCqe1yIzYFQunNRiBVC2T9OAtyc8RUbIkQZpOXVlkz3Ik2AWdLdeBsj20PehVC8IWmPNprqp1m5St7a4jHFhqWowC5+KgnRv70Aezt2FaoZr69qzFNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=jhgUW72IoHKoIarCaHsL0VypBPW+pb9lbWatBNh0XA8=;
 b=PchRwgHDdrnSWffRybTcFLtUc9K3Za87fdBSaZ49Nhhfp1fGT0zhyf1UolU5f5oMl0l7lkpSFWYqXPM3v7AwKXb3+hz8SePFz5v2xQNz4jT+ckEUshOtKX0Ub9fikDV2v0NLar1WJgB2oPS4vZQaqi1MrJuwn/W0obP1OtXqYi2WjqyjvuNdRdMNRdhLvwuzg1069AGXIzBanqOeSYRG1lU8hLvKZVkj0gNW0Gk+uTsuRDZkvZ0pMjH+bxhG9VbIIHZDWdLW0QVflzm90mixv3p6GZvoGs3J78IiQksouOJMj029Y0m4faD73+4xGOFKtcK6z6KgPJVLRRJtchwV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhgUW72IoHKoIarCaHsL0VypBPW+pb9lbWatBNh0XA8=;
 b=E59zqDQwFMwcgvy+WV3F+4Qpv67MW+Gu1V8xGG2d5e5vkMj05n7EBar8r3B4shj+rBVHT7ZbhvbjM7u97kWX54waHpv0P30G8Lhnehi87qRmCcB/LcnqW7pKx8pl4C+QdBLAaqzrxtMkSDYfRRt7nfui+G2W4v0up5dgAsPUhxw=
Received: from SYBPR01MB4811.ausprd01.prod.outlook.com (2603:10c6:10:5c::19)
 by SY3PR01MB1340.ausprd01.prod.outlook.com (2603:10c6:0:13::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 09:59:11 +0000
Received: from SYBPR01MB4811.ausprd01.prod.outlook.com
 ([fe80::e5f2:7efe:c878:446b]) by SYBPR01MB4811.ausprd01.prod.outlook.com
 ([fe80::e5f2:7efe:c878:446b%5]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 09:59:11 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: buildroot <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/1] package/syslog-ng: add -fPIC to build flags
Thread-Index: Ade1F/tH/4HpYY8FTBaTM41ZfM+k1g==
Date: Wed, 29 Sep 2021 09:59:10 +0000
Message-ID: <SYBPR01MB4811E03F49061BD581749D76E5A99@SYBPR01MB4811.ausprd01.prod.outlook.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none
 header.from=gallagher.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d317cda4-7705-4631-2dca-08d9832fc921
x-ms-traffictypediagnostic: SY3PR01MB1340:
x-microsoft-antispam-prvs: <SY3PR01MB1340492C4F0D5F04CAAAED75E5A99@SY3PR01MB1340.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1VlKKqpXWqtROjFFsmQ0u5EgzYSE5hK/qlmGMEHUxMd7ltY2BWTnhHaHOYLp9XVLyv5S+Ti+E+1rCLkqpcQ8hw1XN61FAIJngjVOhSTaouD4g8mKbWVXw1MRWAwQzTdxBHZz7fpZTfKzrsqL5e4JCm1xEJ0nAjTNpB0plt/h3bIlteB1Aq+g3fYVUcFxxvoIFZEWyPIoHVH/Fj6l7l+1l5A1fZvdkHia3K1dDPqIQ9OYXCHBY8juPzMzBBq91rKru/0MGskVg3GE1rTYIlGmjlYYy6VN2vbqDZYyWDKvwsfEfFn/4fGiH3FFQ5LVAaruPUuTuCYnK3qPExnl34gyxNj9UXUddxe2XE3uf4P+xEMJoWuxzk6YyqDEQcFODI8/ZgUrg4H3R1CGg8Qs7lHbxoggjuE9aSCGhjftVaxi5posOWQn16GQg2aqxNpej/6k8l2AEc9TA1z93greiDV1fLCZPqjTKMgLxiLw8gWqgq+LbZ5UHjrxP7cLBIC2C15utninIGIFmK42T3aYCiyEuOmX0IT9a2OmOd/CFA6JWrn8z7cnXvgnSdH3MdHk2OULTEm88v9L9KUQvGdnGeuG5bKiwlc+0GoZ1K11JPVm5YiboDLrMx1YpiLd2pw9yqYIkwJFEPXPtkHaD3BkbTV9/I49qxkObDEA704CITav1j1hi7CnPv22Pf0ciHWzOzwzwWBdmqHdEo0iGd7dYhGwpg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SYBPR01MB4811.ausprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52536014)(83380400001)(76116006)(7696005)(8676002)(71200400001)(38100700002)(4326008)(33656002)(55016002)(122000001)(9686003)(6916009)(6506007)(66946007)(186003)(508600001)(8936002)(38070700005)(26005)(316002)(86362001)(66476007)(66556008)(64756008)(66446008)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bCjzLdTo8MvMN+aYBNv54HFeATKmEVwWPgufv6onMdEp0AoLq+bek4Hgf4Qx?=
 =?us-ascii?Q?VWeEpVCZyenukKoyhAE3qNVzEMqQ1E+b9nVHU+dJK/okSzz4k2bVZ/CvYrTw?=
 =?us-ascii?Q?gZxlYEI6IPtJgoA6C1n6Rz2YYt5b7dG7QLWZN1IAsdqsGPm+GWN2wGzTSbjh?=
 =?us-ascii?Q?6ELrjJanz1nqOe1fY3ncqgQxw05Yc5rUSVCkvnlazOEGJ8ZwQjP/04jilfCW?=
 =?us-ascii?Q?8tv1gLvbKB1STzOvwvb5viiPhc8kAAUf5VH16GRwQz5a1CfVHG4PQmXg1qqL?=
 =?us-ascii?Q?iGwmsXOVpAO4H76mS9hkPD1LdbxozIcTXfJ3/XwHg0jiNwCHX7y5YN7bsFsy?=
 =?us-ascii?Q?0p/U7W3NRivDpADtjal15b6MzYavuGougwuFThigb78LkCzvFcrI2RDXcDgm?=
 =?us-ascii?Q?uyVQhyJbMK5fjiMn8NwaAeiWrvbSQN70tqlu06EIYNSGiB5QB0vJdPUw1PAc?=
 =?us-ascii?Q?Cvwo3Tp35mM0bydgJ6+GEnf48GaQe4TJdVpo5P5An64O7vCdNhtS7GB74Qq2?=
 =?us-ascii?Q?rW4nEQqozqwko8hSe3kmmz7I4kwQyRRUUAwRjn5OhK8fftyGj+JYmjytvoHL?=
 =?us-ascii?Q?3nVZhYrbTSSjFJ1NEek2oq6tV3LSx17K3nI/WotPrQ6tnSglB0sqW4TgC6ET?=
 =?us-ascii?Q?pcG0vMoNLY+dEXUzT2jhyghQwtjmlK6c9aG/SW3rG0ls0juZ3oQOZIZDFP09?=
 =?us-ascii?Q?Cxn1GUGMCXKMDHVdVD+CKhrM8rrUi0hMvbkCI10alljdE2DXQUajtA6vInms?=
 =?us-ascii?Q?PSEIJu+DdJQWdTALLQloCHGSKkjcK70FnWV5kx9PcKmdHW8qA1Fb4FZUK+hX?=
 =?us-ascii?Q?CP/objXG8w1lrpYY4traFJtHe9vTpp665kdpkNebTHTSnHdi0kDuvIza/uRp?=
 =?us-ascii?Q?7Z7/p6vMmkCFZCycbsOm8RQoWcHXet5nw2ED5EW0mi49i2Qcu1UzQJZBjChq?=
 =?us-ascii?Q?w3nVE3b1KdhxNJjakp9gVgFKxmAYmj1YAB2tVjEmKpxWMQflDrnGyHBYrEAP?=
 =?us-ascii?Q?sb0fSGIQOT+ildne+F0ZzDs86O7xH6HZ7Ov9+WHtOK63N2qOwcvnHwYmWnhk?=
 =?us-ascii?Q?oWDGZ19idnw7SJEn+OLdBmyk9AeU0AduEWLECFws0ACgBcwXTIDS3SdSGjYT?=
 =?us-ascii?Q?PdV9YKJAyICc01Vc9O/xqb+0Wb6DKqbfzs4FP5L9RzdbnkwdFdmPGQje0X4u?=
 =?us-ascii?Q?PyfL8GpRYcXLxgyl54cAda52kRjQfjXDPm3aKW6uj2kDCmKBr6Pk9XrWLg+H?=
 =?us-ascii?Q?X2fyA5Rc2BwMPqA3Ja/a8pLaClqgcWGgweJpaUY8mJK0x05Y7i+/Tjjk0B6P?=
 =?us-ascii?Q?FHvmCtKnoNhi60Nnq7n16JIK?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB4811.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d317cda4-7705-4631-2dca-08d9832fc921
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 09:59:10.9612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IrnBJ4lHzs8gsl0dubbywXVa8QWxjE+N7KEq3ildIMlNtz6HBkEUAdqHg33O3tct8BiwHQ4Je6kReSVwkjVbKIncHjesFSAmuCATP77jk8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PR01MB1340
Subject: [Buildroot] [PATCH v2 1/1] package/syslog-ng: add -fPIC to build
 flags
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Otherwise build fails with following error:

/tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logthrdest/.libs/lib_libsyslog_ng_la-logthrdestdrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_threaded_dest_driver_start_workers' which may bind externally can not be used when making a shared object; recompile with -fPIC
/home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrdest/logthrdestdrv.c:1151:(.text+0x1980): dangerous relocation: unsupported relocation
collect2: error: ld returned 1 exit status
Makefile:10601: recipe for target 'lib/libsyslog-ng.la' failed
make[4]: *** [lib/libsyslog-ng.la] Error 1

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
Changes v1 -> v2:
- Shortened error log
- Always include -fPIC flag instead of conditional inclusion

 package/syslog-ng/syslog-ng.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 765e886b12..6994adbc17 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -106,6 +106,8 @@ else
 SYSLOG_NG_CONF_OPTS += --disable-afsnmp
 endif

+SYSLOG_NG_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
+
 define SYSLOG_NG_INSTALL_INIT_SYSV
        $(INSTALL) -m 0755 -D package/syslog-ng/S01syslog-ng \
                $(TARGET_DIR)/etc/init.d/S01syslog-ng
--
2.25.1

________________________________
 This email is confidential and may contain information subject to legal privilege. If you are not the intended recipient please advise us of our error by return e-mail then delete this email and any attached files. You may not copy, disclose or use the contents in any way. The views expressed in this email may not be those of Gallagher Group Ltd or subsidiary companies thereof.
________________________________
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
