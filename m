Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FC6CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C27140A80;
	Fri, 16 Oct 2026 15:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4iFuhjDEoh2; Fri, 16 Oct 2026 15:02:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4F10340A3E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162964;
	b=rb7eCfdIdqpAYuzL7Kx7Y3ie7VPsND6QR8uuIbnj4WSAxVxT/4MliG5LIkAeDYVUBB4O
	 XlY1oQdgAV9WKtC4VMTIuxrb7kQ+lvD4gmKU9YR240GqLzzsWG7zlegoxV3uPInA6kT23
	 LxkylcWsE0IdLx2lI5PR+swsmYrhjIjyvdUKdCel41aeX/iNjEvjNRo7aE+dn0bNozEzN
	 3/aKjZJzEId9CPkPp/r51tiYl/46aAHjcv0sTcfT1bJoaC+ptcP+k81w6irdzckItb8HN
	 vyzwmJk9X8iaLoQQ5VEEZKaHRw2Zld4m03NJ0Mxiofgy1VUabqEhKbKzkTpeAxVQq7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162964;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=c484heoW4AfYuUoz9xUHN1SY/euXPhwK2BCCC0iJZCA=;
	b=KYPE4+y14XOHcTpf7uzYFcYWxXyWzcIQRz4GbGn9g2Y8y6EB9m0O+EsCK3Zx3rZBpuHB
	 p3nryOlX2zEhxlez5XqomhO2Hwiq50dEfxccUyz9q2euefcLF3JxWzpoCAFptHWonTbcg
	 vMSKjyNx1iyS2/YM+i0baqvVW/1k1J76uIa17Jy9kbZD9wcjBOUNwclN/4lsU/s/7E+x/
	 JAUhBtuynjZzE31SI8jlGxfOBWjl8/NZhQg0Z2HYLIL81NCkwcwsBsl/aA+GW5PF4//Sn
	 4WBQ11dE12B8aqXXUqgy7k4dNAyaWd0/lCi4xkoJocbiQohhc41Trb3BEDHBeIEWlVg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162964;
	bh=c484heoW4AfYuUoz9xUHN1SY/euXPhwK2BCCC0iJZCA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f8Id+a8l/svJlHWb3yYyVtnWxZuM7rnNpUBnxQgBgeyv5qtZAWnVaG1z80vfHuGNh
	 sgwQOtVueRpAoXUoxZbMmGXJ10GYuP8qENfWJPcwPFf0ARLPJzwiRRxt3K6GDjlajn
	 ki2xJWzNAaQmmeYhwAjTx4hfi1wJdDwnhZ1BXh+AmgNUUqkCb0txJbBxDWsDrrZkxv
	 nLMuhR8oaklgS/6JnaD6cmz+RJBQ30YrLPr/HwIRkcE32dppw9eKRSopa9Z+rBL28n
	 V8LjgaVxtWj9xY0d1aRw95WCeI/GoLTSOW5F1C14c6iM8mtvssIbpbgFD9roj/DuHW
	 ewqWHzWzTcPMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F10340A3E;
	Fri, 16 Oct 2026 15:02:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A267E7AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88B1C403FB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8IXj8FuCk8y for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 700444016D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162961;
 b=ZzIRQeBlJF7W6+wolKuYUdWfrP7QGUsE48UXK31y6f2BQglW700OR03MuZWQXANxuIH0
 35dW9bj8X4k+KkCOlrmCs9ZHeooabjp0TbfdSiqW/YiGN8G6Ahi08bY+YiUCM+nozC9Nn
 JG7dK9bxs8ulDV0nuuJMAAGX05SNX+GxtlzmwqbAdVJVS9ucbCf8N9Nvt9NWeuNP24CpF
 pkHVcli2oV+5BGuyjUtvpbEWdA380dazP6QwGhqGo31PyAbW+7hh8VF4mfTy/WegBaCaU
 4P8aXDhxcJWbjIsPO3Z1Z2SdGmBvdYeOlBXi2PnCJa6E0DyQlA/5pQlVJXvUjSyJyjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162961;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=2jENr2M+jNBcgYFe0YuZcNafcGdamOyGO+mZYOG/KkE=;
 b=m606ofZ2/pzqCDupLGvYYx0fUlTku5DSyRO8Z2ECkf0wwkj+f2/yWG3wC6Fa9FFtG5h3
 fCIAbYo5q8dI1P8n1DSxQ2ZVWpqBzRyEvdDiVdIaOxUnFo34na5LOxiDww19dkt9l24BH
 NIhl3qeHluLk7xMHX8ziivBJhDXpmZKjTO0xjq1e5HbRotv6oTbrI8t1/smuVAiCM2/Lu
 4O8pesTXRWauLXr3euRviRPcSJrTk6OHzvMcOnLin+U4THTmSTTbd+UnHaX60IjThqTMb
 SW/7oiN2ygx1/xR9hHdFHRItLatUywAyJ40xO9xVUNGny+bUh/Oh9xjjioGVDMjdsxg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TCc5vwps; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 700444016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:41 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a021c809e3so633515e9.0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162959; x=1792767759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2jENr2M+jNBcgYFe0YuZcNafcGdamOyGO+mZYOG/KkE=;
 b=d9wYz3oWhGvJSafLi55Loedx96Hu+fpQTZlYXjozs3M0yRp0tROh5uttRQ4NHDVTq4
 1o1hIjljfwLV4KQZsafzTEl3wrqHoUYy/LM1Dqg3x6sWBbl5+t2APe5FUiP8nLe7lwLR
 lWmp1RCx+OHCK+2yN5+hIHGEoJhgQ0RnXELtZWs9VV2muBu2NavaaFhzyol77y+EnE6E
 xedghEpRHofYtR7lOCVWMC78/AvlgXwR+PRfW+c30lFikWfT7NWkjA+SbTHWB3KstZNx
 pqJWTp1wYovxrehiyljf9u9Rec+TQ/1wP+chfl/HUW4C9tBEq/HlPg1kQV/ba9PjqQk3
 rb/w==
X-Gm-Message-State: AFq9FYKmPUqQVTWTH365QgeENDLnG099RhG/CEVDg31HnUKR8ja/Y1oE
 uskuyPxV1DuttmqcFYQTSyvcLz+/Z37CLQS2Jb/n9qs7pceU+cyMtQF/0uX+IPpA7Jdrn31zWYy
 z1E16cy0=
X-Gm-Gg: AYBFou1+Xq5oLRRtSI5TshzU9jJ8qW7JSuEa24SAYRnAbmQrB2sTi0TSkHIDs+RV+Hc
 bgW9EYiZwnZVtuxpLjCxwDW0UPdZejv6+duG5RJvQDzVxEVv/4fsny9LSk7ZoHRUpSLMI2f825A
 150JNIE3PpS7xL3BBbTMQNBPnpZjEbaoFlw9LcmTptzjRKMPogUpsbPV18y5zaK9hK1NpVMDXGs
 N4v2aSJ57EhMU3O1ea3Bo4cArah+IQLLHzxQgCASbLEtLpfOfpbln/OoEJzmX1lbU0sclwt3cfM
 WAllMpwYQ/72yjUZE7d48zY/bU11VNnW/h2VWFB41FsejQMyPJAZWzzuv0Wqt5+UvG4DR9nglh8
 DkQYvAFsDYl3EFOhGrV8SJaL0UlUX+rqvi4FuO7d/y7Mml9+QZQGT6LxSReUfVu8aZjhC6g/C1u
 MNlIvrlrByAIJXUjVlU7njWLYddSioE8s5OepBHheF/mr9blhMFS/zxAAXSPs6VtsD7EkQLjjpE
 CHWcJMxPzcY8b4RIZ0s9j8u4hWu+xcgmWVOfurKv9w=
X-Received: by 2002:a05:600d:849a:10b0:49f:e8bf:8f9b with SMTP id
 5b1f17b1804b1-4a1d75af354mr1855345e9.4.1792162959246; 
 Fri, 16 Oct 2026 08:02:39 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cf05009csm47166445e9.10.2026.10.16.08.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:38 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:36 +0200
Message-ID: <20261016150238.60648-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-3-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/9] utils/generate-cyclonedx: add 'id'
 property to resolves
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The CycloneDX spec defines the `components.pedigree.patches.resolves`
> object [1] as supporting both a 'name' & 'id' property.
> 
> The definition provided for the `id` property is the following [2]:
> 
> > The identifier of the issue assigned by the source of the issue
> 
> And for the `name` property [3]:
> 
> > The name of the issue
> 
> The `resolves` object was introduced in commit [4] and only used the
> `name` property to link to the vulnerability it resolves.
> 
> In example [5] provided on the CycloneDX website, both the `name` & `id`
> properties are set in the security example.
> 
> In the vulnerability context, and more precisely the CVEs, the `name`
> and the `id' are the same and thus the value can be duplicated across
> the two properties.
> 
> This commit replicates the behavior documented in [5] to improve
> compatibility with tools.
> 
> [1] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves
> [2] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves_items_id
> [3] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves_items_name
> [4] 9415529923 utils/generate-cyclonedx: add support for 'resolved_with_pedigree'
> [5] https://cyclonedx.org/use-cases/pedigree/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/generate-cyclonedx | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index e337770599..902b4276ec 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -233,6 +233,7 @@ def cyclonedx_patches(patch_list: list[str]):
>                      "resolves": [
>                          {
>                              "type": "security",
> +                            "id": cve,
>                              "name": cve
>                          } for cve in cves
>                      ]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
