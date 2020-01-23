From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 23 Jan 2020 22:08:43 +0100
Subject: [Buildroot] BR2_EXTERNAL and linux-ext-*.mk
Message-ID: <CAEyMn7a2qBj2efokN1Au3qek8yNsg_hdjBzntkiC8nCFZ5M=rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I recently recognized that there is the support to have linux patches
located in the BR2_EXTERNAL/linux directory with
c26eafa96cabd597a5cce534133ee0ff996b800c.

While using this feature I noticed that in there seems to go something
wrong. Once a file that matchs linux/linux-ext-*.mk is detected the
LINUX_PKGDIR is set to the BR2_EXTERNAL/linux path and for example the
"0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional" patch
fails because the path is no longer valid. Also the hash check for the
linux sources fails due to the same reason.

Following 2 "make-linux-patch" tries, the first ends without error and
the second show the error:



---------- without BR2_EXTERNAL/linux/linux-ext-xxx.mk:

# make linux-patch
>>> linux 5.4.13 Downloading
--2020-01-23 21:57:11--
https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.4.13.tar.xz
Aufl?sen des Hostnamens cdn.kernel.org (cdn.kernel.org)?
151.101.1.176, 151.101.65.176, 151.101.129.176, ...
Verbindungsaufbau zu cdn.kernel.org
(cdn.kernel.org)|151.101.1.176|:443 ? verbunden.
HTTP-Anforderung gesendet, auf Antwort wird gewartet ? 200 OK
L?nge: 109463864 (104M) [application/x-xz]
Wird in ?/home/hthiery/sources/test-linux/build/build/.linux-5.4.13.tar.xz.3jGhoi/output?
gespeichert.

/home/hthiery/sources/test-linux/build/build
100%[===========================================================================================>]
104,39M  5,52MB/s    in 12s

2020-01-23 21:57:23 (8,59 MB/s) -
?/home/hthiery/sources/test-linux/build/build/.linux-5.4.13.tar.xz.3jGhoi/output?
gespeichert [109463864/109463864]

linux-5.4.13.tar.xz: OK (sha256:
49fb29d96d7e7c1d7e6082701bd26bfddd0fbc87a796fb6ba6258bc5fd386ad7)
>>> linux 5.4.13 Extracting
xzcat /home/hthiery/sources/test-linux/buildroot/dl/linux/linux-5.4.13.tar.xz
| /home/hthiery/sources/test-linux/build/host/bin/tar
--strip-components=1 -C
/home/hthiery/sources/test-linux/build/build/linux-5.4.13   -xf -
>>> linux 5.4.13 Patching
if [ -f /home/hthiery/sources/test-linux/build/build/linux-5.4.13/tools/perf/Documentation/Makefile
]; then printf "%%:\n\t@:\n"
>/home/hthiery/sources/test-linux/build/build/linux-5.4.13/tools/perf/Documentation/GNUmakefile;
fi
for p in  ; do if test -d $p ; then
PATH=/home/hthiery/sources/test-linux/build/host/bin:$PATH
support/scripts/apply-patches.sh
/home/hthiery/sources/test-linux/build/build/linux-5.4.13 $p \*.patch
|| exit 1 ; else
PATH=/home/hthiery/sources/test-linux/build/host/bin:$PATH
support/scripts/apply-patches.sh
/home/hthiery/sources/test-linux/build/build/linux-5.4.13 `dirname $p`
`basename $p` || exit 1; fi done

# make printvars VARS=LINUX_PKGDIR
LINUX_PKGDIR=linux/
--------------------


----------  with BR2_EXTERNAL/linux/linux-ext-xxx.mk:

# make linux-patch
>>> linux 5.4.13 Downloading
--2020-01-23 21:59:54--
https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.4.13.tar.xz
Aufl?sen des Hostnamens cdn.kernel.org (cdn.kernel.org)?
151.101.1.176, 151.101.65.176, 151.101.129.176, ...
Verbindungsaufbau zu cdn.kernel.org
(cdn.kernel.org)|151.101.1.176|:443 ? verbunden.
HTTP-Anforderung gesendet, auf Antwort wird gewartet ? 200 OK
L?nge: 109463864 (104M) [application/x-xz]
Wird in ?/home/hthiery/sources/test-linux/build/build/.linux-5.4.13.tar.xz.QfCmJd/output?
gespeichert.

/home/hthiery/sources/test-linux/build/build
100%[===========================================================================================>]
104,39M  13,0MB/s    in 6,1s

2020-01-23 22:00:00 (17,0 MB/s) -
?/home/hthiery/sources/test-linux/build/build/.linux-5.4.13.tar.xz.QfCmJd/output?
gespeichert [109463864/109463864]

WARNING: no hash file for linux-5.4.13.tar.xz
>>> linux 5.4.13 Extracting
xzcat /home/hthiery/sources/test-linux/buildroot/dl/linux/linux-5.4.13.tar.xz
| /home/hthiery/sources/test-linux/build/host/bin/tar
--strip-components=1 -C
/home/hthiery/sources/test-linux/build/build/linux-5.4.13   -xf -
>>> linux 5.4.13 Patching
if [ -f /home/hthiery/sources/test-linux/build/build/linux-5.4.13/tools/perf/Documentation/Makefile
]; then printf "%%:\n\t@:\n"
>/home/hthiery/sources/test-linux/build/build/linux-5.4.13/tools/perf/Documentation/GNUmakefile;
fi
for p in  ; do if test -d $p ; then
PATH=/home/hthiery/sources/test-linux/build/host/bin:$PATH
support/scripts/apply-patches.sh
/home/hthiery/sources/test-linux/build/build/linux-5.4.13 $p \*.patch
|| exit 1 ; else
PATH=/home/hthiery/sources/test-linux/build/host/bin:$PATH
support/scripts/apply-patches.sh
/home/hthiery/sources/test-linux/build/build/linux-5.4.13 `dirname $p`
`basename $p` || exit 1; fi done
/bin/bash: /home/hthiery/sources/test-linux/buildroot-external-linux-test/linux//0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional:
Datei oder Verzeichnis nicht gefunden

# make printvars VARS=LINUX_PKGDIR
LINUX_PKGDIR=/home/hthiery/sources/test-linux/buildroot-external-linux-test/linux/
----------

Do I miss something here or is this a bug?

--
Heiko
