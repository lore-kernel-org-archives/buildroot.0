Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC55C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 15:48:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 390E06115A
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 15:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 390E06115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=abatec.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B414024F;
	Thu, 23 Sep 2021 15:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5bLcewiQpgU; Thu, 23 Sep 2021 15:48:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45FE140251;
	Thu, 23 Sep 2021 15:48:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCA331BF3C4
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 15:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2EBD60692
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 15:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=abatecgmbh.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-e9C4w4RHXD for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 15:48:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::619])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0AD960663
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 15:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocaE4MfbnEd+v50gKoudpYmj+rB7iPjnWIe2g//zmIIjzWVm20ABhdBjMAcXefZ4zmjOwdgF+BvdDNtgPakG/VViaN5BNMn/N7BDnM39pucs6cssbt7ImheBAdDgM4fkUmTkezJUsdpAQ5AZzd1bHYoI11Iu7vbZlV8wQi/4pg1ssIzVSExisVGgK9zEBTk3qChYTLC4zFLqDuJPQWF/JIamFffJEMpt4jmRswC37DdYc4oaCXi/fBP5zDwzEup7LieYD2+xOkw+y0+MCqaYA3RNYPL5ZAjeP5JfGc77j4Mh33o6f9UhBbv+JjvDjr+GabOy/5uzTWX7PwViW2/qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Nw5RixfWI0LAhYPSJ44k9Y9mP/+Q40tecxF9IxmPdpw=;
 b=eWouF4RFJU/ijfKfooIkdcEiVbVP0PG2ovgdkq+ZKM+8QESuGuazE3dkAfdf4GXQjoODnPmCkYCpRGE7R6+IMVUf7zyqnJbwnftCzkCUmt1RP4NThmAarAcOzgXujkVqwS+Ki0fTuZvfzU5mz0ZXA23QJig93SXqtCG/9IjcjoP3tY+mnn//T927g+mfr2F+X0gv1Ol2rgxwcJ/BirgiJpQsNYXOzWAyBF4d2PTRZEnc0vGHK3mD50U69LmbXe7Cx6A53jSCx0/4O9v5sJCrYhv758P2QU9DDamJCyLoJLtcCLs6qB3mKZ9ArnySkRt6outj0hTciMLGTlv/zLxWVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatecgmbh.onmicrosoft.com; s=selector1-abatecgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nw5RixfWI0LAhYPSJ44k9Y9mP/+Q40tecxF9IxmPdpw=;
 b=eRuDB8hc2XgzCvS2zPTdayJ+DfY83fcfg1tEGRL5dUtpTSU1UQwAe5QCGRQEUVuQ/KqF4IUW/9//ZDtXyzMGjjSOyS/XW2FcBEE2tEkEvoMfg4JP/gf0NYfj62gqVyNfMxCTx22B9PFxVkPTmF8c1VvgCSr5e0ShdNxFd5SbjLg=
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0750.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:11d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 15:48:45 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a599:6569:1134:70e]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a599:6569:1134:70e%6]) with mapi id 15.20.4523.019; Thu, 23 Sep 2021
 15:48:45 +0000
From: Lang Daniel <d.lang@abatec.at>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/sam-ba: bump version to 3.5
Thread-Index: AQHXsJIOhbQWVPLZMkmSVSGu3qSQJw==
Date: Thu, 23 Sep 2021 15:48:45 +0000
Message-ID: <VI1P190MB0493556D0B2FAAE08AE4F4299FA39@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 03af9f35-53d6-cac5-93cb-878f976f8259
authentication-results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none header.from=abatec.at;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d65dfcb-ca3e-4dc4-20bd-08d97ea9a083
x-ms-traffictypediagnostic: VI1P190MB0750:
x-microsoft-antispam-prvs: <VI1P190MB0750C8328BE0777E30F981DD9FA39@VI1P190MB0750.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nOF8BRaQaeLxVzBMI0xlQ+B4/VX8KqKHvL399Lj6/qw7P+BlF69i7hVCpwCLkqqaat3Eoq/QMxwmawnTims70+dgqfZ0CdtJXQSVERf1JEapxAQCvQRiKonh2DOSczhlP44ZfoTQgweCTnXO4yOZITrYimurJN1ZxSalRiucIAIU7X61t+sRVVR7jNv5VQJ68y2VzxtfRwBJHYKOLYURgB3ygmp1BM8hCjaUHKvQRqxdumITQLxjWNWACiDExRCghBzMAA/OiTCTwcRiXx5DBFunjA2B1ldKKRYUxoRzG13aLCR7zl7tpB0iFMJzcIW5SgOCtcAwd0wkpIgEv+9tQHrY0Su1c9qXgmTJKuSQZ7ifTVHmAgCjb/EPK4S/PkEkfyaEIrHgBC2Aecod1EflqcVympn4/XzRaHtksiY7IIfDQVzRdQNC2wfKLkbZujwil0YjImt2F0BwonlxScHIeUkZ3XjTxsI8y01iTNyzSyffhkF30SYkAuU9ol/jmzIxYGgFE4TucLD9j/+7EJAVkwlDM0XKF7BKmfa4klMqogyjbvmlB+MWcPvoM3M1IBeHcIpGPDQ+CHtcV7SskUzCIBKTW9HId8WJPUbt8kqB989eK0W52YDIed6U0D7qu30ALxkQR1KCFwJGvEk3b83D70PqJFyF2DEpEKhwECn6zzr3sd6QGqmNU2agd4kE9Ifc37qbCEuKUSdA9byUVAO3BTY4v0DIbQQJ/Y4upPJ6EvTCHxvEOeY83wjen6EOcazYdRA1evQLQN7k4q2GB8ceVsNJBU/1lnyXiBTaLseUhDM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39840400004)(366004)(376002)(136003)(86362001)(6916009)(26005)(52536014)(38100700002)(966005)(5660300002)(55016002)(54906003)(6506007)(8676002)(83380400001)(7696005)(38070700005)(9686003)(508600001)(186003)(4326008)(2906002)(316002)(8936002)(66476007)(122000001)(64756008)(66946007)(66556008)(66446008)(33656002)(71200400001)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jHadmNgYQNW62i4Kr/6ckNeSQml8LusL3UpcePqTV8E6V1NlJirkhVDcuO?=
 =?iso-8859-1?Q?TuuIS0v05y/5ktBSin0+DGR/73swizQ3i1OoTqqJIQC1+rRPEqo68RykJc?=
 =?iso-8859-1?Q?CoXXn5xTNUc25M8Cnm4EcwACdDxhJddHI5+i3P1Lq1ln4XofYxSo0oj0NG?=
 =?iso-8859-1?Q?WdkQ8xCLxczVWpa/j4gfq+D8bKCmC1x2YqIB0PIaZFyEnUovfyhXfQQBeC?=
 =?iso-8859-1?Q?Mn6eZnsYBrslmumirTvPFZAPsxGfmYFc2VFUZTgmyRrRxyFxUiDS3A9kiS?=
 =?iso-8859-1?Q?mqcMLD93GTzYC14NdMZHl2/t3mq1Vkf3GDwiXHaeSHsYctBt9WkUerrHjj?=
 =?iso-8859-1?Q?hFGjKcKmupEuF+/NPbEhrt//jPakIJddJMJDDfrTlj31kIoJHObY5eQ4Rc?=
 =?iso-8859-1?Q?MydGLftNDcTGbn6EQYw1Zrw/isPv5HapT6sUkO52yxxycsBmrc2AcSCfIv?=
 =?iso-8859-1?Q?oe8SnLqqYuT+MROnTTd/GVIewGYgpi3vzWiCiAiZ/LIlFaxBlYJm9rOJTA?=
 =?iso-8859-1?Q?V4r8VNZupOKWI2DA/AuHz5cO1xbGquwbcOUQOxvtcC34y3kJiAGwIGo8gW?=
 =?iso-8859-1?Q?AOUBc4GEjjvOZPma0Tx6xG/SmRdx7+q3cRqiZpnHyLqFn2PjhHkR5IpJb8?=
 =?iso-8859-1?Q?8+oIw64h1egFjgsBR/Jl03zcinCfkNDzVOpvEPH/JyIOzA5rWN8DyfljR3?=
 =?iso-8859-1?Q?1my/njJ52we7Wqu8ORJdqKbrzN7POnw+biICdV0Xix/18ycfobPL+fyTz4?=
 =?iso-8859-1?Q?S+qALWK2/66NO2Kis0t38Wv5gLLOq4ISUEQTYt5xPe4/02G1po4pABAr2v?=
 =?iso-8859-1?Q?m4SZg63CPooG2w5YISWaLhfdvDcTakYT7Amfi2tL/pOlthuBLEzPfRy7yi?=
 =?iso-8859-1?Q?2V9VeZuEdaGfgE6Umn/6oMsQe5rQO6D1VeAt0O9PYDhH3oWi5fMeRy2gD1?=
 =?iso-8859-1?Q?jsmNlm7RKBM+H2Xzmw/MqNcTSiTfGUbAEDhYTEInzaAL+t0Z9MzDFnQc/L?=
 =?iso-8859-1?Q?MVD5j0wi1aVrQ5KqgkX89jqJx0eBMc+H2qHS4EFf1XMn5UdcuU99bcRYOc?=
 =?iso-8859-1?Q?09jXaHSaI6cWzDGOsN6TaoZGoEY13ZLPDnTRF0W828xHTeZfFOh1//4wLo?=
 =?iso-8859-1?Q?/Bp+LDtKguzthqWObgpGXrSrWNh+QtwVFWWbFwo313fb0B2ftmSlUK81M3?=
 =?iso-8859-1?Q?EyOpNUv3Vb4G52s+ys/bskZ3JnyNQP3QzmPtO00oEEooqcU+ZyafDKSDJR?=
 =?iso-8859-1?Q?A6cvgR9IX7ztPrV37JGpjq3yq5KBXZ4BiNYsDl69D0ZEAaYs8dq+ps0u45?=
 =?iso-8859-1?Q?L3t9TAT8+kDqt63gKaqXnDVM5RqlT+eG3s/4xZ8LFsnW2VA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d65dfcb-ca3e-4dc4-20bd-08d97ea9a083
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2021 15:48:45.5447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wEbwBrMmoDsYyp3LSz1A+H/T+AupRUfhMG7yO+FAgFdC3rYNqhlyUf8POPAF7it/N4A0ohqiyrYxfH30MIOjlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0750
Subject: [Buildroot] [PATCH 1/1] package/sam-ba: bump version to 3.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Sadly the most recent version of Microchip's SAM-BA programming tool is no longer hosted
on GitHub. Therefore the package is downloaded from Microchip directly.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/sam-ba/Config.in.host | 1 +
 package/sam-ba/sam-ba.hash    | 2 +-
 package/sam-ba/sam-ba.mk      | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
index 2236b5f48a..b96e377e79 100644
--- a/package/sam-ba/Config.in.host
+++ b/package/sam-ba/Config.in.host
@@ -8,3 +8,4 @@ config BR2_PACKAGE_HOST_SAM_BA
 	  microcontrollers.
 
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SoftwareTools
+	  https://www.microchip.com/en-us/development-tool/SAM-BA-IN-SYSTEM-PROGRAMMER
diff --git a/package/sam-ba/sam-ba.hash b/package/sam-ba/sam-ba.hash
index 1bc14f3fd7..10b95c9c0e 100644
--- a/package/sam-ba/sam-ba.hash
+++ b/package/sam-ba/sam-ba.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  dc32c49688bbfab5aa687042caae5f611fe3d9e722098a561f8f5d2fbc57249d  sam-ba_3.3.1-linux_x86_64.tar.gz
+sha256  f66e431f0401b197e80599156ea93aa3aab050bc4d16523c95fae1107ef9101c  sam-ba_3.5-linux_x86_64.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 3082d49192..10bea8ef70 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SAM_BA_VERSION = 3.3.1
-SAM_BA_SITE = https://github.com/atmelcorp/sam-ba/releases/download/v$(SAM_BA_VERSION)
+SAM_BA_VERSION = 3.5
+SAM_BA_SITE = https://www.microchip.com/content/dam/mchp/documents/MPU32/ProductDocuments/SoftwareTools
 SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION)-linux_x86_64.tar.gz
 SAM_BA_LICENSE = GPLv2
 SAM_BA_LICENSE_FILES = LICENSE.txt
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
