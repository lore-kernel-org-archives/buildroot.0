From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 16:19:10 +0200
Subject: [Buildroot] [PATCH 2/2 v8] core/pkg-cmake: ensure no package
 needs a cmake newer than we do
In-Reply-To: <51cc816673de51799d4f86a7045ef4f480fbab46.1473717489.git.yann.morin.1998@free.fr>
References: <cover.1473717489.git.yann.morin.1998@free.fr>
 <51cc816673de51799d4f86a7045ef4f480fbab46.1473717489.git.yann.morin.1998@free.fr>
Message-ID: <20160917161910.2844c351@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 23:59:20 +0200, Yann E. MORIN wrote:
> If the existing host cmake is deemed usable, we now skip building our
> own variant.
> 
> However, in the following conditions, the build would fail:
> 
>   - host cmake: 3.2
>   - Buildroot requirement: 3.1
>   - package requirement: 3.4
>   - cmake package in Buildroot: 3.5
> 
> This is because Buildroot would consider that cmake-3.2 is usable (and
> it technically is for Buildroot, which requires 3.0), but the package
> will fail at configure time.
> 
> To catch this situation and fix Buildroot, we add a post-patch hook that
> checks that, amongst all cmake versions required by the package, the
> version required by Buildroot is at least equal or higher.
> 
> We do use a post-patch hook rather than the more expected pre-configure
> hook, to avoid having to build all the package dependencies just to
> check the cmake version.
> 
> Exclude the cmake (target variant) from that check, since it requires
> cmake >= 3.4. However, that requirement is only for the tests, and we're
> not building them; all the other parts of the build have no requirement
> besides a cmake >= 2.8). Bumping the version Buildroot requires to 3.4
> would almost always defeat the purpose of this change, as a lot of
> not-so-old distributions are still using cmake < 3.4; only very recent
> ones released since the end of 2015 would stand a chance of having such
> a cmake version. So we just exclude cmake from that check.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Davide Viti <zinosat@tiscali.it>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

As was said by others, I don't really like this solution. It's
complicated, it doesn't work in all cases, and covers a situation where
the error message is already going to be fairly explicit.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
