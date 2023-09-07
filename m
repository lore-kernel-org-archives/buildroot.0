Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503CEEC8759
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 19:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92EC041DA3;
	Thu,  7 Sep 2023 19:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92EC041DA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fwnZ1wsvoYJZ; Thu,  7 Sep 2023 19:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7759041D94;
	Thu,  7 Sep 2023 19:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7759041D94
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AC3C1BF3C0
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 19:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 530C240424
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 19:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 530C240424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyGjndLp1hRG for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 19:46:27 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D56E440BFB
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 19:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D56E440BFB
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 387JatJS022871; Thu, 7 Sep 2023 19:46:25 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3symgb8rkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Sep 2023 19:46:25 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 387IvgB5006668; Thu, 7 Sep 2023 19:41:24 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgvkx72g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Sep 2023 19:41:24 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 387JfNwY43975050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Sep 2023 19:41:23 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85A3F58056;
 Thu,  7 Sep 2023 19:41:23 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AEE158052;
 Thu,  7 Sep 2023 19:41:23 +0000 (GMT)
Received: from arbab-vm.localdomain (unknown [9.61.80.170])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with SMTP;
 Thu,  7 Sep 2023 19:41:23 +0000 (GMT)
Received: from arbab-vm.ghola.net (localhost [IPv6:::1])
 by arbab-vm.localdomain (Postfix) with ESMTPS id 17DE32F0431E;
 Thu,  7 Sep 2023 14:41:22 -0500 (CDT)
Date: Thu, 7 Sep 2023 14:41:07 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <fda04f6a-0e4f-4e72-b86c-01d75b8f5231@arbab-vm>
References: <20230906194609.74080-1-arbab@linux.ibm.com>
 <20230906194609.74080-3-arbab@linux.ibm.com>
 <af489c0d-75cd-b7c0-53ba-cb4a187ec62c@vivier.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af489c0d-75cd-b7c0-53ba-cb4a187ec62c@vivier.eu>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cr-fpQsZGKe9rF_3EneSybcfv7m4YxAL
X-Proofpoint-ORIG-GUID: Cr-fpQsZGKe9rF_3EneSybcfv7m4YxAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_12,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxlogscore=639 mlxscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to : content-transfer-encoding; s=pp1;
 bh=WvGkHoYA87H7rICNa0mhcxwLNZ+rgCZty33i+OEkLsE=;
 b=r0PqimBAQvkMtHG53KFHPl0N9fZby/ZIK7VmmNUJXyqvpPyAzoY6Xq/SZTbmhY9NeBxB
 N2XFqWMTMu1CpcAlJ6sBOHCdT3hvbsE/RqdgNaWO7mlt8Kl8QWThy/8T9oVvNZtme90d
 +YbgAxq176SlgDB37XYLIOlLYDWWvTJuTDduTqX4rDjhlxLEqy0TZ/xB6VJiquo/fszZ
 t1MZRZIZbE5FFQG0TmlXa3xtwEtoxus+lLMDjpkihdeH/aZGNy89hGUTvK9ZGK8S3erK
 hjSQ+YOna/soGPkbey4KEAxjpCYts280KJDSQLMA7JFgy5ys1NezEG+2S5Lof1fUGuX4 nA== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=r0PqimBA
Subject: Re: [Buildroot] [PATCH 2/5] package/petitboot: run pb-console at
 boot
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
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 07, 2023 at 10:51:32AM +0200, Laurent Vivier wrote:
>Le 06/09/2023 =E0 21:46, Reza Arbab a =E9crit=A0:
>>--- /dev/null
>>+++ b/package/petitboot/petitboot-console-ui.rules
>>@@ -0,0 +1,4 @@
>>+# spawn a petitboot UI on common user-visible interface devices
>>+SUBSYSTEM=3D=3D"tty", KERNEL=3D=3D"hvc*", RUN+=3D"/usr/libexec/petitboot=
/pb-console --getty --detach -- -n -i 0 $name linux"
>>+SUBSYSTEM=3D=3D"tty", KERNEL=3D=3D"tty0", RUN+=3D"/usr/libexec/petitboot=
/pb-console --getty --detach -- -n -i 0 $name linux"
>>+SUBSYSTEM=3D=3D"tty", KERNEL=3D=3D"ttyS*", RUN+=3D"/usr/libexec/petitboo=
t/pb-console --getty --detach -- -n -i 0 $name linux"
>>diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot=
.mk
>
>Could you add:
>
>SUBSYSTEM=3D=3D"tty", KERNEL=3D=3D"ttyGF*", RUN+=3D"/usr/libexec/petitboot=
/pb-console --getty=3D/sbin/getty --detach -- -n -i $name 0 linux"
>
>It's needed for my work on virt-m68k petitboot.

Sure, no problem.

>I think you also need:
>
>diff --git a/system/Config.in b/system/Config.in
>index 1ca7690ea3ba..786ec9a1c6b3 100644
>--- a/system/Config.in
>+++ b/system/Config.in
>@@ -375,7 +375,7 @@ config BR2_SYSTEM_BIN_SH
>
> menuconfig BR2_TARGET_GENERIC_GETTY
>        bool "Run a getty (login prompt) after boot"
>-       default y
>+       default y         if !BR2_PACKAGE_PETITBOOT
>
> if BR2_TARGET_GENERIC_GETTY
> config BR2_TARGET_GENERIC_GETTY_PORT
>
>Otherwise the petitboot prompt will be mixed with getty prompt.

This makes sense, but oddly, all our configs have

   BR2_TARGET_GENERIC_GETTY=3Dy
   BR2_TARGET_GENERIC_GETTY_PORT=3D"hvc0"

Let me try to figure out why it's never caused problems.

-- =

Reza Arbab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
