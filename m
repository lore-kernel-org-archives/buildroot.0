Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5ECCCF9EE
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 20:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF52760DD0;
	Wed, 29 Oct 2025 20:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXG9eD0L3ycB; Wed, 29 Oct 2025 20:28:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07C6460ECE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07C6460ECE;
	Wed, 29 Oct 2025 20:28:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5239B22F
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37FBB60ECE
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrlyREeV38zr for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 20:28:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D47B60DD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D47B60DD0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D47B60DD0
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:28:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B31CC2003DA;
 Wed, 29 Oct 2025 21:28:12 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Oct 2025 21:28:12 +0100
MIME-Version: 1.0
Date: Wed, 29 Oct 2025 21:28:12 +0100
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20251028-llama-cpp-v2-v4-1-5f21e78c9c6a@gmail.com>
References: <20251028-llama-cpp-v2-v4-1-5f21e78c9c6a@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2e2f4d6dd384f9db30eb63c476cf6801@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761769694;
 bh=DiB8UYky6dCTo6fPRIap6GcWDAh1Xu4A41DevXDjOMA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QtsaOqGmzQ3J1YyT6OvvXggYWL9sMyJYSZdAn+4ZBr1P18d2Cr7GdLDIhQcKedV8R
 633SnWTUp4KwbMKsi1X3mVdJmaA23Ssd+Pcr1MGCKbV4CuDUQHCo5IDJYFAkahdEAh
 Om1SwKJgoZ7kyBGH/gsHXlGIAqh/ZYyKgyyZmv19NehpNYb/MwcHyI3Eq+Yl8HYNDb
 fggsV7wH4qAKN5ZXEEX6x89dWpsWShnjT0AofB8JDAQtIyWoAx74dyyDoc6UJ2R7jL
 /M9TF7jRXDX9RSNylXW7XyPpDFl2EI1j5slTHL+Cketseyb7zotPNIC3xpsQnNqmGo
 JZKoEV9Cns4Dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QtsaOqGm
Subject: Re: [Buildroot] [PATCH v4] package/llama-cpp: new package
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

Hi Joseph,

On 28/10/2025 18:16, Joseph Kogut wrote:
> Add a package for llama.cpp, a C/C++ LLM inference library, used in
> popular projects like Ollama, RamaLama, and more.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

I applied this patch to master.

I did two minor changes, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/03f35bc63ba01ede5e78900cd98e5217b7e8d70b

I was not sure about the real value of supporting a musl static build
with such a package... If we see in autobuilders those static builds
are a source of build failures which are complex to fix, we could limit
to shared libraries later...

I also wrote a runtime test for that package. If you want to review
or test it:
https://patchwork.ozlabs.org/project/buildroot/patch/20251029202331.16192-1-ju.o@free.fr/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
