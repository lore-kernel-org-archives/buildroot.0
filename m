From: Andreas Naumann <dev@andin.de>
Date: Tue, 5 Mar 2019 19:51:52 +0100
Subject: [Buildroot] [PATCH 1/1] core/pkg-infra: Fix package files
 statistics for parallel build
In-Reply-To: <13651_1551800345_5C7E9819_13651_366_1_20190305153902.GH2808@r-lnx-nyma7486-2>
References: <20190305144216.13738-1-anaumann@ultratronik.de>
 <13651_1551800345_5C7E9819_13651_366_1_20190305153902.GH2808@r-lnx-nyma7486-2>
Message-ID: <67a3d40b-3c6c-5760-fb88-fb3c2974af44@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

...

>>
>> Of course this solution adds a dependency on flock. However flock is
>> part of util-linux which probably is a dependency of other buildroot
>> prerequisites anyway.
> 
> We already use flock in the download infra, so that's OK.

Ah, nice.

>> Also, even though this solution has a somewhat hacky feel to me, it does
>> work for both per-package and standard sequential builds. When converting
>> to per-package for good, the statistics gathering code could probably
>> be simplified because, well, all the files are installed isolated folders
>> which contents should be easier to compare before/after.
> 
> Well, I was going to suggest just that: create the lists in the
> per-package directory, so you won't have the race to begin with.
> 
> Then, at the end of the build, when all the target/ directories (ditto
> host) are gathere into one, then do so for all the individual package
> file lists too.

Yes I was going to do that but realized it would lead to different code 
for the same thing. And as far as I understood, the per-package stuff is 
planned as an option. Maintaining two implementations felt less ideal, 
even if one of them turns out more straightforward (which has yet to be 
proven).

> 
> If, as you seem to suggest, this also simplifies the code, then bonus
> point for you! ;-)

Well this was theory, I havn't really thought it out yet. As I wrote 
above, I'd leave that until per-package is merged and proves stable.


best regards,
Andreas



> 
> Regards,
> Yann E. MORIN.
> 
>>   package/pkg-generic.mk | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 6d4442b824..0f875736d6 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -64,20 +64,22 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>>   # $(3): suffix of file  (optional)
>>   define step_pkg_size_inner
>>   	@touch $(BUILD_DIR)/.files-list$(3).stat
>> -	@touch $(BUILD_DIR)/packages-file-list$(3).txt
>> -	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
>> +	exec 3>$(BUILD_DIR)/packages-file-list$(3).txt; \
>> +	flock -x 3; \
>> +	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt; \
>>   	cd $(2); \
>>   	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
>> -		| LC_ALL=C sort > $(BUILD_DIR)/.files-list$(3).new
>> +		| LC_ALL=C sort > $(BUILD_DIR)/.files-list$(3).new; \
>>   	LC_ALL=C comm -13 \
>>   		$(BUILD_DIR)/.files-list$(3).stat \
>>   		$(BUILD_DIR)/.files-list$(3).new \
>> -		> $($(PKG)_BUILDDIR)/.files-list$(3).txt
>> +		> $($(PKG)_BUILDDIR)/.files-list$(3).txt; \
>>   	sed -r -e 's/^[^,]+/$(1)/' \
>>   		$($(PKG)_BUILDDIR)/.files-list$(3).txt \
>> -		>> $(BUILD_DIR)/packages-file-list$(3).txt
>> +		>> $(BUILD_DIR)/packages-file-list$(3).txt; \
>>   	mv $(BUILD_DIR)/.files-list$(3).new \
>> -		$(BUILD_DIR)/.files-list$(3).stat
>> +		$(BUILD_DIR)/.files-list$(3).stat; \
>> +	exec 3>&-
>>   endef
>>   
>>   define step_pkg_size
>> -- 
>> 2.21.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
