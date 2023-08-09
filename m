Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51F2C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 12:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 295A941489;
	Wed,  9 Aug 2023 12:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 295A941489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0buIsbHHR19; Wed,  9 Aug 2023 12:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B5CF41507;
	Wed,  9 Aug 2023 12:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B5CF41507
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 115141BF316
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 12:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD1D381E9A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 12:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1D381E9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZSRebz-3FXT for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 12:19:36 +0000 (UTC)
Received: from mailfo01.lmco.com (mailfo01.lmco.com [192.31.106.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93A2781763
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 12:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93A2781763
Received: from lmxpvfgd06w03.us.lmco.com ([172.23.84.34])
 by mailfo01.lmco.com (8.16.0.42/8.16.0.42) with ESMTP id 379CJSlD007225;
 Wed, 9 Aug 2023 12:19:28 GMT
Received: from lmxpvfgd07w01.us.lmco.com (172.23.84.40) by
 lmxpvfgd06w03.us.lmco.com (172.23.84.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.2308.27; Wed, 9 Aug 2023 08:19:27 -0400
Received: from USG02-BN3-obe.outbound.protection.office365.us (192.91.171.229)
 by lmxpvfgd07w01.us.lmco.com (172.23.84.40) with Microsoft SMTP
 Server id
 15.1.2308.27 via Frontend Transport; Wed, 9 Aug 2023 08:19:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=JUd59sTpoPSw/02YYsmI77syFN1ajSiZUswbx1nIe3nryGNVI/Nl6FmvIATfIDEa+GousEkWK+AZPEUfoPDAmyGjZhHeXdtd/HLwc9PXdCFmv6JCatt/ApkgrD2hYgeMvCXrKY1WsdsXLqx6lGdlEQJ2ZQoCZlDAVHeVbJkQRCu452Cd8UES6y6jqpxu10UZgeQHm5rLpNLrxxUybydMRCBUKRkmp/y+Ez1eXunziIrEdmW10ubMqQ0IPl+TMht0TDPZqciaQsSxPW+Lp+/J9LtG3MBuPTrAkcAS2tF+gOdV30GlEyHMzXkLj9QfPl19wCEPg+HGGYGMg8bUOcldhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8IWb1zzt5Fpy1Vktlybotl1nhBg6VNWxnZ9QRu+o6M=;
 b=wgbrgSkbct0D1BrHDTkzVEDC9ZSIZ3E6jKbHe1Dt1BYG0E5pE3yI8VvBEHWU2TBg5y4K/XLs3eVdDIADhiw0NS7R1eMqWJMHO4HdPk2irH0m/1FraDElnprPNiHzCBmsOajjzYXbOT7rZds5BsAtb6QWzGvCEwP9h/7KY+6hGiPvB8HGl4oOSCpPZBDdjfV+1VLWObpdCdlp72bd0GhSNKmZbK8NoNlFMK0WvZxwVTuW+Qeg+vnAkizajomUXDA4UyzZgsutYMLvJsX86XYslLLvHDA5QQACs34sdeRSdlOYFPcq+oK+JQTMN6/XNkXLBe504Zket2+jyUwKaVbpEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lmco.com; dmarc=pass action=none header.from=lmco.com;
 dkim=pass header.d=lmco.com; arc=none
Received: from PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18f::19)
 by PH1P110MB1538.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:188::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 12:19:25 +0000
Received: from PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1f77:559:711d:72d6]) by PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1f77:559:711d:72d6%7]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 12:19:25 +0000
From: "chris.wood@lmco.com" <chris.wood@lmco.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: EXTERNAL: Re: [Buildroot] FW: Buildroot Licensing Issue
 Uncovered 
Thread-Index: AdnKQuJsEf7r/vumR9+PVhtne/eqMwAB4kdQAAAsqbAAE0zmAAAIf83w
Date: Wed, 9 Aug 2023 12:19:25 +0000
Message-ID: <PH1P110MB1155DC279FDB977453E573DFE612A@PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM>
References: <PH1P110MB115562DCC66A2B57EA65AB0CE60DA@PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB09929404D9FDB9F5E043A920C60DA@SA1P110MB0992.NAMP110.PROD.OUTLOOK.COM>
 <PH1P110MB1155CA9BDBBEADDFE214E69FE60DA@PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM>
 <20230809100554.62bae1e6@windsurf>
In-Reply-To: <20230809100554.62bae1e6@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_ActionId=0481f359-f5de-4f51-98f3-c589772f9f90;
 MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_ContentBits=0;
 MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_Enabled=true;
 MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_Method=Privileged;
 MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_Name=Unrestricted;
 MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_SetDate=2023-08-09T12:19:24Z;
 MSIP_Label_502bc7c3-f152-4da1-98bd-f7a1bebdf752_SiteId=b18f006c-b0fc-467d-b23a-a35b5695b5dc;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1155:EE_|PH1P110MB1538:EE_
x-ms-office365-filtering-correlation-id: 9f15d9a8-ba91-4935-26c3-08db98d2df0c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j6cbrHAZpT7LHaoE5pLnEGBWo9Ky1ZATyi6Lh3/Ohbpx0zIIkb+ue2i8oyIsaawLNfqY2pkBRUiFuz74vP22ZPru7AOb9OfnwR1NS//d867tSj/A7QpHWG50cRRWLlIFDGqtGlR++sFeHXzmvxa8JdV03CAb0XtMAxEJ6Qyi1RyUCYwACE8WyxsSuzAeEeD88Vh6mqGjDM46pR5HhHISnmEsMwhTpjfqrsgnNEPZyeCIrjpRXgxX4wxxkPIyjTdBJ+JEASV53Mp7HYMxqGkybFgr7xgaBv54LfwKdHUbeOQL5+IdXNZWnSdtbO4wL/6mlCehGvuAt5LdcbpOlfMo4fkUNbAAT+4/RTNb1KoDA4DEEct6M4a4NSuXaSz2cQgwMSd2bCAUJ3a8xth4940I37GA3CYHv9hTMfpKCkuD9oInuo9+4BJObkYm3GQrWMidXrQGveNn1cSFWY+HairTR7OXHF2b5gAm2NYr7U25yFQ1DqRBzrRqohje0AvjSLOHfd7eOYira+avuLP05PZfZRDczZFZGTsEyT5LJYUJrWLvRyMR77P5Hz2o6TkTY/RXvMCqBBk13/1J3Knwm1Nt9LuTZBSMLWrTnvNZAZsN9Oz+nL0xhbzApIOwmESyXKpHtlZaMZ5Icq2tZMgK3ugw9Op8HmH/2QmiX4VhcLltYZw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(1800799006)(451199021)(186006)(8676002)(4326008)(66946007)(66556008)(6916009)(66476007)(52536014)(76116006)(86362001)(66446008)(64756008)(8936002)(55016003)(38070700005)(2906002)(71200400001)(122000001)(498600001)(5660300002)(54906003)(66899021)(38100700002)(33656002)(9686003)(7696005)(53546011)(6506007)(26005)(4743002)(966005)(83380400001)(41080700001)(15866825006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: KOvYLXZ7vWqvxAfSXPu4HIr4k5JwercXQa+4l6Zh0w6TvoNVzr3og8ypTRoVBxxllSaE0VGhMLbUxRzqpphH3wxqiLftXp0nf7EbQ3wvOE8ro8uQB4RSLVy+b6axZ7Vq0cpUkG91MU5zcRyEF8XHKAke5iynP1zxO+qwZcjU+aQC0AD7f8mA9U0/yI7kyKTLQB5p+9TH2KNwdXT94n1Uqi7I8uSGUXSNWBIXllMmcIXBSL+y20d3Gm6sC54CgKzCJfHQDXtV1QhevDCHtKGLZc5OkSCVHrlbCzxhHTEDmKpPAtSx5JEeXy/Mo1PNjK8f6MMxesWNRY2dQYjXsnZiaWr1MuI42rBNaHZEt6dM0NNalYaqO11stkpclz+Oc7wHAVslNmIRQ5vWHmt0CjuzxH9x/Fp5zTxTfdXUQ+OnXqc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f15d9a8-ba91-4935-26c3-08db98d2df0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 12:19:25.5680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b18f006c-b0fc-467d-b23a-a35b5695b5dc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1538
X-Proofpoint-GUID: hPxvM88RnYx98LxP0T1oY9kAtWgSpgg3
X-Proofpoint-ORIG-GUID: hPxvM88RnYx98LxP0T1oY9kAtWgSpgg3
X-LM-Outbound: External 172.23.84.34 cntry=**
 g=hPxvM88RnYx98LxP0T1oY9kAtWgSpgg3 q=379CJSlD007225 m=1
X-LM-OBSENDER: chris.wood@lmco.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.591, 18.0.957
 definitions=2023-08-09_10:2023-08-09,
 2023-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090108
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lmco.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corpgw220615;
 bh=M8IWb1zzt5Fpy1Vktlybotl1nhBg6VNWxnZ9QRu+o6M=;
 b=e77JCDTqCUlSEISpfCTlaMY9eDvNQt1NJ6qD4Trc/VwnSzdphkNUfvaClQi1k4/tQIqO
 QR50+K3gGXZ43bbbXemiN+ktEL42sx198iX7pGapXFHJ1PoG/82P1tA0ziosXZlq/A5u
 4dbDDXclk8aEugy2QWzJz9wyAtKKhtbzcr8XVgAIXstL3yCwdG8CZDx65UyhpqpmHGpB
 66hb/JabAE0a9w8zmprJqfWtlSf9wTW85PN1QQR+j8OL47a4ltc1eihO22sRvwhVtH95
 lvEs0Avqra2igWyW14Uiy9nU26+WDt+qG5uAv5EZXWfRXbZZ+7EJcI01nxri1N9Iorht 9g== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=lmco.com header.i=@lmco.com
 header.a=rsa-sha256 header.s=corpgw220615 header.b=e77JCDTq
Subject: Re: [Buildroot] EXTERNAL: Re: FW: Buildroot Licensing Issue
 Uncovered
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas
Thank you for your quick response, it was much appreciated.  We do not use the NXP boards or software at all so removing it completely from the package would make the software more easily accessible for development purposes with other architectures.  If someone from your team could remove that subdirectory containing the 5 files that create the patch and call the NXP website, it would be appreciated very much.  I agree that in 2012 software licensing analysis was very much unexplored territory for most of us.

Best regards
Chris

-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
Sent: Wednesday, August 9, 2023 3:06 AM
To: Wood, Chris (US) <chris.wood@lmco.com>
Cc: buildroot@buildroot.org; Alexandre Belloni <alexandre.belloni@bootlin.com>; Yann E. MORIN <yann.morin.1998@free.fr>
Subject: EXTERNAL: Re: [Buildroot] FW: Buildroot Licensing Issue Uncovered

Hello Chris,

Adding Yann E. Morin and Alexandre Belloni in the loop. See further below for some feedback.

On Tue, 8 Aug 2023 23:01:40 +0000
"chris.wood@lmco.com" <chris.wood@lmco.com> wrote:

> We are desiring to use the buildroot software version 2023-5 and were 
> performing a licensing scan for the purpose of creating Software Bill 
> of Material and came across a reference to a license that is not an 
> open-source license it is an NXP Semiconductor commercial license.
> The licensed file is located in the boot/directory/lpc3200cdl, and the 
> file containing the license reference is 
> "0002-delete_redundant_files.patch". The reference says:
>
> "- * Software that is described herein is for illustrative purposes 
> only
> - * which provides customers with programming information regarding 
> the
> - * products. This software is supplied "AS IS" without any warranties.
> - * NXP Semiconductors assumes no responsibility or liability for the
> - * use of the software, conveys no license or title under any patent,
> - * copyright, or mask work right to the product. NXP Semiconductors
> - * reserves the right to make changes in the software without
> - * notification. NXP Semiconductors also make no representation or
> - * warranty that such application will be suitable for the specified
> - * use without further testing or modification."
>
> To obtain clarification on the statement "...conveys no license or 
> title under any patent, copyright, or mask work right to the 
> product..." we asked NXP who responded that the software is freeware 
> offered to customers purchasing their boards, and that it is not 
> open-source software and furthermore stated that they have no 
> relationship to the buildroot software product and wondered if you 
> have an agreement with them allowing you to include it in your 
> software.
> 
> We are hoping that you can provide licensing permission evidence or 
> other actions that will be taken to clear up this oversight so that we 
> may use your software without concern.

Thanks for getting this to our attention, very interesting.

A first point of clarification is that we do *not* include lpc32xxcdl in our software. Buildroot can download it and build it from you, but from a licensing perspective, lpc32xxcdl is *not* distributed as part of Buildroot. It would be distributed as part of the embedded Linux system you build with Buildroot, if you have enabled lpc32xxcdl in your configuration.

Another aspect is that the lpc32xxcdl package is quite old, and back then we did not include license information about the packages: you can see that boot/lpc32xxcdl/lpc32xxcdl.mk does not have any LICENSE or LICENSE_FILES variables like most of our packages now have. This means that lpc32xxcdl has been added at a time (2012) when license review was not done in a systematic fashion like it is done today for all new packages that come in.

I am not a lawyer nor a legal person, but I agree that the words "NXP Semiconductors assumes no responsibility or liability for the use of the software, conveys no license or title under any patent, copyright, or mask work right to the product" are very unclear in what they allow to do with the software.

Are you using lpc32xxcdl in particular in your product?

Based on the unclear wording of the license terms of lpc32xxcdl and the fact that LPC3250 is a very old platform and there hasn't been much (if
any) interest about it for many years, I would be inclined to say that we should simply drop this package from Buildroot.

Best regards,

Thomas
--
Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
