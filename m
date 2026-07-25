Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E98C531F9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 11:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD32A606C1;
	Sat, 25 Jul 2026 11:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyAm9SpWLenk; Sat, 25 Jul 2026 11:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B7CD60669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784977758;
	bh=BUupzdkqS/Hr2uQijsYBVjSQ5kjRtbDFaang/4QxmUY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qppf9rJqms8z05ezF4YMbfRALGKuAFZHlQjCmOwnv0tFCbLGS4RvdAiL59xceV9Ek
	 qlr/LeDmPQ/UMASRUN7TFv+op/FKX3SuC1Zsb1YbRn6pCP9Ik35QeolAFW4T2R++Cb
	 4qHJZrVD9QycJxRmGB0Z1o8PeipwBVpmvgYXLXg8g1ZOjIxTbzav4S9AguB+aQE8zm
	 Dg8D/lwLm4SApSpplhcdd0uCKBCoav7AUJD1hMz9erJ0dkqFSaojlUqijhR8r3oTYk
	 FAdIbReeoF3xlWOHC04kfCDBYHYnSf9ZNE3j35HMbMXf4pG1MM2j1d7Gg4oz9C7Lq9
	 bQxdNDgECdpUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B7CD60669;
	Sat, 25 Jul 2026 11:09:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 432DE36E
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34245400AB
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4mEeOsezu0t for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 11:09:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E5F340025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E5F340025
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E5F340025
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:09:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 400D213F8A2;
 Sat, 25 Jul 2026 13:09:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jul 2026 13:09:13 +0200
MIME-Version: 1.0
Date: Sat, 25 Jul 2026 13:09:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260724171603.316901-1-bernd@kuhls.net>
References: <20260724171603.316901-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <e13853b0627346db2590b8df138794d2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784977754;
 bh=s1WE3Gqm9+XbU2INKnS/sMabWm9Jy5PWDW4bcEKOLwE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LD8xaboRVQi3XLgnjiZwNArQ1eaYLh0DTcuWfOeNEJbEn9Ds4YHAkKeoPOLYKBvV5
 cxvxJouEHaJXx6MDbutt0XRt+Z6axxQ7pHecDKukfM13CDhrq0Uyd/7ruCv2iqfoZ9
 TJdz65KVAqzcmxtuNSVWgni/3THfzF41LAyrooSiXf4aQ3xVhBBy/mC+MmpBQ//qZ+
 fHppWXaLr/HvHa9PS1dpCPvzjLKp1ldX5jMuIPcmu44pCp/rMvs3R3OEqjKyabBK8G
 HZ9su/CtCY6SN0zGjYk7C8lI7mt4hH8rW5pjjHba/GXe35y2z7CqoTHVSj4GCrpyHC
 Q6kNt27ur2nAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LD8xaboR
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.5.4
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

On 24/07/2026 19:16, Bernd Kuhls wrote:
> https://code.videolan.org/videolan/dav1d/-/blob/1.5.4/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
