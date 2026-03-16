Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20DBF4644A
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 10:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D49880C32;
	Mon, 16 Mar 2026 10:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UruGACbh8x_r; Mon, 16 Mar 2026 10:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67D8380D45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773658441;
	bh=8iN4z9P16TL0cqVbEjwef8FfvmCO3TQSL6TuYTzTP34=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hjsNK6n0qHQNki/2JPnhJB//jXagNOWhTFQcVQgZIVI0nZWheroUde0zdXM2Jj7S2
	 V0Jljr0QRqb1htah0WGQp4KWsUkZVuy2JFCOpgEgKhgiDljs4NKf5OaFd6t6wxrPt+
	 Qf+LMYoqaiVLK4B8HH8Tbpu7DaRQ1HmFKWdx4TPJLVM7JOzgvL9giX37eETU4erNYw
	 +wlBzim1xj7e1BECU+AbkNe1vyIfIjLzcNIsMWkQrDb/YBLp9yJWfkRDzkTZYZoIzv
	 gkYQHyTKNcT8FP7uy0JItplCxJKTJfihHFFLRh1pou5t+Vnr0FRJTHqFk6hHPcl2R5
	 mO0oND8ifdtMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D8380D45;
	Mon, 16 Mar 2026 10:54:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 687FFD3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 10:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D50E605F7
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 10:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WXY3w0qsvwh for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 10:53:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62FE560035
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62FE560035
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62FE560035
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 10:53:55 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 25a3waIriclBZ25a3wG4Cl; Mon, 16 Mar 2026 11:53:52 +0100
Message-ID: <74d33c7d-ec03-45ef-82ae-f75fb8bc35c7@benettiengineering.com>
Date: Mon, 16 Mar 2026 11:53:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>, Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20260313211015.4152659-1-giulio.benetti@benettiengineering.com>
 <06e35fabddb8f84102a922b63710ea3d@free.fr> <20260315230743.GB267706@pevik>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260315230743.GB267706@pevik>
X-CMAE-Envelope: MS4xfIT8ATSXtaXigPzB4nT5QmP22TMz5UyomH78cv0g/egxztsM7ZIV3murwYJVUBDT4d/jWeNd2oyhjuEGE6Fq1YUY+juC66fOszbHMsO+j2b0ykKYlzW4
 ke0jstHw7zYvRR3dicYKHEoHnHj4auj/4DsMiae24jKHcdzwrLCVtL1jNNcr4nuVOLfgP8MPpCbbUniyvPNDUOir2NxsxFUHWcWwiloYABhVvQIxo8jDfmzl
 xLSf46HVkwhZaFDcDQunbfFITwfgLIVPJ3IrwDUQpb4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1773658432; bh=qfFAL5ypl1pV+nEE7NH4Y6sLzlt4j0cy5A5geVzO7rI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Ek7uf/Jz3Ta7b8i1jJ8Plf/9krx/jTdnG477Yg7PL8uCGOtXblMDUHw5l3PHVCp9c
 rMuv1vWXXt3sbFQom4Pq7hHmutPjCyicDnijd6ZlBKqhEBvUhHr+KKEvl/5UzECcWL
 JzLKjgWz54B17swt/Nvj/ZMcgVb1qqEJLDhnDVklCouY5M+97ad6Wnpv2Y4hQ5sOyz
 zWMM4TCv93wekOukpn4eEx9FNHS3j2whpwHqvIwPVc+Sjt3v1vuAH+ew6lerQWzZWQ
 R9WEh21KYn9qJJId61ua+fm5EOBEuU3FLn7O1neuHxr3aSuxL6TaJM6PsRigR7/RsL
 D231HYr3N/MNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Ek7uf/Jz
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: security bump version to
 2.8.7
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien and Petr,

On 3/16/26 00:07, Petr Vorel wrote:
> Hi Julien,
> 
>> Hi Giulio,
> 
>> On 13/03/2026 22:10, Giulio Benetti wrote:
>>> Release announce:
>>> https://lore.kernel.org/linux-nfs/4d11b9d7-7b49-4a1e-8c26-29ecb2fefe2f@redhat.com/
> 
>> The commit title says it is a "security" bump. I can't find any reference to
>> security
>> fixes in the release note. Could you provide details?
> 
>> Or is it a copy paste error from the previous bump?
>> https://gitlab.com/buildroot.org/buildroot/-/commit/7dfd2feb445c2cf83a2b52057fab96e72e42a071
> 
>> In the later case, no need to send a v2, I'll just remove "security" while
>> applying.
> 
> I'd also say it's just a copy paste from 2.8.6. 2.8.7 seems to me only a bugfix
> release.

I interpret commit [1] as a security commit, but maybe I'm wrong.
It's not a CVE or similar but to me it sounds like a security commit,
this is why subject is " security bump..".

Best regards
Giulio

> Kind regards,
> Petr
> 
>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
>> Best regards,
> 
>> Julien.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
