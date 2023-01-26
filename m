Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B07EC05027
	for <buildroot@archiver.kernel.org>; Thu, 26 Jan 2023 16:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12AD160B1B;
	Thu, 26 Jan 2023 16:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12AD160B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EnXePocRH2HJ; Thu, 26 Jan 2023 16:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4DF260BCF;
	Thu, 26 Jan 2023 16:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4DF260BCF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1ECFA1BF46A
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 16:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBBA760BCF
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 16:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBBA760BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QmmK7TzafV3s for <buildroot@lists.busybox.net>;
 Thu, 26 Jan 2023 16:36:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B45B460B1B
Received: from mx-ginzinger.sigmacloud.services
 (mx-ginzinger.sigmacloud.services [185.154.235.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B45B460B1B
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 16:36:44 +0000 (UTC)
Received: from mail-he1eur04lp2059.outbound.protection.outlook.com
 ([104.47.13.59]:53234 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by mx-ginzinger.sigmacloud.services with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Stefan.Hager@ginzinger.com>) id 1pL5Er-0002A4-0r;
 Thu, 26 Jan 2023 17:36:37 +0100
Received: from AM6PR04CA0041.eurprd04.prod.outlook.com (2603:10a6:20b:f0::18)
 by VI1PR0602MB3806.eurprd06.prod.outlook.com (2603:10a6:803:1e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 16:36:33 +0000
Received: from AM6EUR05FT011.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::f8) by AM6PR04CA0041.outlook.office365.com
 (2603:10a6:20b:f0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 16:36:33 +0000
X-SASI-Hits: BODY_SIZE_10000_PLUS 0.000000, CTE_QUOTED_PRINTABLE 0.000000,
 ECARD_KNOWN_DOMAINS 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 IN_REP_TO 0.000000, IN_TLD 0.100000, LEGITIMATE_SIGNS 0.000000,
 MSG_THREAD 0.000000, MULTIPLE_RCPTS 0.100000, MULTIPLE_REAL_RCPTS 0.000000,
 NO_FUR_HEADER 0.000000, OUTBOUND 0.000000, OUTBOUND_SOPHOS 0.000000,
 REFERENCES 0.000000, SUSP_DH_NEG 0.000000, URI_WITH_PATH_ONLY 0.000000,
 __ANY_URI 0.000000, __ARCAUTH_DKIM_PASSED 0.000000,
 __ARCAUTH_DMARC_PASSED 0.000000, __ARCAUTH_PASSED 0.000000,
 __ARC_SEAL_MICROSOFT 0.000000, __ARC_SIGNATURE_MICROSOFT 0.000000,
 __AUTH_RES_ORIG_DKIM_NONE 0.000000, __AUTH_RES_ORIG_DMARC_NONE 0.000000,
 __BODY_NO_MAILTO 0.000000, __BOUNCE_CHALLENGE_SUBJ 0.000000,
 __BOUNCE_NDR_SUBJ_EXEMPT 0.000000, __BULK_NEGATE 0.000000,
 __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000,
 __CC_REAL_NAMES 0.000000, __COURIER_PHRASE 0.000000,
 __CP_URI_IN_BODY 0.000000, __CT 0.000000, __CTE 0.000000,
 __CT_TEXT_PLAIN 0.000000, __DQ_NEG_DOMAIN 0.000000, __DQ_NEG_HEUR 0.000000,
 __DQ_NEG_IP 0.000000, __FILESHARE_PHRASE 0.000000, __FORWARDED_MSG 0.000000,
 __FRAUD_BODY_WEBMAIL 0.000000, __FRAUD_MONEY_CURRENCY 0.000000,
 __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000, __FRAUD_WEBMAIL 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_REFERENCES 0.000000, __HAS_X_FF_ASR 0.000000,
 __HAS_X_FF_ASR_CAT 0.000000, __HAS_X_FF_ASR_SFV 0.000000,
 __HTTPS_URI 0.000000, __IN_REP_TO 0.000000, __MAIL_CHAIN 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MULTIPLE_RCPTS_CC_X2 0.000000,
 __MULTIPLE_RCPTS_TO_X2 0.000000, __MULTIPLE_URI_TEXT 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __OUTBOUND_SOPHOS_FUR 0.000000,
 __OUTBOUND_SOPHOS_FUR_IP 0.000000, __OUTBOUND_SOPHOS_FUR_RDNS 0.000000,
 __RCVD_PASS 0.000000, __REFERENCES 0.000000, __SANE_MSGID 0.000000,
 __STOCK_PHRASE_7 0.000000, __SUBJ_ALPHA_END 0.000000,
 __SUBJ_ALPHA_NEGATE 0.000000, __SUBJ_REPLY 0.000000, __TO_GMAIL 0.000000,
 __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000,
 __TO_NAME_DIFF_FROM_ACC 0.000000, __TO_REAL_NAMES 0.000000,
 __URI_ENDS_IN_SLASH 0.000000, __URI_IN_BODY 0.000000, __URI_MAILTO 0.000000,
 __URI_NOT_IMG 0.000000, __URI_NO_WWW 0.000000, __URI_NS 0.000000,
 __URI_WITH_PATH 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 5.1.1, AntispamData: 2023.1.26.161516
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM6EUR05FT011.mail.protection.outlook.com (10.233.241.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Thu, 26 Jan 2023 16:36:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.108)
 by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
 (TLS12) via SMTP; Thu, 26 Jan 2023 16:36:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VftHN2rUYCyJx5w8IMHv8nFk7xYUg3T8LChjEkGBCmQ66SGjNzsp+rAFy+O8+rnpZsEEYelePjyOmlvdwtCrCp8HEvpAc531FXYRFDnpaTJ2uV/rtaMxzaJX1a6jIfU3j4Mxew1NYVo1G6sdztD5Yumbf/dOzwmazwbAsjP+uAPxwBVX32i6hXNPCnUyS3MRO9ZmgSzT2nKW1QlCLt7AqG1cPzFap0AF/wWIX8MGSGmFcDZEXnLTfjXSgvy42HBaf4aTlXx5WWG0rheTXv0vSnfhru/WO6jBat3XXulZIVvb76ejX0d3j1gaSC+1z/8hRWtlSTkw8SQudbYV6P+zrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsV25BKC3UdGfb4t4Is9FpAh4PnpQHpF1IGelW0GC4M=;
 b=X/bmbj2y+Vy5WMaOEaBXYr6yW5mZo1bfFnIiVOKQoYMq7Zl0DHsRmu5fNMc+vzcJcLF7NsohgC9RBFbjRci6R1uF2LdUoKPwRfammAjaOEInZ3EDkagcIj44ebQs5yjwfuMxSbhwX23lT+o+emBtbVfUvabiYlnHDIzRtlev6awTULlR/ZPMJjl9/dpdbrjzSB3cOToG+i/I/7sKUh+F60REL2EqyReACJgu51eVR0I7nDzRsYPKUmPpuA9/owDPVroijRJcDuclG4KB7fBJnwtfR1GYxzxwA/IPZUmojjOD5LJQz58FDw5jAF8WTd1GDHhldBhYsmKzl7AVxWwBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ginzinger.com; dmarc=pass action=none
 header.from=ginzinger.com; dkim=pass header.d=ginzinger.com; arc=none
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com (2603:10a6:206:6::18)
 by AM4PR0601MB2098.eurprd06.prod.outlook.com (2603:10a6:200:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 16:36:29 +0000
Received: from AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172]) by AM5PR06MB3153.eurprd06.prod.outlook.com
 ([fe80::ccff:c03f:1f56:8172%5]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 16:36:29 +0000
From: Hager Stefan <Stefan.Hager@ginzinger.com>
To: James Hilliard <james.hilliard1@gmail.com>, Gilles Talis
 <gilles.talis@gmail.com>
Thread-Index: AQHZA1Md+T4bAv4oxUq3lcM07CUUVK6X3SGAgBXIXoCAA5wi/w==
Date: Thu, 26 Jan 2023 16:36:28 +0000
Message-ID: <AM5PR06MB3153FAF7691F764122FD9A5384CF9@AM5PR06MB3153.eurprd06.prod.outlook.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-8-james.hilliard1@gmail.com>
 <CAKcgs2xSo=YxmzpOA=eim5m9KOJ1sqasMJE1y4UCBJQ-0hs3qg@mail.gmail.com>
 <CADvTj4p4iYxqBY7wzKkcE3AZHaDNa_1oC9g0B0wmCt1Z1b4Nyg@mail.gmail.com>
In-Reply-To: <CADvTj4p4iYxqBY7wzKkcE3AZHaDNa_1oC9g0B0wmCt1Z1b4Nyg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
x-ms-traffictypediagnostic: AM5PR06MB3153:EE_|AM4PR0601MB2098:EE_|AM6EUR05FT011:EE_|VI1PR0602MB3806:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9d199d-8570-4513-f692-08daffbb7be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: GMAq5s2Wi+nqsGB/KJd5ghG+T24JVQekfSWgpzfKXVkXoKjCAKgPE/dvbhpFDoi/BL6KX3rYYEQg1G1JFFMEBjfYcSCKP7wTz5XWgND1txor/omF8hNfKMnTUQbdMhWkYTi9bqVHjGNL6edMCn9EZZZydm0O6neoe6KjfXePlBuijWEACCpTcBtjD4jQz1S0pxKoKerXN+bTkbo49xrG4tt79fXoHXxpAaprs0KHdpCUinSEcPVqlqdSavtxkHa3EVFvXZqjAyegFZiNP39cran2YRLYvFX1xOG0wr92RUpFx6jDkSS7Oi3G4be2Pjg8RREXqhcaOq0CUNMuPqEmk4BCuy3RH5YHljK8qQuc1MRHUKgma5MEjhA+Wv5Qc38V4UI2iCcmzt/i+k0/FCSG7jZnFW6emJRQEnMqjvfC7BMGYnTcos63hxAG+XAd1kphimnT9nlDpXUxR/lems9e3zIBdjPICIui0zp9T0GnAo0bWibhdZ2OkKIjzuExg67GViWMQ3Yqoj3ynxf+hjtn6HViAFArQlQkhPBIRXQwD1rcUD49HvEqmoYiqgFMadkmpcPXxZa4w53aKwMp5LLzbfDPdZbFpoxp10dmNT+1wESn6Ull1i7UlI03z4UF2Cj8zARRr98SG7WT2Vld1tqk2h6GtDsd4BjKcOcFpT1mzVklcWhxh+MTyerSoz6Y/b5KiMlBSHeZHcubsy7CGnj8bzmz7LZVPMmmrKm0XKX+4p0=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM5PR06MB3153.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39840400004)(136003)(396003)(346002)(366004)(451199018)(186003)(9686003)(26005)(19627235002)(38070700005)(83380400001)(54906003)(110136005)(55016003)(86362001)(33656002)(7696005)(71200400001)(66574015)(966005)(8676002)(478600001)(53546011)(6506007)(316002)(91956017)(64756008)(66556008)(4326008)(66446008)(66476007)(66946007)(38100700002)(122000001)(5660300002)(2906002)(66899018)(76116006)(52536014)(30864003)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0601MB2098
X-CodeTwo-MessageID: be3e9b9c-40bb-4578-9147-325fb0dcb421.20230126163631@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM6EUR05FT011.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0a795128-8316-4960-ca92-08daffbb798c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +zwONPSyDHG1aaXN9F2P+j7SfAwfzNzGcil4oiqJtiSVfQ0CijuWixu884D1Z2SY1ukEgSQOs3KTyoFR5/eWs78CeGbol4PB7O1B9LDtpvJRDXaGOYaG4hQZ/uyOhEBanDJTBsz7D8bh0AJ++owwtSR6p2k//Pml6PIHxJydoj7CzGrveRYkvvFOzKWgwdf2R7Y5bamC0YfWblb01mMjMnHVZyA3RT9B+Snw7rn2LnW496rRJMFa2TOLy/xtFJCrbRiYz8ovHkMepwELqh96z8ETATx9s0lhrj3j7IbHZwIcVlWe01cM0sNAGwWEmFvObO5r8T9LYNCZlqg2il+lcgA6F1qIk8TNnziz4eNNb9HeQnuXEkCwQ3+L0SWmkCwwBRsuMh5TJd66Jrn/lO0qBH8gb4q4iqK4LVChXCqUVKkkkHNsfatrjUcG1NPNTAvxG4dFDdrMqUhO1Mdg9GJQA8T4tJ8evStSD6re47eyNatv/bmwR8vouBJrWWZ8csjP/77bg4ZCC5WHkT2Xlhsj/co0PSZWNfj42Jxi1tei6Wll3dEJgw7PhIWrUtB1/1M7BDr8tpjNS8dUBb/Mc3Ujf6VuHweD3KVEU8/sKnku328GjET6yYwuQu+pQdpNOK/RzwDKKoHJNOJ4HaldoJFYZozDjYFJ1DG1OTyQVj/jU0wnyhtg6i0BqclTsF7uTd7RgBOC/9n1NerwAXadq9lXiQ==
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(39840400004)(346002)(451199018)(36840700001)(46966006)(66899018)(110136005)(54906003)(70586007)(966005)(7696005)(478600001)(316002)(82310400005)(19627235002)(70206006)(33656002)(86362001)(336012)(41300700001)(26005)(186003)(9686003)(356005)(66574015)(47076005)(8936002)(8676002)(4326008)(83380400001)(2906002)(40480700001)(36860700001)(5660300002)(7596003)(53546011)(7636003)(6506007)(30864003)(55016003)(52536014);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 16:36:32.8538 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9d199d-8570-4513-f692-08daffbb7be3
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM6EUR05FT011.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3806
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 8/8] package/tensorflow-lite: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0545085630929268658=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============0545085630929268658==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----D16962C8B5C2DA686572436187B73BB6"

This is an S/MIME signed message

------D16962C8B5C2DA686572436187B73BB6
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

> From: James Hilliard <james.hilliard1@gmail.com>=0A=
> Sent: Tuesday, January 24, 2023 10:27=0A=
> To: Gilles Talis <gilles.talis@gmail.com>=0A=
> Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Hager Stefan <Stef=
an.Hager@ginzinger.com>; Samuel Martin <s.martin49@gmail.com>; Fabrice Font=
aine <fontaine.fabrice@gmail.com>; Thomas Petazzoni <thomas.petazzoni@bootl=
in.com>=0A=
> Subject: Re: [Buildroot] [PATCH v2 8/8] package/tensorflow-lite: new pack=
age=0A=
> =0A=
> On Tue, Jan 10, 2023 at 5:49 AM Gilles Talis <gilles.talis@gmail.com> wro=
te:=0A=
> >=0A=
> > Hi James, Hi Stefan,=0A=
> >=0A=
> > fyi, I could build and successfully test tensorflow lite on an aarch64=
=0A=
> > platform with Cortex A53 cores.=0A=
> > a few comments though.=0A=
> >=0A=
> > Le lun. 28 nov. 2022 =E0 19:00, James Hilliard=0A=
> > <james.hilliard1@gmail.com> a =E9crit :=0A=
> > >=0A=
> > > From: Stefan Hager <stefan.hager@ginzinger.com>=0A=
> > >=0A=
> > > This package adds the tensorflow lite runtime to buildroot.=0A=
> > >=0A=
> > > Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>=0A=
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
> > > ---=0A=
> > > Changes v1 -> v2:=0A=
> > >   - fix label_image build=0A=
> > >   - more explicit cmake config=0A=
> > > ---=0A=
> > >  package/Config.in                             |  1 +=0A=
> > If you want to be maintainers for this package, do not forget to=0A=
> > update the DEVELOPERS file.=0A=
> >=0A=
> > >  .../0001-lite-Update-CMakeLists.txt.patch     | 49 +++++++++++++++++=
++=0A=
> > >  .../0002-Fix-FindFlatBuffers-cmake-file.patch | 37 ++++++++++++++=0A=
> > >  ...ink-tensorflow-lite-against-gemmlowp.patch | 32 ++++++++++++=0A=
> > >  package/tensorflow-lite/Config.in             | 32 ++++++++++++=0A=
> > >  package/tensorflow-lite/tensorflow-lite.hash  |  4 ++=0A=
> > >  package/tensorflow-lite/tensorflow-lite.mk    | 49 +++++++++++++++++=
++=0A=
> > >  7 files changed, 204 insertions(+)=0A=
> > >  create mode 100644 package/tensorflow-lite/0001-lite-Update-CMakeLis=
ts.txt.patch=0A=
> > >  create mode 100644 package/tensorflow-lite/0002-Fix-FindFlatBuffers-=
cmake-file.patch=0A=
> > >  create mode 100644 package/tensorflow-lite/0003-Don-t-link-tensorflo=
w-lite-against-gemmlowp.patch=0A=
> > >  create mode 100644 package/tensorflow-lite/Config.in=0A=
> > >  create mode 100644 package/tensorflow-lite/tensorflow-lite.hash=0A=
> > >  create mode 100644 package/tensorflow-lite/tensorflow-lite.mk=0A=
> > >=0A=
> > > diff --git a/package/Config.in b/package/Config.in=0A=
> > > index a59d074430..c979710f32 100644=0A=
> > > --- a/package/Config.in=0A=
> > > +++ b/package/Config.in=0A=
> > > @@ -2105,6 +2105,7 @@ endif=0A=
> > >         source "package/sphinxbase/Config.in"=0A=
> > >         source "package/startup-notification/Config.in"=0A=
> > >         source "package/tbb/Config.in"=0A=
> > > +       source "package/tensorflow-lite/Config.in"=0A=
> > >         source "package/tinycbor/Config.in"=0A=
> > >         source "package/tz/Config.in"=0A=
> > >         source "package/tzdata/Config.in"=0A=
> > > diff --git a/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.=
patch b/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch=0A=
> > > new file mode 100644=0A=
> > > index 0000000000..53b5170681=0A=
> > > --- /dev/null=0A=
> > > +++ b/package/tensorflow-lite/0001-lite-Update-CMakeLists.txt.patch=
=0A=
> > > @@ -0,0 +1,49 @@=0A=
> > > +From 081c2e4e3cf021efb2853a485a18b563e88f6117 Mon Sep 17 00:00:00 20=
01=0A=
> > > +From: Terry Heo <terryheo@google.com>=0A=
> > > +Date: Tue, 1 Nov 2022 15:55:30 -0700=0A=
> > > +Subject: [PATCH] lite: Update CMakeLists.txt=0A=
> > > +=0A=
> > > +This changes are needed to build kernel tests.=0A=
> > > +=0A=
> > > +PiperOrigin-RevId: 485439972=0A=
> > > +=0A=
> > > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
> > > +[james.hilliard1@gmail.com: backport from upstream commit=0A=
> > > +081c2e4e3cf021efb2853a485a18b563e88f6117]=0A=
> > > +---=0A=
> > > + tensorflow/lite/CMakeLists.txt | 7 ++++++-=0A=
> > > + 1 file changed, 6 insertions(+), 1 deletion(-)=0A=
> > > +=0A=
> > > +diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeL=
ists.txt=0A=
> > > +index 9dfbb4b72f3..fd8b3faf1e2 100644=0A=
> > > +--- a/tensorflow/lite/CMakeLists.txt=0A=
> > > ++++ b/tensorflow/lite/CMakeLists.txt=0A=
> > > +@@ -209,6 +209,9 @@ list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*tflite_=
with_xnnpack\\.cc$")=0A=
> > > + # Exclude Flex related files.=0A=
> > > + list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*with_selected_ops\\.cc$")=
=0A=
> > > +=0A=
> > > ++# Exclude tensorflow_profiler_logger files.=0A=
> > > ++list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*tensorflow_profiler_logger=
\\.cc$")=0A=
> > > ++=0A=
> > > + if(_TFLITE_ENABLE_MMAP)=0A=
> > > +   list(FILTER TFLITE_SRCS EXCLUDE REGEX ".*mmap_allocation_disabled=
\\.cc$")=0A=
> > > + else()=0A=
> > > +@@ -222,6 +225,7 @@ if(NOT "${CMAKE_SYSTEM_NAME}" STREQUAL "iOS")=0A=
> > > + endif()=0A=
> > > + populate_tflite_source_vars("core" TFLITE_CORE_SRCS)=0A=
> > > + populate_tflite_source_vars("core/api" TFLITE_CORE_API_SRCS)=0A=
> > > ++populate_tflite_source_vars("core/c" TFLITE_CORE_C_SRCS)=0A=
> > > + populate_tflite_source_vars("c" TFLITE_C_SRCS)=0A=
> > > + populate_tflite_source_vars("delegates" TFLITE_DELEGATES_SRCS)=0A=
> > > + if(TFLITE_ENABLE_GPU)=0A=
> > > +@@ -483,6 +487,7 @@ endif()=0A=
> > > + # TFLite library=0A=
> > > + set(_ALL_TFLITE_SRCS=0A=
> > > +   ${TFLITE_CORE_API_SRCS}=0A=
> > > ++  ${TFLITE_CORE_C_SRCS}=0A=
> > > +   ${TFLITE_CORE_SRCS}=0A=
> > > +   ${TFLITE_C_SRCS}=0A=
> > > +   ${TFLITE_DELEGATES_FLEX_SRCS}=0A=
> > > +--=0A=
> > > +2.34.1=0A=
> > > +=0A=
> > > diff --git a/package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-f=
ile.patch b/package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.pat=
ch=0A=
> > > new file mode 100644=0A=
> > > index 0000000000..e97bb3e52f=0A=
> > > --- /dev/null=0A=
> > > +++ b/package/tensorflow-lite/0002-Fix-FindFlatBuffers-cmake-file.pat=
ch=0A=
> > > @@ -0,0 +1,37 @@=0A=
> > > +From a4ff4b5e952a22906ac0ed01e73f84f42926c325 Mon Sep 17 00:00:00 20=
01=0A=
> > > +From: James Hilliard <james.hilliard1@gmail.com>=0A=
> > > +Date: Thu, 24 Nov 2022 14:29:06 -0700=0A=
> > > +Subject: [PATCH] Fix FindFlatBuffers cmake file=0A=
> > > +=0A=
> > > +Capitalization needs to match for system cmake override to work:=0A=
> > > +https://github.com/google/flatbuffers/blob/v22.11.23/CMake/FindFlatB=
uffers.cmake=0A=
> > > +=0A=
> > > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
> > > +[Upstream status:=0A=
> > > +https://github.com/tensorflow/tensorflow/pull/58677]=0A=
> > > +---=0A=
> > > + tensorflow/lite/CMakeLists.txt                                  | 2=
 +-=0A=
> > > + .../modules/{FindFlatbuffers.cmake =3D> FindFlatBuffers.cmake}    |=
 0=0A=
> > > + 2 files changed, 1 insertion(+), 1 deletion(-)=0A=
> > > + rename tensorflow/lite/tools/cmake/modules/{FindFlatbuffers.cmake =
=3D> FindFlatBuffers.cmake} (100%)=0A=
> > > +=0A=
> > > +diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeL=
ists.txt=0A=
> > > +index f9c30d6a046..c2ee9edfb61 100644=0A=
> > > +--- a/tensorflow/lite/CMakeLists.txt=0A=
> > > ++++ b/tensorflow/lite/CMakeLists.txt=0A=
> > > +@@ -143,7 +143,7 @@ find_package(absl REQUIRED)=0A=
> > > + find_package(Eigen3 REQUIRED)=0A=
> > > + find_package(farmhash REQUIRED)=0A=
> > > + find_package(fft2d REQUIRED)=0A=
> > > +-find_package(Flatbuffers REQUIRED)=0A=
> > > ++find_package(FlatBuffers REQUIRED)=0A=
> > > + find_package(gemmlowp REQUIRED)=0A=
> > > + find_package(NEON_2_SSE REQUIRED)=0A=
> > > + find_package(cpuinfo REQUIRED)  #CPUINFO is used by XNNPACK and RUY=
 library=0A=
> > > +diff --git a/tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cma=
ke b/tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake=0A=
> > > +similarity index 100%=0A=
> > > +rename from tensorflow/lite/tools/cmake/modules/FindFlatbuffers.cmak=
e=0A=
> > > +rename to tensorflow/lite/tools/cmake/modules/FindFlatBuffers.cmake=
=0A=
> > > +--=0A=
> > > +2.34.1=0A=
> > > +=0A=
> > > diff --git a/package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-=
against-gemmlowp.patch b/package/tensorflow-lite/0003-Don-t-link-tensorflow=
-lite-against-gemmlowp.patch=0A=
> > > new file mode 100644=0A=
> > > index 0000000000..dbee9942b3=0A=
> > > --- /dev/null=0A=
> > > +++ b/package/tensorflow-lite/0003-Don-t-link-tensorflow-lite-against=
-gemmlowp.patch=0A=
> > > @@ -0,0 +1,32 @@=0A=
> > > +From fb584589f707853d85a081c99b1b82598c2631c1 Mon Sep 17 00:00:00 20=
01=0A=
> > > +From: James Hilliard <james.hilliard1@gmail.com>=0A=
> > > +Date: Thu, 24 Nov 2022 15:10:27 -0700=0A=
> > > +Subject: [PATCH] Don't link tensorflow-lite against gemmlowp=0A=
> > > +=0A=
> > > +We can't link against gemmlowp as it is a header only library.=0A=
> > > +=0A=
> > > +Fixes:=0A=
> > > +/bin/ld: cannot find -lgemmlowp: No such file or directory=0A=
> > > +=0A=
> > > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>=0A=
> > > +[Upstream status:=0A=
> > > +https://github.com/tensorflow/tensorflow/pull/58678]=0A=
> > > +---=0A=
> > > + tensorflow/lite/CMakeLists.txt | 1 -=0A=
> > > + 1 file changed, 1 deletion(-)=0A=
> > > +=0A=
> > > +diff --git a/tensorflow/lite/CMakeLists.txt b/tensorflow/lite/CMakeL=
ists.txt=0A=
> > > +index f9c30d6a046..3fe5ed15605 100644=0A=
> > > +--- a/tensorflow/lite/CMakeLists.txt=0A=
> > > ++++ b/tensorflow/lite/CMakeLists.txt=0A=
> > > +@@ -560,7 +560,6 @@ target_link_libraries(tensorflow-lite=0A=
> > > +     farmhash=0A=
> > > +     fft2d_fftsg2d=0A=
> > > +     flatbuffers::flatbuffers=0A=
> > > +-    gemmlowp=0A=
> > > +     ruy::ruy=0A=
> > > +     pthreadpool=0A=
> > > +     ${CMAKE_DL_LIBS}=0A=
> > > +--=0A=
> > > +2.34.1=0A=
> > > +=0A=
> > > diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-l=
ite/Config.in=0A=
> > > new file mode 100644=0A=
> > > index 0000000000..9231d674bd=0A=
> > > --- /dev/null=0A=
> > > +++ b/package/tensorflow-lite/Config.in=0A=
> > > @@ -0,0 +1,32 @@=0A=
> > > +config BR2_PACKAGE_TENSORFLOW_LITE=0A=
> > > +       bool "tensorflow-lite"=0A=
> > > +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9=0A=
> > Can you please add to comment that explains why this version of GCC is =
needed?=0A=
> =0A=
> I'm not sure why this is, maybe Stephan Hager can clarify.=0A=
=0A=
The Tensorflow-lite build documentation for cmake on ARM uses gcc.arm.8.3 i=
n their example. =0A=
BR offers the GCC Variables BR2_TOOLCHAIN_GCC_AT_LEAST_8, BR2_TOOLCHAIN_GCC=
_AT_LEAST_9 and ships with GCC 10/11/12.=0A=
So choosing BR2_TOOLCHAIN_GCC_AT_LEAST_9 seemed a good solution to me. =0A=
Since i do not have prebuilt GCC8.0...GCC9.0 on hand selectiong 9 as minimu=
m would be safe.=0A=
=0A=
I tried setting to BR2_TOOLCHAIN_GCC_AT_LEAST_8 in the config and run the '=
utils/./test-pkg -a'. =0A=
Only 3 out of 44 possible toolchains were used for testing (the same as whe=
n using BR2_TOOLCHAIN_GCC_AT_LEAST_9), =0A=
but none of them uses GCC 8.=0A=
=0A=
Maybe someone can test and proof that it also works with GCC Versions < 9?=
=0A=
=0A=
> =0A=
> >=0A=
> > > +       depends on BR2_TOOLCHAIN_USES_GLIBC=0A=
> > > +       depends on BR2_INSTALL_LIBSTDCPP=0A=
> > > +       depends on BR2_TOOLCHAIN_HAS_THREADS=0A=
> > > +       depends on BR2_SHARED_LIBS=0A=
> > > +       depends on ( BR2_arm && BR2_ARM_CPU_ARMV7A ) || ( BR2_aarch64=
 && BR2_ARM_CPU_ARMV8A )=0A=
> > > +       select BR2_PACKAGE_CPUINFO=0A=
> > > +       select BR2_PACKAGE_EIGEN=0A=
> > > +       select BR2_PACKAGE_FARMHASH=0A=
> > > +       select BR2_PACKAGE_FFT2D=0A=
> > > +       select BR2_PACKAGE_FLATBUFFERS=0A=
> > > +       select BR2_PACKAGE_GEMMLOWP=0A=
> > > +       select BR2_PACKAGE_LIBABSEIL_CPP=0A=
> > > +       select BR2_PACKAGE_NEON_2_SSE=0A=
> > > +       select BR2_PACKAGE_RUY=0A=
> > > +       help=0A=
> > > +         Tensorflow Lite dynamic library and headers: Inference engi=
ne to run previously trained machine learning models.=0A=
> > The text is too long. Please run "utils/check-package" to see the=0A=
> > warning that it generates.=0A=
> =0A=
> Fixed in v3:=0A=
> https://patchwork.ozlabs.org/project/buildroot/patch/20230124092235.80696=
9-8-james.hilliard1@gmail.com/=0A=
> =0A=
> >=0A=
> > A couple of suggestions:=0A=
> > 1) would it be possible to add an option to build and install the=0A=
> > label_image example? It is always handy to be able to test this=0A=
> > package once it is built.=0A=
> > 2) would it be possible to add an option to build and install the=0A=
> > benchmark_model tool? This tool provides useful performance=0A=
> > information.=0A=
> =0A=
> Not sure there's really a good way to do this without adding a config=0A=
> flag upstream.=0A=
> =0A=
> >=0A=
> > > +=0A=
> > > +comment "tensorflow-lite needs needs a toolchain w/ gcc >=3D 9"=0A=
> > > +       depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9=0A=
> > > +=0A=
> > > +comment "tensorflow-lite needs a toolchain w/ glibc, C++, threads"=
=0A=
> > > +       depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCP=
P || \=0A=
> > > +                       !BR2_TOOLCHAIN_HAS_THREADS=0A=
> > > +=0A=
> > > +comment "tensorflow-lite needs a toolchain w/ shared libraries"=0A=
> > > +       depends on !BR2_SHARED_LIBS=0A=
> > > +=0A=
> > > +comment "tensorflow-lite in buildroot currently only supports arm + =
armv7a cpu or arm64 + armv8a cpu targets"=0A=
> > > +       depends on ( BR2_arm && !BR2_ARM_CPU_ARMV7A ) || ( BR2_aarch6=
4 && !BR2_ARM_CPU_ARMV8A) || (!BR2_arm && !BR2_aarch64)=0A=
> > > diff --git a/package/tensorflow-lite/tensorflow-lite.hash b/package/t=
ensorflow-lite/tensorflow-lite.hash=0A=
> > > new file mode 100644=0A=
> > > index 0000000000..7d9035707b=0A=
> > > --- /dev/null=0A=
> > > +++ b/package/tensorflow-lite/tensorflow-lite.hash=0A=
> > > @@ -0,0 +1,4 @@=0A=
> > > +# Locally calculated=0A=
> > > +sha256  99c732b92b1b37fc243a559e02f9aef5671771e272758aa4aec7f34dc92d=
ac48  tensorflow-lite-2.11.0.tar.gz=0A=
> > > +# License files, locally calculated=0A=
> > > +sha256  71c6915d04265772a0339bed47276942c678b45cc01534210ebe6984fd1a=
ec65  LICENSE=0A=
> > > diff --git a/package/tensorflow-lite/tensorflow-lite.mk b/package/ten=
sorflow-lite/tensorflow-lite.mk=0A=
> > > new file mode 100644=0A=
> > > index 0000000000..1f75f3813c=0A=
> > > --- /dev/null=0A=
> > > +++ b/package/tensorflow-lite/tensorflow-lite.mk=0A=
> > > @@ -0,0 +1,49 @@=0A=
> > > +####################################################################=
############=0A=
> > > +#=0A=
> > > +# tensorflow-lite=0A=
> > > +#=0A=
> > > +####################################################################=
############=0A=
> > > +=0A=
> > > +TENSORFLOW_LITE_VERSION =3D 2.11.0=0A=
> > > +TENSORFLOW_LITE_SITE =3D  $(call github,tensorflow,tensorflow,v$(TEN=
SORFLOW_LITE_VERSION))=0A=
> > > +TENSORFLOW_LITE_INSTALL_STAGING =3D YES=0A=
> > > +TENSORFLOW_LITE_LICENSE =3D Apache-2.0=0A=
> > > +TENSORFLOW_LITE_LICENSE_FILES =3D LICENSE=0A=
> > > +TENSORFLOW_LITE_SUBDIR =3D tensorflow/lite=0A=
> > > +TENSORFLOW_LITE_SUPPORTS_IN_SOURCE_BUILD =3D NO=0A=
> > > +TENSORFLOW_LITE_DEPENDENCIES +=3D \=0A=
> > > +       host-pkgconf \=0A=
> > > +       host-flatbuffers \=0A=
> > > +       cpuinfo \=0A=
> > > +       eigen \=0A=
> > > +       farmhash \=0A=
> > > +       fft2d \=0A=
> > > +       flatbuffers \=0A=
> > > +       gemmlowp \=0A=
> > > +       libabseil-cpp \=0A=
> > > +       neon-2-sse \=0A=
> > > +       ruy=0A=
> > > +=0A=
> > > +TENSORFLOW_LITE_CONF_OPTS =3D \=0A=
> > > +       -Dabsl_DIR=3D$(STAGING_DIR)/usr/lib/cmake/absl \=0A=
> > > +       -DBUILD_SHARED_LIBS=3DON \=0A=
> > > +       -DCMAKE_CXX_FLAGS=3D"$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/=
include/gemmlowp" \=0A=
> > > +       -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=3DON \=0A=
> > > +       -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \=0A=
> > > +       -DEigen3_DIR=3D$(STAGING_DIR)/usr/share/eigen3/cmake \=0A=
> > > +       -DFARMHASH_SOURCE_DIR=3D$(FARMHASH_DIR) \=0A=
> > > +       -Dfarmhash_DIR=3D$(STAGING_DIR)/usr/lib \=0A=
> > > +       -DFETCHCONTENT_FULLY_DISCONNECTED=3DON \=0A=
> > > +       -DFETCHCONTENT_QUIET=3DOFF \=0A=
> > > +       -DFFT2D_SOURCE_DIR=3D$(STAGING_DIR)/usr/include/fft2d \=0A=
> > > +       -DFlatBuffers_DIR=3D$(STAGING_DIR)/usr/lib/cmake/flatbuffers =
\=0A=
> > > +       -DNEON_2_SSE_DIR=3D$(STAGING_DIR)/usr/lib/cmake/NEON_2_SSE \=
=0A=
> > > +       -DTFLITE_ENABLE_EXTERNAL_DELEGATE=3DON \=0A=
> > > +       -DTFLITE_ENABLE_GPU=3DOFF \=0A=
> > > +       -DTFLITE_ENABLE_INSTALL=3DON \=0A=
> > > +       -DTFLITE_ENABLE_MMAP=3DON \=0A=
> > > +       -DTFLITE_ENABLE_NNAPI=3DON \=0A=
> > I thought NNAPI was used in Android. Can you explain why it is required=
 here?=0A=
> =0A=
> Disabled in v3:=0A=
> https://patchwork.ozlabs.org/project/buildroot/patch/20230124092235.80696=
9-8-james.hilliard1@gmail.com/=0A=
> =0A=
> >=0A=
> > > +       -DTFLITE_ENABLE_RUY=3DON \=0A=
> > > +       -DTFLITE_ENABLE_XNNPACK=3DOFF=0A=
> > any reason why xnnpack is not enabled? It would be great to enable it=
=0A=
> > as an option.=0A=
> =0A=
> Mostly since it's not a required dependency and haven't added the=0A=
> dependency yet. Will look into adding that as a followup once this is=0A=
> merged.=0A=
=0A=
I agree, it would be a nice addition, but not a necessity for the initial m=
erge.=0A=
=0A=
> =0A=
> >=0A=
> > > +=0A=
> > > +$(eval $(cmake-package))=0A=
> > > --=0A=
> > > 2.34.1=0A=
> > >=0A=
> > > _______________________________________________=0A=
> > > buildroot mailing list=0A=
> > > buildroot@buildroot.org=0A=
> > > https://lists.buildroot.org/mailman/listinfo/buildroot=0A=
> > thanks=0A=
> > Gilles.=0A=
=0A=
Regards,=0A=
Stefan=

------D16962C8B5C2DA686572436187B73BB6
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIISDQYJKoZIhvcNAQcCoIIR/jCCEfoCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGggg7BMIIFXzCCBEegAwIBAgIQD/rh8xorQzw9muFtZDtYizANBgkq
hkiG9w0BAQsFADBlMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5j
MRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBB
c3N1cmVkIElEIFJvb3QgRzIwHhcNMTkwOTIzMTIyNTMyWhcNMzQwOTIzMTIyNTMy
WjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQL
ExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2VydCBBc3N1cmVkIElE
IENsaWVudCBDQSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOqx
Ra06rLwKBvrDb/qQ8RtXfeKA9o0A42oZbLF4GYr4Xdt9JE8r3PJRIOUZD1U3mEln
4S/aZoS54Q+5Ecs3q2GGT/Z82VeAPLeGvJoT0LS5t/zXeUcbMuDFWgyj33kiesnu
usnOWvpISoxN+oBH4oo0+oUiHI65mMjMAlb93x6sabh9kKvHQvHC4x2u7wYv5+NX
jnbOhJS/1NjGq+ugLMXeldFMz0O5qFIDpn3aQGU0htyJQ2SZyxEqlUrgunsrYj9w
gfW7XuhAi2j0y5d9oMT0SuVeKFFnQhTEk5B3fq+OBOW0AU2JdW1r929UtRbAr8Rp
Lt05WI2G2RNVVlHYaU0CAwEAAaOCAgQwggIAMB0GA1UdDgQWBBSlYiBQ3LtbV5et
I4814lRsqX75TjAfBgNVHSMEGDAWgBTOw0q5mVXyuNtgv6l+vVa1lzan1jAOBgNV
HQ8BAf8EBAMCAYYwTAYDVR0lBEUwQwYIKwYBBQUHAwIGCCsGAQUFBwMEBgorBgEE
AYI3CgMEBgorBgEEAYI3FAICBgorBgEEAYI3CgMMBgkqhkiG9y8BAQUwEgYDVR0T
AQH/BAgwBgEB/wIBADA0BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUHMAGGGGh0dHA6
Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8vY3Js
My5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290RzIuY3JsMIHOBgNV
HSAEgcYwgcMwgcAGBFUdIAAwgbcwKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRp
Z2ljZXJ0LmNvbS9DUFMwgYoGCCsGAQUFBwICMH4MfEFueSB1c2Ugb2YgdGhpcyBD
ZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBhY2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5n
IFBhcnR5IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0dHBzOi8vd3d3LmRpZ2ljZXJ0
LmNvbS9ycGEtdWEwDQYJKoZIhvcNAQELBQADggEBAHZrbCQCo3MAIqR0kekGYrC7
0EAGRDRq11COufNEXhcpv3YH6BMhUoVinPPNgfo5HPrZAFrLK/KPXYdJdgkASGsI
NabAfY2ljUaJwKlpIewwjS6KuGEn59MgidaAUPh6lbetIoRsLhCqCzAnX1aL99fj
CMf4NMWLUC8TqotnnrKNuw4JSjx4fcQs+U5T1bbgnyDx+8ybONuIEDvinHdKDu2V
joECzez2y/1IVTPlh57zBfjHJQFqLWzHdou8M+ucdJtr2swXII6s3nkq4pfEn7Kn
bzMS9quFSuyOGILcg/3qVwaHNLM5R+8nB5gPI5+u5Uh56w1i+9Ds1pjYAiTHdeUw
ggOWMIICfqADAgECAhALkxw61jln6mcjv8OvmvRLMA0GCSqGSIb3DQEBCwUAMGUx
CzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3
dy5kaWdpY2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9v
dCBHMjAeFw0xMzA4MDExMjAwMDBaFw0zODAxMTUxMjAwMDBaMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2Vy
dC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBHMjCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANnnKC9SPzZySYiTNPP4ah4xVICf
rVRBtUfflqjUr4AtuQrPdf2JpX0k+uMiDCu8lRcLM78ZTUEGkAC9DE0Q/ge15xxu
IlUxZZe90xfSHmLz2+psUIw/hAyWz7fLA+DKbaEUTBuJ3e0AsFJ8r5FssTgT0ekS
CMAAsBwrEdp3cDabrs55h9yCcOYJdHBVaa+jaJ+/3bZ5s/KdcClV9Kv/lWHzyUBv
HdG+k7vTiCq7nb9yWlZxOz/U89EK/ijvo+7Zma8D049gt/KSobG9iYkfMM3Dpi5i
M64WAndEWueBCjynRC55uD8EvFygh+Ebr1GOzews+vj+bfA6fKqL5GeVMY0CAwEA
AaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0OBBYE
FM7DSrmZVfK422C/qX69VrWXNqfWMA0GCSqGSIb3DQEBCwUAA4IBAQDKpVWM48hB
bmknp3UR7zyGNm/SncZ4OB1plqKSaS44bJt9BNSJpbExN4rJIcyrbM2LHJrWv0jS
MmbBisDzLzrvwOPUkYbRUOMD23N3b0o5U+3eJse1fa8rQtF1YuNKKwLHUEvgaeKW
bA5EZhBEj60F6/h5rKYb6Dc0nVPJYaqiUq9KcBaGwjrIsRNwNtjP7vQKNNVbTP0H
nKK62QFyXPNNwd0OsRwNxGO+rfQU+4nsokEOTMzIV0DQbgOqzQyOiZmZbPA8MK84
32+8o74pICerdP8TInjel1JVHoO1VCAD7q7AT1beN8zDf6oEJ7vTd7hi2xd8nCgi
E3Nszyb1iinnMIIFwDCCBKigAwIBAgIQDGW+hPuss5Tc1j96Q5g6rTANBgkqhkiG
9w0BAQsFADBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkw
FwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2VydCBBc3N1
cmVkIElEIENsaWVudCBDQSBHMjAeFw0yMjEwMDcwMDAwMDBaFw0yNTEwMDcyMzU5
NTlaMFAxIzAhBgNVBAMMGnN0ZWZhbi5oYWdlckBnaW56aW5nZXIuY29tMSkwJwYJ
KoZIhvcNAQkBFhpzdGVmYW4uaGFnZXJAZ2luemluZ2VyLmNvbTCCAaIwDQYJKoZI
hvcNAQEBBQADggGPADCCAYoCggGBALLxSkM9EsxkQXXj3kZ/6dJOhNoLOTjKGQW1
ddcuYyOhaOFAlwTiWOJsF+zupjR6cNzNorR8PZfAYjdrE3L8ROzQy1+HpJnOF0a7
gXgjF+AwyHz5Cuu083jZAaCw/csVTrQZe9T0a8/b2g+MUUhmvlfo7jMby0TiV4eE
AUe3X3COMvna1i9j9Uk2QruwgrfZsG/tG6IEUBKyjcRBbh76LuFym6tKum+dQxMG
RxuQ8KzthVoSndJ4uWL9yZz6/03yTSknRaS1qlwEDsThZ8M642/feqQ1dg4t+0P6
OKGYz40Lln6KtCE+f8WMjwZ0zwVzylCdXxYGDuo7vkMTlbkrzg4vl3U8Sxm8uwVO
tx6mVxkXWfUMJ6pAjmHVgvwIDpvFlXQChoMB+fNx9MtxGRB/x4bvbruvvcMg3HsR
b+nzQPQhTRmZ5Tnv/d88Wlriby3pZtz+jkk0/eNEbiJsV4FFE15VMhvdnqB9u8c1
WQjk5k/4VNUtzxvuGAi3JcTWWfSrywIDAQABo4IB+jCCAfYwHwYDVR0jBBgwFoAU
pWIgUNy7W1eXrSOPNeJUbKl++U4wHQYDVR0OBBYEFBKUfzpvibxxH4xLryC37QDB
TEu0MAwGA1UdEwEB/wQCMAAwJQYDVR0RBB4wHIEac3RlZmFuLmhhZ2VyQGdpbnpp
bmdlci5jb20wDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggr
BgEFBQcDAjBDBgNVHSAEPDA6MDgGCmCGSAGG/WwEAQEwKjAoBggrBgEFBQcCARYc
aHR0cHM6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzCBiwYDVR0fBIGDMIGAMD6gPKA6
hjhodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURDbGll
bnRDQUcyLmNybDA+oDygOoY4aHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0RpZ2lD
ZXJ0QXNzdXJlZElEQ2xpZW50Q0FHMi5jcmwwfQYIKwYBBQUHAQEEcTBvMCQGCCsG
AQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wRwYIKwYBBQUHMAKGO2h0
dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRENsaWVu
dENBRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBIPYM+hSk3JsrbTSvw969Hyo0q
5+maixbUrVPlQdS+4brWiFdcKLOEhmqliUVeuEYIpstCSf+jRtuupI7m5EnIwf6s
aiGxHcLmC/BZ7C7eIXGUx3eYDzZ0aqyXnmzo+WYSHnIhUeVRJMmzIOgLOqfiOdGI
slKn5jrR8AgHpc3KO0p4yATSp9f0X6V7RSXuxL56BRzsponJiPkUu5ZlIUlvkXpQ
8FHSRqgAZU+h7lkXDUfpXB3pMRqpWUdPTFfLVGOfnfVAzoq1227xYYnb7NgcLbCw
tQDB/J7BifTyjx203oQ2Pqw2FbSYNFIKyyc9gDEMAh7+RVEY6Bj05nR+UjN7MYID
EDCCAwwCAQEwfjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5j
MRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2VydCBB
c3N1cmVkIElEIENsaWVudCBDQSBHMgIQDGW+hPuss5Tc1j96Q5g6rTANBglghkgB
ZQMEAgEFAKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yMzAxMjYxNjM2NDFaMC8GCSqGSIb3DQEJBDEiBCC2Zj5SvhqRLG3bFxSs
CGYSC4JXAwtv69rKHs1hgeCrbjB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQB
KjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3
DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAN
BgkqhkiG9w0BAQEFAASCAYAsYiL9ShcAYhHkfXYkSfRCdgAzG7ELm2yOPA0uI8uE
ZZrSEv++/ux46Mh8NDagqllhLDgZz+NDGiPZO0tJcFSP/avlsXBRmHD6G2lQJ7dB
zcXXXmKlhzQQQnOdfpQ1Iu8fhkNeHBvJ5nqEYlrVa8ojx4oKGvaajOlqpkSBwGUM
BzzbFDoe98lhl+PaP98YnBUaYMS2UvBglxXN9OBANd/GLEj9RAe9QJ1TC+f2uKyF
INYnSfTuGAMUkiodHQ1JbqtqCbBb7z2hCztQr5Ic4V+0JXxM4kgtVUz9qXyEPQ+u
AUfun+wNABA/QRJwvk+56lVFwIT8Jj1Sl7Zt0msI8XBNPmZOgLtJL+J3Qu/9ia8q
vuP5v6HUrR9IkPJ/H0FiiZtyGUS8JmODVWeBPpdjjiifpTru8FhdMsGDs1fT/ZB3
o0AGL1xu4Ivpj/rpsL/QXAnEQe9zTMV5TZsSJ+p13Sb9aQxWcvL/ANCO0lGdwLkM
BRrx5ALtzBFSSHIfHSaeH+M=

------D16962C8B5C2DA686572436187B73BB6--


--===============0545085630929268658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0545085630929268658==--

