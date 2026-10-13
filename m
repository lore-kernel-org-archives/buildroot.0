Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F57CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 18:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A4C0404F8;
	Tue, 13 Oct 2026 18:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4VRWeI9-pOY; Tue, 13 Oct 2026 18:53:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 16747404E8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791917639;
	b=ShI4GFbj0ZZv5rljTDgomzMWfmF7/IFepccWddHMHVLCTH4Jfe5IwmbG52328ReQdE5O
	 cc1trkBmwuDYaoOsSJY4j6aN0/JmzT6g7Rd5reWf05X0bOjLv8nBmb6ZvD+DFqMU3SVyD
	 foq7rTlpBcjJ+z/Jj6oso/lixVvfIsSoZcXaldr2JPjhVH3Ofi97B7vz6Ea+L49LINMoe
	 JntWmHpwg0A3pelYvP044L+TG5sr6Y+l3KaeFPWN1kicNuWNLqKrbH6pmUFqGFIvOi4Kl
	 PXb7DEW8f6Qkjtv11yzl8DP8fs3xkwefTY/FtZ/RPP8hvihAFwndNH/0urPY0+4Z1Dg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791917639;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Wu/i0mlhVWB11zYWxr/qaVgyUK+r69CjRbhaYqen9EI=;
	b=WBlOXQVkobK+LRlXIQx8uaqyuEvTApPHVJszoFgAKmtZO/ZZEIFGBkD1/XES/AtAwNyR
	 lu3l/m+mQBQ44gvkADOlmegnJA9+/6wHze3xZKvqLnoOWWha9BHK4h+hv25ZN2NZGdwla
	 FNi0SCn60lpDUfw9NrFReX6elMYseNrTO2Kg7w1OS5siRGEClDQmE33a3spZONmRBJN7P
	 n16oilMTMlYFMnsAhi5II//XH8Nz38JTH4f6o9WdEcFcB7XVOpJR4bMy18SbeRsaWKoql
	 Mf1woqSONQYY0IIU0RIVEj0U7aUIBpdy61mv21cJDWKVjYBJh8HAFL9nyrbn2/ElD7g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791917639;
	bh=Wu/i0mlhVWB11zYWxr/qaVgyUK+r69CjRbhaYqen9EI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fPYJUAuAUci4xby3eHCtMm/VrA1xAKVgdkuEkZnL7i8CmbzNJ79rjhaIe4at8OuyE
	 FBkxjPgcQ3E1zJ9OAmTXZfCuVQ5g6x1vMuvBq3UgxZjCPtZHcDMrhaNCaTh7lUG8X/
	 JloF1jMWh6gCU1PN9RjJBCdhoqbzI1mw9JlQLEm9XuCY8NINoV4F4A14fnsBpJ01qT
	 QfcbZnaQcOgqUdRigxNsuoRUH9kDjYV+D95cPoNUGCTzSwc0t0QteigUZ9IM9xf56L
	 mX/NEm3IgJiyW+eFrGcSZnUJYYvaIIiZyXsYhs+1urdS/QU0UfQBtwN5GBKRK4L9mN
	 zx2i1WfKoPSZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16747404E8;
	Tue, 13 Oct 2026 18:53:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A2FB2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 18:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C60C402E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 18:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrKcPkaUekUJ for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 18:53:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D4A904016F
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791917637;
 b=qK8Ze1NaH70x8UwroVH7UlOPx1H6dM3L+MXgnXBurMfIjMOE5v4P5s3kp+ya08PJ0dTQ
 l/8/qIzJ55V9BQM0sO0H8Fx3BXkEIm922SB/ONWmyvuFy5E7WNuR8zwsooY0SywgUTKvr
 84M64nd5uR4CMuVenpBFXKdnujmO8sKE/1sQWCgXsc1yI0iWFeZkFujB+tq42XXA5Us6F
 MJzeDoDbyHnvty75hYj9Qij9gW8nRdNgZe9Jb7+e2KXY3Ymu1uOJaK7Y/bLiaQ0SNzh7m
 GFKGCgVL8TVj1/U3x1iJ6TYFtaj0n5nsNM9ZCNNPfgKQtHQkdGcumdC2kt6ut0pKehQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791917637;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=4njvYqnTi4DgS8Nwn2q4r/Xw3w8y2OwQxjdHDxWwajE=;
 b=Hd7/CUPLKLE5smSkW/JLraokAl08Np+i8k5Ul9H5wC3k14Tz4zkbsz2wO1h9b0tOjV6z
 p+k+svfTVrOK2fxXpe1hKVRPt4Zttza3vEX3JRFrNuxvDqOCByPDZmgxo0VihTGJ0dvv2
 OJXRFcunKp9Mswf20HG2VvDPjv4UrZEUAHgzgAlSxRuVv5t8yhpUDP9lPC50u3vGJC1Ej
 eTnI6orS5/tePMR7Z5+nY6uG4sHpnqpQhi6ffU9sls/tsJkPPMi+LfYi4AXxFsM4TxT97
 pK8koLQwmfCh8wt0hug68dYfRhPnw1E8pO7kSRr8dsDkPiUYUnLC68XcUSB1a8o2QJg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=F2KYKOqm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=F2KYKOqm
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4A904016F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 18:53:56 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a021c809e3so32777365e9.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791917634; x=1792522434; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4njvYqnTi4DgS8Nwn2q4r/Xw3w8y2OwQxjdHDxWwajE=;
 b=F2KYKOqm4doT9gCYK4HUaJ4RsZ6JSussMFfStjc0HfDcQ63vjcct6lgfa2uJDXh4Vs
 ZF0md/jq1wXRsz0XX2GSWna5P0X5VJUbDhD0Py8YCqQg6XmnemFPDINoNMg8yuCP3Gb+
 JyK7639GcqqlT82d7MpI2Zp+HeIq0d7D8HprQcOjTEsCHeU8owreCWp0TSya6goblsxZ
 xnNII2BdBvt9D27irkzmoJ7Iz8JrjOdQNHCXCcmDpzaVIIwSvRDr4fwMae9DbBhPAp2b
 gq4sDHvmklC62OGhQJEd79xLRTbrrTBCAbmiILOfmHheKIdWDxVFvta+NZzreUXMkk3E
 GbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791917634; x=1792522434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4njvYqnTi4DgS8Nwn2q4r/Xw3w8y2OwQxjdHDxWwajE=;
 b=d8h9CIHG+bQgb/N5uh9wl7Xs6fJnctGsJxsN3y9N2Wr3hV9VEZBRavAFkMNYwmnQo9
 VVYwTh6Lg1NVZjRBcpAtUsiLt5wOB6cWH2BY7iTlBhRy1T/Bfih8Jlg6Run11b7Fg1i3
 e4W9tQkIS3M95FMZGw2bNTbXeUspsvyd4XdsLB27ZG5F0HytinClwcC4WRhZucFeZ4VK
 3UisoG1yZLZnIeUJsaq11zVcFrl384Z/wRQunwSKuzvK4RT8+GdVkQPdAaKGNxqj6kJC
 Pcb2pXtIcGj3lLUGEaTzt7fx4/F0liLrQsBk3qnIMfJHfLZZal66e7DJ8gZkqo6QAXx6
 iaxg==
X-Gm-Message-State: AFq9FYIeBxRKUVDswUqv/ijY+QBg1yZYnlS3DEoILUkUBxVsuhiP2gMH
 R7LLbEglMg+lktKyiKhcX3ggdJWj3sbSiwQa+GrgJTg0afAqzMlRQThj
X-Gm-Gg: AYBFou1am0zyODsxHzs62ITrOIeu/1pEnEJt5Wj6CvfAOWrvOeEvqL6bK3DWzlYWFp+
 aUeia77xTd0XNMluZ6l+bBUmLDdndntwTQJiq10sA/7QP/xIuV6SF0JDTRw/LlCyHvIS9MGadoH
 ISJgaUFyNesy2yr2ovq8WPmznfLSeWzWq/SbaSGlY8IxEMq0RTJwyPKGV8QpPx1hp1UtAf5L9lQ
 9dUR857+VCIWpzaUHPapXVUvPfxGkYklIpJxuxjU19E41rQkTgxqcqrG+FJY/ssqF6f2GowD57g
 8AhRUoFKLmH3FHHbl6yREFAUyF0wixYnr9wtzu2uKW1Ms1KKqQH4mRk+1cGy4vIWbng4G0exDk7
 1RAO+X8FXv6hlLKl4gdXUiP/7aK3TgoUlGs0SF1hhBASc+9hbBasvvv3WIsI7aXqO3xW0Sy2d/M
 swIiVj8KHMVHIMIQZovc83y+Aobu9RnRGXB72UyFGI0NdoC0Ud3uVzqsDNDtdcl5SOTSEN9u3dD
 KM08Fa9pkrZx086nGQbvhmixOSFTGaqcrCy6UBilIXxc3dY
X-Received: by 2002:a05:600c:3ba8:b0:4a0:174:579e with SMTP id
 5b1f17b1804b1-4a18e4ab221mr307780925e9.28.1791917633919; 
 Tue, 13 Oct 2026 11:53:53 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.72.164])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a199e5db12sm279875275e9.2.2026.10.13.11.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 11:53:53 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Oct 2026 21:53:48 +0300
Message-ID: <20261013185348.7666-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <878q44h7gd.fsf@dell.be.48ers.dk>
References: <878q44h7gd.fsf@dell.be.48ers.dk>
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 11, 2026 at 1:12 PM, Peter Korsgaard wrote:
>> Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
>> on the project homepage, hence the bump to 0.7.2.
>
>How about contacting the author about the 0.7.3 tag?

I will try to contact. In previous situations when I send out a bump
it was indicated that I should use a Pypi release only if the tag is
released also on the repo. I think also in this case is better to have
the bump to 0.7.2 until 0.7.3 is released in the maintainer repo. 

>
>> Since 0.7.0 is switched from snappy library to cramjam so
>> update the PYTHON_SNAPPY_DEPENDENCIES.
>> Add also PYTHON_SNAPPY_SOURCE for correct package on Pypi.
>
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> ---
>> Changes in v4:
>> - Add also tests for python-snappy as indicated by Julien Olivain.
>> - More clean package Config.in
>> - Link to v3: https://lore.kernel.org/all/20260724065004.217411-1-flaviu.nistor@gmail.com/
>> Changes in v3:
>> - Add new package cramjam and to fix error indicated by Julien Olivain.
>> - Link to v2: https://lore.kernel.org/all/20260717061943.4491-1-flaviu.nistor@gmail.com/
>> Changes in v2:
>> - Fix error indicated by Julien Olivain when running make python-snappy-legal-info.
>> - Link to v1: https://lore.kernel.org/all/20260409152520.5894-1-flaviu.nistor@gmail.com/
>
>>  DEVELOPERS                               | 4 ++++
>>  package/python-snappy/Config.in          | 7 ++-----
>>  package/python-snappy/python-snappy.hash | 4 ++--
>>  package/python-snappy/python-snappy.mk   | 7 ++++---
>>  4 files changed, 12 insertions(+), 10 deletions(-)
>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 93519574c9..dbe05b7806 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -1135,7 +1135,11 @@ F:	support/testing/tests/package/test_python_networkmanager_goi.py
>>  F:	support/testing/tests/package/test_python_pyroute2.py
>
>>  N:	Flaviu Nistor <flaviu.nistor@gmail.com>
>> +F:	package/python-click/
>>  F:	package/python-cramjam/
>> +F:	package/python-rich/
>> +F:	package/python-smmap2/
>> +F:	package/python-snappy/
>
>It is good that you add yourself to DEVELOPERS, but the
>click/rich/smmap2 additions belong in a separate commit.
>

I just wanted to avoid some "noise" caused by separate patch, but yes,
you are right this would be the better approach. I will change this in v5.

>> -PYTHON_SNAPPY_VERSION = 0.6.1
>> -PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
>> +PYTHON_SNAPPY_VERSION = 0.7.2
>> +PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
>> +PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
>>  PYTHON_SNAPPY_SETUP_TYPE = setuptools
>>  PYTHON_SNAPPY_LICENSE = BSD-3-Clause
>>  PYTHON_SNAPPY_LICENSE_FILES = LICENSE
>> -PYTHON_SNAPPY_DEPENDENCIES = snappy
>> +PYTHON_SNAPPY_DEPENDENCIES = host-python-cramjam python-cramjam
>
>Why do we need host-python-cramjam? Please describe that in the commit message.

This is a setup_requires in the setup.py (cramjam>=2.6.0). There is a build fail without it.
I will describe in the v5 commit message.
Thanks,
Flaviu

>
>-- 
>Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
