Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8629BC001DF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 08:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 087E461360;
	Fri, 14 Jul 2023 08:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 087E461360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0tZeUM3yjID; Fri, 14 Jul 2023 08:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60CC960B1C;
	Fri, 14 Jul 2023 08:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60CC960B1C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5EDE1BF31B
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 08:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD5254191C
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 08:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD5254191C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZyCk_e9t_ua for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 08:09:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF92741F6A
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::609])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF92741F6A
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 08:09:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIM34hlehps7K87GNceAtjf3gWVRP0QWmcG5PWKm2YgUJ4bZzrNFI6v68805y1I9Ov1KglLixT+Dft9Y8rrxpH5nvB5bnJDoxKYH8zaGWv/qV2Tc3tgdQWRUJiwj4KRr4UIbizidTohMSEMUMdVvrSpcPO3wuNaOY6JeXnWTDWn+E3nF2XIxflEsp4qMx3mQuAKrdCAPJvJ8JVqUJUuYgDjwhrRdDF26uKLLxbkYgboNFYAcD+NRUnABQuuBg3bldCqFSGRHgek79NxNxeOREHjL+jSgQz+3WDOSA1EE0Wh7qWmsEItfmJa85cohkVgPwAwZOWvbsiXerqKDj44P6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Si0XVqdmTNxFWJj6mMA3silNUkxVq5WvxF2YXt/fPBs=;
 b=h2Ye0TER4CPlOHHE/JJcGujkC+jMu9RKWetiVcUt89vpzX40k7kdi+WMMLgYIbKhKdVegHY5LRB1VG1pXDmxm4MHN2AxLWGIqd/BtyEKwlTOLCTMM9qYrgwDPA6e7SKan4NOjiMjyrMrSJEwdKK3Ma/E9EE5oxEN0fuOa/KXem+9DfMi5BICPZUON1baiXVMkGINZEn35UDRIGg3gq/aYyPQRhkHDUo8ZMLovqRRjC5KAJdNcWW3BIesfCp5TH+y9dcOSmjzvCo25XAzvOK1pB3l//K3eT9Hk4HGpKQY/r/+WkqZVf85dCWkkhnMT7psg0pk+7deUsDFP079jcWrQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PR3P190MB0937.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:8b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 08:09:07 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::601b:b544:2969:e9ed]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::601b:b544:2969:e9ed%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 08:09:07 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] DEVELOPERS: update entry for Daniel Lang
Thread-Index: AQHZtipRN3ddXaT94EqoLbVqkoWHfg==
Date: Fri, 14 Jul 2023 08:09:07 +0000
Message-ID: <VI1P190MB0493A6312E7B102252192A259F34A@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PR3P190MB0937:EE_
x-ms-office365-filtering-correlation-id: f5167ae5-f732-41e0-29a8-08db844198d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JGANjh8sfjnsyAeu8ppbpo+GeBWmoIU3bFxOGQ5+G93VhmJSe41LD5fFJEcko8F6dIFhRiQd9HsMT2laTSq+LTGrWQbuS/WhwnW2ppdc7u5EQbngoP5Vibamuy52Vj7Js/GctwO+cPXM5+gE1egTqXI3FTAjhJZ1CzvYQBBVrqfAg1xgnjbmJtU8n/tuxbblWnUeny3ErrvQrkHy9HStGP6dzFcAcB5IXFIHwtvrg27dBHGmhffmgIM5WIxlbHwbxI19j/HLkH2Wv2GFVzLTsavNKHVILYZoL038hvoTW4nTFH6wnO+WXDhZMUz9utQSomcaYvBP4t8lPmfLqBMszmHxQ1zKrn6aV/QlgqgfQQwkbfq5SwJMQ+aj1MSSNkrUs52IP1XjYdXwSWG7J7xKmIOlmESJqCTjSErL5P4gIlBJuAft+ahCdbDn0f+epRvT3J/IN67NE6N76Qtp7hgLSoClBj/FPhLshlNMkflzD5lFdFtrBw0pZ6YDBubXAbSdUTt1VQWtxImPx75bjtAE0x+HtKXC0jGrwoC5KAnU8148CtDEtzDdhVW24saMR8hmvoqCva6dRT0aEM5DJnJqWubt8ZoynpNKORcZEsXykztG9yxhETJHmR0tY4180qlr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(39840400004)(366004)(346002)(376002)(451199021)(2906002)(55016003)(38100700002)(122000001)(83380400001)(186003)(9686003)(6506007)(33656002)(5660300002)(86362001)(52536014)(38070700005)(8676002)(8936002)(4744005)(478600001)(41300700001)(7696005)(71200400001)(316002)(6916009)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sucBF87AAh3ELZIooK8bIU49Qph+sblNOPSXj8CEd+sHNtB47lJBaF2lvi?=
 =?iso-8859-1?Q?SFLrHO3RJ7nUs2YDEZr36EEwKBLB7asvVDyBGmULrUjUeI/fdXugj9mEIx?=
 =?iso-8859-1?Q?45QabOYaA0AR0586FZdM6gh2f2qCdhxi9+fNDAkPzZlGfEne/JwbOwTKlQ?=
 =?iso-8859-1?Q?6V5pD/Cxp6uwdT7AgKFuP0QIZ6UTfDaj2VZWxapq5WUaCjINLWcQUAT6B1?=
 =?iso-8859-1?Q?Fiwv/6SscfzN0YZhyRyy+fvJiVpWjZ4KN5ANmmT7HveGdqufxokpyvSL8o?=
 =?iso-8859-1?Q?xlEGiIWc3CF+ichR7i67KvamLVebT8x+2zHQ0QfYYfLegGCReS3OWo/vvp?=
 =?iso-8859-1?Q?JnfhjEb08DQG4/LjTblLWEVVBqqg7omaXz72TpCytPzBW4+lWLKYB/Xs1n?=
 =?iso-8859-1?Q?uaYD5j8srr2M1kMfwOROmj5Ysh9tlGukjrMtVYcOjkNN9P3ql9xh79tDYc?=
 =?iso-8859-1?Q?RyJf0jw3qtjS7l3C8sW/uF0Oiei0rMWJQ01flFkphCLa2N9emmeQemGHyW?=
 =?iso-8859-1?Q?jEHVssO5bJLjUUbQq0S8Dowl/9W2fEUz/1uIfggm18HCBBvwPu2Yomkr9Z?=
 =?iso-8859-1?Q?6U2ImZLDT5KIzscrjRhFGIcE78kr9xYNjK6ruNyuO1kSJiYnYnHZRrb4o7?=
 =?iso-8859-1?Q?I3oZPollibSX+/HFxA2x+srKxZPBw+yC4Vc8hGWhgvpt3DiSMVJZmWu2dr?=
 =?iso-8859-1?Q?RMNDZQtRqL47F8ooZ52VG1M9WnJ2UQZd+Ddwb6qZA18joDNbL61vYyFz0k?=
 =?iso-8859-1?Q?fbO3vvs5Sr9laFAB0tsKbwU6ot0HaEhscZvXXuGLQsUafRKkvrMNNuCtGC?=
 =?iso-8859-1?Q?C+j4Km7hw66ks3zfHXWELnp7NlijQ4mwV94praOBfRrXK8CkyfricvO9DF?=
 =?iso-8859-1?Q?mhFzDF77NkcTM/yaS00oncaBc8fM310xDbHaGwTQ9+n9jKHXX/8Ml7x3cU?=
 =?iso-8859-1?Q?/+wyj30oT19RKFjdKe6/hgRdE1gTgLecdgHc8JJtV9kwSdf8ko++0kgl5P?=
 =?iso-8859-1?Q?mGltsuSOvpSqZStP4mJNsIsr+0wjCmZRG8kR/q7yZtvnt8dJPU5su73TDD?=
 =?iso-8859-1?Q?AUsaHu3UfsupFF+MhxAXdI9N3qKeMJIgROzWCH89+brZ3fNufdk07faLhk?=
 =?iso-8859-1?Q?xP/WxfkKacbREjp4k23brrFyMLpGF6SNZm2OdmspVhXG9X1xk1LUemjt5c?=
 =?iso-8859-1?Q?WWMbdT+TqSO8sblSmtspx9fwOMTnweYnb6OZeTp0GTFynJxkVzxGKOUZ6L?=
 =?iso-8859-1?Q?c8rAbkXc+YpePScXz6/NcEFfoDYTrDdsThAAOA3UI30LQZEtXGPoVoEdYV?=
 =?iso-8859-1?Q?1FKHS6ZgN0205AIYSUvVvUCLTHcq62DHx4Q9/5SOwbA6tdeWdxUvIQ+8zq?=
 =?iso-8859-1?Q?kz5iIcmYYscyLBRPjBEgHiLB32OqVf8nBRMZSTpHr87OSU8QpOzinFiJ9p?=
 =?iso-8859-1?Q?KumBrqtSKxXBtIDmi+e+fIsKEQRwKaM+lcUyLZ3AGQ9XpaK9S8WL6DixSB?=
 =?iso-8859-1?Q?vJC+5/vviDybtLIJf9FsaqiUr/V+ctK3p9SeBOdROXfoJtB7mBhEXIUWbN?=
 =?iso-8859-1?Q?FOOXwTCM0HiPy2xR8jJ7+HsHJ4fmaKb8DEVQZ9TG6egJ5WLVK1HBUxDO1Q?=
 =?iso-8859-1?Q?Gb21zwOccA6sVO3902V0hHZ5ydSed0MefzEAKU59JH624RZ7zjWoxxNZqg?=
 =?iso-8859-1?Q?32F7reTJTx79Y3XjWI4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f5167ae5-f732-41e0-29a8-08db844198d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 08:09:07.4839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZTqflkDkSPDcg3GBwkeVhgAeYL67RnKeNzSOP6R9HOXGFzgJ/wYnTEn7TlsFJ5RpkWbZOfnrnYvd5v+q7MP9pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB0937
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Si0XVqdmTNxFWJj6mMA3silNUkxVq5WvxF2YXt/fPBs=;
 b=1kx8yhVrsoFKCfE5pMDm8/r2JxStVRZBIaRUdNoeIysT9clm1f4Bvk4pk8GghukM9yfrjMSsh5f8yUcArf/j6uLAEdE8XJwO7mbxy0eDUvgGfR2UK6O/wZt+gCdEtpWuzQuHII0fzH65H8/MOBxO0vy0ofO/3lq2gvcyChitix0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=1kx8yhVr
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH] DEVELOPERS: update entry for Daniel Lang
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
Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 DEVELOPERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0918e9f721..32d0a5d0ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -649,7 +649,7 @@ F:  package/odroidc2-firmware/
 N:      Daniel J. Leach <dleach@belcan.com>
 F:      package/dacapo/
 
-N:     Daniel Lang <d.lang@abatec.at>
+N:     Daniel Lang <dalang@gmx.at>
 F:      package/atkmm/
 F:      package/atkmm2_28/
 F:      package/cairomm/
@@ -663,6 +663,7 @@ F:  package/libsigc2/
 F:      package/paho-mqtt-cpp/
 F:      package/pangomm/
 F:      package/pangomm2_46/
+F:     package/sam-ba
 
 N:      Damien Lanson <damien@kal-host.com>
 F:      package/libvdpau/
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
