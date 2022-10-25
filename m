Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F19AC38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 06:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08C164026E;
	Tue, 25 Oct 2022 06:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08C164026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2q42El-RiZST; Tue, 25 Oct 2022 06:15:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21EC540220;
	Tue, 25 Oct 2022 06:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21EC540220
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DB461BF2BB
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4829C812C0
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 06:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4829C812C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s9XGMnCUT3Ui for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 06:14:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7193281249
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2080.outbound.protection.outlook.com [40.107.247.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7193281249
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 06:14:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMfVcL/QOfOUZUy2ZeRRa7SWp0NzBQImtavirOpQ/XZy6HslN+9Hy4HQ+n7u9BRjYii6H7CPzhMWFrutkUMdjPDd2S1P4znKoETRvhTekxMvgpUc753r2g/MnMUN3iG4EJfyNSI+/O9RCZuRGveuxDbW/yLQINNX6njfoRVBMYVchImpr9yJDMoOD16YTdPsqrpv7QR35aiwFzRp4EEHOQ6p8UOa2gPJ0xmZOiYv4a0gov3K7dZKrz1XPLlzT0azh50f0u+i5muuH3GeL5B3Wv9DRjGacMlc9w9AvTvSbdJV931vI+UvR9PEcqLZtC+TnAlKzisT4zEvdfYuW88RxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CLO/3JzwOECqtqyUYQfU2p4hi4iNPSICsIyyjrO9Lg=;
 b=HqXwVmNsVA6XrEjt8r9Jav4mEy9vLnnt1OJO9H+5/J3tQS+40kTi5qg5CVm+Ng9XQPmevHfIEC0pFWe/bu46wLwLsZpYi4dnfpfYgczP3VnfanwQ+6AYfLeyBBNUoP/Xy0QnY+rqlQOXqyzzZvddvALLwcxGTkVxxWLWsnEiPHvF+Hc49rpbrMsyht9RXxw/fcQuZF5f0b73BVdEhIzDs1QXZqctMDgE38IJ5vFt8D8Vt8YUUFCtbhYZbmYjHu15bpA0tTSMeMvZmVbpAk1cpgT1OuPGGsV+3wVLZVp5ETamjd9aUyAm74lp2Jczck/XMNmzoM1BGS+fm0vBNc1GIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS1P190MB1824.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:4a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 06:14:54 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 06:14:54 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 11/11] DEVELOPERS: add Daniel Lang for llvm-project
Thread-Index: AQHY6DjE4MHMN0kqZ0OjSgGpd6Hdeg==
Date: Tue, 25 Oct 2022 06:14:54 +0000
Message-ID: <VI1P190MB049347BD3CCF4F482FFA9D8A9F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS1P190MB1824:EE_
x-ms-office365-filtering-correlation-id: fc0d99be-8f90-45c3-ead1-08dab6503bd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZXX9yI1hS+Hhdx7XweDbd4dyEn7tuAMuw8w/nMVTn1Osf1B5LqbjUl5GyLvOKnEs7ziHNxj2fv2NayrSAMrT/4muoeUESIpNOCTzm6kaihsCDLP7irkO1+/Wo7Ovp6dDhesaNedH6ZLhy11c8d1ThAlVR5VMCNBHnYNL9JZAJidLapBWYT3YTZY5khOMczwuY15ujmzjCKoecwGi0f3i+EH5I80ioKA4HdB/+p2aFjE5uBWgivWZkEV/IMvzHm53eQXZSZk6S0zZz9isMElvg7wql7Pu1HlB3Z2U0cVSxbf0zmNyUks+dR1SsAHv7/7uorlBDRDbq9PenkNb0HEczlnD9PsvStCb0c2qyjFR+LdAlVud+b5tVKfdchRCavcFdc0+5+Vb3sI1aTOSV9+yQ1jnPGuifkSCmgwqfTalMstmLw/bAfwf4MwFBRid/oWxF0rGJn72eOW3VAyD2dHasMDeCkE07hLbLP0Z/AgPKTJqrFk/MlQLDiarM5595mBPIIs1mOvkOnWzpgOsaQR/Z+TDzC2/gv3el4APwLLmVb/DXI9/apDlvul+J4NHVF9ewl53L1m8TwBxSgUsbrLH8mwUizDGyyQdzkQQwJ9mJwZHHFc5W4bWruu8kxH7a9gTcQ4xBhnY0TNJH3ylgSbkJ0fUSjnrKgNQb9ZUNwiI3w3ndEMb+2fEVdRmKDrQmlSVZjk3RW8yTAc3sfS3kI5E+A2gIn+InwbdCl0HpAG482m8q27zY9wEEfZ+k8WLTCFx713omfzBZmXGP2v60J/xHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(366004)(346002)(136003)(39840400004)(451199015)(54906003)(2906002)(8936002)(26005)(6916009)(52536014)(76116006)(4326008)(8676002)(9686003)(55016003)(71200400001)(4744005)(66446008)(66476007)(66556008)(66946007)(33656002)(64756008)(86362001)(186003)(478600001)(38070700005)(5660300002)(53546011)(7696005)(6506007)(122000001)(316002)(41300700001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YqdUQoEtbwMkAVzcmXxK+C18CFRVh6ROv/AhluXq/S7USRUTYZo89kyI2b?=
 =?iso-8859-1?Q?/IFTx4AE+lLlMSG2gtwRMAtzONXBcS9xJHzWsl/Y6UWIIBj/G76Ykq+wm2?=
 =?iso-8859-1?Q?eWGSTIJHypKEDImoRX+q2PhDLBsZVb1bKNQcw0XjIfnh63mfNoJhifR7KJ?=
 =?iso-8859-1?Q?7ZYvX14h/qk0P+12NGdK/pEQgqlzhHQ8hPDaOqV8I+LYKtJmgpKhe5PgBS?=
 =?iso-8859-1?Q?n3soSn1x/a8PXLpJQme8d5P4vfZrL3d0q1JCEJuVHcvqhO7X/qn0pfJ+gt?=
 =?iso-8859-1?Q?8wcpqPqM6d6ZNpA8okXNNYktjUKGJ06CvRf980ShA9ufPwn091dMpuh9ML?=
 =?iso-8859-1?Q?OY2tAqUv7YV4zNrvJHpplyyf1o/JKAe2H1OHAM3zS2mBP+FA5jh/deQ3rd?=
 =?iso-8859-1?Q?CKvYRJNQ+quHe15BRivr3IbTLYlWnSrmSW575+WMUOCghZFSARzcfpT6Xd?=
 =?iso-8859-1?Q?Ei/E9aD2nPM/tuZ2XJ/5CtFbIDLY/wWsApAeulpeCYFy4kmdnTr9KLyFSt?=
 =?iso-8859-1?Q?i2aGEaVdmcVIK0yzQ+/KqKWsO1rptuKELJjvX0Olr8Puk6EtH+V6tl2Tdv?=
 =?iso-8859-1?Q?u95UZxh/TUbPxvR3hgxtC/ltZZeEWT2v1uMoKdHH/TdYEf+IHsXcDMRj/d?=
 =?iso-8859-1?Q?DXvq0WYQQA1kqeDaYCa6QVc2GqFwcJMnqrNmlJ9jzJLpcUMugYIcincYVY?=
 =?iso-8859-1?Q?4soKZwhQbvXwCQEekbPb9MZdqjxRj7Zt/RMz8/VP183e9X3jLAdWE6LFxG?=
 =?iso-8859-1?Q?92TdWaVvkFh47AuNrVbX7irUs04KDv/oQDrEJAzec9fWEifPClYsAAE410?=
 =?iso-8859-1?Q?3fpdgEZBfiJcaGLE1dc1KUW9Zna7tP9Agi0651Bz0XiInNDnYaeVhsYKJL?=
 =?iso-8859-1?Q?4DrXShEB/78BuRG/X0mTJUd6qwK+k29z2azkA++3qkNrHr8EczptEhgsUe?=
 =?iso-8859-1?Q?x5ae1+jrXFyzWsIJg/kWMMxJ+7Eg5rQytO9RhwFskRnQaDSPJZiJ4tm9Uo?=
 =?iso-8859-1?Q?qHxrzyBxsduDN1JixHYZ/vv+tFV9xadmSSjWs6fpaSpoHJTpleU6kfoQ9u?=
 =?iso-8859-1?Q?jvsObCBAbjaAgtF5YeP2W5vS/JspkbnqFPlYLxoU4InBroaQ1107wCC7c2?=
 =?iso-8859-1?Q?9VFKyiF9x1laXpya420pWmiQ64Kn/ReepdyG0d/9Liz5lImty3KYLpyyr0?=
 =?iso-8859-1?Q?fNRUrs6Yzapkf+aWuiuO1wrV72p2gzt04Pu6FtZ5Ibzyp+DUkorcbDlu+0?=
 =?iso-8859-1?Q?RGX4brneyoqcqpv8r5XIbES1dIXnMivdTIDmv5yTdGZzxIs37QIXshZNAd?=
 =?iso-8859-1?Q?f5fzlfKLL3DK3cIELOW4Yx6Wm1fdr15izT/ru6iKJCo9OYhFlblwdbIPID?=
 =?iso-8859-1?Q?62CCy4ACzK2atpviRne8yQ97VM2MIf//AMUX9AQvpFg5gOE1mPqptMg8cc?=
 =?iso-8859-1?Q?UnBCClDQxJgGnpOvVsRVTW+dGN/q6qtdcp1faQQ5qbcngP3KDm+WEFboK8?=
 =?iso-8859-1?Q?Jzu+exZQNG8pT/4qT+QNPlGFcYqtPBNQJ45lRGtofkP4luYo/4JZEZbA1L?=
 =?iso-8859-1?Q?1iWmW65G5Q72O1gMnWupfk7HzMbDJI+ii034WQUykdE4ARIJqax6lFG9jO?=
 =?iso-8859-1?Q?60qf/qNNgAp3I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0d99be-8f90-45c3-ead1-08dab6503bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 06:14:54.3285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VG8BCf7/7pmLJ+w+yxfn72dFt7HCFLnBCgm3TZULWDuwEVk81fG+RaMF126PzVtZ+Cq4fiQVtjIZoDaXC5Uk5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P190MB1824
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CLO/3JzwOECqtqyUYQfU2p4hi4iNPSICsIyyjrO9Lg=;
 b=lralP3pqcEPU3y2TTz0YjbFdibAhuIg6UsRVjKVk7i+2iHex+1TXannCLUgCLDryZFAYftdKXxPtVogQfCFdnyf6iQxBALaSS9TpQBsI+s74EXa+LemimWI4AVXpbY4BJB4FvtuTLXaURXKXVZT31fU/bQzcLV1JKaiiTQYqsuk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=lralP3pq
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 11/11] DEVELOPERS: add Daniel Lang for
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

From 709898d42f115a5403f54d3fb0dd04e1d5ee087d Mon Sep 17 00:00:00 2001
From: Daniel Lang <d.lang@abatec.at>
Date: Wed, 28 Sep 2022 16:02:38 +0200
Subject: [PATCH v2 11/11] DEVELOPERS: add Daniel Lang for llvm-project

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
Changes v1 -> v2:
- No changes
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6dbf4fe7a5..19d584015f 100644
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
