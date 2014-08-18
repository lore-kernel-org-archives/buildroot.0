From: Nathaniel Roach <nroach44@gmail.com>
Date: Mon, 18 Aug 2014 22:40:58 +0800
Subject: [Buildroot] [PATCH v2] bandwidthd: incorporate fixes for
	autobuilders
In-Reply-To: <53F20353.8020107@openwide.fr>
References: <1408062429-25594-1-git-send-email-nroach44@gmail.com>
 <53F20353.8020107@openwide.fr>
Message-ID: <53F2107A.5040008@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/08/14 21:44, Romain Naour wrote:
> Hi Nathaniel,
> 
> [snip]
> 
> There is a new build issue with bandwidthd:
> 
> http://autobuild.buildroot.net/results/37a/37a94e0f2d3faa0aec9c488e987cfff706fc9f3b/build-end.log
> 
> 
> checking for png_read_info in -lpng... no
> configure: error: Bandwidthd requires but cannot libpng
> make: *** [/home/test/autobuild/instance-3/output/build/bandwidthd-v2.0.1-auto-r08/.stamp_configured] Error 1
> 
> I checked the dependencies with libpng, it's ok.
> 
> But in config.log there are some link issue:
> /home/naourr/git/buildroot/test/bandwidthd/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/../lib64/libpng.a(pngread.o): In function `png_read_destroy':
> /home/naourr/git/buildroot/test/bandwidthd/build/libpng-1.6.12/pngread.c:942: undefined reference to `inflateEnd'
> 
> The configure script doesn't check for zlib, then -lz is missing during libpng test
> 
> I added this line to add this check before libpng:
> AC_CHECK_LIB(z, zlibVersion, , AC_MSG_ERROR(zlib not installed))
> 
> The build continue but fail with libpcap:
> 
> checking for zlibVersion in -lz... yes
> checking for png_read_info in -lpng... yes
> checking for gdImageCreate in -lgd... yes
> checking for pcap_open_live in -lpcap... no
> checking for pcap_open_live in -lwpcap... no
> configure: error: Bandwidthd requires but cannot find libpcap
> 
> Again a link issue:
> /home/naourr/git/buildroot/test/bandwidthd/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/../lib64/libpcap.a(pcap-canusb-linux.o): In function `canusb_activate':
> /home/naourr/git/buildroot/test/bandwidthd/build/libpcap-1.6.1/./pcap-canusb-linux.c:344: undefined reference to `libusb_init'
> 
> I borrowed the libusb test from libpcap to check for libusb-1.0
> # needed by libpcap
> AC_CHECK_HEADER(libusb-1.0/libusb.h,
> [
> 	AC_CHECK_LIB(usb-1.0, libusb_init,
> 	[
> 	LIBS="-lusb-1.0 -lpthread $LIBS"
> 	ac_lbl_has_libusb=yes
> 	],
> 	[AC_MSG_ERROR([Bandwidthd requires but cannot find libusb])]
> 	ac_lbl_has_libusb=no,
> 	-lpthread
> 	)
> ],
> ac_lbl_has_libusb=no
> [AC_MSG_ERROR([Bandwidthd requires but cannot find libusb])]
> )
> 
> And all build fine now :)
> 
> Note that -lpthread need to be added here otherwise libusb will fail with pthread functions.
> 
> So, the configure.ac script needs to be consolidated to check for zlib, libusb-1.0 and pthread.
> Currently, I don't have a clean patch to suggest.
> 
> I hope this will help you.
> 
> Best regards,
> Romain
> 
Hi Romain

All: I replied earlier just to Romain, acknowledging the issue, and
forgot to click reply all instead of normal reply.

Romain, could you try building the latest master from
github.com/nroach44/bandwidthd (id:
0473a5f2527201d83c5b0ddc581b7c9f21fbdcaf )

Thanks, Nathaniel
