From: Valentine Barshak <gvaxon@gmail.com>
Date: Mon, 08 Oct 2012 02:39:33 +0400
Subject: [Buildroot] [PATCH v2] sylpheed: Fix includedir
In-Reply-To: <50716305.9040802@mind.be>
References: <1349549706-24827-1-git-send-email-gvaxon@gmail.com>
 <50716305.9040802@mind.be>
Message-ID: <507204A5.3040708@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/2012 03:09 PM, Arnout Vandecappelle wrote:
> On 06/10/12 20:55, Valentine Barshak wrote:
>> The sylpheed headers are installed to the target directory,
>> creating full staging directory path in the target rootfs,
>> which is wrong.
>> This happens because the headers are installed to
>> $(DESTDIR)$(includedir), while DESTDIR is $(TARGET_DIR)
>> and includedir is set to $(STAGING_DIR)/usr/include in the
>> SYLPHEED_CONF_OPT.
>>
>> The includedir was set to staging include because sylpheed
>> incorrectly adds includedir to its include path, and does
>> not build with the default includedir set to /usr/include
>> in the target filesystem.
>>
>> This removes includedir setting and also removes it from
>> include paths in Makefiles. The same approach is used
>> in the OE.
>>
>> Signed-off-by: Valentine Barshak<gvaxon@gmail.com>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>   with a small addition:
>
>> ---
>>   package/sylpheed/sylpheed.mk | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
>> index 451c4de..100fd67 100644
>> --- a/package/sylpheed/sylpheed.mk
>> +++ b/package/sylpheed/sylpheed.mk
>> @@ -9,11 +9,18 @@ SYLPHEED_VERSION =
>> $(SYLPHEED_VERSION_MAJOR).$(SYLPHEED_VERSION_MINOR)
>>   SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
>>   SYLPHEED_SITE =
>> http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
>>
>> -SYLPHEED_CONF_OPT = --disable-gtkspell \
>> -                    --includedir=$(STAGING_DIR)/usr/include
>> +SYLPHEED_CONF_OPT = --disable-gtkspell
>>
>>   SYLPHEED_DEPENDENCIES = host-pkg-config libgtk2
>>
>> +define SYLPHEED_PRECONFIGURE
>> +    for i in $$(find $(@D) -name "Makefile*"); do \
>> +        sed -i 's:-I$$(includedir)::g' $$i; \
>> +    done
>> +endef
>
>   Put a small explanatory comment here, e.g.:
>
> # Remove the -I$(includedir) from the Makefile, because it would
> # refer to the host's /usr/include.
>
>

Thanks!
I've added the comment and slightly modified the commit log.
Will send v3 in a bit.

Thanks,
Val.

>   Regards,
>   Arnout
