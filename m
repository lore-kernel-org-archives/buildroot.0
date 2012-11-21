From: John Tobias <john.tobias.ph@gmail.com>
Date: Tue, 20 Nov 2012 16:52:04 -0800
Subject: [Buildroot] Who calls to the defined function/s
In-Reply-To: <CACUGKYMPEgomG3VJnNitxBr7Dtxed4XuPzMdVRH0rJi_iKB7DQ@mail.gmail.com>
References: <CACUGKYMDKMSvqrUgRhiKyaVm6S5z7a+RMa+3oyCXspU8OVVbYQ@mail.gmail.com>
 <20121120095904.20264654@skate>
 <CACUGKYNs2gHvS_6eJS22gYgZOE7rhSciSaCAeCxbEm4q5Dm=Kw@mail.gmail.com>
 <CACUGKYMPEgomG3VJnNitxBr7Dtxed4XuPzMdVRH0rJi_iKB7DQ@mail.gmail.com>
Message-ID: <CACUGKYO0kCxFQgMTdnCMM7WdM6ghsNHHpNwMDcDcv64svL0d_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I found where to add the function.

Regards,

john

On Tue, Nov 20, 2012 at 3:00 PM, John Tobias <john.tobias.ph@gmail.com> wrote:
> Hi Thomas,
>
> I added some function in generic-package (snapshot of added function):
>
> $(BUILD_DIR)/%/.stamp_create_package:
> @$(call MESSAGE,"Creating package")
> $(Q)touch $@
>
>
> In buildroot directory, when I issue a command:
>
> make hello-create-package, it calls the said function. But, since the
> new function didn't know by the buildroot, I cannot do the make hello
> then the buildroot will call the create-package.
>
> The question is what environment variable should I modify in order the
> buildroot should call the create-package too?
>
> Regards,
>
> john
>
> On Tue, Nov 20, 2012 at 10:26 AM, John Tobias <john.tobias.ph@gmail.com> wrote:
>> Dear Thomas Petazzoni,
>>
>> Thank you for the response. I was thinking to support the package
>> management in the buildroot. Where, if I define XXX_CREATE_PACKAGE in
>> my hello.mk
>> the buildroot (for example) will create an opkg file (off-course I
>> have supply the necessary information to create the package file).
>>
>> I know the buildroot community did not support it package management
>> but I would like to add some flexibility on my buildroot environment.
>>
>> Regards,
>>
>> john
>>
>> On Tue, Nov 20, 2012 at 12:59 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Dear John Tobias,
>>>
>>> On Mon, 19 Nov 2012 18:21:03 -0800, John Tobias wrote:
>>>
>>>> I was trying to (fully) understand the dataflow of the buildroot's
>>>> Makefile. How/who parse/calls to the functions like:
>>>>
>>>> HELLO_INSTALL_TARGET_CMDS
>>>> HELLO_BUILD_CMDS
>>>>
>>>> $(eval $(generic-package))
>>>
>>> The generic-package macro will find in which directory your Makefile
>>> is, for example package/hello/. It will take this "hello" convert it to
>>> uppercase, and use it as the prefix for all variables. So basically, a
>>> package in package/hello/hello.mk will have to define HELLO_SITE,
>>> HELLO_SOURCE, HELLO_VERSION, and possibly HELLO_BUILD_CMDS,
>>> HELLO_INSTALL_TARGET_CMDS, etc.
>>>
>>>> So, How I can tell to the generic-package to call HELLO_TEST_CMDS too?
>>>>
>>>> example:
>>>> define HELLO_TEST_CMDS
>>>> ...
>>>> endef
>>>
>>> That would require a modification of the package infrastructure, which
>>> you probably don't want to do. What are you trying to achieve with a
>>> new command exactly?
>>>
>>> New commands are normally not needed:
>>>
>>>  *) For autotools-package and cmake-package, you have hooks so that you
>>>     can do something after extraction, after patching, after
>>>     configuration, after installation, etc.
>>>
>>>  *) For generic-package, you can do something like:
>>>
>>> ifeq ($(BR2_PACKAGE_HELLO_SOMETHING),y)
>>> define HELLO_DO_THIS_CMDS
>>>         $(MAKE) -C $(@D) do-this
>>> endef
>>> endif
>>>
>>> ifeq ($(BR2_PACKAGE_HELLO_SOMETHING_ELSE),y)
>>> define HELLO_DO_THAT_CMDS
>>>         $(MAKE) -C $(@D) do-that
>>> endef
>>> endif
>>>
>>> define HELLO_BUILD_CMDS
>>>         $(HELLO_DO_THIS_CMDS)
>>>         $(HELLO_DO_THAT_CMDS)
>>> endef
>>>
>>> Please make sure to read our documentation at
>>> http://buildroot.org/downloads/manual/manual.html#_adding_new_packages_to_buildroot
>>> which explains all of this with quite some details and examples.
>>>
>>> Do not hesitate to get back to the list if you need further details,
>>>
>>> Thomas
>>> --
>>> Thomas Petazzoni, Free Electrons
>>> Kernel, drivers, real-time and embedded Linux
>>> development, consulting, training and support.
>>> http://free-electrons.com
