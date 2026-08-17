Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BC7C5DF70
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 09:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02A6260720;
	Mon, 17 Aug 2026 09:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWeRLt_XZ2_K; Mon, 17 Aug 2026 09:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C28A6071D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786958033;
	bh=gqAT39u3xOmpm+9aUcNy0TZuDdH+opjuwQp5cQ58DP4=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HovlMqNVJUk6IfJ5jzgtXtrWx/YuxQYgSIbo5XYWYlrn28QDhOI61dBVcppndVL8F
	 T0PSdkGi9YFohPJcE+nC4pd/GbsKduBzgBWdUEF7b93SRdIHEFB/Q0as0Vm8qgVDc4
	 BtpM8MgQgtCciFjdZqbfwKSIJNX8qcJ6qaAXwB1TzaL7IBpjo8NkLbpXbZ2KU+wzQ+
	 QmjXSuYQGB0prhaHuxjHGed6jwNB8CKBb1pfUbit+hko+np715hKqGHU5JmUd6LOr1
	 IuOsEpDwPHXiMeaUzaAq2v0R96kA+jq45HcL43mJoHxEKPuRKN0ufW6VjJqtszeuio
	 M3TVW3YOgaaGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C28A6071D;
	Mon, 17 Aug 2026 09:13:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1288623F
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 09:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB5A640728
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 09:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOUBehQ0Safo for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 09:13:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C12A140723
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C12A140723
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VY5RiFVr
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C12A140723
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 09:13:50 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4956242332dso33511975e9.2
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786958029; x=1787562829; darn=buildroot.org;
 h=in-reply-to:references:content-transfer-encoding:mime-version:cc:to
 :from:subject:message-id:date:content-type:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4BzBK7i76jmWxZgP79rD+bH7xefQbV4Pm9E067Ur9go=;
 b=VY5RiFVrjWiWoQVcUtfd5F7LiEgxT/2NojKo/DEo17Yz/+3MPFrpH5bu1R5El+FJHO
 bmfoir6I6eGMfzJqsf7tnmPcSBVFlOhwrE4SCHGpuFQhCtX6IQYciWRykzrJ6/jD5a0F
 dm28sy/gsRqwSm+wsNPCrsQVsmWrqA5U0u+rRhjASwwsDG3ax5vFQI4++hxsFMDnbscM
 R+Bcq8uf5wryNnETChgk96jO15vOZXm1zYwOjNNVHYhBkweCzzegNP2YK0rh+it4FTPW
 EwIGofSAE9GyATau7wvQoQLLvWq6GQK7GsAnFFgfB82nonRWLb/Rh/StCoj0CBHdBs83
 EVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786958029; x=1787562829;
 h=in-reply-to:references:content-transfer-encoding:mime-version:cc:to
 :from:subject:message-id:date:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4BzBK7i76jmWxZgP79rD+bH7xefQbV4Pm9E067Ur9go=;
 b=eE+G9Xmb5xT9bHqD4Dp0Wb5Jq6XcJi4cMdiSvCyE7Cfrhk8UP3EhAJWzlQMO4g9hdc
 cG1o2sVrx6PSE6x15+Nrha9mYmMpL3txH3Fb5aRnggcWFjrN/q2qbaZBYjYnQeZZ6jqe
 PnmlHIQsDDvxvIZSdkocU3odgjnkJDY4GJcUkkmPuti+jF1FYH6cR76nGWULRm5uEBWX
 mJe5L218osqSuBKxkId6bD5uLvzibfxE/+lVd8hPRHi8dXicZjR7J5DWOXCqjqY4Jc1J
 1NguMc80H5z36iQr9VK0q7LN5fizUONJ2u963p+KAW2wusKV2/Ct2uuuEjRD/qFFMpv4
 zhoA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpzy2wNiURTNAS8yShkSmmnXxTvGbxW2MzvQIMFK30JBT3y/TwLKr2WBhdmbEHkKaSiogh72y/vWW8=@buildroot.org
X-Gm-Message-State: AOJu0YxADVlnHEGSeBMxkp8ohIrSMlE36FPL9tfhULqHVNvLXC7qP7R2
 u0gfmIGvbj/ncHi6elXrfs7s5P4d3xyEIoGlkMyHmg6W/yIF8vYMKeGWAeGtYA==
X-Gm-Gg: AR+sD12SPHsvQmK1ig9uVwqo7d0S5WyZbJXf6+Sz4vm07C1pud+cXLG7vrpMM5RkSZT
 kdoHjCX8yDBfX6J06Dz6YXUo0nD/Ed/+1J/3LD111t3CLAoGaOXtwmZlAJTdvHngGL/8Rd4p2IP
 bjs1r1NEbeg3DPr5L6rXooLWS2VhfunO1nJsoDgYrqs794tizAfOkXf01vzJIXirqc4Kv+L21+s
 p+NV7kqxOSBwOg4Kv1OJIY3XBAg4vEW8hfmpO1CBfQltnA6KcgEhz9xF82g76/j2iwaJ4d4P+yv
 vfFdvXOePmyCEucOa6o99jPqOtLwrwR7N7lARWgqPCBqcvJipWUBFaezpp7Mq948Hi3vN3T2mkZ
 vyTT1hv2ypiAxjQc2Azte5l4ZG4xpkbGtcnT5QfcrRO7hlE+Tcxd/NLL3EjMhcKwtR/l+IWkTvA
 gSFWvs2rHVqN+tHtArIKEa4f/Ysn8pCpB0dQFP/IEtP4b19aiRO5FVFwv2hso+6CSO8U3YeU5f1
 EGAayA/qPKaAs4DnC9Km60cS0Abmh9dWZvdw5lwj1SoJMWLRmc1YSapxkjIGsR1HsBX2kLyr/dy
 u+bSmdcat78uINKQj403IGqs6w==
X-Received: by 2002:a05:600c:3596:b0:499:8ed2:8234 with SMTP id
 5b1f17b1804b1-4998ed286c1mr256685295e9.0.1786958028418; 
 Mon, 17 Aug 2026 02:13:48 -0700 (PDT)
Received: from localhost (aki181.neoplus.adsl.tpnet.pl. [83.26.12.181])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d078517sm22986755e9.5.2026.08.17.02.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 02:13:47 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:13:46 +0200
Message-Id: <DKR3R4CTU3U8.3KKKH6OBIY8ON@gmail.com>
From: "Franciszek Stachura" <fbstachura@gmail.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, <buildroot@buildroot.org>
Cc: "Adam Duskett" <Aduskett@gmail.com>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <684e3ab3.050a0220.c7c39.8aa1@mx.google.com>
 <95ab2877-1937-4c1f-9c77-5e7df62f4a3d@gmx.de>
In-Reply-To: <95ab2877-1937-4c1f-9c77-5e7df62f4a3d@gmx.de>
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2025-06-14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone, 

On Mon Jun 16, 2025 at 12:53 PM CEST, Fiona Klute via buildroot wrote:
> Hi everyone,
>
> you might've noticed there are a lot of autobuild failures for 
> host-gobject-introspection errors recently. One example:
> https://autobuild.buildroot.org/results/b9904209e13c1e4ce496aaff2f194064d2a6c691/
>
>  From the error messages it looks like *something* links against system 
> libreadline, which then links against libncursesw from host-ncurses 
> (probably due to the LD_LIBRARY_PATH override), isn't fully compatible, 
> and then the warning
>
>> /bin/sh: /home/autobuild/autobuild/instance-22/output-1/host/lib/libncursesw.so.6: no version information available (required by /usr/lib/libreadline.so.8)
>
> somehow ends up in the linker command line (which seems like a bug in 
> itself, probably in in GOI, regardless of library paths).
>
> My problem is that I can't reproduce the issue, and without that I don't 
> see how I can figure out where exactly things go wrong. I tried on my 
> regular build system, and also with the 
> registry.gitlab.com/buildroot.org/buildroot/base:20250218.2110 image, 
> and both built host-gobject-introspection just fine with config from the 
> linked autobuild run (and a few others I've tried).
>
> Does anyone else have an idea, or a suggestion how to replicate the 
> autobuild environment (because there must be some difference if it 
> consistently fails there, but not with the container)?

host-gobject-introspection errors still regularly appear in autobuild,
so I thought I would investigate.

I believe that at least two conditions have to be met to hit this:
* Host is based on a distro that uses libncursesw.so.6.6 (i.e. Arch, as
  is the case with James' autobuilder instance)
* Ncurses is built before host-gobject-introspection

Right before the error, the following happens:

1. Something (meson? [1]) calls gi-scanner, a python script that is supposed to
   compile something else
2. gi-scanner calls pkg-config to get build options (tracebacks [2])
3. pkg-config outputs a warning (no version information available...) to stderr
4. gi-scanner captures stderr with stdout and parsers that as build options,
   which are then passed to gcc

What could potentially fix this, is stopping gi-scanner from capturing stderr of
pkg-config by simply removing "stderr=subprocess.STDOUT" from
subprocess.check_output call in giscanner/pkgconfig.py (see line 34). This
probably should be sent upstream.

From what I understand, pkg-config is a shell script. Buildroot calls it with
LD_LIBRARY_PATH=$BUILDROOT/output/host/lib.
Bash links with /usr/lib/libreadline.so.8.
readline links with libncursesw.so.6.
A buildroot-version of libncursesw.so.6 is included in output/host/lib (in
LD_LIBRARY_PATH supplied by buildroot), however, libreadline.so.8 is not.

So, the warning seems to be caused by system-bash dynamically linking with some
libraries supplied by the system, and some libraries supplied by buildroot. The
warning also appears if I simply run
LD_LIBRARY_PATH=$BUILDROOT/output/host/lib bash.
Wouldn't it make sense to also build and use host-bash and host-readline?

Commenting out line 45 of package/gobject-introspection/gobject-introspection.mk
also fixed the error for me on Arch, but of course the comment above that line
suggests that this is not the correct thing to do.  That line was introduced in
8270fca2 (package/gobject-introspection: fix host-linking), later modified in
5ef6f949 (package/gobject-introspection: bump version to 1.84.0).

What really adds to the mystery, is the fact that if you run make
host-gobject-introspection ~3-4 times in a row, the compilation step may just
finish normally.

Config: https://gist.github.com/fstachura/0cd14adeb1181731a88c959c9e1977d9
make ncurses && make host-gobject-introspection

[1] subdir('giscanner') in meson.build, maybe tools/meson.build

[2] 

File "tools/g-ir-scanner", line 134, in <module>
    sys.exit(scanner_main(args))
File "giscanner/scannermain.py", line 672, in scanner_main
    shlibs = create_binary(transformer, options, args)
File "giscanner/scannermain.py", line 483, in create_binary
    binary = compile_introspection_binary(options, File
"giscanner/dumper.py", line 304, in compile_introspection_binary
    return dc.run()
File "giscanner/dumper.py", line 164, in run
    introspection_obj = self._compile(c_path)
File "giscanner/dumper.py", line 187, in _compile
    cflags = pkgconfig.cflags(self._packages, 
File "giscanner/pkgconfig.py", line 53, in cflags
    out = check_output(flags, ignore_errors, command)


File "tools/g-ir-scanner", line 134, in <module>
    sys.exit(scanner_main(args))
File "giscanner/scannermain.py", line 659, in scanner_main
    process_packages(options, packages)
File "giscanner/scannermain.py", line 366, in process_packages
    flags = pkgconfig.cflags(packages)
File "giscanner/pkgconfig.py", line 52, in cflags
    out = check_output(flags, ignore_errors, command)                                                                                                                                                                                                                         

Regards,
Franek Stachura
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
