From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Wed, 15 Oct 2014 16:14:02 -0400
Subject: [Buildroot] [PATCH v2] cppunit: Added package
In-Reply-To: <543E925A.20604@mind.be>
References: <1413317342-4612-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <543E925A.20604@mind.be>
Message-ID: <543ED58A.4080406@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thank you for your review.

On 10/15/2014 11:27 AM, Arnout Vandecappelle wrote:
>  Hi Sebastien,
>
>  Thank you for your contribution. I still have a few more comments.
>
> On 14/10/14 22:09, Sebastien Bourdelin wrote:
>> CppUnit is the C++ port of the famous JUnit framework for unit testing.
>> Test output is in XML or text format for automatic testing and GUI
>> based for supervised tests.
>>
>> http://www.freedesktop.org/wiki/Software/cppunit/
>> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
>  We normally leave an empty line between the commit message itself and the SOB.

My bad.

>
>> ---
>> Changes v1 -> v2:
>>  - used AUTORECONF option (suggested by romain.naour at openwide.fr)
>>  - removed useless CONFIGURE_CMDS (suggested by romain.naour at openwide.fr)
>> ---
>>  package/Config.in          |  1 +
>>  package/cppunit/Config.in  | 12 ++++++++++++
>>  package/cppunit/cppunit.mk | 14 ++++++++++++++
>>  3 files changed, 27 insertions(+)
>>  create mode 100644 package/cppunit/Config.in
>>  create mode 100644 package/cppunit/cppunit.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 19bb9bf..407f24f 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -838,6 +838,7 @@ menu "Other"
>>  	source "package/clapack/Config.in"
>>  	source "package/classpath/Config.in"
>>  	source "package/cppcms/Config.in"
>> +	source "package/cppunit/Config.in"
>>  	source "package/eigen/Config.in"
>>  	source "package/elfutils/Config.in"
>>  	source "package/fftw/Config.in"
>> diff --git a/package/cppunit/Config.in b/package/cppunit/Config.in
>> new file mode 100644
>> index 0000000..91700b8
>> --- /dev/null
>> +++ b/package/cppunit/Config.in
>> @@ -0,0 +1,12 @@
>> +config BR2_PACKAGE_CPPUNIT
>> +	bool "cppunit"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	help
>> +	  CppUnit is the C++ port of the famous JUnit framework for unit testing.
>> +	  Test output is in XML or text format for automatic testing and GUI
>> +	  based for supervised tests.
>> +
>> +	  http://www.freedesktop.org/wiki/Software/cppunit/
>> +
>> +comment "cppunit needs a toolchain w/ C++"
>> +	depends on !BR2_INSTALL_LIBSTDCPP
>> diff --git a/package/cppunit/cppunit.mk b/package/cppunit/cppunit.mk
>> new file mode 100644
>> index 0000000..4447537
>> --- /dev/null
>> +++ b/package/cppunit/cppunit.mk
>> @@ -0,0 +1,14 @@
>> +################################################################################
>> +#
>> +# cppunit
>> +#
>> +################################################################################
>> +
>> +CPPUNIT_VERSION = cppunit-1.13.2
>> +CPPUNIT_SITE = git://anongit.freedesktop.org/git/libreoffice/cppunit/
>  We prefer to use the release tarball:
>
> CPPUNIT_VERSION = 1.13.2
> CPPUNIT_SITE = http://dev-www.libreoffice.org/src
>
>  If that doesn't work for some reason, please add a comment why not.
>
>  Also, it would be nice if you could add a hash file with the upstream md5 and
> with a locally calculated sha256 or sha512. The hash file is optional, but if
> upstream provides an md5 it's nice to have it.

Ok, i will do that.

>
>> +CPPUNIT_INSTALL_STAGING = YES
>  I'm writing this mail while offline so I can't check myself, but IIRC cppunit
> only installs a static library (.a). Therefore, there is nothing to install in
> the target directory so you could add
>
> # Static library only
> CPPUNIT_INSTALL_TARGET = NO
>
>  Note that this is completely optional, though, because we anyway remove all .a
> files in the finalize step.

cppunit also install shared library (.so)

>
>> +CPPUNIT_LICENSE = GPLv2
>  Is it really v2 only and not v2+? To check that, look at the source files, in
> the header they usually have something like "blah blah version 2 (or later)".

You are right, the correct licence is LGPLv2.1+
 
>> +CPPUNIT_LICENSE_FILES = COPYING
>> +CPPUNIT_AUTORECONF = YES
>  With the release tarball, you probably don't need that.

Right.

>
>  Regards,
>  Arnout
>

Thanks Arnout, i will send a v3.
Regards.

Sebastien Bourdelin.

>> +
>> +$(eval $(autotools-package))
>>
>
