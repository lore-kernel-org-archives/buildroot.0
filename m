From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Mar 2015 22:35:31 +0100
Subject: [Buildroot] [PATCH v3 0/2] Fix logrotate autobuild failure
In-Reply-To: <1425244013-2509-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Sun, 1 Mar 2015 22:06:51 +0100")
References: <1425244013-2509-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87vbikwgd8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > This patch set fix a logrotate autobuild failure:
 >     http://autobuild.buildroot.net/results/159bf5730414ca7f73dcdae95090177355193636
 >     http://autobuild.buildroot.net/results/ebe6ab7fc0f2cff98de06b3dc374730da9e9e4f2

 > v3:
 >  - popt: instead of using sed add a patch and send it upstream
 >  - logrotate: improve commit message
 > v2:
 >  - logroate: instead of adding a patch just overwrite from the command line the
 >    LOADLIBES variable

Hmm, while this is an improvement I still see failures.

I could only get popt to pull in the gettext/libintl dependency if I
added libiconv, but as we don't add libiconv to Libs.private we then end
up with linker issues for it in logrotate:

/home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc    -Os  -static   logrotate.o log.o config.o basenames.o -L/home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lpopt    -o logrotate
logrotate.o: In function `compressLogFile':
/home/peko/source/buildroot/output/build/logrotate-3.8.7/logrotate.c:537: warning: the use of OBSOLESCENT `utime' is discouraged, use `utimes'
/home/peko/source/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpopt.a(poptint.o): In function `POPT_fprintf':
poptint.c:(.text+0x534): undefined reference to `libiconv_open'
poptint.c:(.text+0x58c): undefined reference to `libiconv'
poptint.c:(.text+0x5b8): undefined reference to `libiconv'
poptint.c:(.text+0x62c): undefined reference to `libiconv_close'
collect2: ld returned 1 exit status
<builtin>: recipe for target 'logrotate' failed

So I have left out this series for 2015.02.

-- 
Bye, Peter Korsgaard
