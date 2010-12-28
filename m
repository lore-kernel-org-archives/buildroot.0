From: olyvine.chen at logiways.com.cn <olyvine.chen@logiways.com.cn>
Date: Tue, 28 Dec 2010 17:45:40 +0800
Subject: [Buildroot] wvstreams configure error
In-Reply-To: <20101228101313.0e257c8b@surf>
References: <1293525765.15318.24.camel@olyvine-desktop.logiways-sz.cn>
	<20101228101313.0e257c8b@surf>
Message-ID: <1293529540.15318.34.camel@olyvine-desktop.logiways-sz.cn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thanks for your reply, and I check the config.log, and find CXX compiler
is missing, then how to pass the argument to configure to enable CXX ?
####################################################################
configure:8427: result: no
configure:8461: checking for openssl/ssl.h
configure:8482: false -c -Os -pipe -Os  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 --sysroot ????/staging/
-Iyes/include conftest.cpp >&5
configure:8489: $? = 1
configure: failed program was:
####################################################################

Best regards!
Olyvine.

On Tue, 2010-12-28 at 10:13 +0100, Thomas Petazzoni wrote:
> On Tue, 28 Dec 2010 16:42:45 +0800
> "olyvine.chen at logiways.com.cn" <olyvine.chen@logiways.com.cn> wrote:
> 
> > I now run into an error when configure wvstreams as following:
> > ##################################################################################
> > make[2]: Circular wvstreams-depends <- wvstreams dependency dropped.
> 
> Hum, this message is strange.
> 
> > configure: error: Required dependencies missing: OpenSSL>=0.9.7 zlib
> 
> It says OpenSSL and zlib are *required* dependencies, so:
> 
> > ifeq ($(BR2_PACKAGE_OPENSSL),y)
> > WVSTREAMS_CONF_OPT+=--with-openssl
> > WVSTREAMS_DEPENDENCIES+=openssl
> > else
> > WVSTREAMS_CONF_OPT+=--without-openssl
> > endif
> 
> This should just be:
> 
> WVSTREAMS_CONF_OPT+=--with-openssl
> WVSTREAMS_DEPENDENCIES+=openssl
> 
> and the package should "select BR2_PACKAGE_OPENSSL"
> 
> > ifeq ($(BR2_PACKAGE_ZLIB),y)
> > WVSTREAMS_CONF_OPT+=--with-zlib=$(STAGING_DIR)
> > WVSTREAMS_DEPENDENCIES+=zlib
> > else
> > WVSTREAMS_CONF_OPT+=--without-zlib
> > endif
> 
> This should just be:
> 
> WVSTREAMS_CONF_OPT+=--with-zlib=$(STAGING_DIR)
> WVSTREAMS_DEPENDENCIES+=zlib
> 
> and the package should "select BR2_PACKAGE_ZLIB"
> 
> Then, if zlib and openssl are still not found while being compiled
> before wvstreams, then you'll have to look at wvstreams config.log file
> to see why it cannot find them.
> 
> Regards,
> 
> Thomas
