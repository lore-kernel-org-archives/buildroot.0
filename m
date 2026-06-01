Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6795CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 21:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8982080966;
	Mon,  1 Jun 2026 21:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86JzEk5UnTTV; Mon,  1 Jun 2026 21:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFD138083F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780348381;
	bh=1BkELHFcTthCaRCMq7ka9JBfwYwarLJaOxUJRVeBcVY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DeZb7JL0PmrkOp+PuasXQWamA6VPEIgC4d3tXUcvQ2FA/9zz6wZO6l16tOiWWY+5f
	 Z2ATIjGLrlREueEw5a1oqwI0zSMwdRqtFZvF2MjFX2/r/Rya04BUMpWWrw4sAmeUnB
	 Eo3yOH8QKy+j/wcz4GBfQ9jBXQudSejo+VV5k+Io3VXs8dhW/hQI39DQvlB34vxHWx
	 iXeZd70AEi+lBTBkBEzXyuoOQ8hHXwtZzt2T+fIlSZMlwDVylEEn5pgh99FN9AK/sz
	 bdFnhDhRwAuxTI9hdPt92xLtMFRX0CH104wz6S6GCXkaQ5Rp0rTb6lC0Ekk71r1QPJ
	 t+W49h9ipX7lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFD138083F;
	Mon,  1 Jun 2026 21:13:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A751223
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E45CD40527
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mj5dL_TXGnhQ for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 21:12:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F3A14050E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F3A14050E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F3A14050E
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:12:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BD345B97C76C; Mon,  1 Jun 2026 23:12:55 +0200 (CEST)
Message-ID: <e8aa6f35-a7fc-49d5-9c75-f2fb047262f1@rnout.be>
Date: Mon, 1 Jun 2026 23:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>
References: <20260601204735.888967-1-j@j-ernberg.se>
 <20260601204735.888967-2-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260601204735.888967-2-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780348376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=D19NxhNXyKmgCjH5hjqZr30xqMbSOr3In06AkzP7U8w=;
 b=j870h5J3bDPeJRdR1Acp2ah8V2emp9vC9kriI8/sgwIyDG3VQLPgPIdL4E1RculKXZxl2g
 ptuP4SOvTpfFxBhCKQFfuoETJG1ZPJ1Z6Hg7i644OjydRL6/0f9iIk89WOLsCwKk1vWtji
 vgKtt74V0eVwSNdd5m6w6dWyhOyRoJI+LoNMW6AmJffgofszMccrNp71M/UpW4iORNNfh1
 LLx9OpyCXgGgaWDQwZQDm1uE3/R4f/GXM8MJ8ccku0jLOOfptCyvACqxU/GqveU0aBijDL
 QLeN/6B3eErQ5Omjo1/8P+dZZaDVGeExeorEBHRbtAJSXo7AUkkeFhZYE7Q+pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=j870h5J3
Subject: Re: [Buildroot] [RFC PATCH 1/9] package/foot: Prefer ncurses
 terminfo if ncurses is selected
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



On 01/06/2026 22:47, John Ernberg wrote:
> foot's INSTALL.md says to use the ncurses provided terminfo. [1]
> 
> If the ncurses package is being installed, disable generating the bundled
> terminfo in favor of the ncurses one.
> 
> Link: https://codeberg.org/dnkl/foot/src/branch/master/INSTALL.md#other [1]
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> 
> ---
> 
> RFC: Because I am concerned it might break stuff in ways I don't know how
> to test.

  To test this you can look at:

- Is there any file that doesn't get installed anymore by either foot or ncurses?
- For the files that are not installed anymore (because they conflict), are they 
contents different? Is the difference significant?

Of course, it's actually difficult to evaluate if the difference is significant 
for mysterious things like terminfo files, but it's something at least. For 
example, if foot installs a file that is just a few bytes, while ncurses 
installs something that is more than a kilobyte, then clearly foot installs a 
placeholder and the ncurses version is going to be OK.

  Regards,
  Arnout

> ---
>   package/foot/foot.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/foot/foot.mk b/package/foot/foot.mk
> index 3e37d41557..1275b08c4f 100644
> --- a/package/foot/foot.mk
> +++ b/package/foot/foot.mk
> @@ -27,6 +27,10 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>   FOOT_DEPENDENCIES += systemd
>   endif
>   
> +ifeq ($(BR2_PACKAGE_NCURSES),y)
> +FOOT_CONF_OPTS += -Dterminfo=disabled
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBUTEMPTER),y)
>   FOOT_DEPENDENCIES += libutempter
>   FOOT_CONF_OPTS += -Dutmp-backend='libutempter'

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
