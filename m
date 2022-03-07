Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4006C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6394B8291C;
	Mon,  7 Mar 2022 22:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLSqw1SP8rtd; Mon,  7 Mar 2022 22:09:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 922DD828F7;
	Mon,  7 Mar 2022 22:09:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B487E1BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A456141744
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOK7wEhtjev3 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:09:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66C544173F
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:09:34 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a8so35043676ejc.8
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qv+bY0RASHXvdH6K9soXDzXcDQV54RDfpre1dg16jO4=;
 b=bQ/7WkTRfV3fbLEV3fZoWDLXAC2EU4QjnYUJJxDceU6ebANr0nS9ltK/bHS5o3OIc1
 8GQw1koRw8wLT7IRELIZQDsNTaOY4wqkTnHRWr3Cn56mElaORGGGevSDzE4Okxnrd/wd
 qowKKHj7W5f5dgPzQEJ6Sp34C65EJkE77Fz+MUiygqxV7cLkzaNpk3mmuBenFaekZjpP
 eZa0m7AgOlM5nU/2ErOZfu1hlH1crbkmd8hjhNbvzz+rTe6/h1K7m0/dDQwTSJ340ljA
 lT/KSgzUebylrJCDix2g7mOMUXptD9esgzW6XoBNrx4kj2fCvdQvEokpwW+IrOYYY5rV
 vbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qv+bY0RASHXvdH6K9soXDzXcDQV54RDfpre1dg16jO4=;
 b=ggvqm3fbg5USXHiGnvv+m46+pEdImUPh6gDYkXTIX4m/JQ2tTZaFsmkeNUz2Kb0niu
 6hZXFSAHc9FpEIDx0p4Uni6y7WOu2R3KKWuNnp1PdkIFJFDqkhbSvDHNamhkwYOkE9l6
 BoTOhV4ClEtq/V0ADROVxK6Wwwz8D/0qTIiegdpHh7Bo8EwPVW/uTDmYFRQ/hMouIS+W
 I1S7JT0EZj7ESBDsZrCgZRmNjPclo6AIbSbApfPa8Ae1GYDT9EIUf75Q0Ojc4BdFSeef
 H0ux8i/C4sgtQ2pfRLbCv/kQe90kIcu1JsgJOyDhnd7b83kWYjOOdtmPy0ZOc+9Blgiz
 sGDQ==
X-Gm-Message-State: AOAM532KnwtpaEeK5la+yBwSKQRDitJNci0Gxp0BSSXHYLMCVi9JoBHm
 Rc0LUT1Vin1jFYdGDqP8mguFMw==
X-Google-Smtp-Source: ABdhPJxlDdefzBHhxh5KZoSP49FCm3zPHeg8/emkwrTtWeOEs7WqKqEcBiI7HFxix2q122c45a46VA==
X-Received: by 2002:a17:906:2646:b0:6d5:d889:c92b with SMTP id
 i6-20020a170906264600b006d5d889c92bmr10892711ejc.696.1646690972648; 
 Mon, 07 Mar 2022 14:09:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 dn14-20020a05640222ee00b00410b88abd6fsm6772478edb.45.2022.03.07.14.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:09:32 -0800 (PST)
Message-ID: <ee2b1896-bc30-9674-ecad-d18a4f1e41cd@mind.be>
Date: Mon, 7 Mar 2022 23:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220222213202.642708-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222213202.642708-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: fix mysql.service
 failing to create log directory
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/02/2022 22:32, Julien Olivain wrote:
> When enabling MariaDB (BR2_PACKAGE_MARIADB=y) and systemd
> (BR2_INIT_SYSTEMD=y) in buildroot, the mysqld.service fail to start
> with a permission error.  See output of command:
> 
>      journalctl --unit=mysqld
> 
> Which shows:
> 
>      systemd[1]: Starting MySQL database server...
>      install[102]: install: can't create directory '/var/log/mysql': Permission denied
>      systemd[1]: mysqld.service: Control process exited, code=exited, status=1/FAILURE
> 
> Since the service file includes the "User=mysql" directive, the
> "ExecStartPre=" is executed as this user, which does not have
> permission to create a directory in "/var/log".
> 
> This commit fixes this issue by adding the "!" prefix, which will
> execute the command with full privileges.  See the systemd.service manual
> page entry for "ExecStart=", table "Special executable prefixes":
> https://www.freedesktop.org/software/systemd/man/systemd.service.html#ExecStart=
> or https://github.com/systemd/systemd/blob/v250/man/systemd.service.xml#L339
> 
> Moreover, the "mysql_install_db" invocation does not need this special
> prefix, as the "/var/lib/mysql" directory on target is already owned
> by the "mysql" user.  The "chown" command is also useless and is
> removed in this commit.
> 
> Reported-by: Gilles Talis <gilles.talis@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Excellent commit message BTW.

  Regards,
  Arnout

> ---
>   package/mariadb/mysqld.service | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mariadb/mysqld.service b/package/mariadb/mysqld.service
> index d9ea74ebc3..537430e9a2 100644
> --- a/package/mariadb/mysqld.service
> +++ b/package/mariadb/mysqld.service
> @@ -2,8 +2,8 @@
>   Description=MySQL database server
>   
>   [Service]
> -ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql && chown -R mysql:mysql /var/lib/mysql'
> -ExecStartPre=install -d -o mysql -g root -m 0755 /var/log/mysql
> +ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql'
> +ExecStartPre=!install -d -o mysql -g root -m 0755 /var/log/mysql
>   ExecStart=/usr/bin/mysqld_safe --log-error=/var/log/mysql/mysqld.log
>   Restart=always
>   User=mysql
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
