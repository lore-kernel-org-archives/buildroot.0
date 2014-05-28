From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 28 May 2014 21:17:19 +0200
Subject: [Buildroot] [PATCH 09/14] pkg-cmake.mk: globally disable
 BUILD_TESTING flag
In-Reply-To: <53599416.8090604@mind.be>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
 <1398293313-17580-10-git-send-email-s.martin49@gmail.com>
 <53599416.8090604@mind.be>
Message-ID: <CAHXCMMKywsSQhBpZfXLSouvLLkNcKN5wSMziT1jPdJAJc4+C_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

On Fri, Apr 25, 2014 at 12:45 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 24/04/14 00:48, Samuel Martin wrote:
>> This CMake flag is used to enable tests. It may not disable the test
>> programs from being built, but it controls the test execution.
>>
>> Since we don't care about building the tests (and usually disable them
>> when possible), make sure Buildroot won't try to run them.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>
>> ---
>> changes v1 -> v2:
>> - new patch
>> ---
>>  package/pkg-cmake.mk | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
>> index d6dadbe..e0efccb 100644
>> --- a/package/pkg-cmake.mk
>> +++ b/package/pkg-cmake.mk
>> @@ -65,6 +65,7 @@ define $(2)_CONFIGURE_CMDS
>>               -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
>>               -DCMAKE_INSTALL_PREFIX="/usr" \
>>               -DCMAKE_COLOR_MAKEFILE=OFF \
>> +             -DBUILD_TESTING=OFF \
>
>  Shouldn't this be done for the host variant as well?

Yes. Good catch!

>
>>               -DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
>
>  Not really related to this patch, but is there a specific reason why
> some options are set in the toolchainfile.cmake and some are set on the
> command line?

Here is how I see this:
- the toolchainfile.cmake is only about the toolchain/target
properties (programs and sysroot location), not about the way one
wants to build a project.
- the options on the command line describe how one want to build its
project, enabling the build of this or that sub-project, toggling
tests, if the binaries should include debug symbols, and so on and so
forth.

To me, it's kind of similar rules applied to choose between the
'select'-'depends on' statements (and the need of comments) in the
Config.in files.

Regards,

-- 
Samuel
