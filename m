Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEB3CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 10:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D86A80DD7;
	Sun, 11 Oct 2026 10:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEvnDt300xco; Sun, 11 Oct 2026 10:12:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AA6BC80EBA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791713551;
	b=c1jL/9hjJAxQfVC7rmnY/UCMS/gqCph7JXVGcbt9fCAoqcnnvUoeObemFHzP5tTfnfNy
	 eebK9DyPrtPJzTEaNK+xVZLKzDK7aKNvDulJhSSahzEApTTIaX0U/Jf/0Msm2iyHtiEUI
	 Y0ORyzU67bUXpcwbzt4k6vLGycIHM/q5HjTpRHQA/pCu4NxUcz/99NPIgcl6qnQ7lVM4c
	 HeWDNGIkMElwPrNe2Z62T9+0TI3zE4GEjLTXB45rBuC3Ru031Jl8m3cIFKm6RI44BQG99
	 Skupws6AheVQSWIES8Xv0bZ/NAMziNOBdkPTEyduFXycok0cwVnhMMGxDnX8MlM8qIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791713551;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=s4fEWVn+IlY+jm9nSBQd4J4aRGpCI5Xvemuk7GA0QHk=;
	b=B2uqLgXcoljfxog8MB2gPEshJisvAvAJaLzculBTMfqrfTf/61tPFni9ReEbDSm7Ux4S
	 lIK4t09uCJ+irMClICD6KlvNl99sQE5ZgEUjJV9uWHI+XHl+7FA7LP7uceH9gNg3EAL3n
	 EBagwZj47QRN28dbt0p+PuLXBK8fWljmRYABy+8GtEI2fn1n498X2Ibm2lnHWNVVd3r9E
	 omHpBsWyCgiToSVq9y/WK8Ti5ci6qMugBGTWJ2McIX2YKv56ySoRegmPuWto/8Un/Mkzv
	 NGe14Dqj9Odojcd3dCX3se64vQIA0pmeJlB4jPSP4TZEoyiDNMKuAvAMGTFySpTEMhQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791713551;
	bh=s4fEWVn+IlY+jm9nSBQd4J4aRGpCI5Xvemuk7GA0QHk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jM3zHRcyeY/zUgM5qz2fKPwgLgo0DEOnqgpd0v8alyKseNt+ICM/eRHrO9DkLw86Q
	 KdD/lEZFR6IEHHSEzRhKdYn1N66pFI2hS3lQwc6fcJaIVn1E6x/7X9GOoWi/dtqQKx
	 qU56gbDjqLw+WH/Tm5afsUO2O7MmlBSC0A7LcDqtP/EhrFtEbLO1mJQiNL1VDZX5ZT
	 QR1FjL/o/2cFrIffOIMSQ5oDbluoE22UxYmxBWwgjzo8BXdXaB0DuhScgk6riNE/SQ
	 eK/G2VCEwflkHrQzTEbyTIRpVf7SZ8A63PDMYgMkk4AeklO6bdLW8+Jm4lUJUGpiDH
	 42Gy1c/9nACTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA6BC80EBA;
	Sun, 11 Oct 2026 10:12:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0EEB235
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8746B4004D
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FYx11VQaDcj for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 10:12:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1912C40042
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791713546;
 b=FU70rmdVdOORqR/MVFxezT+ffof43ur2PuL4YWb72UkVa4cfnNOe4t+KntiSaYIZtuYn
 dzc5bUzyYs2Ki7eC4zrmUV+jYZEAc25SYhtHR0BWMa7iqiqQgvjRy9/67bGE5aXV9auHC
 wZG/U6J+Qg3aYSqft0IoVW7lUmcYrBiuuQiyR7AqLcUopZqYKWa4K8CPi3USbMzexSqnn
 vaTLVhDKgmdKTemsNGrsOYOINSxA8LEqd2Ujtj31MYnddTjJycPQAbaS+yos5XBjbAxbB
 dmmKNOBxkcteHBWm9uLJsWgY4v/VanC18TIMwshENuTWhFfyxiQSfTH2MGCnaCkzS/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791713546;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=q6mGFgx7UkNcvxsbIsqNRQufJ4TUYGSmTU7X5it+gHA=;
 b=YMQxRIlD0MI258NmPJ7lhemHHSRxbKG0tFCduFEHh9SZWbcmc1yHxR2iS3OrcEBYn12j
 x8VePAR5Wnua/eNpxt9ka+wD7KJV3XEv9H5fkSI1q7PjK2DmtuNZ05rIF0LeBRkp8Zsq0
 gTy6l1kbjcOBzmZM6VWx1NKE+Vs224/u/MXdjNwHib4L4n+kY/22L1fRakeqhn8DjkbXz
 1jI8TtT27A+DB+MSlkA3OP9b2CqXXROXt5yv3u3tF+aht2TDWCCzTrOe2M6VWCpxvgNqb
 O5skkJmBnldxFz+VcmF4ygpp/TVEc1on9epBoD7GaAwdwxflh0tfpEWrHzXFEO6/5DQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=LlrhOQ9B; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=LlrhOQ9B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1912C40042
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:12:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=LlrhOQ9B1BfrWw78VUH1RyUp0K8jrPjF28bc//jY6J78uF0N26jS1Tvnfs5xBomSIXgitC+V8UFQu7eJODf82o7sB5XodcRbunvJrLJU45ju6JVcjAFgEXTBIGzESE+rOGJNWUPRuaWFSVfEuTYAW7tK8VWZD9WfDaDWSCW/aVkXMTbMCZCZqoUJiEySOXthOa+e+iHDFju6qCQhWxMeTaXzcn5f3gO+G71jzdQdcSk44CNXi7QfFprFOcWwPk6ihW/4yph9FhQWqkCvWJrEdwXT16M636cW16rMtjGt5CMkVr7G2EtU0Tk7ySebb9RvPfIFLtGa6Mgmmb2HScm6UA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=vfEpyXT/AAa3716t/JGYN7jJPNtu/VUxzGY9ndcAh/M=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1218440500; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 10:12:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFqXS-00000008qHB-3aCT;
 Sun, 11 Oct 2026 12:12:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: buildroot@buildroot.org,  James Hilliard <james.hilliard1@gmail.com>,
 Julien Olivain <ju.o@free.fr>
In-Reply-To: <20261002103144.13914-2-flaviu.nistor@gmail.com> (Flaviu Nistor's
 message of "Fri, 2 Oct 2026 13:31:36 +0300")
References: <20261002103144.13914-1-flaviu.nistor@gmail.com>
 <20261002103144.13914-2-flaviu.nistor@gmail.com>
Date: Sun, 11 Oct 2026 12:12:18 +0200
Message-ID: <878q44h7gd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 RESEND 2/3] package/python-snappy: bump
 version to 0.7.2
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

>>>>> "Flaviu" == Flaviu Nistor <flaviu.nistor@gmail.com> writes:

 > Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
 > on the project homepage, hence the bump to 0.7.2.

How about contacting the author about the 0.7.3 tag?

 > Since 0.7.0 is switched from snappy library to cramjam so
 > update the PYTHON_SNAPPY_DEPENDENCIES.
 > Add also PYTHON_SNAPPY_SOURCE for correct package on Pypi.

 > Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
 > ---
 > Changes in v4:
 > - Add also tests for python-snappy as indicated by Julien Olivain.
 > - More clean package Config.in
 > - Link to v3: https://lore.kernel.org/all/20260724065004.217411-1-flaviu.nistor@gmail.com/
 > Changes in v3:
 > - Add new package cramjam and to fix error indicated by Julien Olivain.
 > - Link to v2: https://lore.kernel.org/all/20260717061943.4491-1-flaviu.nistor@gmail.com/
 > Changes in v2:
 > - Fix error indicated by Julien Olivain when running make python-snappy-legal-info.
 > - Link to v1: https://lore.kernel.org/all/20260409152520.5894-1-flaviu.nistor@gmail.com/

 >  DEVELOPERS                               | 4 ++++
 >  package/python-snappy/Config.in          | 7 ++-----
 >  package/python-snappy/python-snappy.hash | 4 ++--
 >  package/python-snappy/python-snappy.mk   | 7 ++++---
 >  4 files changed, 12 insertions(+), 10 deletions(-)

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 93519574c9..dbe05b7806 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1135,7 +1135,11 @@ F:	support/testing/tests/package/test_python_networkmanager_goi.py
 >  F:	support/testing/tests/package/test_python_pyroute2.py
 
 >  N:	Flaviu Nistor <flaviu.nistor@gmail.com>
 > +F:	package/python-click/
 >  F:	package/python-cramjam/
 > +F:	package/python-rich/
 > +F:	package/python-smmap2/
 > +F:	package/python-snappy/

It is good that you add yourself to DEVELOPERS, but the
click/rich/smmap2 additions belong in a separate commit.

 > -PYTHON_SNAPPY_VERSION = 0.6.1
 > -PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
 > +PYTHON_SNAPPY_VERSION = 0.7.2
 > +PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
 > +PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
 >  PYTHON_SNAPPY_SETUP_TYPE = setuptools
 >  PYTHON_SNAPPY_LICENSE = BSD-3-Clause
 >  PYTHON_SNAPPY_LICENSE_FILES = LICENSE
 > -PYTHON_SNAPPY_DEPENDENCIES = snappy
 > +PYTHON_SNAPPY_DEPENDENCIES = host-python-cramjam python-cramjam

Why do we need host-python-cramjam? Please describe that in the commit message.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
