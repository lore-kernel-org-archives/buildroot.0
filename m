Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF5BC3DA62
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 18:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D411860649;
	Wed, 17 Jul 2024 18:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tdXW3pw5phV; Wed, 17 Jul 2024 18:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD4C760664
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD4C760664;
	Wed, 17 Jul 2024 18:18:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A7071BF36A
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 18:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3346440490
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 18:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJnXe5-aBW0V for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 18:18:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:240a::729;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=murali.karicheri@sandc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E0584043E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E0584043E
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::729])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E0584043E
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 18:18:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2HgpXkIAIMhWZZELd75lOUbDlKIJBh7bdwIudCUI70M+yQF1xNu4BP4qEJCpxBLjggxvAHbxhGg+0/Ix6zAf9VbYNkGTMUa6pMn8FbqlYukmRl3Kl0vUP3oqTtjM4ncQDiqbFlMqTZWe8/SSlwYf1eJTrtW1Uu3IZtm7RJipRPhifo/HaWgtuDqZroKtK+yXrA7JrpN6rBk6vZXpRbASg+qpyctBWtQpdpJEWRJCEYHvueFa8o9v4s09WGCLRHNHnDM1WFzrJgbtC0qn/IZSWL3R3ObUIIiAebD0Q+/MqxMVhuwMqk5PHbhVky+C9UU2IZNSgq/pF+Gt2dCimPGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrcqYLZTZPGFN6cd5892NkBSt7xX22H2nAWzJwr0XJI=;
 b=wMmRDb7Nn3C1BVYzAeGKxxS61iiVFG9C5XAUkucsuDjdKyzHhb2wDtHgLhHqCiHSZHvjtOYn4z2NRZb6BEzQBfIRy4Ua7hdtXhPhU9kiQ2Clvc5S0I1VMrTDv+HKd8bVnF6xu2miKWm30DU8mJnGg2SvCay5c+2XgKyGLfN0bP8ZMMR7/uyKTyOLL7mC+2qxhPdrGcz3oA4AzvDuYFfoWWREQsJvKYGH7B1nEw3tIVaf4klm6oIiG0Icx3Leb984VWUD5AXJLJDVUjOWUXxMFKaIQrnkgxHMmizKyyYg4r/CRL1Ita8lnSVlKmA/HMihDn9MvwBj3Z6+CLq/hX9voA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandc.com; dmarc=pass action=none header.from=sandc.com;
 dkim=pass header.d=sandc.com; arc=none
Received: from DM4PR02MB9216.namprd02.prod.outlook.com (2603:10b6:8:104::13)
 by LV3PR02MB10005.namprd02.prod.outlook.com (2603:10b6:408:195::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15; Wed, 17 Jul
 2024 18:18:35 +0000
Received: from DM4PR02MB9216.namprd02.prod.outlook.com
 ([fe80::8975:c8f4:ef1f:3023]) by DM4PR02MB9216.namprd02.prod.outlook.com
 ([fe80::8975:c8f4:ef1f:3023%4]) with mapi id 15.20.7784.013; Wed, 17 Jul 2024
 18:18:35 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Year 2038 time util issue - Build failure in 2024.02.x
Thread-Index: AdrYdRrLI2+dOxCgSY+eBBejGyACkQ==
Date: Wed, 17 Jul 2024 18:18:35 +0000
Message-ID: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR02MB9216:EE_|LV3PR02MB10005:EE_
x-ms-office365-filtering-correlation-id: a7c5f52a-da82-4439-8805-08dca68cdf53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?6SURxSVI0P67aYzEBDWzeHLlznExBok/QDwlBAGQX/hhxAxLjZIRqmgoKw0n?=
 =?us-ascii?Q?bghMT0ybMMBxBUJqOtQV/s4z9X64924ma2uEiY9XiWFLTf2tf7Cdcf0EUvYp?=
 =?us-ascii?Q?HV/5IJGilUD1q70Lybg86BNvfQRvh7mRzhvVuLiYrrPv08xoo1LYABddw3Z7?=
 =?us-ascii?Q?T1QW+EtqZf1ANVfyFBpgNrYitScDB6rRZ1C8cey67Hmctt6sM4yGAPhztKBL?=
 =?us-ascii?Q?vWWMPyMn8xAI/ZjWU72ytCTTlrsv92MoMbYW8tsfI4mksPVVeuFDU54RH3OD?=
 =?us-ascii?Q?cMSkLGCtHP5MVAZO6Y9uQjUOlvatdAS2KKEkFl5FPzcjwI3vuK7KH0ezFvr/?=
 =?us-ascii?Q?gUUsOCP18Xg7eFjo1QPMSNxozuTS4pEq/mfkZgP4bR+G7s/DcI2cnoAI708C?=
 =?us-ascii?Q?YwYDPLZ3gBnj6eIMLaaBJPVU2P9lo9Zmu1x8+BQmjYynpM/ViwXYhPdonvL9?=
 =?us-ascii?Q?tKHm+286NRI+xxCvaTJknZFfwrqrwNBSz44F1m1MlYJPSKfStRGnvoZTD3X0?=
 =?us-ascii?Q?fCyNTJGTodfV+J+DTDDa9RWr6S7qm+XqUIwUbJf3kldCsZXILAkEYTwgIRBg?=
 =?us-ascii?Q?DFIzrDHRmix25sSy8U+99+dGQ6VP/CpEvW+fOXdZYxIEVoG2B1IuchkwDjsc?=
 =?us-ascii?Q?pBIOHdAfc5Jvk6MHXq2H1iL0n/MeoHPb6s2rgR7gBIfc5GgoUa1mAAeE9pWQ?=
 =?us-ascii?Q?ykn3/h6725AxDLQs4la2nMldq+wc3sOGHcD3KTde0dBWKEv9XG7pV4onCG3r?=
 =?us-ascii?Q?5174f5H8tEiCroYwWDY3sWPKPf63TMV/3m/jSNj++6KG7xsU69MJX7W46X/p?=
 =?us-ascii?Q?3wUJzNJMn5zgtJOa1T+AZajS6p4Gg0HeNu1LSpGtpfFUA8fyR96rajEXLSOe?=
 =?us-ascii?Q?+WI1cYYo5W1UQMo9DPHyF/Ze6rYYt8ySL1eYzEbMbsQoaTb58oa/wDhj9DH/?=
 =?us-ascii?Q?4LdTgU+1/XGckzk04aXnIRkcuXVZdO60MCQpy7EYrezv2DPLn+3pXxZKMb+D?=
 =?us-ascii?Q?9u3C4vVig7pKiUEBPxX5sd6ijqMCcsaLFvWBxEXLtCyM6AUk6mELdb7pN+m1?=
 =?us-ascii?Q?Y0SBzBLQ9MGXo3u8PoLJZbgItarZV4npUJEaUY1hrslBJr9Ij97CtT52LcWm?=
 =?us-ascii?Q?1Rx88bAzYMw/hIfdp9Ue84Cs82zJNtDZrSzYAF9DLQrsqNXjYODMDGCXIkQ3?=
 =?us-ascii?Q?u+bcXAHAHkkYYnhapV9KuQIJlvFcxn3PyPhQ9z3uXJfO2qcy3HCCZkXY2OlA?=
 =?us-ascii?Q?wafFJVW5aYLtv0Kcca4+WvjyJlA+B3OsE91QOiXjoNrJMyRVEAj9oUW0lF2v?=
 =?us-ascii?Q?cu5i+0nbpI+XNtAxtIrBCVqs3EuWZPR2rq73LNqe2bCgQLhfQhAsWya6xroh?=
 =?us-ascii?Q?IkBibYQGPT0sI2IGnA6Fe5lsNaRzdQNRNbMrIvcf5l7qyGndcg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR02MB9216.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EUBGKR6W2iNadd/pTEiEJRtgu7q4ksp3JtDiv/xsyYZY2sIgb9Wf+vSYS0/U?=
 =?us-ascii?Q?4i9ohPYb1cz1e9yvDse8D7/tc23wXKwQH5TAmjkx0fzqKDrkXC0rOH/OOTre?=
 =?us-ascii?Q?sQIsTh6te1r8/TyWbucmT1zfPAlpNgfUoLR58qpxYms45efs0ZSLbXkrPUaX?=
 =?us-ascii?Q?We85ROGE8oBjKH3emcbus0yweMsgwwQauswhVM9JX+RXaS2lzn/rS5BYDF6A?=
 =?us-ascii?Q?Yyiom89NrBcWsfhd3WYIZ4G5wsSXHBZg5b+eC2jLolV86n7Ghkta5REsGtQ6?=
 =?us-ascii?Q?zBxXrNy6lnmqTEqYj3MKUryrBbH3SVQ9VOZatKFyrA3Ra8Fu3JSj6jJKXyGY?=
 =?us-ascii?Q?hHpSxsTiftdBqlvLwhsjG7YULQHWybBpERRzODbSALPasZdfsByw3fMKNl7K?=
 =?us-ascii?Q?E84JUjmV7NFOTr1Bl3No3w11WhiZxr2tJFmY6O3qYiz7Fuy1XzJBHnnjDcCd?=
 =?us-ascii?Q?MUqJxTx7ncUqjmOrjaPRuqAFUxagvju6ZuzeUQBMgszz+1AGds0uMcKxOi/a?=
 =?us-ascii?Q?L3Huw2I9ZCAYXRsZGYlO8e1C7siT3Qe6+A7/wcTFzBV55G+p50XyDF9W1zpF?=
 =?us-ascii?Q?A67sGNh1K0JIDBsAIJUxd4TUTPl7fzw4q8H1wLOhECNH5YjI5bOlm96PjcSP?=
 =?us-ascii?Q?rQUxqGip0GM82Y0MOcjXWLUwfi7+AzILv7jtKIZWPBXUoQNGOYMdr/QBKM7H?=
 =?us-ascii?Q?XooavIlInbMCQuCkPwcvfJkNzvISQFeEs1aV+GNovmSk7OQQEIF6tWYq5LSz?=
 =?us-ascii?Q?dPFsfW9GP7Yg+cwXKbaMvG2mVPexkAr0A2GMwy4gn+zsUWOAb2ms/MQnCbDq?=
 =?us-ascii?Q?IoElO6VT4k6ZCPHCqkettHj1jBiCyIoDHBpJApctORloBrDiZKnpiSrsC94q?=
 =?us-ascii?Q?nLPJjV6c9mRL2dx44/4XCWqV12ykh4HIKaBtWfGr8oAk3izvOwWCnBnaCgO6?=
 =?us-ascii?Q?fXLe/Jp9UT/7WdRHn8Si+W+BJfhI9CYvWbPrq+DFXQtXzxw4YcNJnzremOZR?=
 =?us-ascii?Q?ZGlxD4cof7uqYvw8hMuUKNQBGYafOL5Tfi0vRVnGvburBRwgqAIEInB2uicV?=
 =?us-ascii?Q?GkVFbNEQ5QK/lCGOeSU+Aj3BrZXoJIwguXI5ajmHoqnt+PgmtiH5FiP3jo/c?=
 =?us-ascii?Q?5yvLQsTI4eNJhEJ13vaoBu10+Mh4sqGjvXjHm8w3HI8fw/OoGHdHBSeHsWpA?=
 =?us-ascii?Q?iO4xTRm9wPIStosnUyb7YnYxfwojmSWND/FRewDr8O3KVI9bc0jgIuqq3qsC?=
 =?us-ascii?Q?49SO5IUqDHJYy/LIl6rz2SNVc2tTtz34tInPN4kQahWbXTZ6pkqufdYTr0wi?=
 =?us-ascii?Q?X7eUffUjwMK9n3eH7aW1vi9VikepwS05/Odsb2o70BHqpamiRLDY+s69yB1k?=
 =?us-ascii?Q?ewwsj9U3Rbsib2ubnSd+ujyIREQNnGG5QaDzSzzJ/A/AGQe2nvhdd38E3NRd?=
 =?us-ascii?Q?pUyST3tAeZyLty+TrT+45aaBm+dGw3ojwWDyyy8sQJAjNgux2fap/Z5aDOJ/?=
 =?us-ascii?Q?RraLfRSy/tMYp3WBIYKENh7K6kyVf20U3OSd84DDHKnM6kc1/dpPj7vXTfuw?=
 =?us-ascii?Q?XucP/vgTD8foXZmQL50LzOyhmFS16yc+zARRtQ2y?=
MIME-Version: 1.0
X-OriginatorOrg: sandc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR02MB9216.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c5f52a-da82-4439-8805-08dca68cdf53
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 18:18:35.1752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 21c4b724-f908-455e-813c-11c8d17f3e9a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aSqRb8V9Dg6eTwMARlPH1S4YkY4Ji2eqILYZKYR0wcgruLGWOdr80b3YZCc8DK7gHwx5SCBCaY1120zepx5v0sk37qvQ3Yzhl9/wEvEahf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR02MB10005
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sandc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrcqYLZTZPGFN6cd5892NkBSt7xX22H2nAWzJwr0XJI=;
 b=rkjpKopljAKWOefGo+ZB3sqPYL24Kres0jgSJVap5ssPYK6E0Q+InLcnG6LGO9zWJNKksRJvQL/SbhNiFmWZCVJdLIRGfklCoNwp4NSMCFlta1w8JyEhSe0knxPMT5fvuV9vSGjeymKM9CMepZXCbUIkEo+Xo6rF0NLJ6kHemeWHpJv285wR9JAm7R9hvFYpjsCstQRcivuvQgLCcqT8qQuistD/ibPSnHYQndkVytO+jDtwvFArQg3lGa0Qt4pHuo/l8V5gCo65iaMUpryDJDPJSPIOD490DzCDpiIFbP9Ba/somzpi2qSOksRCwtcKH6wwuIm5WscFhN14v7PPLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=sandc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sandc.com header.i=@sandc.com header.a=rsa-sha256
 header.s=selector1 header.b=rkjpKopl
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandc.com;
Subject: [Buildroot] Year 2038 time util issue - Build failure in 2024.02.x
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
From: "Karicheri, Murali via buildroot" <buildroot@buildroot.org>
Reply-To: "Karicheri, Murali" <Murali.Karicheri@sandc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

We were using buildroot version 2023.08 version and encountered a year 2038 crash when using time/date utilities. So, my research found some work done in the recent version of buildroot. Where BR2_TIME_BITS_64=y was added to build with 64bit time field. My board is based on a STM32MP133c SoC and using an external project to build buildroot. So, I have migrated our project to using 2024.02.x version of buildroot and enabled BR2_TIME_BITS_64=y to get the fix for the 2038 issue. But my build fails with the logs below.

Could you help me answer the following questions?
1. Is the Y2038 time issue resolved in buildroot? If not, is there some work, though officially not supported,  I can investigate for a potential solution
2. If it is in fact resolved and expected to work in 2024.02.x, what I might be missing? Is there specific version of the toolchain packages I need to select in the Toolchain configuration and other packages?

libtool: compile:  /src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/./gcc/xgcc -shared-libgcc -B/src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/./gcc -nostdinc++ -L/src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/arm-buildroot-linux-gnueabihf/libstdc++-v3/src -L/src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/arm-buildroot-linux-gnueabihf/libstdc++-v3/src/.libs -L/src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/build/arm-buildroot-linux-gnueabihf/libstdc++-v3/libsupc++/.libs -B/src/linux-bsp-stm32mp133c/output/development/host/arm-buildroot-linux-gnueabihf/bin/ -B/src/linux-bsp-stm32mp133c/output/development/host/arm-buildroot-linux-gnueabihf/lib/ -isystem /src/linux-bsp-stm32mp133c/output/development/host/arm-buildroot-linux-gnueabihf/include -isystem /src/linux-bsp-stm32mp133c/output/development/host/arm-buildroot-linux-gnueabihf/sys-
 include -D_GNU_SOURCE -D_DEBUG -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -DHAVE_RPC_XDR_H=0 -DHAVE_TIRPC_RPC_XDR_H=0 -I. -I../../../../libsanitizer/sanitizer_common -I.. -I ../../../../libsanitizer/include -I ../../../../libsanitizer -isystem ../../../../libsanitizer/include/system -Wall -W -Wno-unused-parameter -Wwrite-strings -pedantic -Wno-long-long -fPIC -fno-builtin -fno-exceptions -fno-rtti -fomit-frame-pointer -funwind-tables -fvisibility=hidden -Wno-variadic-macros -I../../libstdc++-v3/include -I../../libstdc++-v3/include/arm-buildroot-linux-gnueabihf -I../../../../libsanitizer/../libstdc++-v3/libsupc++ -std=gnu++14 -DSANITIZER_LIBBACKTRACE -DSANITIZER_CP_DEMANGLE -I ../../../../libsanitizer/../libbacktrace -I ../libbacktrace -I ../../../../libsanitizer/../include -include ../../../../libsanitizer/libbacktrace/backtrace-rename.h -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64 -Og -g2 -D_GNU_SOURCE -MT sanitizer_pro
 cmaps_common.lo -MD -MP -MF .deps/sanitizer_procmaps_common.Tpo -c ../../../../libsanitizer/sanitizer_common/sanitizer_procmaps_common.cpp -o sanitizer_procmaps_common.o >/dev/null 2>&1
mv -f .deps/sanitizer_linux_libcdep.Tpo .deps/sanitizer_linux_libcdep.Plo
mv -f .deps/sanitizer_procmaps_linux.Tpo .deps/sanitizer_procmaps_linux.Plo
mv -f .deps/sanitizer_linux.Tpo .deps/sanitizer_linux.Plo
mv -f .deps/sanitizer_printf.Tpo .deps/sanitizer_printf.Plo
mv -f .deps/sanitizer_posix.Tpo .deps/sanitizer_posix.Plo
mv -f .deps/sanitizer_procmaps_common.Tpo .deps/sanitizer_procmaps_common.Plo
mv -f .deps/sanitizer_posix_libcdep.Tpo .deps/sanitizer_posix_libcdep.Plo
make[6]: *** [Makefile:533: all-recursive] Error 1
make[5]: *** [Makefile:420: all] Error 2
make[4]: *** [Makefile:13138: all-target-libsanitizer] Error 2
make[3]: *** [Makefile:1033: all] Error 2
make[2]: *** [package/pkg-generic.mk:283: /src/linux-bsp-stm32mp133c/output/development/build/host-gcc-final-12.3.0/.stamp_built] Error 2
make[1]: *** [Makefile:82: _all] Error 2
make: *** [Makefile:106: /src/linux-bsp-stm32mp133c/output/development/host/bin/arm-none-linux-gnueabihf-gcc] Error 2


Murali Karicheri
Software Architect
S&C Electric Company
________________________________
NOTICE OF CONFIDENTIALITY:
This message may contain information that is considered confidential and which may be prohibited from disclosure under applicable law or by contractual agreement. The information is intended solely for the use of the individual or entity named above. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution or use of the information contained in or attached to this message is strictly prohibited. If you have received this email transmission in error, please notify the sender by replying to this email and then delete it from your system.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
