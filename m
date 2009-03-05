From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2009 15:13:59 +0100
Subject: [Buildroot] Duplication and size of binaries in generated toolchain
Message-ID: <20090305151359.20b37039@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

After compiling a toolchain with Buildroot (no packages, no kernel, see
attached configuration file), I end up with duplicated binaries in the
STAGING_DIR.

For example, for the 'ar' binutil. The first copy is in :

$ ls -l usr/bin/arm-linux-uclibcgnueabi-ar 
-rwxr-xr-x 2 thomas thomas 2500708 2009-03-05 14:19 usr/bin/arm-linux-uclibcgnueabi-ar
$ md5sum usr/bin/arm-linux-uclibcgnueabi-ar 
82a898a705b8313ff156ee2287552a60  usr/bin/arm-linux-uclibcgnueabi-ar

And the second copy is in :

$ ls -l usr/arm-linux/bin/ar 
-rwxr-xr-x 2 thomas thomas 2500708 2009-03-05 14:19 usr/arm-linux/bin/ar
$ md5sum usr/arm-linux/bin/ar 
82a898a705b8313ff156ee2287552a60  usr/arm-linux/bin/ar

Same story for as, c++, g++, gcc, ld, nm, objcopy, objdump, ranlib,
strip. In total, it's 24 MB of binaries that are duplicated.

I'm not sure why the binaries without the arm-linux prefix are needed
in usr/arm-linux/bin. But if they are, couldn't they be symbolic links.

Last question: why are the individual binutils so big ? For example,
the strip program is 2.9 MB, ar is 2.4 MB. This looks ridiculously big
for such simple tools. First of all, they are not stripped and they
include debugging symbols, is it really necessary ? Even after
stripping, strip itself is still ~650 KB. Is it because of the static
linking against libbfd ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 17514 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090305/b7fd5497/attachment-0001.obj>
