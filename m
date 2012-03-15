From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 15 Mar 2012 16:59:11 +0100
Subject: [Buildroot] vsftpd
In-Reply-To: <CALo-6+jE0XhxMv2xO-EtOLjnrwR8DC9DPH5U0zeV6qst_F-WaQ@mail.gmail.com>
References: <CALo-6+jE0XhxMv2xO-EtOLjnrwR8DC9DPH5U0zeV6qst_F-WaQ@mail.gmail.com>
Message-ID: <4F6211CF.7030701@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 15.03.2012 16:38, schrieb Charles Krinke:
> its my day to be a "noob" again as I am having trouble getting vsftpd
> accepting connections on an MPC8321 project. I am near the end of my
> project after a year and started with buildroot 2011.03 last spring
> and today is the day to enable vsftpd and ntp-wait.
> 
> I enable the vsftpd package, it builds, and I get a /usr/sbin/vsftpd
> and /etc/init.d/S70vsftpd on the MPC8321 target. When the target
> boots, it does say "Starting vsftpd: OK" on the console.
> 
> The package does not create an /etc/vsftpd.conf, so I created one that
> looks like this:
> 
> # cat /etc/vsftpd.conf
> anonymous_enable=YES
> anon_root=/home/econolite
> local_enable=YES
> #
> 
> Now for the bad news. Connections are refused from an external host,
> making me think vsftpd is not really running. A "ps" does not show
> vftpd in its list. A "netstat" does not show ftp. Invoking vsftpd from
> a bash prompt says:
> 
> # vsftpd
> 500 OOPS: vsftpd: not configured for standalone, must be started from inetd
> #

Do we have inetd/xinetd? Can't find them. http://en.wikipedia.org/wiki/Xinetd seems to be unsupported. What is the modern way of running daemons on demand-?
 
> So, can someone help me navigate through the "Valley of Confusion"
> towards the "Ridge of Enlightment" so I can get to the next problem
> which is "why the frick cannot I get microperl to compile".
> 
> Charles "Noob For The Day" Krinke.

By the way, I have trouble compiling vsftpd at least with the latest linaro toolchain (haven't tried other toolchains so far):

>>> vsftpd 2.3.4 Building
/usr/bin/make -j24 CC="/home/YegorYefremov/MyProjects/versioned/buildroot/output/host/usr/bin/ccache /home/YegorYefremov/MyProjects/versioned/buildroot/output/host/usr/bin/arm-linux-gnueabi-gcc" CFLAGS=" -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="" LIBS="-lcrypt -lssl" -C /home/YegorYefremov/MyProjects/versioned/buildroot/output/build/vsftpd-2.3.4
make[1]: Entering directory `/home/YegorYefremov/MyProjects/versioned/buildroot/output/build/vsftpd-2.3.4'
/home/YegorYefremov/MyProjects/versioned/buildroot/output/host/usr/bin/ccache /home/YegorYefremov/MyProjects/versioned/buildroot/output/host/usr/bin/arm-linux-gnueabi-gcc -o vsftpd main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o tunables.o ftpdataio.o secbuf.o ls.o postprivparent.o logging.o str.o netstr.o sysstr.o strlist.o banner.o filestr.o parseconf.o secutil.o ascii.o oneprocess.o twoprocess.o privops.o standalone.o hash.o tcpwrap.o ipaddrparse.o access.o features.o readwrite.o opts.o ssl.o sslslave.o ptracesandbox.o ftppolicy.o sysutil.o sysdeputil.o -Wl,-s -lcrypt -lssl
/home/YegorYefremov/MyProjects/versioned/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabi/4.6.3/../../../../arm-linux-gnueabi/bin/ld: ssl.o: undefined reference to symbol 'RAND_status'
/home/YegorYefremov/MyProjects/versioned/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabi/4.6.3/../../../../arm-linux-gnueabi/bin/ld: note: 'RAND_status' is defined in DSO /home/YegorYefremov/MyProjects/versioned/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/libcrypto.so.1.0.0 so try adding it to the linker command line
/home/YegorYefremov/MyProjects/versioned/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/libcrypto.so.1.0.0: could not read symbols: Invalid operation
collect2: ld returned 1 exit status
make[1]: *** [vsftpd] Fehler 1

Yegor

 
