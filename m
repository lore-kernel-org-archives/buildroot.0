Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D44C5AD5A
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 09:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C3C608B3;
	Wed, 12 Aug 2026 09:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F90EggiH3vmS; Wed, 12 Aug 2026 09:32:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02D83608AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786527175;
	bh=Sd4DUI1jTGlcfBwA0uez2ZMMQvQHzz6kGyhuFBES1VU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TgIcMbPCnok4i8obZmqCuZlya+wgZSvajCDolWHirsIjqHxMm9onOfsDMu8sGBHAH
	 uGQ3lNkVO3u5iv46wStOmz5ZeLPXcxrROrOi0tBhEFYSjzIxXCuBuFZcrPYn9AcW3C
	 hukoXJJ/BWmHkd2yGH3T/VDYrWyLZLfmZDzgiBH6WF2GPwYNtmhO2pGBFF10+Fvbd5
	 zydflpwKwXpetxWQbSLmSLTHfqktRmSK8ufTktFP5l5OIOchhUNRBluUgTIk+oeKnB
	 DZWhadwu3vxwg5XfLVS0nUMTx631w7AobprGvKYWu9AWYr695qyY2ucRyo10WcTn3c
	 m2TGsaXvudlXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02D83608AD;
	Wed, 12 Aug 2026 09:32:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0825149B
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E484D608AD
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59S88FZdGOp8 for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 09:32:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=egorenar@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF211608A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF211608A7
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF211608A7
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:32:52 +0000 (UTC)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67C634XQ2708446; Wed, 12 Aug 2026 09:32:44 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvnw8yn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2026 09:32:44 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67C9QPHg002577;
 Wed, 12 Aug 2026 09:32:43 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxg9h5av1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2026 09:32:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 67C9WgAH30605682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2026 09:32:42 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 436942004B;
 Wed, 12 Aug 2026 09:32:42 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3334E20043;
 Wed, 12 Aug 2026 09:32:42 +0000 (GMT)
Received: from localhost (unknown [9.224.74.101])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2026 09:32:42 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <anw8fVxA-RNGqSl1@windsurf>
References: <ansJ5dXXblvYeMLB@windsurf>
 <87h5kzya8h.fsf@li-0ccc18cc-2c67-11b2-a85c-a193851e4c5d.ibm.com>
 <anw8fVxA-RNGqSl1@windsurf>
Date: Wed, 12 Aug 2026 11:32:42 +0200
Message-ID: <87ecg3y98l.fsf@li-0ccc18cc-2c67-11b2-a85c-a193851e4c5d.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=RsP16imK c=1 sm=1 tr=0 ts=6a7c3dbc cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=P-IC7800AAAA:8 a=Qcr0OICp5OepfDK_FJYA:9
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: Y4pNUJMfv1mbB5FvbAnxiova42J1Ez0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3NiBTYWx0ZWRfX87JRr6QHv/FY
 2JBUNC0oD5T9mVYQzwOc/oOnpOxCOPrus5W0FwVTIdHjLWXTdVtb9aG8pv0fbPpFPNGcvPC3iQR
 gMl1sZaw1axrwAdWmVrZLvqO47/0Ihn69WdpsaQdM8BT4U+IhwfCV4QtadimdiISCCv9euCTrJ4
 2j9wtgVNgw4i8a/k/7ItZD9oRwBgYDyKOOkhhxYqzDTuoZV1i+V6DNm6kIBryuSa9qhaAYMA1SL
 kgxCkcS+E81LeYSFBYSviVURN7RMLJHZNtC9K17wbsJlmjo08+6VxinSk1aChLweJ/YbFyQFnZP
 qv2JYsoizigLKoIteQs6UnXQupgGbO3lAenvNLGQLusy0YyyJ8dBBvLF02f0f/mxUmfWE9PYtbS
 Ju3eKBahJH93fJt4IO6O0dBO0Y4rj2cbzpE5doJTq2bHI3NVmmekdvkHByD2Y1jkcklT+umDJ4A
 OW/WU/aF5utrB7n5gsg==
X-Proofpoint-ORIG-GUID: Y4pNUJMfv1mbB5FvbAnxiova42J1Ez0i
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3NiBTYWx0ZWRfX7h6j+7uCvQXN
 y80zseXLDKnG8/dADVjO0Y2NrkVMLWOLPxLd6kRVXxwKHNekoY4x07CMAeBekwW+ITqEu6mpoXY
 M6jsjRyOQrdzxpYjapqiXmBPm6HdAyw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120076
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=pp1; bh=xsqodur3EFbv/GurYGTTfV0TQ1LFir
 UadITTG67HRuw=; b=YMJzNvCzH9eLxgOBXG0/uxpwkRYWI9aS1Yp7D2mrTbABK6
 04LcQmDb53Lut5FmMI8J2VhjyzTwirc/a3ygmndbMyv1GwMWKHMbP4t8M0+AgZO6
 4iQnNp/J5DJ1yfw2Nh2ajEXJeCx1pkzhmLoJc4D6SPmI4P33szUQaTafFNJE2F4y
 02wiJfidBpbXyCbsdZos7cpTSJOkdhNHvzzF41KbeTSOZ3XeMD1LLIRsKT1GmxO3
 zu379wWj2qm3cfAqYfLUSG5/jK1nr5qOc3w6yQ6QPihWbbm9G3y5G/g1dELFNDCH
 Kre9sCEPe3JrLN8vNIZBiV/AdpAkUHppnbCJtArg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=YMJzNvCz
Subject: Re: [Buildroot] S390 Buildroot/gcc build issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> Hello,
>
> On Wed, Aug 12, 2026 at 11:11:10AM +0200, Alexander Egorenkov wrote:
>
>> the types _Decimal* require for the host compiler to be built with
>> --enable-decimal-float.
>
> What do you call the "host compiler" in this context?
>
> Are you talking about the native gcc compiler available on the host,
> or the cross-compiler built by Buildroot?
>

A cross-compiler built by Buildroot.


> and for S390, it gets overridden.
>
> See: it's the same variable that gets appended, so at the end we have:
>
> HOST_GCC_COMMON_CONF_OPTS = \
> 	[...]
> 	--disable-decimal-float \
> 	[...]
> 	--enable-decimal-float
>
> So on S390, the cross-compiler is built with --enable-decimal-float.

Sorry for not being clear here, this was added by me for testing ;-)
I this change is okay, then i'll send a patch.
Not sure here, do we need to deal with Gcc 15 conditionally here ?

Regards
Alex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
