Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9BAC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76D8941823;
	Tue, 14 Mar 2023 08:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76D8941823
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2G2SAFZJ816; Tue, 14 Mar 2023 08:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F9064179D;
	Tue, 14 Mar 2023 08:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F9064179D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A64C1BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E33C54177D
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E33C54177D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYowKefiXGPA for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:13:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3F874179D
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::616])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3F874179D
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:13:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcATVftMLLCM3UKR2BSlHnyuqVmrBQj54RnfO1PHQfnFj8C3GD2ht1e2Vb8V8PXf+NrKqHeUjqxAKyFpPahJQphZv5HihWpDkZ96p2nDSzvb3E6TBEFNGBnL/uf1/dsgpaCzVrdML6EJt6HYxgPsyVywJsCK6s3zt1svuPWwyJGSgPnWlQhewsKIERWwlfAbR/nDUHx8CBBUab1s6KSBIaxOQngyM+Ag3iljELQJJ/O8uyjxvwmQRVKAtBegNU03mDD0z4i/g5kjZXTfgfo1Pwb6eluuRNc4Vp55C34f8gccw/WtN8UOgUx14XwJS80bzyTWt3N6JgAII6/UhJw57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BrrhsaX8vCbgWAYKPhOQjO2p/CH+YPxGSlfjvxufuI=;
 b=k/qJBAXaCGg/WGf95so8f4SI6AlbdgGewFs6LsOHvqOfcFAOQzW93R3s9Np5JVMhTKQOULBMfRXbm96hqPj/pvKLz3fko8EGwY5sVwHkm/eo0JAdWMV0mHeHTa4xLmezD/ewBoGEGF1Q8SpUiRCIRMNEXYXZfHvrUG65iQZj8etC8J9XBr/4aLAGi9P31QKvwswEneNqpLcNt1Uq68rBWzJbIMEJT44QKHblh67aqqZPi0beS2zP9y8Hr3cZeUW57/vj75PtckEgQORN+KXwXh1VxFUQmrWP+NyIUsBLqof+cyqWBR6s/4mdDE/ejUYur747EsjV4SI2IlpJl+Nv8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1034.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:1fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 08:13:19 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149%2]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 08:13:19 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/harfbuzz: fix COPYING hash
Thread-Index: AQHZVkyvXQWSEd7umkClPMZBw9G/UA==
Date: Tue, 14 Mar 2023 08:13:19 +0000
Message-ID: <VI1P190MB0493EEA41C1BB8926C997D539FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1034:EE_
x-ms-office365-filtering-correlation-id: 4df36162-ab3a-4b79-c1eb-08db2463f8d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qlm3/4ihz1RUpUExsjqS82s9aQ3cCJ3numvdxz8xaIq7IIJLO1PEZwMTlobQcQKhgf7xWkApcvPH8xh+l4OXuM68rPB7iiu9S571mVhK9m1LqTv3CJJ9pC2/qbxRmj7wld6+ZUbbufGa2fnyy46D3bZNNTDjXrbF6Ur3kPRV5Pxd9kjzrkOz/IP3YwErr9IDJX8Fwis2SBfCxHzjg2LNPhKxkENhLNoaiex54Pxdjcyw+u44nOYMz0xrKKZP/hnudNt8ttHtmo7EZYgBG2VPVFlyAR/BfbIU+2dIacseq6dLxquGS+X6JPlghd+tBR5JME9JiWNYRWidRVhxZTR4PeyScRa9e9K0VCEn1H2yNXHiL3uLccxBHIkWWV2PmkFzTzD0jglq6RZGr6qh7kq1Y7/jCyC7zOw6H7TL87MKHk6kDFtfWfY+xKKj6JD9EmQQvC3XTvSvm/Gzw7S7SbdmNmnaMpypSFa5xprmCJlwT78xzqz3ZKKZ50TIXqhbDKPGo4cT53FOfWqFdN4sqw9fPUkEkYmObs5/dp/JL0He/wB1WEt3wko+vZ0wjdQtp8a756PQFFHDnzYSshCfrqWeUFpOrOdkQUc58eRHOJFBhC6La/UTn1n53rXvt+EMkV0i7ucKTVA2ckxveMh/onRi6oyYpDy+twjHdjNAVGB8KQsUmmHg8SZo0X9VcPyhPsh1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(39840400004)(346002)(376002)(136003)(451199018)(122000001)(38100700002)(38070700005)(5660300002)(186003)(4744005)(9686003)(8936002)(52536014)(86362001)(2906002)(41300700001)(6506007)(26005)(4326008)(6916009)(8676002)(76116006)(33656002)(316002)(66556008)(66476007)(66446008)(66946007)(64756008)(83380400001)(478600001)(7696005)(71200400001)(55016003)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xcyTOI4h5cAAiDDzqmARivbLNGbddNeNnScimgK+PcOwpYYYojjLUDs/VF?=
 =?iso-8859-1?Q?Q3QDji+JbxYpHOD9/dzWF+meHutZf1IvKViHncUybLLmLPGCPND1kMsNWs?=
 =?iso-8859-1?Q?0F1RnEnrp7N4+2V8qEBpjI01PM8C2G7y0AIxxMbM5+ZJkAuH1m39Wa2ehd?=
 =?iso-8859-1?Q?EinV5ni31D8g6nUk3h0i7Ij5wx/2cCxfDO0LZswkiFYgHA1Kpk2Rpv3BDq?=
 =?iso-8859-1?Q?AW51uMqaPHGcnxzuLrw4/NcXOuFtutqYrq4R/v1mQXkaVYSDe4aQiwzHPf?=
 =?iso-8859-1?Q?k0TQgTZo7m3wG2gAagmQ5eq7QZBW2nPFAFV36/HJAqT4TB9fcHJompw5yv?=
 =?iso-8859-1?Q?Wuq4VQjJqnVVim21uSZoZpW8hbQOTic73uqdqbc66Lhm6QG1mppYEZkeCb?=
 =?iso-8859-1?Q?PLluo7AG8YbatD9xgXA5uBiV80ASmsMSGBZtJwSPA3UTSyvBYqeBiZG/Hf?=
 =?iso-8859-1?Q?O+5PtYiUmsQ09spf5e9fezWF09SHCU6ZK1o/fkxCL6EDgLMvBtaJORcMmZ?=
 =?iso-8859-1?Q?yzTWkXvTKSp97NZQudWM61GDoCXmAPUrOztO5Tn9EVjSMuxBKRHGYO05px?=
 =?iso-8859-1?Q?xNjQqyfzdFFJuY7ZS7hlscl4D5Sctk9ATsF603r0KPdTxnU4eLZIqHDR7u?=
 =?iso-8859-1?Q?UDEPhjGclzEJa9Kk7+/YvUjdNdk4/u0HObgGrmx7CSby24ST9IaUU5pCbf?=
 =?iso-8859-1?Q?8Ng7WVbNR6tNp5zgxSNiPs56cU1pAL283azcdfcFjTZHVTzEvPQouxwZfg?=
 =?iso-8859-1?Q?RPIvCSgoCTF/tQyQ2zjKDP9fbuVDnU/+rnasCTRnz3VkICCmy5dOFOhPyI?=
 =?iso-8859-1?Q?M6k0jnxlLkhPHXFkn4/7J0aFGY8U7GP6zZhEut6J3WRZ4+ZFEm0+IGyPfZ?=
 =?iso-8859-1?Q?pvK+pqMZ1F8HvBQGfrB+fAH4IY5OTXGTkU9olYzqy5QH5GqcqDJVFmscZe?=
 =?iso-8859-1?Q?vWuKsXv/ynYpjlE/PRygt5q6xNDjKL5nvT9X5o4I937nJCGClfXSy0VQfG?=
 =?iso-8859-1?Q?ItN85xlE3j0SE6jcK18oQgFQSXdRDscE8xkWsuTfTiMHIcfSmdQGjI66bw?=
 =?iso-8859-1?Q?FzC/nKoL64Dhizbu2WV3vckwI66sdrOC56kqd+KlSb/p2W/YKPVRWbOkJz?=
 =?iso-8859-1?Q?V1uirF7QtMiY5Oa3qvVW1V8T5VN/yRfE1izootebU8kEBnqh6TiZbZQTcG?=
 =?iso-8859-1?Q?MTiidzWxufk4AHM/moJaV5ZJnXPVPwiY3FyttZsoatH75WqlzJRUcr2h70?=
 =?iso-8859-1?Q?HX26jNAU+K0qGUekrs+TYcfDurc/gW2A4uDeLmpQ97awJu/w8O1g4tEmbS?=
 =?iso-8859-1?Q?ZYP2uxp/rOYiUUk2FHAnBdaoMMoPUqNvHq71eeqBTFeIweWgnfSlQlUjLO?=
 =?iso-8859-1?Q?zLxHM2/yGbDuvKxExHRV8cbDeLX6QxONbh17+GmM4yL60s2nwXz0+X2US/?=
 =?iso-8859-1?Q?N7l7wFQ58jdKOLiDqmyNqffc5vaMF3hlxi5vfVmJt015MEigo7yqVLfHyy?=
 =?iso-8859-1?Q?rMbvcFfWWtpajFCjfDWAULhqV/Cw9nDo6fWf42ae6NXev/1Y1ablbp6AsG?=
 =?iso-8859-1?Q?EQRcSU8bFDHM3J497BH73C0TiVPBJM1QVCfWXlhSKWEcRfP6R4DAHveJdM?=
 =?iso-8859-1?Q?+mfv5MeU/uIdU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df36162-ab3a-4b79-c1eb-08db2463f8d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 08:13:19.7683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yUkalFlQSmSIRekxdTveze91+NjPqdB3NBwA2kQcdE5F4dHWZamXsLVUY3UjmCi17NILOs5N97GUZNfkk6W+rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1034
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BrrhsaX8vCbgWAYKPhOQjO2p/CH+YPxGSlfjvxufuI=;
 b=sMYtqnGAHe8Tflk+W637320GqsN+Ljmwp3D/u8mq6XrxUW4bdpfYH9TZU8GcgH9iMimFlNL1orgJYYlFEaiHMeQZcs77sqgyNSn+z1osFYE1rTCxqMfqBY99ysOMSpb2h/0M0C8h700wHmxmzD7dAPMv7p2ZPYAGo+aGdUtFSvQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=sMYtqnGA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH] package/harfbuzz: fix COPYING hash
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The version bump in a1f0020 forgot to update the hash of the license
file.
Changes include updated copyright years for the different parties.

Fixes:
 - http://autobuild.buildroot.net/results/0d93b20995c2bfd2236d820a35e5eae9de76f00e

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index e881f58510..1e7a1cf530 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256  f135a61cd464c9ed6bc9823764c188f276c3850a8dc904628de2a87966b7077b  harfbuzz-7.1.0.tar.xz
-sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
+sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
