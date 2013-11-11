From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Nov 2013 12:27:50 +0100
Subject: [Buildroot] [PATCH v2] alsa-lib: FLAT: Disable alsa lib when
 FLAT bianry is selected.
In-Reply-To: <1384165462-22255-1-git-send-email-Sonic.adi@gmail.com>
References: <1384165462-22255-1-git-send-email-Sonic.adi@gmail.com>
Message-ID: <CAAXf6LWHUv27bygzbYjP+ke1BA1mfbnpuvHBPQx-s8xrHcvnOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sonic,

On Mon, Nov 11, 2013 at 11:24 AM,  <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> Alsa lib depends on the runtime library loader.
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  package/alsa-lib/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
> index df05240..170a563 100644
> --- a/package/alsa-lib/Config.in
> +++ b/package/alsa-lib/Config.in
> @@ -9,14 +9,15 @@ config BR2_PACKAGE_ALSA_LIB
>         # the usage of alsa-lib on no-thread systems is pretty
>         # unlikely, just require thread support globally for alsa-lib.
>         depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_BINFMT_FLAT
>         help
>           The Advanced Linux Sound Architecture (ALSA) provides audio and MIDI
>           functionality to the Linux operating system.
>
>           http://www.alsa-project.org/
>
> -comment "alsa-lib needs a toolchain w/ threads"
> -       depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "alsa-lib needs a toolchain w/ threads and none FLAT binary format"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_BINFMT_FLAT

This is not what I meant. The comment should not mention the
dependency on flat, but rather the comment should only be visible if
that dependency is met, so:

comment "alsa-lib needs a toolchain w/ threads"
       depends on !BR2_BINFMT_FLAT
       depends on !BR2_TOOLCHAIN_HAS_THREADS

(note that this does not yet take into account the other comments you
received from ThomasP, Gustavo, ...)
