From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 9 Dec 2019 10:23:24 -0600
Subject: [Buildroot] [PATCH] package/pkg-python: use _CONFIGURE_OPTS for
 build env
In-Reply-To: <20191209165331.39589bbe@windsurf>
References: <20191205231103.27778-1-ryan.barnett@rockwellcollins.com>
 <20191206233513.5f6260d7@windsurf.home> <87sglwl1wi.fsf@dell.be.48ers.dk>
 <20191209165331.39589bbe@windsurf>
Message-ID: <CAMQcK5+y-qT+0geazmxOH+OyOK4fks-PVUFjKR_MdRLjTBnJ1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Dec 9, 2019 at 9:54 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sat, 07 Dec 2019 14:07:41 +0100
> Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >  >> package/pkg-python.mk | 11 ++++++-----
> >  >> 1 file changed, 6 insertions(+), 5 deletions(-)
> >
> >  > Applied to master, thanks.
> >
> > Hmm, this seems to confuse lirc-tools:
> >
> > http://autobuild.buildroot.net/results/f7a/f7a9c02add9bde563c7289f7c0be2cb7aefd96b8/build-end.log
>
> I think this sort of change was pretty likely to cause some build
> breakage, so it's good to merge it early.
>
> Ryan, will you take a look at this issue ?

Yes - I'm taking a look at it. Looks like it is due to using double
quotes when using PKG_PYTHON_SETUPTOOLS_ENV.

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index e468f2a25d..d66f4e9925 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -47,7 +47,7 @@ endif

 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIRC_TOOLS_DEPENDENCIES += python3 host-python3-setuptools
-LIRC_TOOLS_MAKE_ENV += SETUPTOOLS_ENV="$(PKG_PYTHON_SETUPTOOLS_ENV)"
+LIRC_TOOLS_MAKE_ENV += SETUPTOOLS_ENV='$(PKG_PYTHON_SETUPTOOLS_ENV)'
 endif

 define LIRC_TOOLS_INSTALL_INIT_SYSV

Working on testing out the change to see if it will build correctly.

Thanks,
-Ryan
