Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFDFC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:15:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD05160F58
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD05160F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E94A4032A;
	Thu,  5 Aug 2021 07:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LpCMEPChxtzq; Thu,  5 Aug 2021 07:15:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F168A40330;
	Thu,  5 Aug 2021 07:15:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2136A1BF859
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1110682F32
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YSesfTAPzDEy for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 07:15:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6088B82F13
 for <buildroot@busybox.net>; Thu,  5 Aug 2021 07:15:19 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id x3so5339779qkl.6
 for <buildroot@busybox.net>; Thu, 05 Aug 2021 00:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oumtfj/g6Qg1z+OSKvLSgHxVseEL4mZBoqzR4qFIB/M=;
 b=a1JTIybLb/FqFS56oEI3HyaH5yU9ttrqAQ6FyzCqb1MGKLZACQ+sQi28qSTvqvGlfN
 /Ds67ZK9s3ci3QM9ytaUKQ+le8Cq56ECLsdCLROSGdD4OyjeUbWYLiEGAJcpbJ6IITwD
 qgbdAeXeAnxYZdTzYKCJpbiM/Q1vnBlhwqM1/yjF8Qn1f6jhh4OEvqS6IvGoItWs16Dg
 Dqfcae698MqkqbHgP6oVEdahzA3M4A4HOG4BvkDOaBpE5Z9mm0pzqR8uBZITnpCmxR+i
 8SAYHuEZDWuZN7Gvj8jEeQLwAxhdwxDwiUs4chD2XagTgFC32oMnvr5ny6l2n6/UZ55v
 5X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oumtfj/g6Qg1z+OSKvLSgHxVseEL4mZBoqzR4qFIB/M=;
 b=HGP9Q50Tbws6gPvvWRlxEDn0yvc2nfJ+Mh8tF2D+zPB+Lhu2vPxVhXvK23HeujDEXh
 Iz8kIYh/RdbdqKAK1f/BbymnvoSx6JWojWRibvE/qnL/ex9LFl2c6JvdwL58tWZ2zdXT
 0LovPaFMOEgCnultvC2R9xqQFU4MLt8FDrcoviBi7xDO/jvZRo+wUkKGsLsnmdbWHRId
 Dg1C1wytBvppWO3TM5z+wY2tOVN5f1oLDyggXwzkKweBgPoARU/0lOjEL9oGCDyJ6VEW
 49qruMqVMHmugvP1ix9DpmgLdFRvgdFNClndMXXtNmDmRVEbuEGcUOmgGGYqU59V6Mjs
 8ocg==
X-Gm-Message-State: AOAM533QIlYJfxxAUQJGRNZQkwsysxyob2cdkcbxzlfhmSP3saYkrWw7
 FKE/dNo2WUhtjjPWjjlhlhepAwmshiQh5a/8iG55EfjqyLY=
X-Google-Smtp-Source: ABdhPJxKhJAbEOtrIsF238AJVNjeX+NqL/x7fIYlM22rCN/1ZF8dknVEp1znVW37pkuT6n5bhGRtWrqYDg/oHSIYWJw=
X-Received: by 2002:a05:620a:b44:: with SMTP id
 x4mr1868905qkg.11.1628147717869; 
 Thu, 05 Aug 2021 00:15:17 -0700 (PDT)
MIME-Version: 1.0
From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Thu, 5 Aug 2021 10:15:07 +0300
Message-ID: <CACaKL1xhm-6xZFX3Qk27pbZbKiJJ6cN8TMgvhXJnEny5EVri_A@mail.gmail.com>
To: buildroot@busybox.net
Subject: [Buildroot] Common header files / code between packages
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
Content-Type: multipart/mixed; boundary="===============7812112360862131774=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7812112360862131774==
Content-Type: multipart/alternative; boundary="0000000000005d968e05c8caaeed"

--0000000000005d968e05c8caaeed
Content-Type: text/plain; charset="UTF-8"

Hello,

my development consists of a kernel driver and an companion user space
layer.
They are build each in 2 separate packages. Using external tree build.

The problem is, i would like to share some include files between both
package (kernel driver and user space layer).
So far, i solved that by adding a common folder containing the include
files, and making it part of each package, so it builds OK.

Now, a third package, whose code is completely outside the first 2 is
willing also to use this include file. The only way i found so far, is to
put explicit relative path referring from one package to the one other, but
this is ugly. Moreover, the path depends on the version of the packages, so
can break easily.
There must be a better way (STAGING DIR ?)  but i couldn't find.

Can anybody give me an hint ?
Thanks,
Jacques

--0000000000005d968e05c8caaeed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><div><br></div><div>my development consists of a=
 kernel driver and an companion user space layer.</div><div>They are build =
each in 2 separate packages. Using external=C2=A0tree build.</div><div><br>=
</div><div>The problem is, i would like to share some include files between=
 both package=C2=A0(kernel driver and user space layer).</div><div>So far, =
i solved that by adding a common folder containing the include files, and m=
aking it part of each package, so it builds OK.</div><div><br></div><div>No=
w, a third package, whose code is completely outside the first 2 is willing=
 also to use this include file. The only way i found so far, is to put expl=
icit relative path referring from one package to the one other, but this is=
 ugly. Moreover, the path depends on the version of the packages, so can br=
eak easily.</div><div>There must be a better way (STAGING=C2=A0DIR ?)=C2=A0=
 but i couldn&#39;t find.</div><div><br></div><div>Can anybody give me an h=
int ?</div><div>Thanks,</div><div>Jacques</div><div><br></div><div><br></di=
v><div><br></div><div><br></div></div>

--0000000000005d968e05c8caaeed--

--===============7812112360862131774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7812112360862131774==--
