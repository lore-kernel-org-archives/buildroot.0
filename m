From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 31 Jul 2014 12:19:25 -0500
Subject: [Buildroot] [PATCH v2] Add option to copy config file to rootfs
In-Reply-To: <1406820398-2105-1-git-send-email-nroach44@gmail.com>
References: <1406820398-2105-1-git-send-email-nroach44@gmail.com>
Message-ID: <CANQCQpbgRPf+Bk4yhM6Fs-Vc9yNWK+4UsGY4nV8Qn5xhkPxyag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathaniel,

On Thu, Jul 31, 2014 at 10:26 AM, Nathaniel Roach <nroach44@gmail.com> wrote:
> BR2_CONFIG_COPY copies the config file to /etc/buildroot.config
> as 0600 during target-finalize after overlay copy, but before
> post-build script install.
>
> ---
> Changes v1 to v2
>  - Corrected wording of config helper message (Thomas De Schampheleire)
>  - Moved order in menu to reflect actual order of the operation
> ---
>  Makefile         |  4 ++++
>  system/Config.in | 11 +++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 022beea..cc49291 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -614,6 +614,10 @@ endif
>                         --chmod=Du+w --exclude .empty --exclude '*~' \
>                         $(d)/ $(TARGET_DIR)$(sep))
>
> +ifeq ($(BR2_CONFIG_COPY),y)
> +       $(INSTALL) -m 0600 .config $(TARGET_DIR)/etc/buildroot.config

Before you do the copy, would it be worth doing a savedefconfig (or like)
activity to cleanup the .config file?  Then the file on target would be much
easier to read if you manually had to view it.

Thanks!
-- 
Matthew L Weber / Sr Software Engineer / Platform Software
matthew.weber at rockwellcollins.com
www.rockwellcollins.com
