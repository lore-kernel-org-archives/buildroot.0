From: Mario Lang <mlang@blind.guru>
Date: Fri, 29 Dec 2017 20:22:22 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/brltty: explicitly check if
 ioperm is available
In-Reply-To: <20171229171959.419ba4ae@windsurf.lan> (Thomas Petazzoni's
 message of "Fri, 29 Dec 2017 17:19:59 +0100")
References: <20171229140641.13882-1-mlang@blind.guru>
 <20171229140641.13882-2-mlang@blind.guru>
 <20171229171959.419ba4ae@windsurf.lan>
Message-ID: <87o9mh9w5t.fsf@home.blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> Hello,
>
> On Fri, 29 Dec 2017 15:06:41 +0100, Mario Lang wrote:
>
>> +diff --git a/configure.ac b/configure.ac
>> +index 5e94d33bd..07119dd9f 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -1446,7 +1446,9 @@ BRLTTY_ARG_PACKAGE([ports], [I/O ports], [], [dnl
>> +       ports_package="kfreebsd"
>> +       ;;
>> +    linux*)
>> +-      ports_package="glibc"
>> ++      AC_CHECK_FUNC([ioperm], [
>> ++         ports_package="glibc"
>
> This seems weird. What happens then when ioperm() is not available ?
> Which ports_package is used ?

"none", which is exactly what we want.  Patch already accepted by upstream.
The "ports package" is to support Braille displays connected via the
parallel port, which basically no longer exist these days.  All relevant
models work via USB, Bluetooth or plain serial ports these days.

>> -BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>> +BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf
>>  
>>  BRLTTY_CONF_OPTS = \
>>  	--disable-java-bindings \
>> @@ -24,6 +24,12 @@ BRLTTY_CONF_OPTS = \
>>  	--without-mikropuhe --without-speechd --without-swift \
>>  	--without-theta --without-viavoice
>>  
>> +define BRLTTY_AUTOCONF
>> +	cd $(BRLTTY_SRCDIR) && $(AUTOCONF)
>> +endef
>> +
>> +BRLTTY_PRE_CONFIGURE_HOOKS += BRLTTY_AUTOCONF
>
> Please use BRLTTY_AUTORECONF = YES instead.

brltty doesn't work with autoreconf.  It has its own autogen script,
which basically does some dependency calculations (with tcl, a dep I'd
like to avoid) and a plain autoconf.  So I copied that behaviour, since
autoreconf fails with problems about autoheaders.

-- 
CYa,
  ?????
