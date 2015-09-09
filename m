From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Sep 2015 11:51:01 +0100
Subject: [Buildroot] [PATCH] gdb: prevent building the documentation
In-Reply-To: <55F00E88.8020208@mind.be>
References: <1441718565-24492-1-git-send-email-Vincent.Riera@imgtec.com>
 <55F00E88.8020208@mind.be>
Message-ID: <55F00F15.3080009@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On 09/09/2015 11:48 AM, Arnout Vandecappelle wrote:
> On 08-09-15 15:22, Vicente Olivert Riera wrote:
>> gdb needs makeinfo to build the documentation. Since we do not provide a
>> host-makeinfo package this will fail in any system where makeinfo is
>> missing. However, we can workaround this problem by preventing gdb to
>> build the documentation.
>>
>> Fixes:
>>
>>   http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
> 
>  Thomas prefers this solution and I agree.
> 
>  However, there is one thing missing in this patch: removing the now-redundant
> dependency on host-texinfo.
> 
>  Still, that can be done as a follow-up patch, so:

nah..., I will send a v2. Note the sed command is not indented ;-)

Regards,

Vincent.

> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> 
>  Regards,
>  Arnout
> 
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>  package/gdb/gdb.mk |    6 ++++++
>>  1 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
>> index 338de20..7a8f8c7 100644
>> --- a/package/gdb/gdb.mk
>> +++ b/package/gdb/gdb.mk
>> @@ -114,6 +114,12 @@ else
>>  GDB_CONF_OPTS += --without-zlib
>>  endif
>>  
>> +# Prevent gdb to build the documentation
>> +define GDB_DISABLE_DOC
>> +$(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
>> +endef
>> +GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC
>> +
>>  # This removes some unneeded Python scripts and XML target description
>>  # files that are not useful for a normal usage of the debugger.
>>  define GDB_REMOVE_UNNEEDED_FILES
>>
> 
> 
