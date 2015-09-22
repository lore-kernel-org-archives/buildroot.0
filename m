From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 22 Sep 2015 21:25:03 +0200
Subject: [Buildroot] [PATCH 18/19] ccache: use mtime for external
 toolchain, CONF_OPTS for internal toolchain
In-Reply-To: <5600856D.8010702@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442777319-24164-1-git-send-email-arnout@mind.be>
 <1442777319-24164-5-git-send-email-arnout@mind.be>
 <CAHXCMMLkNi47MQg+KCMNjtG1s4byAOO=aJqOGYHYC6Af_6WwpQ@mail.gmail.com>
 <5600856D.8010702@mind.be>
Message-ID: <CAHXCMMKk-qwuE5zNjr1gqK+eFBvC0gxatF3Qrnqg8dk9pESfNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 22, 2015 at 12:32 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 21-09-15 23:43, Samuel Martin wrote:
>> Hi Arnout,
>>
>> Just some minor comments below.
>>
>> On Sun, Sep 20, 2015 at 9:28 PM, Arnout Vandecappelle (Essensium/Mind)
>> <arnout@mind.be> wrote:
>> [...]
>>>
>>> +ifeq ($(BR2_CCACHE),y)
>>> +HOST_GCC_COMMON_CCACHE_HASH_FILES += $(DL_DIR)/$(GCC_SOURCE)
>>> +HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(GCC_VERSION)/*.patch
>>> +ifeq ($(BR2_xtensa),y)
>>> +HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_XTENSA_OVERLAY_TAR)
>>> +endif
>>> +ifeq ($(ARCH),powerpc)
>>> +ifneq ($(BR2_SOFT_FLOAT),)
>>> +HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(GCC_VERSION)/1000-powerpc-link-with-math-lib.patch.conditional
>>> +endif
>>> +endif
>>
>> Maybe it is a rare case, should not the gcc's patches from the
>> BR2_GLOBAL_PATCH_DIR location be added to the
>> HOST_GCC_COMMON_CCACHE_HASH_FILES list as well?
>
>  True. Note that in the global patch dir, you'd have to create separate
> gcc-initial and gcc-final directories, which makes it less likely that someone
> would actually do this.
>
>  I was also thinking about GCC_OVERRIDE_SRCDIR, which is not covered at the moment.
>
>  However, these things make the already fairly complicated hash logic even more
> complex. Do we really need to support such exotic cases?

Maybe no. The cost of supporting these corner cases may be to high
compared to the frequency it would be used/needed.

>
>
>>
>>> +
>>> +HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_HASH=\"`\
>>> +       printf '%s' $($(PKG)_CONF_OPTS) $(GCC_VERSION) \
>>> +               | sha256sum - $(HOST_GCC_COMMON_CCACHE_HASH_FILES) \
>>> +               | cut -c -64 | tr -d '\n'`\"
>>
>> Depending on the number of items in the
>> HOST_GCC_COMMON_CCACHE_HASH_FILES list, the BR_CCACHE_HASH definition
>> can be quite long...
>
>  Is that a problem?

It was just a comment ;-)

It's not really a problem, it might only be a bit annoying when
debugging the wrapper.
This is not something people does every day, I hope so ;-).

Regards,


-- 
Samuel
