From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sun, 18 Oct 2009 17:47:32 +0200
Subject: [Buildroot] [PATCH] Add sysstat tools
In-Reply-To: <1255874745.19306.8.camel@coalu.atr>
References: <1255096083.22093.0.camel@coalu.atr>
	<1255118149.2236.3.camel@coalu.atr>
	<1255874745.19306.8.camel@coalu.atr>
Message-ID: <20091018154732.GB13529@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 18, 2009 at 04:05:45PM +0200, Lionel Landwerlin wrote:
>ping ?
>
>Maybe I should add some informations about this package.
>
>The sysstat package provides a great tool named sar, which gives
>informations about cpu consumption in user/system context, as well as
>number of page faults per seconds, or number of blocks read from
>devices, etc...
>It's a good tool to tune performances on a system/cpu with software
>managed TLB (sh, mips or ppc).

>> --- /dev/null
>> +++ b/package/sysstat/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_SYSSTAT
>> +	bool "sysstat"
>> +	help
>> +	  System performance tools for the Linux operating system...

too many dots. Perhaps put your expanded description in here too.

>> diff --git a/package/sysstat/sysstat-9.0.5-Add-install-strip-rule.patch b/package/sysstat/sysstat-9.0.5-Add-install-strip-rule.patch
>> new file mode 100644
>> index 0000000..afe335f
>> --- /dev/null
>> +++ b/package/sysstat/sysstat-9.0.5-Add-install-strip-rule.patch

You sent this to upstream already, yes?

>> diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
>> new file mode 100644
>> index 0000000..cd8919f
>> --- /dev/null
>> +++ b/package/sysstat/sysstat.mk
>> @@ -0,0 +1,24 @@
>> +#############################################################
>> +#
>> +# sysstat
>> +#
>> +#############################################################
>> +
>> +SYSSTAT_VERSION = 9.0.5
>> +SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
>> +SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
>> +SYSSTAT_AUTORECONF = NO
>> +SYSSTAT_LIBTOOL_PATCH = NO
>> +SYSSTAT_INSTALL_STAGING = YES
>> +SYSSTAT_INSTALL_TARGET = YES
>> +
>> +SYSSTAT_DEPENDENCIES = uclibc

Every mention of uclibc as dependency of package/* is wrong (since
uclibc and the cross compiler et al are already deps for any target
package).
>> +
>> +# Should --disable-man-group ... WTF ?
>> +SYSSTAT_CONF_OPT = --enable-man-group
>> +
>> +EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) \
>> +			INSTALL_ISAG=n \
>> +			INSTALL_DOC=n

what's ISAG ?
INSTALL_DOC would be yes if BR2_HAVE_DOCUMENTATION.
$(if $(BR2_HAVE_DOCUMENTATION),,INSTALL_DOC=n)

thanks,
