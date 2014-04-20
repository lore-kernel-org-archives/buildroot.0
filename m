From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 10:48:12 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-19
In-Reply-To: <20140420063009.8B76B100DB9@stock.ovh.net>
References: <20140420063009.8B76B100DB9@stock.ovh.net>
Message-ID: <20140420104812.5bc926a9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The usual analysis of build failures.

On Sun, 20 Apr 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:

>     x86_64 |   CXX      DerivedSources/W... | TIM | http://autobuild.buildroot.net/results/a3a8607751156fb47dc5c145fcd46825a93078dc/

Once again, timeout while building webkit.

>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/5c181b1fb8f0e9e39f864523e84dd8766f5a67b8/

fork() being used by one part of Cairo. We probably shouldn't mark
Cairo entirely dependent on MMU, but identify the part of Cairo that
uses fork().

make[6]: Entering directory `/home/test/test/1/output/build/cairo-1.12.10/boilerplate'
  CC     cairo-boilerplate-getopt.lo
  CC     any2ppm-any2ppm.o
cairo-boilerplate-getopt.c: In function 'increment_index':
cairo-boilerplate-getopt.c:62: warning: cannot optimize possibly infinite loops
any2ppm.c: In function 'daemonize':
any2ppm.c:722: error: implicit declaration of function 'fork'
make[5]: *** [any2ppm-any2ppm.o] Error 1
make[5]: *** Waiting for unfinished jobs....

>    powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/b093b0edc9b7ac1f113349c09ed3c04967726d31/

/home/test/test/3/output/build/cppcms-1.0.4/booster/lib/locale/src/encoding/codepage.cpp:42:35: error: 'converter_between' was not declared in this scope
/home/test/test/3/output/build/cppcms-1.0.4/booster/lib/locale/src/encoding/codepage.cpp:42:52: error: template argument 1 is invalid
/home/test/test/3/output/build/cppcms-1.0.4/booster/lib/locale/src/encoding/codepage.cpp:42:57: error: invalid type in declaration before ';' token

These functions can be provided by three implementations inside cppcms:

 * One that needs iconv
 * One that needs icu
 * One which is called wconv, which I assume is related to wide-char
   but I'm not sure at all, and I haven't found any confirmation of
   this.

Nicolas, you are the person who added cppcms in Buildroot. Could you
have a look at this problem?

>        arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/0aab79be8043bf88a227af2ca27b4447aa2f8901/

Samuel?

  CXX      libgstopencv_la-motioncells_wrapper.lo
gstdisparity.cpp:124:39: fatal error: opencv2/contrib/contrib.hpp: No such file or directory
 #include <opencv2/contrib/contrib.hpp>

>       i686 |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/114df8d99e802b69a39804e0608b022419d912b4/
>        arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/505091df8b1b48c77ee2d6c67ef337df16ca67b7/

Still the same problem. Need to reproduce.

>        arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/29cf31a7d20a85e3b33a6d30ac59b49688c54c3d/

Python problem:

  File "/scratch/peko/build/jack2-37976441044d69b91d61d8f6278949a39cf1b7b7/example-clients/wscript", line 126
    if bld.env['IS_WINDOWS']:

>     x86_64 |                    libgc-7.4.0 | NOK | http://autobuild.buildroot.net/results/1ec3535a3b476122292dc9582416eb54d7d784c8/

mach_dep.c:205:23: fatal error: fenv.h: No such file or directory

We don't build uClibc with fenv support. We could fix this problem by
passing NO_GETCONTEXT when building libgc on uClibc.

>        arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/a545e499241b9b67848eb9abc989180a32317f0f/

cc1: all warnings being treated as errors

>       bfin | libstrophe-d408eaf2bbfe5ff5... | NOK | http://autobuild.buildroot.net/results/f48a0f34094505402ee0618189de178ace062ce2/

checking for libxml/parser.h... no
configure: error: couldn't find libxml2
make: *** [/home/test/test/3/output/build/libstrophe-d408eaf2bbfe5ff5c56eab01463c278f9891c08e/.stamp_configured] Error 1

>        arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/082078c70b6923b8d98d27e2475d001e1e5a2487/

  CC       consumer-stream.lo
consumer-timer.c: In function 'consumer_timer_thread':
consumer-timer.c:518:1: internal compiler error: in gen_movsi, at config/arm/arm.md:5452
Please submit a full bug report,
with preprocessed source if appropriate.

Nobody ever answered me on how to handle gcc bugs affecting custom
external toolchains...

>        arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/a8a20b53f748ecfe38f3a3d6f4c6c7199edf287f/

Lots of errors... there isn't enough backlog to see the beginning of
them. Need to reproduce.

>     mipsel |                   nftables-0.2 | NOK | http://autobuild.buildroot.net/results/1525d7a3e1d1fcf35858962251c0b69a5e1b64db/

There is a fix proposed by Baruch.

>        arm |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/a5360b73266af53ce92e48b0285987e674baa9ab/

Gaah, another compiler failure.

/home/test/test/1/output/build/opencv-2.4.2/modules/imgproc/src/smooth.cpp:525:1: internal compiler error: in vect_transform_stmt, at tree-vect-stmts.c:5468
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
make[3]: *** [modules/imgproc/CMakeFiles/opencv_imgproc.dir/src/smooth.cpp.o] Error 1

>        arm |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/5a7fd0de2747e876a182117d7f7d8f16b20cadea/

checking for init_snmp in -lnetsnmp... no
configure: error: SNMP sanity check failed. Please check config.log for more information.
make: *** [/home/test/test/3/output/build/php-5.5.11/.stamp_configured] Error 1

Gustavo, Luca?

>      avr32 |                  python3-3.4.0 | NOK | http://autobuild.buildroot.net/results/7a65e381cc04bf8f74fd63a6dcda502f3c26aeef/

Still on my plate to fix.

>      nios2 |                 rtorrent-0.9.3 | NOK | http://autobuild.buildroot.net/results/f7d61452aec2edaf7207a01d0fd7c9c4fbe031e0/

The infamous fallocate64 problem. Ezequiel?

>       bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/4d8222f02b5f88622bef9ad57ebd6e419c9d2cba/

fork() used in zeromq test cases:

  CXX    test_fork.o
test_fork.cpp: In function 'int main()':
test_fork.cpp:38: error: 'fork' was not declared in this scope

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
