From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 12 Mar 2019 08:33:53 -0500
Subject: [Buildroot] [PATCH 2/5 v2] toolchain: set the ssp gcc option in
 kconfig
In-Reply-To: <6137_1552392582_5C87A186_6137_469_1_14193bcc-af2f-41d0-987f-c3154c37b38c@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
References: <cover.1552392456.git.yann.morin@orange.com>
 <6137_1552392582_5C87A186_6137_469_1_14193bcc-af2f-41d0-987f-c3154c37b38c@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
Message-ID: <CANQCQpYGV9TbwGK3p9DR_MXC2_PXavR-E=6t0bs60nct4Sd=BA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,


On Tue, Mar 12, 2019 at 7:10 AM <yann.morin@orange.com> wrote:
>
> From: "Yann E. MORIN" <yann.morin@orange.com>
>
> Currently, we repeat all the SSP level selection deep down to the
> toolchain wrapper itself, where we eventually translate it to the
> actual SSP option to use. This is a bit redundant.
>
> Additionally, we will want to check that the toolchain actually
> supports that option (for those toolchain where it was backported).
>
> So, move the translation into kconfig, and add the qstrip'ed value
> to the additional flags passed to the wrapper. Add it before
> user-supplied opitons, to keep the previous behaviour (and allow
> anyone crazy-enough to override it with BR2_TARGET_OPTIMIZATION).
>
> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> ---
> Changes v1 -> v2:
>   - use TOOLCHAIN_WRAPPER_OPTS  (Arnout)
> ---
>  Config.in                      | 6 ++++++
>  toolchain/toolchain-wrapper.c  | 9 ---------
>  toolchain/toolchain-wrapper.mk | 9 +--------
>  3 files changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/Config.in b/Config.in
> index d58d8dc04a..757ad1ca40 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -764,6 +764,12 @@ config BR2_SSP_ALL
>
>  endchoice
>
> +config BR2_SSP_OPTION
> +       string
> +       default "-fstack-protector"        if BR2_SSP_REGULAR
> +       default "-fstack-protector-strong" if BR2_SSP_STRONG
> +       default "-fstack-protector-all"    if BR2_SSP_ALL
> +
>  comment "Stack Smashing Protection needs a toolchain w/ SSP"
>         depends on !BR2_TOOLCHAIN_HAS_SSP
>

Much cleaner then when I pulled SSP into the wrapper :-)
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
