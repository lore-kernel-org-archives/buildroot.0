From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 20 Oct 2015 21:03:29 +1300
Subject: [Buildroot] buildroot inittab getty
In-Reply-To: <20151020100154.47cf5600@free-electrons.com>
References: <1445294741948-115526.post@n4.nabble.com>
 <20151020100154.47cf5600@free-electrons.com>
Message-ID: <CAFOYHZANC+s29pspRSytM1qq7Mbq2+XKa-toGfGgfGi6CiYoOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 20, 2015 at 9:01 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 19 Oct 2015 15:45:41 -0700 (PDT), logos wrote:
>
>> In buildroot menuconfig, I didn't choose "Run a getty (login prompt) after
>> boot",
>> but in my output/target/etc/inittab, I have this line,
>> ttyS3::respawn:/sbin/getty -L  ttyS3 57600 vt100 # GENERIC_SERIAL
>>
>> system/skeleton/etc/inittab shows,
>> #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
>>
>> 1. How can this happen? Why is the line uncommented?
>
> The line gets uncommented if BR2_TARGET_GENERIC_GETTY=y. The logic
> doing this is in package/skeleton/skeleton.mk. It gets uncommented so
> that a getty process is started at boot time to prompt you for your
> login/password on the right serial port / terminal.
>
>> FYI, in my .config file I have
>> # BR2_TARGET_GENERIC_GETTY is not set
>
> When BR2_TARGET_GENERIC_GETTY is disabled, it does not get uncommented,
> I just did a test build with the latest Buildroot:
>
> thomas at skate:~/projets/buildroot (master)$ grep GETTY .config
> # BR2_TARGET_GENERIC_GETTY is not set
> thomas at skate:~/projets/buildroot (master)$ grep getty output/target/etc/inittab
> # Put a getty on the serial port
> #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
>
>> 2. Why tty port has changed from ttyS0 to ttyS3?
>
> Because you have BR2_TARGET_GENERIC_GETTY=y in your configuration, and
> BR2_TARGET_GENERIC_GETTY_PORT="ttyS3". Or because you are using a
> custom rootfs skeleton that has a different /etc/inittab.
>
>> 3. If possible, I'd like to understand inittab file generation process.
>
> 1. The skeleton package gets installed. It copies system/skeleton/* to
>    output/target/.
>
> 2. The busybox package gets installed. It copies
>    package/busybox/inittab to output/target/etc/inittab.
>
> 3. The skeleton package has registered a "target finalize hook" called
>    SKELETON_SYSTEM_GETTY that gets triggered at the very end of the build
>    (after all packages have been built and installed, but before the root
>    filesystem image is generated). This hook, implemented in
>    package/skeleton/skeleton.mk, will tune the inittab by uncommenting
>    the getty line and adjusting the serial port / terminal according to
>    your configuration. This only happens if BR2_TARGET_GENERIC_GETTY=y.
>
>    See http://git.buildroot.net/buildroot/tree/package/skeleton/skeleton.mk#n139
>
> Note that the logic in the older Buildroot you're using is different,
> since at the time, we didn't had a 'skeleton' package.
>
>> 4. Maybe this question doesn't belong here,
>>     what option or parameter do I need to setup if I want to login without
>> typing login name and password after booting?
>> Currently I have to type "root" and hit enter. (no password setup for root)
>
> Just add a post-build script that tunes your inittab by adding a line
> that starts a shell.

Adding '-n -l /bin/sh' to the command should take you straight to a
shell instead of invoking login.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
