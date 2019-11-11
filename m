From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 11 Nov 2019 02:04:47 -0700
Subject: [Buildroot] [PATCH 1/1] package/systemd: hybrid cgroupfs
 hierarchy for docker compatibility
In-Reply-To: <20191111083348.3964650-1-christian@paral.in>
References: <20191111083348.3964650-1-christian@paral.in>
Message-ID: <CADvTj4o4m-CSrPiJ_FSLKzUhxTKacMRVRKFjf99jUgCrLJKhrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 11, 2019 at 1:33 AM Christian Stewart <christian@paral.in> wrote:
>
> Docker fails to start with "Devices cgroup isn't mounted" as of systemd 243.
> According to the systemd documentation:
>
>   systemd now defaults to the "unified" cgroup hierarchy setup during
>   build-time, i.e. -Ddefault-hierarchy=unified is now the build-time default.
>   Previously, -Ddefault-hierarchy=hybrid was the default. [...] Downstream
>   production distributions might want to continue to use
>   -Ddefault-hierarchy=hybrid (or even =legacy) for their builds as unfortunately
>   the popular container managers have not caught up with the kernel API changes.
>
> Changing this option to "hybrid" or "legacy" fixes the Docker startup.
>
> Reference: https://github.com/opencontainers/runc/issues/654
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/systemd/systemd.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 94d5f703cd..92490eb86b 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -26,6 +26,7 @@ SYSTEMD_CONF_OPTS += \
>         -Dima=false \
>         -Dldconfig=false \
>         -Ddefault-dnssec=no \
> +       -Ddefault-hierarchy=hybrid \
This should probably be conditionally enabled only when packages that
don't support the unified cgroup hierarchy are enabled.
>         -Dtests=false \
>         -Dsplit-bin=true \
>         -Dsplit-usr=false \
> --
> 2.24.0
>
