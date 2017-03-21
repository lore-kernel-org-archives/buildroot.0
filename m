From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Mar 2017 18:01:09 +0100
Subject: [Buildroot] [PATCH v2] package/bluez5_utils: Allow user to
	enable disabled plugins
In-Reply-To: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com> (Andy
 Shevchenko's message of "Tue, 21 Mar 2017 18:02:35 +0200")
References: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com>
Message-ID: <874lymlg2y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andy" == Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

 > Disregard to increase just minor version BlueZ 5.44 is drastically different in
 > a way what tools and plugins are enabled and installed by default.

 > Extend Buildroot package to cover these changes.

 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 > ---
 >  package/bluez5_utils/Config.in       | 28 +++++++++++++++++++++++++++-
 >  package/bluez5_utils/bluez5_utils.mk | 36 ++++++++++++++++++++++++++++++++++++
 >  2 files changed, 63 insertions(+), 1 deletion(-)

 > diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
 > index a7c0ee4ba..e99f0f69f 100644
 > --- a/package/bluez5_utils/Config.in
 > +++ b/package/bluez5_utils/Config.in
 > @@ -48,6 +48,11 @@ config BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 >  comment "bluez5-utils client needs a glibc or musl toolchain"
 >  	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 > +config BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
 > +	bool "build deprecated tools"
 > +	help
 > +	  Build BlueZ 5.x deprecated tools (hciattach, gatttool, ...).
 > +
 >  config BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL
 >  	bool "install GATT tool"
 >  	depends on BR2_PACKAGE_BLUEZ5_UTILS_CLIENT

Then _UTILS_GATTTOOL should depend on _UTILS_DEPRECATED. Or perhaps it
doesn't make sense to have a dedicated option for this and it should
just be automatically installed when deprecated is enabled.

It would also be good to add the autobuilder failures:

http://autobuild.buildroot.net/?reason=bluez5_utils-5.44

-- 
Bye, Peter Korsgaard
