From: LP C <lpdev@cordier.org>
Date: Tue, 4 Dec 2018 23:51:35 +0100
Subject: [Buildroot] Submodule granularity instead of LIB_GIT_SUBMODULES
In-Reply-To: <8f33142c-71ad-24c6-bad4-deea26f05ce6@mind.be>
References: <8f33142c-71ad-24c6-bad4-deea26f05ce6@mind.be>
Message-ID: <1543963868.local-1e36d9eb-f93e-v1.5.1-da141eaf@getmailspring.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for your reply, I will try this!

On Dec 3 2018, at 5:40 pm, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 28/11/2018 16:28, lpdev at cordier.org wrote:
> > Hi there,
> >
> > I have a repository that have few submodules:
> > - myLib
> > -> submodule1 (~10MB)
> > -> submodule2 (8GB)
> >
> > Actually I don't need to initialize submodule2 because myLib does not request it
> > while compiling for my buildroot distro.
> >
> > The option xxx_GIT_SUBMODULES is doing a recursive init on all submodules of the
> > project. As I am using Buildroot 2018.02, there is no support for the latest git
> > patches that improve the overall space overhead and avoid compressing the repo.
> >
> > Each time I am updating the git hash of my package, buildroot is cloning the
> > repo, getting the subodules (from scratch), compress tar it, and then start the
> > compilation. I was wondering if there is a way to specify _GIT_SUBMODULES to no,
> > but still get the submodule1, without breaking buildroot's download philosophy.
>
>
> No, there's no simple way to do that. And adding the infrastructure to do that
> would lead us way too far.
>
> However, what you can do is to leave _GIT_SUBMODULES to NO, add submodule1 as
> <PKG>_EXTRA_DOWNLOADS and extract it in a <PKG>_POST_EXTRACT_HOOK. This does
> mean you have to manually
>
> Unfortunately, I'm not sure if it is possible to use the git download method
> for extra downloads. You can add git+ in front of the URL, but I don't think
> there's a way to specify the ref to check out... So perhaps you'll instead have
> to define a post-download hook that calls dl-wrapper directly...
>
> Regards,
> Arnout
>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181204/b9ca9683/attachment.html>
