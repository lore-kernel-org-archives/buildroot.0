Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0765ECD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 12:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDBC040402;
	Fri, 12 Jun 2026 12:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NO_jC7wwrZm; Fri, 12 Jun 2026 12:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C59EE411EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781266562;
	bh=S6BIKH3R03Z2u4t36MxiDs521xEZxrXdM7L3hHedciY=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Klkh5v+XkZXqVmy+QLixGahnpsC15y7K2r3CH1hZ1n1Xojhccvx6+Fun6aIYYzpB7
	 X2sPNOXEBPciDBppTVDLotMuotENwiYeXHthT6p3p+AuOvAy/VAsWm9fxRMehLEVTI
	 gp4D2O+V2FGGsaJE1aos7dTpXcmL+oIxF6NKV/DGbb4+SJ/QiXRXEu7Rl6NiQFqZz1
	 EPZS5zsTeWdrf/3NWEbHlPPE4CHpjjb8LHKjBlk1bkDdqDOJlC6e497YhghhkucJRm
	 SGv6gWs3hwu0Wg4HPQGoHfRR7shZQ8p7fHOjAPcG3OMwd8QUCu8qj8eIK1lQgXN4tz
	 pOerYSJTCHM+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C59EE411EF;
	Fri, 12 Jun 2026 12:16:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C6D4237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFDEA60F24
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XXcTE3By7JJ for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 12:16:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:c20a::;
 helo=pa5p264cu001.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1647D60E9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1647D60E9C
Received: from PA5P264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1647D60E9C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay8P380/A0cWKR4Qwn3UtROG5Ys99MhaNrBWz+mGeVXnonOMVpgZAP85nVzmbhvxb+e8BQTEzZwG7z3+67pRAwd3u8FCUbKUxrzORwSYYAMTPQ9aeBuZLFPq6kaFx2m+QOFt08JTgSyM3nqohnTX3uWN27k7vk03KLCvLdSKVTS58mTIQPTms2LkBANC9VfK8ebf8sPvGgZ9M2/HpjDWujT78+HgMxavnO7xXlFrUyq+BWjOlNa4wP8hfw45wx1g4WIdGIlETGCqIYWsjpKdBO9vv+YsHrAPp1yumvAHZM6VsMiAq9kkcbJBepO8f5brt69CXIWAy+MhocjTgPsqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hxml/ydirqB17zklDib3D+zhnqaoYvkPYusGkSiHrtk=;
 b=T6AVlk+HbLjAk2GB/bYVsz0vkJ7iJXWih/cSO9pU70iSZYWotIoPf509eJ7lHDlYFnFhPJlXhUQQEWoErt1AhXpWaV22cqRbsgGEN5JrRWYzneuojL5+vhJeZGpmelucCd/Jb34cAAlZey3PUpc/S7i/JLrvgxA220rJXzOr4P2zAL/EyK+mgH5sJ4BQIWj6K1RccfPyjaYjsnwQzEvbbZ6juFpkCukYW+N6b4/LA9lv5QkCy/5dLPX6rbLq0J30bvX34+9VrfqkKk4AAXHK/WYqcZ94AlnuUbMYiTA1lPFggPi6ZuR3cO6ARBQ3mbQVfUvuANj8Le3T+be3tudLhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by MR0P264MB7389.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:15:56 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:15:56 +0000
From: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v2 02/11] package/gcc/gcc-initial/gcc-initial: add CPE
Thread-Index: AQHc+mU4urIxB+0Jik2h0ctDnrcmgw==
Date: Fri, 12 Jun 2026 12:15:56 +0000
Message-ID: <20260612121516.1634-3-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
In-Reply-To: <20260611125307.988195-1-thomas.perale@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|MR0P264MB7389:EE_
x-ms-office365-filtering-correlation-id: 1f5bf220-d64c-4e5b-c04e-08dec87c5b5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: anq/cASFEogOckdUmE3Os9jVWOCwVq1W/GBzmvZ59s0RchwKulgZGk4AOsMCAPBu35UaW8H+dkub4R/LTU/JD1Lwjnvii7EVK0qZg7KYC6RXQAdbYXASFUqgIaurVcdkOvL5KUiIh0LSgpTqDDPSW4HF9wQ/gy2T0H7JfELlLcxcaaXPvX4x3wRSYG9cAiVSrf5eOCznTEwdK1+LsRnQPhSDLWOdQ5EPaxuB3hdteHcJ/KpZkLe8GeItK4MWzCXK8WQAgHALR1h8SyHaCaxS6FF4SsZh336Dos/bw+5fxLC4OsJGp1BYkAsl4rGzCUh9gWoysJVl46AemDwG4wigxbtKA6rcrBysBIcMgzXWT3y/7R0tVtKNCL0uN6py1HsB9kgr1MrXNgRyEdnIFg7TYdJbFnwRsbgeTV+SEh9MAGqBWNRf1T1fQ0zC9J8X8GcFxjrcYjexqRO42KZaKeRAbT2iOQhHxX9D8NvbSifTrOF9DL5zauo2IPCZkaSl2pAI1Q2d7grfgH0ER844hH3w4SCTHGAOYs5m3J3bzgJEvvsuek4J02nb+Q7yM5ymSM1i8V8qB9qfYmqEWkJTdr94w2Vj75Hp0m2LDMIvxfPjrpxjbrE3vIEhG88OMEBIgIrlJkzIWXP/+u1ygqwwPKzPaFkZkOrMEvY97UGTxHOjp+tB7TxukdUy07vxx10uEicg3gjhmPlAsiPgXN4LXoZrmA8s+cFCk50UcGvfZ7YcHzIIzcm7VqnMQ4ZP84AVjfHF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?c39RZG8Ziqn8Ga7j+xoL+9Q5TYgPdghJp1iXROxYaZ/VpQxDMBT+tZbz0l?=
 =?iso-8859-1?Q?Q/57/rJQJpnmILN95nSYJ3g5yo3QpkUpIB2t8E3cnH7Lw9ASh4ZPIef0Q2?=
 =?iso-8859-1?Q?coYwLcxsDcIRnD+O9X7zB0ljl3mpwZF28/9YFhgNO1PLsDTKH6CgeqzjA2?=
 =?iso-8859-1?Q?2U1HyjgQ1BQ6e6DClgRtzmPbSM5r5r72S0fc0uqq8bGxLtCfCWUyMfLsq2?=
 =?iso-8859-1?Q?uNw8sfuKmo/1LWQlA9NrgyRyrBsTAkYA2FsH+Eb9z9v2pNKCv7fDRJElNN?=
 =?iso-8859-1?Q?L6bZWTluWxSwBGjxwcWqrlIWKxbd6WaEN1Ni8te8GoyT+jZc+KHhZFQm9a?=
 =?iso-8859-1?Q?AocjozmQNe7xw9Dh4Tqukrtk0IQZxIDiebD47aw/OnKOV35npYGRqlOikk?=
 =?iso-8859-1?Q?XRixyLMqdZqdv4JfdisHFY5ZHllCMU1fyRr6f0Ensww6qYGxh0lWFmWLD9?=
 =?iso-8859-1?Q?Z+BOPhJKeXt2/p11BMhc+gWKI/M54ubGd9k2FyAaB4IOdF7JBZpO2zSSUt?=
 =?iso-8859-1?Q?nKz7o8b8vWhfkwmXGEs4oolZ/TYR8x7vhV2bln8Vv7/NNSt6YJthyjO83N?=
 =?iso-8859-1?Q?5mU8N4wRf52ikJ/O04kcSo2fhSHN2+Cq6cT8cspgLmU+GaDZx3Tx5bYiXR?=
 =?iso-8859-1?Q?1RWwjvQthzVir1bkFf+7dzVm1vTnk4a9nA25oI4N2E57br2qw/mqkDOBCs?=
 =?iso-8859-1?Q?CizQCDUMvOGZ4+dnwdtlznUuPeCKaFNRfsWoPB8+n1lLzRiiVSuBKUxaYp?=
 =?iso-8859-1?Q?FfpOOHiXxfkx57+HApwRRkhd9HObLDYK/pcAFTARGbK2CU3DdeWMP3Dlsd?=
 =?iso-8859-1?Q?G3T8nPgGaSru42Kvb7bj/nhicYaV903NsMst1FCTTSqf88vLGDEhPhECsM?=
 =?iso-8859-1?Q?+tqaqtQjqzn92/peSFFFPF+mLrdfUABZWLkgf8BP379WKbNbzMY1LrzvHx?=
 =?iso-8859-1?Q?WxVXUIe1mZ3W7y48q3oHDKr1YQYUGOMm5HaoO29OB49Cr97A5p/cdA/lJA?=
 =?iso-8859-1?Q?vLxxA3Nkk8UseDw7KHLLDhpks8AFXjjgRYVEt2rqaeq8sHXKjw26Xh6wnA?=
 =?iso-8859-1?Q?lxG/iRfrNpiLuswGfRSpmjhZtpLd2t7JAyczzIDm2HhQt9dZXxAnuHp6O7?=
 =?iso-8859-1?Q?B3Lvhu/WO1aHP9b3UhynNgm5oymoJtaOS8co4xY+X0Lp2d5Ew0KE26Pgbr?=
 =?iso-8859-1?Q?UD4hH/8cxUQJrNpLrnCB5kX9fcd00kVDUcI8zbznnm7nq2xU65OONiqxLe?=
 =?iso-8859-1?Q?doaR/WtY3Wvoy+aApOFp8CjQVfOeZbewh4KqrHKsu361/ockaiZQj+sGVj?=
 =?iso-8859-1?Q?Vmy0KC/Fllq0QP7jN9x9jtpoULg1+7Xy9G5Fk1xmRA7tp7mv4IjXOAu8B4?=
 =?iso-8859-1?Q?riwQsKbitz67dgDhJbhuA+JgIWfhRdxi6e91k0ryyIk2yt5m8hR6NtAnac?=
 =?iso-8859-1?Q?FvnR+/6+F3zu69VK8nb6rxpdIlJ+yg/weoL2NBnKmdf4oMLaf8yYSsE8bE?=
 =?iso-8859-1?Q?0kysMFIA2Vkb+sP2VlbDRTVKFwnxdqtlCO0EWXVpEJOIrmwH9/JHweaB9C?=
 =?iso-8859-1?Q?fLkT/yz1aAxQQQjmlnbhVSFfSEKzvtKVxiz75em/jbW0RRCg24RDzStx1d?=
 =?iso-8859-1?Q?lrgFhTCR8IEsKeY+Flyg4UM8bJJaRDZ8fqSelOPza2H1v7sYMqQ7wilHCo?=
 =?iso-8859-1?Q?1BJbeEG4Y5YWcwF/RhbwDk2/V7HllKXqCpPzKlbHqF6qCRq1/RfiqRDsN2?=
 =?iso-8859-1?Q?q8vV5koDn9zDwxws3jBGE1kMTYXzmrk8TrN7d80vyXQ3yOugwkUCTFNPKe?=
 =?iso-8859-1?Q?fl5HOshLw17N23NAIUEMYsI2hxhdPyY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5bf220-d64c-4e5b-c04e-08dec87c5b5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:15:56.7309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8k8rwNuAxd9ADuS5ovN1kemWMaaRxX5rIRlgcIInSF4TqV+quRjYIcZnDhRbeocRqV6VEGqIDzkXCsnrVZ5nsQRzfmEi1m9U37XvNoFyiNA6B7BcNxtPO9U5ZC5jBcKM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB7389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxml/ydirqB17zklDib3D+zhnqaoYvkPYusGkSiHrtk=;
 b=EpiR7uvWDNHKo5rpN54zZKHTBhvyI90s4cyDwbJEn9bBxTcL9t7sXg2ZePABPPglazJn3QYpsts021+Vu0BSsF5h0Sbuk4iHbqx5iBj7wN6+326sciCqmWE+kgbXrjxSOpVZPVfH4mR/jVh6iaDK0r7vnCQ0J5ZGkX6TL5HtHzw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=EpiR7uvW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH v2 02/11] package/gcc/gcc-initial/gcc-initial:
 add CPE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
---
 package/gcc/gcc-initial/gcc-initial.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1f8b76a942..5ddded0a42 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -10,6 +10,9 @@ GCC_INITIAL_SOURCE = $(GCC_SOURCE)
 HOST_GCC_INITIAL_LICENSE = $(HOST_GCC_LICENSE)
 HOST_GCC_INITIAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
 
+GCC_INITIAL_CPE_ID_VENDOR = gnu
+GCC_INITIAL_CPE_ID_PRODUCT = gcc
+
 # We do not have a 'gcc' package per-se; we only have two incarnations,
 # gcc-initial and gcc-final. gcc-initial is just an internal step that
 # users should not care about, while gcc-final is the one they shall see.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
