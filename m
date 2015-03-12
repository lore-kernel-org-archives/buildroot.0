From: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
Date: Thu, 12 Mar 2015 10:44:07 -0400
Subject: [Buildroot] [PATCH v2 1/1] Makefile: add target to clean
	targetfs
In-Reply-To: <CAMQcK5Kz4_vyCVv3Xq9Sms7UWd2Qjew1c60bXZzkfn6f40QeNg@mail.gmail.com>
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>	<1426015688-24902-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <CAMQcK5Kz4_vyCVv3Xq9Sms7UWd2Qjew1c60bXZzkfn6f40QeNg@mail.gmail.com>
Message-ID: <5501A637.8050502@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-03-10 07:41 PM, Ryan Barnett wrote:
> Emeric,
>
> In the future - could you put a version - such as 'v2' - into the
> title utilizing the -'-subject-prefix' parameter of git-send-email?

I did, using git format-patch:

   $ git format-patch -M -n -s --subject-prefix="PATCH v2" -o outgoing 
buildroot/master

And I see [PATCH v2 1/1] in the title. Did you miss something?

>
> For details and an example see the buildroot manual and section 21.5.2:
>
> http://nightly.buildroot.org/manual.html#submitting-patches
>

[...]

>
> Would it make sense to also update the section of the manual that
> talks about understand when a full-rebuild is necessary? You could
> also update that section to reference this advance usage section.
>
> http://nightly.buildroot.org/manual.html#full-rebuild

I believe so, yes. I'll add a brief scenario in this chapter and see how 
I can warn users about package dependencies.

>
>> @@ -0,0 +1,37 @@
>> +// -*- mode:doc; -*-
>> +// vim: set syntax=asciidoc:
>> +
>> +==== Clean target filesystem
>> +
>> +There are various cases where you would like to clean the target
>> +filesystem. Especially once you understood that buildroot build system
>> +is kept simple, and does not allow to uninstall files. Let's take some
>> +examples:
>> +
>> +1. You enabled +PACKAGE_OPENSSH+ to have a SSH server running on your
>> +   board. But you figure out that +sshd+ does not run well on your
>> +   target's architecture. Thus you decide to disable +PACKAGE_OPENSSH+
>> +   and enable +PACKAGE_DROPBEAR+ instead. You run +make+, +openssh+

Oops, small typo here:
-and enable +PACKAGE_DROPBEAR+ instead. You run +make+, +openssh+
+and enable +PACKAGE_DROPBEAR+ instead. You run +make+, +dropbear+

>> +   gets built and installed. Problem: +openssh+ files are still present
>> +   in +output/target+!
>
> One case that comes to mind here is that will this ensure that
> packages are installed in the correct order with dependencies? I am
> not exactly sure how the dependencies for packages works, but if you
> remove all the '.stamp_target_install' will that ensure that all the
> packages get installed in the correct order?
>
> Busybox is the package that comes to my mind first that we need to
> ensure the installation order. From testing your scenario outlined
> above it appears that busybox gets installed before even dropbear
> would get built which would ensure that any full version of busybox
> would get install correctly over the symlinks to busybox.
>
>> +2. You enabled +PACKAGE_NTPD+ and set the local timezone to
>> +   +America/Montreal+ with +BR2_TARGET_LOCALTIME+ config. Then you find
>> +   out that +Montreal+ local has been replaced by +Toronto+ (French
>> +   looks like a rogue language). You enter +make menuconfig+, make the
>> +   change, save, and run +make+ again. Problem:
>> +   +output/target/etc/timezone+ still has +America/Montreal+ content!
>> +
>> +Solution to this is either to identify which package to reconfigure, or
>
> I believe this first 'or' should be removed so that the sentence would read:
>
> The solution to this is to either identify which package to
> reconfigure, remove files manually, or destroy the target filesystem
> and recreate it.

Ok, I'll fix that.

>
>> +remove files manually, or destroy the target filesystem and recreate it.
>> +This latter option is convenient: you don't have to care about which
>> +packages to rebuild, and it is fast. Here is how to recreate your
>> +target filesystem, and get rid of filesystem _stains_:
>> +
>> +------------------
>> +make clean-target
>> +make
>> +------------------
>> +
>> ++clean-target+ removes +output/target+, tells buildroot to recreate the
>> +target skeleton, and install each package again.
>
> This is a rather simple solution to the issue of recreating a 'clean'
> target filesystem so it will be interesting to hear what the
> maintainers (Peter/Thomas P) opinions are on this patch.
>
> Thanks,
> -Ryan
>

Emeric
