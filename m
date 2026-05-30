Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBB0CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7A4E40687;
	Sat, 30 May 2026 12:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWSsUm5Iust2; Sat, 30 May 2026 12:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B78CC4060A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780145473;
	bh=m38fGXiafgara8FlrKCBbma0f+DbFEGnF6xPoQhLbDw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=UdjAobz9W/fhkI5fBp7wqqewCLYCn7aMY2m1hxNd+dIp9q3UPCr8OZ+EoEW0pUOMV
	 7zAaGYXOt79ELPOsmB85sbqS9MCaj+etffE+O0aYxk8cas8+kmxeTtdDyA3Oen7oaE
	 Pb8Jb3VfR34KLZE97W+SjSTWSW7y+FrNv0m8JM6eIoquAVDk7CmBzg4GqzggE7eV19
	 FDFs7d9DiiVe9gnp02Wa6wXezY28goJI0SvW00uC62jWVfeEC/eVAWxs8v3Pg2FKAI
	 P3vlPMK2bY14AvDZGHN8t74dF8P7OVD8n4110Z9NAenRhPwMohk8LL+WUpxjZHdm5o
	 iGqZrI4bmcWIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B78CC4060A;
	Sat, 30 May 2026 12:51:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D80EF218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9E8B8532F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0918-X3VvkfH for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEA2B8532C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA2B8532C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEA2B8532C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:51:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 833C7B97C715; Sat, 30 May 2026 12:15:11 +0200 (CEST)
Message-ID: <c34ea32d-7685-4df9-841e-33666741627e@rnout.be>
Date: Sat, 30 May 2026 12:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260503144908.2807535-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260503144908.2807535-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780136111; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=JmlVzrjQmJLJIiPwBjMAJn4vpOSDZVFUlcUsaBEKvKg=;
 b=WT/Vi1B5Hzc9kyvXdIpqu23tw77T7dadXkRNINHZG0BQtP/DWBlxHmIndkktKHSkuVBmMP
 rv9tPs86gLrluS0Pe+8gq1Ymb5beGWrb+vsMMSfM9HrFzevUw2j6bV2n7F+mNe7HUX1Ztz
 zQ813tBM1rWn9AaDv3nSt0rDKAPCENECLQ1rn1lGICecIhMQkhbARnFT/3iJ5dy7yF0lKl
 EA0GvRfYLfZL/T8RP92J7AlOY3PQvF4nDmHBWam/nLI89Kqe5WsLlILg/OMzYVRtzJ3aT5
 kewFhpvA0wXiSyDfoY4SgvZELDzzQFFqYrC3WhU6RnMRzeDQU1359ZI9zX/6/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=WT/Vi1B5
Subject: Re: [Buildroot] [PATCH 1/4] package/gdb: link with libatomic if
 needed
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/05/2026 16:49, Bernd Kuhls wrote:
> Fixes:
> gdb-14.2: https://autobuild.buildroot.net/results/32f/32f5715285ca46370df2ab35c38d16dbdbde5d21/
> gdb-15.2: https://autobuild.buildroot.net/results/386/38645389cc5fdb1d5fdfa5d6f6eef417a975ea41/
> 
> Support for gdb 14.x was added to buildroot with commit
> a9a56ab6fd98125ca09078bdeb7c8d55d53aa35e so a backport to LTS branches
> should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  It's a little bit annoying for us to have such mixed master/next series. We 
don't like to leave a series on patchwork where patch 1/4 is missing (because 
already applied) because it then requires extra effort to understand where that 
first patch went. Basically, if a series is not entirely applied, the 
non-applied part should be marked as Changes Requested (or Rejected).

  But the rest of the series actually looks good, so this kind of forces me to 
switch to next and apply it as well.

  Of course, I do understand you want it as one series, because you only tested 
anything with this patch included as well. I have no good solution for that, 
other than perhaps an additional comment in the series for next that explains 
that it depends on this other patch which is for master. Or I just have to live 
with the annoyance :-)

  Regards,
  Arnout

> ---
>   package/gdb/gdb.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 1841002dc1..2a2fdb260d 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -116,6 +116,14 @@ GDB_MAKE_ENV += \
>   GDB_CONF_ENV += gdb_cv_prfpregset_t_broken=no
>   GDB_MAKE_ENV += gdb_cv_prfpregset_t_broken=no
>   
> +GDB_LDFLAGS = $(TARGET_LDFLAGS)
> +# Uses __atomic_compare_exchange_1
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +GDB_LDFLAGS += -latomic
> +endif
> +GDB_CONF_ENV += \
> +	LDFLAGS="$(GDB_LDFLAGS)"
> +
>   # We want the built-in libraries of gdb (libbfd, libopcodes) to be
>   # built and linked statically, as we do not install them on the
>   # target, to not clash with the ones potentially installed by

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
