From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Dec 2018 17:40:04 +0100
Subject: [Buildroot] Submodule granularity instead of LIB_GIT_SUBMODULES
In-Reply-To: <ea-mime-5bfeb41d-7336-2fa4e677@www-6.netcourrier.com>
References: <ea-mime-5bfeb41d-7336-2fa4e677@www-6.netcourrier.com>
Message-ID: <8f33142c-71ad-24c6-bad4-deea26f05ce6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/11/2018 16:28, lpdev at cordier.org wrote:
> Hi there,
> 
> I have a repository that have few submodules:
> - myLib
> ? -> submodule1 (~10MB)
> ? -> submodule2 (8GB)
> 
> Actually I don't need to initialize submodule2 because myLib does not request it
> while compiling for my buildroot distro.
> 
> The option xxx_GIT_SUBMODULES is doing a recursive init on all submodules of the
> project. As I am using Buildroot 2018.02, there is no support for the latest git
> patches that improve the overall space overhead and avoid compressing the repo.
> 
> Each time I am updating the git hash of my package, buildroot is cloning the
> repo, getting the subodules (from scratch), compress tar it, and then start the
> compilation. I was wondering if there is a way to specify _GIT_SUBMODULES to no,
> but still get the submodule1, without breaking buildroot's download philosophy.

 No, there's no simple way to do that. And adding the infrastructure to do that
would lead us way too far.

 However, what you can do is to leave _GIT_SUBMODULES to NO, add submodule1 as
<PKG>_EXTRA_DOWNLOADS and extract it in a <PKG>_POST_EXTRACT_HOOK.  This does
mean you have to manually

 Unfortunately, I'm not sure if it is possible to use the git download method
for extra downloads. You can add git+ in front of the URL, but I don't think
there's a way to specify the ref to check out... So perhaps you'll instead have
to define a post-download hook that calls dl-wrapper directly...

 Regards,
 Arnout
