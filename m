From: Spenser Gilliland <spenser309@gmail.com>
Date: Tue, 14 Feb 2012 09:53:07 -0600
Subject: [Buildroot] [git commit branch/next] DOWNLOAD_WGET: use -O
 instead of -P to set output file
In-Reply-To: <20120214115140.4C70390A99@busybox.osuosl.org>
References: <20120214115140.4C70390A99@busybox.osuosl.org>
Message-ID: <CA+appbOppm780+jAe6LKqGR9mendwqdtvfTEB=Cntrz=5RynSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm having an issue with this patch.  The semicolons in the url are
being interpreted literally.  This leads to the following being
downloaded instead of the latter.

--2012-02-14 09:43:24--  http://git.xilinx.com/?p=xldk/microblaze_v2.0.git

vs

--2012-02-14 09:43:24--
http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;f=microblze-unknown-linux-gnu.tgz

The toolchain is downloaded using the following lines in
toolchain/toolchain-external/ext-tool.mk.

TOOLCHAIN_EXTERNAL_SITE="http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;f="
TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz

Thanks,
Spenser

On Tue, Feb 14, 2012 at 5:07 AM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=cf2486bf317e4bbf88c801fb96183ba62be78cc8
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next
>
> Some URLs use url-encoded arguments to specify the file to download.
> Wget will then use an output file name which includes all the ampersands
> and such. ?However, this is not what we see from buildroot.
>
> E.g.:
> FOO_SITE="http://git.foo.com/?p=foo.git;a=blob;f="
> FOO_SOURCE="foo.tgz"
>
> wget will download this into $(DL_DIR)/index.html?p=foo.git;a=blob;f=foo.tgz
> buildroot thinks it's in $(DL_DIR)/foo.tgz
>
> To make sure the view of wget and buildroot are consistent, specify
> the output file explicitly.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
> ?package/Makefile.package.in | ? ?2 +-
> ?1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index 33461b4..ea44c6c 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -238,7 +238,7 @@ endef
>
> ?define DOWNLOAD_WGET
> ? ? ? ?test -e $(DL_DIR)/$(2) || \
> - ? ? ? $(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
> + ? ? ? $(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1))/$(2)
> ?endef
>
> ?define SOURCE_CHECK_WGET
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Spenser Gilliland
Computer Engineer
Illinois Institute of Technology
