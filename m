From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Oct 2014 10:53:26 -0300
Subject: [Buildroot] [PATCH 1/3] qemu-system: new package
In-Reply-To: <543EA87A.2050204@mind.be>
References: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>
 <20141012171752.29414e94@free-electrons.com>
 <543AD090.3000107@zacarias.com.ar> <543EA87A.2050204@mind.be>
Message-ID: <543FCDD6.9070104@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/15/2014 02:01 PM, Arnout Vandecappelle wrote:

>  Can you explain why not?
> 
>  You cannot use different versions for qemu-user and qemu-system in a clean way
> if they're not different packages. But host and target versions don't need to be
> the same. At least, I see code in pkg-generic.mk to handle that.

Well, not really, for example try modifying package/e2fsprogs.mk:
HOST_E2FSPROGS_VERSION = 1.42.13

And build both, see what happens.
Even try a make source with that.

>  And I do think we want to keep qemu-user and qemu-system at the same version,
> right? Or does it happen that you need different versions for these as well?
> 
>  The real question is how to make the version depend on the values in
> BR2_PACKAGE_QEMU_CUSTOM_TARGETS. But that is not the concern of your patch.

No, that's a wrong assumption.
For example qemu_mpc8544ds_defconfig doesn't work with the latest 2.1.2
qemu, however other qemu ppc sample defconfigs do (in fact no 2.1.x
version).
And the qemu config should dictate what's the best version for each -
not necessarily the latest, you can't make host-qemu-user depend on that
since it's a platform decision, not an arch one.
If you want to stick with "the one that works for everything" you
potentially miss the opportunity for new arch and/or platform support.
So even if target != host version is fixed/possible you'll still clash
on host-qemu (user) vs. host-qemu (system) versions since you might want
to do the perl module dance (original purpose of host-qemu) vs. platform
emulation.
It's nice to keep everything in one package, but it's not feasible to do
so in a coherent way for this case in particular.
If you can't get the leash out of the qemu version there's no point in
building so for the emulation, sometimes you'll ship every single qemu
config working, sometimes you wont - and that's my quarrel, everyone is
perfect-this perfect-that but all of the sudden this would be acceptable?
Like i said it would be the same as $RANDOM distro qemu.
Regards.
