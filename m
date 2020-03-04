From: Mircea GLIGA <mgliga@bitdefender.com>
Date: Wed, 4 Mar 2020 15:02:45 +0000
Subject: [Buildroot] [PATCHv2] Makefile: work around a bug in newly
 released make 4.3
In-Reply-To: <20200304134037.24237-1-yann.morin.1998@free.fr>
References: <20200304134037.24237-1-yann.morin.1998@free.fr>
Message-ID: <b80fa303-8c03-b6e0-81dc-a4ce9d4c96ed@bitdefender.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've tested the patch against master and using a br2-external tree and
it works.

I've also tested it against buildroot-2019.02.9, but there it needs
to be adjusted accordingly:

`$(BASE_DIR)/.br-external.mk:;`

BR
Mircea

On 3/4/20 3:40 PM, Yann E. MORIN wrote:
> Several users of rolling-release distributions have been reporting on
> IRC that Buildroot is broken now that they have switched to the newly
> released make 4.3.
> 
> It turns out that the constructs we use to generated and onclude the
> internal br2-external related fragments is no longer working with
> make-4.3.
> 
> Indeed, an upstream bug report [0] seems to imply that it so far was
> working by chance. There has been no further feedback, whether this is
> really considered a fix for a previous ill-defined behaviour, or an
> actual regression...
> 
> In the meantime, we add a workaround, suggested in that same bug report,
> that fixes the issue for make 4.3, and that should not break on older
> make versions either (verified on all relevant versions: from 3.81,
> 3.82, 4.0, 4.1, and 4.2).
> 
> [0] https://savannah.gnu.org/bugs/?57676
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Mircea Gliga <mgliga@bitdefender.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> Changes v1 -> v2:
>    - [0] points to something now  (Thomas)
>    - repeat the bug URL in the Makefile  (Thomas)
>    - explain where the workaround comes from  (Thomas)
> ---
>   Makefile | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 31624f77a2..09e769f613 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -188,6 +188,9 @@ ifneq ($(BR2_EXTERNAL_ERROR),)
>   $(error $(BR2_EXTERNAL_ERROR))
>   endif
>   
> +# Workaround bug in make-4.3: https://savannah.gnu.org/bugs/?57676
> +$(BASE_DIR)/.br2-external.mk:;
> +
>   # To make sure that the environment variable overrides the .config option,
>   # set this before including .config.
>   ifneq ($(BR2_DL_DIR),)
> 
