From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Jun 2017 23:33:38 +0200
Subject: [Buildroot] [PATCH] squid: uClibc workaround no longer required
In-Reply-To: <7636aa0c-a897-ea70-5dd2-6f7ec435a2b4@mind.be>
References: <20170627190629.GA1589@waldemar-brodkorb.de>
 <7636aa0c-a897-ea70-5dd2-6f7ec435a2b4@mind.be>
Message-ID: <5e19be51-71fe-e295-42b9-db27ccb04bec@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-06-17 22:24, Arnout Vandecappelle wrote:
> 
> 
> On 27-06-17 21:06, Waldemar Brodkorb wrote:
>> As all librt and libpthread functions are integrated into
>> libc for a while, workaround no longer required.
>>
>> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>> ---
>>  package/squid/squid.mk | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
>> index 976ce6d..bcb3744 100644
>> --- a/package/squid/squid.mk
>> +++ b/package/squid/squid.mk
>> @@ -50,11 +50,6 @@ else
>>  SQUID_CONF_ENV += squid_cv_gnu_atomics=no
>>  endif
>>  
>> -# On uClibc librt needs libpthread
>> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
>> -SQUID_CONF_ENV += ac_cv_search_shm_open="-lrt -lpthread"
>> -endif
> 
>  In [1], Baruch wrote:

 Forgot:

[1] http://lists.busybox.net/pipermail/buildroot/2017-June/195212.html


 Regards,
 Arnout

> 
> B> package/squid/squid.mk
> B>
> B>   Needed for shm_open().
> 
>  But indeed, the -lrt is added by the configure script, this workaround was only
> needed for uClibc which used pthread functions from librt so needed to be linked
> with libpthread as well.
> 
>  Adding Baruch in Cc to double-check. Baruch, can you confirm that this can
> indeed be removed?
> 
>  For me:
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> 
>  Regards,
>  Arnout
> 
> 
>> -
>>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>>  SQUID_CONF_OPTS += --with-openssl
>>  SQUID_DEPENDENCIES += openssl
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
