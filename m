Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83909FD45F1
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 21:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4621361614;
	Wed, 25 Feb 2026 21:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZShtby4DW8L; Wed, 25 Feb 2026 21:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73A8461733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772053829;
	bh=4Ur5MHypo0nJbw2M3FkJ3LrJSFl6TUrcr17TRuXnoY0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RCiqO09VooCYzxWhd1F301f0ltnMfir/wtinuSkJav+eA63UFkNf0rITc9M2whl8W
	 HCQ4BMt3hMOJTv7c8JPe39I4VMbfpt9EE8aYTeGIkrTR11e86JpzNTNP8NQqrN5oId
	 lA5CL9tk482+nG9Xjo2/h7ZZdjgUy5PrDFDUTPhBZ0CdG6XfUZlQJTa2NT8iD96nR3
	 r7MGsPbHIH1VotPAU8dQgV8l428EAi76TGnfPzZHopbABwjDT4/dpzCe/YDR5HLCft
	 y6g3m3Scc4Phla5JiVqu0MTFm5mWcFYiJcpG0HLGmFTFUCuyQPsa4SC8ZTZ0S+OD3s
	 3QHmj8WpnMWtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73A8461733;
	Wed, 25 Feb 2026 21:10:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C57CB204
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 21:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABCD861733
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 21:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcUvl_JSKF5T for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 21:10:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A725B61614
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A725B61614
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A725B61614
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 21:10:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9696C5FFAF;
 Wed, 25 Feb 2026 22:10:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Feb 2026 22:10:22 +0100
MIME-Version: 1.0
Date: Wed, 25 Feb 2026 22:10:22 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20260225094824.270893-1-thomas.perale@mind.be>
References: <20260225094824.270893-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <8e32328df393792f01b394205c3428b8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772053824;
 bh=UJeL60kZbWncFSZnNAIbk2CyAp6PMHaUOshjWiql+qc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o3NEfV/jkVJRgg9o0Ycj6fFn5aaJWRQkraznmr0LYynWXXcimTYOqbp1tLvcEQBpM
 VSpajExUXEUwv1s4KONlP5/0eZYLWVenHixIUTN5iMUA/EP35u9x9UQwW17prKO+4H
 +mkAwiEjwxl+herW8mbNRFQ4DJz4bU090I0Kmcn2Prp5jttCE6XFmAhrxICoUUXLEj
 /aziaxtHWvbMLReGU/kymOHOKIBXTpD/a+4JsDXhXlnAx58TMMtZeGBqZWbTu5iNfj
 M9SljPfXMHV+hU/dPBpQOW43xIpDUpalWbXML3P4zXuprRJuMzj6nDgN2fshcL3lSf
 6GVRfAVQEHVMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o3NEfV/j
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 v2.0.7
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

On 25/02/2026 10:48, Thomas Perale via buildroot wrote:
> For more information on the version bump, see:
>   - https://github.com/containerd/containerd/releases/tag/v2.0.7
>   - https://github.com/containerd/containerd/releases/tag/v2.0.6
>   - https://github.com/containerd/containerd/releases/tag/v2.0.5
>   - https://github.com/containerd/containerd/releases/tag/v2.0.4
>   - https://github.com/containerd/containerd/releases/tag/v2.0.3
[...]
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
