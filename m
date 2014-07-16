From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 Jul 2014 10:50:30 +0200
Subject: [Buildroot] [PATCH 0/3] Make exim more configurable
In-Reply-To: <20140716102439.2bcff4ce@free-electrons.com>
References: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>	<20140715213125.1b848b48@free-electrons.com>
 <20140716102439.2bcff4ce@free-electrons.com>
Message-ID: <53C63CD6.6020104@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Luca,
>
> On Tue, 15 Jul 2014 21:31:25 +0200, Thomas Petazzoni wrote:
>
>>> Luca Ceresoli (3):
>>>    exim: allow using a custom configuration file
>>
>> Thanks, I've applied this patch.
>
> This patch is causing build issues:
> http://autobuild.buildroot.org/results/0db/0db54c555f6c7e635ebf99f86b3f91dc31e441f0/build-end.log.
> This happens when randpackageconfig decides to:
>
>    BR2_PACKAGE_EXIM_CUSTOM_CONFIG=y
>
> But of course:
>
>    BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE=""

Argh! :(

How do the autobuilders handle the same situation for the Linux or
Barebox custom configuration files? E.g.:

   # BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=""

This would fail in the same way. Obvious enough, since for exim I just
copied the same checks...

Do the autobuilders have a special handling for the kernel and
bootloaders? If that's the case, of course it would not be viable to do
it for each and every package.

>
> Options:
>
>   1/ Have a default value for BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE that
>      actually works.

That would be quite simple. Enough to run a build with
BR2_PACKAGE_EXIM_CUSTOM_CONFIG disabled, pick the config file from
the build dir, remove the toolchain additions and put the file in
packace/exim/default-config.

I can do that, or we can go for option 4 below.

>
>   2/ Let me know a proper value for BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE
>      that the autobuilder scripts would inject into the configuration
>      when BR2_PACKAGE_EXIM_CUSTOM_CONFIG=y. This requires changing the
>      autobuilder scripts, and I've no control over the autobuilder
>      executed by Peter.
>
>   3/ Exclude configuration that have BR2_PACKAGE_EXIM_CUSTOM_CONFIG=y in
>      the autobuilder script. This also requires changing the autobuilder
>      scripts, with the same drawback as above: there's nothing I can do
>      for Peter's autobuilder machines.

I agree options 2 and 3 would be more annoying.

Another option is:

   4/ Remove BR2_PACKAGE_EXIM_CUSTOM_CONFIG knob and make exim use the
      custom configuration only if
      BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE != "". I assume the
      autobuilders never set BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE, do
      they?

-- 
Luca
