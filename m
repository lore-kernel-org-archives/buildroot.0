From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 5 Sep 2018 15:30:06 +0200
Subject: [Buildroot] [PATCH 1/3] package/pkg-golang: add support for
 host target
In-Reply-To: <CA+_SqVaLiooe=B7614C0Ee+fndZe+EmbJ4XPKHZYgZxbqSLu=Q@mail.gmail.com>
References: <20180826214146.28328-1-mirza.krak@northern.tech>
 <20180826214146.28328-2-mirza.krak@northern.tech>
 <20180827110253.6c410bb3@windsurf>
 <CA+_SqVaLiooe=B7614C0Ee+fndZe+EmbJ4XPKHZYgZxbqSLu=Q@mail.gmail.com>
Message-ID: <CA+_SqVbQ2dpN02Re9SiczvY+e-dhQ0b_35oRb0g2w4JRW4Yahg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mirza,

On Wed, Sep 5, 2018 at 3:27 PM, Angelo Compagnucci
<angelo@amarulasolutions.com> wrote:
> Hi Mirza,
>
> On Mon, Aug 27, 2018 at 11:02 AM, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>> Hello Mirza,
>>
>> On Sun, 26 Aug 2018 23:41:44 +0200, Mirza Krak wrote:
>>> With this you can add:
>>>
>>>     $(eval $(host-golang-package))
>>>
>>> to a package .mk file to build for host.
>>>
>>> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
>>
>> Thanks for this contribution! I believe the title should be improved,
>> because "host target" is a bit confusion. Perhaps:
>>
>> package/pkg-golang: add support for building host packages
>>
>> This commit also needs a small update to the Buildroot manual, to add
>> something like "The ability to build host packages is also available,
>> with the host-golang-package macro."
>
> Could you repost this patch? I found it very useful and I think you
> could post it sooner than the rest of the series.

Just found your patch repost, sorry for the noise!

Thanks!

>
> Thanks!
>
>>
>>> ---
>>>  package/pkg-golang.mk | 38 +++++++++++++++++++++++++++++++++-----
>>>  1 file changed, 33 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
>>> index 6eacd14180..7d9956378f 100644
>>> --- a/package/pkg-golang.mk
>>> +++ b/package/pkg-golang.mk
>>> @@ -23,10 +23,13 @@
>>>
>>>  GO_BIN = $(HOST_DIR)/bin/go
>>>
>>> -# We pass an empty GOBIN, otherwise "go install: cannot install
>>> -# cross-compiled binaries when GOBIN is set"
>>>  GO_TARGET_ENV = \
>>>       $(HOST_GO_TARGET_ENV) \
>>> +     $(GO_HOST_ENV)
>>
>> I think it's a bit weird and dangerous to re-use GO_HOST_ENV in
>> GO_TARGET_ENV. Indeed, there is the risk that we add something
>> host-specific, and it will be re-used for both target and host.
>>
>> So either your duplicate the definitions (which is reasonable if they
>> aren't a lot of them), or you add something like GO_COMMON_ENV, re-used
>> between target and host.
>>
>>>  define inner-golang-package
>>> @@ -96,6 +98,9 @@ endif
>>>  # Build step. Only define it if not already defined by the package .mk
>>>  # file.
>>>  ifndef $(2)_BUILD_CMDS
>>> +ifeq ($(4),target)
>>> +
>>
>> Drop this empty line.
>>
>>> +# Build package for target
>>>  define $(2)_BUILD_CMDS
>>>       $$(foreach d,$$($(2)_BUILD_TARGETS),\
>>>               cd $$($(2)_SRC_PATH); \
>>> @@ -107,10 +112,23 @@ define $(2)_BUILD_CMDS
>>>                       ./$$(d)
>>>       )
>>>  endef
>>> +else
>>> +     # Build package for host
>>
>> Don't indent this comment.
>>
>>> +define $(2)_BUILD_CMDS
>>> +     $$(foreach d,$$($(2)_BUILD_TARGETS),\
>>> +             cd $$($(2)_SRC_PATH); \
>>> +             $$(GO_HOST_ENV) \
>>> +                     GOPATH="$$(@D)/$$($(2)_WORKSPACE)" \
>>> +                     $$($(2)_GO_ENV) \
>>> +                     $$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
>>> +                     -o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
>>> +                     ./$$(d)
>>> +     )
>>> +endef
>>> +endif
>>>  endif
>>>
>>> -# Target installation step. Only define it if not already defined by the
>>> -# package .mk file.
>>
>> Why are you changing this comment ?
>>
>>> +# Target installation step
>>>  ifndef $(2)_INSTALL_TARGET_CMDS
>>>  define $(2)_INSTALL_TARGET_CMDS
>>>       $$(foreach d,$$($(2)_INSTALL_BINS),\
>>> @@ -119,6 +137,15 @@ define $(2)_INSTALL_TARGET_CMDS
>>>  endef
>>>  endif
>>>
>>> +# Host installation step
>>> +ifndef $(2)_INSTALL_CMDS
>>> +define $(2)_INSTALL_CMDS
>>> +     $$(foreach d,$$($(2)_INSTALL_BINS),\
>>> +             $(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $(HOST_DIR)/usr/bin/$$(d)
>>
>>
>> Install in $(HOST_DIR)/bin, not $(HOST_DIR)/usr/bin. We no longer use
>> $(HOST_DIR)/usr/bin in fact, and $(HOST_DIR)/usr is a symlink to
>> $(HOST_DIR).
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
