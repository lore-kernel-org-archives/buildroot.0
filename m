From: Stefan Becker <chemobejk@gmail.com>
Date: Sun, 16 Dec 2018 16:57:02 +0200
Subject: [Buildroot] [PATCH RESEND] core: enhance printvars for
 variables with newlines
In-Reply-To: <20181216145427.0274aed5@windsurf.home>
References: <CAOJ2eMdEHvZeJ6rECyRkzMZN0UYJ2CYK4yMgR9d89P%2B-tWYJYw@mail.gmail.com>
 <20180416115855.26762-1-chemobejk@gmail.com>
 <fc8f1cc6-e9ba-9cfe-df4a-4b80792d6434@mind.be>
 <CAOJ2eMc+3Bx40nWF=VALh6JzeaNVWPekyCGXAL2=a_YX4yJWug@mail.gmail.com>
 <20181216145427.0274aed5@windsurf.home>
Message-ID: <CAOJ2eMcWOj2gvGWHNoZm3ofz2O=LjGj7F02Gy73RyiYP7Pvcmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Dec 16, 2018 at 3:54 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> I'm jumping back to this very old thread. Could you explain (perhaps
> re-explain) what you're trying to do ?

Modular builds to enable usable CI builds, i.e. any change a developer
pushes to one of the internal components will be available as a
flash-able image in less than 5 minutes. CI builds are not possible
with a monolithic mega meta build system approach like buildroot.

> If you need to just re-run a specific step of a specific package, why
> don't you use "make foo-build", "make foo-rebuild", etc. ?

buildroot meta build system assumes that the *whole* source code &
build tree is available. In a modular build approach that is not the
case for the "combining" build, e.g. the flash image build, as it only
receives the build artefacts from the module builds.

> It seems very hackish to extract the commands that Buildroot executes
> to execute them outside the context of Buildroot. This doesn't really
> help to make a case for accepting a patch like you're proposing. Could
> you first convince us that there is a valid and reasonable use-case,
> and then we can discuss how to support this use-case with Buildroot.

Understandable from the PoV of monolithic meta build system advocates
like buildroot, yocto, Android, ...

But I live in the real world and simply can''t ignore Amdahl's law.
Furthermore I can't, or management doesn't allow me, to spend huge
amounts of money on build machines that can run monolithic mega meta
build systems within time spans acceptable for CI (which in the end is
futile anyway due to Amdahl's law as SW only ever grows in size. Trust
me, I've been there...). Hence I've chosen a modular build approach to
address the issue.

As it became clear that this patch would not be accepted any time
soon, I reverted it and implemented a different approach based on
quoted var printout and sed post-processing. While not 100%
fool-proof, it does work for the few build variables that are required
for the modular build approach.

Anyway, I no longer work for the company that is using buildroot, so I
don't really care if you accept this patch or not.

Regards, Stefan
