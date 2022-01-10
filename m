Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA45C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 22:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F40E60C0C;
	Mon, 10 Jan 2022 22:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqm8vj4GUm1x; Mon, 10 Jan 2022 22:42:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02AB960C18;
	Mon, 10 Jan 2022 22:42:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52CEA1BF31C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41C704018E
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTmuJJIdMzzs for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 22:42:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A553D4018A
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 22:42:10 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id fq10so16514728qvb.10
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:message-id:references:subject:mime-version
 :content-transfer-encoding;
 bh=UT6dwiE6mk5B1l/hKzEB5uvPVYkSls3ev1DJbey0gfA=;
 b=T7W2YCrYwmhCEUYbSxi8Nz1o1B7UuJxnSAR3hXtDaZzcVFiICk0uaWKhacoojAzECW
 DyaIyYi1mbM1okpIEFOU3YYzcgF9/zEa3z4k2kNkXYTKZKcME0N8JlqksR2SRRmO5AkA
 dGeFLTQhGflN5mzuYK7CbV6zt46Y7ktxmtdVlrzjq1TgJ+VwoncX1LbCKThHRwsousAy
 I/OLJ2WeLPXLbI4tVzqwOQdvFnik6v2a0RYZvilvk7nhlDpG5qvD1OC+JZx1QORPC3wi
 oIGLfR8tbv/S1C4Vpzk73zNtk0B3VUsh5c6kqzVfDPcp9n6vX53HUJ5wS1nCmcWJXWj4
 PZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:message-id:references:subject
 :mime-version:content-transfer-encoding;
 bh=UT6dwiE6mk5B1l/hKzEB5uvPVYkSls3ev1DJbey0gfA=;
 b=Trff4Cc/xKInSERMifG6sPY3b2UZHwu+tLjcmZEQkzEw9PULrFxXFWBjoyZ9JomuHS
 tz6J4f0CIK+15wYh3JcL5hKlbldtWuRnD0pNrgt9W17rSLBwePFuJN4qa3nzHDvrhR3a
 w2XZ+C5ZgJB8cVWIqbd2Hgf5g/yp3oqHPyEswkh4lc5FQKY5wK+cBUSp2qX4PCgxLiMn
 BBSaW7WZN2wh3YJtrhbQYCVVHAyQ5FAr+cwPvMBdd2CfYCFWqU3Ag3lCg965zY0o5Ovc
 /G3Qoo7JgcqZBWR5zZtdLl2qUdwYU/RaMpuqBpKiCEZs3hQ10o7AnKZcnLLvNs7mKc5y
 sOEw==
X-Gm-Message-State: AOAM532vaYCKqa7Ta0/7xAhq5mkxiHlspzlK2Fhw42MHwAapUWSK9FpG
 blLut5Vaynn+0o+wE69Vp24Zi5mZPJ0=
X-Google-Smtp-Source: ABdhPJxmgl28IHRF6AuC4rAVeOVdSbdA1pipbYhHKPISgAUbjz+hBOuVzQGVRIYQvwoT+BiLcc7STA==
X-Received: by 2002:a05:6214:2a4f:: with SMTP id
 jf15mr1667726qvb.41.1641854529499; 
 Mon, 10 Jan 2022 14:42:09 -0800 (PST)
Received: from gmail.com ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id w7sm5079167qkj.119.2022.01.10.14.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 14:42:08 -0800 (PST)
Date: Mon, 10 Jan 2022 19:42:07 -0300
From: ricardo.martincoski@gmail.com
To: romain.naour@smile.fr
Message-ID: <61dcb63fc08f3_8fcf9ec-3fa@xultri.mail>
References: <30b13507-5744-de89-0e04-503e264bc1e5@smile.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_61dcb63dee480_8fcf9ec-4d1"; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Buildroot] [PATCH-next 1/4] utils/checkpackagelib: add unit
 tests
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_61dcb63dee480_8fcf9ec-4d1
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Romain,=0D
=0D
On Sat, Jan 08, 2022 at 07:37 PM, Romain Naour wrote:=0D
=0D
> Hello Ricardo,=0D
> =0D
> Le 05/12/2021 =C3=A0 11:53, Ricardo Martincoski a =C3=A9crit=C2=A0:=0D
>> So anyone willing to contribute to check-package can run all tests in=0D=

>> less than 1 second by using:=0D
>> $ python3 -m pytest -v utils/checkpackagelib/=0D
>> =0D
>> Most test cases are in the form:=0D
>> @pytest.mark.parametrize('testname,filename,string,expected', function=
)=0D
>>  - testname: a short description of the scenario tested, added in orde=
r=0D
>>    to improve readability of the log when some tests fail=0D
>>  - filename: the filename the check-package function being tested thin=
ks=0D
>>    it is testing=0D
>>  - string: the content of the file being sent to the function under te=
st=0D
>>  - expect: all expected warnings that a given function from=0D
>>    check-package should generate for a given file named filename and=0D=

>>    with string as its content.=0D
> =0D
> I spend some time to review this patch to find something to say :)=0D
=0D
Thank you for your time.=0D
I imagine how boring was to review this patch :)=0D
=0D
> =0D
> Actually the test_lib_hash tests are not checking with the new spacing=0D=

> convention we want to use in .hash files.=0D
> =0D
> I applied this patch [1] after your series and some tests failed.=0D
=0D
Now it landed on master.=0D
=0D
> =0D
> I would recommand to use the new spacing convention by default in this =
testsuite.=0D
=0D
Sure. I will send v2.=0D
=0D
Regards,=0D
Ricardo=

----==_mimepart_61dcb63dee480_8fcf9ec-4d1
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_61dcb63dee480_8fcf9ec-4d1--
