Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ABDD374AE
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 21:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8CC61B9A;
	Fri,  5 Dec 2025 21:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBw077e7WRhc; Fri,  5 Dec 2025 21:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFD2E60782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764971092;
	bh=py7H7b4JaQvawDgBlIpYmvXtO0XxtMaN99GlQLWvgQ4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sWHoLRWE7ur5RdHbi7SNKefm3+fmeMpOXs2XNeoKcbsNpgLFeKAu4Z7nur97aJoCQ
	 MX86szejrsFxzCg+BRXy/YlN0RllOjyxbk0UsoShWdcZ1IS7mwV8SuEI9kbe9cgTvE
	 K2Mc8iSxD+zQT/j51+gIO3CohasAy+UJQ5M9ing2a79+TitENi/9zfovhDNIQfkZNU
	 9n8TwsyMYIbXVQB03qf5NWoF5sIifNrdh+lZgmPE4IJn2k+MwZzpGeHz1rwoNr6VcK
	 /oHBUiEoUJdhCWdGNdu3JIwUz3sk9Ij3LKPqHU4fwAA0wfkAST09rBezdxv0pm/bZQ
	 AHDTADxZuxHyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFD2E60782;
	Fri,  5 Dec 2025 21:44:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D002258
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 839D04003D
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzWSBikGaf2c for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 21:44:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC77D40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC77D40010
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC77D40010
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:44:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E8CB678035E;
 Fri,  5 Dec 2025 22:44:38 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Dec 2025 22:44:38 +0100
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 22:44:38 +0100
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20251205164346.2031642-1-neal.frager@amd.com>
References: <20251205164346.2031642-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a5e6026b0ad11e2d968a5b2bc0fe6462@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764971088;
 bh=QdWZKTJS2cD1VRZiYnKlit35t0ZEKVYvp45+5+Xjo1w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gDKFbZMfay14W6lUfdPbvCjxl2ZiT/tFnXVQrXinIMeouRoUNTdqYj3rYPe7haEBH
 YgwCrb+eQLO6Hr3jYi00uSmaJvVAGg+2buyH6HRmaWfxJE5Nn2wAukFfOooJwtoVbZ
 bw5qriiOxxZsExvXPh8iPFDVTfG1N1YRITssSEucN6xPkpPqtXj0ajrT2z6DoFRe34
 PvdO2kW07Q56eTyydcQVAZWLzl9etkPL33z7XRMqRXK/De1JD2pYkW4RhRzZ6miMS8
 kGKyEi2tsKCNcch6Xk7jBtDWImT0sb/IGACRClLj+Q/dSlzpwZ4qMWdnUNjUIZOECl
 AdIyPhdLR4epQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gDKFbZMf
Subject: Re: [Buildroot] [PATCH v2 1/2] board/xilinx: add optee_os hash for
 xlnx_rebase_v4.5.0_2025.2
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

On 05/12/2025 17:43, Neal Frager via buildroot wrote:
> Add hash for optee_os xlnx_rebase_v4.5.0_2025.2 release tag for Xilinx
> devices.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
