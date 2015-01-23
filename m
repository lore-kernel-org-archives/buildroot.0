From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 23 Jan 2015 20:34:48 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-cmake: fix host-cmake-package type
In-Reply-To: <20150123183127.GD19129@free.fr>
References: <1422036622-54535-1-git-send-email-ryan.barnett@rockwellcollins.com>
 <20150123183127.GD19129@free.fr>
Message-ID: <CAHXCMMJ-QNMZEaFL-DtGE5E6G0rhqngi3TpS+VuXa6KCexwF0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Fri, Jan 23, 2015 at 7:31 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Ryan, All,
>
> On 2015-01-23 12:10 -0600, Ryan Barnett spake thusly:
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
>>
>> This is due to having too many dollar signs. The fix is to remove the
>> extra dollar sign.
>>
>> Also removing the unncessary quotes since the HOSTCC/HOSTCXX will
>> already contain quotes. This could cause an issue with make as double
>> quotes are not interpreted by make.
>>
>> Minor formatting fix too.
>>
>> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
>> Acked-by: Samuel Martin <s.martin49@gmail.com>
>> CC: Yann E. MORIN <yann.morin.1998@free.fr>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>
>> ---
>> v1 -> v2
>>  - Implemented spacing and quote concerns from Yann E. MORIN and
>>    Samuel Marin.
>>
>> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
>> ---
>>  package/pkg-cmake.mk | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
>> index 1037513..e738ba9 100644
>> --- a/package/pkg-cmake.mk
>> +++ b/package/pkg-cmake.mk
>> @@ -22,13 +22,13 @@
>>
>>  # Set compiler variables.
>>  ifeq ($(BR2_CCACHE),y)
>> -CMAKE_HOST_C_COMPILER="$(HOST_DIR)/usr/bin/ccache"
>> -CMAKE_HOST_CXX_COMPILER="$(HOST_DIR)/usr/bin/ccache"
>> -CMAKE_HOST_C_COMPILER_ARG1="$(HOSTCC_NOCCACHE)"
>> -CMAKE_HOST_CXX_COMPILER_ARG1="$(HOSTCXX_NOCCACHE)"
>> +CMAKE_HOST_C_COMPILER = "$(HOST_DIR)/usr/bin/ccache"
>> +CMAKE_HOST_CXX_COMPILER = "$(HOST_DIR)/usr/bin/ccache"

No need for double quotes here (when used, this variable is surrounded
by quotes [1]).
Otherwise, it looks good.


>> +CMAKE_HOST_C_COMPILER_ARG1 = $(HOSTCC_NOCCACHE)
>> +CMAKE_HOST_CXX_COMPILER_ARG1 = $(HOSTCXX_NOCCACHE)
>>  else
>> -CMAKE_HOST_C_COMPILER="$$(HOSTCC)"
>> -CMAKE_HOST_CXX_COMPILER="$$(HOSTCXX)"
>> +CMAKE_HOST_C_COMPILER = $(HOSTCC)
>> +CMAKE_HOST_CXX_COMPILER = $(HOSTCXX)
>>  endif
>>
>>  ################################################################################
>> --
>> 1.9.1
>>
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

[1] http://git.buildroot.net/buildroot/tree/package/pkg-cmake.mk#n110


Regards,

-- 
Samuel
