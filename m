From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 23 Jan 2015 17:08:59 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-cmake: fix host-cmake-package type
In-Reply-To: <20150123155043.GB19129@free.fr>
References: <1421945596-53762-1-git-send-email-ryan.barnett@rockwellcollins.com>
 <20150123155043.GB19129@free.fr>
Message-ID: <CAHXCMM+_2CWy6-fAOM8C3WS0TV0x_=uZTqTxDfWnVOKwfAUCtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Ryan, all,

On Fri, Jan 23, 2015 at 4:50 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Ryan, All,
>
> On 2015-01-22 10:53 -0600, Ryan Barnett spake thusly:
>> When trying to compile a host-cmake-package type such as host-cdrkit,
>> an error happens in regards to HOSTCC and HOSTCXX not being found.
>>
>>   /bin/sh: HOSTCC: command not found
>>   /bin/sh: HOSTCXX: command not found
>>
>> This due to the fact that the environment is incorrectly configured by
>> having the following:
>>
>>   -DCMAKE_C_COMPILER=""$(HOSTCC)"" -DCMAKE_CXX_COMPILER=""$(HOSTCXX)""
>
> As you may have noticed, the double-quaotes are doubled...
>
>> This is due to having too many dollar signs. The fix is to remove the
>> extra dollar sign.
>>
>> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
>> ---
>>  package/pkg-cmake.mk | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
>> index 1037513..eac244f 100644
>> --- a/package/pkg-cmake.mk
>> +++ b/package/pkg-cmake.mk
>> @@ -27,8 +27,8 @@ CMAKE_HOST_CXX_COMPILER="$(HOST_DIR)/usr/bin/ccache"
>>  CMAKE_HOST_C_COMPILER_ARG1="$(HOSTCC_NOCCACHE)"
>>  CMAKE_HOST_CXX_COMPILER_ARG1="$(HOSTCXX_NOCCACHE)"
>>  else
>> -CMAKE_HOST_C_COMPILER="$$(HOSTCC)"
>> -CMAKE_HOST_CXX_COMPILER="$$(HOSTCXX)"
>> +CMAKE_HOST_C_COMPILER="$(HOSTCC)"
>> +CMAKE_HOST_CXX_COMPILER="$(HOSTCXX)"
>
> That's because of here; in Makefile syntax, double-quotes are not
> interpreted by make, and are part of the value.
>
> So, you should also drop the double-quotes here.

While you are at cleaning this, adding 1 space before and after "="
will be good.

Regards,

-- 
Samuel
