Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE726EFCE42
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 20:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 867E5406F3;
	Wed,  4 Mar 2026 20:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yuujuETX-Lg; Wed,  4 Mar 2026 20:33:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B219D406EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772656387;
	bh=vOSh1ign/EI8SRyNFE8mltPh7KEBvNZroRFMCHaMkyU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G8IpMEQuw3KGpZN4NF3zBSg+DYcRyLvhUV6gt0TYOcnb9xcoc4kBHYl40gmO5FEq2
	 o2Y4tFbmSPpAO4iIQdLphwhnrXQny5tw9nYTcqliFz6zK641dKHh8f+fx/g5oYV4Td
	 /avoACELXihJIW9VHD0TU6ECQPQXsjeQXhwU9dxzuwckBFgjxNKvCcm08re6V2ehsV
	 /rNoRRTGYl5nKkeyTzZGKkTbtucQU+yDER3bwM/z+gkc8xaxodmqr7odNL7aUaoueW
	 STv40U8IfHTOsC1MKy2J9q/AWDPTngcwVaLmeRa1g9aGgf+I8w4H+iXldWeleuwLnB
	 m4PY3zHVxjYFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B219D406EA;
	Wed,  4 Mar 2026 20:33:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BAAA223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 20:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 193C140541
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 20:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZhVY99n0xH7 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 20:33:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A400E40535
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A400E40535
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A400E40535
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 20:33:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AC2A213F8CF;
 Wed,  4 Mar 2026 21:33:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 04 Mar 2026 21:33:01 +0100
MIME-Version: 1.0
Date: Wed, 04 Mar 2026 21:33:01 +0100
To: cp0613@linux.alibaba.com
Cc: buildroot@buildroot.org
In-Reply-To: <20260304072733.1779-2-cp0613@linux.alibaba.com>
References: <20260304072733.1779-1-cp0613@linux.alibaba.com>
 <20260304072733.1779-2-cp0613@linux.alibaba.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <7c4a6b1d32f337e00d9e93f5ddf13588@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772656382;
 bh=h9ntpT+9ltZ/xvrSLpOLnW/FwcUC9YbcJY260Kh1YHE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LRPhDv2kg89Vjgx5DLdekZV/HP9n/w2lx6P1HKoVjS400Ayi7UigulQ4Dvbur86oZ
 fQUzwlUa5bmoDOjETc+Mq1Z+sEiACC+BsTfNrfv5XU11q+qJUNsOzxZm9HbIzUcA0g
 psYFGoUojih5YLmZPjo7m2kOVOC/JosO3GEIhUHGhnNsk39z8z3bzzJvQxVva6fvXw
 M4LKFRwINB0q7opIHWJ9Gx8dVTiO7OlUPtmjkiT7hjpUyMBdZvTd/CkVOOS9s/mljI
 FU2sGiFwLDvu7GNYApdk8WqhsIodIGTW3vyarBjGrIUZc3OrIZ/jQJjA0diL88ptD8
 XnLlmvZmFuL8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LRPhDv2k
Subject: Re: [Buildroot] [PATCH v2 1/2] package/iniparser: new package
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

On 04/03/2026 08:27, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> The iniparser is a simple C library offering ini file parsing services.
> 
> ndctl[1] requires it.
> 
> [1] https://github.com/pmem/ndctl
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
