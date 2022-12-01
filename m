Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEB7C43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 07:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F14241635;
	Thu,  1 Dec 2022 07:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F14241635
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8djTPdkpfYpz; Thu,  1 Dec 2022 07:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 504934180C;
	Thu,  1 Dec 2022 07:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 504934180C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15A501BF2A2
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 07:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5285760E49
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 07:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5285760E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEQPscOCVnZ5 for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 07:17:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C04260ADB
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe13::61f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C04260ADB
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 07:17:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COy0ypZjN+7yXbaI4QuGrVUmx1ZQ2ufhHAAA4A0JwqApJ0kF74uSpeFejNhj6rtkf0FLhIrPJuJx8z0xTamhQHGxKHmciQbMkkl0b0Z+vaHBn1/vjT3C0GGpCOk6SJOPwRySpA0eWZGFvRZDGwJt05LYTXV1cndjKtgQpmJ11gTk5vHKnB7/T/bAMivepeyAo93yoZ14ik6qI6RXXdVfpky/rwHMQNukaIDHia2ZTDoVgeuC+sSDL5dOs+lRxjfYq3fwdE2yfNg0r5Ce80YZG/9PNgD7Q06Z7qrn1v0pMHUNXpoCvqsvkUrViW30KsaREt5n3xsZ0aWWNRqab3+cAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvxr+w37TE01D4BMbcB3e+3K14jsdX8icX0qaUM/tJI=;
 b=mRK+plajOt8qxu7hI5oc4AzYzQ6WkgvqFEpjTRQ0AuiMeoKDKBsIBrD51WIrHEcvrucktBa2VxiTPx8KmJsBdkM7gG8Sc4u9pstMC3eCv3myS4JiiM8mmvR/B01NNSsOEiq7T8i/X86s2oFFPyrUVkE/mCEJaR4csEg1ZqY0cf/VVBPU/KokRikWRvE9gY6yug1A6IlflPC0l5WJWB68QJdnjnU1hV0kl2/dpcbid941F5rBOEfaQkh24ZFLD59EgJC8zToS7fZmFMViic+DjcLzKRSecoSZa10dT1qBJSGX0Ofr5UdeIZsI5wMB6rMhcbWeb5WwyrBwy/sGTAzH/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by AS4PR08MB7453.eurprd08.prod.outlook.com (2603:10a6:20b:4e4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 07:17:46 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::55e2:7130:f584:9eb9]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::55e2:7130:f584:9eb9%9]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 07:17:46 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] support/download/dl-wrapper: make the whole dl_dir
 writeable for the group
Thread-Index: AQHZBMHgD6bhKwuAQkW/uxKBP8W5/65YnxpC
Date: Thu, 1 Dec 2022 07:17:46 +0000
Message-ID: <AS8PR08MB68706CB4A015045EA70A454981149@AS8PR08MB6870.eurprd08.prod.outlook.com>
References: <AS8PR08MB6870E377EFDB1E28448EBF5581049@AS8PR08MB6870.eurprd08.prod.outlook.com>
 <1669815827-23415-1-git-send-email-luca.pesce@vimar.com>
In-Reply-To: <1669815827-23415-1-git-send-email-luca.pesce@vimar.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB6870:EE_|AS4PR08MB7453:EE_
x-ms-office365-filtering-correlation-id: 3f44bf7a-7fa7-4818-af3c-08dad36c2578
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h0QzAr6/3HeBbvTNFHs8RU2noN0kYerxtK/envfHpkqZSBFKRp2+6YlAiPLqgxp0O6YGMvgJTp0N0Y3cNgdRp3MnCUg926GD+A3FDQ/2qI7HVT+PsqsRw+Je2lj7A5ksiIZ/c3Tu6klBE4FBt1Pkzr+89Tu0IxZhSEokUoWmBSh17GiPZ/ok5lt0iXZ8Q9dw/geAPRv66357DsPKo9Ftdl1phbW3fV1J/wtaFxCDhkpjM5ueqjZ9F0FqxC7puxFWaU8cwGbrluD1f7baGAdCBj9KdgyJEwq9Yp8A3znEwXnbFC//aJNTlwvKSJgv8RLRkqj6vGWjF9GIqn+gIh/DbEl3Z5a3ZJasKGT+K1SI3W23tqFVyaRt2EhoZH/NL3WhRaS//8maUhOiBM0c39R65O/wmDm8ChRDMSiVKBfEeOs5LHeZp9ZiFFvtldhZUzDqqq0jPyItPzyQyZ06zOJYbALPTAGTzVdOU3G9ERXJF9bAMTbJkcKN68roDlMPrZHndspzrDVT336qFYWWXHTqRkycbTflgKy6Xivin+n3Zfsqzkrg+qVp64/jRTIqaF+pQeuhO4L2aPNiLA1O0kq1oHGTSmAdcR0iNESgThesA7P181aHbYubj0gCWkWZQya5/ny6sVzZPH7EskqUjrqK9oIXIg4Q/1eK/AzFVwua0TKhKunq51zDPjU5rFC0OJwS5QixVtspo9TTI2lanYauzF1W0aislMlxvhhWHWZGY1eYZLOIOJc7Hw5x0IRH+Cgo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199015)(316002)(26005)(122000001)(86362001)(55016003)(33656002)(71200400001)(6916009)(7696005)(38100700002)(9686003)(6506007)(83380400001)(2906002)(4326008)(76116006)(66556008)(8676002)(64756008)(91956017)(66476007)(66446008)(8936002)(66946007)(5660300002)(186003)(41300700001)(478600001)(52536014)(38070700005)(21314003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AFGFXoVUuagtyXTeBGJU045732dE17i2o9MqBmV1gaD7If4biR660lrUBJ?=
 =?iso-8859-1?Q?jo4MlJawbhh9Qs1cIORZWJhTSS1hjRvPMxif395fHq8CV1/jSne/F/vTfB?=
 =?iso-8859-1?Q?CeeiJ3qz6Qv1Uy3V9+pYHGpeNmbVLflrPQzfaO1czuSSS0H5EWcP0I+Lcb?=
 =?iso-8859-1?Q?8h2TGWrdtxaieBMB44FkitqQxaDX6v4Vp/7SJHuQtsd25REgYV3dXmRXf1?=
 =?iso-8859-1?Q?KV6t+6P+V6avSz6TqXUCwIJZzK1D31L40ZobzLwsWvHntekypTgG+dPb6X?=
 =?iso-8859-1?Q?MHFKDKrcvgNNMqtoilZOQsbJ1X4TWQKwbni2hJdTrSiicQ/LI9x7MleKEu?=
 =?iso-8859-1?Q?Peg0LPcqSzhdLKMcF1s/WRnO4/mhBpPCN9AV5fsBP7Z4fdgJpm+wMTINFH?=
 =?iso-8859-1?Q?ye0jytid5Xienw4NZb19QaRMF04UvZJvBRNc7wjw6RX43jn0uPa7IfxcGF?=
 =?iso-8859-1?Q?DwijIup3ZQ996AHV97yvuVYbfooJrwvhjOw68BCQGCR/YTLZXRgDfQrHed?=
 =?iso-8859-1?Q?hUL3hYVPxtMsUxUQ8yHntnkt8jid94/yLk9fL7AaQyj+k0/v8a5n3kcCLT?=
 =?iso-8859-1?Q?xPjNjOYOhGD0ikdM8vWNKbHYjLSTplEyK62jjfCIpf78obYIFEi9qMbq4m?=
 =?iso-8859-1?Q?9soMX6O+B3F5k4f8UbIAdxveJD5PierQvqbC0WYOzl2B1FdjpBxUULV8H9?=
 =?iso-8859-1?Q?qe28HNmgmnoWvG83Zf0AvxLIt8k5S2ASc8Mr6uzcSGklE2uegbhFphY+ow?=
 =?iso-8859-1?Q?aSIC7OODcHLSrBX4vqTp5lcEYS6D7w64bD+uhnH0lQGt2S5/3LfJcr7JZZ?=
 =?iso-8859-1?Q?5pUmGOifO2cMy2n6ZxyfPjix5ZJgT/TJIgL2s56Cz5ZSBO+l97qOGqTbtE?=
 =?iso-8859-1?Q?sgpnLoKfopDpFAUVPtXk/N1nTsPSRkWquyMruoOtuRedQkzqzUaed5CpCK?=
 =?iso-8859-1?Q?bpOMqKkh+oySeQROcZLr/YhPfACB92piMgF6dDRgWhoC1ZI0iCAqk4Hblz?=
 =?iso-8859-1?Q?OCkbxFlYOWM1RMOb6vplF/UTmFT3bOcMpdXHu5H8i9hHKg92aZpHkfQr+7?=
 =?iso-8859-1?Q?AiqX/MEXV50DZCpzR1xLkaTX7zUV9I6gUrhIY+18cp4i0X+5c5tuPvnTbZ?=
 =?iso-8859-1?Q?F+lQcpwznkABFF5mX3nOglENvjo+DmgnifGf4iSH90OxwTZ7ZieEcxFR6L?=
 =?iso-8859-1?Q?8fnyrrU1VlGgS4OicUH4yiTkDW86eDqEhanAVOto/xdeF1StZytODfyLmw?=
 =?iso-8859-1?Q?8Rcj+wZUiWViUkEpYzmHZQpBgSVYwM4R03xcVLKT5/NHlaCBx2dfl26sFe?=
 =?iso-8859-1?Q?K8u6UWjZueTrPdzliZvttJrOk0DRuNwBAoSUPV1fJTXbOBW5As9988NuAb?=
 =?iso-8859-1?Q?Hn6WnZq3v2laPQm7wTOrZXa7nwlyBJGulhqIBzbblXg7iv/+cy/ogjowD8?=
 =?iso-8859-1?Q?Y8G/VucTtuCb/EPHhzMO72PnAMF1OpodMR3pePqoA5ZdGVnTkdniQtEXiv?=
 =?iso-8859-1?Q?/txj+WbMVrin3jtWHxnp3w99AtJPR9Tz7XiCBPThNCJENXbvCSuZVwtA6a?=
 =?iso-8859-1?Q?s0PRckOnzXjAGmUxIGnmgsb6SFlVCCQT+ejMztLQOQsB2PNVL4JW7ii1Bo?=
 =?iso-8859-1?Q?17PuwDYA75Qq5fQ32YflLz0j0NQtdbOyBy?=
MIME-Version: 1.0
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f44bf7a-7fa7-4818-af3c-08dad36c2578
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 07:17:46.4317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U5BxlOxVtGMWtSdqsysyZPqIVNbgn0Uhv01QKU7/Gd0VY+XhQFnmmQuwbE9bbr6j7zngjlsBnBFO9fgiCXu7NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7453
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvxr+w37TE01D4BMbcB3e+3K14jsdX8icX0qaUM/tJI=;
 b=mz6F70l5XrA2RPIZB8MYkuHdnXgD8eMDnRxH/h5IwKvvHsRbLbtZJtBKA2EYrjvbftwhT7IunXfpyFU+299s9gD9nw3D0ziS2NJ8R6GSf2SUKG3B0csOdTkMwcSc1JD6k/ykMwkvXPu3NPm0mYSuYhhNb4WX3ffnNZNBiJMCvco=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=mz6F70l5
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] R: [PATCH] support/download/dl-wrapper: make the whole
 dl_dir writeable for the group
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
From: Pesce Luca via buildroot <buildroot@buildroot.org>
Reply-To: Pesce Luca <Luca.Pesce@vimar.com>
Cc: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sorry, forgot to put Yann in cc, as utils/get-developers suggests.

Luca

________________________________________
Da: Pesce Luca <Luca.Pesce@vimar.com>
Inviato: mercoled=EC 30 novembre 2022 14:43
A: buildroot@buildroot.org
Cc: Pesce Luca
Oggetto: [PATCH] support/download/dl-wrapper: make the whole dl_dir writeab=
le for the group

Root makefile imposes 'umask 0022', which means that every file/folder in
the per-package download directories has no write permission for the group.
These are writeable just for the owner - the user that issued the first bui=
ld
that populated the per-package dl dir for the first time (say user A).
Thus, if a BR package changes its version (e.g. for buildroot update), and
another user (say user B, in the same group of A) starts a build, BR fails =
the
creation of package-xxx.tar.gz inside the dl dir, because user B has no wri=
te
permissions on that path. Furthermore, in the case of the git backend, this
makes the git cache not updatable by a different user.

So, to allow sharing of a rw BR2_DL_DIR location among users of the same gr=
oup
on a host machine (e.g. a build server used by many users, all belonging to=
 a
certain "developers" group), set group write permission to the whole package
dl dir.

Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
---
 support/download/dl-wrapper | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 09a6ac1..b7a4319 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -190,6 +190,10 @@ main() {
     new_mode=3D$(printf "%04o" $((0${new_mode} & ~0$(umask))))
     chmod ${new_mode} "${tmp_output}"

+    # Make the whole dl_dir writeable for the group, so other users within
+    # the group can download new versions and update any vcs cache in it.
+    chmod -f -R g+w "${dl_dir}"
+
     # We must *not* unlink tmp_output, otherwise there is a small window
     # during which another download process may create the same tmp_output
     # name (very, very unlikely; but not impossible.)
--
2.7.4

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
