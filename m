From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 22 Nov 2018 19:34:25 -0600
Subject: [Buildroot] Builtin kernel images for the testing infra
In-Reply-To: <366ce074-12af-b962-9b76-febe77a6c0c5@mind.be>
References: <CANQCQpa+p3sxjO9M14ptoxaNWJMZ22FdYOmG_jEwT1pk4mkoDQ@mail.gmail.com>
 <5bf21e60dc34c_14b03ff574120a44459ee@ultri5.mail>
 <20181119092926.2ba493a7@windsurf.home>
 <366ce074-12af-b962-9b76-febe77a6c0c5@mind.be>
Message-ID: <CANQCQpYaWxEJdNBGwpZ7nO6JSV5GvYhF8cTxcPSwNfsahWK+vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,


On Thu, Nov 22, 2018 at 5:02 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 19/11/2018 09:29, Thomas Petazzoni wrote:
> > Hello,
> >
> > On Mon, 19 Nov 2018 00:22:24 -0200, Ricardo Martincoski wrote:
> >
> >> As I see it, these are the steps:
> >> 1 - prefer to reuse the pre-built kernel images that already exist whenever
> >>     possible;
> >> 2 - if that is not enough, build one, preferably based on an existing
> >>     qemu...defconfig;
> >> 3 - when many tests need to build a kernel, check the commonalities between
> >>     them and provide a new pre-built that fits many tests;
> >> 4 - back to 1;
> >> And we are currently in step 2, near to go to step 3.
> >> But that is only my opinion, of course.
> >
> > Yes, fully agreed. The idea of those pre-built kernel images is to save
> > time. For a purely user-space test such as the Python test cases, or
> > Lua test cases, it already takes quite some time to rebuild the Python
> > interpreter for each test case, it would be annoying to rebuild the
> > kernel as well.
> >
> > So it makes sense to provide a few pre-built kernel images for a
> > variety of architectures, with some "sane" kernel configuration.
> >
> > Of course, this doesn't prevent from adding other test cases that will
> > build the Linux kernel:
> >
> >  - To test the Buildroot Linux kernel packaging
> >  - Because we want to build some Buildroot packages that provide kernel
> >    modules, or need some very special kernel configuration options to
> >    be set
> >
> >> Concerning new builtin images, if you want to add a new one, I suppose you
> >> could do this:
> >>  - generate the new image and store it in a public temporary url;
> >>  - add the support in the test infra for this new image and use it in at least
> >>    one test case;
> >>  - test your test case by placing the image in the test-dl or your usual
> >>    BR2_DL_DIR folder. It works even on GitLab CI!, see [1];
> >>  - send the patch for review adding a note below "---" with the url for the
> >>    image to be stored in the current artifacts url;
> >
> > Absolutely.
> >
> >> Since you mentioned version control...
> >> Maybe, in the long term, we could create a separate repo, i.e.
> >> buildroot-runtime-tests-binaries in GitHub and accept merges.
> >> I think people in the list would not like to receive patches with 2-5 MB.
> >> A .txt file along each binary stating how the image was generated (i.e. the
> >> sha1 of buildroot and defconfig name, and even the url for a build in GitLab CI)
> >> would be nice IMO.
> >> Just an idea/example.
> >
> > The way we handle those artifacts right now is very basic, and there
> > are certainly ways of improving that over time.
>
>  We could use gitlab pipelines to handle this. Define gitlab jobs to generate
> the kernel (or whatever), and add dependencies on those.
>
>  The test should then check if the kernel is available, and if not, print
> instructions on where to get them.
>

Maybe this is an opportunity to use the images we're building as part
of the other defconfig test builds?  I'm sure a few kernels would need
some options enabled for virtualization but generally I bet the
images/artifacts would just need to be archived off in a fashion we
could pull from during the run-time tests.  It would give some
coverage of it those images work.

Matt
