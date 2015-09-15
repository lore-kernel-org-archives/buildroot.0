From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Sep 2015 23:21:48 +0200
Subject: [Buildroot] User question UTF-8
In-Reply-To: <CAJJ6jxvdrYbALJfdd=oKMO4xwsg9o6MfwR_YGLyvOsCgfV77Hw@mail.gmail.com>
References: <CAJJ6jxvdrYbALJfdd=oKMO4xwsg9o6MfwR_YGLyvOsCgfV77Hw@mail.gmail.com>
Message-ID: <55F88BEC.1060306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-09-15 19:11, Steve Calfee wrote:
> Hi,
> 
> I am trying to port a python application to buildroot/busybox. It
> needs to read disk files from removable drives. The filenames may
> contain utf-8 chars.
> 
> Currently ls from busybox prints ? for the utf-8 non-ascii chars. Both
> from console on minicom and from ssh (which should handle utf-8).

 Busybox ls will print all non-ASCII characters as ? unless UNICODE_SUPPORT is
enabled. Our default busybox config doesn't have UNICODE_SUPPORT enabled. So do
'make busybox-menuconfig' and enable UNICODE_SUPPORT. You'll also need to enable
WCHAR in the toolchain - but since you use glibc, it always has WCHAR enabled.

> 
> There seems to be lots of config knobs.
> 
> I assume utf-8 chars are somehow related to locales? I enabled locales
> in the internal glib toolchain.
> 
> BR2_arm=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_ENABLE_LOCALE_PURGE=y
> BR2_GENERATE_LOCALE="en_US.UTF-8"
> BR2_TARGET_OPTIMIZATION="-Os -pipe"
> # BR2_TARGET_GENERIC_GETTY is not set
> # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
> BR2_PACKAGE_LIBPTHREAD_STUBS=y
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_TARGET_SHEEVAPLUG=y
> 
> 
> Busybox also has locale settings:
> grep LOCAL output/build/busybox-1.23.2/.config
> CONFIG_LOCALE_SUPPORT=y
> # CONFIG_UNICODE_USING_LOCALE is not set
> # CONFIG_FEATURE_UNIX_LOCAL is not set
> # CONFIG_HUSH_LOCAL is not set
> 
>>From googling, Linux always supports anything for filenames, since it
> just uses bytes not unicode for filenames.
> 
> But I seem to be missing something. My generated system does not seem
> to properly handle utf-8. I am guessing until that works the python os
> module is also not going to handle utf-8. And indeed it does not work
> now.

 Busybox and python are completely unrelated. In python 2, you'll have to
explicitly encode/decode the filenames with the appropriate character set. The
default character set is ascii, not utf-8. In python 3, there is an environment
variable that you can set to default to utf-8, though.

 Regards,
 Arnout

> 
> Regards, Steve
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
