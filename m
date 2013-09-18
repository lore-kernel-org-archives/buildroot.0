From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Sep 2013 00:17:18 +0200
Subject: [Buildroot] [PATCH v3] python-crc16: new package
In-Reply-To: <1379504896-16754-1-git-send-email-rommel@layer-7.net> (Michael
 Rommel's message of "Wed, 18 Sep 2013 13:48:16 +0200")
References: <1379504896-16754-1-git-send-email-rommel@layer-7.net>
Message-ID: <87y56thj0x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Rommel <rommel@layer-7.net> writes:

 Michael> A python library that calculates CRC checksums of the CCITT/XModem
 Michael> variant.

 Michael> Signed-off-by: Michael Rommel <rommel@layer-7.net>
 Michael> ---
 Michael> Changes v2 -> v3
 Michael> * changed homepage URL
 Michael> * added LDFLAGS for correct linking

 Michael> Changes v1 -> v2
 Michael> * corrected a typo in the filename for the .mk file

 Michael>  package/Config.in                    |    1 +
 Michael>  package/python-crc16/Config.in       |   11 +++++++++++
 Michael>  package/python-crc16/python-crc16.mk |   35 ++++++++++++++++++++++++++++++++++
 Michael>  3 files changed, 47 insertions(+)
 Michael>  create mode 100644 package/python-crc16/Config.in
 Michael>  create mode 100644 package/python-crc16/python-crc16.mk

 Michael> diff --git a/package/Config.in b/package/Config.in
 Michael> index 56c316e..779e9da 100644
 Michael> --- a/package/Config.in
 Michael> +++ b/package/Config.in
 Michael> @@ -385,6 +385,7 @@ source "package/python/Config.in"
 Michael>  if BR2_PACKAGE_PYTHON
 Michael>  menu "external python modules"
 Michael>  source "package/python-bottle/Config.in"
 Michael> +source "package/python-crc16/Config.in"
 Michael>  source "package/python-dpkt/Config.in"
 Michael>  source "package/python-id3/Config.in"
 Michael>  source "package/python-mad/Config.in"
 Michael> diff --git a/package/python-crc16/Config.in b/package/python-crc16/Config.in
 Michael> new file mode 100644
 Michael> index 0000000..3fd8da7
 Michael> --- /dev/null
 Michael> +++ b/package/python-crc16/Config.in
 Michael> @@ -0,0 +1,11 @@
 Michael> +config BR2_PACKAGE_PYTHON_CRC16
 Michael> +	bool "python-crc16"
 Michael> +	depends on BR2_PACKAGE_PYTHON
 Michael> +	help
 Michael> +	  This library calculates only CRC16 (16-bit codes) and the
 Michael> +	  only supported variant at the moment is CRC-CCITT (XModem).
 Michael> +	  CRC is a way of detecting accidental changes in data storage
 Michael> +	  or transmission. There are many variants of CRC and CRC16,
 Michael> +	  in particular.
 Michael> +
 Michael> +	  http://pycrc16.googlecode.com/
 Michael> diff --git a/package/python-crc16/python-crc16.mk b/package/python-crc16/python-crc16.mk
 Michael> new file mode 100644
 Michael> index 0000000..adfdcc6
 Michael> --- /dev/null
 Michael> +++ b/package/python-crc16/python-crc16.mk
 Michael> @@ -0,0 +1,35 @@
 Michael> +################################################################################
 Michael> +#
 Michael> +# python-crc16
 Michael> +#
 Michael> +################################################################################
 Michael> +
 Michael> +PYTHON_CRC16_VERSION = 0.1.1
 Michael> +PYTHON_CRC16_SOURCE = crc16-$(PYTHON_CRC16_VERSION).tar.gz
 Michael> +PYTHON_CRC16_SITE = http://pycrc16.googlecode.com/files/
 Michael> +PYTHON_CRC16_LICENSE = LGPLv3+
 Michael> +PYTHON_CRC16_LICENSE_FILES = COPYING.txt
 Michael> +PYTHON_CRC16_DEPENDENCIES = python host-python
 Michael> +
 Michael> +PYTHON_CRC16_PARAMS = CC="$(TARGET_CC)" \
 Michael> +		CFLAGS="$(TARGET_CFLAGS)" \
 Michael> +		LDSHARED="$(TARGET_CC) -shared" \
 Michael> +		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib" \

The LDFLAGS thing is a bit hackish as it still passes -L/usr/lib, but
the python stuff doesn't really seem forseen for cross compilation.

Committed, thanks.

-- 
Bye, Peter Korsgaard
