From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 13 Mar 2015 09:39:42 -0400
Subject: [Buildroot] [PATCH 0/7] [RFC] Introduce services as a
 (long-term) replacement for _INSTALL_INIT_(SYSV|SYSTEMD) (branch
 yem/services)
In-Reply-To: <20150312155902.2ff7e30d@free-electrons.com>
References: <cover.1426112628.git.yann.morin.1998@free.fr>
 <20150312155902.2ff7e30d@free-electrons.com>
Message-ID: <CANPyyuMfpu1HWG=9Lx3EYJ42uRVfZ4GKWmbFUFrc2=uN_X3-BA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Some comments with regards to how your proposal works with a systemd init.

On Thu, Mar 12, 2015 at 10:59 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yann E. MORIN,
>
> On Wed, 11 Mar 2015 23:30:18 +0100, Yann E. MORIN wrote:
>
>> Following up on Gustavo's proposal [0] on a clean up on our init
>> scripts (and eventually our systemd unit files), here is an *RFC*
>> series that tries to implement Gustavo's idea.
>
> I am personally not in favor of an approach where kconfig options are
> used to enable/disable services, because it's a slippery slope. I very
> much prefer Gustavo's proposal of /etc/{default,config}/ files, that
> users can override in their rootfs overlays or post-build script.
>
> Why do I have this opinion?
>
> Simply because your proposal is limited to just enabling/disabling
> services. But then people will want kconfig options to set the TFTP
> server root directory, to set the lighttpd server options foo or bar,
> to configure the NTP configuration options, and so on. This is clearly
> not a direction we want to take I believe as it will simply require
> more and more and more kconfig options.

The kconfig option for enabling of systemd service could be generated
easily. Each package would simply provide a variable that contains all
of the service files to install. This same list could be used to
generate a menu for which should be enabled.

>
> Instead, let's have some /etc/default/<service> files, which allow to
> both define whether <service> is enabled or not, but also allow to set
> various other service-specific configuration options.

For what it's worth, that system isn't used / actively discouraged in
systemd (not that that systemd should dictate what buildroot does). It
does the following:

Installing: service file put in /usr/lib/systemd/system/
Enabling: service file in /usr/lib/systemd/system/ symlinked to
/etc/systemd/system/multi-user.target.wants/ (or another target)
Overriding defaults / custom configuration: modified copy of service
file put in /etc/systemd/system/

This way, all default configuration is in /usr/lib/systemd/ and
overrides of the defaults are in /etc/systemd/. The nice thing about
this is it is immediately apparent which parts of your system have
been modified and which haven't. It also enables a factory reset by
simply wiping /etc/.

>
> I think Buildroot is a toolbox to generate your system, but you *must*
> do some additional customization to have a system tailored to your
> needs. What I believe is great in Buildroot is that is basically just
> builds the upstream source code, and installs it. It doesn't try to be
> a distro that imposes its own Web interface, its own organization of
> the filesystems, etc. We just build and install everything, and provide
> minimal sane defaults, and let users customize everything else.

I agree, that's why I use buildroot. As such, I have a slight
preference for not doing any extra configuration beyond building and
installing packages in buildroot, including enabling services or
configuring sane defaults for services. However, there's definitely a
good argument to made that your preference of enabling sane defaults
helps beginners starting out with buildroot. And for systemd init, my
goal is easy to accomplish, I can simply simply rm -rf /etc/* in a
post build script.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
