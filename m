Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879B4C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D2E981ED4;
	Sun, 18 May 2025 14:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuMVqNUeDqkN; Sun, 18 May 2025 14:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F8BF81EEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F8BF81EEC;
	Sun, 18 May 2025 14:43:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A49F7DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A8FD60AC3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ca8EeNEbtobD for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:43:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4A0B60A5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4A0B60A5B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4A0B60A5B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:43:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34B651C1001; Sun, 18 May 2025 16:43:01 +0200 (CEST)
Message-ID: <502c7718-2132-4830-8663-5260cca3b2d3@rnout.be>
Date: Sun, 18 May 2025 16:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nikita Kiryushin <kiryushin@ancud.ru>, buildroot@buildroot.org
References: <20241121140134.3476-1-kiryushin@ancud.ru>
Content-Language: en-GB, fr-BE
In-Reply-To: <20241121140134.3476-1-kiryushin@ancud.ru>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579383; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/Xv+hktOCj/Ogm7O4tGWh3lf2R6DFgIuWX8r4iitbXA=;
 b=Pwv/vn/xtnmf4R0CigziK0o8nY5kEBG9W9pGPsN4tVp38EaAfai2Rt0MIWIq5qK0Lz7/k3
 /TURFi9nvIDo2oRUxNLEkXsVd1vjArElhgbxmhTD5iZr+2gQNOxEITStJDBjG2Sjj/EXaf
 MIbNyKLZ4Bed37vZh32J9g+Wl1U3ThmZOc9IN+M+O5znaEe7cEOq4tDrTGtf2T0S3Ljsb8
 JSG6jJnnCSc74b2ZrT2vTKHRHOCWmfCVmQvkTx0KeIqPISNq7LlmuYbU+BADGPQ18y6RTx
 qr3cH7l+G2+au6EzXqwCYMVX+YvShjYFqr/zvfl/cMSY85A7uSupBRWpnQO8Uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Pwv/vn/x
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus: set session-socket-dir to
 /tmp
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



On 21/11/2024 15:01, Nikita Kiryushin wrote:
> dbus has a session socket directory configuration setting,
> that, if not set, will be autodeducted based on env vars
> during configuration time.
> 
> Becuse of that, builder's environment variables may be used,
> which will lead to an image with a broken session bus while
> leaking builder's details to the image.
> 
> Add an explicit setting of session-socket-dir to /tmp dir.
> 
> Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/dbus/dbus.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> index c60bf473cd..2002e707f0 100644
> --- a/package/dbus/dbus.mk
> +++ b/package/dbus/dbus.mk
> @@ -34,6 +34,7 @@ DBUS_CONF_OPTS = \
>   	--disable-doxygen-docs \
>   	--with-system-socket=/run/dbus/system_bus_socket \
>   	--with-system-pid-file=/run/messagebus.pid \
> +	--with-session-socket-dir=/tmp \
>   	--runstatedir=/run
>   
>   ifeq ($(BR2_STATIC_LIBS),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
