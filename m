From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 22:04:37 +0100
Subject: [Buildroot] [PATCH v2] package/pkgconf: fix behavior of
 pkg-config --version
In-Reply-To: <20190102173639.30553-1-thomas.petazzoni@bootlin.com>
References: <20190102173639.30553-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190103220437.29005bbc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Jan 2019 18:36:38 +0100, Thomas Petazzoni wrote:
> For some odd reason, the new pkg-config 1.5.3 changed the behavior of
> "pkg-config --version": as soon as another argument than "--version"
> is passed, the code assumes the user wanted to run "--modversion"
> instead.
> 
> Sadly, this breaks badly with our pkg-config wrapper that
> unconditionally passes --static to pkg-config when
> BR2_STATIC_LIBS=y. When ffmpeg calls "pkg-config --version" to test if
> pkg-config is available and functional, it's actually "pkg-config
> --static --version" that gets executed. pkg-config assumes that the
> user wanted to use --modversion and bails out with an error.
> 
> This causes a build failure of ffmpeg in BR2_STATIC_LIBS=y
> configuration.
> 
> This misbehavior of pkg-config has been reported upstream at
> https://git.dereferenced.org/pkgconf/pkgconf/issues/19, but until it
> gets fixed, we work around the issue by reverting the commit that does
> the "hey let's assume you're using --modversion if --version is passed
> with more than one argument".
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ed82a95e1866ea2caadbb3433b2a255b2cf621d2/
>   (and plenty of other ffmpeg + BR2_STATIC_LIBS=y build failures)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes since v1:
> - Revert the problematic upstream commit instead of doing a workaround
>   specific to the -static option.
> ---
>  ...me-modversion-insted-of-version-if-o.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
