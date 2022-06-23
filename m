Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2457FC43334
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 15:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61700424E4;
	Thu, 23 Jun 2022 15:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61700424E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2UeDnnrBDHE; Thu, 23 Jun 2022 15:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B3C94157B;
	Thu, 23 Jun 2022 15:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B3C94157B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24C1A1BF2BC
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 15:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F16B36141D
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 15:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F16B36141D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bXG47mnPwura for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 15:35:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B9B260AFB
Received: from mx0a-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B9B260AFB
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 15:35:11 +0000 (UTC)
Received: from pps.filterd (m0081755.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 25NFQq0I007722; Thu, 23 Jun 2022 15:35:10 GMT
Received: from xnwpv37.utc.com ([167.17.239.17])
 by mx0b-00105401.pphosted.com with ESMTP id 3gvtrm85pw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jun 2022 15:35:10 +0000
Received: from qusnwadw.utcapp.com (QUSNWADW.utcapp.com [10.161.48.87])
 by xnwpv37.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 25NFZ9Tt097749
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jun 2022 15:35:09 GMT
Received: from UUSTOE24.utcmail.com (uustoe24.utcmail.com [10.221.63.38])
 by qusnwadw.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 25NFZ87S016388
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Thu, 23 Jun 2022 15:35:09 GMT
Received: from UUSTOE20.utcmail.com (10.221.63.20) by UUSTOE24.utcmail.com
 (10.221.63.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.27; Thu, 23 Jun
 2022 11:35:08 -0400
Received: from UUSTOE20.utcmail.com (10.221.63.20) by UUSTOE20.utcmail.com
 (10.221.63.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.27; Thu, 23 Jun
 2022 11:35:08 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.184)
 by UUSTOE20.utcmail.com (10.221.63.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.27
 via Frontend Transport; Thu, 23 Jun 2022 11:35:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=vkpE+a3dJ0NNBkQRABGh3c+ML4zjet5jaBtxZTTKzIfTwPzysF4hGtftHkqBWWKn0WgaKKCMprAMNbICFsvZtlFScE+VeT+HJu1jYU4ABK6/g0bAcoGBP6z58P8xyaoOggJTKqimsL7dE4emhnGYIUaAlFVCEVT7+WKdRD9Uptb2QPmbf5uQQNzIe6GZAlwKgpnbYG+LI7rgMkvAZreGK4SfsdOtpFw9zEaheHGmVYl5h13bXjm6OIX9MaBBV7yJBerSmcyT87+E8ULh2xUhqXIK1p+ILhgDc4cyTuPCFg0nR97osd/jCvr4aUB5X8f0HEmhvE6yWT1CIgM0PqG+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBbLIlP6VvesKabBE+hy/GbciH5ImDhYVPnKU/dYzi8=;
 b=Lpg+qRHI0yAZ5UaRUWYEHwzIa9ZASzjj8hKWnKrcMDPIov7UXASDlxEh1PglpDpQVdwaziEVsvDbYQ00lmC0CD8/J8Y3VTmDpQXnKdsH4//5rCR+3c/RB75hwo+3a4IhJUCeAMI/Xxz1DrnulOpM/tfVrrwvBtRuxeFI+r0RxG3nTsa9C9SL9F/P85/NgbPWgB2fs6nWti6oMCXTOvSrSz/31Nsp23iwlEbhjPRrw2r0n1TJlvNX+jWoPoAJgXZccKkNdWEiEMdhRz7FEmkD0Gr9HeA64lyecKbeIX50NIafOMVv7LaLYq8+7IWuwrOEcQnu2s1RRBjMAufsUXshIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
Received: from BN0P110MB1290.NAMP110.PROD.OUTLOOK.COM (52.145.38.73) by
 BN0P110MB1227.NAMP110.PROD.OUTLOOK.COM (52.145.38.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.16; Thu, 23 Jun 2022 15:35:05 +0000
Received: from BN0P110MB1290.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5d87:4579:fca9:4ea9]) by BN0P110MB1290.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5d87:4579:fca9:4ea9%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 15:35:05 +0000
To: James Hilliard <james.hilliard1@gmail.com>
Thread-Topic: [External] Re: [Buildroot] [PATCH 2/2] .gitattributes: default
 lf line endings for text files
Thread-Index: AQHYhn31+JnfA1vwT0icxvsYQiMiZK1cfbcAgACd/EA=
Date: Thu, 23 Jun 2022 15:35:05 +0000
Message-ID: <BN0P110MB12906EDEE024D8FFC38A969A84B59@BN0P110MB1290.NAMP110.PROD.OUTLOOK.COM>
References: <20220622212045.573-1-james.knight@collins.com>
 <20220622212045.573-2-james.knight@collins.com>
 <CADvTj4oBhC8JWcr3M_4fEfwtR2ANCg1F5BU1dWNuqytJTLvFTQ@mail.gmail.com>
In-Reply-To: <CADvTj4oBhC8JWcr3M_4fEfwtR2ANCg1F5BU1dWNuqytJTLvFTQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9787578a-88b1-48e3-cf66-08da552df279
x-ms-traffictypediagnostic: BN0P110MB1227:EE_
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sNx8OF2751WiWZ0UdBx0IWKVER2cy/6faixxPfAheXeHa3DJgrtaHEWnumDvpDhs+fgd8UbAQ9gEuEksFtdrsWFP0ZJwN66XHVGuQ65Kpgjz71HFIIddRswFabv5a1REGMMLx+ntWsoEFjoKMEcunfz5XrQVj4JAsOUyGKbZHm4ZJ0FAi8x+4FqitMGhqGSWTHRNDiJrD4njCE4ZgpwhfWdwrpYajLg4MHlZZnZTwBXoIGeOQS61yUmnpE2ijsaIlr9F4kSlW0K9bVrv49qrcCdfq2w+E6M3bb30qdxxFy6HmMhvGqcapDnfwT/GRnPlDdaqpST9RJnFUzaJhMirjLRpUPEgiS3pu4PYcXYFuSvbh3PXeDw9C4g3i54kcrF5pgpgcLDqXYcA1WrVbsIYWvPbvwYO/D+EizA91jGIWcTJzZfpvCislaMPBDCvGLCp2E2Nwa4AuM4MTzvVVTOHx5v9PzBigaIXbiv/9N7l1c1VFxqBDT/sgjPR+wA/fvJCiu0tgiXgTQNi3eKGFrE0OPI0JOmIYhqG1joOJhUwLT+UoUmOEPVgFbbdsPVtXkzmbgJBDt6NFHiCRB3rFdz6SFC+q5WfFGyHkeLi7/zdAmla+IkFbVl8qyuUwBu3xNBD2/160LEHtkc68mCJgxj46KRPIDLgXvEVqdxp9d10JqaOvV8Bw9iildAE1ibG9lpZ5ILduO1VODerNyMeLioKNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1290.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(5660300002)(83380400001)(498600001)(66446008)(8936002)(66476007)(52536014)(2906002)(71200400001)(6916009)(66946007)(66556008)(8676002)(4326008)(64756008)(55016003)(76116006)(6506007)(26005)(86362001)(33656002)(9686003)(66574015)(186003)(122000001)(38070700005)(38100700002)(7696005)(82960400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: nWYKpwOqaxDb2cXaMEqIaZflpkT6qhwO/1G+XayQ3V4H585YfvWfJLSk3xqCIjd9PMjnQch8BDiNMiXqM52MA5g43o5dO51TgfqgfBDw2nw2rVPhyKfehxlnDfS5hyTtXglcvcU3JdPsqVs5HsSpvbHP4GOf3LV16+3/V/IIrO6SybbEAj6W3MZGT7yKUR2jFvX9l0bhprOyBj7/5AmHAMMolo5a0GTdaw92rmqUMs5/TmTlrG7VSzzR14DcKsqKwf6ufOaCuWki9oiDvk5HaMWfLey7LYrGY3w2vBte2TFU1ngY98oLsnBu8m0D670PpKNzTvtQYA0ouA3FjM5w1TCY3B2bU4Lpj6fub1Q92v8Vsz/wfUnn1VmBEm1bMKk+b7tcb/ySI/4HVyTcAl9/COLWGeDQnMZ467Uw2Djqnbs=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1290.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9787578a-88b1-48e3-cf66-08da552df279
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 15:35:05.6149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1227
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-GUID: 3uxyEecG18J663NFKrJgftfg9FdIAs0D
X-Proofpoint-ORIG-GUID: 3uxyEecG18J663NFKrJgftfg9FdIAs0D
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206230062
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=bBbLIlP6VvesKabBE+hy/GbciH5ImDhYVPnKU/dYzi8=;
 b=LiTTYZJZXTqAdV+4BjQpqjmsxak62w8fu2nSP56KpJqBv4uGx4ipOFpxhw4v/JqLZ/zs
 O7d6SxiMgENA4LGlasa8gi/YTsUAGR3OnLFq6iQSXSyvDJrjYLg4SDfzMqezAu9ksXDC
 AGaCvuButcRb5bcct/JflqJmfzx3gUQE9e1/WZQHhiet8AKNZDTsB/7zCVtZ5adYGDJP
 n4UtaeG6SDZZaty6sw70rLmCtBfkmqj0xiw4vdJZuDwAsYQ4PmeZPxKRCq6sN0W3VGfx
 uDil568/ZT9hzpxhLoAXzBRYjU///JBqSR+puQTKUisdhF5BcOz9DMK2j9QKpx9DUC2G Uw== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBbLIlP6VvesKabBE+hy/GbciH5ImDhYVPnKU/dYzi8=;
 b=gkPIx5l7a+1MyJd3dDNR8LN5N2Z0TOs2Upx7z7FDT9H0kWpbWPs+oS3v/H1AcsxHdB8qDTCgbW21hr9s9W8vE8PVeXqJTxni9reYjsLLjF2LUQc4Riw5D+qTNT1pD3nWjGOCbttzv313B6Ct0Agzymt65rFuOR2ClvaaNx7l/mw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=LiTTYZJZ; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=gkPIx5l7
Subject: Re: [Buildroot] [External] Re: [PATCH 2/2] .gitattributes: default
 lf line endings for text files
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
From: "Knight, James D - Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Knight, James D                           -
 Collins" <James.Knight@collins.com>
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James,

> -----Original Message-----
> From: James Hilliard <james.hilliard1@gmail.com>
> Sent: Thursday, June 23, 2022 1:52 AM
> 
> Been a while since I've tried sharing a Linux cross compile env with windows
> but I recall things tended to break horribly due to filesystem case sensitivity
> issues on Windows based hosts.
> 
> I'm curious if that's an issue you've run across with these hybrid setups.

For sure there are issues for some things, especially when trying to manage the Linux kernel in a Windows environment. Typically, when trying to manage some Linux sources in a Windows environments, I utilize sparse checkouts to work in some areas of interest which do not have case sensitivity issues. I have yet to try Window's recent case sensitive file system option.

With respect to Buildroot, typically "real" builds I perform are solely done in a Linux environment. For misc. development, I've had success managing Buildroot (and other) sources from a Windows environment, and configuring Buildroot to output ("O=") on a ext-configured disk/partition without any major issues.

Although, it has been awhile since I have had the time to work with a newer version of Buildroot, so I don't know if there is any other new concerns. The use of symbolic links within Buildroot appear to be working for the most part (with a supported Git/Windows configuration); aside from one issue that can be with a proposed patch to "skeleton-init-openrc". While the proposed change to `.gitattributes` can make my own life easier, it is not a show-stopper. I don't mind sync.-ing two Git working directories off a Git repository in these mixed environments. The related change for "skeleton-init-openrc" is more key, since I'd rather not have to deal with sparse checkouts when maintaining/cherry-picking patches for Buildroot repositories when sometimes operating from in a Windows environment.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
