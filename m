From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 16 Feb 2016 22:34:35 +0100
Subject: [Buildroot] [PATCH 1/1] new package: jsen
In-Reply-To: <20160216222540.64878554@free-electrons.com>
References: <1455605293-1869-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
 <20160216222540.64878554@free-electrons.com>
Message-ID: <CAGm1_kviG99T0iMXBEZhb48CaW-QiOZn-ADWoutfWF42PO7Zjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atul, Thomas,

On Tue, Feb 16, 2016 at 10:25 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Atul,
>
> Thanks also for this contribution. As usual, a few comments.
>
> First, the title should be:
>
>         jsen: new package
>
> As per our convention for naming the commits for new packages.
>
> On Tue, 16 Feb 2016 12:18:13 +0530, Atul Singh wrote:
>
>> diff --git a/package/Config.in b/package/Config.in
>> index a5b31aa..cb3a3c8 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -994,6 +994,7 @@ menu "JSON/XML"
>>       source "package/expat/Config.in"
>>       source "package/ezxml/Config.in"
>>       source "package/jansson/Config.in"
>> +     source "package/jsen/Config.in"
>>       source "package/json-c/Config.in"
>>       source "package/json-glib/Config.in"
>>       source "package/jsoncpp/Config.in"
>
> I am not sure JSON/XML is the appropriate place. Yes, jsen is related
> to JSON, but I believe its main characteristic is that it is a
> Javascript library. So it should probably go under the Javascript menu,
> where we already have another package named json-javascript.
>
> Yegor, what do you think? If the number of Javascript libraries becomes
> really huge, then we can start creating sub-categories. But it is too
> early to do this now.

I agree with you, that this package should go to Javascript libraries.

>> diff --git a/package/jsen/jsen.mk b/package/jsen/jsen.mk
>> new file mode 100644
>> index 0000000..e939739
>> --- /dev/null
>> +++ b/package/jsen/jsen.mk
>> @@ -0,0 +1,32 @@
>> +################################################################################
>> +#
>> +# jsen
>> +#
>> +################################################################################
>> +
>> +JSEN_VERSION = v0.6.0
>> +JSEN_SITE = $(call github,bugventure,jsen,$(JSEN_VERSION))
>> +JSEN_LICENSE = MIT
>> +JSEN_LICENSE_FILES = LICENSE
>> +JSEN_DIRECTORIES_LIST = dist lib
>> +JSEN_ROOT_FILES_LIST = index.js
>> +
>> +define JSEN_INSTALL_TARGET_CMDS
>> +     # Install required directories
>> +     for dir in $(JSEN_DIRECTORIES_LIST); \
>> +     do \
>> +             $(INSTALL) -d $(TARGET_DIR)/usr/share/jsen/$$dir && \
>> +             $(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/jsen/$$dir \
>> +                     $(@D)/$$dir/*.* || exit 1; \
>> +     done
>> +
>> +     # Install required files from the root directory
>> +     for file in $(JSEN_ROOT_FILES_LIST); \
>> +     do \
>> +             $(INSTALL) -D -m 0644 $(@D)/$$file \
>> +                     $(TARGET_DIR)/usr/share/jsen/$$file \
>> +                     || exit 1; \
>> +     done
>> +endef
>
> I think this is more complicated than it needs to be. What about:
>
> define JSEN_INSTALL_TARGET_CMDS
>         mkdir -p $(TARGET_DIR)/usr/share/jsen
>         $(foreach d,dist lib index.js,\
>                 cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/jsen/$(sep))
> endef
>
> As a side note, I am wondering if we shouldn't create some common
> infrastructure to simplify all those packages that just need to "copy"
> stuff. Either a special variable in the generic-package infrastructure,
> or a separate "copy-package" infrastructure that provides a special
> variable that allows the package to list "stuff to be copied" and
> another listing "where to copy". But that's clearly beyond the scope of
> your patch, so don't worry about this.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
