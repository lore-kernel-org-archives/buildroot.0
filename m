Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392D9C5B56A
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2AD0402DF;
	Wed, 12 Aug 2026 09:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wlfS4fHoM08; Wed, 12 Aug 2026 09:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEC14402ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786525885;
	bh=Qn8nEqc3ODwKFIHx4+6YjJgO/uGOgznR7W9SMi6+S1E=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jrHmdVOsCqOK4im7S9/94ni6zgSviz+oLM4KMh+uf5BWED5q/oWLUgoIilux/UiaF
	 5SJx4EERw1AivkZ2QJBILT+AJoXRYhg/FEW8VAVn4LQipv+VlOGJucCWIwSZMj7qWl
	 v4Wfedy/PZ6hgtrZYvkO0HHlRFh4hYMFvQmLAA1liJgYQOmoTm6MO7VoQzP1AxJGn5
	 tnR+F7Lej7VEyU5n4HRyldjVDA8yEkvxe12xc9TkhBR8j7/aSSWKLU6Qi1QDSmXBmK
	 +ElqWwmMVO7C0m0hsABzfC8iVEfkqxk/cW+KtSSvMMFXACStqj72E0SV2IZFjTy9iZ
	 dn8qlyeHrQ4ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC14402ED;
	Wed, 12 Aug 2026 09:11:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4705282
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAC9B811E5
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWLgWggrgwqg for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 09:11:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=egorenar@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE325811E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE325811E4
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE325811E4
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 09:11:22 +0000 (UTC)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67C62oBK2632035; Wed, 12 Aug 2026 09:11:14 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvq9hn48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2026 09:11:13 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67C8uLto026217;
 Wed, 12 Aug 2026 09:11:12 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fxesq5gb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2026 09:11:12 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 67C9BBaT39125372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2026 09:11:11 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECBD72004E;
 Wed, 12 Aug 2026 09:11:10 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBDEC2004D;
 Wed, 12 Aug 2026 09:11:10 +0000 (GMT)
Received: from localhost (unknown [9.224.74.101])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2026 09:11:10 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <ansJ5dXXblvYeMLB@windsurf>
References: <ansJ5dXXblvYeMLB@windsurf>
Date: Wed, 12 Aug 2026 11:11:10 +0200
Message-ID: <87h5kzya8h.fsf@li-0ccc18cc-2c67-11b2-a85c-a193851e4c5d.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i7I76Zg9HOfUcyFrn7pu1AzOw1QD9CZa
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a7c38b1 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=BoJB4dgYAAAA:8 a=P-IC7800AAAA:8
 a=JAzQ7B-7aLCJq0t-SBAA:9 a=zGR_d48pMUbmtCY1HACo:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3MiBTYWx0ZWRfX4PSqSUL4keXz
 w2/a1qqWhlbO/8aJKfbkoJs4GHTjPdfGDD7PjA5gEmXr5EUVcgriY0my69uxMeYLRglho0aiCh+
 I9Voq122bMn9pCGdSwRKVfShoeHeppudb3dj+9dnfyvIi6pwqNj49dHNmtxKGcBW1Srl8medyWo
 tDjCOEPcroQFd8448hStoHfsrLLqgOjpnBD+bgx2qRZ1Hddp9TzzsAng1OK424GNsbaGkFxITII
 wCJAU5zUHh4Womue2eZMopq6OEjj8FuN42Gnlm+Leq78voGI15rQuD/eFyOGav5aGNaXZUXrDWK
 34QSXq1jgpv0H7S4AZ1AGWT+kimCe7OXZ6WwxwPOqb6mAqwudBhDlYJmauLYR3VMg2/pB/Rf0O1
 1HtJNWZYaY2qWnHYIYelvKTfxqjJua9Wr19mPUWNMYM1Vr495R8ZWIKiVM4WjrOpL28+fd7wkqC
 or1bH1wqLYLUWYFRlIQ==
X-Proofpoint-ORIG-GUID: i7I76Zg9HOfUcyFrn7pu1AzOw1QD9CZa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3MiBTYWx0ZWRfX7ZFruqSHuWS4
 Lw8ifPHPLS/3WdT3eTw19Wj6M0BsoqQGZvcKNduuU9/xzqnIKWqXCpiov0TSMDfaGU1o8KNC08v
 bDoaoB+PajmJbYN08N8669CPtZ+RTLk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120072
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=pp1; bh=AkSQkvOP1hxMhPzn8E8186iFyY2F0X
 BBKSZaysGzv6E=; b=BazXmlhR4/H/1/ht1mBY7Tf7SjANM5yrtWKS58OfAOFA4o
 xgoDZHGJTyu9GNBt/vMB1xVr6Z6EITjCW327RRxB7Pi1isK1U9VaV+PUIzFH7T2p
 mrBVSQbyHCvoWeeYajkMFpxlsatH6fe45zNkKsXWploZSPvgG5LR7OIuXNbJaS5G
 AJO25PBtUCFfLwc2YSgvdoWeN8DTBbEIh4PCDCk4i4Mvquktj+NVwgUaqZOkLJCF
 QsbOSFoV3SulIygW4gd7/kEgJlTqbluoAyN7R6ILrbbJKynm8gAz5KlxzYFaBek3
 PAuw4BkGuZrf4Je5vDhY+RKZzZOs9fE5mvrpJC6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=BazXmlhR
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

> Alexander,
>
> I am contacting you regarding a build issue I'm seeing with the S390
> architecture in Buildroot.
>
> With the following defconfig:
>
> BR2_s390x=y
> BR2_KERNEL_HEADERS_6_12=y
> BR2_PACKAGE_GLIBC_KERNEL_COMPAT=y
> BR2_BINUTILS_VERSION_2_46_X=y
> BR2_BINUTILS_GPROFNG=y
> BR2_GCC_VERSION_16_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
> BR2_GCC_ENABLE_OPENMP=y
> BR2_PACKAGE_HOST_GDB=y
> BR2_PACKAGE_HOST_GDB_TUI=y
> BR2_PACKAGE_HOST_GDB_PYTHON3=y
> BR2_GDB_VERSION_17=y
> BR2_GNU_MIRROR="https://mirrors.kernel.org/gnu/"
> BR2_PACKAGE_GDB=y
>
> gcc 16.2.0 fails to build with:
>
> ../../../libgcc/config/s390/_dpd_sd_to_hf.c:27:25: error: decimal floating-point not supported for this target
>    27 | HFtype __dpd_truncsdhf (_Decimal32);
>       |                         ^~~~~~~~~~
> ../../../libgcc/config/s390/_dpd_sd_to_hf.c:31:16: error: decimal floating-point not supported for this target
>    31 | force_convert (_Decimal32 x)
>       |                ^~~~~~~~~~
> ../../../libgcc/config/s390/_dpd_hf_to_td.c:34:1: error: decimal floating-point not supported for this target
>    34 | _Decimal128
>       | ^~~~~~~~~~~
> ../../../libgcc/config/s390/_dpd_sd_to_hf.c:35:18: error: decimal floating-point not supported for this target
>    35 | __dpd_truncsdhf (_Decimal32 x)
>       |                  ^~~~~~~~~~
>
> I haven't checked whether this is new with gcc 16.x or not, and I'm
> not familiar with floating point support on S390.
>
> Are you familiar with this issue?
>
> I see the same issue with gcc 16.1.0 in the autobuilders:
>
>   https://autobuild.buildroot.net/results/f88/f88565af0f653df831a7fa43d2507d167fdb9d36/build-end.log
>
> But I don't seem to see any issue with gcc 15.x, so my guess is that
> this is a new issue with gcc 16.x.
>

Hi,

the types _Decimal* require for the host compiler to be built with
--enable-decimal-float.

package/gcc/gcc.mk:
-------------------

HOST_GCC_COMMON_CONF_OPTS = \
	--target=$(GNU_TARGET_NAME) \
	--with-sysroot=$(STAGING_DIR) \
	--enable-__cxa_atexit \
	--with-gnu-ld \
	--disable-libssp \
	--disable-multilib \
	--disable-decimal-float                 <----- !!!


Can we turn --disable-decimal-float into --enable-decimal-float on
s390x arch ? It fixed the problem for me.

package/gcc/gcc.mk:
-------------------

ifeq ($(BR2_s390x),y)
HOST_GCC_COMMON_CONF_OPTS += \
	--with-long-double-128 \
	--enable-decimal-float                 <----- !!!
endif

Regards
Alex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
