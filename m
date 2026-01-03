Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5D9FC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 12:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B343160801;
	Sat,  3 Jan 2026 12:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3OYubC7maBm; Sat,  3 Jan 2026 12:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF08760AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767441614;
	bh=lv8od6gF1SYPo/KYciR50IFrEEZo1hiy6pq9oK0P9ww=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TAfbMDHh6NP1sJEaK91DL/MiYMpHOnYR5DcjaDFdqHnCgCGdqfx3AUXtWHH8NJkMI
	 JFB/G80RfWsOrblrPA7Ad6i6Z496ox5p41IA/0Dpg4DID17pNVFV8/oVQ8i5obThIC
	 Mev06Sc2g2oCOMo3hLvTD7q6a8hz3NJALddico0kOWHw95xpAWEw8uF1ziqorsOjzT
	 GPsOKMGVFgJ8FqiA8OhdU+vULO7DqQJzi1DtvjjAz8f3XbSK8elNr4lGDxkFOINmus
	 GKBYfpo2onCt0Y1/kd1WGTSiFU0NOwe8ZhrYgS/k3plpc347XkvafJ+XhRxEUruIVl
	 Pebe0TF1XW6Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF08760AA8;
	Sat,  3 Jan 2026 12:00:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DEC7A21
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03691404A3
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2Gn6D_YgE17 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 12:00:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0237D404A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0237D404A1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0237D404A1
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:00:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 23DC0780371;
 Sat,  3 Jan 2026 13:00:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 13:00:06 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 13:00:06 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Lionel Flandrin <lionel@svkt.org>
In-Reply-To: <20260103013559.784592-1-james.hilliard1@gmail.com>
References: <20260103013559.784592-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <891cb44358fd10a9b892340c8bf2c5e9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767441608;
 bh=c+UmgnYUpawjcn1UVsCdP/85t99BS7JjY3S3HLuL62M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jfq5TaFl0O2aDqbZG9NkXfDHe2sOI17wOkInZSCRV2CQe0Nn7Pd3/ZAq16Vyp44H3
 XvU27RI0SvpzYAIv9hULi2ZbH7n8smSesyH6xEcue9ahI4pR2KkRghbXA3kU9BqipY
 yL7XpBXNLl7OT/8BvAgomRUXhGWxYLzta7Y109DemrTXbzYhr1M3+c8NlVGKHNSMBC
 nrYCCf3clv4iiThgUzhGrDs2V8Dn80+uR0az7VE6CZOOt2N6N8JX6+JwyZhmC2mFSf
 i/2ojdOZjgrkW2M+eHnmigTwIW1HzHkHOLEAnf3gyes/dL8KfzXWv4dRwknlDNEolg
 UDQ9kEIYNelWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Jfq5TaFl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-babel: bump to version
 2.17.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/01/2026 02:35, James Hilliard wrote:
> License hash changed due to date update:
> https://github.com/python-babel/babel/commit/b50a1d2186c20f3359f7e10853d2b2225a46ed40
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
