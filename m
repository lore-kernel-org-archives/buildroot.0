From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:55:12 +0200
Subject: [Buildroot] [PATCH] 2017.02.x: update hash file for libnl
 3.2.27 patch
In-Reply-To: <1498841436-24941-1-git-send-email-julien.boibessot@free.fr>
References: <1498841436-24941-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20170702235512.723ed0da@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 18:50:36 +0200, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> Corresponding patch is generated on the fly by github. It seems like
> generation method has changed, resulting to slightly different patch,
> so update BR hash file accordingly.
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  package/libnl/libnl.hash | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

We had some lengthy discussion about it. The problem with your patch is
that it will break things for users of non-updated Buildroot versions.

Currently (without your patch), what happens is that Buildroot tries to
download the patch from Github, fails because the hash is wrong, and
then falls back to sources.buildroot.net which has the patch matching
the hash.

Once we apply your patch, users of the updated version of Buildroot
(with your patch) will be able to get the correct patch from Github.
However, sources.buildroot.net will also automatically fetch the new
patch.

Therefore, users of non-updated Buildroot will try to:

 1. Fetch from Github, which fails because the hash doesn't match

 2. Fetch from sources.buildroot.net, which fails because the hash
    doesn't match either

I.e, with your patch, we break the build for existing Buildroot users.

So, like we are about to do in the master branch for all packages, what
we are going to do here is that we will bring the libnl patch inside
package/libnl/ instead of downloading it from Github.

Peter Korsgaard will work on this soon. In the mean time, I'll mark
your patch as Rejected in patchwork.

Thanks for having reported the issue in the first place!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
