From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 29 Nov 2018 00:06:55 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-11-25
In-Reply-To: <3d046613-d734-5ffc-9ce1-07b0ec113edd@mind.be>
References: <20181126070051.E6F2920D29@mail.bootlin.com>
 <CANQCQpbODU5sFSaewz3R0z69ZbxxpNrgHPPzQFKd8mHUTj87BA@mail.gmail.com>
 <3d046613-d734-5ffc-9ce1-07b0ec113edd@mind.be>
Message-ID: <CA+TH9VkwQpWMfjWRL0DDLBv=uzLQke2sVAkFNdcMrVAdRx5GFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Il giorno mer 28 nov 2018 alle ore 23:52 Arnout Vandecappelle
<arnout@mind.be> ha scritto:
>
>
>
> On 26/11/2018 18:50, Matthew Weber wrote:
> > All,
> >
> >
> > On Mon, Nov 26, 2018 at 1:01 AM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> [snip]
> >>  powerpc64le |                  setools-4.1.1 | NOK | http://autobuild.buildroot.net/results/e214e1a539cdac07028fb58c3822f89886d86f1f |
> >
> > setools package is installing man pages and were caught using a bad
> > path by 'step_check_build_dir'.  To stop the install of the man pages,
> > is the preference a 'sed' to remove a line in setup.py or a 'rm' as a
> > hook to cleanup the install of the files to staging/target?
>
>  Well, fix setup.py of course :-)
>
>  This is caused by e94280e5a537b "package/pkg-python: use proper --prefix and
> --root values". It changed:
>
> -       --prefix=$(TARGET_DIR)/usr
> +       --prefix=/usr \
> +       --root=$(TARGET_DIR)
>
>  setools setup.py does:
>
> data_files=[(join(sys.prefix, 'share/man/man1'), glob.glob("man/*.1"))],
>
>  To me, that actually looks like the right thing to do...
>
>  Angelo, maybe you have an idea?


For me is wrong, [1] says:

" If directory is a relative path, it is interpreted relative to the
installation prefix (Python?s sys.prefix for pure-Python packages,
sys.exec_prefix for packages that contain extension modules)"

So the sys.prefix should not be joined because the correct one will be
added regardless. The reason why a relative path is going to work is
because the installation path is built internally joining python root
with python prefix, thus forming the correct path $(TARGET_DIR)/usr.

Joining the sys.prefix makes the path absolute: this was previously
working by accident.

So that should be

data_files=[('share/man/man1', glob.glob("man/*.1"),],

[1] https://docs.python.org/3/distutils/setupscript.html#installing-additional-files

>
>  Regards,
>  Arnout

Sincerely, Angelo



--
Profile: http://it.linkedin.com/in/compagnucciangelo
