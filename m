From: Arndt Kritzner <kritzner@logicway.de>
Date: Sat, 29 Mar 2008 14:23:14 +0100
Subject: [Buildroot] avr32 target,
	defconfig and target uclibc config issues (partly solved)
Message-ID: <47EE42C2.6070000@logicway.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Glib2 didn't compile for avr32 target because of missing "iconv"
functionality, that is dependant on locale support.

The specified custom uClibc "target/device/Atmel/uClibc.config.avr32"
enables UCLIBC_HAS_WCHAR=y and UCLIBC_HAS_LOCALE=y.
In atstk1002_defconfig BR2_ENABLE_LOCALE is not set.
In the resulting target "toolchain_build_avr32/uClibc-0.9.29/.config"
the UCLIBC_HAS_LOCALE is not set and that's why no locale support is built.

For some reason this is irreparable afterwards by just enabling the
LOCALE support with menuconfig and touching uClibc.config.avr32 to
rebuild the target uClibc. Also make clean doesn't repair this issue.

To resolve the conflict I enabled general locale support in
atstk1002_defconfig. Maybe the changes in the uClib config are just for
the sake of good order and have no other function.

With this changes glib2 can be built on avr32 with the stk1002_defconfig.
-- 

--
###############################################################
Dipl. Ing Arndt Kritzner    Tel:    (0385) 3993 448
Logic Way GmbH              Fax:    (0385) 3993 458
Hagenower Strasse 73        HTTP:   http://www.logicway.de
19061 Schwerin
###############################################################
-------------- next part --------------
A non-text attachment was scrubbed...
Name: atstk1002_defconfig.20080329.diff
Type: text/x-patch
Size: 468 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080329/3a786b31/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibc.config.avr32.20080329.diff
Type: text/x-patch
Size: 819 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080329/3a786b31/attachment-0001.bin 
