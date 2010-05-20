From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 20 May 2010 15:06:41 +0300
Subject: [Buildroot] Converting packages to autotools leading to more in
	target filesystem
In-Reply-To: <AANLkTim9dj7EqM4gJE3dDIkMWr7piySblz9sfVVGRkpy@mail.gmail.com>
References: <4BF3EDD8.2070809@carallon.com>
	<1274301336.18849.11.camel@coalu.atr> <4BF4FFB4.9020807@carallon.com>
	<AANLkTim9dj7EqM4gJE3dDIkMWr7piySblz9sfVVGRkpy@mail.gmail.com>
Message-ID: <AANLkTinuEHk6PdP-_WaeBpHQRDv_S5z-MoPjZmeIO4lV@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 20, 2010 at 12:48 PM, Lionel Landwerlin
<llandwerlin@gmail.com> wrote:
> On Thu, May 20, 2010 at 11:24 AM, William Wagner
> <will_wagner@carallon.com> wrote:
>> On 19/05/2010 21:35, Lionel Landwerlin wrote:
>>>
>>> Le mercredi 19 mai 2010 ? 14:55 +0100, Will Wagner a ?crit :
>>>
>>>>
>>>> I have been updating a project to use the latest buildroot from git and
>>>> I have noticed a change in the size of the target filesystem.
>>>>
>>>> This is caused by the conversion of certain packages to use the
>>>> autotools infrastructure. The two packages in the tree I have noticed it
>>>> for are libsysfs and libraw1394. These are both libraries and previously
>>>> the install step for the target just copied the libraries into
>>>> $(TARGET_DIR)/usr/lib.
>>>>
>>>> With the conversion to autotools instead the target install step is
>>>> calling install-strip on the Makefile in the package source. This
>>>> correctly installs the library but it also copies a number of test
>>>> applications that come bundled with the library. For my project where
>>>> filesystem size is constrained this can cause problems. If a system was
>>>> not constrained for filesystem size I can see that the test applications
>>>> could be useful to allow someone to test the library was working
>>>> correctly.
>>>>
>>>> I was easily able to remove the unwanted applications by adding a
>>>> INSTALL_TARGET_CMDS override for the package as below:
>>>>
>>>> --- a/package/libraw1394/libraw1394.mk
>>>> +++ b/package/libraw1394/libraw1394.mk
>>>> @@ -8,4 +8,8 @@
>>>> LIBRAW1394_SOURCE:=libraw1394-$(LIBRAW1394_VERSION).tar.gz
>>>> ? LIBRAW1394_SITE:=http://www.kernel.org/pub/linux/libs/ieee1394/
>>>> ? LIBRAW1394_INSTALL_STAGING=YES
>>>>
>>>> +define LIBRAW1394_INSTALL_TARGET_CMDS
>>>> + ? ? ? $(MAKE) DESTDIR=$(TARGET_DIR) ?install-strip -C
>>>> $(BUILD_DIR)/libraw1394-$(LIBRAW1394_VERSION)/src
>>>> +endef
>>>> +
>>>> ? $(eval $(call AUTOTARGETS,package,libraw1394))
>>>>
>>>> This works fine but forces all users to have a cut down install. Is this
>>>> a problem people think is worth solving? If so I will look at changing
>>>> it so that the autotools infrastructure can choose (depending on a
>>>> global config option) to either install the entire package or you can
>>>> specify make targets that only install some of the package.
>>>>
>>>> Will
>>>>
>>>>
>>>
>>> Hello Will,
>>>
>>> We already changed that from install-strip to install because some
>>> package (namely directfb, but this might also be the case for any
>>> package that installs plugins) does not install its plugins with make
>>> install-strip...
>>>
>>
>> Looking in package/Makefile.autotools.in here
>> http://git.buildroot.net/buildroot/tree/package/Makefile.autotools.in, on
>> line 70 it appears to me to say we call install-strip unless
>> BR2_ENABLE_DEBUG is set when we call install instead
>
> Damn ! So we still have a problem with the stripped case for some packages...

Previously it was install-exec and indeed it failed to install some files.

On the other hand I have just noticed that in main br Makefile all files are
stripped after building packages:

target-finalize:
[...]
find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true

So maybe we should just remove stripping from all packages! This would reduce
and simplify some package makefiles a bit...
