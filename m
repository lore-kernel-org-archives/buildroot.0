From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Jun 2021 22:31:33 +0200
Subject: [Buildroot] [PATCH v2 3/5] package/zstd: rework build and
 install
In-Reply-To: <CADYdroN_jRv7Y5Yf2hPFjqq5jBqaSjr2X9drabbtEkDw7kMcWg@mail.gmail.com>
References: <20210525172652.821351-1-nolange79@gmail.com>
 <20210525172652.821351-3-nolange79@gmail.com>
 <3fe56d17-b886-e63b-d366-1e524c895b6b@mind.be>
 <CADYdroN_jRv7Y5Yf2hPFjqq5jBqaSjr2X9drabbtEkDw7kMcWg@mail.gmail.com>
Message-ID: <21114cdb-c993-63bc-a9d6-4eec90f71954@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/06/2021 23:04, Norbert Lange wrote:
> Am Mo., 14. Juni 2021 um 21:50 Uhr schrieb Arnout Vandecappelle
> <arnout@mind.be>:
>>
>>  Hi Norbert,
>>
>> On 25/05/2021 19:26, Norbert Lange wrote:
>>> 1.5.0 uses Threads by default for cli tool and DSO,
>>> the build now does the same unless:
>>>
>>> If only static libraries are build, then build
>>> that library like the DSO is normally built.
>>>
>>> This should ensure that programs requsting the DSO
>>> will always get the multithreaded version.
>>
>>  I don't understand what this patch is trying to do...
>>
>>  Before this patch, in the threads case, the build would be done with threads
>> both for the program (HAVE_THREAD=1) and the libraries (-mt appended). For the
>> no-threads case, the build is done without threads support for both the program
>> (HAVE_THREAD=0) and the shared&static libraries (no -mt appended) - except that
>> since 1.5.0, the shared library will be built with thread support which will
>> probably result in a build failure.
> 
> I would want the static library to be built without threads (like upstream).

 I'm afraid that "like upstream" is not a great argument if upstream does crazy
stuff (which is definitely the case in zstd).

> the expectation should be:
> 
> 1) gcc ... -llibzstd
>     pickup the DSO, with multithread support

 This should actually be:

    pickup the library (shared or static, depending on BR2_STATIC_LIBS), which
always has multithread support.

 This one is OK and makes sense.


> 2) gcc ... ../usr/lib/libzstd.a
>     pickup the static library without multithread support

 This should actually be:

    pickup the static library which has multithread support if
BR2_STATIC_LIBS=y, else it doesn't have multithread support.

 That weird condition makes no sense to me. It means that your application (if
it is multithreaded) will work fine if BR2_SHARED_STATIC=y and break if you set
BR2_STATIC_LIBS=y.

 But OK, your point is that if you link explicitly with the static library, you
should assume that it doesn't have thread support (although sometimes it *does*
have thread support, but who cares?).


> in case there are no shared libraries, 1) will use the static library
> instead, so it should be compiled like the DSO normally would.
> in case there are no static libraries, 2) plainly wont work
> 
> For the program, the Makefile should be able to determine whether
> threads are available or not.
> 
>>
>>  So as far as I can see, the only thing that needs to be done is:
>>
>> ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>> ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
>> else
>> ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
>> endif
>>
>>
>>  You patch, however, builds the static library with thread support if no dynamic
>> library is built, and without thread support if a dynamic library is built. This
>> makes no sense whatsoever to me...
>>
>>
>>  Can you clarify the reasoning?
> 
> I hope I did. Might be that I don't understand the build failures you
> are talking about,
> does the zstd package fail, or some user of libzstd?

 I expect the zstd package to start failing, because it will no try to build the
multithread version on toolchains where threads are not available.

 But I'm apparently wrong - there are failures of zstd, but for a different
reason [1].

> 
>>
>>  For now, I've marked the patch as Changes Requested. Since I did apply the
>> first patch, we will probably start seeing build failures on nothreads, so we'll
>> need a fix soonish...
> 
> Sure, I should get a mail as commit author!?

 You would if you add the package to yourself in DEVELOPERS.


 Regards,
 Arnout

[1] http://autobuild.buildroot.net/?reason=zstd%

> 
> Norbert
> 
>>
>>  Regards,
>>  Arnout
>>
>>>
>>> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>>>
>>> ---
>>> v1->v2:
>>> *   rebased against upstream/master
>>>
>>> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>>> ---
>>>  package/zstd/zstd.mk | 52 ++++++++++++++++++++++++++++----------------
>>>  1 file changed, 33 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
>>> index 2a876376a2..a7a5ba4e50 100644
>>> --- a/package/zstd/zstd.mk
>>> +++ b/package/zstd/zstd.mk
>>> @@ -12,6 +12,8 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
>>>  ZSTD_CPE_ID_VENDOR = facebook
>>>  ZSTD_CPE_ID_PRODUCT = zstandard
>>>
>>> +ZSTD_OPTS += PREFIX=/usr
>>> +
>>>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>>>  ZSTD_OPTS += HAVE_THREAD=1
>>>  else
>>> @@ -39,43 +41,55 @@ else
>>>  ZSTD_OPTS += HAVE_LZ4=0
>>>  endif
>>>
>>> -ifeq ($(BR2_STATIC_LIBS),y)
>>> -ZSTD_BUILD_LIBS = libzstd.a
>>> -ZSTD_INSTALL_LIBS = install-static
>>> -else ifeq ($(BR2_SHARED_LIBS),y)
>>> -ZSTD_BUILD_LIBS = libzstd
>>> -ZSTD_INSTALL_LIBS = install-shared
>>> +ZSTD_BUILD_PROG_TARGET := zstd-release
>>> +
>>> +# Since v1.5.0 the dynamic library is built for
>>> +# multithreading, while the static library is not.
>>> +#
>>> +# Keep those defaults, unless Buildroot is not
>>> +# providing the dynamic library and the
>>> +# static library will be automatically used instead.
>>> +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>>> +ZSTD_INSTALL_LIBS += install-static
>>> +ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
>>> +# Use the static lib as replacement for the mt dynlib
>>> +ZSTD_BUILD_LIBS += libzstd.a-mt
>>>  else
>>> -ZSTD_BUILD_LIBS = libzstd.a libzstd
>>> -ZSTD_INSTALL_LIBS = install-static install-shared
>>> +ZSTD_BUILD_LIBS += libzstd.a-nomt
>>> +endif
>>>  endif
>>>
>>> -# The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
>>> -# one. Building a multi-threaded binary with a library (which defaults to
>>> -# single-threaded) gives a runtime error when compressing files.
>>> -# The 'lib' makefile provides specific '%-mt' targets for this purpose.
>>> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>>> +ZSTD_INSTALL_LIBS += install-shared
>>>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>>> -ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
>>> +ZSTD_BUILD_LIBS += libzstd-mt
>>> +else
>>> +ZSTD_BUILD_LIBS += libzstd-nomt
>>> +endif
>>>  endif
>>>
>>>  define ZSTD_BUILD_CMDS
>>>       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>>> -             -C $(@D)/lib $(ZSTD_BUILD_LIBS)
>>> +             -C $(@D)/lib $(addsuffix -release,$(ZSTD_BUILD_LIBS) libzstd.pc)
>>>       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>>> -             -C $(@D) zstd
>>> +             -C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
>>>  endef
>>>
>>>  define ZSTD_INSTALL_STAGING_CMDS
>>> +     [ -e $(@D)/programs/zstd ] && [ -e $(@D)/lib/libzstd.pc ]
>>> +     $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>>> +             -C $(@D)/lib DESTDIR=$(STAGING_DIR) $(ZSTD_INSTALL_LIBS) \
>>> +             install-pc install-includes
>>>       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>>> -             DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib \
>>> -             install-pc install-includes $(ZSTD_INSTALL_LIBS)
>>> +             -C $(@D)/programs DESTDIR=$(STAGING_DIR) install
>>>  endef
>>>
>>>  define ZSTD_INSTALL_TARGET_CMDS
>>> +     [ -e $(@D)/programs/zstd ]
>>>       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>>> -             DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
>>> +             -C $(@D)/lib DESTDIR=$(TARGET_DIR) $(ZSTD_INSTALL_LIBS)
>>>       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>>> -             DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
>>> +             -C $(@D)/programs DESTDIR=$(TARGET_DIR) install
>>>  endef
>>>
>>>  HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
>>>
