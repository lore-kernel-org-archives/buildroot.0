Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFBCC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E26D8121F;
	Mon, 15 Jul 2024 14:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfoprdznJmUq; Mon, 15 Jul 2024 14:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E13A812A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E13A812A5;
	Mon, 15 Jul 2024 14:02:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 477371BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33CEE405F2
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msdiaScZxxPR for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:02:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 076A8405E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 076A8405E9
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 076A8405E9
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:02:15 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4266f535e82so29173575e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721052134; x=1721656934;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7qIyFnA2rbqH86RkmrJHNF3G1EceFfrfT0FvG8m0DTA=;
 b=E8XP6dHA5jgAQD9O33nWXdQ5xHlQZes88wHn9pYwl3sbsDc5wdonK1/wrSLtysjphn
 AalCJp6rxX/zVNdXoIJSS0sQbK7bdedQcn7sl0eKhA1dumndKcaHrP0EYavmV0a8E1IB
 IDPCuzWBAALv9ViNhrRc9kMc+IcLo0M62uXp9aMloIAulvHI3ovF4DfTS5uvlDJBxWAb
 aIWv5UQdlUrD76JUaX6kpE3Hyrk8TCihu2/1ruxXZGl5FAFwar7MGaubuopaUSHe4Dwb
 kWpUaPrm5ipkdmsslFejQl6v6kOrk6RJva0gfcIhNhA8KqIteCXv+H3ZiArVpB+ak6j+
 L8sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRs254GSFDF28cv6A3iKu79+bJWOQvUFJTcfDvVDl6gGsXHrwwQ2+cthpIu+cjgK0iD1WcJyZxMYvmGPvbqAFhYFBOjSy9eg==
X-Gm-Message-State: AOJu0YzWB9oBWHT7jaU9x6mnV4T1PhKXCEQ1SL2OMmwCYxFr8HYlvqnl
 pNcctS9oIimF5fllUMH4pVJx0vuJqqI17E5dZueDHEFLyQyV3T3Cgi+BNsUO5QU=
X-Google-Smtp-Source: AGHT+IFtCM8ZieHEbOUMvRshzPXZFXQLxt36itEdflRKY5kMe8Rtgq0L4GTesai6FBFh2M5502JSTw==
X-Received: by 2002:a05:600c:24c:b0:426:697d:af49 with SMTP id
 5b1f17b1804b1-426708fa999mr139509575e9.39.1721052133978; 
 Mon, 15 Jul 2024 07:02:13 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7751asm89727045e9.3.2024.07.15.07.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:02:13 -0700 (PDT)
Message-ID: <1b6cfb42-4460-4c4e-aa69-573a6df9542a@mind.be>
Date: Mon, 15 Jul 2024 11:31:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
References: <20240713203559.3360538-1-roykollensvendsen@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240713203559.3360538-1-roykollensvendsen@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721052134; x=1721656934; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7qIyFnA2rbqH86RkmrJHNF3G1EceFfrfT0FvG8m0DTA=;
 b=bKlK62DFHRnM726zAtpwRiV293N2hCZET+wVw2QzDpaYRXmi8jIuUWLmQwN50dc5Ma
 CPRSGX49n5IXwZQfUfX4dHmRuvK7DlOMcJb5wyG1Jaaz33KVVvjeTNMND0R15Ul5c2it
 D+a2clcMxgQ7ca2zNKJNzXtx5hdcUnChZ6xhXiYk31MV9AExip1Vznt8ReoqojAoQ1vz
 3KkSH7AGDbXeZ1gAHiyn4YgpKLpVK4g7Lw9xCLGgB0ZLXlX7lgIs6xDe5PUJzGhl9WJn
 5Z7685CgkOLZ3Ed4NmbV0t4onfI3l6SoHaAlZOMiIba2Yh7Um0yhRcAv4yrOm1W/qCCy
 Rx1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bKlK62DF
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6base: fix missing
 plugins and qml2 imports
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/07/2024 22:35, Roy Kollen Svendsen wrote:
> When using the default value "." for of ArchData, qt6-applications that require QML2 imports or
> plugins, will not run:
> 
> In my case the wayland-egl platform plugin is not found:
> 
>    qt.qpa.plugin: Could not find the Qt platform plugin "wayland-egl" in ""
> 
> And I also get a lot of qml related warnings:
> 
>    qrc:/qml/main.qml:3:1: module "QtQuick.Layouts" is not installed
> 
> Prior to this fix, we had to set the QML2_IMPORT_PATH and QT_PLUGIN_PATH or make sure qt.conf is
> available.
> 
> After this fix, ArchData starts with "lib", which is necessary (according to my own experiments)
> for qt6-applications to find plugins and qml2 imports. The root cause is still unknown, but I

  We don't like to see "the root cause is still unknown"... But for Qt stuff 
this tends to be pretty unavoidable :-(

  Also, the fix itself seem pretty logical.

  Applied to master, thanks.

  Regards,
  Arnout

> think the current solution is sufficient.
> 
> Setting ArchData to "lib/qt6" is also a good first step towards a better qt6 filesystem layout.
> I will continue improving the qt6 filesystem layout in a later patch.
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>   package/qt6/qt6base/qt6base.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index 6cb82d9a94..5ab61ba3e0 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -42,6 +42,7 @@ QT6BASE_INSTALL_STAGING = YES
>   
>   QT6BASE_CONF_OPTS = \
>   	-DQT_HOST_PATH=$(HOST_DIR) \
> +	-DINSTALL_ARCHDATADIR=lib/qt6 \
>   	-DFEATURE_concurrent=OFF \
>   	-DFEATURE_xml=OFF \
>   	-DFEATURE_sql=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
