From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 11 Sep 2018 11:58:33 +0200
Subject: [Buildroot] [PATCH v2] package/fail2ban: new package
In-Reply-To: <20180911115222.1d19d460@windsurf>
References: <1534945312-25275-1-git-send-email-angelo@amarulasolutions.com>
 <20180911000522.1f1efdc3@windsurf>
 <CAGm1_kvvnnveBE1Ccpj7X6TmBW-coe7xgtCYLAXtjhEsPv4ikQ@mail.gmail.com>
 <20180911115222.1d19d460@windsurf>
Message-ID: <CA+_SqVYGGmwXh9gK8d_KJF35gzS3qdqXVvMuWK410MrgKybK_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Yegor,
On Tue, Sep 11, 2018 at 11:52 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue, 11 Sep 2018 11:47:36 +0200, Yegor Yefremov wrote:
> > > and ditto for the staging installation, of course. Yegor, do you see
> > > any drawback with doing this change in pkg-python.mk ? To me, it seems
> > > like the right thing to do, and would avoid the need to have a special
> > > case in fail2ban.mk.
> >
> > I've applied this hack:
>
> Why do you say "hack" ? It should be the right thing, compared to what
> we're doing today.
>
> > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> > index f57e486dad..fcb7309ef9 100644
> > --- a/package/pkg-python.mk
> > +++ b/package/pkg-python.mk
> > @@ -66,10 +66,10 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
> >         _python_exec_prefix=/usr
> >
> >  PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
> > -       --prefix=$(TARGET_DIR)/usr \
> > +       --prefix=/usr \
> >         --executable=/usr/bin/python \
> >         --single-version-externally-managed \
> > -       --root=/
> > +       --root=$(TARGET_DIR)
> >
> >  PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
> >         --prefix=$(STAGING_DIR)/usr \
>
> It should also be fixed in the staging installation commands, which
> have the same problem.
>
> > And performed some tests with following packages (both via python
> > "console" and using packe own scripts like watchmedo or miniterm.py):
> >
> > python-serial, python-watchdog, python-cryptography, python-pytablewriter
> >
> > So far I haven't experienced any issues.
>
> Great, thanks for doing this test! I think it would be a nice thing to
> fix.
>
> Angelo: just curious, for fail2ban, what made you realize you had to
> override the --prefix and --root values ?

Python setuptools installs data_files into python_root, so the
fail2ban setup.py failed blatantly in buildroot trying to writing
something to /etc/fail2ban instead of $(TARGET_DIR)/etc/fail2ban.

I'm glad it will be fixed globally, I honestly thought it was like
that for a reason!

Sincerely, Angelo

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
