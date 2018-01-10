From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jan 2018 13:41:19 +0100
Subject: [Buildroot] [PATCH v2 01/13] pkg-{download,
 generic}: remove source-check
In-Reply-To: <CAAXf6LXwWBpJeosSW=B5J50f_aVO8OUvCD7E8F9M_GgSOcta-w@mail.gmail.com>
References: <20171025201003.16105-1-ps.report@gmx.net>
 <20171025201003.16105-2-ps.report@gmx.net>
 <20180108212827.4d876213@windsurf>
 <CAAXf6LXwWBpJeosSW=B5J50f_aVO8OUvCD7E8F9M_GgSOcta-w@mail.gmail.com>
Message-ID: <20180110134119.45575a9e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Jan 2018 13:04:03 +0100, Thomas De Schampheleire wrote:

> I saw this on the agenda of the FOSDEM developer days, so thought it
> would be discussed there before going forward with applying this. I
> should have expressed my concerns on the patch immediately, sorry.

No problem. It's never too late to revert something, or re-introduce it
in a different form.

However, my plan is in fact to get the Git download caching stuff
merged for 2018.02, hence before the meeting at FOSDEM. I've recently
worked on a few projects were the kernel is hosted in Git and regularly
changed, and the full git clone every time you update the kernel is
simply horrible, and makes Buildroot pretty much unusable.

> In fact, just recently I did start using 'make source-check' in our
> environment. There are two use cases:
> 1. Our Buildroot tree contains a few packages with in-house source
> code. They are typically Mercurial repositories. A developer changing
> code in such a repository is expected to push to that repository and
> then update the revision hash in the Buildroot .mk file (or if it
> concerns a Linux/Uboot tree in the defconfig file).
> Now, it sometimes happens that people update the hash but forget to
> push the corresponding changes to the package's repository. This is of
> course human error. In our delivery system (where people don't push
> directly to the main repo but rather to some staging area where
> changes are first automatically validated), it would be caught by
> making a build, but this takes quite some time, order of 1 hour (we
> have many defconfigs). Hence, we added an initial check to our
> delivery system that just performs 'make source-check' for all
> defconfigs. This only takes a few minutes. Deliveries that fail the
> check are thus rejected very quickly and no computing resources are
> lost.
> 
> 2. Besides the in-house repositories, there is a use case even for
> normal open-source packages. We have an internal BR2_PRIMARY_SITE set
> up, that avoids package downloads over the internet. As we need to
> guarantee reproducibility over a long time span, we cannot rely on
> external sources and we need to mirror all packages used to that
> primary site. Developers that enable new packages (or bump one) are
> expected to upload the new sources to the primary site, but again may
> forget to do so.
> Again, this would be caught by the build step that takes ~1 hour,
> while the source-check target would detect it in minutes.
> 
> Doing a 'make source' rather than 'make source-check' is an
> alternative, but it takes longer and consumes much more network
> bandwidth.
> 
> I would therefore like to find a way to reintroduce 'make
> source-check', but of course taking into account the reasons of
> removing it in the first place. Perhaps another implementation can be
> found using the dl-wrapper.

We can definitely re-introduce a "make source-check" implementation. It
was mainly dropped because we had no identification anyone was really
using it.

Perhaps we could for now have "make source-check" implemented by doing
"make source", and later on re-optimize it?

As I said, I'd really to have this Git caching stuff merged in 2018.02.
The source-check removal has been on the mailing list since July 2017,
and nobody complained, until today. So while I do acknowledge that
there are some use cases for source-check, I'm not really willing to
delay merging the Git caching stuff just because source-check will be
missing. But maybe re-adding source-check is not that hard, and can be
done before 2018.02 as well.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
