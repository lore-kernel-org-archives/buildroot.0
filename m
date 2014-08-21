From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 21 Aug 2014 15:54:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/xmlstarlet: fix static linking
In-Reply-To: <20140821152647.099b603f@free-electrons.com>
References: <1408397742-9051-1-git-send-email-romain.naour@openwide.fr>
 <20140821152647.099b603f@free-electrons.com>
Message-ID: <53F5FA0E.9030209@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 21/08/2014 15:26, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Mon, 18 Aug 2014 23:35:42 +0200, Romain Naour wrote:
>> The static linking with libxml2 and lib(e)xslt (--enable-static-libs)
>> need to be enabled when BR2_PREFER_STATIC_LIB is set.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/0fd/0fd4a65ab98a4cf3fe893c29628608a71e96ecbc/build-end.log
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  package/xmlstarlet/xmlstarlet.mk | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> Patch applied, but one comment below...
> 
>>
>> diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
>> index 16f736e..7a8451f 100644
>> --- a/package/xmlstarlet/xmlstarlet.mk
>> +++ b/package/xmlstarlet/xmlstarlet.mk
>> @@ -12,9 +12,15 @@ XMLSTARLET_LICENSE_FILES = COPYING
>>  XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
>>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
>>  
>> -XMLSTARLET_CONF_OPT += --disable-static-libs \
>> +XMLSTARLET_CONF_OPT += \
>>  	--with-libxml-prefix=${STAGING_DIR}/usr \
>>  	--with-libxslt-prefix=${STAGING_DIR}/usr \
>>  	--with-libiconv-prefix=${STAGING_DIR}/usr
>>  
>> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
>> +XMLSTARLET_CONF_OPT += --enable-static-libs
>> +else
>> +XMLSTARLET_CONF_OPT += --disable-static-libs
>> +endif
> 
> Not introduced by your patch, but I don't understand why we have
> --disable-static-libs in the else case here. When BR2_PREFER_STATIC_LIB
> is disabled, we should normally build both the shared and static
> variants of all libraries.
> 

I don't know either.
I wanted to keep the same behavior when BR2_PREFER_STATIC_LIB is enabled.

Best regards,
Romain
