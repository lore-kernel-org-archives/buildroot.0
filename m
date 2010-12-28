From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Dec 2010 10:13:13 +0100
Subject: [Buildroot] wvstreams configure error
In-Reply-To: <1293525765.15318.24.camel@olyvine-desktop.logiways-sz.cn>
References: <1293525765.15318.24.camel@olyvine-desktop.logiways-sz.cn>
Message-ID: <20101228101313.0e257c8b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Dec 2010 16:42:45 +0800
"olyvine.chen at logiways.com.cn" <olyvine.chen@logiways.com.cn> wrote:

> I now run into an error when configure wvstreams as following:
> ##################################################################################
> make[2]: Circular wvstreams-depends <- wvstreams dependency dropped.

Hum, this message is strange.

> configure: error: Required dependencies missing: OpenSSL>=0.9.7 zlib

It says OpenSSL and zlib are *required* dependencies, so:

> ifeq ($(BR2_PACKAGE_OPENSSL),y)
> WVSTREAMS_CONF_OPT+=--with-openssl
> WVSTREAMS_DEPENDENCIES+=openssl
> else
> WVSTREAMS_CONF_OPT+=--without-openssl
> endif

This should just be:

WVSTREAMS_CONF_OPT+=--with-openssl
WVSTREAMS_DEPENDENCIES+=openssl

and the package should "select BR2_PACKAGE_OPENSSL"

> ifeq ($(BR2_PACKAGE_ZLIB),y)
> WVSTREAMS_CONF_OPT+=--with-zlib=$(STAGING_DIR)
> WVSTREAMS_DEPENDENCIES+=zlib
> else
> WVSTREAMS_CONF_OPT+=--without-zlib
> endif

This should just be:

WVSTREAMS_CONF_OPT+=--with-zlib=$(STAGING_DIR)
WVSTREAMS_DEPENDENCIES+=zlib

and the package should "select BR2_PACKAGE_ZLIB"

Then, if zlib and openssl are still not found while being compiled
before wvstreams, then you'll have to look at wvstreams config.log file
to see why it cannot find them.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
