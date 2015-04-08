From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 16:43:16 +0200
Subject: [Buildroot] autobuild-run bug, one instance died
Message-ID: <20150408164316.0641eb3c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I got the following backtrace on my autobuild-run instance:

thomas at build:~$ Process Process-2:
Traceback (most recent call last):
  File "/usr/lib/python2.6/multiprocessing/process.py", line 232, in _bootstrap
    self.run()
  File "/usr/lib/python2.6/multiprocessing/process.py", line 88, in run
    self._target(*self._args, **self._kwargs)
  File "../buildroot-test/scripts/autobuild-run", line 735, in run_instance
    ret = gen_config(**kwargs)
  File "../buildroot-test/scripts/autobuild-run", line 473, in gen_config
    configs = get_toolchain_configs()
  File "../buildroot-test/scripts/autobuild-run", line 262, in get_toolchain_configs
    with urlopen_closing(config["url"]) as r:
  File "../buildroot-test/scripts/autobuild-run", line 134, in <lambda>
    urlopen_closing = lambda uri: contextlib.closing(urlopen(uri))
  File "/usr/lib/python2.6/urllib2.py", line 126, in urlopen
    return _opener.open(url, data, timeout)
  File "/usr/lib/python2.6/urllib2.py", line 391, in open
    response = self._open(req, data)
  File "/usr/lib/python2.6/urllib2.py", line 409, in _open
    '_open', req)
  File "/usr/lib/python2.6/urllib2.py", line 369, in _call_chain
    result = func(*args)
  File "/usr/lib/python2.6/urllib2.py", line 1170, in http_open
    return self.do_open(httplib.HTTPConnection, req)
  File "/usr/lib/python2.6/urllib2.py", line 1145, in do_open
    raise URLError(err)
URLError: <urlopen error [Errno -2] Name or service not known>

My configuration runs with 4 instances, and one of the Python
subprocess is apparently defunct. The process hierarchy looks like this:

44268 pts/6    S      0:00 python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
44269 pts/6    S      0:03  \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
18261 pts/6    S      0:00  |   \_ timeout 14400 make O=/home/test/autobuild/instance-0/output -C instance-0/buildroot BR2_DL_DIR=/home/test/autobuild/instance-0/dl BR2_JLEVEL=4
18262 pts/6    S      0:03  |       \_ make O=/home/test/autobuild/instance-0/output -C instance-0/buildroot BR2_DL_DIR=/home/test/autobuild/instance-0/dl BR2_JLEVEL=4
 6226 pts/6    S      0:00  |           \_ /bin/bash -c xzcat /home/test/autobuild/instance-0/dl/linux-3.19.3.tar.xz | tar --strip-components=1 -C /home/test/autobuild/instance-0/output/build/linux-headers-3.19.3
 6230 pts/6    R      0:03  |               \_ xzcat /home/test/autobuild/instance-0/dl/linux-3.19.3.tar.xz
 6231 pts/6    S      0:00  |               \_ tar --strip-components=1 -C /home/test/autobuild/instance-0/output/build/linux-headers-3.19.3 -xf -
44270 pts/6    Z      0:01  \_ [python] <defunct>
44271 pts/6    S      0:03  \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
63744 pts/6    S      0:00  |   \_ timeout 14400 make O=/home/test/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/home/test/autobuild/instance-2/dl BR2_JLEVEL=4
63745 pts/6    S      0:05  |       \_ make O=/home/test/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/home/test/autobuild/instance-2/dl BR2_JLEVEL=4
55736 pts/6    S      0:00  |           \_ /usr/bin/make -j4 -C /home/test/autobuild/instance-2/output/build/ffmpeg-2.6.1/
 7790 pts/6    S      0:00  |               \_ /bin/sh -c printf "CC\t%s\n" libavformat/utils.o; /home/test/autobuild/instance-2/output/host/usr/bin/bfin-linux-uclibc-gcc -I. -I./ -D_LARGEFILE_SOURCE -D_LARGEFILE6
 7791 pts/6    S      0:00  |               |   \_ /home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc --sysroot /home/test/autobuild/instance-2/output/host/us
 7792 pts/6    R      0:01  |               |       \_ /home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/../libexec/gcc/bfin-linux-uclibc/4.3.5/cc1 -quiet -I. -I./ -I/home/test/au
 8322 pts/6    S      0:00  |               \_ /bin/sh -c printf "CC\t%s\n" libavcodec/4xm.o; /home/test/autobuild/instance-2/output/host/usr/bin/bfin-linux-uclibc-gcc -I. -I./ -D_LARGEFILE_SOURCE -D_LARGEFILE64_S
 8323 pts/6    S      0:00  |               |   \_ /home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc --sysroot /home/test/autobuild/instance-2/output/host/us
 8326 pts/6    R      0:00  |               |       \_ /home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/../libexec/gcc/bfin-linux-uclibc/4.3.5/cc1 -quiet -I. -I./ -I/home/test/au
 8381 pts/6    S      0:00  |               \_ /bin/sh -c printf "CC\t%s\n" libavcodec/a64multienc.o; /home/test/autobuild/instance-2/output/host/usr/bin/bfin-linux-uclibc-gcc -I. -I./ -D_LARGEFILE_SOURCE -D_LARGE
 8382 pts/6    S      0:00  |               |   \_ /home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc --sysroot /home/test/autobuild/instance-2/output/host/us
 8383 pts/6    R      0:00  |               |       \_ /home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/../libexec/gcc/bfin-linux-uclibc/4.3.5/cc1 -quiet -I. -I./ -I/home/test/au
 8404 pts/6    S      0:00  |               \_ /bin/sh -c printf "CC\t%s\n" libavcodec/aac_adtstoasc_bsf.o; /home/test/autobuild/instance-2/output/host/usr/bin/bfin-linux-uclibc-gcc -I. -I./ -D_LARGEFILE_SOURCE -D
 8405 pts/6    S      0:00  |                   \_ /home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc --sysroot /home/test/autobuild/instance-2/output/host/us
 8407 pts/6    R      0:00  |                       \_ /home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bfin-linux-uclibc/bin/../libexec/gcc/bfin-linux-uclibc/4.3.5/cc1 -quiet -I. -I./ -I/home/test/au
44272 pts/6    S      0:03  \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
55585 pts/6    S      0:00      \_ timeout 14400 make O=/home/test/autobuild/instance-3/output -C instance-3/buildroot BR2_DL_DIR=/home/test/autobuild/instance-3/dl BR2_JLEVEL=4
55587 pts/6    S      0:07          \_ make O=/home/test/autobuild/instance-3/output -C instance-3/buildroot BR2_DL_DIR=/home/test/autobuild/instance-3/dl BR2_JLEVEL=4
 7883 pts/6    S      0:00              \_ /bin/bash -c (cd /home/test/autobuild/instance-3/output/build/gmp-6.0.0a/ && rm -rf config.cache && PATH="/home/test/autobuild/instance-3/output/host/bin:/home/test/autob
 7884 pts/6    S      0:00                  \_ /bin/bash -c (cd /home/test/autobuild/instance-3/output/build/gmp-6.0.0a/ && rm -rf config.cache && PATH="/home/test/autobuild/instance-3/output/host/bin:/home/test/a
 7886 pts/6    S      0:00                      \_ /bin/bash ./configure --target=arm-buildroot-linux-gnueabi --host=arm-buildroot-linux-gnueabi --build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/usr --
 8422 pts/6    S      0:00                          \_ /bin/bash ./configure --target=arm-buildroot-linux-gnueabi --host=arm-buildroot-linux-gnueabi --build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/us
 8423 pts/6    S      0:00                              \_ /home/test/autobuild/instance-3/output/host/opt/ext-toolchain/bin/arm-none-linux-gnueabi-gcc --sysroot /home/test/autobuild/instance-3/output/host/usr/arm
 8424 pts/6    R      0:00                                  \_ /home/test/autobuild/instance-3/output/host/opt/ext-toolchain/bin/../libexec/gcc/arm-none-linux-gnueabi/4.8.3/cc1 -quiet -imultilib thumb2 -iprefix /h

So, three instances are still running fine, but one has died, probably
due to the backtrace above.

Ideas?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
