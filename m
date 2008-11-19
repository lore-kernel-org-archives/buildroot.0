From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Nov 2008 13:27:40 +0100
Subject: [Buildroot] [PATCH] small patches (was: skeleton patch)
In-Reply-To: <e4c675870811190421r6612519ek47ef41d9f7434890@mail.gmail.com>
References: <e4c675870811181121r169f9fcej6f8c2470bb46d34d@mail.gmail.com>
	<e4c675870811190421r6612519ek47ef41d9f7434890@mail.gmail.com>
Message-ID: <20081119122740.GB4797@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 19, 2008 at 01:21:48PM +0100, Roberto A. Foglietta wrote:
>2008/11/18 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
>> Hi
>>
>>  a) mkdir -p does not hurt but probably it is optional
>>  b) s,cp -a,cp -af, because overwriting is necessary
>>
>> --- package/freetype/freetype.mk        (revision 24038)
>> +++ package/freetype/freetype.mk        (working copy)
>> @@ -15,7 +15,8 @@
>>  $(eval $(call AUTOTARGETS,package,freetype))
>>
>>  $(FREETYPE_HOOK_POST_BUILD):
>> -       -cp -a $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib/
>> +       mkdir -p $(TARGET_DIR)/usr/lib
>> +       cp -af $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib
>>        $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfreetype.so
>>        $(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g"
>> $(FREETYPE_DIR)/builds/unix/freetype-config
>>        $(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g"
>> $(FREETYPE_DIR)/builds/unix/freetype-config
>>
>
> Patch attached
>
>-- 
>/roberto

>Index: package/freetype/freetype.mk
>===================================================================
>--- package/freetype/freetype.mk	(revision 24099)
>+++ package/freetype/freetype.mk	(working copy)
>@@ -15,7 +15,8 @@
> $(eval $(call AUTOTARGETS,package,freetype))
> 
> $(FREETYPE_HOOK_POST_BUILD):
>-	-cp -a $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib/
>+	mkdir -p $(TARGET_DIR)/usr/lib
>+	cp -af $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib

This will not work properly for a number of host systems (see ML archives)
Either use "cp -dpRf" or the preferred $(INSTALL), like:

	$(INSTALL) -d $(TARGET_DIR)/usr/lib
	$(INSTALL) -m0644 $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib/

> 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfreetype.so
> 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(FREETYPE_DIR)/builds/unix/freetype-config
> 	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(FREETYPE_DIR)/builds/unix/freetype-config
