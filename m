From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Fri, 7 Dec 2018 12:39:45 -0700
Subject: [Buildroot] [PATCH 2/2] core/sdk: don't mangle symlinks with
 '.' or '..' at start
In-Reply-To: <6ce3997e4824d41b50e13b8554e9f7e59e63a8af.1544206190.git.yann.morin.1998@free.fr>
References: <cover.1544206190.git.yann.morin.1998@free.fr>
 <6ce3997e4824d41b50e13b8554e9f7e59e63a8af.1544206190.git.yann.morin.1998@free.fr>
Message-ID: <CA+1k=2ZVBqB3mi-7ZtR+9jkBE2hUoBDvQOEYA6jg87NFd9g3KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 7, 2018 at 11:10 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> From: Joel Carlson <JoelsonCarl@gmail.com>
>
> The current transform changes any '.' at the start of a filename to
> $(BR2_SDK_PREFIX). This also applies to the target of a symlink, when
> it is relative.
>
> We thus might end up with something like:
>     $(BR2_SDK_PREFIX)/bin/aarch64-linux-gnu-ar ->
>     $(BR2_SDK_PREFIX)./opt/ext-toolchain/bin/aarch64-linux-gnu-ar
>
> when it should be:
>     $(BR2_SDK_PREFIX)/bin/aarch64-linux-gnu-ar ->
>     ../opt/ext-toolchain/bin/aarch64-linux-gnu-ar
>
> We fix that by making sure we always remove a known prefix, i.e. we
> remove the path to host dir. The obvious solution would be to cd into
> $(HOST_DIR)/.. , then tar ./host/ and finally use a --transfrom pattern
> as 's,^\./$(notdir $(HOST_DIR)),$(BR2_SDK_PREFIX)'.
>
> Since $(HOST_DIR) can point to a user-supplied location, we don't know
> very well how the pattern may patch.
>
> Instead, we cd into / and tar the full path to $(HOST_DIR).
>
> Since tar removes any leading '/', it would spurr a warning message,
> which is annoying. So we explicitly remove the leading '/' from
> $(HOST_DIR) when we tar it.
>
> Finally, we transform all filenames to replace a leading $(HOST_DIR)
> (without a leading /) to the prefix to use.
>
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> [yann.morin.1998 at free.fr:
>   - use a single transform pattern
>   - use full HOST_DIR path as pattern to replace
>   - update commit log accordingly
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>

So not sure what protocol is on tags when this is essentially v2 of my
own patch, but...
Reviewed-by: Joel Carlson <JoelsonCarl@gmail.com>
Tested-by: Joel Carlson <JoelsonCarl@gmail.com>

Applied this and the first patch to my branch and made sure my SDKs
seemed to have the correct links.
