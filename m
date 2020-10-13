From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 17:35:24 +0200
Subject: [Buildroot] [PATCH] systemd: add option to enable
 systemd-journal-remote
In-Reply-To: <905ca80c-acb2-3118-f829-baeb175e4a6a@heine.tech>
References: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
 <905ca80c-acb2-3118-f829-baeb175e4a6a@heine.tech>
Message-ID: <20201013173524.56b78792@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Oct 2020 17:16:48 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> systemd-journald-gateway and systemd-journald-remote are always built
> together. There is no switch.
> But there is some more logic to the -remote flag besides true and false.
> If you don't specify its value is 'auto'.
> And this is where [2] comes into play. It depends on the availability of
> libcurl and/or libmicrohttp which of the 3 binaries is built.
> 
> -remote=auto && libcurl=y && libmicrohttpd=n? builds systemd-journal-upload
> -remote=auto && libcurl=n && libmicrohttpd=y? builds
> systemd-journal-gatewayd and systemd-journal-remoted
> 
> But if you specify -remote=true you are REQUIRED to have libcurl AND
> libmicrohttp and all three binaries are build.
> 
> So this is pretty messy and I can think two ways of getting this at
> least a bit more consistent.
> 
> 
> The all or nothing solution could be something like this:
> 
> |config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE bool "journal events remote
> tools" select BR2_PACKAGE_LIBMICROHTTPD |||select BR2_PACKAGE_LIBCURL| help installs systemd-journal-gatewayd, |||systemd-journal-remote| and |||systemd-journal-upload|
> http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
> |||https://www.freedesktop.org/software/systemd/man/systemd-journal-remote.service.html
> https://www.freedesktop.org/software/systemd/man/systemd-journal-upload.html||
> 
> which would set -Dremote=true -Dmicrohttpd=true -Dlibcurl=true
> 
> The other solution would be omitting the -remote= flag all together (defaulting it to auto) and steering the tool compilation via depending on -Dlibcurl=true and/or -Dlibmicrohttpd=true.
> This would give the possibility to build systemd-journal-gatewayd and systemd-journal-remote without systemd-journal-upload and vice versa.
> This would actually be the way it was before applying this patch but the descriptions were at least a bit misleading.
> 
> Also I'm not sure if the libcurl dependency might be needed for something else in systemd (at least importd also needs it).
> 
> 
> I'm tending to the first (simpler) solution. Which is actually how it is
> currently as you need to enable both Options now to get all three tools.
> Else you get none.
> 
> I hope that wasn't to confusing. What do you think?

I agree the first option you're proposing looks simpler. How big are
each of those tools? Unless one is really really big and unnecessary in
some scenarios, I think your proposed option is straightforward and
would solve the problem.

Thanks for the investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
