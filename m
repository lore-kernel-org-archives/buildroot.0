From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 18 Oct 2014 23:08:26 +0300
Subject: [Buildroot] [PATCH] spidev_test: new package
In-Reply-To: <20141017215539.GM3971@free.fr>
References: <1413301553-1592-1-git-send-email-gustavo@zacarias.com.ar>
 <20141014195411.GI3500@tarshish> <20141017215539.GM3971@free.fr>
Message-ID: <20141018200826.GA2220@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, Oct 17, 2014 at 11:55:39PM +0200, Yann E. MORIN wrote:
> On 2014-10-14 22:54 +0300, Baruch Siach spake thusly:
> > On Tue, Oct 14, 2014 at 12:45:53PM -0300, Gustavo Zacarias wrote:
> > > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > 
> > [snip]
> > 
> > > diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
> > > new file mode 100644
> > > index 0000000..c0ed9ef
> > > --- /dev/null
> > > +++ b/package/spidev_test/Config.in
> > > @@ -0,0 +1,15 @@
> > > +config BR2_PACKAGE_SPIDEV_TEST
> > > +	bool "spidev_test"
> > > +	depends on BR2_LINUX_KERNEL
> > 
> > That is a heavy dependency. As you noted in another message, it also make the 
> > autobuilder skip this package. I suggest to download just spidev_test.c from 
> > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi/spidev_test.c?id=$(SPIDEV_TEST_VERSION), 
> > and make it depend on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 (as of v3.17). This 
> 
> What about directly getting the appropriate one, something like:
> 
>     ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
>     SPIDEV_TEST_VERSION = v3.15
>     else
>     SPIDEV_TEST_VERSION = v3.14
>     endif
> 
>     SPIDEV_TEST_SOURCE =
>     SPIDEV_TEST_EXTRA_DOWNLOADS = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi/spidev_test.c?id=$(SPIDEV_TEST_VERSION)
> 
> Since, without the proper kernel headers, it is not possible to build
> the quad-pump blabla, we can directly get the spidev_test that will
> indeed compile with our toolchain, no?

As Gustavo mentioned in another message in this thread, the newer spidev_test 
is also run-time dependent on kernel v3.15 or newer. An automatic spidev_test 
version choice would produce a broken binary for users of newer toolchains 
with pre v3.15 kernels. We should use BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 to 
disable build of v3.15 spidev_test, as this would break the build. But I don't 
think we want to force v3.15 spidev_test just because the toolchain kernel 
headers are post v3.15.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
