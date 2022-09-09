Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF09ECAAA1
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 09:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3216D60C19;
	Fri,  9 Sep 2022 09:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3216D60C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sHcTHygdknxU; Fri,  9 Sep 2022 09:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 609B060C03;
	Fri,  9 Sep 2022 09:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 609B060C03
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38DA31BF3A6
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 09:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 134AE40CD8
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 09:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 134AE40CD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EAaMmag4fmv for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 09:17:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B16B140BF2
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B16B140BF2
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 09:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnF066PpPo1yTwZ+QUu59LsUJEfdl/A2vrn8ht6ft7ADf3NcrA1JevX94wPt7x6DTf020h7tm9RXCwSQlyL2ioFSK7+ilb4Y+fEgfB+9WCt8VeDswdjqZkdnTjAlzS/aY1z+wI5d2hd3vVq+5Tho9vYW8CVz62VqvAmUAACesvH2RsfmoUCsqi/zdcsufv8xYQBmTrfEnWKkcaZSHs0EdmHdlLZu/mrzjm0Z0Mn7b9D2Js9mvuB4aGrSvm/KRtsVvaMI7W4kWDp3OCGypNyO9YvPEjzoaxU+DacK/9LqEQOCU/i8OCPaH241YgzRnk77/W8Uc0A4DxfyV2W1bUy2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C301FJGeR8vS9Jb4PHZcagpIKRKzvDiDt7+5m6rJj+4=;
 b=JEpjczBg7kqIUU2C/YEwtwhCVKqkhdfkLz6iy+AJiR+hGilNM3cbDE4vXHYlhebMOZ82mMaNUWW7Nk1fHyvZ076X5JcnlioK8YBKjHQMPflATCuv5hNDzX10mbDzwZsfDwJthF7qHZI8GG7Bx0eGLncZcEkstvnxY2fbeNOKuFADlJCWxjUh/Hg5PRObX7rQnesnu920wI7lPWp3JsW0fIf/R3URxoSMXjN0ReKcoa0eO7UFXIDxZhr+efulave/yT0n+T+eFfomjvYi47R9vonjD7aSqKLPEl7jKz1AraInBgcUovH8MY+NdDQpc8el+07VrBFWNkGBWHVl3PiUrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PR3P190MB1018.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:93::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 09:17:23 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76%4]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 09:17:23 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/4] package/polkit: test /usr/share/polkit-1/rules.d
Thread-Index: AQHYxCiauSUijWEQcEqHkN+6ook5NQ==
Date: Fri, 9 Sep 2022 09:17:23 +0000
Message-ID: <VI1P190MB0493802F19F29DD225F55FDF9F439@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PR3P190MB1018:EE_
x-ms-office365-filtering-correlation-id: e94b1cca-4ac9-465b-1095-08da92441af3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EquRO2l9wjkwpQwL2nTNgJAJ0POyMe3YULrKG6kWcGL+TO65MnF0QlkKT0Gf4XhI/XwEaLZDTq7APdw/tsqaNpGbTOoSNr7nPwqjLJNa7GreXVudzO4ZLqiEIfb5KsuthfwGu9quCaHZ5oGmWTVJnN/LFxDqGPMH6L5e47V7FOKzfaISvlr0sPfhFpULDysRk34VAQR/Mwr/lv4MXontryEn7Ng2QAtiS2lmRFZPzUOkAFU2cugKS50hD/h6vt8+ywFWPxdxPOwOX0RoFa+nsx96Oqu0FHTgIIOUWUz6dhwSUuFMUjBM/Uxpjyr/dRjui5T8HhULbndQ4Y6uH6EMNWoasLyQrUp/YV74ipBixmZDRbRL2bqdBHvf8Xo2oOsCCSxeYeroA5dLZUeoYyZNI3epIC90dZ1R7FrhvtcnfIl0aIgyFZ7BQW+5BOSQLekoF9c2vCor1kJzHw+u1aKYkCNfzITA8FiUHZtTvvkpw3W5Jhq7wMNcBKazit8iAGX8M+WC0Fgd3UusyaH9ss2m+mNX2TR3lr89fTD0Mk6fv4Lu8M7BZicbfELFwCZWAdJfDCeLYhrDr7fktINM092pVVMLFfurgfQ2oETLFBVG/0mtuKY0NBD/G889vpAV1z5rf+GVj7yvTcImY+FFdyaN2jRU97SIiL8Fs9MPPa8FOXZ/zchbRSo7zqK3kqyAr1Ow1GTEgwfIz6vRugfzRGRsf/shK4woGRHIQiex23n+rZUTffTGqC9Qv5aEEvIGxg9FJrGPPhY/1M/qsQBAL2uryQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(366004)(136003)(39840400004)(346002)(6506007)(7696005)(478600001)(9686003)(41300700001)(26005)(71200400001)(2906002)(52536014)(8936002)(5660300002)(316002)(55016003)(6916009)(186003)(66946007)(66446008)(66556008)(66476007)(76116006)(8676002)(4326008)(64756008)(86362001)(33656002)(122000001)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iEAyRXnJTL5pM+t4fT81jJZK7XXBonqGmrbpeJACQEi813uZOb3f//Xu3I?=
 =?iso-8859-1?Q?rasuNutv8FBCCCx698zsz2eGbwu2tOA6bhwDglGsJriWXVXABDmfdH+9A9?=
 =?iso-8859-1?Q?WUmc6A+30pWjZqylTN907QruZXQQvT8tGrQWVIt+Czi1rP6HVL4tQDoaYA?=
 =?iso-8859-1?Q?RJxGTxxKgsW5iKgPDU5ALZpdT7eDzA7OCtTHGZ6GQEwXwSgm/aGlaGNoaW?=
 =?iso-8859-1?Q?c5uDhB3MtfStKESsqaRQOM9BoWifg/xNoGL9zRcY8Ud7PmWWRjHZlboGs+?=
 =?iso-8859-1?Q?QW0cetli+Ql5+YV2ySRIOBSxhK33iqz/NHigxAS4zh6wWiOHm1sOkpRSyo?=
 =?iso-8859-1?Q?mTDEQ3Uuo4FVtTvEN0gsxSJ8H4UMQbKB9qOjj/jnW0+AsEt5mYR4/2mUDQ?=
 =?iso-8859-1?Q?qd6D0oawvfrJ4bD+GDyoNFRkLmd+oEayuJlqiDFRGZyXRWm0VZzfgcUcHs?=
 =?iso-8859-1?Q?1gynx48nvrPJahPhFJy1v8dgMRkR5jpRNhPDOFTuAACLzx7pgjYjwGAj9P?=
 =?iso-8859-1?Q?VrzjzW77W/Z+Yuu7jd2920sx9ZYp0p5MOIWpdvSiUCrIczGYHE6jE74Cfa?=
 =?iso-8859-1?Q?z0TjcFyvx5g6NSXPA+VM/NyV9lFbrLbfhOuObnSOUcYDERIZ1cNzB0PSmN?=
 =?iso-8859-1?Q?aUPbBeCjZOvr+REEzslo4d5mT/d0QyM3PK7UkkCr8PLHyZXODxq8anw+Ut?=
 =?iso-8859-1?Q?KBtnLnlKfxRKExuYheopGX3AlsGawL0qvVcm5kUld14VzQX6CONJajJcT5?=
 =?iso-8859-1?Q?bws8UuiIFsSVb6KgClsbi9gMgN+o1pc/z0GLlFe88Tqj7WIaLbX20a0im1?=
 =?iso-8859-1?Q?AySrreZILiwt327YCtBMBNoDoPU2SieubLfiWGThbh8hvMOgmjOQ0EeQnN?=
 =?iso-8859-1?Q?GYpDbCwCY3d2nZZUotw5FnTtVpnAYTQWcxPYtXR8EMVo54ACy8la4PtNbV?=
 =?iso-8859-1?Q?dmNEnpC+ezUeJMcQnz9x83HNDJk+5yN0eu5TX+qLP8jXCUvpuWnxEAkyJG?=
 =?iso-8859-1?Q?xJfybdP+xTWiFfGWufVIIrUDxTwmMhpmxBMP4fqsSW9bWxdy9UpPMEtqsZ?=
 =?iso-8859-1?Q?Eb4V2g7sepwybj489ucr+IFOVK9s2tDEP6thLGOgK64Eln6fHo+OUvk7IM?=
 =?iso-8859-1?Q?gkTNkkCcH1aycmqMBqxkGkEtdJjqiu/+eCazF8JzmxiVhu4ziR2tL5QL96?=
 =?iso-8859-1?Q?nX5Ca/f0eAnuT00jmUhztJbya3DBi7rmTOJidEmdLj6ZgPxKEm7RaCllIL?=
 =?iso-8859-1?Q?k1z+IuvF3y1fdH7s4Ux4wX9yEUSkax3IGbDHuEpi9wJEML9U3Ow7ZEU4CY?=
 =?iso-8859-1?Q?p08eykEUhIfD9S7Uqyu9sY4+UiM41V78lJwVq5Ci+UBV4jd0Vrkm2EPnB2?=
 =?iso-8859-1?Q?LaEZ9jIFBvO0+Guym85LivyZx4hbxe9pUEk8je+nKcIlvSuYRN6w8XmZcF?=
 =?iso-8859-1?Q?/hSr6txGDGkQ1Hv9/dyTujJKT1uh+QpXNSpTpb7ieKglMe+NStiZxzz7L+?=
 =?iso-8859-1?Q?RZICzA3u8K8t82jbgF31hSZoStp8SAK8/kJO//0PmYKujByMZSIPdEUgn9?=
 =?iso-8859-1?Q?QSFuSBaM995p55XrRxceEdp2Sck8ytwutg/YQtWx+cylseLYGSbqp5OJCM?=
 =?iso-8859-1?Q?SPHfvAtySo8VU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e94b1cca-4ac9-465b-1095-08da92441af3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 09:17:23.3759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lyk9sU/AgoIZDIerLKoiA9EJQuIJ9UoJB6oEUHbUQEKn9v2qwbBuTN8W8a/PoFQ2AB1tO2152lyezWndxkg0Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB1018
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C301FJGeR8vS9Jb4PHZcagpIKRKzvDiDt7+5m6rJj+4=;
 b=Abh1lEs8AeAeIjhPSW0HAMXrLpTzebMB3nRdI+CeovCodIdQwrORMBUz1yjn5TCj6IOvR4jtlCEXh001nR5C1HpGOF9zBGmMgorO75ycUzDAHQNLAly8V+E+8TqttKkpCDm9pvtdWRAXvNx+nkkvoolBv5i6KmJyC5XpKqhj+Io=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=Abh1lEs8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 2/4] package/polkit: test
 /usr/share/polkit-1/rules.d
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Polkit has two directories that are used to store rules.
Add the second directory to the existing tests, to ensure
that both work in the future.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 support/testing/tests/package/test_polkit.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
index 502d38d13e..dbba42042b 100644
--- a/support/testing/tests/package/test_polkit.py
+++ b/support/testing/tests/package/test_polkit.py
@@ -48,6 +48,14 @@ class TestPolkitSystemd(TestPolkitInfra):
         _, exit_code = self.emulator.run(cmd, 10)
         self.assertEqual(exit_code, 0)
 
+        cmd = "mv /etc/polkit-1/rules.d/systemd-timesyncd-restart.rules /usr/share/polkit-1/rules.d"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+
 
 class TestPolkitInitd(TestPolkitInfra):
     config = TestPolkitInfra.config
@@ -68,3 +76,12 @@ class TestPolkitInitd(TestPolkitInfra):
         output, exit_code = self.emulator.run(cmd, 10)
         self.assertEqual(exit_code, 0)
         self.assertEqual(output[0], "Hello polkit!")
+
+        cmd = "mv /etc/polkit-1/rules.d/hello-polkit.rules /usr/share/polkit-1/rules.d/hello-polkit.rules"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "su brtest -c 'pkexec hello-polkit'"
+        output, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "Hello polkit!")
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
