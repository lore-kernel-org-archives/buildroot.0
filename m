From: Ossy <ossy1980@gmx.net>
Date: Sat, 31 Jul 2010 15:03:55 +0200
Subject: [Buildroot] xfsprogs 3.0.3 without libxfs in rootfs
In-Reply-To: <4C532C78.90703@gmx.net>
References: <4C4613A2.90006@gmx.net>	<20100721085822.5d2a34ae@surf>	<4C4B1C9E.8010600@gmx.net>	<20100730104355.14bb2068@surf>
	<4C532C78.90703@gmx.net>
Message-ID: <4C541F3B.80802@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 30.07.2010 21:48, schrieb Ossy:
> Am 30.07.2010 10:43, schrieb Thomas Petazzoni:
>> In terms of Makefile, nothing else needs to be done than just the final:
>>
>> $(eval $(call AUTOTARGETS,package,util-linux-ng))
>>
>> in the util-linux-ng.mk file.
>>
>
> Currently it compiles well with recent git tree and gcc 4.3.5 for armv5te.

Since util-linux-ng compiles and succesfully installs, I gave 
xfsprogs-3.1.2 a try. Surprisingly it compiles well for armv5te with gcc 
4.3.5. The binaries found in output/build/xfsprogs-3.1.2 are 32bit 
binaries for ARM. But here comes the problem ->
"No rule to make install-strip":
 >>> xfsprogs 3.1.2 Installing to target
/usr/bin/make -j2 
DESTDIR=/home/ossy/buildroot/buildroot-dev/output/target  install-strip 
-C /home/ossy/buildroot/buildroot-dev/output/build/xfsprogs-3.1.2/
make[1]: Entering directory 
`/home/ossy/buildroot/buildroot-dev/output/build/xfsprogs-3.1.2'
make[1]: *** Keine Regel, um ?install-strip? zu erstellen.  Schluss.
make[1]: Leaving directory 
`/home/ossy/buildroot/buildroot-dev/output/build/xfsprogs-3.1.2'
make: *** 
[/home/ossy/buildroot/buildroot-dev/output/build/xfsprogs-3.1.2/.stamp_target_installed] 
Fehler 2

In fact I can't find a target install-strip in the makefile of 
output/build/xfsprogs-3.1.2.
Should autotargets have generated such a target?

My xfsprogs.mk looks very simple an does not include a install-strip 
commando:
#############################################################
XFSPROGS_VERSION = 3.1.2
XFSPROGS_SOURCE  = xfsprogs-$(XFSPROGS_VERSION).tar.gz
XFSPROGS_SITE    = ftp://oss.sgi.com/projects/xfs/cmd_tars
XFSPROGS_DEPENDENCIES = util-linux-ng
XFSPROGS_LIBTOOL_PATCH = NO
XFSPROGS_CONF_OPT     = --enable-shared \
                         --enable-gettext=no \
                         ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes
$(eval $(call AUTOTARGETS,package,xfsprogs))

The deflated xfsprogs in output/build/xfsprogs-3.1.2 does not contain a 
file with content "install-strip".

Where did I misconfigure the new xfsprogs.mk for using autotargets?

Regards,
Marcus
