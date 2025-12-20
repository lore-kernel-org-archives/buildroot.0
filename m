Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2BFE67480
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 19:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4AB8408C9;
	Sat, 20 Dec 2025 19:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SISKDK7K-cj3; Sat, 20 Dec 2025 19:11:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E97824043B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766257881;
	bh=gEcUEyWeKE+pczM0HEuD++LvKiPkuycFS5v04/BS14A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SeYKIk/YJ/AEo8+B5XvRWfgbtFgoXM5UVyFCqqptwK8PPHKOkFONTOu+CXZj9rTzg
	 7t1tk0VbmE1si5XxHxI0lWmZ61X11J7HaJ1KbguCHMA2WO1a6alZsTn40EVBaosODf
	 IPGZRoNovgHvNy+n8i1mK3KOzcVaE3CGakRsco+l9MwcYZcZsbzNeAzUcwx9wV1bUT
	 9jD3wl5Bp/mA1by6KRfCKF0Ias9FRf5yBRLdkajue5gjIOpp5/UuWXoSrgi0LVTOEy
	 at/eX23VGmxQFkrIi3GyHI4Ay4Shovu4n5j7NR/6rtmO1i7YJ+D8nzB0ZZuHyHavPr
	 SfVtGlfhfiOwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E97824043B;
	Sat, 20 Dec 2025 19:11:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CCDF1A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19D6E60DDF
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kqZtVRtOVRC for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 19:11:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 393436070E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 393436070E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 393436070E
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:11:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EDF7613F880;
 Sat, 20 Dec 2025 20:11:14 +0100 (CET)
Received: from 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9
 via 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 20:11:14 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 20:11:14 +0100
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251205121905.578982-1-buildroot@bubu1.eu>
References: <20251205121905.578982-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.12
Message-ID: <79454ef2fc2b4f1037a8edb6fd2bfb71@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766257877;
 bh=//E6XIBvQ1yulwpvyeTFdoeW4rjyBrrhHX1MHdBIwSE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uPURvN1z3g1zpC3jqFsj414t0G6rmRI6zQxQMQY63OOxLO86m3I1EBa3HhbioV4L2
 fMKUFvre76nA0KZy3r7fdFaKHVzc9HF0thqrkTsYUaq4qJ8yLTkHEPVCg8JnbH7yW6
 5zwI86BUnc0FVCgGKvG7EToecz932ERgUFhPK2aTLOJhyGkXz6GMxsBooAlxNl2yTc
 9vLrEEadTCHrK6kJrZ8imPvROUX7LA1r8Vb1LEHTutuRBgm/uOd5QBN7G62bnvpn2g
 ai0qzszgI+e+XCcFqakUZkYbOl047oG7gWfnPjfgy7zu3/S4JYDv2cGhcVCmuxsz9b
 +Qu+XRZZeOQFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uPURvN1z
Subject: Re: [Buildroot] [PATCH] package/libglib2: bump to 2.86.2
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

On 05/12/2025 13:19, Marcus Hoffmann via buildroot wrote:
> Release Notes: https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.2
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
