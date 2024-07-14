Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A89C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 13:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC153605D0;
	Sun, 14 Jul 2024 13:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYXCsi_yan-N; Sun, 14 Jul 2024 13:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB480605E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB480605E9;
	Sun, 14 Jul 2024 13:28:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C05F1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07C6E40600
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 13:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5V8ZzE0BBTuS for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 13:28:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97EDB40536
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97EDB40536
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97EDB40536
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 13:27:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-367a9ab4d81so2104506f8f.1
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 06:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720963677; x=1721568477;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QMF2lR8mCzf8iYEzjERqr5PsB5ZHIfNr5cafg3z7Otk=;
 b=SziJeHU782vaqVAvoFuCmMEuLDHUD52NesDI6Q6w0MpEq+gOd32AlyAVJErnDbf7d5
 5AkdQQr0sPy8bQtLhnePJpBMpcNDsSZjdSeng2FZWhByx7XN2WW7VyQ10LEOclSRbbjt
 eu6IgGI6WR3iW9Je+KjN0ctZTc2FEHSza+QyilbBj7yVZJA7msWw6rvhbXEteIrNAuYl
 z+HOY+nyuLSuMSfk448ElTVWwwEcjDvHhj5K5XKoRwziUt0/De3Ct39vE6LMhvY9ocNw
 3YZhU2vio0RcZnd+A5lqZlkkdQAj+pEMCpq6X7dkQOZ7jbMlyK9EdiWa5/3EVpdJPqKS
 3HOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7AQHC/nATmYvHNc8L/gjMUCaOupzpWfV6V/yzy6MsGORO46/uWe5upNqFoum8kzqJ36ZMkTCNyf72lgbZl4QkmrN/lju/5Q==
X-Gm-Message-State: AOJu0YzPRS+och5XW77X91TnfmCZpx5JdhtMeVnsSusipWABo833iV0f
 P3ugdKnNMY6qbqEcJfG3alQzDozrdRpl9z0+pS5qjl9spDnfOD7eXrSoSyZYnSs=
X-Google-Smtp-Source: AGHT+IHU9YkEw8GcJAEDw0FIw+ylTSjrS58z2Hp1g5kGTSc6VBxcnHGP6f/UjIp24CZDUfxFw1bqHg==
X-Received: by 2002:adf:e70c:0:b0:367:4dc9:52e8 with SMTP id
 ffacd0b85a97d-367cea680abmr10609393f8f.16.1720963677285; 
 Sun, 14 Jul 2024 06:27:57 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dabef75sm3873398f8f.36.2024.07.14.06.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 06:27:56 -0700 (PDT)
Message-ID: <4b3b2fdc-86aa-4d8d-890d-a9dfd316c332@mind.be>
Date: Sun, 14 Jul 2024 15:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220718043901.873466-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20220718043901.873466-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720963677; x=1721568477; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QMF2lR8mCzf8iYEzjERqr5PsB5ZHIfNr5cafg3z7Otk=;
 b=IxPEve3av8tCzWI6+Y4ystGhoHsn2BiPimfDC8GD4NfX8nzS4G/iszn3fc6Rti5XIr
 wm73ytEYqHYMKcpikDYZEtHXCQiGNjt7oFSNpGYFWq2YR08BJQ6N6TCto6n2nSIPzQEo
 HjyyHBHUCU+daZRLHbv9Fct2bOhwZHci/VAHG5hV0RsUpORoof0LqKRuYgmlp4rbK8Te
 Bl9K8+UZx/bbGBPdZ5j9RpADoPywkMoco5zWYCfquvtf4Is6DZgFVb4h5HuCx59hhjl3
 J16xB2FOiknAoOjoCKe2lKWuYx3Uh6Ux4ChY2vSkFGWROQ9DpYwMGFjUqCHbvi7U433I
 HQnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IxPEve3a
Subject: Re: [Buildroot] [PATCH buildroot-test v2 1/1]
 scripts/autobuild-run: make hung build timeout configurable
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/07/2022 06:39, James Hilliard wrote:
> A reasonable value for this may vary depending on system load, specs
> and how many parallel builds are being run, so we should make it
> configurable.
> 
> Tweak LoadConfigFile parser to properly convert arg types.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  I finally could convince Thomas :-)

  Applied to buildroot-next master, thanks.

  Regards,
  Arnout


> ---
> Changes v1 -> v2:
>    - fix LoadConfigFile type conversion
> ---
>   scripts/autobuild-run | 26 ++++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 337644f..e8530f9 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -120,9 +120,6 @@ else:
>       decode_bytes = _identity
>       encode_str = _identity
>   
> -# A number of packages can take > 60mins of build time (e.g
> -# gst-ffmpeg, qt5webkit, mimic)
> -HUNG_BUILD_TIMEOUT = 120 # mins
>   VERSION = 1
>   
>   def rm_ro(f, p, _):
> @@ -208,7 +205,7 @@ class Builder:
>       def __init__(self, instance, njobs, sysinfo,
>                    http_url, http_login, http_password,
>                    submitter, make_opts, nice, toolchains_csv,
> -                 repo, upload, buildpid, debug):
> +                 repo, upload, buildpid, debug, hung_build_timeout):
>           self.instance = instance
>           self.njobs = njobs
>           self.sysinfo = sysinfo
> @@ -223,6 +220,7 @@ class Builder:
>           self.upload = upload
>           self.buildpid = buildpid
>           self.debug = debug
> +        self.hung_build_timeout = hung_build_timeout
>           self.build_parallel = False
>   
>           # frequently needed directories
> @@ -388,7 +386,7 @@ class Builder:
>               if os.path.exists(build_time_logfile):
>                   mtime = datetime.datetime.fromtimestamp(os.stat(build_time_logfile).st_mtime)
>   
> -                if mtime < datetime.datetime.now() - datetime.timedelta(minutes=HUNG_BUILD_TIMEOUT):
> +                if mtime < datetime.datetime.now() - datetime.timedelta(minutes=self.hung_build_timeout):
>                       if sub_proc.poll() is None:
>                           monitor_thread_hung_build_flag.set() # Used by do_build() to determine build hang
>                           log_write(self.log, "INFO: build hung")
> @@ -756,12 +754,10 @@ class LoadConfigFile(argparse.Action):
>           config = configparser.RawConfigParser(allow_no_value=True)
>           config.read_file(values)
>           for k, v in config.items('main'):
> -            key = k.replace("-", "_")
> -            value = v
> -            if key.startswith("no_") and value is None:
> -                key = key[3:]
> -                value = False
> -            setattr(namespace, key, value)
> +            args = ["--" + k]
> +            if v:
> +                args += [v]
> +            parsed = parser.parse_args(args, namespace=namespace)
>   
>   def main():
>   
> @@ -811,6 +807,11 @@ def main():
>       parser.add_argument("--debug", "-d",
>                           help="Send log output to stdout instead of log file",
>                           type=str)
> +    parser.add_argument("--hung-build-timeout",
> +                        help="A number of packages can take > 60mins of build "
> +                             "time (e.g gst-ffmpeg, qt5webkit, mimic), sets "
> +                             "timeout in minutes",
> +                        type=int, default=120)
>       toolchains_csv = parser.add_mutually_exclusive_group(required=False)
>       toolchains_csv.add_argument("--toolchains-csv",
>                                   dest="toolchains_csv",
> @@ -895,7 +896,8 @@ def main():
>               repo = args.repo,
>               upload = upload,
>               buildpid = buildpid,
> -            debug = args.debug)
> +            debug = args.debug,
> +            hung_build_timeout = args.hung_build_timeout)
>           p = multiprocessing.Process(target=builder.run_instance)
>           p.start()
>           processes.append(p)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
