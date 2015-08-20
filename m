From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 20 Aug 2015 07:42:39 -0500
Subject: [Buildroot] [PATCH v4 2015.08 3/4] Makefile: implement a
 size-stats target
In-Reply-To: <1432591007-27689-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1432591007-27689-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1432591007-27689-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAMQcK5KM=uRUNOZSqu1vieRe4rc5c8+X6WJE5=M_PFxdbo-42w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 25, 2015 at 4:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This commit implements a size-stats target that calls the script of
> the same name to generate the graph and CSV files related to package
> and file sizes.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index cf244d7..c9b1e72 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -666,6 +666,14 @@ graph-depends: graph-depends-requirements
>         |tee $(GRAPHS_DIR)/$(@).dot \
>         |dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT)
>
> +size-stats:
> +       $(Q)mkdir -p $(GRAPHS_DIR)
> +       $(Q)$(TOPDIR)/support/scripts/size-stats --builddir $(BASE_DIR) \
> +               --graph $(BASE_DIR)/graphs/graph-size.$(BR_GRAPH_OUT) \
> +               --file-size-csv $(BASE_DIR)/build/file-size-stats.csv \
> +               --package-size-csv $(BASE_DIR)/build/package-size-stats.csv \
> +               --skeleton-path $(TARGET_SKELETON)

In order to make this patch series to continue to work with the recent
addition of the skeleton package, the --skeleton-path variable needs
to be updated to:

   --skeleton-path $(SKELETON_PATH)

I don't know if you have already updated this or not in your patch
series but this change needs to be in order to have the graph
statistics work.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
