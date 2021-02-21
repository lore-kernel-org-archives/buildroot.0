From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Sun, 21 Feb 2021 16:01:34 +0100
Subject: [Buildroot] [PATCH] package/rustc: allow cargo sub packages to
 download using 'git'
In-Reply-To: <20210221082035.GX2276@scaer>
References: <20210221075134.11739-1-guillaume.bressaix@gmail.com>
 <20210221082035.GX2276@scaer>
Message-ID: <CAJe0E3dDz6xtphCxxemaivXdoZZumQT58PP9-qXPJVrPkbbjsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

thank you very much for the explanation

> because this means that downloads happen during the build, not during the
actual download step

I understand now the problem from your side

> see this series from Thomas:
http://lists.busybox.net/pipermail/buildroot/2020-December/298802.html

I knew Thomas and other people were active on the subject but did not know
where to find more information.
I looked into https://github.com/tpetazzoni/buildroot/tree/pkg-mgr-v2,
the "eval cargo-package" is indeed what we need.

Thomas's work seems pretty much done, it's not clear to me at the moment
what remains to be achieved
or if I could be of help. Anyway, this is the place to contribute on the
subject.

For me, the main problem when cross-compiling a rust pkg is already figured
out,
$(BR2_PACKAGE_HOST_RUSTC_ARCH) must be a valid value from the official list
of supported targets:
https://doc.rust-lang.org/nightly/rustc/platform-support.html
I'm just curious how you guys figure out the right value for a given board,
because we want this automated & it is not trivial to me

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le dim. 21 f?vr. 2021 ? 09:20, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> Guillaume, All,
>
> +Thomas for reference to his series
> +Thomas +Arnout +Peter for their insight, toward the end
>
> On 2021-02-21 08:51 +0100, guillaume.bressaix at gmail.com spake thusly:
> > From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> >
> > Adding this simple command to the general cargo configuration
> > will allow sub packages (with their own cargo.toml file)
> > to resolve dependencies using 'git'. Without this,
> > we only support builtin packages or manually downloaded
> > packages refered to with a local full path.
>
> In fact, we explicitly do not want that to happen, because this means
> that downloads happen during the build, not during the actual download
> step. This prevents reproducible archives and thus reproducible builds,
> and means that the output of legal-info is missing pieces.
>
> There is a work in progress to support vendoring in the various
> language-specific package managers like cargo, see this series from
> Thomas:
>
>     http://lists.busybox.net/pipermail/buildroot/2020-December/298802.html
>
> The idea is that we manage the vendoring as part of the download step,
> so that we can get totally off-line builds, and so that we can have
> (slightly more) reproducible builds (as long as the archive is cached
> locally or on a site-local mirror), and so that we can do a exhaustive
> legal-info.
>
> However, we have found a major roadblock for this, and we still have no
> clear idea how to solve it.
>
> The aforementioned series works pretty well, if one does not use primary
> or backup mirrors. This is because the archive is (most probably) named
> after the package and its version, but its content will be different when
> we download it from the mirrors, compared to when we download it from
> upstream: the upstream one will not be vendored, while the mirrored one
> will.
>
> This would cause quite a conflict, and we still do not see how to fix
> that. Yet. I have a few ideas floating around in my head for now, but
> that's not ready for primetime yet...
>
> Of course, until this is solved, I don't know how to workaround the
> vendoring problem imposed on us by those damn language-specific package
> managers...
>
> Maybe we could allow such a hack as yours for now, but really I have
> little sympathy for those language-specific package managers. :-(
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> > ---
> >  package/rustc/cargo-config.in | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/package/rustc/cargo-config.in b/package/rustc/
> cargo-config.in
> > index 47fad026be..be4c401f97 100644
> > --- a/package/rustc/cargo-config.in
> > +++ b/package/rustc/cargo-config.in
> > @@ -1,2 +1,5 @@
> >  [target. at RUSTC_TARGET_NAME@]
> >  linker = "@CROSS_PREFIX at gcc"
> > +
> > +[net]
> > +git-fetch-with-cli = true
> > --
> > 2.20.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210221/116f0687/attachment.html>
