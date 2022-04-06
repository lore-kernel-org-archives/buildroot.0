Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772D9C4332F
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 14:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 089518348C;
	Wed,  6 Apr 2022 14:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5g5UKdzBkRtI; Wed,  6 Apr 2022 14:52:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2598183437;
	Wed,  6 Apr 2022 14:52:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 446C71BF300
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 14:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41F844046D
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 14:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=orolia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t4jNm2OQERIT for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 14:52:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::61c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFA5A40424
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 14:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgwRDxM6RNHbq0pAV8rO+Qc73f9aV31s1KQtMtT43ApJCDHLCE83vIdjNx0/0AfFoAscxHHdaayRvYhC2cmQxoX+VCCXvZSwL3uZPHA2zk1mEYYHlmoRq3qLasq+VnVpCeVXzOuQbVAXNZuW7+strMGpSFK4/MlstPS5Nxo9j05LKLP5G+Pj3trYpFj5ViJPIQ06tUFaaLarzy4F+QWOqwY+Ijc/hIMlK9WoMtxTeakQxXxtsolAST6nxj41F5NzzP1wjDELTglqN/g6TIJxh23J6cfcAbwuDF+nJaBjX7Vszf5TEPaOe0B2nGosC0X87648Z5LmQmylL7MMcco86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5fh5gsXb9zHChTp7um72RDlSf+s52CrBJjy3DNBgRE=;
 b=Wjj94bgC6lwNbazPfS4CzB5DGvr4Ii7IaJUGkAYzczi5qYfdD24sY2EELZT04beAjrjccJfPy1npAusX/porc7uLyofktU4f/ejFlYEg1IhaTw6ONaX3SrOgkC+3wibLR+SayojLs/6KId+jD8wKyj20mtidqlnLZxDgB2DsFCPp1d58iS39tyZ1oqJXkT8u8AF14uLr83M1Fqmt6Y/BACD83/Z8Afm2HPeytHeVrr1QdC6khhlFne6yb6NvkcR5IOIfUSnBZlXHUGByDa5Zqm2xG29QSgb35c6YyMfOaJ+t1BN+r727cS7Qqu71rNnxh2Q/0h3YGia7GxQMEKy32w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5fh5gsXb9zHChTp7um72RDlSf+s52CrBJjy3DNBgRE=;
 b=EmYw+Y6tFvSF5dFKS/7MxdfzpV21XhvawjyVdyW2alyT6oQfGULexubAiifqY9JtFb8C4+LasBn1RkyfIExMI/Wfgzb8q7C5mlrXIUGT5+Bc4RjF5iRoSTws0Vlt2sVr9HAKOMjUSHkVAaY8PodnheCZLuhQhrQqhA+HddPnbOE=
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3a4::16)
 by AM9P251MB0095.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:413::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 14:52:25 +0000
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::bd71:8465:bc3:b72e]) by DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::bd71:8465:bc3:b72e%6]) with mapi id 15.20.5144.019; Wed, 6 Apr 2022
 14:52:25 +0000
From: Tim Hammer <Tim.Hammer@orolia.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/dhcp: build internal bind tool gen for host
 (not target)
Thread-Index: AdhJrbRozWEI9erQT42w0I9BpK8kyA==
Date: Wed, 6 Apr 2022 14:52:25 +0000
Message-ID: <DU0P251MB07797CAAE80C985DC8976335E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22c330a1-6f36-48cd-f087-08da17dd1068
x-ms-traffictypediagnostic: AM9P251MB0095:EE_
x-microsoft-antispam-prvs: <AM9P251MB0095761C877A11D4AB1C1EC7E3E79@AM9P251MB0095.EURP251.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eBP2gUTKATQVYJFsszIqV00NN29DXwM1Dszx13jIClz+lkV8zkZjA4hS7v8BFvxRwB0VPtaP0nwUZKfN1pHRya514lyHYGVNoM52qMJK24DPxUrSv+FwhoDlmlmYIjVS7MDQ6Ufw8wwIbmSXQrx+ktsG2FeRYOxgGzDwWFG3JtaqulJJnYLyd9qxIcS7wQESSCVLW4DowevJ30xK6rh87d/Js4A/LyioN8KORPb0wKbE2x04fD8I/KLmowey2fNlZEK6POw8qmIyH38YlBIoNy4qMGrBDBGaF5LlZUFn7RDFHoOTbCOXJwAQLHDGm7ps/SsZxv9k94GSJVQizxq+HmLkd/W4WeMRX1vggqS7u7BSEsRyvTmzw8LfrsFpfw/6hU3PL9WyP5ID/arnF54q7t7ft0IcknT6t8iuyF2O8b5HuPJNr02HmMPWn7F7CN5vknO54Chl/BSbMaes6bjsoN1SvM9tcn16gcuxUInPktc24agYz44jbYfYgWtw7Eni97zoBeZDW5pHH1aiaXn4HoqNulI4TJ3BVsmxpvKziGyol+GBUWIDDIfIwHt9DHpZNXYoXAP0qeQCKComeS6iaJd3W+MNxs0NTxrcqJiIGywipo36IaZ9SNgWl2A24O6yjMR1DllFjzY5MQdF6eptBT27pbtcmz9DSJ8z8/mz78iaN3lfU50T6li44z98AzvOYAY8jXUvu5bWm8ymVChAx24jrUWiDERl8gXMfNg+d9POHri/xbAIR771gYDbpAt3LRHPkoALKwsw2oMCcmCYxz8c3BmLkHCrhmuEzWYirSs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0P251MB0779.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(71200400001)(508600001)(83380400001)(66476007)(64756008)(55016003)(33656002)(66946007)(8676002)(76116006)(66556008)(66446008)(52536014)(7696005)(6506007)(122000001)(6916009)(9686003)(966005)(86362001)(2906002)(38100700002)(316002)(8936002)(38070700005)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmtEejhtZGlRbXcyVk1obEtxSThod001ajBCaVBiWmVWV1d6UGFtMldUY3g2?=
 =?utf-8?B?aWVDQjNkUFNZaWRQZ3h4eDV6Sjh6S1VhYkdvQzRJWEVOTDdpS0dQaGI0b3V3?=
 =?utf-8?B?MmlzaUx6MGpaUVlrRW9PTXUwa0xzR2xsM2VuZStSMFhyUDNwY25zdXcycWpW?=
 =?utf-8?B?dFlvaTF6RkFKcWtCUFkzVllSYTJZOGg1WU1PdkdHeFJVQllkbCs4dHk2MWow?=
 =?utf-8?B?TW1pQk9ONE5IRUJiUjNadGFxMTJxMythaFBPNlVwT3FWZHdJN212WHpaUlE5?=
 =?utf-8?B?aFNRSWVkcWZNYmdURmxxZWNYeTY4KzhJTm9EWFo3dVJvTUI4bVBpL2huelBL?=
 =?utf-8?B?ckFyQlUvRzFaQWZ5SGoyc2ZhcW00bXFNaUhTa1ZmUDVuQ3pMazYzVjZVNDZx?=
 =?utf-8?B?R2hDRURzUE83V29UdEkyZ1pIazJIeUJtTHdjWmtpTTBITjA2ZXoxOW94cHND?=
 =?utf-8?B?L2pDWHI4dk5VWjJFNmsxaGRXM2xTclVwQ2RBK1VSaUU2dzFMVDFleTl1QWxh?=
 =?utf-8?B?V1FaZThnMTQwWmZQblducnFoZVR5MEJORW52VWRMc2RWbmVMQzh2VmR2TGxZ?=
 =?utf-8?B?TG9oZ0w5N2RVYXkrZjM3elphY1ZqQ3pYUTF1T3hIbG5HdHFZVllkMTBzeGNr?=
 =?utf-8?B?YUJPQUJvK2pwd2oyNGhBZ01oSzgvWlloS0IzR2VHcEJOWmdMS3IrckVQdW9x?=
 =?utf-8?B?UVpicGpPdGhpOC9jWGpHcFM2aGR2VTFlcHM4ekt5bUtLT2x0SVMySWUwWGtP?=
 =?utf-8?B?cmUwWXE1YitwTUNETWRaNndqcWZtdzNpaDFqUVB4M2xjdHRYRVpWZk1YTFdn?=
 =?utf-8?B?UXVhSURPcGkvRnVRY2Fib1VmT2E1cDV1dGZIZXFkZTZEZWx3NFhzT01WeEZz?=
 =?utf-8?B?czI5Z0JpZTBieGJrKy9nVjNGVkdIZEliOXUwbmhFWVN2Ym4xSHY2TWIrT1dU?=
 =?utf-8?B?OG5hR0hrYTZiemc5N3JqdlJscTkvZitPWVd2SVcrRGZvRGxRK0crTlNYZkQy?=
 =?utf-8?B?TmV3b2liVFVIMXhQZ0hXeHUrUEZwVjNib2JENFZmYktIT0p3MG53Yi9PNW1a?=
 =?utf-8?B?ZWZUV29JR2pMc0FneEcvZDc0RVg0MUx6T1NrbCtmNlQyU0VLalhXTmF5SFNB?=
 =?utf-8?B?dkJpZDEwK1dsVVNHWWtCYXZiN3FLSFBjU1NHSjdsN2pUSFJhbkEwMjdpQ2Jj?=
 =?utf-8?B?UGlZNXVpMkdzdC93bEZ4dXhnRUhQRm5yZzhKOEt3S2h6WjF6a1paUTNjK1M2?=
 =?utf-8?B?Q2FDMllMbEx3UmtWYXlWYmw0ajVXUHJTa3NtdXo4Qi9nTWI3YkhVRkIzbjBu?=
 =?utf-8?B?MnBlK25lQUxPVnVQWE8rTmxQSmlzQTdUV0RRTWx6N3BlM1p4eU5MZ0hlamtB?=
 =?utf-8?B?bzJVcUVTV3RZQlZ4bUM3TllJU0pCY3FLb2V1RE9RYldKOTJLMHJUSTdPT0hx?=
 =?utf-8?B?R1NMbXZFRnZUelBQcEc2ZFNxK2IxRlR0eVZZRjluWWlSRFhXS3dHK05uVzdZ?=
 =?utf-8?B?M0VDRWMyMWlUcGc3Nnk2Z0t1NXAyQTcrT3c0dytOeTg2bjYzMFpKM2d1TG5D?=
 =?utf-8?B?VGFTdlRrWmZQM2ZmZVFnTFpRci9nWU55RkpQSEpmM1lRNHdtNkxDSndSbkIr?=
 =?utf-8?B?MEJzanRlWWhvTzdWMmgxU1BTK0lIT2xadEdWWCt4NjltOXkwY2lxQnFweTB4?=
 =?utf-8?B?MVd0c0E1ZVRteTlEQ2FURVl6SW1RbDBuVWlTVjJDZnU3N3AzRTllT0VTaUtn?=
 =?utf-8?B?T3lNSlRIWnZoWEJackVDdVdaMHlpMzRBNWpXNXFsckpJS2ltUXcyaE9UaWhM?=
 =?utf-8?B?WUhmRzV4QXFkMGh5TG5YR0Q5U093TVV4clptd3plQkQ4VUJBejN0bjgzSkJs?=
 =?utf-8?B?R0ovbzV1QjI1TndVaTdmbzlBRmQ1UFJ5MzJla0dhWDc3N1hXci9YaGRPc3Fa?=
 =?utf-8?B?eDhTckpZTVFoNnVYZjBwOCtMaGJsbjZtRzBPcDFvSVh5djhETHNzeTBJRTUr?=
 =?utf-8?B?ZDh3aU5ZWGpheWlFa0xOczFpNUNFNFZJMzRrSlRORzNSMHQ5c1BtTWhNNlhr?=
 =?utf-8?B?TTdnOHZSNTJNVGswVmpoYU40Q1VlWnJhQnhKYnR6OENHSmZPeTdHakRUcUhY?=
 =?utf-8?B?VFNWQ3ptT2FNTTN2Vm1sT2JDVklzdUpJcldFMSswa3JWVHRoNEowRkxCNytn?=
 =?utf-8?B?b3lqbmVRditPcTN4UUN4dHk1cUhrQy9OVnJHQ1drTkxtbjlZKy9rNExDSk5u?=
 =?utf-8?B?Vi94aUkvNTF1RTRoMVRtL29KS0E1cEwyY25iR09kUnd4MGgxYUNEbFFCTFAx?=
 =?utf-8?B?Z21rRnVMUnMwUmRrQnJlWWJhakFkTFJEMjR4N1AyWmlCcWRxNjczNllMQ3FM?=
 =?utf-8?Q?s/frsy+Bxo7R84acJKIE84rASgCN054n3qNCxhXV22mhy?=
x-ms-exchange-antispam-messagedata-1: rQkSJKiNdxy91w==
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c330a1-6f36-48cd-f087-08da17dd1068
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 14:52:25.6089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0urcZEFYb9LvFxmbHMTgYXwosKa021n/YitEreHRxgg6WgI3uO58MfG+yhRla9Ju8WoM9+W8ZAtRWBCduG3Niw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P251MB0095
Subject: [Buildroot] [PATCH 1/1] package/dhcp: build internal bind tool gen
 for host (not target)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building gen tool of the internal (bundled) bind needs to be for host, not target
Switch to use internal build in commit 0c8dd6ebd656e06cf99a63eb93343715f4853503
overlooked this.

Building dns library in /home/autobuild/autobuild/instance-13/output-1/build/dhcp-4.4.2-P1/bind/bind-9.11.14/lib/dns
/bin/sh: line 1: ./gen: cannot execute binary file: Exec format error

Fixes:
 - http://autobuild.buildroot.org/results/da6fd904d1a6bae73b6ff89dd008de1f459bb7d7/
---
 package/dhcp/dhcp.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index f1e3c22f1c..2faea48c46 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -23,7 +23,11 @@ DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
 	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
-DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(TARGET_CC)'
+
+DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(HOSTCC)'
+DHCP_BIND_EXTRA_CONFIG += BUILD_CFLAGS='$(HOST_CFLAGS)'
+DHCP_BIND_EXTRA_CONFIG += BUILD_CPPFLAGS='$(HOST_CPPFLAGS)'
+DHCP_BIND_EXTRA_CONFIG += BUILD_LDFLAGS='$(HOST_LDFLAGS)'
 
 DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
 
-- 
2.25.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
