From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 12:29:58 +0200
Subject: [Buildroot] [PATCH v2 07/14] package/systemd: fixup RPATH for
 more systemd host binaries
In-Reply-To: <20200615095347.GX2346@scaer>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-8-nolange79@gmail.com>
 <20200615095347.GX2346@scaer>
Message-ID: <CADYdroMTBNYyZk=4QssUm7GT1Gdn+C_3ZhBRLabXbdR=n_YJ_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 15. Juni 2020 um 11:53 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, All,
>
> On 2020-06-15 09:20 +0200, Norbert Lange spake thusly:
> > All systemd binaries depend on libsystemd-shared and need their
> > RPATH fixed. Use a glob to catch them all
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  package/systemd/systemd.mk | 17 +++++------------
> >  1 file changed, 5 insertions(+), 12 deletions(-)
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 2cc71ee667..2c7f35bf25 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -659,6 +659,8 @@ HOST_SYSTEMD_DEPENDENCIES = \
> >       host-libcap \
> >       host-gperf
> >
> > +HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> > +
> >  # Fix RPATH After installation
> >  # * systemd provides a install_rpath instruction to meson because the binaries
> >  #   need to link with libsystemd which is not in a standard path
> > @@ -667,20 +669,11 @@ HOST_SYSTEMD_DEPENDENCIES = \
> >  # * the original path had been tweaked by buildroot via LDFLAGS to add
> >  #   $(HOST_DIR)/lib
> >  # * thus re-tweak rpath after the installation for all binaries that need it
> > -HOST_SYSTEMD_HOST_TOOLS = \
> > -     systemd-analyze \
> > -     systemd-machine-id-setup \
> > -     systemd-mount \
> > -     systemd-nspawn \
> > -     systemctl \
> > -     udevadm
> > -
> > -HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> >
> >  define HOST_SYSTEMD_FIX_RPATH
> > -     $(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
> > -             $(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
> > -     )
> > +     cd $(HOST_DIR)/bin && for f in journalctl systemctl udevadm systemd-*; do \
> > +       [ ! -x $$f ] || $(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $$f; \
> > +       done
>
> You fell in the usual trap: if patchelf fails, then the error is not
> caught, and the loop continues and ends succesfully, while in fact there
> was an error...
>
> There are two solutions to fix that:
>
>   - with the loop implemented in shell, terminate the command in the
>     loop with:  || exit 1
>
>       $(HOST_DIR)/bin/patchelf [...] $$f || exit 1;
>
>   - keep the loop implemented in Makefile:
>
>     HOST_SYSTEMD_HOST_TOOLS = $(wildcard $(addprefix $(HOST_DIR)/bin,journalctl systemctl udevadm systemd-*))
>     $(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
>         $(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
>     )
>
> Needless to say that we tend to prefer the second solution.

ACK. I will fix this up this evening.
(was already curious about the use of wildcard elsewhere)

Norbert
