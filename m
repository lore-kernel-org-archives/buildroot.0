From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 11 Mar 2020 10:13:19 +0100
Subject: [Buildroot] [PATCH] package/python-markdown: fix Python version
 dependency
In-Reply-To: <CALFsTFX9-qhS2bDXqjSEPQTOMD0qRpq+QRiOjdLG+Lf+9rjk=Q@mail.gmail.com>
References: <20200310114101.6726-1-yegorslists@googlemail.com>
 <CALFsTFX9-qhS2bDXqjSEPQTOMD0qRpq+QRiOjdLG+Lf+9rjk=Q@mail.gmail.com>
Message-ID: <CAGm1_ks_73TCpDUPTPcYSwpWvbWQawDoTnCG3c0Baq1-501GYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Tue, Mar 10, 2020 at 7:53 PM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> On Tue, Mar 10, 2020 at 1:41 PM <yegorslists@googlemail.com> wrote:
> >
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > The latest version has dropped Python 2 support.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/6d1e796f6658accb3eafef265935db5e464638fe
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  package/python-markdown/Config.in | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/python-markdown/Config.in b/package/python-markdown/Config.in
> > index 6706684142..454c2729bd 100644
> > --- a/package/python-markdown/Config.in
> > +++ b/package/python-markdown/Config.in
> > @@ -1,8 +1,8 @@
> >  config BR2_PACKAGE_PYTHON_MARKDOWN
> >         bool "python-markdown"
> > +       depends on BR2_PACKAGE_PYTHON3
> >         # runtime dependency on Python's xml module
> > -       select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
> > -       select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
> > +       select BR2_PACKAGE_PYTHON3_PYEXPAT
> >         help
> >           This is a Python implementation of John Gruber's Markdown
> >
> > --
> > 2.17.0
> >
>
> Reviewed-by: Asaf Kahlon <asafka7@gmail.com>

The issue is more complicated than I thought at the beginning.

First of all, python-cheetah package that depends on python-markdown
was abandoned. The new fork is Cheetah3 [1]. What should we do? Just
replace the download location? Though the project is Py2/Py3
compatible because of python-markdown we would restrict it to Py3
only?

mongodb and gr-osmosdr both depend on python-cheetah. So they must be
touched as well. Fabrice and Gwenhael could you take care of this?

Because of this dependencies hell, a CI test for at least mongodb
would be very welcome.

[1] https://pypi.org/project/Cheetah3/

Thanks.

Yegor
