From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Wed, 5 Sep 2012 15:37:56 -0500
Subject: [Buildroot] fs skeleton quick rebuild
In-Reply-To: <CAJkQPOmzL7L2Z+Bx=t48Fn_+7+ZHtv7gRknhEPhvSxL7CKkcgg@mail.gmail.com>
References: <CAE9DZUQi+OEhWzW0Hu1bBrBhs6QZ+_V=J1MwFej_H2EAhhdM4A@mail.gmail.com>
 <504648B4.6010301@relinux.de>
 <CAJkQPOmzL7L2Z+Bx=t48Fn_+7+ZHtv7gRknhEPhvSxL7CKkcgg@mail.gmail.com>
Message-ID: <CAE9DZUSHA9TX+7xQSLsL1Na4SavpureAbFqR8if_XHKK8B58Qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aras,

I know it's not recommended, but it sure helps to quickly make changes
and test, especially for an impatient person like me!  ;^)

Here is my script, which is working well.

-- snip --
m -rf target
mkdir -p target/sbin
mkdir -p target/lib
mkdir -p target/usr/lib
cp -a staging/sbin/* target/sbin/
cp -a staging/lib/* target/lib/
cp -a staging/usr/lib/* target/usr/lib/
rm -f build/.root
find . -name ".stamp_target_installed*" -print | xargs rm -f
-- snip --

Thanks,

Dallas

On Wed, Sep 5, 2012 at 9:59 AM, Aras Vaichas <aras.vaichas@gmail.com> wrote:
> On 4 September 2012 19:30, Stephan Hoffmann <sho@relinux.de> wrote:
>> Am 04.09.2012 19:59, schrieb Dallas Clement:
>>> Greetings:
>>>
>>> I'm working on a custom skeleton for my rootfs and wanting to make
>>> changes and test without having to rebuild everything.  Is there an
>>> easy way to do this?
>> Hi,
>>
>> I figured out that
>> 1. remove output/target
>> 2. remove output/build/.root
>> 3. remove all .stamp_target_installed files
>> give a quite fast, clean rebuild of the root file system.
>
> I have something similar in a script I call "pre_build_clean.sh"
>
> -- snip --
> #/bin/sh
> echo pre build cleanup script
> echo removing stamps, output/target, output/images,
> find -name .stamp_target_installed | xargs rm
> rm -rf output/target
> rm -rf output/images/*
> rm output/build/.root
> rm output/stamps/ct-ng-toolchain-installed
> echo build your target now. e.g. \"make\" or \"make
> linux-reconfigure\" to rebuild the kernel
> -- snip --
>
> This is the script I created when I was making lots of skeleton,
> configuration and kernel changes; YMMV.
>
> Dallas, be careful doing this because it's easy to make a mistake, and
> I know that Thomas doesn't recommend doing partial builds like this.
>
> If you use a custom toolchain, then I highly recommend building an
> external toolchain. You can perform a "make clean; make" and it
> doesn't take very long.
>
> Aras
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
