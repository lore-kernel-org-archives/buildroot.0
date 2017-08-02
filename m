From: RJ Ascani <rj.ascani@gmail.com>
Date: Wed, 2 Aug 2017 16:45:01 -0700
Subject: [Buildroot] [PATCH v2] azmq: Add new package
In-Reply-To: <9c1bfb84-9025-9941-dd0f-8a6c0a250940@mind.be>
References: <20170721191140.29980-1-rj.ascani@gmail.com>
 <20170728180459.32667-1-rj.ascani@gmail.com>
 <9c1bfb84-9025-9941-dd0f-8a6c0a250940@mind.be>
Message-ID: <CAD58DeaGcy5S0e4RLG770EahiS4nZgV3d1kBw5SV52YM2iTQyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thank you so much for the review. I'm not in any rush, so making it
into 2017.08 is not a necessity.

On Wed, Aug 2, 2017 at 3:29 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi RJ,
>
>  I'm not sure if we can still get this in 2017.08 since I have a few comments
> that I can't fix up myself...
>
> On 28-07-17 20:04, RJ Ascani wrote:
>> The azmq library provides Boost Asio style bindings for ZeroMQ. This
>> library is built on top of ZeroMQ's standard C interface and is intended
>> to work well with C++ applications which use the Boost libraries in
>> general, and Asio in particular.
>>
>> Signed-off-by: RJ Ascani <rj.ascani@gmail.com>
>
>  We require the Signed-off-by to be a full, real name because it's a legal
> statement. It is a short way for you to assert that you are entitled to
> contribute the patch under buildroot's GPL license.  See
> http://elinux.org/Developer_Certificate_Of_Origin for more details.
>
>  The Author should be the same name, of course.
>

Just to be clear, it's my initials that are the issue? I've gone by RJ
my entire life so I didn't realize that would be an issue.

>
> [snip]
>> +From d960f93fb52e373f76cfedbee5f4fb0c5276856a Mon Sep 17 00:00:00 2001
>> +From: RJ Ascani <rj.ascani@gmail.com>
>> +Date: Thu, 20 Jul 2017 15:53:40 -0700
>> +Subject: [PATCH] Conditionally disable test and doc builds
>
>  What is the upstream status of this patch? Please send it upstream if you
> didn't already do so.
>

Actually, I probably should have elaborated a bit more in the
explanation here. The reason I added this patch was actually because
there is a bug in building the tests under buildroot. Upstream is
missing a library that needs to be linked in their test
CMakeLists.txt. Since buildroot already forcibly tries to disable docs
and tests for cmake packages, I assumed it would be better to just
have the tests not even be built for buildroot. I'm not certain I
could get those conditionals into upstream, but I'm fairly certain I
could get the test bug patched upstream. Would it be preferable to: 1)
patch the actual test bug and let the tests build or 2) disable the
building of the tests entirely?

>> +
>> +Signed-off-by: RJ Ascani <rj.ascani@gmail.com>
>> +---
>> + CMakeLists.txt | 12 +++++++++---
>> + 1 file changed, 9 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index 5b5b9cc..97006a4 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -49,7 +49,9 @@ include_directories(${Boost_INCLUDE_DIRS}
>> +                     ${ZeroMQ_INCLUDE_DIRS}
>> +                     ${PROJECT_SOURCE_DIR})
>> +
>> +-enable_testing()
>> ++if (BUILD_TESTING)
>
>  I would expect that upstream would require BUILD_TESTING to be set to ON by
> default. Also, I think BUILD_TESTS is more common, but I have no data to back
> that up.

BUILD_TESTING is an actually a built-in for CTest (CMake's testing module).

>
>> ++    enable_testing()
>> ++endif()
>> +
>> + macro(add_catch_test name)
>> +     if (TEST_REPORT_FORMAT)
>> +@@ -59,8 +61,12 @@ macro(add_catch_test name)
>> +     endif()
>> + endmacro()
>> +
>> +-add_subdirectory(test)
>> +-add_subdirectory(doc)
>> ++if (BUILD_TESTING)
>> ++    add_subdirectory(test)
>> ++endif()
>> ++if (BUILD_DOC)
>
>  Same here, of course.
>
>> ++    add_subdirectory(doc)
>> ++endif()
>> +
>> + install(DIRECTORY ${PROJECT_SOURCE_DIR}/azmq
>> +         DESTINATION include)
> [snip]
>> index 000000000..d3993f498
>> --- /dev/null
>> +++ b/package/azmq/azmq.hash
>> @@ -0,0 +1,3 @@
>> +# Locally calculated
>> +# https://github.com/zeromq/azmq/archive/v1.0.tar.gz
>> +sha256 c204c731bcb7810ca3a2c5515e88974ef2ff8d0589e60a897dc238b369180e7b  azmq-v1.0.tar.gz
>> diff --git a/package/azmq/azmq.mk b/package/azmq/azmq.mk
>> new file mode 100644
>> index 000000000..427ad0f5b
>> --- /dev/null
>> +++ b/package/azmq/azmq.mk
>> @@ -0,0 +1,18 @@
>> +################################################################################
>> +#
>> +# azmq
>> +#
>> +################################################################################
>> +
>> +AZMQ_VERSION = v1.0
>> +AZMQ_SITE = $(call github,zeromq,azmq,$(AZMQ_VERSION))
>> +AZMQ_DEPENDENCIES = boost zeromq
>> +AZMQ_LICENSE = BSL-1.0
>> +AZMQ_LICENSE_FILES = LICENSE-BOOST_1_0
>> +
>> +# AZMQ is a header only library, so it does not need to be installed on the
>> +# target.
>> +AZMQ_INSTALL_STAGING = YES
>> +AZMQ_INSTALL_TARGET = NO
>
>  So I would expect that we would need to pass an explicit -DBUILD_TESTING=OFF
> and -DBUILD_DOCS=OFF
>

Those are already added to the cmake configure command from
package/pkg-cmake.mk. Are you saying we should also add them as an
explicit option in AZMQ_CONF_OPTS?

>  Regards,
>  Arnout
>
>> +
>> +$(eval $(cmake-package))
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

Thanks again!
-RJ
