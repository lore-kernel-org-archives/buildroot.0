From: Ossy <ossy1980@gmx.net>
Date: Sat, 31 Jul 2010 16:33:41 +0200
Subject: [Buildroot] xfsprogs 3.0.3 without libxfs in rootfs
In-Reply-To: <4C541F3B.80802@gmx.net>
References: <4C4613A2.90006@gmx.net>	<20100721085822.5d2a34ae@surf>	<4C4B1C9E.8010600@gmx.net>	<20100730104355.14bb2068@surf>	<4C532C78.90703@gmx.net>
	<4C541F3B.80802@gmx.net>
Message-ID: <4C543445.9010403@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 31.07.2010 15:03, schrieb Ossy:
> Since util-linux-ng compiles and succesfully installs, I gave
> xfsprogs-3.1.2 a try. Surprisingly it compiles well for armv5te with gcc
> 4.3.5. The binaries found in output/build/xfsprogs-3.1.2 are 32bit
> binaries for ARM. But here comes the problem ->
> "No rule to make install-strip":
>
> In fact I can't find a target install-strip in the makefile of
> output/build/xfsprogs-3.1.2.
> Should autotargets have generated such a target?
>
> Where did I misconfigure the new xfsprogs.mk for using autotargets?
>
I added the following option in xfsprogs.mk - I assume it says "use 
install and not install-strip".
XFSPROGS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install

The target "install" is correctly triggered, but I get another error now:
 >>> xfsprogs 3.1.2 Installing to target
/usr/bin/make -j2 
DESTDIR=/home/ossy/buildroot/buildroot-dev/output/target install -C 
/home/ossy/buildroot/buildroot-dev/output/build/xfsprogs-3.1.2/
make[1]: Entering directory 
`/home/ossy/buildroot/buildroot-dev/output/build/xfsprogs-3.1.2'
Installing include-install
Installing libxfs-install
make[2]: F?r das Ziel ?install? ist nichts zu tun.
Installing libxlog-install
     [DEP]
     [DEP]
Installing libxcmd-install
     [DEP]
Installing libhandle-install
     [DEP]
cd ../libhandle/.libs; ../../install-sh -o ossy -g ossy -m 755 -d /lib; 
../../install-sh -o ossy -g ossy -m 644 -T so_dot_version libhandle.lai 
/lib; ../../install-sh -o ossy -g ossy -T so_dot_current libhandle.lai /lib
chmod: Beim Setzen der Zugriffsrechte f?r ?//lib?: Die Operation ist 
nicht erlaubt
cp: regul?re Datei ?//lib/libhandle.so.1.0.3? kann nicht angelegt 
werden: Permission denied.
ln: Entfernen von ?//lib/libhandle.so.1? nicht m?glich: Permission denied.
make[2]: *** [install] Fehler 1
make[1]: *** [libhandle-install] Fehler 2
make[1]: *** Warte auf noch nicht beendete Prozesse...
make[1]: Leaving directory 
`/home/ossy/buildroot/buildroot-dev/output/build/xfsprogs-3.1.2'
make: *** 
[/home/ossy/buildroot/buildroot-dev/output/build/xfsprogs-3.1.2/.stamp_target_installed] 
Fehler 2

So the library path configuration wasn't correct. Which option in 
xfsprogs.mk would inform the make-process to use the target directory 
and not some "//lib"?

Regards,
Marcus

Sorry for commenting everything. I think this would help others who 
search the mailinglist archives, since we are short with other 
documentation.
