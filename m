Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94E1E66884
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 21:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E635760BCA;
	Fri, 19 Dec 2025 21:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3TH4hr4nqmt; Fri, 19 Dec 2025 21:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D265D60BB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766178411;
	bh=+d8IcK0QPQjPJ7ck3KzKBuhXzd1W4oS2XObAUxr+3pA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ClkWg1cD5aCfMFfErvcBZxFazdOadinarxC3zSTbuSVmvJMM/XwLDn6FHShTYwAuM
	 jbaQ/QpoBunC1YLdeTLqsz0yGRA4qqXZj1G72NriuH05Nywn6WiRSg0ioTSEsbxita
	 QJs2e99l8w5BGmY2edieozcfSCRtpmxHubSWpjbSNWa3AM7Bqf5Ej8wiRHLq7+1cgy
	 bCMwEg5yamTxZ1mKRhhjjriUkS60W9icsJCRjbHfEHGBp3MiyTIT8o+qp2YfMbxPWu
	 fWw8kcsfCGx0ZuhD7cCI2JkUoiydpsIcRXYQPs/NyrVMC6r22+NoMWrVzkR28wxCD5
	 WH7wkjTPfgVtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D265D60BB2;
	Fri, 19 Dec 2025 21:06:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACE121A6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAADF4009A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTjPyDMpZaJN for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 21:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5AFB40051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5AFB40051
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5AFB40051
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 21:06:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C6EB25FFAA;
 Fri, 19 Dec 2025 22:06:46 +0100 (CET)
Received: from 2a0d:e487:418e:8c09:857b:bc67:c232:7cba
 via 2a0d:e487:418e:8c09:857b:bc67:c232:7cba by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 19 Dec 2025 22:06:46 +0100
MIME-Version: 1.0
Date: Fri, 19 Dec 2025 22:06:46 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251219182921.2148533-1-bernd@kuhls.net>
References: <20251219182921.2148533-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <9b8219406761d8896c91690aaa91f3a9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766178407;
 bh=p7H8OgFuDslnwfNQ/pn6PAwjJy0Ujaf1EqgKYww3cpE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XmZkJZBnLtMVmxa7yd1iUHeC+HpSSh+YW+B+x+Z6II7oPrgAkcm7/dshvbwrnjNL0
 0LsRxJTgy8LHBanNAcRSvZC23gWEIE2053gKKyVx3HOhzCiekrJMXTe9NLSc040hWl
 HYYNNu8GdSGpvfpfW2udOzsbf5i+e6fyEmGq1RvUSFXNEqcNCH9+blZtyMbgxKpObU
 4E1WbSkfvOwC2ahrd+BH9F0+R9utvSZ/i7axpGVnOhCDFXPcXplaXnHdhCh71YaEIY
 5/jnKKDUM7oVH4whPQ/TGCHM01TVhYV+F5QFdkBGHksXLUjMyPmlqT/sMheMrHfE5v
 skJdyAjvMS/7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XmZkJZBn
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.4.16
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

On 19/12/2025 19:29, Bernd Kuhls wrote:
> https://www.php.net/ChangeLog-8.php#8.4.16
> https://news-web.php.net/php.announce/478
> 
> Fixes CVE-2025-14177, CVE-2025-14178, CVE-2025-14180 & CVE-2025-67899.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
