Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1E6CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46FEC60E37;
	Thu, 11 Sep 2025 19:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gt99DtLZ4oRW; Thu, 11 Sep 2025 19:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BCF261325
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BCF261325;
	Thu, 11 Sep 2025 19:23:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA4B7E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E71AD61325
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rn0wLcoxf9kP for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:23:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1C6D60E37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C6D60E37
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1C6D60E37
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:23:11 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6228de280a4so1878517a12.2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618590; x=1758223390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T26iujOSNjm9wAzFyI4yFNAqoTEQibrfE6j4wimT+04=;
 b=HxQCFNUFOqO+iMvbQMOhyKCpzOPLgM1EmKCyQyW8Eqg1NW74nqlTqKvpeKubN2ESQF
 Tqjjcvahwdy2K17zTGGSqhqkMWzIp5cyjNJw7OfHQdXcMsUDQoINwqrg7pPMXAUuEJVM
 r0jb3iw2fNt4H1iKk3YHIYWx7Rq7eUJ9JiaNp6lnu25x2fz7SLWWpeXibWwVpcsz/y9C
 ChY0CVNZkhFqZHSscR/y4BpLvj4lCoadiiVLYaHpAzse9Sb0stUlAjHQVEnZxfU44H6m
 wDSmpG1MYZAb4Di3UeJpKM8kesbyRQulLxAchCbkLjIA742ztw3Whh2j2e6eZfOwMhg5
 jGKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsCVRNRE62kNWdviXc0rI9PWCaJcqlcgAhJyTMkCzPQC46Q0DoHkBQ+lkHAtNuwczcCy1kWnXQXvk=@buildroot.org
X-Gm-Message-State: AOJu0YxsHr03icZDFvBkQiyTj58yz0MSvfWn4Q/uZJj6J24FJ6dkudF+
 lkHw1UfTO2Q2CkDFFkToAOoV2QeLGNSSMktaS06w9IUAVDXKuQatydiHHxqnobnY5EU=
X-Gm-Gg: ASbGncuvfqz/klBbA/a53xfL02RWvf4oDBWklMojSUffPeyJwx6EGt3gG0TKzLmYr54
 DDDaDAN7t7K024eG0aqf0HYyJ58/ZSFQiSBOuOuScraQ+5hCB0qVE7MwjFKZkurDXmvKaZo4IzD
 liibMvwnk3DujjNzuSUmztmt3HZ8RJibm+vKJW3UWDO0AkduTxTooBvjiJIUTnJoPB1okC89XT8
 NZ4MdG1zJlvnPFRud2uS6cYDN1qc8rc7XCrrlMz3AnQi4G+P7sU55YRfknP1nNELZA8J6SGfAJY
 mJceuFG+Admo86lfqx50F3ehRUOj7KUht6VwvtcPQ6xfrcl0pkZ1gJlZUR8i5fqPiV+kBwCqNpl
 KuaWGCoQw9gQ+PtTyVc75w/3YDDCxCfI6XayE3McSyPFE98E=
X-Google-Smtp-Source: AGHT+IHQIskhY3BvC+WdIY36kybOCz7Bj67H358aNmUAnwa9GQVKT2+yHzmw1OsN8RrBhB046XXciw==
X-Received: by 2002:a17:907:7ea8:b0:afe:7b35:9c8e with SMTP id
 a640c23a62f3a-b07c347e046mr31090166b.12.1757618589877; 
 Thu, 11 Sep 2025 12:23:09 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f202dsm190387866b.84.2025.09.11.12.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:23:09 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:22:46 +0200
Message-Id: <20250911192246.2671956-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250901143252.672903-1-peter@korsgaard.com>
References: <20250901143252.672903-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618590; x=1758223390; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T26iujOSNjm9wAzFyI4yFNAqoTEQibrfE6j4wimT+04=;
 b=GkrpCp/F4HptyNfyCY5GKhBfsHwSOG/6Cc6wlmZAQknIZrXaL5RNYgUPM+5DvDpWkD
 KrabIt9EffOPdbZNKA/EWoP1FDMQ0E/4dysKCJJF8JbBplv0tGqsuuHMicuKIvCXO1Ga
 P0iLuF91sIUUxJFMtqWmAYgi9mBaeLwq9dcoo7fMAY/SF/fdroeGNKiOGP5RyA203yR+
 mAO6nfyE4Vx17gioOdPVtQgXuMcevi8QwlQSA3L4rrqMrJ88UvgdZbOaCjnC3EGp1X61
 9UqQIOxSX1REPobvPbF9uxHuA7lxngnDtpQAROEm5KHWdVUeXcNHFV0AiuMDCuy00J1E
 XIvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GkrpCp/F
Subject: Re: [Buildroot] [PATCH] package/jose: needs shared libraries
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes https://autobuild.buildroot.net/results/bf23e75461877a4ca3a189626f30cf8cde24de36/
> 
> Jose unconditionally builds a shared library since v11 with:
> 
>  commit b72f8cad002edc87286dd1f2331c359158c512e8
>  Author: Rosen Penev <rosenp@gmail.com>
>  Date:   Tue May 30 12:18:30 2023 +0300
> 
>    jose: build library only as shared (#119)
> 
>    Needed because of constructor usage in library.
> 
> So add a dependency on BR2_SHARED_LIBS.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/jose/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/jose/Config.in b/package/jose/Config.in
> index 4a9ed8da65..32e17276b6 100644
> --- a/package/jose/Config.in
> +++ b/package/jose/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_JOSE
>  	bool "jose"
> +	depends on BR2_SHARED_LIBS # builds .so
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_JANSSON
> @@ -10,5 +11,5 @@ config BR2_PACKAGE_JOSE
>  
>  	  https://github.com/latchset/jose
>  
> -comment "jose needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "jose needs a toolchain w/ shared libraries, threads"
> +	depends on !BR2_SHARED_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
