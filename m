From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 15:48:08 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26: librsvg
	failure
In-Reply-To: <20170228100542.2536f1d0@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 28 Feb 2017 10:05:42 +0100")
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
 <20170228000123.66658172@free-electrons.com>
 <87r32ik7vl.fsf@dell.be.48ers.dk>
 <20170228100542.2536f1d0@free-electrons.com>
Message-ID: <87innujrrr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 28 Feb 2017 10:00:14 +0100, Peter Korsgaard wrote:

 >> Is that the complete strace output? Where is fd 3 getting opened? I
 >> would imagine the problem is caused by some kind of host/target
 >> libraries mixup.

 > No, that's only the end of the strace output. I've posted the full
 > strace output at:

 >   http://code.bulix.org/elused-120071

 > File descriptor 3 is:

 > open("/lib/x86_64-linux-gnu/libm.so.6", O_RDONLY|O_CLOEXEC) = 3

 > Which looks correct to me, when running a host binary on the host machine.

Yes, but the part where it loads a library from the target-librsvg
doesn't:

stat("/home/thomas/projets/buildroot/output/build/librsvg-2.40.16/gdk-pixbuf-loader", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat("/home/thomas/projets/buildroot/output/build/librsvg-2.40.16/gdk-pixbuf-loader/./libpixbufloader-svg.la", {st_mode=S_IFREG|0644, st_size=3987, ...}) = 0
open("/home/thomas/projets/buildroot/output/build/librsvg-2.40.16/gdk-pixbuf-loader/./libpixbufloader-svg.la", O_RDONLY) = 3
read(3, "# libpixbufloader-svg.la - a lib"..., 4000) = 3987
futex(0x7fb04bc20488, FUTEX_WAKE_PRIVATE, 2147483647) = 0
read(3, "", 4000)                       = 0
close(3)                                = 0
futex(0x7fb04b3480a8, FUTEX_WAKE_PRIVATE, 2147483647) = 0
open("/home/thomas/projets/buildroot/output/build/librsvg-2.40.16/gdk-pixbuf-loader/./.libs/libpixbufloader-svg.so", O_RDONLY|O_CLOEXEC) = 3

-- 
Bye, Peter Korsgaard
