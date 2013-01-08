From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Jan 2013 07:50:51 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: export BR2_CONFIG_FILE,
 pointing to our .config
In-Reply-To: <fd01d05b62a384b43722e790e3e491f87c818797.1357595083.git.yann.morin.1998@free.fr>
References: <cover.1357595083.git.yann.morin.1998@free.fr>
 <fd01d05b62a384b43722e790e3e491f87c818797.1357595083.git.yann.morin.1998@free.fr>
Message-ID: <50EBC1CB.8030900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Yann,

On 07/01/13 22:52, Yann E. MORIN wrote:
> Support scripts (in support/) may need to parse the .config file,
> so give them an easy access to it, by exporting CONFIG_FILE with
> the fully-qualified path to .config.

  Good idea!

>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> ---
>   Makefile |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4b09437..7a2902d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -91,6 +91,10 @@ EXTRAMAKEARGS = O=$(O)
>   NEED_WRAPPER=y
>   endif
>
> +# Scripts in support/ may need to parse out .config, so give
> +# them easy access
> +export BR2_CONFIG_FILE=$(CONFIG_DIR)/.config.

  Convention is that BR2_* is set by Kconfig. I kind of like that, it 
helps us developers to understand a variable's meaning.

  [Yes, BR2_DEFCONFIG which I introduced myself is an exception. However, 
I have a pending patch that moves it into the .config :-)]

> +
>   # Pull in the user's configuration file
>   ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
>   -include $(CONFIG_DIR)/.config

  I would replace the occurences of the plain config file with 
$(CONFIG_FILE). $(CONFIG_FILE).nopkg does indeed look stupid, so that one 
should be left alone.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
