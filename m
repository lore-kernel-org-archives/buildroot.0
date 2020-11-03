From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Nov 2020 22:23:04 +0100
Subject: [Buildroot] [PATCH 2/3] package/systemd: fix telinit-path and
 add missing pat options
In-Reply-To: <20200710234150.185609-2-nolange79@gmail.com>
References: <20200710234150.185609-1-nolange79@gmail.com>
 <20200710234150.185609-2-nolange79@gmail.com>
Message-ID: <e6bf17da-067f-92e5-c202-135c1cc0432d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Norbert,

On 11/07/2020 01:41, Norbert Lange wrote:
> If paths are not set, then meson will search the host system for the
> binaries (or the target, where those binaries are not yet installed).
> So add the missing paths.

 Applied to master, thanks, except:

> 
> Also fixup the path to telinit (nice way to get a build path into the binary).

 ... since in the end we explicitly removed sysv support from the config,
keeping telinit makes no sense.

 So, in a separate patch, I set telinit_path to nothing (like it's done for the
other sysv stuff).

 I also pushed a follow-up patch that sorts the options.

 Regards,
 Arnout

> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/systemd.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 05d8cb4934..176adb434a 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -32,12 +32,16 @@ SYSTEMD_CONF_OPTS += \
>  	-Dsplit-usr=false \
>  	-Dsystem-uid-max=999 \
>  	-Dsystem-gid-max=999 \
> -	-Dtelinit-path=$(TARGET_DIR)/sbin/telinit \
> +	-Dquotaon-path=/usr/sbin/quotaon \
> +	-Dquotacheck-path=/usr/sbin/quotacheck \
>  	-Dkmod-path=/usr/bin/kmod \
>  	-Dkexec-path=/usr/sbin/kexec \
>  	-Dsulogin-path=/usr/sbin/sulogin \
>  	-Dmount-path=/usr/bin/mount \
>  	-Dumount-path=/usr/bin/umount \
> +	-Dloadkeys-path=/usr/bin/loadkeys \
> +	-Dsetfont-path=/usr/bin/setfont \
> +	-Dtelinit-path=/sbin/telinit \
>  	-Dnobody-group=nogroup \
>  	-Didn=true \
>  	-Dnss-systemd=true
> 
