From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2019 18:06:32 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/alsamixergui: fix build with latest alsa-lib
In-Reply-To: <20191227215429.2326216-1-fontaine.fabrice@gmail.com>
References: <20191227215429.2326216-1-fontaine.fabrice@gmail.com>
Message-ID: <20191229170632.GY26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-12-27 22:54 +0100, Fabrice Fontaine spake thusly:
> alsa-lib created a separated libatopology library since version 1.2.1:
> https://github.com/alsa-project/alsa-lib/commit/75d393a563efb578c79364a277087c6326267f52
> 
> However, atopology is not correctly detected when cross-compiling so
> pass ac_cv_lib_atopology_snd_tplg_new=yes
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/564c1561e83e0c064f3859d25e68dec96640e060
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for your patch. I did not like that we were overriding thoses
tsts, especially since the test for atopology *is* provide by alsa-libs
in their own m4 macros, so it was dubious it was flawed.

In fact, the problem was our own existing patch to configure.in, which
is flawed. So I fixed the stuff and sent an updated patch; please see
there for further explanations:

    https://patchwork.ozlabs.org/patch/1216121/

Thanks for prompting my analysing the thing. :-)
(My, the wonders we can find in such legacy code...)

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Set ac_cv_lib_atopology_snd_tplg_new=yes instead of 
>  --disable-alsatest --enable-alsa-topology
> 
>  package/alsamixergui/alsamixergui.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
> index 24e2497f3b..c8e9ce4f73 100644
> --- a/package/alsamixergui/alsamixergui.mk
> +++ b/package/alsamixergui/alsamixergui.mk
> @@ -14,7 +14,8 @@ ALSAMIXERGUI_AUTORECONF = YES
>  ALSAMIXERGUI_CONF_ENV = \
>  	ac_cv_lib_fltk_numericsort=yes \
>  	ac_cv_lib_fltk_fl_numericsort=yes \
> -	ac_cv_lib_asound_snd_ctl_open=yes
> +	ac_cv_lib_asound_snd_ctl_open=yes \
> +	ac_cv_lib_atopology_snd_tplg_new=yes
>  
>  ALSAMIXERGUI_DEPENDENCIES = fltk alsa-lib
>  
> -- 
> 2.24.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
