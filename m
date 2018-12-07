From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Fri, 7 Dec 2018 12:35:30 -0700
Subject: [Buildroot] [PATCH 1/2] core: make symlinks relative when
 preparing the SDK
In-Reply-To: <054c70a8ee5ddefc0e9592da3913cc54e24d2c35.1544206190.git.yann.morin.1998@free.fr>
References: <cover.1544206190.git.yann.morin.1998@free.fr>
 <054c70a8ee5ddefc0e9592da3913cc54e24d2c35.1544206190.git.yann.morin.1998@free.fr>
Message-ID: <CA+1k=2YBy8jnser2yL-mfjSo+fVVACpQZujLu1xp03Rm3Mt+4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 7, 2018 at 11:10 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> The SDK is supposed to be relocatable, so symlinks must not be
> absolute.
>
> Add a new helper script, that replaces all absolute symlinks with
> relative ones.
>
> The ideal solution would use the shortest relative path for the
> destination, but it is non-trivial to come up with. We just ensure
> the relative path does not cross a common base directory, and compute
> all the paths relative to that anchor.
>
> This can give non-optimum relative symlinks, like:
>     /base-dir/bin/foo -> ../bin/bar
>
> when the optimum would have been:
>     /base-dir/bin/foo -> bar
>
> Finally, as a sanity check, ensure there is not relative symlinl
> pointing out of the base directory, because their targets would be
> missing from the SDK.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Joel Carlson <JoelsonCarl@gmail.com>

Reviewed-by: Joel Carlson <JoelsonCarl@gmail.com>
Tested-by: Joel Carlson <JoelsonCarl@gmail.com>

Applied this patch and patch 2/2 to my branch and made sure the SDK
generated and the symlinks I had seen fail before looked to be
correct.
I also added a few of my own symlinks into host/ with absolute paths
pointing both inside and outside of host/ to test that the cases
caught them.
And I added some relative symlinks that crossed the boundary to make
sure that case was caught as well.
