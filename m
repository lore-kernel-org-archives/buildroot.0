From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed, 7 Dec 2016 12:51:24 +0100
Subject: [Buildroot] [PATCH] package/reactcpp: new package
In-Reply-To: <20161207112426.5b40788d@free-electrons.com>
References: <20161206132643.27141-1-m.niestroj@grinn-global.com>
 <20161206163136.23d44f9f@free-electrons.com>
 <74b2df33-0865-c6b6-d731-f0e9191223b9@grinn-global.com>
 <20161207112426.5b40788d@free-electrons.com>
Message-ID: <29623960-22c5-ee30-a5fd-69692019e56c@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07.12.2016 11:24, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 7 Dec 2016 10:59:09 +0100, Marcin Niestroj wrote:
>
>>> Just define the version as v$(REACTCPP_VERSION_MAJOR).3
>>
>> I am using $(REACTCPP_VERSION_RAW) below to define $(REACTCPP_SO).
>
> Yes, but REACTCPP_SO is useless, see below.
>
>>>> +ifeq ($(BR2_STATIC_LIBS),)
>>>> +define REACTCPP_INSTALL_TARGET_CMDS
>>>> +	$(INSTALL) -D -m 0755 $(@D)/src/$(REACTCPP_SO) $(TARGET_DIR)/usr/lib/$(REACTCPP_SO)
>>>> +	ln -sf $(REACTCPP_SO) $(TARGET_DIR)/usr/lib/libreactcpp.so.$(REACTCPP_VERSION_MAJOR)
>>>> +	ln -sf $(REACTCPP_SO) $(TARGET_DIR)/usr/lib/libreactcpp.so
>>>> +endef
>>>> +endif
>>>
>>> Why are you doing this instead of calling "make install" for
>>> $(TARGET_DIR) ?
>>
>> Because make install also copies header files and static library.
>
> And that's perfectly fine. Just let "make install" install header files
> and static library. Buildroot will clean them up at the end of the
> build, in the "target-finalize" step.

Ok, I was not aware cleaning header and *.a files in target-finalize.

I have used 'make install' and checked the target directory before and
after target-finalize. There was *.a symlink pointing to *.a.1.0.3.
After target-finalize only the symlink was removed. How should we fix
that?

>
> It's much, much better (and future proof) to use the build system of the
> package itself when possible, and rely on target-finalize to clean
> things up at the end of the build.
>
> Thanks,
>
> Thomas
>

-- 
Marcin Niestroj
