From: Christian Stewart <christian@paral.in>
Date: Tue, 18 May 2021 02:58:24 -0700
Subject: [Buildroot] [PATCH v2 1/3] package/libfuse3: allow building as
 a host package
In-Reply-To: <20210518083022.GM2506@scaer>
References: <20210516010521.1375959-1-christian@paral.in>
 <20210518083022.GM2506@scaer>
Message-ID: <CA+h8R2oWv3pCkrwiHxgfWaaOnq_9ZRB-AqLUhBbDzmWZC85M-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, May 18, 2021 at 1:30 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> I wonder if we should add a check and nicely inform the user, or let the
> build later fail when fuse-overlayfs (or genuinetools-img) fails to do
> the mount... Maybe just the following:
>
>     define HOST_GENUINETOOLS_IMG_CHECK_ACCESS
>         $(Q)if [ ! -w /dev/fuse ]; then \
>             printf 'Your user is not allowed to access /dev/fuse\n' >&2; \
>             exit 1; \
>         fi
>     endef
>     HOST_GENUINETOOLS_IMG_PRE_CONFIGURE_HOOKS += HOST_GENUINETOOLS_IMG_CHECK_ACCESS

I don't think it'd be best to fail the build on failure to access a
/dev/ path for a host package configure stage.

Probably better to let the build complete, and check before running
the tool instead.

The tool itself will fail when trying to execute it and fuse-overlayfs
does not work, so the access check is technically already there.

I'll look at adding the systemd unit and init.d script.

Best regards,
Christian
