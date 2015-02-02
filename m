From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 2 Feb 2015 18:12:00 +0100
Subject: [Buildroot] [PATCH 16/16] package/rng-tools: add systemd
 support for rngd
In-Reply-To: <1421684056-5266-17-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-17-git-send-email-maxtram95@gmail.com>
Message-ID: <CAHXCMM+5mTquKvfjwkfTiR_mBFpWKizTZMJJNxAcS7OxvwUnpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxim,

On Mon, Jan 19, 2015 at 5:14 PM, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
> Add rngd.service for systemd. Also patch rngd with patch from Fedora to
> ignore failure if no hwrng present:
> https://bugzilla.redhat.com/show_bug.cgi?id=892178
>
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  package/rng-tools/rng-tools.mk         |  8 ++++++++
>  package/rng-tools/rngd-exit-code.patch | 11 +++++++++++
>  package/rng-tools/rngd.service         |  9 +++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 package/rng-tools/rngd-exit-code.patch
>  create mode 100644 package/rng-tools/rngd.service
>
> diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
> index 5b89656..13352cc 100644
> --- a/package/rng-tools/rng-tools.mk
> +++ b/package/rng-tools/rng-tools.mk
> @@ -21,4 +21,12 @@ else
>  RNG_TOOLS_CONF_OPTS += --without-libgcrypt
>  endif
>
> +define RNG_TOOLS_INSTALL_INIT_SYSTEMD
> +       $(INSTALL) -D -m 644 package/rng-tools/rngd.service \
> +               $(TARGET_DIR)/lib/systemd/system/rngd.service
> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +       ln -fs /lib/systemd/system/rngd.service \
> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rngd.service
> +endef
> +
>  $(eval $(autotools-package))
> diff --git a/package/rng-tools/rngd-exit-code.patch b/package/rng-tools/rngd-exit-code.patch
> new file mode 100644
> index 0000000..5f87161
> --- /dev/null
> +++ b/package/rng-tools/rngd-exit-code.patch

Few comments about the patch:
- patch filename should follow what `git format-patch` generates, so
something 0001-<some description>.patch;
- patch should have a non-empty description and sob-line.

Check [1] for detailed package's patch requirements.

> @@ -0,0 +1,11 @@
> +--- a/rngd.c
> ++++ b/rngd.c
> +@@ -319,7 +319,7 @@ int main(int argc, char **argv)
> +                       message(LOG_DAEMON|LOG_ERR,
> +                               "Maybe RNG device modules are not loaded\n");
> +               }
> +-              return 1;
> ++              return 66;
> +       }
> +
> +       if (arguments->verbose) {
> diff --git a/package/rng-tools/rngd.service b/package/rng-tools/rngd.service
> new file mode 100644
> index 0000000..3bdc4c1
> --- /dev/null
> +++ b/package/rng-tools/rngd.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=Hardware RNG Entropy Gatherer Daemon
> +
> +[Service]
> +ExecStart=/usr/sbin/rngd -f
> +SuccessExitStatus=66
> +
> +[Install]
> +WantedBy=multi-user.target
> --
> 2.2.1
>

[1] http://nightly.buildroot.org/manual.html#patch-policy

Regards,


-- 
Samuel
