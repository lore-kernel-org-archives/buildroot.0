From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 01 Aug 2012 11:18:35 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.08/systemd
In-Reply-To: <20120730232106.07e25afb@skate>
References: <cover.1343460025.git.maxime.ripard@free-electrons.com>
 <20120730232106.07e25afb@skate>
Message-ID: <5018F46B.80807@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 30/07/2012 23:21, Thomas Petazzoni a ?crit :
> Le Sat, 28 Jul 2012 09:21:19 +0200,
> Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :
> 
>> Maxime Ripard (3):
>>       Rework of the init system
>>       Add systemd unit for lighttpd
>>       doc: Update the documentation to mention the new PKG_INSTALL_INIT_ variables
> 
> I have applied your changes. I had to make a change on PATCH 1/3,
> because the systemd init choice was visible even if the requirements
> for the systemd package were not met (thread support and
> udev-based /dev).

Thanks!

> Also, it would be good to investigate the newer versions of systemd. If
> I remember correctly, they integrate udev directly, but is it possible
> to still have udev separately? This of course will not be for 2012.08,
> but it would be nice to continue to integrate those technologies into
> Buildroot.

Yes, this is definitely something I want to try in the future. They told
when they merged udev that we could still be able to compile both
separately, but from a quick look, I haven't seen a way to do so yet.

> Also, in the testing I've done with the vexpress Qemu target, I have
> not been particularly impressed by the boot speed, but I should
> probably try on a real target.

Yes, boot speed for a minimal system didn't impress me much neither. But
still, it tends to be the same time as with busybox's init, but it has
way much to boot, like udev, dbus, and so on. Also, if I remember
correctly the talk at ELCE last year from Koen Kooi, he was saying that
now the boot is mostly CPU-bound, which might explain the not-so-fast
boot on slow cpus.

> And final comment: it seems lighttpd is started even before the web
> server is accessed. Wasn't systemd supposed to start such daemons
> on-demand? Or maybe lighttpd does not have the necessary code to
> support such kind of startup where the already opened socket is passed
> by systemd?

This is one of the features of systemd yes, but the daemons have to be
started in inet-mode, so that it's actually systemd that handles the
socket. Here, we just start lighttpd like a regular daemon, so except
for the starting part, it has nothing to do with the daemon.

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
