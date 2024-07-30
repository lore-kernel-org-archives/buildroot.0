Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F24CC3DA7E
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 13:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04A83401DF;
	Tue, 30 Jul 2024 13:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YkhGyIMD5QlP; Tue, 30 Jul 2024 13:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBA4E401E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBA4E401E2;
	Tue, 30 Jul 2024 13:33:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47E1B1BF404
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 13:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F23E6062D
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 13:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sf62_AKYJeCz for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 13:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=egorenar@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7357C60609
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7357C60609
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7357C60609
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 13:33:49 +0000 (UTC)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UCSTgS031396;
 Tue, 30 Jul 2024 13:33:46 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40q074r516-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 13:33:46 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 46UCkw38009181; Tue, 30 Jul 2024 13:33:45 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 40ndx2vh3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 13:33:45 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 46UDXfrC15794448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jul 2024 13:33:43 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C02EA2004B;
 Tue, 30 Jul 2024 13:33:41 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAC3320040;
 Tue, 30 Jul 2024 13:33:41 +0000 (GMT)
Received: from localhost (unknown [9.152.212.85])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 30 Jul 2024 13:33:41 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240730090853.1a124735@windsurf>
References: <20240730064202.72774-1-egorenar@linux.ibm.com>
 <20240730064202.72774-2-egorenar@linux.ibm.com>
 <20240730090853.1a124735@windsurf>
Date: Tue, 30 Jul 2024 15:33:41 +0200
Message-ID: <871q3bngwa.fsf@oc8242746057.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ejxt7hoL2Pc9WUITi7LN3zxppc0rKoTt
X-Proofpoint-GUID: Ejxt7hoL2Pc9WUITi7LN3zxppc0rKoTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_11,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407300091
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from
 :to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-type; s=pp1; bh=wxKo96W7AyeDvq6Q5hSf7a4y1q
 AttKZHwy6RwzHK+1U=; b=TVRpZRW+5k4+5/5CPC6Y7zC3X7AcKnYO16EXh+tSvW
 eK5TYbtUPxKJ9HMclu1zEmeoMOE7noM9zJ3PjHHtEV4jzapN/1trsuB3WZ7iguVP
 qUYOmFweBOpzs9FD1ueRDML99J/8ySbzaoAZ2WF8qFlcMFL4gotGj6L/MfNHOBPB
 Od+eOmk6L4eV6TH+nCq18XG/n4bKESOfcM+YyFB6Bw0LlUQP/xlIU3qbEbbj1Dbk
 T5gifhn/Rj1DVRYApcMAKuW591UklqbvOZ8K/Q5HCAydAMHSCyLjq5xoDAxtomMk
 zPT3a/Thpmm6m+a8B6smRzFfm6PIa0i/rrNrAyrLHOIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=TVRpZRW+
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/qemu_s390x_defconfig: update
 to Linux 6.10.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi Thomas,


Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> Hello Alexander,
>
> On Tue, 30 Jul 2024 08:42:02 +0200
> Alexander Egorenkov <egorenar@linux.ibm.com> wrote:
>
>> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
>
> Thanks for this update, but you need to also update the hash of the
> Linux kernel tarball? Indeed since commit
> d037d9c2d63e9cd47b3701aaef8e28c32b8f5b37, we check all hashes,
> including the hash of the Linux kernel tarball. By chance, maybe at the
> time you tested this, linux/linux.hash contained the hash of Linux
> 6.10.1, but now it has been updated to 6.10.2, so linux/linux.hash no
> longer contains the hash of the Linux tarball used by this defconfig.
> Instead the hash of the Linux kernel tarball should be put in
> board/qemu/patches/linux/linux.hash (which be careful is shared by all
> Qemu defconfigs, so don't remove hashes that are still in use).
>
> d037d9c2d63e9cd47b3701aaef8e28c32b8f5b37 also aligned all Qemu
> defconfigs to a single kernel version. I'm wondering if we shouldn't
> keep this idea. It isn't super consistent to use a random kernel
> version for each Qemu defconfig.

Sounds good to me too.
Thanks for the hints!
The new patch is on the way.

Regards
Alex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
