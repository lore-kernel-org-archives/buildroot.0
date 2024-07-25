Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4589DC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 13:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB8D6605FD;
	Thu, 25 Jul 2024 13:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhOTfuTP7vt9; Thu, 25 Jul 2024 13:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7DE360607
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7DE360607;
	Thu, 25 Jul 2024 13:14:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7004C1BF409
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 13:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DFDF80F26
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 13:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dApq64ES1yWy for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 13:14:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.158.9;
 helo=mx0b-00230701.pphosted.com; envelope-from=alexey.brodkin@synopsys.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C98E80C85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C98E80C85
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C98E80C85
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 13:14:44 +0000 (UTC)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PC5Joh007541;
 Thu, 25 Jul 2024 06:14:41 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 40jfg0am3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jul 2024 06:14:40 -0700 (PDT)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AB4CC40407;
 Thu, 25 Jul 2024 13:14:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 402A1A00E8;
 Thu, 25 Jul 2024 13:14:38 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id A694E40352;
 Thu, 25 Jul 2024 13:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLnsmrab2CRByNVThCAg+vnjLjTUgMRG6gw3RF8N+4Fi5Gr1V3G0t9qsNexhyKOHGq8ZKqTpzno7/TSUAumeCpGZc/+gLZZIE129Gp05gGIYUnqHZIPF+BIJpoX5hJexd00FM7umorvRiY9AA2g1f2QXAe1PZbj96R7xOHeVJ3lsT4C14+SSiLHlfLTL3MfDX2okv03uB1L9M3ePMwUBH7cx0q4tlLbHBiqd9Jj/lJbAsDrSZsHqTYvp+kXRMpmHIxUHCpPx13zdAqVKFk8aWBzn1Xb02G7nYhdKcqdBGGU0bb4MCdOPIZZYhZUTRbBEHM6iXVcRIb02reZjz8tn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAAFvEn1F2EqwuFV9GE3TAFbBA7M5f9JEFdaaMGwpUk=;
 b=DxyH02zi1hnaOOq9fUZvNFcE0v48798OW1TbVrhmp+4d5wi1T4JlfMnBmyB/ZypYoVuyM5qcH2bWH/BJVXIlvcRHtCbHnixqBQeZJ12gt8BF7M9O5mE7srcLzB9/vYzPHs7Q2R61vtaEboVPwUh9WzsThCWQU6vg+beup/veCf5PwYxADxAXglAr9knSWloDVXYZIwbAQIrK/c3LGOkB2+cKOg3D6bPvD5z4CsoV/sS/B49OIQhSjijM60EGCmwALewVDwukyMLQqorKDWvhkWQ+LtFw7IC/4Lt1hc+16/cnDF8brt5sVef77vteVzfCWNpQ+HFItk+/ADBr/mu2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 CY5PR12MB6477.namprd12.prod.outlook.com (2603:10b6:930:36::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.29; Thu, 25 Jul 2024 13:14:34 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::a2c7:8816:1a71:6ff9]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::a2c7:8816:1a71:6ff9%4]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 13:14:34 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] Revert "package/crun: allow building
 with uClibc"
Thread-Index: AQHa3Hev1FV0FVxDbEaBIImaQKjy27IHbVB3
Date: Thu, 25 Jul 2024 13:14:34 +0000
Message-ID: <DS7PR12MB9041DFF9A4424622C07458F3A1AB2@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20240213210523.166319-1-fontaine.fabrice@gmail.com>
 <20240722224226.5c8a2235@windsurf>
In-Reply-To: <20240722224226.5c8a2235@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|CY5PR12MB6477:EE_
x-ms-office365-filtering-correlation-id: aa1b2c2c-ee4c-4c10-0c41-08dcacabba32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?2CTqLj8zyse6AhfftzSNwT9xH3GOgFbPXOagZofjwyIsACD2hx5rlaUNpJ?=
 =?iso-8859-1?Q?+B86kHgbC/SjeYvqoZaVjLmYQhXEqIFEz+Kfl9AgZnB79WdYO9EzJMA6oe?=
 =?iso-8859-1?Q?Eq5n7zm5EySMTTjFwr/Ws23VAPa7s8lfCmBYFiUrTk7Lv/knBRxgC7Mou4?=
 =?iso-8859-1?Q?JraOGXuoqM7kyZLeinQXDYpwakNoACdarc9Gg5NKe2DsWgjWOLv00z982F?=
 =?iso-8859-1?Q?x22aQDhzHSO4JXzw6oDnh9G6qGpjlwAAy9+X8yKPR8E8QtMGxIicBka7HI?=
 =?iso-8859-1?Q?e3yr3/S+q4tt7Mv6wZINldCWpywVawPwAf7pAok0rG+fwtpbdKG0XuEQp3?=
 =?iso-8859-1?Q?7X8bJTVEYDB0v0Yabj7fZxg58DbP8hGjGhyqSChHmO/PvS9crm3TpGnoOX?=
 =?iso-8859-1?Q?nWDt5hvisxZrfk6Ays6j6SjvW2kJXMQoBQv9AsywKQopOh1Rkq/sXnjBKq?=
 =?iso-8859-1?Q?GoGnVxYJ6AoMR6ZqUN8HylYCP4mnLibdROEMG2qRmQIGcnIv9rV0pNkc7t?=
 =?iso-8859-1?Q?jLO/BqW5y3XFhZrGyBE/r8vNonklADCk0HfHh4rbc4JxgXOegQ/M9uGj2W?=
 =?iso-8859-1?Q?idACCAXVYCEZNHf1TbEjo3lHqmO231TCQvH+nXX61DpO9dq1bf8bhzWEqV?=
 =?iso-8859-1?Q?Kr+wV1DHycltPzo841+X+ebVQYdJskPCNAZtAqA2VN2nsFKtxIKQM7pKiF?=
 =?iso-8859-1?Q?nbnNUvo8rEW/gjkUOWDca4fapb5HoQYavdZ5QxiDQmj/4KLg2xu9pWva8R?=
 =?iso-8859-1?Q?qTHacXUs9G2Q/ljRXBn2zK3RDaVkXU5CYZXaAgMDh4E5lnSnQrd1wjhKZD?=
 =?iso-8859-1?Q?aK5j6vTjH0rFwl1FJaPK3icfWUdg+r8x2k7FoMt4+imAYVAapprkJkq5oC?=
 =?iso-8859-1?Q?tRBYMdlKnLTMXu3XqqZ6gRIgspfZSpt+2ezMSMq5I5wG+K+KNTZG3TKcNc?=
 =?iso-8859-1?Q?UU9PUr0vnTQBHhrsqOY/AQvlvbAqxtsvFBl8fCMSKbUsPmHG2mneD3N2A/?=
 =?iso-8859-1?Q?H3iOP7rG494ht/ZO31REmQ9qxfrPTBfy7vo4/s8IY1tdKK9Hob6dkJiU45?=
 =?iso-8859-1?Q?5RmiO99nJBrcVqMBqjFBr2qhplenV7GQSyZ/Ix3XuTdeWm+RPp7kFcRoKX?=
 =?iso-8859-1?Q?pupGwqAOTjrXwgUaY5je5GUyRPaW6JOUAhwldMR7Z/XeXsSkLJrMeEjkMu?=
 =?iso-8859-1?Q?qze/Q5ZO3qp0FilrxdYl2aMOlQkN2bToUtdOZ05E20wOc8fnz8Jouyc6Lr?=
 =?iso-8859-1?Q?GtZrVh6Vk0N8O5oSWy+xtCts6WfSMIV/K28uyzJwLVUa5lKTbIO+SwuRwf?=
 =?iso-8859-1?Q?YQB3OFJJe4h1cd7eeG5VYCqW0Cati/sufIm8galmBuCi6ViFpO/ulrxZq9?=
 =?iso-8859-1?Q?jUOeTUK/FI+Aw1pps8bQv1vMDkKp9FQ5NtKzIMltSkh9MAEsh8/RE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Adh0XNB7Nyy0ixiBhh59ULMZbs9zkwYggViLBeqjOLZ36gl3o2z08lKYoq?=
 =?iso-8859-1?Q?zqMv2QpHtDdOzlKkatKvgltaGTQC3nyp6OD6yFElhKzfYZRLHORKboE4TR?=
 =?iso-8859-1?Q?yWeLRejNX7gf8fEp3cRRKvgFd8Rj4YJD4uCyX3NeskiBB80WwJEqJXVC66?=
 =?iso-8859-1?Q?F+7SLVEtGynSc/LxvDhzDTH+E9K7CHXRF9o3SruLjSfpbRdoZc26+aRIhK?=
 =?iso-8859-1?Q?Al85oOgflSCJUfaW8hthVTB9MZeTrSEc/2dwjM4DDJidakJcj2tKi05Hcq?=
 =?iso-8859-1?Q?+AFqQKR0yh3VBiUq/cmr90OIVgtcaxTg4zlf2U465I913O/9/6AsWCrB4e?=
 =?iso-8859-1?Q?R08qd0tWPmJrncsl8mKguOCGZ+lnpZWZTbVrpGHSQ6OfISi/ASnRaZHvXi?=
 =?iso-8859-1?Q?RaTerB1GD8AsqRU0p31qlm0MgY4td+qZmBOwo10VyAgbKP89H6QV5hohyl?=
 =?iso-8859-1?Q?wBqNfiekfr36wXyZGWcVuFdV/XwFBiAFMZGkEp/9m1UzudPNOrxZjfERd1?=
 =?iso-8859-1?Q?xPWHhPMyXYgWYFMvhtCF/DZnn50IJSI0UTp9fQ93/a/qDYSxtnmmAoZXgs?=
 =?iso-8859-1?Q?26kFRRLGplOkCEnyWI6e6LAt8pIJVBEDMHJ3DN8cxH22ZBo9jrIiRc0e5q?=
 =?iso-8859-1?Q?wHyk8F7isVzFO5x8uPtfilDiYu26yLmyZgfXVVSn9yemCOafrC7putXqOX?=
 =?iso-8859-1?Q?6lIEZjfMoDfjG5YYPFy3OvXE60VbLuqH3Uc+XOgiqXUm5ky5C/6jLN0+KQ?=
 =?iso-8859-1?Q?oruXXQhx/+7ybv2Pz1zwHyRg++ylcG3EFkt2W8VWAtGG+w8N3ThNhCYX4t?=
 =?iso-8859-1?Q?Slmtoq0NXWxqdWetslOtBsfnZEUm1kcnpBy7Hm06rmVTrE327YUr87DxFp?=
 =?iso-8859-1?Q?G5cEjO9Fhn8pZaopYhFAr+rWK4yXGY3TCJCdwJHiaK8gkzlDgI3GfJlnIu?=
 =?iso-8859-1?Q?JfZY2Mtsi9Y5sBUgcRWXkfREAYcvOkFhG5HwxbSwfi8O67/QNe/2OfsS4Q?=
 =?iso-8859-1?Q?95YnzBgptRi01FGswmMBlq7Dz+HuJEhvTdssAhoQrsHjUuG17YH1aQJn55?=
 =?iso-8859-1?Q?YNv6TOIlX9RKlx/0ifrz8Ags4j73XUfQeZIRo+k7WOAG9Rea2/8Hf2luzm?=
 =?iso-8859-1?Q?fez7sBMnPf57rE3ZBApmWw2O7a/KmN5mcbZYVW5KbegFE0+v8d1ZUPCC94?=
 =?iso-8859-1?Q?NwCb6q4K2WzZgvXe7JzWtAZ7YXGHv9GsEnUNwf9vdsLe4sm8xOH0clfL2p?=
 =?iso-8859-1?Q?Yxk3MVDv4RRikrp7o3fzetAl+yubwUrtUbF3AopJzZacVPe8mnbFXghSWt?=
 =?iso-8859-1?Q?5APk67Ata3Kb7iX0pgcmybECbYwrDH5qXoLdxtqbqWAU5lF9r1NcbN4llf?=
 =?iso-8859-1?Q?vwGu0LQmy1oqfGci9X0XyW162paGOSE+AstdYyHxDpV8bWdOIlznGFyHLj?=
 =?iso-8859-1?Q?ukYKTOgPyOy0P0gaSOWdLIKQeZ1w9b8AB0cv547S4D3Dqx+KDGaA6cvoA0?=
 =?iso-8859-1?Q?9TUgo/uUfrFzKMyA2lfaruhVTr76zr61g+BKGHEKwnFvATT0uK+6CliJ9g?=
 =?iso-8859-1?Q?l16oqpltSuBZBurDg8/5merjOGVvTB9pX49c+GsoZXer6XzZwx1QvBatFI?=
 =?iso-8859-1?Q?xX7BCMZWh6KcFjaDIOrUp6SXluZxFqoNby?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fw1GFXPicGn+uIXukWRSgh7fM65ggeiNylCrFL3yxrWYYX8YNCSR2E2uop5grRLGkLPVneJVoK9RaBxcO2vQugGKR5VRsOwJHEqLPRJk7t4RPzO2zTO9id/8cpfqH5i0oOvhiaOlUHkwRQofm2+wRYXOrsnvs3phdVGmopZGayFmNBaolbI1mIW4eHJ7hqGFP+lT0wSYbxiKr0MrUnpubUhGWz46kHaQaH7wonecGWlj9iOMBs6iauWONQSb3awSfmgH/fSB2RDzoXbzXBKSQy1PkuFvLBTTK1NBLkxl5oMTxW/rTOWQ5u2QFSUhvXC+zK64O1sb1aQOQjNr8+O4sTwXhVHPXT1MFziWTLdvzDZwmMP1MJZ8n5q6ESscaNwR326GIOim1G/2EiaxBjOYbA5ZQ/bAhn1MjV+Jd9LXKafQCe274EVKl7vvD1JG0S/+tkcHvvbsSaNUvV/cMNg+yRV4jFIGj+bPhxwo8Y8RKpiYYLoNe/LbCHnhlIV3yRnHvm0c+5p7y6aejapFtSGd9xtx15iL0PBqf2RNfTrgte5x6l7dB7wn0WMkgzzMq0bS2coWMDK8q+M+zb3Pzxg0IDAThYG0SZX59Eqba+3bo8l0uRw3/XGjzQo4OPZuE5jst/bOGSRehAZEajoM1aGs5w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1b2c2c-ee4c-4c10-0c41-08dcacabba32
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2024 13:14:34.2907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PNe6kKToZFa9BOWJVMhix6ns8PTy5XtdYdhmTCNE3cdL84HeY1yNtW2cSgX57EMHhrPvzm/RXXshYij54qtjrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6477
X-Proofpoint-ORIG-GUID: VDBGqeZwvdIyS3szZpbCYYWH42SWNHP9
X-Proofpoint-GUID: VDBGqeZwvdIyS3szZpbCYYWH42SWNHP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_11,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 clxscore=1011 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407250090
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pfptdkimsnps;
 bh=qAAFvEn1F2EqwuFV9GE3TAFbBA7M5f9JEFdaaMGwpUk=; b=pJUhE+GlpPeJ
 6xhaeCwvjSVDlWhgBiDMTFzX9Yt7frbrFAbkj/1gCIqlE9cAl/XzinnG2c7z5W3m
 T+3IXY4zHku9i6g0i5RLwx3kSJTVGY2tD8/rcjFbix12dsvBnWIbUCaYdksfynSI
 1DCXKhpuDmDiJZAekfpmxDs4uRVxFuEtqPNMc635+f0niJ9zZCG+kkhd3+vUzIMM
 +OyBOpyHMrCOR4QRzQU2gC1+gsvE/ENxNEWkzy9GXcKbFlGbhpv4SPU1GF3NJ/vV
 tSOvqAp7gxPJLIPDV+1tF5+zR8kVAlEfKWEosYaOQhea7MXbXZbb/yqmq/MJRriK
 N1h/tm+eHQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1721913279; bh=oo5dhH5+S8TWyT4PVBn4gBV9vF3D8sYZhox/CE+b5sA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=E1lSW5wvmFS6Zs0Dd3SL0teGojhOsCbpSYYhbF9ug8EtwgtmFCbQtwPDXcfF8jNhv
 UO4tgAFC73m5hk459U48cLZPmwbV1HSEjbfQSXAXPutSWhjyR0fbzhfUeQGUpp8vDG
 qVT6GY/iU8Q7KFmo5QJ4pX18Fs5BsDAXVnrMwq10VRLO9jU/ctHyqzKpQWmt4Rsh2o
 EEhzOV62GR5gpQEssvMd9WF+URGoK3NH4Xy+ie3i0HLPebXFu0lDJol/IsAcEHiqP3
 0xNwfgbSSrk1zB0eemxsTxiWC9/Yk0hKRpJfG8EyLTfR8F4TwfQJC9oeyGibYCF9ls
 R4OLm5Kl5iH5w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAAFvEn1F2EqwuFV9GE3TAFbBA7M5f9JEFdaaMGwpUk=;
 b=DuS7AWwVx/nLYnHY5BdkCC3aL04brgqssljb3FlXvOr7z+9vNHnW1xf8/0m7UvRbZn8+/XJgoNjdiSQZkoDGaRz2od894ETE/wlklPfB4dAK6DM0A3Yes40JI8CTyD4D2cqFOHzRRiqs367Cu9zgQ/z0/M6JL4kRPUW0cDXUZNE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=synopsys.com
 header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps
 header.b=pJUhE+Gl; 
 dkim=pass (2048-bit key, unprotected) header.d=synopsys.com
 header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=E1lSW5wv; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=DuS7AWwV
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=DuS7AWwV; 
 dkim-atps=neutral
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/crun: allow building
 with uClibc"
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Yuriy Kolerov <Yuriy.Kolerov@synopsys.com>,
 Christian Stewart <christian@aperture.us>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Fabrice,

> +Alexey for ARC specific topic/question.
> 
> On Tue, 13 Feb 2024 22:05:23 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > This reverts commit 223596c75d73a7eb29152235d3c5d9bf53bd58f5 indeed
> > fexecve is only available since
> > https://github.com/wbx-github/uclibc-ng/commit/858ffad217076227089cc17eb832db0bd1497792
> > resulting in the following build failure with uclibc < 1.0.33:
> >
> > /home/thomas/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld: libcrun_testing.a(libcrun_testing_a-cloned_binary.o): in function `ensure_cloned_binary':
> > /home/thomas/autobuild/instance-3/output-1/build/crun-1.8.4/src/libcrun/cloned_binary.c:540: undefined reference to `fexecve'
> >
> > Fixes: 223596c75d73a7eb29152235d3c5d9bf53bd58f5
> >  - http://autobuild.buildroot.org/results/9c4488d5d26e575f39bcbaed8e0793ed1cdb8cd5/
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/crun/Config.in | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> I don't think this is the right fix. The issue is occurring here with
> the rather old Synopsys ARC toolchain, of which we're using version
> 2019.09. Turns out
> that https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/
> has much much newer versions available, so the right fix really would be to
> upgrade.

Indeed, makes no sense to mess with such an old toolchian.

> Alexey, do you think someone on your side could work on this? Unless
> Fabrice you're interested in having a look?

Sure, we're about to publish the most recent arc-2024.06 toolchain (planned for next week)
and as a part of that release process, we'll update Buildroot's version.

While we're at it though, may I kindly ask you to revisit my old patchset [1]
where I add ARCv3 ISA processors support? If there're no concerns regarding that stale
series, we'll rebase it on top of the current master and it will go nicely along with
arc-2024.06 release as we have ARCv3 support there together with the rest of ARC Classic cores.

[1] https://patchwork.ozlabs.org/project/buildroot/list/?series=389160

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
