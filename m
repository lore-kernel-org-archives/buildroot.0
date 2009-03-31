From: Jeff Steele <jsteele@coloradocollege.edu>
Date: Tue, 31 Mar 2009 10:12:04 -0600
Subject: [Buildroot] armeb EABI  error : _aeabi_ddiv (building util-linux)
Message-ID: <1238515924.5157.63.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm running into errors trying to build util-linux for armeb with EABI.
It looks to me more like a toolchain issue than something wrong in
util-linux itself.


I'm using :

buildroot : svn checked out yesterday.
gcc : 4.3.3
uclibc : 0.9.30
BR2_SOFT_FLOAT=y


For some reason, it can't seem to link with the symbol __aeabi_ddiv
which is buried somewhere inside gcc.



Here's the output :

<snip>
make[3]: Entering directory
`/mnt/big/arcom_devel/buildroot/build_armeb/util-linux-2.13-pre7/misc-utils'
if /mnt/big/arcom_devel/buildroot/build_armeb/staging_dir/usr/bin/armeb-linux-uclibcgnueabi-gcc -DLOCALEDIR=\"\" -DHAVE_CONFIG_H   -include ../config.h -I../include -fsigned-char -fomit-frame-pointer   -g -O2 -MT cal.o -MD -MP -MF ".deps/cal.Tpo" -c -o cal.o cal.c; \
	then mv -f ".deps/cal.Tpo" ".deps/cal.Po"; else rm -f ".deps/cal.Tpo";
exit 1; fi

<snip: removed many similar gcc -c steps ...>


sed -e 's,[@]PERL[@],/usr/bin/perl,g' < chkdupexe.pl > chkdupexe
sed -e 's,[@]PERL[@],/usr/bin/perl,g' < scriptreplay.pl > scriptreplay
/mnt/big/arcom_devel/buildroot/build_armeb/staging_dir/usr/bin/armeb-linux-uclibcgnueabi-gcc  -g -O2   -o cal  cal.o -lncurses 
/mnt/big/arcom_devel/buildroot/build_armeb/staging_dir/usr/bin/../lib/gcc/armeb-linux-uclibcgnueabi/4.3.3/../../../../armeb-linux-uclibcgnueabi/bin/ld: cal: hidden symbol `__aeabi_ddiv' in /mnt/big/arcom_devel/buildroot/build_armeb/staging_dir/usr/bin/../lib/gcc/armeb-linux-uclibcgnueabi/4.3.3/libgcc.a(_muldivdf3.o) is referenced by DSO
/mnt/big/arcom_devel/buildroot/build_armeb/staging_dir/usr/bin/../lib/gcc/armeb-linux-uclibcgnueabi/4.3.3/../../../../armeb-linux-uclibcgnueabi/bin/ld: final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status
make[3]: *** [cal] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory
`/mnt/big/arcom_devel/buildroot/build_armeb/util-linux-2.13-pre7/misc-utils'
