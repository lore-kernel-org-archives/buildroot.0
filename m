From: Ferdinand van Aartsen <ferdinand@ombud.nl>
Date: Fri, 21 Sep 2018 14:53:52 +0200
Subject: [Buildroot] [PATCH 1/1] Point libxslt to the correct location
 of libxml2
In-Reply-To: <20180921134318.78ba7545@windsurf>
References: <20180921101913.4366-1-ferdinand@ombud.nl>
 <20180921134318.78ba7545@windsurf>
Message-ID: <5f3afc03d1b11ebb3d8d4ceff8ef2a65@ombud.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni schreef op 2018-09-21 13:43:

> Hello,
> 
> On Fri, 21 Sep 2018 12:19:14 +0200, Ferdinand van Aartsen wrote:
> 
>> Currently libxslt configure finds native /usr/bin/xml2-config.
>> 
>> Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
> 
> Thanks for this contribution! The commit title should always follow the
> format:
> 
> <package>: <description>
> 
> so, something like:
> 
> libxslt: point to the correct location of xml2-config
> 

Yes, got it right for my second patch, where I then proceeded to forget
to add a deleted file to the commit. Ah, some days... But, I'll get 
there.

>> diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
>> index 972d5b80d5..fb5d03ab44 100644
>> --- a/package/libxslt/libxslt.mk
>> +++ b/package/libxslt/libxslt.mk
>> @@ -13,7 +13,8 @@ LIBXSLT_LICENSE_FILES = COPYING
>> LIBXSLT_CONF_OPTS = \
>> --with-gnu-ld \
>> --without-debug \
>> -    --without-python
>> +    --without-python \
>> +    --with-libxml-prefix=$(STAGING_DIR)/usr
>> LIBXSLT_CONFIG_SCRIPTS = xslt-config
>> LIBXSLT_DEPENDENCIES = host-pkgconf libxml2
>> 
>> @@ -25,7 +26,11 @@ else
>> LIBXSLT_CONF_OPTS += --without-crypto
>> endif
>> 
>> -HOST_LIBXSLT_CONF_OPTS = --without-debug --without-python 
>> --without-crypto
>> +HOST_LIBXSLT_CONF_OPTS = \
>> +    --without-debug \
>> +    --without-python \
>> +    --without-crypto \
>> +    --with-libxml-prefix=$(HOST_DIR)/usr
> 
> This should be just $(HOST_DIR), and not $(HOST_DIR)/usr.
> 
> Those two minor comments can be fixed when applying the patch, no need
> to resend just for that.
> 
> Thanks!
> 
> Thomas

I copied behaviour I saw in other .mk files. But I double-checked and
saw that host-libxslt configure detects the right xml2-config without
--with-libxml-prefix anyway. So the host part can be left as it was.

Ferdinand
