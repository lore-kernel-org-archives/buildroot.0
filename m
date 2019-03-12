From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 12 Mar 2019 08:50:58 -0500
Subject: [Buildroot] [PATCH 5/5 v2] toolchain: allow PIC/PIE without
 RELRO
In-Reply-To: <16391_1552392582_5C87A186_16391_281_1_704ea354-404e-4e6b-af91-9e63897e78c9@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
References: <cover.1552392456.git.yann.morin@orange.com>
 <16391_1552392582_5C87A186_16391_281_1_704ea354-404e-4e6b-af91-9e63897e78c9@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
Message-ID: <CANQCQpaWDAmxxZqzR0wushhhuva9QG7dPO45HU81h1LKa8h5TQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,
On Tue, Mar 12, 2019 at 7:09 AM <yann.morin@orange.com> wrote:
>
> From: "Yann E. MORIN" <yann.morin@orange.com>
>
> In commit 7484c1c3b806 (toolchain/toolchain-wrapper: add BR2_RELRO_),
> we added the PIC/PIE flags, but based on the RELRO_FULL condition.
>
> It is however totally possible to do a PIC/PIE executable without
> RELRO_FULL, as it is also valid to do a PIC/PIE build with RELRO_PARTIAL.
>
> Add a new option that now governs the PIC/PIE flags.
>
> Note: it is unknown if RELRO_FULL really needs PIC/PIE or not, so we
> keep the current situation, where RELRO-FULL forces PIC/PIE compilation.
> Decoupling can come later from an interested party.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  Config.in                      | 8 ++++++++
>  toolchain/toolchain-wrapper.c  | 2 +-
>  toolchain/toolchain-wrapper.mk | 4 ++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/Config.in b/Config.in
> index d5a0460f98..31fea3ab34 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -712,6 +712,13 @@ endmenu
>
>  comment "Security Hardening Options"
>
> +config BR2_PIC_PIE
> +       bool "Build code with PIC/PIE"
> +       depends on BR2_SHARED_LIBS
> +       help
> +         Generate Position-Independent Code (PIC) and link
> +         Position-Independent Executables (PIE).
> +
>  choice
>         bool "Stack Smashing Protection"
>         default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
> @@ -794,6 +801,7 @@ config BR2_RELRO_PARTIAL
>
>  config BR2_RELRO_FULL
>         bool "Full"
> +       select BR2_PIC_PIE

In the previous email chain it was being discussed if PIC/PIE was
required for full RELRO.  Like you guys mentioned, I believe it was
always just lumped into the configuration the other distros called
"full".  However, I'm pretty sure they are independent and you could
have full RELRO without PIC/PIE  (I did not test this theory, just
checked some docs and the theory holds).  I'd be on the fence if we
should remove this select and keep the BR2_PIC_PIE as something you'd
need to independently set if you want it with BR2_RELRO_FULL.  I
guess, better to make that sort of change now then after more time has
gone by.

>         help
>           This option includes the partial configuration, but also marks
>           the GOT as read-only at the cost of initialization time during
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index c73a0cc079..7a4b9c4007 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -367,7 +367,7 @@ int main(int argc, char **argv)
>                 *cur++ = "-Wno-builtin-macro-redefined";
>         }
>
> -#ifdef BR2_RELRO_FULL
> +#ifdef BR2_PIC_PIE

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
