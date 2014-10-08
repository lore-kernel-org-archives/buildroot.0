From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 8 Oct 2014 15:57:28 +0100
Subject: [Buildroot] [PATCH v2] package/trinity: New package
In-Reply-To: <54355087.3090108@imgtec.com>
References: <1412763762-58202-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141008145331.GC3117@waldemar-brodkorb.de> <54355087.3090108@imgtec.com>
Message-ID: <543550D8.7000207@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, I forgot to add the URL:

   http://patchwork.ozlabs.org/patch/396775/

On 10/08/2014 03:56 PM, Vicente Olivert Riera wrote:
> Dear Waldemar Brodkorb,
>
> On 10/08/2014 03:53 PM, Waldemar Brodkorb wrote:
>> Hi,
>>
>> may be I missed it in v1, is there a reason for
>> depends on !BR2_TOOLCHAIN_USES_UCLIBC ?
>
> This is the v1 patch. You can see the reason there.
>
> Regards,
>
> --
> Vincent
>
>> May be you can add a comment about it.
>>
>> best regards
>>    Waldemar
>>
>>
>> Vicente Olivert Riera wrote,
>>
>>> Adding the Trinity Linux System call fuzz tester.
>>>
>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>> ---
>>>   package/Config.in          |    1 +
>>>   package/trinity/Config.in  |   10 ++++++++++
>>>   package/trinity/trinity.mk |   31 +++++++++++++++++++++++++++++++
>>>   3 files changed, 42 insertions(+), 0 deletions(-)
>>>   create mode 100644 package/trinity/Config.in
>>>   create mode 100644 package/trinity/trinity.mk
>>>
>>> diff --git a/package/Config.in b/package/Config.in
>>> index ea89c96..3b570ee 100644
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -89,6 +89,7 @@ endif
>>>       source "package/sysprof/Config.in"
>>>       source "package/tinymembench/Config.in"
>>>       source "package/trace-cmd/Config.in"
>>> +    source "package/trinity/Config.in"
>>>       source "package/valgrind/Config.in"
>>>       source "package/whetstone/Config.in"
>>>   endmenu
>>> diff --git a/package/trinity/Config.in b/package/trinity/Config.in
>>> new file mode 100644
>>> index 0000000..c648694
>>> --- /dev/null
>>> +++ b/package/trinity/Config.in
>>> @@ -0,0 +1,10 @@
>>> +config BR2_PACKAGE_TRINITY
>>> +    bool "trinity"
>>> +    depends on !BR2_TOOLCHAIN_USES_UCLIBC
>>> +    help
>>> +      A Linux System call fuzz tester
>>> +
>>> +      http://codemonkey.org.uk/projects/trinity/
>>> +
>>> +comment "trinity is not supported for uClibc"
>>> +    depends on BR2_TOOLCHAIN_USES_UCLIBC
>>> diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
>>> new file mode 100644
>>> index 0000000..1e6c54a
>>> --- /dev/null
>>> +++ b/package/trinity/trinity.mk
>>> @@ -0,0 +1,31 @@
>>> +################################################################################
>>>
>>> +#
>>> +# trinity
>>> +#
>>> +################################################################################
>>>
>>> +
>>> +TRINITY_VERSION = c02034ec08d951cde3429905e64afe450cbc47db
>>> +TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
>>> +TRINITY_LICENSE = GPLv2
>>> +TRINITY_LICENSE_FILES = COPYING
>>> +
>>> +define TRINITY_CONFIGURE_CMDS
>>> +    (cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.sh)
>>> +endef
>>> +
>>> +define TRINITY_BUILD_CMDS
>>> +    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
>>> +endef
>>> +
>>> +define TRINITY_INSTALL_TARGET_CMDS
>>> +    $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
>>> DESTDIR=$(TARGET_DIR)/usr install
>>> +endef
>>> +
>>> +# Install helper scripts
>>> +define TRINITY_INSTALL_HELPER_SCRIPTS
>>> +    mkdir -p $(TARGET_DIR)/usr/libexec/trinity
>>> +    cp -p $(@D)/scripts/* $(TARGET_DIR)/usr/libexec/trinity/
>>> +endef
>>> +TRINITY_POST_INSTALL_TARGET_HOOKS += TRINITY_INSTALL_HELPER_SCRIPTS
>>> +
>>> +$(eval $(generic-package))
>>> --
>>> 1.7.1
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Vincent
