From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 13 Jun 2017 03:11:49 +0200
Subject: [Buildroot] configurable IDN flags usage in getnameinfo()
Message-ID: <20170613011149.GY26922@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I would like to resolve one last issue I am facing, when compiling
systemd with uClibc-ng, in an upstreamable way.

I opened following pull request which was closed by Lennard:
https://github.com/systemd/systemd/pull/6114
That was fine, as combining it with LIBIDN was'nt correct.

I hope we may find a solution to my problem, which would allow new
users of buildroot to simple use systemd even in the default config
for most architectures. Buildroot is an embedded Linux rootfs
generation tool. The default C library selection for most
architectures is uClibc-ng.

Lennard suggested to add the missing definitions to uClibc-ng.
Systemd uses NI_IDN and NI_IDN_USE_STD3_ASCII_RULES in 
src/basic/socket-util.c.

But we explicitely removed the AI_*/NI_* IDN related 
definitions in commits 5e9a78c8a839381add6faa61e196e6dad9143163
and 8a992d6715c8149f7efc0553eeaf31f3e27de60c, because uClibc-ng
does not implement any IDN related functionality in
getnameinfo()/getaddrinfo().

Other software packages as for example vlc, defining a dummy
value if the symbol (in this case AI_IDN) isn't defined:
https://github.com/videolan/vlc/blob/master/include/vlc_network.h#L194

Would this be an option in systemd source code to check
for NI_IDN/NI_IDN_USE_STD3_ASCII_RULES and if not set define it to
0?

These IDN related flags are glibc specific extensions to the
getnameinfo function according to:
http://man7.org/linux/man-pages/man3/getnameinfo.3.html
So not specified in POSIX.

Another option might be to add a new configure option to
control the IDN usage in systemd. You already have a lot of
fine granular options to configure systemd, another would'nt harm.

I am not asking to add any C library specific workaround, but for
a little portability/configurability with nearly no costs.

Sure I could add libidn to uClibc-ng like GNU C library to add
the missing IDN functionality, but this would add nearly 1 megabyte
of code, which isn't a nice option for embedded Linux people.
du -chs libidn/
956K    libidn/
956K    total

Even glibc maintainers discussed about the removal of their old copy of libidn:
https://sourceware.org/ml/libc-alpha/2016-11/msg00269.html

All other problems are resolved inside uClibc-ng, so that users of 
the latest uClibc-ng release 1.0.25 can successfully compile and 
use systemd.

Do you have any other idea how we could solve this issue and
let buildroot users benefit from systemd?

Thanks for any help,

best regards
 Waldemar
