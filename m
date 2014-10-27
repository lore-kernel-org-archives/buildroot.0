From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 27 Oct 2014 10:50:29 +0100
Subject: [Buildroot] systemd not working properly?
In-Reply-To: <20141021081533.GB9754@pc-eric>
References: <20141019124525.01fe9653@free-electrons.com>
 <20141021081533.GB9754@pc-eric>
Message-ID: <CAGduivzxNzHY1j1JJBG0j9XSabWjs-7NfL9Mk=YHhYV7E_tMNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Tue, Oct 21, 2014 at 10:15 AM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> Hi!
> On Sun, Oct 19, 2014 at 12:45:25PM +0200, Thomas Petazzoni wrote:
>> Dear systemd/Buildroot users,
>>
>> I don't use systemd much, but every time I need to test a config with
>> systemd enabled, there are quite a few errors at boot time, and more
>> precisely, it doesn't even boot completely. Here are the errors I get:
>>
>> [FAILED] Failed to start Remount Root and Kernel File Systems.
>> See 'systemctl status systemd-remount-fs.service' for details.
>> ...
>>
>> Then a *very* long delay because of dev-ttyAMA0.device., that finally
>> ends up with:
>>
>> [ TIME ] Timed out waiting for device dev-ttyAMA0.device.
>> [DEPEND] Dependency failed for Serial Getty on ttyAMA0.
>>
>> And finally, I get no getty at all.
>>
>> Defconfig being used:
>>
>> BR2_arm=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_INIT_SYSTEMD=y
>> BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>> BR2_PACKAGE_AVAHI=y
>> BR2_PACKAGE_AVAHI_DAEMON=y

In the end, FHANDLE needs to be selected in the Linux configuration
for systemd to work properly.
This option is enabled automatically when systemd is selected as init
system in BR. In Thomas case (and mine too), the kernel was too old
and it was not build with this feature enabled.
Rebuilding fixed the issue.
