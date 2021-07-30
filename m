Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964C1C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 12:38:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D59B60F0F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 12:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D59B60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC2E96073C;
	Fri, 30 Jul 2021 12:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_GxVlJCzEne; Fri, 30 Jul 2021 12:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 431FB60655;
	Fri, 30 Jul 2021 12:38:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46CE21BF3F9
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 12:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F26140673
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 12:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="TN5nEH3Q";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="IlS5LMSS"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bt2idsQEx2kb for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 12:38:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AF94404C8
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 12:38:10 +0000 (UTC)
Received: from pps.filterd (m0075793.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UCUSpI011381; Fri, 30 Jul 2021 12:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=EJrd1GQnVry8KVN71HLjHcbRPcV/lrMtyqPhiyEVlOY=;
 b=TN5nEH3QHwk+Xv1AyBpgKLDCgsBTvqICD3OKtZKHOlrEzz0kBsQl+AQFNuA9oeQqNYoW
 +IVndsbGQObxm+Js0eyMvS5yhntL+jksXywjwXGd5ncbzXRCCpDlVhRHhLdf49EwHydn
 l1u84kcCyVmfjkQmdk7tUfJmE5fEkGikEc3b4XkTqWmi66BtoH+iAJh99LFhYvgKKXRG
 h8kzu22eR2iIzVuGnBUtzGUIZENrkxUnI0vzWoka5y+A3JdmH/UJcTE0OccjIplYNALF
 I68gDsTzwicX0qdNQAbUNtxkLgR7WUzZfvJ5z1MAcaRgrZWGxENAOMNf8zZSLJCSGw4o bQ== 
Received: from xnwpv36.utc.com ([167.17.239.16])
 by mx0b-00105401.pphosted.com with ESMTP id 3a3vn48u40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 12:38:08 +0000
Received: from qusmna5k.utcapp.com (new-mailhubs.utc.com [10.161.160.133])
 by xnwpv36.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 16UCc7Wt192957
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 30 Jul 2021 12:38:08 GMT
Received: from UUSALE07.utcmail.com (UUSALE07.utcmail.com [10.220.35.17])
 by qusmna5k.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 16UCc7C0010497
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 12:38:07 GMT
Received: from uusale28.utcmail.com (10.220.63.22) by UUSALE07.utcmail.com
 (10.220.35.17) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 30 Jul
 2021 08:38:07 -0400
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 08:38:06 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.181)
 by uusale2a.utcmail.com (10.220.63.20) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 30 Jul 2021 08:38:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=j/+VUDovr8ZycGXnDquWOgzv5I6vj6YRzK+Pl1GfJr83GQwDMfjtIUpT+BezYRZcU0AD3QRMuyrPEDdM14HRb6xR2IFDlB9GKUdvMWA1A9yqvcilJrwvA0XIlTnn3aNmuEMsK9RJhLSAz1PmFUf12POMiDS0V4G1VAfhXIFwmX0EbPerFtb6V8U+NpCBGXnWkIOp/2iDuk44ZIAnPvlHBLmVmYCWk/ML9O9ThDZWxJ5nar4NP/aNGCGpTLKxj/truphbWZI+VHobWlqm6Q8bcbF/EtiUGP1J1+MWVsdJgTEPKZlqSKXzlfaBINzqMRB1AY2H7MojbbyWN+n83opxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJrd1GQnVry8KVN71HLjHcbRPcV/lrMtyqPhiyEVlOY=;
 b=ORDVb7lG7Ys+zH8fKHjt7vD2Z74RZvBmfLDAkY7r8uZwWAlmi0zwAI7SeQmVJAgHUjfBrmhLaCrDvynx0eIuUri1R0UTqPilTP58mNDKHcEIgdL7JjHYSPA3A/kadhLqgqah0xAZYlBhNRLr755bm4VTh0n5KLyzF6KhTcgeQ5Mdi1fFPiNbxQTFrzYGsYiTT80JqIgDbdREafS5zeUpNiopf4jHbEA0zYGIA81z3T1nQUI8l3gsds5cl9D6GBXgbYjRMHeuzTWEDs8dnARLruuvmcTBJ7/+9+PF9/xtRioUwxpUj83MAUkg38xCbdn2Dv8iQfmEJ+YDuVv22mTIEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJrd1GQnVry8KVN71HLjHcbRPcV/lrMtyqPhiyEVlOY=;
 b=IlS5LMSSUd5vztv/CY/YjLN6sI7Y6L4ukPXMtFlLgUyDJsf8ZrOslwPXJTL5ETNMsDbYlWZs8ZsTPHHhGXcNVDDXKoVtsYTgrgF9HxQtEr0qA6AYf3LcfFW3Yip463Kpz85KwxqquhCtc9WoeImoGlOqs2aRWp/99BfeU2z2lGw=
Received: from DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM (23.103.22.148) by
 DM2P110MB0123.NAMP110.PROD.OUTLOOK.COM (23.103.22.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25; Fri, 30 Jul 2021 12:38:05 +0000
Received: from DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM ([23.103.22.148]) by
 DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM ([23.103.22.148]) with mapi id
 15.20.4352.035; Fri, 30 Jul 2021 12:38:05 +0000
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] [PATCH 1/1] package/xml-security-c: requires DES
 support in openssl
Thread-Index: AQHXhTeAf7y5O3RthECDmG/jAsUgBqtbb8jq
Date: Fri, 30 Jul 2021 12:38:05 +0000
Message-ID: <DM2P110MB010513D521DF1DB27ECB9E17F2EC9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
References: <20210730113833.3678984-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20210730113833.3678984-1-fontaine.fabrice@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=collins.com;
x-originating-ip: [50.80.23.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27cc9980-f4d6-41f8-75e0-08d95356e129
x-ms-traffictypediagnostic: DM2P110MB0123:
x-microsoft-antispam-prvs: <DM2P110MB01231D733F8F03414C8C5F21F2EC9@DM2P110MB0123.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XSrgPlKqQCLk1pmaquqrppLjoRevp4On7+0j8HhfJOWCCJby8V4RZXR4WHAdUPPbKTqBS2+3dz1yh3mpkg/3ybsJidC3rsgXFyY0iD3lhN4QyM1qB0Dot9nRDnTeFnu07OtEh3IHn+fkYY4dshvfYSEXGCKugj90gsmZix+2bU8bjI1GCLEIm8f7D2HSk2iSRDax6hzmamAi+mqJcF9vYwmkLiUFL0JhIadUuFebXbQe6AGlA8qAUMWze+ojq+X+eEpIrT+pMkKk1dCDvl1ol//bpp/4bqPKyV/Hb/+8ZmRLRwnv3ZfOtLzSUUmPgFluhlAfszzlq/mFggWB5rLYQczUHCmBidOn5oTfyKfRV0GXferGcaynGX9rzbqT/lgyiEJQBABsXD0P0A/zvy2tL5RLnvKCdcd1zJMynhdVENXPNNnGVwguQ/elJLnEv+ABFrpsZzwWYKBFIJxv3lkN8NSQOSHAIueZ7SPlSSqxXh08ikXqfP0aK7XNvB+eZ9owQTG/dyTForpwW9pmYEq4y/HMB2QC/3eI3CIbWOJJxVMehGnr0E1DphxlCh7MAnmzu90gZZUxyrBpdLVQiOfpQOwy69R3FyVksCO4o+gt6JTmJ4PBezB3j0QtiAIpmT6t
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(346002)(376002)(136003)(2906002)(83380400001)(86362001)(6506007)(53546011)(33656002)(316002)(8676002)(26005)(7696005)(186003)(110136005)(8936002)(956004)(9686003)(55016002)(4744005)(478600001)(66476007)(66946007)(64756008)(52536014)(71200400001)(76116006)(15650500001)(5660300002)(66446008)(66556008)(38100700002)(38070700005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: Z4FzWesOCCveYYSXcgFm3nTTBEwU5O7X/PEfNCjvyztn9uY8qYT1PxUXyGSIbI6AKaeDX95sWHm5ZEncxfTAeuMYcmXmO53fA4wQUbWwlZ5tkv+gSV6BNh9THsKX854lEe2qOZD5c72hfpkXyOdxpP89D6/7jwNRUbdpszI3paUryQ1TNXZmJJ4r5dFh88ov0CuY9icA6SvUe4z5B66aULAP41HQ1pcIBz/QZvSLW+JSww/mq91zve3boYJ/2GlC7sTJVpIkaZeOZtmebTsmF7pTTiKDCmxOsvMabFPddG+g9IvHDvZha9HNPHwjfp0O5cUOuWAmGUJalJheSmAG5+WoXnM8prKNDSqvD5nHE9v0OpokbkzD60xVPMSEFdX7Kft7F+AMt05GHLDOG1vxpR3k1osC56dxsmDeiuQ5Ix8KSg4gxi7GMNbCO+KAy3girEsiVMdvbg46Do97b7p2nJ8V7lqq/WZxESIQkbAKxjX8MbLmM9mSaQyVdOYkyGOc4MWi/CX13ccW0Ciho6sw451gDFhQ4qBbEpua8Dw8evaP8dvS3ZStmcJpaWX2DiReGaNCotvZxoQJxMQeI+88WY9W4MWXZN0ObsBb9A+mMKxPYWkimWaNMkvoPKIdGNHiu/aGT0mMZhmF3v5AbafnYK2AnbjSnf1UUis6sEN2vnjSfLmlvQHxr4Da/LILGFe7sEFnRRA0CxQOh9NedIfW6g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cc9980-f4d6-41f8-75e0-08d95356e129
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 12:38:05.7970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2P110MB0123
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-ORIG-GUID: bmZyMiOwIHMWM4haj_SI0vjHQTEp2Zqc
X-Proofpoint-GUID: bmZyMiOwIHMWM4haj_SI0vjHQTEp2Zqc
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300081
Subject: Re: [Buildroot] [External] [PATCH 1/1] package/xml-security-c:
 requires DES support in openssl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: "Weber, Matthew L Collins via buildroot" <buildroot@busybox.net>
Reply-To: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice,


> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Sent: Friday, July 30, 2021 6:38 AM
> To: buildroot@buildroot.org <buildroot@buildroot.org>
> Cc: Weber, Matthew L Collins <Matthew.Weber@collins.com>; Fabrice Fontain=
e <fontaine.fabrice@gmail.com>
> Subject: [External] [PATCH 1/1] package/xml-security-c: requires DES supp=
ort in openssl =

> =A0
> Enable DES in openssl to fix build failure raised the addition of the
> packahe in bbda38afbbfa79ff436e1a187bb267b8d9558036

Tested-by: Matthew Weber <matthew.weber@collins.com>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
