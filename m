From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 19 May 2020 17:08:23 -0500
Subject: [Buildroot] [PATCH] package/rng-tools: make jitterentropy
 conditional
In-Reply-To: <20200518094817.3996c1b1@windsurf.home>
References: <20200205182608.22695-1-matthew.weber@rockwellcollins.com>
 <20200205203257.48877881@windsurf>
 <CANQCQparBzmSPD9epjQw8t6jyMejP0E1X0GjTUkXHpjXTi8Svg@mail.gmail.com>
 <CANQCQpZ9Hs6DA6XJpBnMLxqnnJj8N3TYQLsDSp_YR3xqR8G-bQ@mail.gmail.com>
 <87wo8wuc3z.fsf@dell.be.48ers.dk>
 <CANQCQpb8YvhCXireoGM_cwnJnp2T8uGLunPj_3ARyuKgQO+Adw@mail.gmail.com>
 <CAGm1_ksUDVmG3-b6H8FRSBzb9=0GahR7Q5Uh3YKM4uAysvkZZg@mail.gmail.com>
 <CANQCQpatBqo1S1Pn9usEPzLOPusqK1LQOBcoos8uObZ+skFgxg@mail.gmail.com>
 <20200518094817.3996c1b1@windsurf.home>
Message-ID: <CANQCQpbW=XDMeDSf44gJNBC8XiNULBZp5-QnHLUN3uTqwrrhhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Mon, May 18, 2020 at 2:49 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Matt,
>
> On Thu, 13 Feb 2020 11:07:36 -0600
> Matthew Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > > We had similar issue today with am335x (kernel 5.4.x). Bumping
> > > rng-tools to v6.9 helped.
> >
> > Thank you for that feedback, I'll make this patch is superseded as the
> > bump resolved the bug.  I'll add a note with this patchwork thread in
> > the bug report as well.
>
> As I was going through open bug reports, I looked again at
> https://bugs.busybox.net/show_bug.cgi?id=12511, and I disagree with the
> conclusion of discarding this patch "package/rng-tools: make
> jitterentropy conditional".
>
> If I understand correctly:
>
>  - If you have a hardware RNG, the jitterentropy library is not
>    necessary.
>

Right,  jitterentropy  is a fall back if there isn't a hardware RNG
setup.  The performance impacts of having it enabled when there is a
hardware RNG were improved between versions and that was the
motivation to drop this patch as it didn't seem to still be a bug
(having it enabled when it isn't really needed).

>  - If you don't have a hardware RNG, rng-tools will error out, unless
>    jitterentropy support is enabled.

Correct.

>
> So, we really want to make the jitterentropy support in rng-tools
> optional, and leave it up to the user to enable it if (s)he has no
> hardware RNG available. And if there's no hardware RNG and no
> jitterentropy support, rng-tools will error out, the service will fail
> to start, and that's good. So the trick with the special 66 return code
> is not necessary.
>
> Do you agree ?

I agree, we should drop that rngd.service change but still keep the
option where a user could add the jitterentropy library if they need
it.

Regards,
Matt
