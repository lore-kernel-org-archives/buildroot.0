From: Daniel Price <daniel.price@gmail.com>
Date: Mon, 4 Mar 2013 16:49:58 -0800
Subject: [Buildroot] [PATCH 2/2 V5] nodejs: new package
In-Reply-To: <20130304221946.6c6d62cd@skate>
References: <1362102967-10236-1-git-send-email-daniel.price@gmail.com>
 <20130304221946.6c6d62cd@skate>
Message-ID: <CAKduhStxOLDPU_mMtiO1-gH2=DJgeyeO=CEEt6-2SXNsc1zxZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 4, 2013 at 1:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> +comment "nodejs requires a toolchain with C++, IPv6, large files, and threading"
>> +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
>
> We generally want lines like this to be split on two lines:

Will fix.

>> +NODEJS_LICENSE = MIT
>
> Please add:
>
> NODEJS_LICENSE_FILES = LICENSE
>
> That said, as the LICENSE file explains, nodejs source code includes
> some code from various other projects, under other licenses. Maybe the
> licensing experts should tell us what value NODEJS_LICENSE should have
> here. Yann? Luca? See
> https://github.com/joyent/node/blob/master/LICENSE if you don't want to
> download the whole nodejs source code.

I'll fix as per the subsequent suggestions.  Thanks for flagging this.

> In fact, using BR2_SOFT_FLOAT doesn't work very well: on ARM, with an
> external toolchain, BR2_SOFT_FLOAT will always be 'y', and therefore,
> when NodeJS is built with a hard-float toolchain like Linaro ARM
> toolchains, it doesn't work at runtime.
>
> But that's not your fault, it's the Buildroot infrastructure that
> doesn't handle this very well. So keep this as it is for now.

I will eventually be using an external toolchain (I think) for an
Armada XP board... so I assume I'll want hard float there?  I'm happy
to solve this some other way if there are any suggestions?

The other idea I had is to have a menuconfig item which just tells the
user to specify what they want.  I thought that seemed bad, because I
had a hard time understanding this setting, but maybe it's better
since it would actually work?

>> +#
>> +# Build the list of modules to install based on the booleans for
>> +# popular modules, as well as the "additional modules" list.
>> +# qstrip the whole thing to remove whitespace.
>> +#
>> +NODEJS_MODULES_LIST= $(call qstrip, \
>> +     $(if $(BR2_PACKAGE_NODEJS_MODULES_EXPRESS),express,) \
>> +     $(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script,) \
>> +     $(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
>
> When reviewing the previous version, I did suggest to use qstrip only
> where needed, and to remove useless commas:
>
> NODEJS_MODULES_LIST = \
>         $(if $(BR2_PACKAGE_NODEJS_MODULES_EXPRESS),express) \
>         $(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script) \
>         $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))

I tried to clarify with the comment I added: the qstrip of everything
is important when you mix in the shell.  Otherwise you wind up with
something like:  if [[ -n "   " ]], and the -n test fails.  At least,
that's what I saw.  That said, your other suggestion about using
makefile defines should eliminate this problem, so I can switch over.
The useless commas were an oversight, sorry.

> Here as well, I already suggested doing this in a different way, when
> reviewing the v4 of your patch. I don't like the shell based testing of
> NODEJS_MODULES_LIST. It's much more common in Buildroot to do something
> like:

Ok-- I took as a suggestion, and didn't know this was so much against
the project's style.  Will fix as per your direction.

> Also, get rid of the 'echo' when installing modules.

Ok.

> Once those things are fixed, then I think the patch will be good to go!
>
> Thanks a lot for your work!

Thanks for your hard work in reviewing it, and making it easy for a
new contributor.

        -dp

--
Daniel.Price at gmail.com; Twitter: @danielbprice
