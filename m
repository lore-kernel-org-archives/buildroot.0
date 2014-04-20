From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 20 Apr 2014 11:04:09 +0200
Subject: [Buildroot] [PATCH] pkg-cmaketargets.mk: do not hardcode
 absolute path in toolchainfile.cmake
In-Reply-To: <531429C3.80801@mind.be>
References: <1393694162-21952-1-git-send-email-s.martin49@gmail.com>
 <531429C3.80801@mind.be>
Message-ID: <CAHXCMMKkF2h1g3-+jqwDmQ7VddTd5qa=_hWaagc17H5AewQHDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

On Mon, Mar 3, 2014 at 8:05 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 01/03/14 18:16, Samuel Martin wrote:
>> The patch allows sharing or moving the toolchains.
>>
>> This is a step toward making the toolchain/sdk relocatable.
>>
>> Closes #6818
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> Cc: Uwe Strempel <u.strempel@googlemail.com>
>> ---
>>  package/pkg-cmake.mk | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
>> index f7e454b..4effb15 100644
>> --- a/package/pkg-cmake.mk
>> +++ b/package/pkg-cmake.mk
>> @@ -159,16 +159,18 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
>>  $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
>>       @mkdir -p $(@D)
>>       @echo -en "\
>> +     get_filename_component(_HOST_DIR \$${CMAKE_CURRENT_LIST_FILE} PATH)\n\
>> +     set(_HOST_DIR \"\$${_HOST_DIR}/../../..\")\n\
>>       set(CMAKE_SYSTEM_NAME Linux)\n\
>> -     set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
>> -     set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
>> +     set(CMAKE_C_COMPILER \"\$${_HOST_DIR}/$(subst $(HOST_DIR)/,,$(TARGET_CROSS))gcc\")\n\
>
>  Wouldn't it be more natural to write
>
> set(CMAKE_C_COMPILER \"$(subst $(HOST_DIR)/,\$${_HOST_DIR}/,$(TARGET_CC_NOCCACHE)\")\n\
>
> ?

Good point! Will do.

>
>  And BTW this entire piece of code could benefit from a
> change in quoting style (' instead of ") and using printf
> instead of echo -en. But that's of course unrelated :-)

Agree for printf, but the quoting seems not so easy...
I run some tests [1], it seems that changing the quoting style may not work.
BTW, any tip about how to change/fix this is more than welcome.

Regards,

[1] http://code.bulix.org/9v6wcw-86080


-- 
Samuel
