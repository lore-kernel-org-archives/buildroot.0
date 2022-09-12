Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CF8ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 06:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00455401D2;
	Mon, 12 Sep 2022 06:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00455401D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pad3qY1zPyeP; Mon, 12 Sep 2022 06:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 045CA4017A;
	Mon, 12 Sep 2022 06:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 045CA4017A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91C081BF4DB
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 06:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5917242566
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 06:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5917242566
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h7TqkkvOVuka for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 06:10:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A0A942562
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A0A942562
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 06:10:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLU1Wko/PZ687kKHg/e/jQ7V0GPGVIxLe0ekdXNZn7XEsZB4cA4zQvnsuFYubtxYjCFlWN4GxsC0aVQ1vRIVtS8BF6ryAxghl9oF6LtaRlKCl/0lm94yzPSnAJ5PAXHklgDZmQwlcBWU0vgAZjy0uhmj/4Aa7v/xPJmcl9OzSFXFdqNBsglr3UjLh2xpnBNIxf79GL19Aly9vWF8pGfxNPEwj76KJWpeX9jYvBhajwDECZtMi+Cvw017sY5lqfGCJTzPzv5kBjtZDav2asV5uYZYjofyvF/pBjiPDoXWoq+Yy7Pp97UTUI+Zlm5AS1VPcPLpUz/TxRAKMB/NjNpwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Py1RSV93UGG4ZvRSvMaiclv0yzJHwu2CWkajsozid5U=;
 b=Ok9c/S6nszqwa0xffL0twCOBKZ+tjz6PSmmlL8ruo1Lx1c5e6GlsLy+HfSRCRVlxs4d9+2Twh9+znCgz4fkH/2IFN8fQ67IZcdUfCtmA/WyvZQgYczipkg1r3qBt9F2i2NSe2jBIjFgtLJ/ybDtR24tgOu8OAKJPMOKg3oF0agzAd0wYxYC7TNB6FRHpiLL6PhkZHa5W6KRTbq8nvakFpczm8YHWzlU5UOzRNsOHYAstaHXzqjq+FcilLemTrD0QXm+ITeQLT0Po2ogzxOmCuDOINmqWGW4NoIsfcmupa2K43AOp6vWsJ26yqonZ1goSOLri2nImIlS63frzeqEpLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0672.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Mon, 12 Sep
 2022 06:10:54 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76%4]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 06:10:54 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 2/4] package/polkit: test /usr/share/polkit-1/rules.d
Thread-Index: AQHYxm356OBId8kfbEWcPunWoNb2Sw==
Date: Mon, 12 Sep 2022 06:10:54 +0000
Message-ID: <VI1P190MB04931D5AB06A9CB9B228B6E39F449@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VI1P190MB0672:EE_
x-ms-office365-filtering-correlation-id: 0114ac44-6a66-452f-bb60-08da94858d21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gXtllrHZk0waalJRi45PINMnSV/P1H0ZNc+Ww2EaKS8RoZtV/F75WVIvB+XNe0TuP7B39Ai0yq6gCTJrTcWQNQobqbEocH22tBD9cpPDNYfzWK08NUyw8yEueCnDm4Dkz5AN55ZUFDFlSc2TPSIpejZPPPKJ5WcTXQ437+gnSHeirOJ5CtCeRX2TZ/C8jPtnGUQ8U3vh2tBiRYSh3Jv0urPYkNhbNUrG2vuj8WMS1PKsKJs9xozUc3Rh28ZUwPLqRNd7pt48N441z21SxmQxaVnHR5EZS5Z2V4uoPVqHqfpYq0XSUIgKTYX9SQS129xOjA3O1XmnRDtG4xc9ZkQDENdkQlDqPib08w0l/lyzjin/51TM037b3lKA1V6IFpf4sze2WI+7uB3rWonNGQdqxAhqZywUgjEO8oBlyRaHQ5fstUXnxMabuRdkHPdQaVnnrwV4LF+9hSRYc0cZs5LAEZkfRyigRqNYTIW3woF39ZfLgtRLXBhNSDKrAcQx2pDN5XDwy7/xESN9x6HtQc9o1T42lkf1WZVbfZSbkmh6u7ErfyaFP3E+hM+TWcm3LGPEjldrC4VsbQ5scy51PbrlkLN6F6O7/drrrhCESiMcvY8QC57q4KwG5M7m4UOMdvBifuS11C7V1Of+i3dIKqrXpeVhieEwe9DdGdWuqgrxJ5y1y3S7ADRjjTzMQTqzS5Zsy4Sy2Nu/IoRgeqyEsgIcsIUD/riseebSWddvBIocOaqm45Tlz+LBeKYza16BcfUn+rSDUVwJyBjZqK7CJ7Mwng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39830400003)(376002)(346002)(136003)(66446008)(83380400001)(122000001)(52536014)(64756008)(66556008)(66476007)(4326008)(66946007)(2906002)(76116006)(33656002)(5660300002)(38100700002)(7696005)(8676002)(8936002)(55016003)(86362001)(316002)(38070700005)(478600001)(41300700001)(6506007)(71200400001)(9686003)(26005)(186003)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2YbbU0zqckOyv0FTjE1cTWIYpnWBzg+vZzRb0jZp+lB7KQxeSIb3U6BTYA?=
 =?iso-8859-1?Q?pi5v3n2Pu8oAHYorZQIoHss60Svp8ZptR1gOANmmja7tZM+JKhzqAbc04a?=
 =?iso-8859-1?Q?2kTc/cuDgBxhTN2vQdN+sbLdZOxRCK/XsyB3AldR8lIYJ72ZerTAf10Xt2?=
 =?iso-8859-1?Q?kHNFvX83JSdPI4RRKgEXhQiq9avsYliniagRxyqSdZy6aQaTa53mo+VRmQ?=
 =?iso-8859-1?Q?eBux0LazMiSuqrhvkq380t+YmoJSgYR9W4nNM0B8bS8Xio7Y+K/L8DwPk0?=
 =?iso-8859-1?Q?b6ty+jBtaRDJGm5sYJYVCOdsuA2obpb849h6xPK9Qaeh4xt2NHJyUTMe67?=
 =?iso-8859-1?Q?t4O63PFJxNSO17/AAI3rX5kBtc/FoHBJuG/fT4P0vckrzQHg9dBRuR0z+4?=
 =?iso-8859-1?Q?WA9+DreHvVOh+M+lUmCZxp4Y+6XgegC4QG0SpKqTBHY52QP3PfpXld6HCl?=
 =?iso-8859-1?Q?VKdq8k52yBmQ2sA/E+nqTYmd0ebjW4jfNWgyPY28nzgdGBLAuxclIa5eOn?=
 =?iso-8859-1?Q?Edht7zF3YLMWiAmfLMpzbrrGYW44Td0XBjDkfVDjtHVUL0krhAVTK74TCD?=
 =?iso-8859-1?Q?xJsDAT1ex+UGYSIfBiTG/5sZ6ozxaUa9fwkJTtjRgFJkCvlwv3L0tEIo8P?=
 =?iso-8859-1?Q?GYzFggRm1mXzeyHmP4sDoTD/EbJrdPy3mpa/ldVbTmEgiV18M5JcOnuWzC?=
 =?iso-8859-1?Q?QLBnJwqxZZNFHWmgARsfutxrmAMvxC+0ozLgOH8rABq+6cq9pdO/j/Mig0?=
 =?iso-8859-1?Q?M0ozgZh3Wo8vkRoSxs+CkqK5Um4firSKTF+tm6VGgU5WRIUqy7vqLW9ZEz?=
 =?iso-8859-1?Q?OMkmz27svXnfr9rkEqgzjE8z8GOt+/TLnViAu+GMiNbSIDed6bizQohEK9?=
 =?iso-8859-1?Q?5+PBZIPpxajpVUE4T8hZqfCI0YupCVSlPQ9VHJ0Frkw090j6Zx+Z2gUOgb?=
 =?iso-8859-1?Q?A07kf88g4nDC2Ck/spGLZNo533ADPf40jEZWU07HO2xJuxe9lp9JF/x4sK?=
 =?iso-8859-1?Q?PAfZDvxUWnba0wIWBFC5Vj5j6HQhseFz/6s7t32CIGIcYMO3IWAMiOXU74?=
 =?iso-8859-1?Q?CbFriQ4QsncyLFi85z95q4Fjrfy9i72n/8lHjkuqLOaAq6kMGikm3Cp2Mw?=
 =?iso-8859-1?Q?kGz9gAJYJZA8cgWjpjL43OZLk/Ib+6WpaBDhSWeoBiWcCYrKkFqSZaQ+A6?=
 =?iso-8859-1?Q?yuEi7LL6rzvrHDDNs1aLdWfGd6n7qjBSdp1ORrXyNwjkCYtgCG26Bl+UuJ?=
 =?iso-8859-1?Q?uY5FrrRblAUYib49OBgrAHUeyCdsM37f4J9XR1edLeM/5/G7eRfUa/LOaB?=
 =?iso-8859-1?Q?6KG/dMfh1yqCrvBaNqGPoYGM0YopniqLCiAaeoNhIVaLs03FKW54uMTr1Z?=
 =?iso-8859-1?Q?JC4vvn446NREyNI1t9JJooKYt/GnvSJSAZOTkwrq+f9XaHug1e4hdeVQmt?=
 =?iso-8859-1?Q?cSH9QC00S+nGraquY958x6wZZTNc4h5bPsANeALeXe2sU/GyD30HbqBsqB?=
 =?iso-8859-1?Q?Sbp2DdI9Ulzr76syin8FwJUcp7n0nBAQ0aEmcBgceIuqZiBsNlEwXcyhsB?=
 =?iso-8859-1?Q?m98R1WZYq9xskDlZkSVCxPTpojkRXcN8VCwot9B1Fa+lSgTnKuoookLHBp?=
 =?iso-8859-1?Q?Te6o0wWuFtp30=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0114ac44-6a66-452f-bb60-08da94858d21
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 06:10:54.5237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0zHLrM/p+nCfY9v+Il3stbZKjzf40q98dcFMdrlRCQcfGcOxEsU608sYMoSu532XDz/0J7/NldpARaZkbYK93w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0672
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Py1RSV93UGG4ZvRSvMaiclv0yzJHwu2CWkajsozid5U=;
 b=wQPBxNT/pZfyxBRNO9XByHoH7D5zRUEYs3vi+KgkRSk/9N5qUfnX1EEdGpBzbFCCW47oNk0Q4ICQ6378HrkaLP1YR3Iuzq9Gk22hE5fxwKski17GLMqtVbD5kCk1SPNNq1N/K+Q2GxII3aMiUtfffC4/1iNQfuhszjtpuNEmMR0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=wQPBxNT/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 2/4] package/polkit: test
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
Changes v1 -> v2:
  - Rewrote tests as loop (suggested by Peter)
---
 support/testing/tests/package/test_polkit.py | 56 +++++++++++++-------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
index 502d38d13e..6d1aed6f8a 100644
--- a/support/testing/tests/package/test_polkit.py
+++ b/support/testing/tests/package/test_polkit.py
@@ -15,6 +15,10 @@ class TestPolkitInfra(infra.basetest.BRTest):
         BR2_PACKAGE_POLKIT=y
         BR2_PACKAGE_POLKIT_RULES_TEST=y
         """
+    rule_paths = [
+        "/etc/polkit-1/rules.d",
+        "/usr/share/polkit-1/rules.d"
+    ]
 
     def base_test_run(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
@@ -36,17 +40,23 @@ class TestPolkitSystemd(TestPolkitInfra):
     def test_run(self):
         TestPolkitInfra.base_test_run(self)
 
-        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
-        _, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 1)
+        rule_file = "systemd-timesyncd-restart.rules"
+        for rule_path in TestPolkitInfra.rule_paths:
+            cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
+            _, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 1)
 
-        cmd = "mv /root/systemd-timesyncd-restart.rules /etc/polkit-1/rules.d"
-        _, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 0)
+            cmd = "cp /root/{file} {path}".format(file=rule_file, path=rule_path)
+            _, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 0)
 
-        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
-        _, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 0)
+            cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
+            _, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 0)
+
+            cmd = "rm {path}/{file}".format(file=rule_file, path=rule_path)
+            _, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 0)
 
 
 class TestPolkitInitd(TestPolkitInfra):
@@ -55,16 +65,22 @@ class TestPolkitInitd(TestPolkitInfra):
     def test_run(self):
         TestPolkitInfra.base_test_run(self)
 
-        cmd = "su brtest -c 'pkexec hello-polkit'"
-        output, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 127)
-        self.assertEqual(output[0], "Error executing command as another user: Not authorized")
+        rule_file = "hello-polkit.rules"
+        for rule_path in TestPolkitInfra.rule_paths:
+            cmd = "su brtest -c 'pkexec hello-polkit'"
+            output, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 127)
+            self.assertEqual(output[0], "Error executing command as another user: Not authorized")
+
+            cmd = "cp /root/{file} {path}/{file}".format(file=rule_file, path=rule_path)
+            _, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 0)
 
-        cmd = "mv /root/hello-polkit.rules /etc/polkit-1/rules.d/hello-polkit.rules"
-        _, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 0)
+            cmd = "su brtest -c 'pkexec hello-polkit'"
+            output, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 0)
+            self.assertEqual(output[0], "Hello polkit!")
 
-        cmd = "su brtest -c 'pkexec hello-polkit'"
-        output, exit_code = self.emulator.run(cmd, 10)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(output[0], "Hello polkit!")
+            cmd = "rm {path}/{file}".format(file=rule_file, path=rule_path)
+            _, exit_code = self.emulator.run(cmd, 10)
+            self.assertEqual(exit_code, 0)
\ No newline at end of file
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
