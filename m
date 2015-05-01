From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 02 May 2015 00:21:09 +0200
Subject: [Buildroot] [PATCH 3/3] package/wvstreams: add argp-standalone
 as optionnal dependency
In-Reply-To: <20150501230402.57253929@free-electrons.com>
References: <1430498686-10719-1-git-send-email-romain.naour@openwide.fr>	<1430498686-10719-3-git-send-email-romain.naour@openwide.fr>
 <20150501230402.57253929@free-electrons.com>
Message-ID: <5543FC55.2040203@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 01/05/2015 23:04, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Fri,  1 May 2015 18:44:46 +0200, Romain Naour wrote:
>> This ensures the build reproducibility.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  package/wvstreams/wvstreams.mk | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
>> index bc7c5d4..3db317a 100644
>> --- a/package/wvstreams/wvstreams.mk
>> +++ b/package/wvstreams/wvstreams.mk
>> @@ -32,6 +32,11 @@ ifneq ($(BR2_STATIC_LIBS),y)
>>  WVSTREAMS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
>>  endif
>>  
>> +# wvstreams use argp.h which can be provided by argp-standalone package.
>> +ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
>> +WVSTREAMS_DEPENDENCIES += argp-standalone
>> +endif
> 
> Applied after fixing typos in the commit title and comment.

Thanks.

> 
> I wonder if we shouldn't make the argp-standalone package only
> available on !glibc builds, since glibc provides its own argp
> implementation.

I'm agree, most of packages which uses argp.h select argp-standalone only when a
uClibc toolchain is used.
Except libpthsem package which select argp-standalone unconditionally.
However, I built successfully libpthsem with a glibc toolchain and without
argp-standalone installed.

It appears that argp.h from glibc is more up to date should be preferred to
argp-standalone one.

I can do the change if you want.

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
