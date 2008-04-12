From: Stefan Gehrer <stefan.gehrer@gmx.de>
Date: Sat, 12 Apr 2008 10:43:24 +0200
Subject: [Buildroot] [BUG] some issues building for ARM1176JZF-S
Message-ID: <4800762C.6070403@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

I am just starting with buildroot and try to build for an ARM11 based 
system. Building the toolchain and kernel was smooth, there were just
some issues in individual packages. When I will get more used to 
buildroot I hope I will be able to send patches, but at the moment
I just try my best in reporting:

When building package grep-2.5.1, linking in build_arm/grep-2.5.1/src
failed with unknown references to libintl_gettext. Adding -lintl to
the Makefile's CC line helped as a workaround.

After building libogg-1.1.3, the copying of the libraries to the
staging_dir does not work as the source directory assumption is
wrong. My workaround was to run following command in build_arm/libogg-1.1.3:
ln -s src/.libs lib

Linking of package libvorbis-1.2.0 failed with
libtool: install: error: relink `libvorbisenc.la' with the above command 
before installing it
Just running make a second time worked.

Before package SDL-1.2.13 was built, buildroot tried to create
a symbolic link staging_dir/include/directfb.
staging_dir/include did not exist at that point so that failed.
Creating staging_dir/include by hand helped

Now I am stuck compiling util-linux-2.12r with following errors
umount.c:45: error: expected declaration specifiers or '...' before 
'umount2'
umount.c:45: error: expected declaration specifiers or '...' before 'path'
umount.c:45: error: expected declaration specifiers or '...' before 'flags'

I will see what I can do and keep you posted. I attached my .config
if anyone is interested.

Best regards
Stefan Gehrer
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
Url: http://busybox.net/lists/buildroot/attachments/20080412/60624a1a/attachment.txt 
