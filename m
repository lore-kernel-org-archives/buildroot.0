From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Sun, 4 Mar 2012 23:50:00 +0100
Subject: [Buildroot] [PATCH] pkg-infra: Fix wget -O
In-Reply-To: <1330895423-14763-1-git-send-email-arnout@mind.be>
References: <1330895423-14763-1-git-send-email-arnout@mind.be>
Message-ID: <CAM+bi4uvSDFXsH2tMcwE9SE5U_1b68uws_2JErT_CLRompM+Og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This should be taken into account when the Microblaze related patches get
applied, since this function is severely modified by one of those patches.

2012/3/4 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> wget -O always creates its output file, so we need a different way to
> detect if the download succeeded or not.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Ideally, wget should have an option to name the downloaded file.
> -O <filename> is in fact fully equivalent to -O - > <filename>...
> Maybe we should move to curl after all? :-)
>
>  package/Makefile.package.in |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index ea44c6c..da6aee0 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -236,9 +236,13 @@ define SHOW_EXTERNAL_DEPS_HG
>  endef
>
>
> +# wget -O ... creates the output file before downloading it, so
> +# it will essentially always succeed.  As a workaround, test that
> +# it is non-empty both before and after.
>  define DOWNLOAD_WGET
> -       test -e $(DL_DIR)/$(2) || \
> -       $(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1))/$(2)
> +       test -s $(DL_DIR)/$(2) || \
> +       $(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1))/$(2) && \
> +       test -s $(DL_DIR)/$(2)
>  endef
>
>  define SOURCE_CHECK_WGET
> --
> tg: (dca6e03..) t/wget (depends on: master)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120304/3c90394b/attachment-0001.html>
