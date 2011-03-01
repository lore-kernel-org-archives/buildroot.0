From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 1 Mar 2011 16:50:31 +0100
Subject: [Buildroot] Saving custom configs to buildroot, linux, uclibc,
	...
In-Reply-To: <1298689975.2712.133.camel@galileo.graphics-muse.org>
References: <AANLkTimThq-otAmyU+UYWs6EHg6zfjXqv669OzrpE=Xd@mail.gmail.com>
	<1298516134.2712.75.camel@galileo.graphics-muse.org>
	<AANLkTiniUe6OoYvh=M1SdEf=HjXtH7SoqBiRc8MG45ub@mail.gmail.com>
	<1298689975.2712.133.camel@galileo.graphics-muse.org>
Message-ID: <AANLkTikE2rNNPdELFhNQnNMqY0OaYPLC9Hk3nKoA4P2j@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First of all, thanks for your detailed explanation of BeagleBox. It's
interesting to get an other view to buildroot...

On Sat, Feb 26, 2011 at 4:12 AM, Michael J. Hammel
<buildroot@graphics-muse.org> wrote:
>
> [...] ?Buildroot does an excellent job
> with the rootfs so I use it specifically for that. ?But it doesn't, for
> example, build an RPM of the cross toolchain (well, it didn't before and
> I don't *think* it does now).

Correct. There are plans for an SDK mechanism though. I don't know the
details, but in my understanding it will allow a toolchain to be saved
and passed on directly to others. I don't know the status of this
either.

> I also had problems understanding how to
> rebuild just one component after changing a configuration (not a
> buildroot "package" but the configuration, like the Crosstool-NG config
> file). ?Or how I could rerun mkimage for u-boot to generate boot
> scripts.

I agree that buildroot still lacks something with respect to
rebuilding parts. Now, you have to dive into the makefiles and try to
find out which files to remove in order to trigger a rebuild.
Other examples include:
* changing a part of the kernel source code directly in
output/build/linux-XXX - how to force a rebuild of the kernel?
* pull in a new kernel configuration file from your version control
system, into the board specific directories - how to make sure it gets
applied and the kernel rebuilt?
* change something in the board specific target skeleton - how to make
sure this is applied? (I think I saw a patch passing by that addresses
this)


>
> More importantly, I can swap out configurations for components easily by
> using their own menuconfigs. ?So I can easily rerun Crosstools-NG
> menuconfig and Buildroot's menuconfig and the kernel menuconfig all with
> nothing more than "make <component>-menuconfig". ?And I can save those
> configs in a similar fashion.

The former (running menuconfig) is also possible in buildroot, right?
For the latter (saving back the configuration), which was the original
question in this thread, I found there already are following targets:
make busybox-update
make uclibc-update

and I recently proposed two patches that add the following targets:
make linux-update (for saving the linux kernel configuration)
make config-update (for saving the buildroot configuration)

I should thank Daniel Nystr?m already for his support. Tack!

>
> Yes. ?It started that way. ?In fact, I started that way, then switched
> to using Buildroot just to build the cross toolchain and then again
> (with a separate config file) to build the rootfs. ?I changed it when I
> realized it wasn't as easy as I would like to work with the individual
> components. ?But you really can't beat the ease at which Buildroot lets
> you build the rootfs. ?That's the swiss-army-knife corkscrew I can't
> live without.
>
> Hope that helps.

Thanks! I'll certainly keep this in mind...

Thomas
