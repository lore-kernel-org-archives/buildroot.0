Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A82BCCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D61840718;
	Sun, 18 Oct 2026 14:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1vMxJPFQJ19; Sun, 18 Oct 2026 14:06:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7539740762
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792332407;
	b=iP2UoJ81dMx5qWIjbI4ptu1p/go+k7kO10QBMBqIx3BvQW7OSv84WvXeR4OO6e3dVO5k
	 mplAHrWGizg/GsqlGPbQLutwXP34D9IJwHEBlnPQ6cEf4qmpNRllgwV6VkBXFzL9Y9BuY
	 YpmTYw5CI01T7iS6rKhHwy6zA1xeXSxCBb+3Ne5Oy9bCJWcxZ4rSw9WcQdNBmQ9qKNuWp
	 LJ9MHkGz7bo60wiLy9WdyWQrVrPaIk1+C1XuSVP96+MGilMSMqda3qZCev8fmUE4RBM3f
	 2jzBeQ6sQUMYQa0GPsBOUVCEHVZoNEFo1yhva0VsEqEePi666k2B/zzLPSxZyzAiN6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792332407;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=OqqSkL5NvGvGTNAlJDX+AHSb9ityILQ5/zdXR1PyrAs=;
	b=XMHqBJ/Kiw037AZO/5b3iuU06ct8Qq1IATezH6hSDsE4oOS++/pKpNpiDmO+KALQYmN5
	 Mf3UYoDRS4Lpfg8je0r094+TU0sg+e8qxY+KGKsDyFLU8uq+GqVTrKeSYAVor/37NAZlH
	 EEoEiDC95eeLiYI2zniqdkDWrGJjlAhW3AzYMXI3rQwALxXpB8Z9TebOakzKtPOGo+c3d
	 6kQmWQ5dCAX+xxM9D1R/1UjD59zFPsywcne7gnIeUKwqhNu6r0MldkYLwYw5f8qTOWYCI
	 xxxOit4dLjhv+tWo5ObWDr++/CeRfODifB6u/3rOK6DcG4RdIeOJeBFq1hoyxwBsD5g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792332407;
	bh=OqqSkL5NvGvGTNAlJDX+AHSb9ityILQ5/zdXR1PyrAs=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=dGAWABxJ83yrg8/QEtTU4Eurqdg5AG/zO/buxbvWprciprgAjort8ZmRD3Sc/sCwd
	 OYE+cNcX1IhLwrB8phGDVvFTNviyiFXrFtFUGcLlnSElude0b6wGSWn2t+WW7WfLK9
	 Epq8DjPHKO9U5UndHE0hszfCB0/Mkycq8/8ZRGo6ZrICLfZDU6Yz8BZAZqyw5vhJew
	 Zms5GRLW+XHSZ09cA6U+IzUqOnd3KfM3/91bilxHrBxeEgCKAoB34YijLAQeremEmF
	 +vTwoyR0oGlWowRPPd2C7RivHnBpdTJOII5FDBo1Xa408gRJB0fUUT+i32pMwVBHni
	 vTafTegqxDZtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7539740762;
	Sun, 18 Oct 2026 14:06:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4FAC1AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B05F4005F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqLE0-S3Ivf3 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:06:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EE0364005C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792332404;
 b=H2HpN7EZfllbxI1g7D6olSvqUWhyB0EtLkCtVLQ8TJZgH1wUdcsOIr25j6do05IhlNLG
 MLGrbwaruoj36GN5SfTYTeDZlM1f97POfihL7/k+Qg79cyY408qE3jUZkDD29vII5KVgS
 NB+9D/RmuFJ2J9ThBOk/Ezy2jf8gzyeJkD+dQTtNr7HqQBdKxxChkt1BcMCix10F7jnzR
 P8UBAPO9Kpwsw9qwfMAZyziVruvSRqW/bCDzvuwycer9XyrBkWHzA8EV/ifqVXnU39IyR
 nO1K34iPi+E82iX28rA1E9jy4SNJh48oqtbJgaWOd0PbMz4dzsQ6kOFZoc7ZGY40xuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792332404;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=SAIjCaWynYP6gD+vV2wY6fzAVXA5/+CyKRrJtlsmnZ0=;
 b=a2ZCg/4vBDEHWC54TJVNDXU/CIHaKIRbT00KY/zsyXH1Ta4/EqQVvOYNrM5BsSn5UNhi
 qRQ6fFZV8nWdJ/SNhq3HUA5ZDKl45EhWQsFvEn0t0E42+Y57YecCF+LY8w6SU1cBVN48t
 ckCn+hfH2D56uWpB+FKdB1BHbBIH31afd2yXSjGAynIF3biTLkXuWWDkC21yFNnmKSMug
 99cJ4nNW7cmiQXwv9j9vcVfpGLqykTmkn/Ajm1C/glKi79QMZa8piiULFPgbuLX3MV4Fe
 TSw/VqfWAik3a0GN2mfZ8v9OnDJCpLQaCYqJo0A8mnINgOEKJl+SZufYBp2J4ovnyJQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OCzOXYVa; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::529"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE0364005C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:06:42 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6afbc363efeso2005147a12.3
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 07:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792332401; x=1792937201;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SAIjCaWynYP6gD+vV2wY6fzAVXA5/+CyKRrJtlsmnZ0=;
 b=rbvUPgSoy78r9MH5/4UJ3+sEUJZgve3upnMKFPQqSB+JYD6lOUJTdzEUgeE/Cw51hS
 Gl6dA6Ktp7E6ggRfFTcOgpbqjj0oWyHyXrmmwqGS6FYi7E8fv9GPL0w0Dbwht6gyrI/1
 5mupEqhoO9FbCZjyoaD8y3GLooVOBOyth4Oxc0yWQ6tx4ESg8re2KkRxuhnnETnqr3wM
 8rurQWeAIOPY21TjxNnCkLQDMG9RyLg4ctbDXhzhQEFeSH0SJPou282R/Y27Amhsibma
 W91YNu/xskYbJk5YEshDcc+eI+4jT1rWDtliyqI2qGFOuzlDMIySU5KDrGPxvRi3vMoE
 fAsQ==
X-Gm-Message-State: AFq9FYKLZLf+PGUdio0P2W1yDrV8Usg9a3u9sB5Hprj82G3eiH2YhJKk
 HuLzl9iOgykgBLsELHLH4kqy1IMUfFKvL6+VXBfE1I8e6/rHvuUWVK9TBROj77HlYW0=
X-Gm-Gg: AYBFou2O55nXJft3od4tbPfyN/MfznZEd6k3NesSxe88btP0Ih8FS0aYzmVk0L+mWDn
 hwcF1Jr7yz/rFY7WNf49DQWhcUGlr0lEprMM+5XevbnjXC6Kug4pan849KHzNLKEk9g6pQ0qDQI
 3TTdFC1svEFXHrvAldSzVl1VJNIZGw5xPeggammjIGBVhw96qXUo0ByrBAaaVI/J4/EWIyIEfm3
 NDQk+GvCpAbU0M0BsYjz/QsKNibbs6CaL0r6Q1CW3VWFzCebOZ4jtGTavlo1QnsaF7LFO4mc92a
 peVbYv7ozpYEsHWU5cFD3xA5Aq/GLpIKDyaQ5JBls9nvGQrO5ZfUd+i3W+9pUyBaYGfOTTZr6UZ
 AHDlnnwy//3yaXL0oeG1mPhKsdRxZBiELzrOOrDgudF5ZcxHreaWp5kv/DbFgrCYPQy2o10oWz1
 CMa+3vXjDOygoxaXZD8T6VNf775132y6SgcB/Afq9DZ1iAQhkxf93H8lImwuamJgNkxMdNy5T5X
 l8RFs9w3N+tV25i+BQ0iUf0KW4OL+kywjwF38dLqgotvRXODeKnjJljVg==
X-Received: by 2002:aa7:d803:0:b0:6b1:e474:e0e2 with SMTP id
 4fb4d7f45d1cf-6b3a81dea57mr2286773a12.43.1792332400652; 
 Sun, 18 Oct 2026 07:06:40 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b38a1eb8dbsm2766315a12.37.2026.10.18.07.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Oct 2026 07:06:40 -0700 (PDT)
Message-ID: <aca763fb-39ba-4f28-bd5e-4ef815e71fc5@mind.be>
Date: Sun, 18 Oct 2026 16:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261010151121.876133-3-titouan.christophe@mind.be>
 <20261016221711.GD331129@pevik>
Content-Language: en-US
In-Reply-To: <20261016221711.GD331129@pevik>
Subject: Re: [Buildroot] [PATCH 2/7] */Config.in: use the new $(VAR) syntax
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Petr,

On 17/10/26 00:17, Petr Vorel wrote:

[-- SNIP --]
> LGTM, I'd add my RBT but the commit is broken:
>
> $ make defconfig
> Config.in:23: can't open file "(BASE_DIR)/.br2-external.in.paths"
> make[1]: *** [Makefile:1047: defconfig] Error 1
> make: *** [Makefile:83: _all] Error 2
>
> Even removing output/ directory does not help:
>
> $ rm -rf output/; make defconfig; echo $?
>
> You fixed it in the 5th commit
> 04d878306a ("package/openssl: move libopenssl/libressl options out of the choice")
>
> But NACK to that approach. Each commit must work. Either this 5th commit must be
> squashed into with this 2nd commit, or if it does not break the current master
> it should be as a separate commit before.
Indeed, the patches could possibly be reordered; but I don't think it 
would be practical to make each one be fully functional.

Indeed, I would like to separate the Kconfig update (which is already a 
big fat patch, only taking things from upstream); from the related fixes 
in Buildroot. This is to make the review slightly easier, because you 
can actually review the different logical changes that happen in 
Buildroot to accomodate for the KConfig bump.
This implies that some commit won't work individually, because all these 
changes must be applied together. The alternative would be to squash 
everything together, but in my humble opinion this makes it much more 
difficult to review.

I will, however, try to see if another ordering makes it possible to 
apply each patch individually without breaking the build (but I believe 
this is impossible due to the changes in Kconfig language)

>
> With that fixed you may add my RBT.
>
> Kind regards,
> Petr

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
