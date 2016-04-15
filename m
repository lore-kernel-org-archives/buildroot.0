From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Apr 2016 00:07:59 +0200
Subject: [Buildroot] [PATCH] gutenprint: fix host build when libusb found
In-Reply-To: <20160415175035.GQ7454@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Fri, 15 Apr 2016 19:50:35 +0200")
References: <20160402184733.GA8155@waldemar-brodkorb.de>
 <87oa9bgqv2.fsf@dell.be.48ers.dk>
 <20160415175035.GQ7454@waldemar-brodkorb.de>
Message-ID: <87potqfruo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Hi Peter,
 > Peter Korsgaard wrote,

 >> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
 >> 
 >> > Allow to disable USB support, otherwise host build breaks when
 >> > libusb is found as installation tries to install to /usr.
 >> > Fixes following autobuild error:
 >> > http://autobuild.buildroot.net/results/081b3be918ac1eaa8cfbc5919e00bc1ea267c1df/
 >> 
 >> Hmm, but why does that end up with /usr and not $(HOST_DIR)/usr? Is it
 >> picking up a libusb.pc from your host or is our host-libusb .pc file
 >> wrong?

 > It is picking up libusb.pc from the host and I don't think
 > gutenprint-print will build host libusb at all. As cups support
 > is disabled anyway for the host, I don't think installing any USB
 > backends for the hosttools is strictly necessary and might be better
 > avoided.

I had a closer look, and it actually isn't libusb.pc from the build host
(or directly anything to do with libusb).

The problem is really that the --without-cups option doesn't really
work. We already have a related workaround for this where we
ac_cv_path_CUPS_CONFIG='', but more is needed. When we pass
--without-cups the configure script hardcodes cups_prefix to "/usr".

host-gutenprint itself doesn't depend on host-libusb, but other packages
do so it might be built before host-gutenprint. If the configure script
detects libusb support (using pkg-config), then it will build a cups
backend using libusb (even though cups support is disabled) and intall
it into $cups_prefix/share/cups/usb, breaking the build :/

So either we fix the configure script to really disable the cups support
when configured with --without-cups, we add your patch as a workaround
or we simply add PKG_CONFIG=false to HOST_GUTENPRINT_CONF_ENV to make
sure the configure script doesn't find libusb. We can do that as
pkg-config is only used to check for libusb and gtk2, neither of which
we need for host-gutenprint.

-- 
Venlig hilsen,
Peter Korsgaard 
