From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 16 Jul 2015 08:34:51 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 1/1] gmock: new package
In-Reply-To: <CAHXCMML+4JgBr1msNmu8Z4Ja0FjmR1TficJq4d5nfnPXaXTg6A@mail.gmail.com>
References: <1425304883-4332-2-git-send-email-casantos@datacom.ind.br>
 <1431713119-2821-1-git-send-email-casantos@datacom.ind.br>
 <CAHXCMML+4JgBr1msNmu8Z4Ja0FjmR1TficJq4d5nfnPXaXTg6A@mail.gmail.com>
Message-ID: <1309988878.2915051.1437046491484.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Samuel Martin" <s.martin49@gmail.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Tuesday, July 14, 2015 7:09:34 AM
> Subject: Re: [Buildroot] [PATCH v2 1/1] gmock: new package

>> diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
>> new file mode 100644
>> index 0000000..3a7173e
>> --- /dev/null
>> +++ b/package/gmock/gmock.mk
>> @@ -0,0 +1,52 @@
>> +################################################################################
>> +#
>> +# gmock
>> +#
>> +################################################################################
>> +
>> +GMOCK_VERSION = 1.7.0
> According to [1], gmock version must be the same as the gtest's one,
> so maybe we should do:
> GMOCK_VERSION = $(GTEST_VERSION)
> (but, taking care of the *.mk inclusion to get GTEST_VERSION defined
> before including gmock.mk).
> 
>> +GMOCK_SOURCE = gmock-$(GMOCK_VERSION).zip
>> +GMOCK_SITE = http://googlemock.googlecode.com/files
>> +GMOCK_INSTALL_STAGING = YES
>> +GMOCK_INSTALL_TARGET = NO
>> +GMOCK_LICENSE = BSD-3c
>> +GMOCK_LICENSE_FILES = LICENSE
>> +GMOCK_DEPENDENCIES = gtest
>> +HOST_GMOCK_DEPENDENCIES = host-python
> Does this require python2? or can it work with  ?

I did not test with python3. I will give it a try and update gmock.mk accordingly.
 
>> +GMOCK_CONF_OPTS = --enable-static --disable-shared
> Why do you always force the static lib to be built? is it for the same
> reason as gtest [2]?

It's required in order to keep the GMock package completely separated from GTest. According to [3] "Google Mock can be used as a DLL, but the same DLL must contain Google Test as well.  See Google Test's README file for instructions on how to set up necessary compiler settings". 

[...]

>> +# The host package does not build anything, just installs gmock_gen stuff, so
>> +# it does not need to be a host-autotools-package.
>> +$(eval $(host-generic-package))
> 
> AFAI understand, host-gmock only install tools needed when building a
> package depending on gmock (target package).
> Since host-gmock is not a dependency of gmock, a package using gmock
> will have to depend on both gmock and host-gmock at buildtime.
> Maybe, it would be good to make gmock depends on host-gmock to ensure
> that all needed tools will be available when building a package
> depending on gmock, but without the explicitly dependency on
> host-gmock.

Yes, I will add a dependence on host-gmock.

> Please, take into account these comments and submit a new version of
> this patch if you are still interested in having it in the official
> Buildroot tree, meanwhile it'll be marked as "Change Requested" in
> patchwork.
> 
> 
> [1] https://code.google.com/p/googlemock/source/browse/trunk/README#43
> [2] http://git.buildroot.net/buildroot/tree/package/gtest/gtest.mk#n15

[3] https://code.google.com/p/googlemock/source/browse/trunk/README#276


Carlos Santos (Casantos)
DATACOM, P&D
