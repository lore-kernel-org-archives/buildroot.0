From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Oct 2009 13:54:25 +0200
Subject: [Buildroot] [PATCH 06/10] *-menuconfig needs dirs to exist
In-Reply-To: <87iqeohkam.fsf@macbook.be.48ers.dk>
References: <87my43j6b6.fsf@macbook.be.48ers.dk>
	<cover.1254994304.git.rep.dot.nop@gmail.com>
	<2ab3141d307cc1b3daa8ab8ded7740b1af324336.1254994304.git.rep.dot.nop@gmail.com>
	<874oq9iukr.fsf@macbook.be.48ers.dk> <20091008190847.GB2266@mx.loc>
	<87zl81hbed.fsf@macbook.be.48ers.dk> <20091009093821.GG2266@mx.loc>
	<87vdiohl1r.fsf@macbook.be.48ers.dk> <20091009112619.GL2266@mx.loc>
	<87iqeohkam.fsf@macbook.be.48ers.dk>
Message-ID: <20091009115425.GN2266@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 09, 2009 at 01:35:29PM +0200, Peter Korsgaard wrote:

>I have no problem adding fixes, but I want to understand what - if
>anything, it fixes.

one last attempt.

$ rm -rf buildroot
$ git clone --depth 1 git://git.uclibc.org/git/buildroot.git && cd buildroot
$ make
select linux kernel, same as headers. Set format to e.g. bzImage; save
and exit. you have e.g.:
$ egrep "^BR2_(.*LINUX|KERNEL)" .config
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_KERNEL_HEADERS_2_6_31=y
BR2_KERNEL_LINUX=y
BR2_PACKAGE_LINUX=y
BR2_PACKAGE_LINUX_KCONFIG=""
BR2_PACKAGE_LINUX_FORMAT="bzImage"

cool, so let's configure the beast:
$ make linux26-menuconfig
--2009-10-09 13:43:42--
http://www.kernel.org/pub//linux/kernel/v2.6//linux-2.6.31.2.tar.bz2
Resolving proxy.loc... 192.168.100.36
Connecting to proxy.loc|192.168.100.36|:3128... connected.
Proxy request sent, awaiting response... 200 OK
Length: 61449156 (59M) [application/x-bzip2]
Saving to: `./dl/linux-2.6.31.2.tar.bz2'

100%[======================================>] 61,449,156   384K/s   in
2m 35s  

2009-10-09 13:46:19 (387 KB/s) - `./dl/linux-2.6.31.2.tar.bz2' saved
[61449156/61449156]

rm -rf /tmp/buildroot/output/build/linux-2.6.31.2
*** Unpacking kernel source
bzcat ./dl/linux-2.6.31.2.tar.bz2 | tar -C /tmp/buildroot/output/build
-xf -
tar: /tmp/buildroot/output/build: Cannot chdir: No such file or
directory
tar: Error is not recoverable: exiting now
make: *** [/tmp/buildroot/output/build/linux-2.6.31.2/.unpacked] Error 2

Note that this is an obvious breakage. Look at the makefiles, who do you
think should have created the build-dir before that?
And yes, just BUILD_DIR, like busybox does would be sufficient, but
later on you will experience that if you just specify BUILD_DIR as
prereq then you will die in funny ways for toplevel-parallel makes.
(I can almost hear you saying that this isn't supported right now, so:
yes, it isn't but let's just fix it properly to avoid this future
problem, ok?)

.
