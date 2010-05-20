From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 20 May 2010 11:48:28 +0200
Subject: [Buildroot] Converting packages to autotools leading to more in
	target filesystem
In-Reply-To: <4BF4FFB4.9020807@carallon.com>
References: <4BF3EDD8.2070809@carallon.com>
	<1274301336.18849.11.camel@coalu.atr> <4BF4FFB4.9020807@carallon.com>
Message-ID: <AANLkTim9dj7EqM4gJE3dDIkMWr7piySblz9sfVVGRkpy@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 20, 2010 at 11:24 AM, William Wagner
<will_wagner@carallon.com> wrote:
> On 19/05/2010 21:35, Lionel Landwerlin wrote:
>>
>> Le mercredi 19 mai 2010 ? 14:55 +0100, Will Wagner a ?crit :
>>
>>>
>>> I have been updating a project to use the latest buildroot from git and
>>> I have noticed a change in the size of the target filesystem.
>>>
>>> This is caused by the conversion of certain packages to use the
>>> autotools infrastructure. The two packages in the tree I have noticed it
>>> for are libsysfs and libraw1394. These are both libraries and previously
>>> the install step for the target just copied the libraries into
>>> $(TARGET_DIR)/usr/lib.
>>>
>>> With the conversion to autotools instead the target install step is
>>> calling install-strip on the Makefile in the package source. This
>>> correctly installs the library but it also copies a number of test
>>> applications that come bundled with the library. For my project where
>>> filesystem size is constrained this can cause problems. If a system was
>>> not constrained for filesystem size I can see that the test applications
>>> could be useful to allow someone to test the library was working
>>> correctly.
>>>
>>> I was easily able to remove the unwanted applications by adding a
>>> INSTALL_TARGET_CMDS override for the package as below:
>>>
>>> --- a/package/libraw1394/libraw1394.mk
>>> +++ b/package/libraw1394/libraw1394.mk
>>> @@ -8,4 +8,8 @@
>>> LIBRAW1394_SOURCE:=libraw1394-$(LIBRAW1394_VERSION).tar.gz
>>> ? LIBRAW1394_SITE:=http://www.kernel.org/pub/linux/libs/ieee1394/
>>> ? LIBRAW1394_INSTALL_STAGING=YES
>>>
>>> +define LIBRAW1394_INSTALL_TARGET_CMDS
>>> + ? ? ? $(MAKE) DESTDIR=$(TARGET_DIR) ?install-strip -C
>>> $(BUILD_DIR)/libraw1394-$(LIBRAW1394_VERSION)/src
>>> +endef
>>> +
>>> ? $(eval $(call AUTOTARGETS,package,libraw1394))
>>>
>>> This works fine but forces all users to have a cut down install. Is this
>>> a problem people think is worth solving? If so I will look at changing
>>> it so that the autotools infrastructure can choose (depending on a
>>> global config option) to either install the entire package or you can
>>> specify make targets that only install some of the package.
>>>
>>> Will
>>>
>>>
>>
>> Hello Will,
>>
>> We already changed that from install-strip to install because some
>> package (namely directfb, but this might also be the case for any
>> package that installs plugins) does not install its plugins with make
>> install-strip...
>>
>
> Looking in package/Makefile.autotools.in here
> http://git.buildroot.net/buildroot/tree/package/Makefile.autotools.in, on
> line 70 it appears to me to say we call install-strip unless
> BR2_ENABLE_DEBUG is set when we call install instead

Damn ! So we still have a problem with the stripped case for some packages...

>
>> So I don't whether we can fix this problem otherwise than the
>> "per-package" way (just like you did)...
>> At some point (probably if someone works on the package generation), I
>> guest we will have to do like OpenEmbedded, and describe for each
>> package which files are to be installed (having the advantage to
>> generate at the same time developement packages, documentation packages
>> as well as standard binary packages).
>>
>
> The generic change to autotools would just add a
> $$(PKG)_INSTALL_TARGET_TARGET (or a less confusing name if I could think of
> one) option which by default would be empty and so you would get current
> behaviour. Then specific packages could override the setting.
>
> If no one is very interested I will leave it that I modify packages.

I'm okay with that (introducing the variable).

>
> Will
>
> --
> ------------------------------------------------------------------------
> Will Wagner ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? will_wagner at carallon.com
> Development Manager ? ? ? ? ? ? ? ? ? ? ?Office Tel: +44 (0)20 7371 2032
> Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
> ------------------------------------------------------------------------
>
>
>
