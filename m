From: Michael Nosthoff <buildroot@heine.tech>
Date: Tue, 13 Oct 2020 17:16:48 +0200
Subject: [Buildroot] [PATCH] systemd: add option to enable
 systemd-journal-remote
In-Reply-To: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
References: <CAJPHfYNGkrW8MWGQyaWgehg_wAQ=3eoNWVZHEh=DyhbebJhJTA@mail.gmail.com>
Message-ID: <905ca80c-acb2-3118-f829-baeb175e4a6a@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

sorry, I didn't have the original mail thread so I'm responding to the
initial patch from patchwork.

Since this issue is still unresolved I did have a second look and found
that the decision tree that systemd does for this options is even
trickier than everyone assumed.


As Jeremy already explained there are three binaries that depend on this
-Dremote switch.

What has been slighty incorrect is that not only
systemd-journal-gatewayd but also systemd-journal-remoted depend on
libmicrohttpd see [0].
For as systemd-journal-upload depends on libcurl [1].


Now for the really strange part:

systemd-journald-gateway and systemd-journald-remote are always built
together. There is no switch.
But there is some more logic to the -remote flag besides true and false.
If you don't specify its value is 'auto'.
And this is where [2] comes into play. It depends on the availability of
libcurl and/or libmicrohttp which of the 3 binaries is built.

-remote=auto && libcurl=y && libmicrohttpd=n? builds systemd-journal-upload
-remote=auto && libcurl=n && libmicrohttpd=y? builds
systemd-journal-gatewayd and systemd-journal-remoted

But if you specify -remote=true you are REQUIRED to have libcurl AND
libmicrohttp and all three binaries are build.

So this is pretty messy and I can think two ways of getting this at
least a bit more consistent.


The all or nothing solution could be something like this:

|config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE bool "journal events remote
tools" select BR2_PACKAGE_LIBMICROHTTPD |||select BR2_PACKAGE_LIBCURL| help installs systemd-journal-gatewayd, |||systemd-journal-remote| and |||systemd-journal-upload|
http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
|||https://www.freedesktop.org/software/systemd/man/systemd-journal-remote.service.html
https://www.freedesktop.org/software/systemd/man/systemd-journal-upload.html||

which would set -Dremote=true -Dmicrohttpd=true -Dlibcurl=true

The other solution would be omitting the -remote= flag all together (defaulting it to auto) and steering the tool compilation via depending on -Dlibcurl=true and/or -Dlibmicrohttpd=true.
This would give the possibility to build systemd-journal-gatewayd and systemd-journal-remote without systemd-journal-upload and vice versa.
This would actually be the way it was before applying this patch but the descriptions were at least a bit misleading.

Also I'm not sure if the libcurl dependency might be needed for something else in systemd (at least importd also needs it).


I'm tending to the first (simpler) solution. Which is actually how it is
currently as you need to enable both Options now to get all three tools.
Else you get none.

I hope that wasn't to confusing. What do you think?

Regards,
Michael


[0] https://github.com/systemd/systemd/blob/master/meson.build#L2653
[1] https://github.com/systemd/systemd/blob/master/meson.build#L2635
[2] https://github.com/systemd/systemd/blob/master/meson.build#L1422
