From: Heyendal, Carl <CHeyendal@stanleyworks.com>
Date: Mon, 5 Oct 2009 16:44:19 -0400
Subject: [Buildroot] compile error with 'crtstuff.c'
References: <1D6034426110564DA0DEA9EE9793B38357C834B900@NBE-MBX01.americas.swk.pri>
	<4AC9B9D4.5020305@thrane.com> 
Message-ID: <1D6034426110564DA0DEA9EE9793B38357C873F542@NBE-MBX01.americas.swk.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Asbjoern,

I have another problem that may be related to the patch you gave me.

At the link you gave me there is an ominous warning that this patch may break something elsewhere in the build.

	"The patch itself is definitely wrong though (breaks other arches) - it's
	probably a matter of adding the right #include somewhere (not familiar with gcc
	internals to figure out what exactly should be done)."

Do you know how to get around the new problem below?
/carl h.

------------------
make[1]: Entering directory `/home/heyendal/buildroot/output/toolchain/uClibc-0.9.30.1'
install -d /home/heyendal/buildroot/output/target/lib
install -m 644 lib/lib*-0.9.30.1.so \
		/home/heyendal/buildroot/output/target/lib
cd lib && tar -cf - *.so.* | tar -xf - -C /home/heyendal/buildroot/output/target/lib
make[1]: Leaving directory `/home/heyendal/buildroot/output/toolchain/uClibc-0.9.30.1'
touch -c /home/heyendal/buildroot/output/target/lib/libc.so.0
mkdir -p /home/heyendal/buildroot/output/toolchain/gcc-4.3.4-final
# Important! Required for limits.h to be fixed.
ln -snf ../include/ /home/heyendal/buildroot/output/staging/usr/arm-linux-uclibcgnueabi/sys-include
ln: creating symbolic link `/home/heyendal/buildroot/output/staging/usr/arm-linux-uclibcgnueabi/sys-include': No such file or directory
make: *** [/home/heyendal/buildroot/output/toolchain/gcc-4.3.4-final/.configured] Error 1
heyendal at carl-desktop:~/buildroot$ 






-----Original Message-----
From: Heyendal, Carl 
Sent: Monday, October 05, 2009 4:30 PM
To: 'Asbjoern Laurberg'
Subject: RE: [Buildroot] compile error with 'crtstuff.c'


Hello Asbjoern,

Thanks for the patch. I can proceed with the build now.

/carl

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Asbjoern Laurberg
Sent: Monday, October 05, 2009 5:18 AM
To: buildroot at busybox.net
Subject: Re: [Buildroot] compile error with 'crtstuff.c'

Heyendal, Carl wrote:
> Hi,

Hi,

> /home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crts
> tuff.c
> -DCRT_BEGIN
> /home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c: 
> In function '__do_global_dtors_aux':
> /home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:306: 
> error: '__DTOR_LIST__' undeclared (first use in this function)
> /home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:306: 
> error: (Each undeclared identifier is reported only once
> /home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:306: 
> error: for each function it appears in.)

To get GCC compiling in Buildroot with a ARM926 + EABI-configuration the following post+patch was the solution:

http://www.mail-archive.com/gcc-bugs at gcc.gnu.org/msg115966.html

--
Best regards,
Asbjoern Laurberg
Development Engineer
Thrane & Thrane A/S
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
