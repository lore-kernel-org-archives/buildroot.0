From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat, 11 Feb 2017 16:08:38 -0200 (BRST)
Subject: [Buildroot] [PATCH v3] gtest/gmock: bump to version 1.8.0
In-Reply-To: <834158db-5881-a7bc-3fd4-8ba7b9430fa5@gmail.com>
References: <1473290219-27701-1-git-send-email-casantos@datacom.ind.br>
 <d1de7bdeff46897e58c8737f6a0c646aff1571b6.1486812639.git.casantos@datacom.ind.br>
 <834158db-5881-a7bc-3fd4-8ba7b9430fa5@gmail.com>
Message-ID: <1203228930.9979096.1486836518690.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Romain Naour" <romain.naour@gmail.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
> Cc: arnout at mind.be, "Fabrice Fontaine" <fabrice.fontaine@orange.com>
> Sent: Saturday, February 11, 2017 11:50:36 AM
> Subject: Re: [PATCH v3] gtest/gmock: bump to version 1.8.0
[...]
>> --- a/Config.in.legacy
>> +++ b/Config.in.legacy
>> @@ -145,6 +145,13 @@ endif
>>  ###############################################################################
>>  comment "Legacy options removed in 2017.02"
>>  
>> +config BR2_PACKAGE_GMOCK
>> +	bool "gmock removed"
>> +	select BR2_PACKAGE_GTEST
>> +	select BR2_PACKAGE_GTEST_GMOCK
> 
> missing select BR2_LEGACY

Done

[...]
>> +config BR2_PACKAGE_GTEST_GMOCK
>> +	bool "gmock"
>> +	help
>> +	  Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
>> +	  specifics in mind, Google C++ Mocking Framework (or Google Mock for
>> +	  short) is a library for writing and using C++ mock classes.
>> +
>> +	  Google Mock:
>> +
>> +	    * lets you create mock classes trivially using simple macros,
>> +	    * supports a rich set of matchers and actions,
>> +	    * handles unordered, partially ordered, or completely ordered
>> +	      expectations,
>> +	    * is extensible by users, and
>> +	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
>> +	      Symbian.
>> +
>> +	  There are both host and target packages. The target one has include
>> +	  files required to compile the tests and the static libraries required
>> +	  to link/run them. The host package installs gmock_gen, a Python script
>> +	  used to generate code mocks.
> 
> "The help text should be wrapped to fit 72 columns." see [1]

Done.

[...]
>> --- a/package/gtest/gtest.mk
>> +++ b/package/gtest/gtest.mk
>> @@ -4,13 +4,30 @@
>>  #
>>  ################################################################################
>>  
>> -# Make sure this remains the same version as the gmock one
>> -GTEST_VERSION = release-1.7.0
>> -GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION))
>> +GTEST_VERSION = 1.8.0
>> +GTEST_VERSION_TAG = release-$(GTEST_VERSION)
> 
> Why are you adding GTEST_VERSION_TAG ?
> It seems ok to use "GTEST_VERSION = release-1.8.0" no ?

To have a cleaner <pkg>_VERSION variable (and archive name). Previous
gtest/gmock archives were saved as "gtest-Z.Y.Z.zip" but it changed
when the package started to be downloaded from GitHub and started to
be called "gtest-release-1.7.0.tar.gz", including the "release" prefix
included in the tag, which is superfluous.

[...]
>> +HOST_GTEST_GMOCK_PYTHONPATH = \
>> +        $(HOST_DIR)/usr/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
> 
> Indent with one Tab.

Done.

>> +# By default, build gmock and gtest
>> +ifneq ($(BR2_PACKAGE_GTEST_GMOCK),y)
> 
> Try using the "positive" logic:
> ifeq ($(BR2_PACKAGE_GTEST_GMOCK),)

Done

[...]
>> +define HOST_GTEST_INSTALL_CMDS
>> +	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
> 
> Same for gmock_gen.py.

Do you mean -m 0644? No, this one must be executable.

> Otherwise:
>  Reviewed-by: Romain Naour <romain.naour@gmail.com>
> 
> Best regards,
> Romain
> 
>> +		$(HOST_DIR)/usr/bin/gmock_gen.py
>> +	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
>> +	cp -rp $(@D)/googlemock/scripts/generator/cpp \
>> +		$(HOST_GTEST_GMOCK_PYTHONPATH)
>> +endef
>> +
>>  $(eval $(cmake-package))
>> +# The host package does not build anything, just installs gmock_gen stuff, so
>> +# it does not need to be a host-cmake-package.
>> +$(eval $(host-generic-package))
>> diff --git a/package/gtest/gtest.pc b/package/gtest/gtest.pc
>> index b7a8aa4..594e79d 100644
>> --- a/package/gtest/gtest.pc
>> +++ b/package/gtest/gtest.pc
>> @@ -5,7 +5,7 @@ includedir=${prefix}/include
>>  
>>  Name: gtest
>>  Description: Google C++ Testing Framework
>> -Version: 1.7.0
>> +Version: 1.8.0
>>  Libs: -L${libdir} -lgtest
>>  Libs.private: -lpthread
>>  Cflags: -I${includedir}



Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
