From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Thu, 1 Aug 2019 17:19:36 -0700
Subject: [Buildroot] Makefile: follow symlinks when excluding files from
 being stripped.
In-Reply-To: <831b364c-6a4a-e606-4868-165d997c4d60@mind.be>
References: <20190801210542.40390-1-umesh.nerlige.ramappa@intel.com>
 <831b364c-6a4a-e606-4868-165d997c4d60@mind.be>
Message-ID: <20190802001936.GA66339@orsosgc001.amr.corp.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 02, 2019 at 12:22:46AM +0200, Arnout Vandecappelle wrote:
> Hi Umesh,
>
>On 01/08/2019 23:05, Umesh Nerlige Ramappa wrote:
>> In BR2_STRIP_EXCLUDE_FILES="libfoo.so" libfoo.so is mostly a symlink
>> pointing to the actual library file. The actual library file is still
>> stripped. While specifying the actual library file as libfoo.so.x.x
>> will work just fine, a user of buildroot need not know what version
>> of the library is being picked.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 9cce934990..8f689401ba 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -624,7 +624,7 @@ STRIP_FIND_COMMON_CMD = \
>>  		-prune -o \
>>  	) \
>>  	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
>> -		-not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) )
>> +		-not -follow \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) )
>
> This will not do what you want. I don't fully understand how find parses it,
>but it has the effect of removing everything. Putting the -follow earlier also
>doesn't have the desired effect, because it jsut prints the dereferenced symlink
>instead of the symlink itself, and it will be printed twice because of that.

My bad. I just checked if the relevant files were not stripped, but 
looks like it did remove everything like you said. I guess I will need 
to specify the files explicitly for now.

Regards,
Umesh

>
> The problem is: if you have a symlink foo.so -> foo.so.1, when 'find'
>encounters foo.so.1, there is no way to detect that there also exists a symlink
>foo.so to it. So any kind of exclude of foo.so is not going to work.
>
> Regards,
> Arnout
>
>>
>>  # Regular stripping for everything, except libpthread, ld-*.so and
>>  # kernel modules:
>>
