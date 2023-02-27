Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A57C64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 08:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65082812FE;
	Mon, 27 Feb 2023 08:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65082812FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOjm3XE_1hnx; Mon, 27 Feb 2023 08:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A7181251;
	Mon, 27 Feb 2023 08:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77A7181251
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11EA41BF36C
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 08:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C96DB81DE9
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 08:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C96DB81DE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NtYm-6a6yqEF for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 08:46:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8272381B0A
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::616])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8272381B0A
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 08:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+EHRoaFQGcYEnhcLqn7V399t+pWQRznai0CMdqIx3zYZr6Ug6cMHbnJlgEaP3urXjVCtYH9cn9sPf2LX9+yc9bgK3xyJpUzopNfJxAsmePQcGGyUKAFG8py8GFd+erRIUdfrDRyeSrDuPivOI9ESpIHBG3BExhkzpS20dG+uafxbfI5ybnMOsHGXHoC0oCGnkgpU8aJMPDiY74QPEq2txFNlTWDUi1T4n86bA9VjIaCvYZZ3d3eeal+RgJLZkD9eX4zqeik+LvjpERmZa3fmO15VOqDjbp7tfhZFVyN8JW1WN9TT/f+9Zm2ON5aIxgF6fYou8n99K59X6DxBSh5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5zjp1DWZrs4+KYQp+krKUkim3kh87FWv7UaYmbUafY=;
 b=CKwLeEUJo8unACMZfR42Qayotm6FyvBFWui1y61hF/Ee+9eyzktkn+slk4g7uerlsBIPhgU54kuVHpbStSF4sudMBwvP52WE7RBICfI+oRy5rM3O8PI8ksLGjPRWKkulQrul/FtaPXdeN8vdrDYQj0ydeLi35Sd1nQqL+C7S7PtYRvTact2XAZ+UroGOpiqeqi8eSPjiXA4zB+CM2nc0pPpdTqjvsr7BFFkpQ6rEheEV2gPzbnBhDu3CkPeZeLHW4IIH0PRR9j1hHvGuC0Ho2hxFg8kUIhqBEQ+gEQbwoPVIgXZKTMrriLSRZDGIFdn7BN2AtZYHnpajcQZivr1WCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0778.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:125::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 08:46:25 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%4]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 08:46:25 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 3/3] linux: bump _KERNEL_LATEST_VERSION to 6.2
Thread-Index: AQHZSofSCXCRtZ0u30yXJTHPUvxd6Q==
Date: Mon, 27 Feb 2023 08:46:25 +0000
Message-ID: <VI1P190MB04936D7377E09CA3A3AA93A49FAF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0778:EE_
x-ms-office365-filtering-correlation-id: 2a27052b-c260-4749-8eaa-08db189f1c02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6fLOEo/EDl7XZfffhMDJdAUlU0SpIFU5klERXG4eWBzRnqwq5ytuMxtrZSElPiXkWmhvvnmK5sTY1bqhoOgMgtx6qfQjGX9RqUeFHQScOcOyf1Ceaz5B5fF4Ct3Vn+rtHBjRLfpyS1pLfW9rnq5IvAHyPR6aol15ajOx6XeeZcu813khoaiblcsOhTIcHkXGW6jFXmZKvQzsuzNit7hH9Vox1nvV+jdbGvWT0F69WpS9V98DjDcC6MJd85AKyi+/SZYrf0NZMro02cjTC3PjE+7vnMZ1RWgU2O9Ihf5b2P5b3i7mj6RnSkhMV8OVkoJpX58jSTAJBwNsjfBoDW7CpY3HJqWEYVLjzFW/CLkWI4J8vn32JGVrAr2QICAxxJvyxHa5gOYnor9jo+b9HRR61bWMGtZknTnM0tO/ck8f0fbaoMjApKtr2Kaq+ykWyMV7jsibXDZFny16AhINtLg8+9fkAs8uBCGRmtZ+ZZwwdRAIMPcSLJwkiWAKTS8qUDKhBCX8h0Ps1p4Y/1yWdpzF2L9/YhN0Qytrg6rZ5hIsvIzWyKSPzP77nrU7zIzohtUgpp3VOLgu2hJXi0fgwS68kAXyJnt1KhxxvN9OOaQJita2n+s8AIv1GYUrikRgQH30S/4rFDQZMuUIS8YoQFdEhZYTvP83jKso0M7v8FVkP3BV1popFc1mtwvwDXB4Sfw5u39wtOOLAKHb23XRlWmCCA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(366004)(346002)(136003)(39840400004)(451199018)(33656002)(316002)(478600001)(71200400001)(5660300002)(52536014)(2906002)(8936002)(7696005)(66476007)(66446008)(64756008)(66946007)(66556008)(76116006)(8676002)(4744005)(6916009)(41300700001)(122000001)(55016003)(86362001)(38100700002)(9686003)(186003)(26005)(6506007)(83380400001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?duQTlFoj0BYvEL2//6CxGmeQwwgVncI8edCGO1R46PsRcJDeUqzGNdwNtH?=
 =?iso-8859-1?Q?RcrkdHxNlFpziCYKRcNfFsTKcHxg1wqiaEsmEosrBGeHGDCC48TbppAbWX?=
 =?iso-8859-1?Q?h+ED1qJUUywY/1VTSqiL8EkBTAaHF0A9l9a0IWUb+tYXqNyxwnarKfAjwV?=
 =?iso-8859-1?Q?eS9fqfQ/+W45lgt585j16eLF8yA8Ul5L/TqmJO3qe9200HJ/0XArflNRBy?=
 =?iso-8859-1?Q?iMjNeNKPC4U0Co91K++EnbVSX3RXcLZMxVHiNoOYWsO7prjiSgq4iaTFUs?=
 =?iso-8859-1?Q?CLc8KMflSJDTm3/09M5wthMk/K/CbEUrETWikwYB1s52ZQy+joJnoDDAiJ?=
 =?iso-8859-1?Q?zlnHSnulMeaTQ7nggp6kJwqF1DbNcn9fpoGgvYiHp7YF3/+2Un9xOswfJi?=
 =?iso-8859-1?Q?IP0cZIfoHiYtj8oLzu2fNKR8/ODyifLyPOlUHGAhLTJkgz0SWK1HnxBDEj?=
 =?iso-8859-1?Q?sqqU4I9vBdqIScTRbwTNfNNB1MEccWcQPWTnKDEtyGEXDHvXuOM0nC6lb5?=
 =?iso-8859-1?Q?X+4Nkzz0JomAvfbxXShNCGanfSaWT5rtaZ3v8em4mQDTXoIHgrX2od8xQF?=
 =?iso-8859-1?Q?YfoSz/Xjk8ZB5aB/SmwRUquoONtnsUFPYzUfO5xK+l8SMKiO3+WwQu4bXj?=
 =?iso-8859-1?Q?AJkXbRUD26g9gdx6E5nAX3R2tuwarqxmjBRZYyoMLF9WnzXnqCdQl1MfC4?=
 =?iso-8859-1?Q?QEv4kGW5DVQrEZTccLmu1YG//0YTEHpo3f8+yW1ExPfBYGRgFMO0Ypa0ow?=
 =?iso-8859-1?Q?7+t+Jt7MORGz0WRfyju9z0AdgupETwygqGcadwhRhLTAEcJ4Ga8neHeLH2?=
 =?iso-8859-1?Q?dPsRgJBeSVJf3qoKOHGylmL7F+tyAIi4qwmjMxp+ni18bN7RMf/03wK8Uj?=
 =?iso-8859-1?Q?CYskosP9JDqnhAHWMfR2VzeZO/entAdyStIhcTcmgAwr2Py9xHpf5KLuTe?=
 =?iso-8859-1?Q?PCnz2OoNTlc3/JwlQyeqkCvrdCGL9FaqzBPuOYZ7G6UsORGeAraKULtCFd?=
 =?iso-8859-1?Q?VXP/wXyQ0Y9YDvZjh2QQ9ILjuh0NbcO3/dhDEBeh53530Fny8AQLyU7a0E?=
 =?iso-8859-1?Q?d9meCSOzxzcBcxGdWmm17vn/73rq8LYXMpttd+sIimTfM9QMzT0K/D0IXo?=
 =?iso-8859-1?Q?UNw3FhO9BJubqLgOfU1b5P1r3+oVvgVLCuJ/iigeXoVAJPmVXcGR/4JP7e?=
 =?iso-8859-1?Q?zz1KTIGWO5VNODQCNHc/G9+yaI+qk6mm2bfcm4PTisVafDTXY9eZoWunGP?=
 =?iso-8859-1?Q?HokMQkhyYe1QnMWgKnqntXnPpZtY1k2gcQvGlexkLne901eRW/wuODEuRp?=
 =?iso-8859-1?Q?S0AkOY7uNsdJ3cXDb33nDmKgA5Zqk0dOcQOl5Aw0CkeFBXfJY2S3/P3ltI?=
 =?iso-8859-1?Q?AXFrxsCnUI3HewzOgzaTXYcS6uXY6CBgRA++n8ZsFGzDlVlCKvddnq0MJj?=
 =?iso-8859-1?Q?lU0XGF62PPbpeZ0Q88CAuWB8wbFE3nM2TBwy/9SVCKzJF4/1+8Jpk9VPjL?=
 =?iso-8859-1?Q?Uz/URorfpMEZN+hWSHd2Vsw1fXzvbmmWOQ7HQKEf05J5dyYgh82YNviQJA?=
 =?iso-8859-1?Q?n35CwHP78jBjhJGscxZ6Pjd5c0mUKsXj1jYvmM5rav/OA78FtzByc54r0d?=
 =?iso-8859-1?Q?/ns/zTovmWTag=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a27052b-c260-4749-8eaa-08db189f1c02
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 08:46:25.1697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A11FIURpsIZOM/440G7xdYyfMOkDd3cQSuza4BX8nMPJ+r+P28hr/q+c555C3VUzyMj10ZGTNgkMmHJKrQ/ehg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0778
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5zjp1DWZrs4+KYQp+krKUkim3kh87FWv7UaYmbUafY=;
 b=zg7ttWzX/xjEMvZdhXGA2t0RYfsvHwJiUPfSV+Pd6nB9E3HQZVhKJbvBU9KpsC9TZb0+8NSEVCcmF2nKUDDvTWMfCtQGVZ5UAFO8NLrSdY+Id/xJMyOxS9Ux5JWlfWQGAn0UKtekku5ttD8XJQJNdd4lSC20L80EhypjBKKafyo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=zg7ttWzX
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 3/3] linux: bump _KERNEL_LATEST_VERSION to 6.2
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
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5cbef197ab..495fc48997 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.1)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.2)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.2.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
