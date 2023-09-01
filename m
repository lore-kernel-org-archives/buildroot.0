Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84BECA0FE6
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 07:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50B3940903;
	Fri,  1 Sep 2023 07:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50B3940903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zUbsOJGAX5Dt; Fri,  1 Sep 2023 07:10:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48FA941B4B;
	Fri,  1 Sep 2023 07:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48FA941B4B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E416D1BF312
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 07:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD9FB832D8
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 07:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD9FB832D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QeEYE1FxQ5gF for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 07:10:38 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2AA183123
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 07:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2AA183123
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so186416966b.2
 for <buildroot@buildroot.org>; Fri, 01 Sep 2023 00:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693552236; x=1694157036;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6B/Dd3TgCwGDRr8DPKkjRQ0f0P4CLudCXxSBIUKm0BQ=;
 b=UwAj+dmmaho7n3ode6wylIgy7vNZY+wis0lHXUH1Tcyw1BQ/JsLKln9hqLuWZLN+SN
 /iDreh12Iaj9oF/iAhT3xsZutQyPaNyYIpKpimRi6rCSlbprtzXcC6Fz0g+QQLlZnOYa
 vXrCAkPkuUVYZix8gEW9gkhuTVMKPEB/xczOfcpSzZmbqDzDLiAv9jDze2vC+LYOHfWz
 gbq2kdbq7SYvXziErMhjwhFUg6MzuBrp4zufIW2pYfwP8ZydqplYPVn5v8UVnrYXPMqe
 fP5V9JUUBBC+/h+M3CvkbXWf4k0w+1/Q4Zx1z5QJUWVN5IUL3yvFg+wZS/YCL7fMG1Px
 Bqog==
X-Gm-Message-State: AOJu0Yxs/HQE6jJ6z64BIgL9fse46nrWgYbQ2NdicP1T+seDq30Fzrb+
 F08ATe/MHvCcxSw6oAt5edTl3n4NBkMb1p4veFM=
X-Google-Smtp-Source: AGHT+IGiXbP9l2ofPuxBWxBVFLCczjR8OvrM/E5rRjV+FzJRSsWMV24MrxgA3ZnzrQfyoEICO8G0Ng==
X-Received: by 2002:a17:906:74dd:b0:9a1:f9d7:90be with SMTP id
 z29-20020a17090674dd00b009a1f9d790bemr1170123ejl.18.1693552235912; 
 Fri, 01 Sep 2023 00:10:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 le19-20020a170906ae1300b009930042510csm1623212ejb.222.2023.09.01.00.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 00:10:34 -0700 (PDT)
Message-ID: <64f5b9e8-91a8-32f5-5cc8-fb0ed67b5f56@mind.be>
Date: Fri, 1 Sep 2023 09:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230812192842.135682-1-dalang@gmx.at>
 <20230812192842.135682-5-dalang@gmx.at>
In-Reply-To: <20230812192842.135682-5-dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693552236; x=1694157036; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6B/Dd3TgCwGDRr8DPKkjRQ0f0P4CLudCXxSBIUKm0BQ=;
 b=Lx85caYHpqtLOJmPk+mdWG0ccWz3fS0x3PkdKzJrXKCXNgnCDaVV7PagxQyRlrwYNF
 uN0XIjnI1qqupMnrIhFKxjHyPPj2N3kQpmHmSho6vf9/JQwM/B843IENg+H6eTmreCrv
 D8m7ue9hQVxx5HeZ+67vjcRNBrIPwzd3G6gjKyvVpzJGU92bIk3TDPe4CNFRlmjTH+EW
 QGRvOJnFn6L7TBiReroyTdwzVu3bKxJR+4lmLi7uh+AXQMqPjPPer+wBuVMOu3Vezz+e
 2dpKj1fmB/v32Ds0FKK/PyIpiKeahJiSGX+WGZqosKTo+H3wSx91d0KDXjILbXQXosDr
 Kvmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Lx85caYH
Subject: Re: [Buildroot] [PATCH v3 5/8] support/scripts/nvd_api_v2.py: new
 helper class
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/08/2023 21:28, Daniel Lang wrote:
[snip]
> +    def check_for_updates(self):
> +        """
> +        Check if the database file exists and if the last
> +        update was more than 24 hours ago.
> +        """
> +        self.cleanup_db()
> +        last_update = None
> +        if os.path.exists(self.db_file):
> +            last_update = os.stat(self.db_file).st_mtime
> +            if last_update >= time.time() - 86400:
> +                return []

  Actually, is this check really needed?

  If it is, it really should be something smaller than 86400. If the script runs 
daily, we really do want do update the database every day. If we use 86400, then 
it will sometimes not update, because it runs just one second earlier than the 
day before.

  But I don't think it's needed. AFAIU, the check_for_updates() would be called 
only once for a run of pkg-stats (well, once for CVE and once for CPE). So it's 
only if you run pkg-stats several times in a row that it's needed to avoid 
re-fetching. You normally don't run pkg-stats several times in a row. But even 
so, it will just hit the rate limit, wait for 6 seconds, and all is well again.

  Maybe your experiments show that that's not good either, e.g. because the rate 
limit will hit harder and harder if you run pkg-stats all the time. In that 
case, a time check is useful, but I'd drastically reduce it, to e.g. 2 hours.

  Regards,
  Arnout


> +            # NVD uses UTC timestamps
> +            last_update = datetime.fromtimestamp(last_update, tz=timezone.utc)
> +            shutil.copy2(self.db_file, self.db_file_tmp)
> +
> +        self.connection = self.open_db(True)
> +        self.init_db()
> +
> +        success = self.download(last_update)
> +        self.connection.close()
> +        if success:
> +            shutil.move(self.db_file_tmp, self.db_file)
> +        else:
> +            print("Update failed!")
> +            os.remove(self.db_file_tmp)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
