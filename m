From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 22 Apr 2014 21:11:10 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: add host-zic dependency
Message-ID: <trinity-fa5edbb4-471e-41d2-b8c5-a159394b637b-1398193870025@3capp-gmx-bs52>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Yann,

On Tue, Apr 22, 2014 at 08:21:39PM +0200, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Tue, 22 Apr 2014 18:41:08 +0200, Yann E. MORIN wrote:
> 
> > host-zin only builds the 'zic' program, which pacakge can access using
> > $(ZIC), so host-zip (our package) does not need the tz-data itslef.
> 
> Right.
> 
> > 
> > But postgresql needs the time zone info. It can use either the system
> > ones, or it has a limited set bundled in its source tree, in:
> >     postgresql-9.3.3/src/timezone/data/
> 
> What I'm worried about here is *precisely* that even though we build
> our own host-zic, it might end up time zone infos from the host system.
> And nowhere we check that these are available/sane/etc.
> 
> So I think we should either (1) ensure that PostgreSQL only uses its
> one limited set of time zone data when --with-system-data is *not*
> passed, or (2) always build with tzdata.


seiderer at localhost:~/Work/build_002> rm -r build/postgresql-9.3.4
seiderer at localhost:~/Work/build_002> make 2>&1 | grep zic 
checking for zic... /home/seiderer/Work/build_rpi_002/host/usr/sbin/zic
/home/seiderer/Work/build_002/host/usr/bin/arm-buildroot-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_totypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-preciRGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE   -c -o zic.o zic.c
/home/seiderer/Work/build_002/host/usr/bin/arm-buildroot-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_totypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-preciocaltime.o -L../../src/port -L../../src/common  -Wl,-rpath,'/usr/lib',--enable-new-dtags  -lpgport -lpgcommon -lz -lreadline -lcrypt -ldl -lm  -o zic
/home/seiderer/Work/build_002/host/usr/sbin/zic -d '/home/seiderer/Work/build_002/target/usr/share/postgresql/timezone' -p 'US/Eastern' ./data/africa ./data/antarctica ./data/asia ./data/australasia ./data/europe ./data/northamerica ./data/southamerica ./data/pacificnew ./data/etcetera ./data/factory ./data/backward ./data/systemv

seiderer at localhost:~/Work/build_002> ls target/usr/share/postgresql/timezone*
target/usr/share/postgresql/timezone:
Africa      Asia       Canada   Cuba   EST      Factory  GMT0       Hongkong  Iran     Kwajalein  MST      NZ-CHAT   posixrules  ROK        Universal  W-SU
America     Atlantic   CET      EET    EST5EDT  GB       GMT-0      HST       Israel   Libya      MST7MDT  Pacific   PRC         Singapore  US         Zulu
Antarctica  Australia  Chile    Egypt  Etc      GB-Eire  GMT+0      Iceland   Jamaica  MET        Navajo   Poland    PST8PDT     Turkey     UTC
Arctic      Brazil     CST6CDT  Eire   Europe   GMT      Greenwich  Indian    Japan    Mexico     NZ       Portugal  ROC         UCT        WET

target/usr/share/postgresql/timezonesets:
Africa.txt  America.txt  Antarctica.txt  Asia.txt  Atlantic.txt  Australia  Australia.txt  Default  Etc.txt  Europe.txt  India  Indian.txt  Pacific.txt

I think postgresql takes the given buildroot-host-zic with the data taken from  build/postgresql-9.3.4/src/timezone/data
and uses the timezone data installed into target/usr/share/postgresql/timezone...

Regards,
Peter

> 
> > That's what the error message hints at:
> > 
> >     When cross-compiling, either use the option --with-system-tzdata to use
> >     existing time-zone data, or set the environment variable ZIC to a zic
> >     program to use during the build.
> 
> Yes, I've read this error message. But I'm worried that just pointing
> ZIC to a zic program is papering over the fact that we in this case
> rely on the time zone info from the host system.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
