From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 28 Aug 2014 23:50:13 +0200
Subject: [Buildroot] [PATCH 3/3] package/libarchive: fix linking issue
 with uClibc
In-Reply-To: <20140825230356.7bebde3b@free-electrons.com>
References: <1408899186-28542-1-git-send-email-romain.naour@openwide.fr>	<1408899186-28542-3-git-send-email-romain.naour@openwide.fr>
 <20140825230356.7bebde3b@free-electrons.com>
Message-ID: <53FFA415.3080904@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 25/08/2014 23:03, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Sun, 24 Aug 2014 18:53:06 +0200, Romain Naour wrote:
>> With uClibc the dynamic linking loader functions needs
>> to be linked with -ldl
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/6af/6af140618b274536238b062635d493709905c8f6/build-end.log
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  package/libarchive/libarchive.mk | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
>> index 8c6951d..ce3355c 100644
>> --- a/package/libarchive/libarchive.mk
>> +++ b/package/libarchive/libarchive.mk
>> @@ -68,4 +68,8 @@ else
>>  LIBARCHIVE_CONF_OPT += --without-zlib
>>  endif
>>  
>> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
>> +LIBARCHIVE_CONF_ENV += LIBS="-ldl"
>> +endif
>> +
>>  $(eval $(autotools-package))
> 
> I don't think this is the right fix, for several reasons:
> 
>  *) The problem only occurs due to the fact that bsdcpio and bsdtar are
>     by default linked statically. When BR2_PREFER_STATIC_LIB is
>     disabled, we should pass --enable-bsdtar=shared and
>     --enable-bsdcpio=shared to ensure they are dynamically linked. This
>     fixes the problem in the dynamic linking case.
> 
>  *) The problem is caused by the dependency of OpenSSL on libdl. So
>     there is no need to always link against libdl: it should only be
>     done when BR2_PREFER_STATIC_LIB=y and OpenSSL is enabled.
> 
>  *) I don't see why the problem would be uClibc specific.
> 
> Generally speaking, it's annoying to have to teach all packages
> using OpenSSL that they should link against -ldl when doing static
> linking. It would be so much better if everyone was using pkg-config...
> 

Ok, I misunderstood the problem, thanks for your explanations.
I'll try to fix this issue before the release.

Best regards,
Romain
