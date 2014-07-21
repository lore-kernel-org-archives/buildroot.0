From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 12:15:53 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-07-20
In-Reply-To: <20140721063011.48A3410123E@stock.ovh.net>
References: <20140721063011.48A3410123E@stock.ovh.net>
Message-ID: <20140721121553.10be890c@free-electrons.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hello all,

After a few crazy days, we seem to be back on track in terms of
autobuilder results. Please help to fix the outstanding issues. See the
analysis below.

On Mon, 21 Jul 2014 08:30:11 +0200 (CEST), Thomas Petazzoni wrote:

>       bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/8c891d0b8ad6413a44ecd33e952063308ff08a42/

warning: cannot find entry symbol __start; defaulting to 00000000

I guess it's a problem related to shared libraries, on a platform that
doesn't support them. Gustavo?

>       i686 |                   opencv-2.4.8 | NOK | http://autobuild.buildroot.net/results/5a66e4d3bfba638584d4c7aa31d4aaf80e1e84e7/

Hopefully fixed by http://git.buildroot.net/buildroot/commit/?id=68e1083b9d5730801ff4c5b754370fc0c696f6fd.

>        arm |                openswan-2.6.41 | NOK | http://autobuild.buildroot.net/results/e5970eae28d01503d89a5d4e593711d7a27da8b5/

/scratch/peko/build/openswan-2.6.41/lib/libipsecconf/keywords.c:501:40: error: unknown type name ???YYSTYPE???
 int parser_find_keyword(const char *s, YYSTYPE *lval)

Gustavo, maybe?

>        arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/a5fa377288df604aaa49df0878d7dc4293648255/

/usr/lib/libXpm.so: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status

>    powerpc |              perl-gdgraph-1.48 | NOK | http://autobuild.buildroot.net/results/7c030b1ee9fa2e978769f9ca9c3d909ca3984491/

Fixed by http://git.buildroot.net/buildroot/commit/?id=e266eb5666ae3090096b33a02365dccf7f631163.

>       bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/b840b35911abd9907566a02d19c1835f36ca8d19/

Missing glob_pattern_p function in Blackfin uClibc. Not sure how to fix.

>     x86_64 |             python-numpy-1.8.0 | NOK | http://autobuild.buildroot.net/results/01da44bc4b644a46326d8fbd87708b7a98971487/

Needs fenv, but fenv is not part of the features enabled in our uClibc
configuration file, and anyway not available for all architectures in
uClibc. I think I'll just disallow python-numpy on uClibc.

>       i686 |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/b64d5c941a7cac00619da3a0696939f86a8eafc2/

Another fenv issue. I have patches to fix that by making the _decimal
module optional, and actually using an external mpdecimal library isn't
of the one built into Python sources.

>        arm |            qt5multimedia-5.3.1 | NOK | http://autobuild.buildroot.net/results/b975c4bb8aebad2d0b8eaefc98c42c0460ace5be/
>   mips64el |            qt5multimedia-5.3.1 | NOK | http://autobuild.buildroot.net/results/b1ca9c845f1cf3a396cbd7ad81bfc4411974c709/

[7m>>> qt5multimedia 5.3.1 Installing to target[27m
cp -dpfr /home/test/autobuild/instance-3/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/qml/* /home/test/autobuild/instance-3/output/target/usr/qml
cp: cannot stat `/home/test/autobuild/instance-3/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/qml/*': No such file or directory

Fatih?

It might be related to the fact that I haven't applied your entire
patch series.. but it would mean that your series was not
bisectable! :-)

>        arm |                      tmux-1.9a | NOK | http://autobuild.buildroot.net/results/6fafda04fc8f93c7449cba933cf7092b0f7f8b30/

cmd-pipe-pane.c:121:43: error: dereferencing pointer to incomplete type
   wp->pipe_off = EVBUFFER_LENGTH(wp->event->input);

Huh?

>        sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/48763fd7394af097ff8f63f13a5ed18b5e908fbd/

Webkit does not build fine on SuperH...

>        arm |                 xapp_xfs-1.1.3 | NOK | http://autobuild.buildroot.net/results/e414862269ce1799b9281b67b56835d04ce44a42/
>    powerpc |                 xapp_xfs-1.1.3 | NOK | http://autobuild.buildroot.net/results/f89dfad9481f3192ddaa7a04836238341483273b/

Fixed by http://git.buildroot.net/buildroot/commit/?id=ca7e3aebf4f4daf796f9c309f2e55d075517df60.

>     mipsel |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/a81ac4c2a829f965056c618751c95e34ca68418f/

The libstdc++ static linking problem.

>       bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/0a1e73633b1bbce646e30602f14fe3aba48f4699/

Crazy C++ problem. Anyone knowledgeable in C++ to help?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
