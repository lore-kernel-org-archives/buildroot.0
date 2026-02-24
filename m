Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A09F4BB82
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 19:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBB9F81DE3;
	Tue, 24 Feb 2026 19:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6Zec3in40WJ; Tue, 24 Feb 2026 19:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C10BB81D11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771962702;
	bh=VbWnf3bo3TpJEMHR5JfYxF6wFE/hKCwjLIzoIeH+aPM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ABOiKRpex2GOM6GBRZuX19VtpvoDUaEDXRqmy87HTGnz7PZnnCzNI2OkiGUkiqwa+
	 OuX17U33mwxUX1jDxmtkz8Yw7EQtT8lW9M04LsKgUmrrb0JLPz8I+vFZM+TOkBAi78
	 PUCG4YTYXVSOBZd5HYVq7Ev4O4zd6Qx7Abkt+hX7+wjlA2phoZvQU1eoDVJ5rTBkLW
	 nKL+rO+59oDn5yzKb9wDiX6DolPpYocMZZPTO5HqkEnXlTKV7O4jtIBgfk8pT5iQUq
	 DEHGNSw066hvJP70k8x2F2p66tfvzVbqYd4omhdp/TKY2jf6Ffv0ENccnmVlfGHz+h
	 NLrepTgcwJP2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C10BB81D11;
	Tue, 24 Feb 2026 19:51:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC2E2204
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 19:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1BA3421AB
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 19:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xKQ_ed3-csl for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 19:51:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c40d::2;
 helo=sy2pr01cu004.outbound.protection.outlook.com;
 envelope-from=afshin.pir@gallagher.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5418E41774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5418E41774
Received: from SY2PR01CU004.outbound.protection.outlook.com
 (mail-australiaeastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40d::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5418E41774
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 19:51:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDqj76QM4XJtnpMhfKyZI8p6fp6KcNFzjPTEKDcWK2PlprF0gJ6mFkW6ZFQ9MH9QBV6n/FW7fGrVc+Af7CriCGz8DvMKpyesarlP8pC8miRghFWdG5/3RvyZ4AKZ8j/ndp+x07XnKgFoPhQgscUsVHhprAO3s08ZkHOMopgT6wBx6/T2NmSYjmuAHBbPww1m+j9FgtXgR7d97jsCiMhobbbBEqwHLc1U+HkK/WgtLBEDtb8RVKqnZBQppLU3sO8Bxxo8+X6VxcoWEzhtxU8CGUKQk9xHiQNv7h9PPCQ905n4GMGwEgnGiLO2TjwgWRxmCguHrR3ofwJ7sQsbIsw0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qA6i7y657do+yrIATkMLN1ek8VSFLwCQtFv63+5/72Q=;
 b=qCNzjnsYn2lgb2TFBNESKmIfYrgYimUEUUEIRPTmA4yy8OmkWnu5y5JMtFW5Yib2dy0M4/YAhM4dQ5XBa3mJBpm6JWsQRS3UbioHOm3CA1WBlEkP+OYJ+StfJIcBElwHnlmAFE+pgsGtMToKgtLQCc0hB/Rg6Tbe9uh8jJq6rg6HI2CjZ/dprarOFwJjtzxx7gHtWfu9n7PbH38S7iqV4wfDNolZEaEZPUzg5ahTLLHgXASnTzz/k1tvh1KMVvz3LnUYsppooGy0vSJy/wvApjYwldO2sZeR0aieIstX6mGP69Hp3nvr+RLIHQZ8vhGvBvg6QxWiBCS8KAE+XwjwjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 13.210.31.177) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=gallagher.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=gallagher.com; dkim=none (message not signed); arc=none (0)
Received: from TYWP286CA0005.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:178::23)
 by SY7PR01MB9809.ausprd01.prod.outlook.com (2603:10c6:10:304::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Tue, 24 Feb
 2026 19:51:30 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:400:178:cafe::2b) by TYWP286CA0005.outlook.office365.com
 (2603:1096:400:178::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Tue,
 24 Feb 2026 19:51:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 13.210.31.177) smtp.mailfrom=gallagher.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gallagher.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gallagher.com discourages use of 13.210.31.177 as permitted sender)
Received: from smtp.au1.defend.egress.com (13.210.31.177) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 19:51:27 +0000
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (ip-10-241-245-76.ap-southeast-2.compute.internal [10.241.245.76])
 by smtp1.au1.defend.egress.com (Haraka) with ESMTPS id
 2BF94E9F-4BA6-4F23-8D76-0329233DDADB.1
 envelope-from <Afshin.Pir@gallagher.com>
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256;
 Tue, 24 Feb 2026 19:51:26 +0000
Received: from SYAPR01MB2784.ausprd01.prod.outlook.com (2603:10c6:1:9::17) by
 ME3PR01MB5893.ausprd01.prod.outlook.com (2603:10c6:220:db::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.23; Tue, 24 Feb 2026 19:51:23 +0000
Received: from SYAPR01MB2784.ausprd01.prod.outlook.com
 ([fe80::e41f:4450:6ff0:71e0]) by SYAPR01MB2784.ausprd01.prod.outlook.com
 ([fe80::e41f:4450:6ff0:71e0%4]) with mapi id 15.20.9632.015; Tue, 24 Feb 2026
 19:51:23 +0000
From: Afshin Pir <Afshin.Pir@gallagher.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Cargo package dependencies for local package
Thread-Index: Adylxa8Etpm6haWLQBCvWAfgY2guqQ==
Date: Tue, 24 Feb 2026 19:51:21 +0000
Message-ID: <SYAPR01MB2784705D867B9F21DE6958119474A@SYAPR01MB2784.ausprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gallagher.com;
x-ms-traffictypediagnostic: SYAPR01MB2784:EE_|ME3PR01MB5893:EE_|TY2PEPF0000AB86:EE_|SY7PR01MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd8493e-d06a-4cf3-459d-08de73de199f
x-egress-defend-domain: gallagher.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?TXHQ9q/F/PRJpkfKckyh/kYUNdijXQ7ILsbEcpILNmlREncaUw9X2Ob94IZX?=
 =?us-ascii?Q?Gn6s2NPTKHR0y74f0CvZy9WMKKRHaXKBOrU4cPJ7IPIj7gr2iMDKjfZVkbMa?=
 =?us-ascii?Q?BB5MXP/txgNYfAQjp3pf+xoj2rrj05gab2rf2cxpVbb/OOY/fgcn4PyRZ2te?=
 =?us-ascii?Q?hsZNaQ+ac9ixF47FOIURWPwuxmwFivU8qy3V880jn0cXy1Ooh59HDmRBOiGa?=
 =?us-ascii?Q?kTHkT9yJySvsGP36qXPpiok/WHH9EYtmIlfG55IaYGIPk2g+mkytnZseAYb7?=
 =?us-ascii?Q?+xAf8OfjwusodHNV1frLFCDXxStEXwARfViYMJLM/KircXOffYeYCP1pxh8E?=
 =?us-ascii?Q?FNfID9pd6V2tSkxP48opVBgHxT9/xxHV6a2aG/CRQFpxj1h8kFxEtRzH5QWF?=
 =?us-ascii?Q?6ScAfq7yoQBjVP6/irRf6AZJF1wNDNwrQcOlPRcEizInAtv5OFRRiQsvdD5s?=
 =?us-ascii?Q?dLPgFLdbUkK5sOHzUIyiX/BkOcNMpTIw4o292x6pX9OXgu6f2x2gXmA4jlGK?=
 =?us-ascii?Q?fXCVihekAeMaNR3qYYkhv9BDIICt8Z8RzsgBqPjUE+KGmsv0WpWJl2/DVFXN?=
 =?us-ascii?Q?a1wyGDKLwrhxQNxKFql5IqXDWoJDc8WUPSR7wS8acyKKllVZx+3obJ23UB6p?=
 =?us-ascii?Q?I0WkfaE/IjgmN3TwFE/TuH9nAGeLu+7ITrLd8erAMgtVobwO5Fss1CRmo8D9?=
 =?us-ascii?Q?kN2alX5raF9Sv8h3eNVZDD2rSJMaovVSo2zxcu8BIc44kiiwkQwijeuz2iYm?=
 =?us-ascii?Q?zDYhoQ0EQV+VgoqtkxP1MDT/F3N2Q8kMCOn/lm5QutedNmB+MoF8W7GX2BkG?=
 =?us-ascii?Q?dR+ge6aBirp9r2+b2kw/KnI6thfRiFpLa/JAqh+HKtFBuu+hBUwsrk1ogUGK?=
 =?us-ascii?Q?TiKYm+dSJrt+1mMQ51rcNYYHH1NNg0go0tXLjEDw53EpWFRmYdJEJ5ezXwUx?=
 =?us-ascii?Q?nLGF+3/igMAnkBAObZeiOlUZY8bwk2CZCGaEduKNL9RPhMTaDZgowXokSoUV?=
 =?us-ascii?Q?uvP+XaI1XFkxRFzL8kX2HmkJq/KPS5H3/bPOSLtTQekiwZPCTQGrSIYEAaXE?=
 =?us-ascii?Q?EMnUnJBu2hXWi2A28MwNLHlDLrwC+ye8+dlBi7HYxHPtf1JFUcEZUQGlYQbd?=
 =?us-ascii?Q?HIMXte+QODXiFQyzvjiZZLvfn2JG4LmXZXMq6zzYVIn8Iw2+70QkpLuAirHY?=
 =?us-ascii?Q?vkzLD4sQp3vgErOVhZk85WOU0n74UfaVtYC9kz3CSofX0VYNv7yJI3mFSn1E?=
 =?us-ascii?Q?bVqQFNwaE/elX5jia13hStlxDH2YOZZVGj2U6enI6wfdCPfhTWhLy/JHtb51?=
 =?us-ascii?Q?vqeHGEyxTsd/U3JHtSxCac4tyTRuo4FC3nb9u0EombNudugdmityAe0frTEB?=
 =?us-ascii?Q?O6DewdGJLnfznrOLlbCW+PutcZRP1PkEzSQH5+iqkzmEaNaPUqBnFutFs5fk?=
 =?us-ascii?Q?0ToxDLIt+XIrX5FHSt8WdbOOesgl5V+BQdkDMq50DoR3HrAImcLY58Gbsy6q?=
 =?us-ascii?Q?ky98IjCT13MkoSjNU4ZUjE7q5NVrdwyBxYnThNQAmaFZtU0LZpGlyiGHj+eO?=
 =?us-ascii?Q?3aWJTL330FJ2iwyEtk5bEJTY81xcd04vMyPYlejasAxPP2rnzVjK8hFO7VVK?=
 =?us-ascii?Q?0pTKAZ2iRhLhe/iiT/PHFvo=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SYAPR01MB2784.ausprd01.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(8096899003)(13003099007);
 DIR:OUT; SFP:1102; 
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3PR01MB5893
X-Ajax-SCL: 0
X-Egress-Defend-SCL: 0
X-Processed-By-Ajax: true
X-Processed-By-Egress-Defend: true
X-Sentry-Times-Processed-Count: 1
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 347464fe-9603-405e-e71d-08de73de1599
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|376014|82310400026|1800799024|35042699022|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CamVZ+V2+f2LSryG/Z7kPMAg+InMCtqUrmMsu8ssS/IJC5jYIcRsCXvsemIM?=
 =?us-ascii?Q?xFg/eFBSBLSgRaXWrwySh3dV22cByZvHRR3d5CGu5NYXJ+o0yNMVJfIgrhBE?=
 =?us-ascii?Q?0bfRRDkrohgvKFfp5Tiw7CIhp8So6lNWT+U/QLIsEcNOyofoS5MekXVvCUEd?=
 =?us-ascii?Q?10/GDRzZAW1JBCbNjYctTG7Fqsl9ja8aj31LPeXdhnPNcz/fIG0MIdoBhP5/?=
 =?us-ascii?Q?QirKChGER5oQYolqhDiPsAWMojDIaixHBX2nqo+zJIKFTiuaZ4lKUvR7cz9d?=
 =?us-ascii?Q?4QgBPHHlYRxu+fDcZ6kHXGKuk9aRS0oLXx/iXRPEwD/hk0yAaK3zRmmrlsyo?=
 =?us-ascii?Q?qMO68wB/EfnBuM9JTHQc+QhWnttpzENZWrobM82bguoXvuJdxJkdPpL2zCii?=
 =?us-ascii?Q?Va/nJIazR6fQcxKogeXa/mDxKbPSei2K4PJIqFZhiyMi/+vGdHsOX+kI6ShE?=
 =?us-ascii?Q?3yimmzXLC8RPnrDtIkCF49KJcCSzorP2MvnrWOzaV3CYiLw1AGxXRNk4pMwG?=
 =?us-ascii?Q?YOc9tLE1wqg1vlfts+ZMnBSsb2MN1AixXJm0C8FLwEsI3ItfTqTt9sldr9q0?=
 =?us-ascii?Q?84wbhRsF+jE95IFsjG2FuRKQzbCR5GS3xHE04VV5APloN+HSXmf9yUSOcPLw?=
 =?us-ascii?Q?FMJTwhUlw0C/NZKaT9GckvJb0rSZpokHwkotBuo91z/IHPieA6aDsjex2wIG?=
 =?us-ascii?Q?cXvStbNq0jncnPd9JrMsUzhESyTKvI4gvj4cPM5cK4uVjRgUx+TDYc95P8gM?=
 =?us-ascii?Q?t2AhxfRyxJD0YppWK1D815AFVgf+gbwYMJQl5WQCGoGqXa4H0Auv+TYr1G5e?=
 =?us-ascii?Q?/zk8fN+LNSU8WfM5tn1qiXph6QKWTykJdRq7LXGHJ6LDVVkVqQADlQ1N/ef5?=
 =?us-ascii?Q?wrpX6fMBth/nqhjNkftUVxGo4/qEg3eGd4IuS98Q+zOalY8XGm/F375Fif6S?=
 =?us-ascii?Q?VllA4XX0iUap1yOkGugFEhjLcBKy8B1fZgvCO1ME4dSzP4A8dM7dODiXuARV?=
 =?us-ascii?Q?/0yRhcgy6UQZ9i+XH/Ef4UUQKX8JEGF/J5Tgtpo5PH/PtiuLR5sfSgHo5LiT?=
 =?us-ascii?Q?t+k3gISwMvxSsTQrz8M7LnaxkXbgugHo1zLYz9my7Dp5QELf28X6UI1EjjIz?=
 =?us-ascii?Q?9eITh0A1KNU7l0Gw48bTCyh4Tb1AgNCGw4jxMefRBYB2MAbKjIEbdt9LSjGU?=
 =?us-ascii?Q?r4S30LF18AaO6v7ME7BV8gksOIp9gBwENlXg2F7afDwchPCIOC+hXWU+oUCv?=
 =?us-ascii?Q?/6xPSDjKgej3t+uNUxSrpQae1wsp8Orq/Ht+0TqlXKkZ+E3lSZ4EwyPqoEGd?=
 =?us-ascii?Q?isbx6kwwdaymh8WrSV5M7RURnOGNEEmEzONQ/lrRnBFdmbSpPDpZ+XaBgPkZ?=
 =?us-ascii?Q?b0C9yWj4weT4DufZafl14P5MOg2rU5SUQleC8VnL9CuRO0E60TypaKgBFFGw?=
 =?us-ascii?Q?GhI9nosqSOA4u8RbfR/QKWnwAI3i5ySeBdLmSCYPWDsrN6ljCz+9KVEA9ezk?=
 =?us-ascii?Q?0HPlaH5aoaTJO0mIREV4hwztD0Zhzm20Oh11Lp4AghWayOqLZautA1OtIaJB?=
 =?us-ascii?Q?Vstv9GszmA1XvojQJXby+iTHrZ6t1v2LYiBcqeFB6QdyNh7+p+noc97WsFAF?=
 =?us-ascii?Q?VDwZzuTTkjDco11UC3O4FAHcGtXVMQXAFHki9KFNS7XU3bQ1ZcG2g+Kh1eRP?=
 =?us-ascii?Q?+hlStw=3D=3D?=
X-Forefront-Antispam-Report: CIP:13.210.31.177; CTRY:AU; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:smtp.au1.defend.egress.com;
 PTR:smtp.au1.defend.egress.com; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(376014)(82310400026)(1800799024)(35042699022)(8096899003)(13003099007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SrlpUnt+ta7SjkopmDauI0aH9rqGHTPWe8iFL+IFUT4YlNcu+4Y3zKbBlfAN7klbAJTgHBSkAcqjj/VFF/a7uQtORAo/zNYWiAywO6kGfSlhV/c/yK82q3EgNz1B1ONXiqR3VA39Zbodi8ugngGOS8G882CFN2KtHVPhBgbqrQhqWO8uLuMDCKiG59Vtgom91brdckK8zgkRiaCZ1wyvHE3QEvfSFQtRF9a56n9G0KwiXQZLJoUpysbMeyGs1OZTIXd21yFFpMqfaLQCVe15sAE2cAToyLMxpGZ/Rsvge2Tmqy5JrZaFgGPZKRz25s6RJv/C5ZEqB8BNazNnPdlwYYi1lFXd/JtmDa1HEHUVgSW8KgW+klG80JWPjIZYIx2/VX0hwEQrWO0aNP6QEg4wx0a4WQ4vQDQevw9yFWtctAWejLadmf/uOFIg6QnYZd84
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 19:51:27.9083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd8493e-d06a-4cf3-459d-08de73de199f
X-MS-Exchange-CrossTenant-Id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=2156b869-431f-4815-b2ce-b4893b5c9aaa; Ip=[13.210.31.177];
 Helo=[smtp.au1.defend.egress.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7PR01MB9809
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gallagher.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qA6i7y657do+yrIATkMLN1ek8VSFLwCQtFv63+5/72Q=;
 b=RU2TIjUcIlyiIZo/3ZQ5UBoC6NoKGbl0xZufRLRdHOXB9Lbd4KWF9XjUILw3I829e1LZf0Dh27pOQFTP2vGQLXaz1jxjnpPVNDZIm3iF2SVzxrrAoN0TDd2Yh7/W3gqEe9zn07oaAqv5fLWt5ukjlG7EvqyKhJwz29fVJn0PlXPFg7YHpPDC5sfDmQyCOjTre9gaAWE5uEFohjSkOrkgG9I6fdYLXnLJ0defETcQFWaMCMmH3ayXLdc505ygF5xqCBXaKwdxllZsmDHDvycHETebVNzKhVBl5MPOOETHttqmCXLhdWngebI+5Fb6NbIdWDDozeNJYQZfDVJv+ryDtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gallagher.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gallagher.com header.i=@gallagher.com
 header.a=rsa-sha256 header.s=selector2 header.b=RU2TIjUc
Subject: [Buildroot] Cargo package dependencies for local package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8324005721561126165=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8324005721561126165==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SYAPR01MB2784705D867B9F21DE6958119474ASYAPR01MB2784ausp_"

--_000_SYAPR01MB2784705D867B9F21DE6958119474ASYAPR01MB2784ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

When we have a cargo package in the buildroot, it tries to download package=
 dependency as a part of post download process. This is normally fine until=
 you want to use a local package. If your site method is 'local', post down=
load process will not happen and as a result, your package dependencies wil=
l not be downloaded, and you will not be able to build any cargo package.
I have reported this issue for this problem as well: https://gitlab.com/bui=
ldroot.org/buildroot/-/issues/162

Does anyone have a workaround for this problem?

Regards
________________________________
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents in any way. The views expressed in thi=
s email may not be those of Gallagher Group Ltd or subsidiary companies the=
reof.
________________________________

--_000_SYAPR01MB2784705D867B9F21DE6958119474ASYAPR01MB2784ausp_
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-NZ" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">When we have a cargo package in=
 the buildroot, it tries to download package dependency as a part of post d=
ownload process. This is normally fine until you want to use a local packag=
e. If your site method is =E2=80=98local=E2=80=99, post
 download process will not happen and as a result, your package dependencie=
s will not be downloaded, and you will not be able to build any cargo packa=
ge.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have reported this issue for =
this problem as well:
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/issues/162">https:/=
/gitlab.com/buildroot.org/buildroot/-/issues/162</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Does anyone have a workaround f=
or this problem?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards<o:p></o:p></span></p>
</div>
<hr>
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents
 in any way. The views expressed in this email may not be those of Gallaghe=
r Group Ltd or subsidiary companies thereof.
<hr>


</body></html>=

--_000_SYAPR01MB2784705D867B9F21DE6958119474ASYAPR01MB2784ausp_--

--===============8324005721561126165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8324005721561126165==--
