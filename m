Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA8EC004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3ACE82297;
	Thu, 19 Jan 2023 10:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3ACE82297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lgSLIUOhdpXi; Thu, 19 Jan 2023 10:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BF3F82254;
	Thu, 19 Jan 2023 10:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BF3F82254
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0704F1BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D676240377
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D676240377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRtOcSWyauZl for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:06:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D943940144
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D943940144
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eh63h+LJeNxccjs4Lt4Dh8i3tJqraz5yf0rpC6qw92CreJXINf/N3CSy4uCKwKgyiwAB9uVgGkD1EYALn1wf6jWZJRJaapSDDWra+uvWpafHUgJjHM4rRuyZnZbCTnZGtwP1pRGsM4OPQWyCrEVmTYKy5o1qMwprxXgwiIQFmsbnWifEncaQWsGh3Kea744qBUEsAcbrifPxHxuCIL0sG3H25Ro7rO64ifF052b22gNYJ1KHTkP3VOFsaTeZFnI+d3yIozXSznGv2KSR5ZZ3IJxTo7nQz6wKWSyuWA3sQTqHzD+KylmLu0VPLjS+eIKygCRSSBzZWIEiZ3ujjqsb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zOabD3hIWJTrXboKUdqMPPXCMEhPceeafJDlNyVnWk=;
 b=Zu7McmXyymSFCCWagT4rqpLsOQlOK8nYh6AJF7PdIkrtyoZQEQPShMIrxF/zpmB5r288NjM+Dg9V21liIvnb2isiot9N0D1T9RrAqogeyH92APziqzyUBLHd+Z4piWOEe+UppP+dXr/OYaSRf6c8sw5Pj4vgehcSjCwfx4OIxhV1zCffg/c/6AIifrCYY2E3hD/0DAE6XXV+ge8Yuc+Gf90pfwgrfqvvA3gRJrlKBU90Gr73aJxLFlG4gCfiwFeLW1SgO1jV6IlsPUq7CFeBKSSg8um11MmeVv2vzZGT4kv7aaOhVaYxz3rIurgcXRGZJ8KJtNKNfe8nUJ7aJwIgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0604.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:129::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:06:32 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:06:30 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 23/45] package/libart: switch to https download
Thread-Index: AQHZK+yK/9lwRY1JfUGARi/f/lNaow==
Date: Thu, 19 Jan 2023 10:06:30 +0000
Message-ID: <VI1P190MB0493C3CD96E547CBBB0FD54F9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0604:EE_
x-ms-office365-filtering-correlation-id: d7d0954b-d0ad-4513-90cf-08dafa04d631
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qYHHmZjiyqCvRfmEw6XZXtJ2xTcHS7wA0MAQ1FMCy6u2PAdcVDAA0NguCUkil1MDwKW1M8ftMbqG02OGOMT7zNYWkJHwhmyX5bOyiFNRPJz0+0jAFfonvcgDRABBQ6gGkoCJblpiOXqCEMs0tKHjvrkG7dilbeqGqUwQV3YW87eABGnqvB+2/tFAIXA93PrC84twPS5vthBA4Ve6HXQytowkxkPjFk/KJ1FodmQ5zhaLP+oUxn7H6GXowxrIjnNRNQyvwlZymS5Ww6T8RFuhJ+H/myXCYEPGv1Me/VAANh6ALslwcEO6iGCSCZwR8SZrhPTetFWeAjStEP/WQ2VLvbePV2k/MoKdUTE6omNkDzhcoqWTHQHz7OJrnD0g/ayZLjJ9GNmVxe0htDgX8gJqB3FDMEVXUMnEe2pmmYFujwtDw7cuv/vOnOnkfkmSky9i/6lT6dvw74tkgOBSfOQK45Rem3/EDPX9ox7r6yuSUhRdAvOz2M2tD/YjGCaJUI/lxs1VnJELhOKUJ9O3PHC42w1dpxt48ufEasefj2A1h3K1h0ZQ1VcfXvWFMbEmNag06/5FtI3K+Iv5im5WT6wde8O9twtMDGoEsfsSvdjXdbmnr8ZcWYvUEbuyCUqoUqQGn9NIxHAzi4VmMZHvyBZa6FqUcZN071no+MxNGRZXNBCYDZBgOyU4kk+c36Gv4imeBXifzzWZZvGYHLLfVS3N9CxxVYZpcB6OsR1l4KwQIz0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39840400004)(366004)(136003)(346002)(376002)(451199015)(8936002)(52536014)(6916009)(5660300002)(41300700001)(66446008)(64756008)(76116006)(66946007)(66476007)(66556008)(2906002)(33656002)(8676002)(7696005)(478600001)(71200400001)(966005)(86362001)(38070700005)(9686003)(26005)(6506007)(186003)(55016003)(316002)(38100700002)(83380400001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tAiU7M2Ci3Z5xkcX1jxfWLC9Hrw2tTNyPRaT7aIVHWaawTIGOEu9abAsLk?=
 =?iso-8859-1?Q?FShQhhDOCGLzK/ATRsxzzsTxx3Qb7ZiPiq3xmEkvLZMOsAWpUhk7jXrQcU?=
 =?iso-8859-1?Q?T6Ki7SCv3hXb3A4jmAx9yFHMM/D9BBbQS8DypxqHfy3UeES/tqLMYS5RPb?=
 =?iso-8859-1?Q?zc9yAZ2a+xpFwm2B2K0aWZxlWh6fk5nQ0G6zYUnvCLa5LZpZUhVEQVGVH9?=
 =?iso-8859-1?Q?/J/5oNhVUPQyv5MekGSM+EgbwS+xuOQ2E2tJdfkjAUBZLCImvOF+JpCTWM?=
 =?iso-8859-1?Q?CQjg8gXokBB+GIshRpCVzynIuMBd6eS3dkh4A6Bfvn3094r38zMENfI5ko?=
 =?iso-8859-1?Q?8FFYFWXBBsPUwqCX/1nY/KdC8MoOH6TLM19Txlw5FHol5iUvNIntnTnqXM?=
 =?iso-8859-1?Q?/5VPpJGPkXFKD8EAH1P324YN1NkbxwY7WkWoBCyZEF+NtxxtED5+gSL/FF?=
 =?iso-8859-1?Q?gWaWN0Jl0RBHLItfG8bSIBMzAV7jcpYmhUBUs+KAougq9T3TIYcUBsnZKi?=
 =?iso-8859-1?Q?190xLMkLUzHhw3RInw+M5PMXads8Q/nLJ4FDmmgMfO2j+owRIIxDaBWxwT?=
 =?iso-8859-1?Q?El2eAnXLx1+4Kt76dN2p8/SaJgGqfiGDMxVEJgjSL+fWj2Z088JJFmgkS4?=
 =?iso-8859-1?Q?N5iFl6ZYU6C437bqObDYQjr/VbGXk/J1X9OftY/L9UaouU3k49Dl/3NiZG?=
 =?iso-8859-1?Q?lKaL74xfDEQFIwNU0gFFOodXmzoiH6NrirB3rDxkNmkWDqMyzw65V4J6CE?=
 =?iso-8859-1?Q?3ZSxTgkTpDiptR4jmcjnwKdaXa+eUtkLAipTjv5mS/5IKzMG4EYuP7P+Qj?=
 =?iso-8859-1?Q?R03qP9GQ3sexg2ldH9pqGAHMYwuECXN5pYO4PuQcKhQWATBe/1TzFrH+SC?=
 =?iso-8859-1?Q?9SPivE9YAnWJgD2uaBW7XsD6n+FWv2/lOA5mccMt7k5KgmDmPtC3e0qUjI?=
 =?iso-8859-1?Q?yUPAwuF7VB/02SCj+11HF9k+Mg0r7wXsruLg/zi1MFNIhbQAcNd8A/QEN/?=
 =?iso-8859-1?Q?oYOlqsecF+LenEO0WlS4reKRTghUbI2sQGv5jd0ybdWCRBAb3sTXylewjM?=
 =?iso-8859-1?Q?qIH75hpb2zNbZDJajaKARMFN6mRoBoSTehGL1DlrSHc7GS/6fdRN7qp1Nw?=
 =?iso-8859-1?Q?vSRE7bbDGd7G3TPzGcf5m6T4s/+wB1sH5ZVyG727rumasKS23U+SlFSB5j?=
 =?iso-8859-1?Q?9Rt4G4GmgHpj8zmHra/pyJs1kMSrF1NyvuxI4aPnmemkS1qLjbY4NT1Oiy?=
 =?iso-8859-1?Q?GkXkTz+Bw+y4rgOB851yqcN/B9tdPZxydoDrLvIK2IXCB65wy/bCJR8Wm3?=
 =?iso-8859-1?Q?ND67CzN8nf8ZIRIFPGJ5VPdVc1JgOKs39ETzvQyw8xCHcSX5n03CxLCQi2?=
 =?iso-8859-1?Q?EMoVxwAeJsd9U6x4Cv2wjLZo0sETMY7TSv8/zkMqCnSQCzFSvSywYhzAnx?=
 =?iso-8859-1?Q?2rYrnTCLwhxaT5DBqYanttY9fj3GAEFsLJNhQDilUc7BCWysJbcQHRLp4+?=
 =?iso-8859-1?Q?nM9o1ImlAviG+G3sYEqouAJlvN/FAoqkVYXe0zvF2N6M6CB1Gm9RR0IERy?=
 =?iso-8859-1?Q?lv9yyjOxt5AJYuTn+08hFkta/skmmhY5cgwU+M5D7gaig2kswNIiSY2X27?=
 =?iso-8859-1?Q?1g5Dv7yKZ7QRM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d0954b-d0ad-4513-90cf-08dafa04d631
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:06:30.6263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XDEtDtTztndArko79tzu/TW7xrYAyNuvM/LKzRewFKyeGOif4LhNDtTlFzuGyVxKID5icgr2k9i/844uCoOidA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0604
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zOabD3hIWJTrXboKUdqMPPXCMEhPceeafJDlNyVnWk=;
 b=m3GHyzULrHw7s5S/cWYjRenq/rTPYMFvsSDcuX9ZBi+qLpSuyKoxD4TWckOAIG2c9Ai+4JhsubKWWg+h3EZaroce1N75dCo/r7T53bYaGoVw4ROFYPyiejJzKbd+7EWI8hVBXbn/7h4PmZ4X4w16+zb8Vu1CMbHApU32W2oP2ag=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=m3GHyzUL
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 23/45] package/libart: switch to https download
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

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libart/libart.hash | 2 +-
 package/libart/libart.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libart/libart.hash b/package/libart/libart.hash
index 2cfbe7397d..c00272c594 100644
--- a/package/libart/libart.hash
+++ b/package/libart/libart.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/libart_lgpl-2.3.21.sha256sum
+# From https://download.gnome.org/sources/libart_lgpl/2.3/libart_lgpl-2.3.21.sha256sum
 sha256  2a10b1c884bb37c7bd5c5eba59dbd0d28bf68e64a42d7f2083c836f60f8e98fa  libart_lgpl-2.3.21.tar.gz
 
 # Hash for license file:
diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index b3c6176a57..2c64a3576a 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -7,7 +7,7 @@
 LIBART_VERSION_MAJOR = 2.3
 LIBART_VERSION = $(LIBART_VERSION_MAJOR).21
 LIBART_SOURCE = libart_lgpl-$(LIBART_VERSION).tar.gz
-LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/$(LIBART_VERSION_MAJOR)
+LIBART_SITE = https://download.gnome.org/sources/libart_lgpl/$(LIBART_VERSION_MAJOR)
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
 LIBART_CONFIG_SCRIPTS = libart2-config
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
