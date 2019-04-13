From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 13 Apr 2019 02:37:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/valgrind: do not install header
 files on the target
In-Reply-To: <a04030ec-04bd-631d-48dd-7a0fb02fb215@mind.be>
References: <20190412164856.28641-1-titouan.christophe@railnova.eu>
 <a04030ec-04bd-631d-48dd-7a0fb02fb215@mind.be>
Message-ID: <c6928f61-3a30-4203-d8c1-6888e45f884c@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Indeed, I did obtain /usr/include/valgrind/* after running `make 
valgrind` alone. Sorry for the spam.

Titouan

On 4/12/19 11:12 PM, Arnout Vandecappelle wrote:
> 
> 
> On 12/04/2019 18:48, Titouan Christophe wrote:
>> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
>> ---
>>   package/valgrind/valgrind.mk | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
>> index cae14f79b9..8ee8c4585c 100644
>> --- a/package/valgrind/valgrind.mk
>> +++ b/package/valgrind/valgrind.mk
>> @@ -64,6 +64,12 @@ endef
>>   
>>   VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_INSTALL_UCLIBC_SUPP
>>   
>> +define VALGRIND_REMOVE_TARGET_HEADERS
>> +	rm -rf $(TARGET_DIR)/usr/include/valgrind
> 
>   Why? target-finalize already does rm -rf $(TARGET_DIR)/usr/include.
> 
>   Assuming this was a mistake, I've marked this patch as Rejected in patchwork.
> If there is a good reason to do this, please explain in the commit message and
> resend.
> 
>   Regards,
>   Arnout
> 
>> +endef
>> +
>> +VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_TARGET_HEADERS
>> +
>>   ifeq ($(BR2_PACKAGE_VALGRIND_MEMCHECK),)
>>   define VALGRIND_REMOVE_MEMCHECK
>>   	rm -f $(TARGET_DIR)/usr/lib/valgrind/*memcheck*
>>
