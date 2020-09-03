From: Christian Stewart <christian@paral.in>
Date: Thu, 3 Sep 2020 11:39:26 -0700
Subject: [Buildroot] More maintainers
In-Reply-To: <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200827223956.7cb87050@windsurf.home> <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
Message-ID: <CA+h8R2qjNPgNKov6KZh6GvJHPf7AJGVC8FVWKE-BzUJTYz4nbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'd first like to clarify that my personal opinion is to maintain the
current email patch and review system for Buildroot proper. It's
certainly true that submitting patches is not anywhere near as
difficult as understanding what's going on Buildroot.

However, there's room for more experimental and fast-paced work in
downstream repositories, which then filter the stuff that works (with
the "lessons learned" applied) back up to the "gold standard"
Buildroot mainline repository. (Similar to how Linus Torvalds has the
"gold standard" Linux repo, but there are also downstream forks).

It really boils down to what the users are trying to do. If you want
to use Buildroot as it is today you need to know a lot about Linux,
that's just it. There's no focus on ease of use, and /there shouldn't
be/ since that's not the point of the project.

The key to bringing Buildroot to a wider audience would be to make it
as easy to build and install to a target platform as any of the other
distributions, if not easier. Most of the time, the issue reports and
bugfixes for this will be around configuration tweaks, additional
hardware support configs and packages (which are eventually
upstreamed), experimental Buildroot features, and bug reports + CI/CD
+ fixes (which are eventually upstreamed).

In the interest of increasing my own patch submission quality, I have
a CI/CD set up on my Buildroot repository (GitHub Actions) which
contains check-package etc, as well as a test build. There are also
Git hooks which run check-package on pre-commit. This has been
immensely helpful for me and has caught many bugs before pushing.

In the interest of implementing an easy to use and install variant of
Buildroot, which might one day be as simple as a point and click
operation to deploy to your laptop or desktop or Raspberry Pi or what
have you, I've been working on SkiffOS
https://github.com/skiffos/skiffos - which just passed its 1000th
commit. Skiff is built around the concept of booting Buildroot as an
initramfs for containers, however it can build just about any
Buildroot workflow. The tx2 config uses a traditional ext4 root
filesystem for example (temporarily).

On that repository I've also set up GitHub Actions with CI/CD, PR
reviews, automated testing of changes with check-package. I've built a
clean architecture for separating out board support and experimental
features into "layers" which can contain configuration fragments or
buildroot extension packages and be merged together into a final board
config on-the-fly, creating a reproducible output across devices. But
most importantly, I'm being careful to submit everything that might be
useful or a bugfix back up to the Buildroot mainline project whenever
it reaches a certain level of testing and maturity.

Perhaps Skiff could be a good community project to test out some of
these more "2020" approaches. I'm not saying my project is the only
one or even the right one for this, but I'm happy to put in the time
to make this happen.

The process would then be (for those of us that want to work quickly):

 - Add a new board, experimental feature, or fix to Skiff
 - Test it out through the "next" and "master" and "stable" release channels
 - Once a fix is known to work (or is urgent enough), submit it to
upstream with multiple reviewed-by already attached to the series upon
submission to the mailing list.
 - For those that don't want to or don't know how to use email
patches, the Skiff maintainers can do this work.

I think this & other downstream projects following a similar approach
would be the best way to scale this up and finally crunch through this
patch backlog. Especially when some of the patches in the backlog are
adding new packages, which could be brought in as external packages
during the "experimental" phase. I followed this process recently with
Apple Macbook and NVIDIA TX2 support.

Replies below:

On Thu, Sep 3, 2020 at 8:44 AM Avraham Shukron
<avraham.shukron@gmail.com> wrote:
>
> On Thu, Sep 3, 2020, 01:20 Christian Stewart <christian@paral.in> wrote:
>>
>> Discoverability is a problem right now, there's too many patches and
>> no way to subscribe to a given series for further updates (similar to
>> Pull Requests on GitHub), unless the submitter happens to add you to
>> the CC list - which, by the way, usually happens if you add a review.
>>
>> Today, probably the best approach is to hunt through the backlog
>> (sorted by reviewed-by priority order) and cherry-pick some of these
>> series into downstream, more "experimental" repositories. Then, once
>> they've been tested there, you can submit a Reviewed-By back upstream
>> to indicate that it was useful and worth merging more urgently.
>
>
> For what it's worth I think that the mail-based contribution process is part of the problem.
> With a decent Git server like GitHub/GitLab patches could be reviewed more easily.
> A CI pipeline could run tests that will give immediate feedback for any pull request.
> More importantly, it'll dramatically reduce the barrier for new and young contributors.

Have a look at:

 - https://github.com/skiffos/skiffos
 - https://github.com/skiffos/buildroot

Let me know what you think. Every commit is tested and has a build
artifact attached (docker image currently).

> Buildroot is all about using simple and familiar tools like make and Kconfig, and I personally think that this principle should also be applied to the contribution process and right now buildroot is one of the last active open source projects using the mailing list approach.

At the moment these tools you are proposing are, to be fair, not
simple or familiar at all to the industry. They are actually the
opposite, brand new (scary), complex, often operated by third party
companies who often change things without notice or way to revert.

This is fine for those of us that don't have major companies and
potentially safety-critical embedded projects in the downstream at
this time.

On Thu, Sep 3, 2020 at 9:24 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> This has been discussed multiple times in the past in Buildroot, and in
> other open-source projects. There is even as we speak some pretty
> intense debate in the Linux kernel community about this.
>
> As we've seen from the discussion here, the Buildroot issue is not a
> lack of contribution, but a lack of review from trusted and experienced
> reviewers, and a lack of maintainers time. So while I'm all for new
> contributors and contributions, I don't think reducing the barrier is
> really key here. Also, I've always been skeptical about this statement
> that using Github reduces the barrier to entry. When you contribute to
> a project, is really sending a patch over e-mail the difficult part
> compared to understanding the code base, debugging the issue you've
> found or implementing the feature you wanted ? Really installing "git
> send-email" is a no-brainer straightforward process that is
> ridiculously easy even compared writing any single change in the code
> base with a decent commit message. Aren't we using this "reducing the
> barrier" argument a bit inappropriately here ?

I agree wholeheartedly with this, for the purposes of what Buildroot
is and is trying to be. For the purposes of distributing Buildroot as
an easy to use downstream distribution, and for testing out patches in
more experimental environments before promoting them to Buildroot
mainline, I disagree. The other tools will lower the barrier to entry
of people submitting patches and increase traffic, but also lowers the
barrier of entry to the maintainers merging things in specifically
defined experimental contexts or branches.

>
> I believe I can say that all four Buildroot maintainers have a very
> strong preference for and a very optimized workflow to work with e-mail
> based patch submission and review.

...I've come to respect this workflow over time and try to emulate it
as much as possible in my other projects.

> Somewhat related, recently a patch series I submitted last year to
> OpenWrt (which wasn't merged) got picked up by someone else, and
> re-submitted with new updates and fixes. Due to being the original
> author, I was in copy of all the Github discussion that took place. And
> I found it absolutely impossible and awful to follow the different
> revisions of the patch series, to which version of the patch series the
> comments were being made, etc.

To be fair: this has been recently improved and the story is quite a
bit better for PR reviews today. I'm no fan of using a closed source
Git frontend but due to the nature of Git and the ephemeral nature of
these pull requests, it's not really an issue for me on a downstream
project. The advantage is the discoverability of having it on that
platform.

> Perhaps for some people the Github pull request workflow makes sense,
> but I believe it's important to recognize and realize that there are
> also people for which this workflow doesn't make sense.

Absolutely.

Best regards,
Christian Stewart
