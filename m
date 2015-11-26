From: Abhishek Singh <abhishek.singh@imgtec.com>
Date: Thu, 26 Nov 2015 16:56:54 +0530
Subject: [Buildroot] [PATCH 1/1] cxxtest: new package
In-Reply-To: <20151126093257.6b3d26e6@free-electrons.com>
References: <1448516389-6669-1-git-send-email-Abhishek.Singh@imgtec.com>
 <20151126093257.6b3d26e6@free-electrons.com>
Message-ID: <5656EC7E.6070507@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Thursday 26 November 2015 02:02 PM, Thomas Petazzoni wrote:
> Dear Abhishek Singh,
>
> On Thu, 26 Nov 2015 11:09:49 +0530, Abhishek Singh wrote:
>
>> diff --git a/package/cxxtest/Config.in b/package/cxxtest/Config.in
>> new file mode 100644
>> index 0000000..7512e4b
>> --- /dev/null
>> +++ b/package/cxxtest/Config.in
>> @@ -0,0 +1,10 @@
>> +config BR2_PACKAGE_CXXTEST
>> +	bool "cxxtest"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	help
>> +	  CxxTest is a unit testing framework for C++
>> +
>> +	  http://cxxtest.com/
>> +
>> +comment "cxxtest needs toolchain with C++ support"
>> +	depends on !BR2_INSTALL_LIBSTDCPP
>> diff --git a/package/cxxtest/cxxtest.hash b/package/cxxtest/cxxtest.hash
>> new file mode 100644
>> index 0000000..f552e80
>> --- /dev/null
>> +++ b/package/cxxtest/cxxtest.hash
>> @@ -0,0 +1,2 @@
>> +# Locally computed:
>> +sha256	1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f4895cf7d8	cxxtest-4.4.tar.gz
>> diff --git a/package/cxxtest/cxxtest.mk b/package/cxxtest/cxxtest.mk
>> new file mode 100644
>> index 0000000..5089f92
>> --- /dev/null
>> +++ b/package/cxxtest/cxxtest.mk
>> @@ -0,0 +1,25 @@
>> +################################################################################
>> +#
>> +# cxxtest
>> +#
>> +################################################################################
>> +
>> +CXXTEST_VERSION = 4.4
>> +CXXTEST_SOURCE = cxxtest-$(CXXTEST_VERSION).tar.gz
>> +CXXTEST_SITE = http://sourceforge.net/projects/cxxtest/files/cxxtest/$(CXXTEST_VERSION)
>> +CXXTEST_LICENSE = LGPLv3
>> +CXXTEST_LICENSE_FILES = COPYING
>> +CXXTEST_INSTALL_STAGING = YES
>> +CXXTEST_INSTALL_TARGET = NO
> Is CxxTest just a set of C++ headers with no library ?

CxxTest is just set of C++ headers and source files (acting as header). It uses python infrastructure to generate cxxtestgen command.


>
>> +CXXTEST_DEPENDENCIES = host-cxxtest
>> +HOST_CXXTEST_DEPENDENCIES = host-python
> This is not needed. host-cxxtest is using host-python-package, so the
> dependency on host-python is automatically added by the
> host-python-package infrastructure.
>
>> +HOST_CXXTEST_SETUP_TYPE = setuptools
>> +HOST_CXXTEST_SUBDIR = python
>> +
>> +define CXXTEST_INSTALL_STAGING_CMDS
>> +	mkdir -p $(STAGING_DIR)/usr/include/cxxtest
>> +	cp $(@D)/cxxtest/* $(STAGING_DIR)/usr/include/cxxtest
>> +endef
>> +
>> +$(eval $(generic-package))
>> +$(eval $(host-python-package))
> I have to say it is quite strange to have the host variant of the
> package using the python package infrastructure, and the target variant
> use the generic package infra. I think it would deserve an additional
> comment in the .mk file to give a bit of context about why you're doing
> this.
>
> Thanks!
>
> Thomas
