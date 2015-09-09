From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Sep 2015 12:39:05 +0200
Subject: [Buildroot] [RFC 5/6] docs/manual: document "Dynamic using mdev
 only" /dev management
In-Reply-To: <1441747734-18730-6-git-send-email-luca@lucaceresoli.net>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-6-git-send-email-luca@lucaceresoli.net>
Message-ID: <55F00C49.9090202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Luca,

On 08-09-15 23:28, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  docs/manual/configure.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
> index 997be2b..ea78d96 100644
> --- a/docs/manual/configure.txt
> +++ b/docs/manual/configure.txt
> @@ -324,6 +324,17 @@ different solutions to handle the +/dev+ directory :
>     daemon used in most desktop Linux distributions, which is now part
>     of Systemd. For more details, see http://en.wikipedia.org/wiki/Udev.
>  

 For consistency with the way it's ordered in menuconfig, I'd move the new
bullet point to the second place in the list. That does mean you have to update
all the second, third, fourth bullets but that's no biggy I guess.

> + * *Dynamic using mdev only* uses +mdev+ and allows to use all the
> +   features of +mdev+, including dynamic device creation and firmware
> +   handling, but does not use _devtmpfs_.

 If you move it as the second bullet, the explanation about mdev should be moved
to here as well. So I propose the following rephrased bullet point (which
includes a bunch of minor fixes to the text):

 * The second solution is *Dynamic using mdev only*. +mdev+ is a helper program
   that is part of BusyBox. The kernel will call it every time a device is added
   or removed, and +mdev+ will create the appropriate device node in +/dev+.
   Thanks to the +/etc/mdev.conf+ configuration file, +mdev+ can be configured
   to, for example, set specific permissions or ownership on a device file, call
   a script or application whenever a device appears or disappears, etc.
   Basically, it allows _userspace_ to react on device addition and removal
   events. +mdev+ can for example be used to automatically load kernel modules
   when devices appear on the system. +mdev+ is also important if you have
   devices that require a firmware blob to be loaded: it will be responsible
   for pushing the firmware contents to the kernel. +mdev+ is a lightweight
   implementation (with fewer features) of +udev+. For more details
   about +mdev+ and the syntax of its configuration file, see
   http://git.busybox.net/busybox/tree/docs/mdev.txt.
   +
   If you have to use a kernel older than 2.6.32, this is the only option to
   have dynamic +/dev+ management, although it can be used with more recent
   versions of the kernel as well. If you build your Linux kernel outside of
   Buildroot, you should disable +CONFIG_DEVTMPFS+ and +CONFIG_DEVTMPFS_MOUNT+
   in your kernel configuration. When Buildroot is in charge of building the
   Linux kernel, it disables them automatically.


 Clearly, if you take this proposal, also the devtmpfs+mdev option has to be
updated a little to avoid duplication.


 Regards,
 Arnout

> +   If you have to use a kernel older than 2.6.32 this is the only
> +   option to have dynamic /dev management, although it can be used
> +   with more recent versions of the kernel as well.
> +   If you build your Linux kernel outside of Buildroot, you should
> +   disable +CONFIG_DEVTMPFS+ and +CONFIG_DEVTMPFS_MOUNT+ in your kernel
> +   configuration. When Buildroot is in charge of building the Linux
> +   kernel, it disables them automatically.
> +
>  The Buildroot developers recommendation is to start with the *Dynamic
>  using devtmpfs only* solution, until you have the need for userspace
>  to be notified when devices are added/removed, or if firmwares are
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
