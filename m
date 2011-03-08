From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Mon, 07 Mar 2011 22:24:18 -0700
Subject: [Buildroot] Saving custom configs to buildroot, linux, uclibc,
 ...
In-Reply-To: <AANLkTikE2rNNPdELFhNQnNMqY0OaYPLC9Hk3nKoA4P2j@mail.gmail.com>
References: <AANLkTimThq-otAmyU+UYWs6EHg6zfjXqv669OzrpE=Xd@mail.gmail.com>
	<1298516134.2712.75.camel@galileo.graphics-muse.org>
	<AANLkTiniUe6OoYvh=M1SdEf=HjXtH7SoqBiRc8MG45ub@mail.gmail.com>
	<1298689975.2712.133.camel@galileo.graphics-muse.org>
	<AANLkTikE2rNNPdELFhNQnNMqY0OaYPLC9Hk3nKoA4P2j@mail.gmail.com>
Message-ID: <1299561859.2242.64.camel@kepler.graphics-muse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2011-03-01 at 16:50 +0100, Thomas De Schampheleire wrote:
> First of all, thanks for your detailed explanation of BeagleBox. It's
> interesting to get an other view to buildroot...

No problem.  Glad someone found it useful.  

> On Sat, Feb 26, 2011 at 4:12 AM, Michael J. Hammel
> <buildroot@graphics-muse.org> wrote:
> Correct. There are plans for an SDK mechanism though. I don't know the
> details, but in my understanding it will allow a toolchain to be saved
> and passed on directly to others. I don't know the status of this
> either.

As of 2010.11 I have not found an easy way to update just a toolchain,
or kernel or whatever and just rebuild that component.  It seems I have
to rebuild all components or make manual deletions in the build
directory.  I think that's my main reason for wrapping a metabuild
around a Buildroot.  Just so I can update a single component and rebuild
it.  I can update config files, but I don't know how to just do "make
kernel" or similar to rebuild a single component.

This was one of my design concerns for BeagleBox because I felt if I
made the build easy to understand it would entice developers to join in.
Hasn't worked out that way, unfortunately.  Maybe I'm just not a very
good at marketing.

> I agree that buildroot still lacks something with respect to
> rebuilding parts. Now, you have to dive into the makefiles and try to
> find out which files to remove in order to trigger a rebuild.

This works fine for the rootfs.  It's actually pretty easy.  But it
would be nicer to have top level targets for the higher level
components.

> Other examples include:
> * changing a part of the kernel source code directly in
> output/build/linux-XXX - how to force a rebuild of the kernel?

Yeah, that's an issue too.  It gets hairy if you do any kernel work and
want to create and apply your own patches, which is common for embedded
development.

Additionally, if you do a lot of integration work (which happens alot
with BeagleBox) you want to experiment with different GIT repos for the
kernel and even u-boot.  It would be nice to be able to specify these on
the command line via env vars until you're ready to change the default
configuration.  I do that with BeagleBox.

> * pull in a new kernel configuration file from your version control
> system, into the board specific directories - how to make sure it gets
> applied and the kernel rebuilt?

Yup.  Yet another reason I have a metabuild for this.  I have configs
for multiple kernels and can add more based on kernel version, repo and
git IDs. 

> * change something in the board specific target skeleton - how to make
> sure this is applied? (I think I saw a patch passing by that addresses
> this)

I haven't tried the board specific target skeletons.  I'm not exactly
sure what these are used for, except perhaps as a sample target
platform.

> The former (running menuconfig) is also possible in buildroot, right?

Yup.  I hadn't seen this previously.  I just read through the docs a
little tonight to see how to use them.

> For the latter (saving back the configuration), which was the original
> question in this thread, I found there already are following targets:
> make busybox-update
> make uclibc-update

Yup.

> and I recently proposed two patches that add the following targets:
> make linux-update (for saving the linux kernel configuration)
> make config-update (for saving the buildroot configuration)

Cool.  That's a step in the right direction.

-- 
Michael J. Hammel <buildroot@graphics-muse.org>
