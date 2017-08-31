From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 31 Aug 2017 07:18:55 +0300
Subject: [Buildroot] [PATCH next 1/2] lirc-tools: remove useless
 libusb-compat dependnecy
In-Reply-To: <20170830222946.5ad6f28b@windsurf.lan>
References: <c21debe1fe36162b182803d45b5e6b0ab4ff575d.1503898456.git.baruch@tkos.co.il>
 <20170830222946.5ad6f28b@windsurf.lan>
Message-ID: <20170831041855.3cdhvuibow4ulhgb@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Aug 30, 2017 at 10:29:46PM +0200, Thomas Petazzoni wrote:
> On Mon, 28 Aug 2017 08:34:15 +0300, Baruch Siach wrote:
> > The only plugin that uses libusb/libusb-compat is the ftdi plugin. This
> > plugin needs libftdi1 that already depends on libusb in Buildroot. So in
> > practice libusb-compat is never actually used; we can safely remove it.
> > The libusb dependency is implicit in the libftdi1 optional dependency.
> 
> Are you sure ?
> 
> From the configure.ac script:
> 
> AC_CHECK_HEADERS([usb.h libusb-1.0/libusb.h libusb.h])
> AC_CHECK_LIB([usb],[usb_get_string],[usb_libs="-lusb"],,)
> AM_CONDITIONAL([BUILD_USB],[test x$usb_libs != x])
> AC_CHECK_LIB([usb-1.0],[libusb_lock_events],[usb_libs="$usb_libs -lusb-1.0"],,)
> 
> In addition, I do see a number of plugins linked with libusb-0.1:
> 
> $ readelf -d output/target/usr/lib/lirc/plugins/* | grep libusb-0.1
>  0x00000001 (NEEDED)                     Shared library: [libusb-0.1.so.4]
>  0x00000001 (NEEDED)                     Shared library: [libusb-0.1.so.4]
>  0x00000001 (NEEDED)                     Shared library: [libusb-0.1.so.4]
>  0x00000001 (NEEDED)                     Shared library: [libusb-0.1.so.4]
>  0x00000001 (NEEDED)                     Shared library: [libusb-0.1.so.4]
> 
> Am I missing something ?

No. I missed the libusb-0.1 related symbols in configure.ac and 
plugins/Makefile.am.

Marked as rejected.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
