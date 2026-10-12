Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B89CA9ED0
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 20:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B2C0605CA;
	Mon, 12 Oct 2026 20:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhoM8MZoXKiM; Mon, 12 Oct 2026 20:15:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2F749605F8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791836150;
	b=r7njwXI9S2ggRz1VFztIK/LcxLt6cTdKTkOgffJwZVm6OXv3GKj0LdJC50Zttz4j4GNL
	 HZL5tD9RaBXx0BI5AfT59s0Fq0BJMCi6Ug/GKipw3blmm9E79KC56rUUujwvxYumqjvEP
	 K3CIckWF+hdCf6aQ6UNY6d9tcZ/rfYVnKJoG4/VbJlKpPhzrwaKNv1WuyWALYAUXrMXjf
	 xOrsYXSx4R9DjCrBnqGRsriSj+drzATgKj5rkTQ5utCJYDu7kkv8JhuOvclUjxPpT3ScH
	 dfynmkthEJCD62U1sH9mi+6ihlvRoCcG8X9mutH/QlUcb2FlR6jUgYtBe6Xi8vChOiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791836150;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DINPLMPFI8zKAEbH934IGYSDy7HwEi+17gk6fcHtBD0=;
	b=FJxp0Rt8HYIECSZgBGae3iZmSUo4JXwZrNC+1hFx5wFymPm24Xu15xutSij314Y+JLUc
	 wp2BObCdb9WXIiyC2rUoX0WmlaFilcj4DjiFtmqLj8OIiaD7PuqlNwl9h8ki4AsL6xK6f
	 psUjsv4LBdkVANzy+VxcHC3kv/CVH8QWyGvlr6Hm+ksF5QNcn81BlFKqZ3MieH03+AbLb
	 d4nEGHbzCXprpURhNBrkGJPsK5HrVIMjobaF6C0Xo4rxKrUPyt4LCHZrH/X4RRVWOWgxS
	 WnJRXeEarC26LAxyoDNQURaZb4zvgxOYFrxBYZhIEfTWM/CVZlo5U0rkT4mtXlj0+8g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791836150;
	bh=DINPLMPFI8zKAEbH934IGYSDy7HwEi+17gk6fcHtBD0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p+WfLUEsbN17XieTJL4i0pxNtNGN0X6zX9gXJUg700fniJUCADgfSA6TOHHtTLHGS
	 eUHlq0U+28nH6RTRq8KfVrowGx2jiyoJjpxMjJUmBaZ2Uo6MTXrvhAMc/bpikm6kHo
	 6VVPY9TR3QLWl8o2tNS4vHalzm5dgdf66zjUvLTq4/xd+oheVTfJqxVG1hlgP0d8tH
	 1BijHVQgvKeavofyz+luakPcPSqZgCYDsJ35XFVln+YHeSRYni3QRLbG1Tz+eX5CVS
	 iGVUA6FOPTpuA7bvsKzIDF//zsM5s/IKyLv/UnXBG+JDWKI6IjW6s27Go6eEaakdGd
	 MVWJ21Wfqrh6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F749605F8;
	Mon, 12 Oct 2026 20:15:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C2C82E0
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 20:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E37E400B3
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 20:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHUFesUS_EFW for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 20:15:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 02EB94002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791836147;
 b=FOvE+chunOzoCKr5B9tPy2pDjCZQkQWQKxOmQhK/+zjwfRUgPtpGPBA/74Sfy4Qlc0wP
 v+h0fJaQs4wvGeNq17sH4OYw1H0kxd+rvaNA54yJPf4EnnNSbW4BXPmEWqe3Il9bqtOBD
 wJ4eOjDj3GEPfjrNlILeA8iFbFlx2vShO9wbjoLvUIbg3YmVlG0dln6YLoyO56TXy1yOY
 Gnrvlo2uCSv4WxeAbZV0svPWo8haYMAANiYFAdW01Teeb5QmDiblXeTPhs+jamZC2JYFe
 C9Q/L+1QE8GCbSA2YHNOx8snnh2GWP5UrSOJbzxjKr9XfjoSWef8ucCoaWOIZO+Zytw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791836147;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=dereCN6JqJEdsijXZ/FwVPBlv6O9VYvUMh3ebtV8Pd0=;
 b=UXfiaK8UfvfmV8QR09f3cKL0o8y++baL+KBcr9O+jzPtHLV1Swy8HnNjd1576GGxRFVj
 /ujTdUoOyUxssGcJ5w+oh8NSyYdL9kTuvsmraC/ickzNBUQ0HuCkZE0xAUz4jAvAZ540Y
 m9Nce4AmY8+phjX7PbVk2z2TCjaXanBmS+tZNF4m9e55PCi8UR7sEQm963deSr/J3J7Hm
 ihTFk6Job5ydZwvbDS01h2A8QTZHmGm44HCQIuH450+hVhiTZ/seYzBbZTdlTjxnRjWeH
 u6hNh2V4qxn5zKde2rhyP3ceJVyNzhWaZQT0/Ehxq54O1FdlLgznzRLYee0ZfmmF/fA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YOY5dCAm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02EB94002B
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 20:15:45 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so23294925e9.1
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 13:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791836144; x=1792440944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dereCN6JqJEdsijXZ/FwVPBlv6O9VYvUMh3ebtV8Pd0=;
 b=Dwivu6jcbf61YuOz2MEgB6T23cT6rZpWmta8vdQgmNEXCXzmTmkaJ/iXaLzxFen5QG
 cOUM7fxMigu+nKCuGmvFuX4slKfdc9JZOSBdwCfwUg/NiHDnzwgXsuBa76n85hXaW3c0
 N91e+jgZbq/tsN6/OE7iePg3AFPhwY6cJpnTtC2kGaVQEJkVrlaVFn/m7eGRT8Hw5Wwx
 72WkRuOEzFqU6//kh04mmYv2cvdXV+WHu3VO2nRa7KUZMrIov3DG8a8rs2DTze8jHqkP
 L8B6IJdEsIOQBK5+70+nughKwVLkm+9dKzDqW+A2VsoT6ucBNqTh8LZyuZwI5NMPojLF
 gp6w==
X-Forwarded-Encrypted: i=1;
 AKwUvBz7jbliTzT3nGYyl3pLMMMiRzFp04IOwgs26mcoBMXWABouTxyxAquIhh20pABwtylxu07/BG7CziM=@buildroot.org
X-Gm-Message-State: AFq9FYKMdswJXefFznOmTJ3Z2JjOWVQ9S0AlXzyGkoqxh0rUGLwEnwsx
 2Zquw5QD4ZSQQl8k6La9McbPdCm58YvAlouA12aCS+uDLoCojHHq/vvMTmOo16ABsec=
X-Gm-Gg: AYBFou1JjcEUHjFtK6L+cDVQeFNuW0ZjaSxO0dLRnPficlIzbu7GKZ6mFnoM8elx0GZ
 i1e330TIDXVRMgFjQI8daGsiMf1uJDQVyslIb3eYcJOYoHCO2WrralyLFnpywL7U/XqYRSVTAi2
 09PsId68iRYWWyyJ1HjRH7+UTENY3L12YvRUhNAZktL2/0BJsXd3PwuOEHqXB6D83kP17szRw3j
 22jCkXMT85wy9a2ylzhoIDT0ajO+byWmaD4pecuvQQR3qlHuIzCOVRmhRecF1YbfZCfCjsOAOi8
 zrbU2vV4pIVZ6+sk8Z6aoT+JG/PaB6wd4+gE8z9nYNbSPQkIuLSE+gVDSr9MuuA8FR3SoovyXHe
 I32+CeIMGl9o5+0rkOsMaQedCJkQ8uOG+rwt9HLIDSXH5W6tXu0iZ/2UOVkqU2auQW+SDArUEI+
 eS3//vz5gjwNUzhFCMcWQfdypcPhV5JA/q2adBV7ulTp95SdPDcFIBed3nTdZYjB/NgnYEorugo
 A==
X-Received: by 2002:a05:600c:4e41:b0:49f:c1a1:5222 with SMTP id
 5b1f17b1804b1-4a18e4d80bdmr197595375e9.33.1791836143724; 
 Mon, 12 Oct 2026 13:15:43 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ab4f34sm1169524f8f.28.2026.10.12.13.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 13:15:43 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Mon, 12 Oct 2026 22:15:42 +0200
Message-ID: <20261012201542.87634-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <423a0c0b-a9e8-4ab2-909f-60fa4f0e030d@gmx.de>
References: <423a0c0b-a9e8-4ab2-909f-60fa4f0e030d@gmx.de>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 2/2] utils/generate-cyclonedx: include
 external tree information
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

In reply of:
> For the "buildroot" component it makes sense if you squint a little, in the sense that it represents the overall build (like "world" in the make dependencies). For an external tree that just provides extra packages etc. it doesn't.

> > I used DependencyTrack to kinda validate this behaviour. They have a tree style viz
> > of your project. To have it work properly with all the packages available under it
> > you need to add this dependsOn to all the packages similarly to what I described in
> > my previous email:
> > > https://pic.infini.fr/IkWJ9c5X/M9EqMt6b.png
> > > I think this is the kind of view we would want to achieve to show the hierarchy
> > of the project with externals ?
> 
> That's a nice visualization, but at most tangentially related to what I want to achieve. Which is to record for each package that comes from an external tree a) that that's the case and b) which tree that is (plus the details about that tree, by reference). That information is only implied in the dependencies in your proposal (so, not obvious at all), when it needs to be explicit.

As a side note, it won't be the only place where the information is not obvious
to retrieve with CycloneDX ...

Btw, nothing against adding the information in the properties like your
proposal to make it indeed obvious but then this information would be hardly
usable by any other tools.

If we declare the externals similarly to what you propose in this patch in
'metadata', I think finding which external provide a component is pretty
similar to the action you need to conduct to find the vulnerabilities that
affect a component.

I see that you can also use the "provides" property in "dependencies" instead
of "dependsOn". I don't know how much it's supported though. I will try in
DepTrack. Food for thought :-)

https://cyclonedx.org/docs/1.7/json/#dependencies_items_provides

> If that dependency view is useful for you maybe we could do both, but I still think using the external tree as a sort of meta-package in dependencies is counter-intuitive, and I don't like introducing a messy data structure only because it's convenient for visualization.

It's not that I really need the view or anything. More that it give a
representation that I find make sense to represent how things are organized.

Thanks for the exchange. I will try to test some things later in the week.
I hope others in CC will have some opinion and ideas as well.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
