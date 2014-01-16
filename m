From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 17 Jan 2014 00:17:03 +0100
Subject: [Buildroot] [PATCH] Add gpm (general purpose mouse) server
	package
In-Reply-To: <52D8300E.80008@free.fr>
References: <1389806830-24712-1-git-send-email-julien.boibessot@free.fr>
 <52D6FE2C.5020500@openwide.fr> <52D8300E.80008@free.fr>
Message-ID: <52D8686F.1060704@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

Le 16/01/2014 20:16, Julien Boibessot a ?crit :
> Hello Romain,
>
> and thanks for the review !
>

You're welcome.

>> May I suggest you to test gpm package with different toolchain 
>> configuration ?
>>
>> It won't build in static case (BR2_PREFER_STATIC_LIB=y):
>> "i686-buildroot-linux-uclibc/bin/ld: attempted static link of dynamic 
>> object `lib/libgpm.so.2'
>> collect2: error: ld returned 1 exit status"
>
> When I send patches they have been tested on different ARM target with 
> mainly 2 uClibc configs ("default" and "with large file, threads and 
> Co"), but not the one you mentionned (static lib)... sorry :-(
> Have you other configs that could lead to compilation problems ?

It's common source of failure in autobuilder, especially with new packages.
I'm not sure about mmu less case (BR2_USE_MMU=n)...

>
>>
>> There is also some errors about missing gpm.h in these files: (wrong 
>> path)
>> display-buttons.c
>> display-coords.c
>> get-versions.c
>
> where do you see that error ? (for me these tools are compiling fine 
> and working on target)
I get these error when ncurses is missing (see below):
prog/display-buttons.c:39:57: fatal error: gpm.h: no such file or directory
compilation terminated.
prog/display-coords.c:40:57: fatal error: gpm.h: no such file or directory
compilation terminated.
prog/get-versions.c:25:57: fatal error: gpm.h: no such file or directory
compilation terminated.

I need to add "headers/" before gpm.h

There is an optional dependency on ncurses:
ifeq ($(BR2_PACKAGE_NCURSES),y)
GPM_DEPENDENCIES += ncurses
GPM_CONF_OPT += --with-curses
else
GPM_CONF_OPT += --without-curses
endif
>
>> ||
>> And It would be good to disable the doc installation on target.
>
> why ?
> /usr/share/info/ and /usr/share/man/ are cleaned by Buildroot before 
> generating root filesystem images.
> Am I wrong ?
Sorry your right, I was abused by my command line :
"make toolchain gpm" which doesn't run target-finalize.

But this script (/usr/share/emacs/site-lisp/t-mouse.el) remain on target
I'm not sure it is really useful.
You can remove it with:
GPM_CONF_OPT += ac_cv_path_emacs=no

Be careful with makeinfo, because some host don't have it and fail to 
build the documentation.
Normally you can disable makeinfo with:
GPM_CONF_OPT += ac_cv_path_MAKEINFO=no
But I get an error during install...

>
>>
>> Thank for your contribution (I was working on gpm package too ;-) )
>
> Is yours very different from mine ? I'm not against merging your work 
> and sharing the credits or vis et versa.
Thanks, I gave you all my notes :)

Best regards,
Romain Naour
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140117/d39b9318/attachment.html>
