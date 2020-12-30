From: Paul Soucy <paul.soucy@sense.com>
Date: Wed, 30 Dec 2020 10:13:49 -0500
Subject: [Buildroot] [PATCH 1/1] package/gtest: host-gtest install like
 a normal cmake package
In-Reply-To: <20201230154358.46786e0c@windsurf>
References: <20201216174404.47363-1-paul.soucy@sense.com>
 <20201230154358.46786e0c@windsurf>
Message-ID: <CAH-sa-GxL_biz=KWP3z3T_g+V-Ugm3eBjSEPXXu4km+_Td4hQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for taking the time to look at the patch. The reason I would like
the option to install gtest to HOST_DIR is for running unit tests. Some of
our test suite needs to run on the HOST system. This patch solves the
problem.

I'm not sure if HOST_GTEST_POST_INSTALL_PYTHON thing is still needed. We do
not actually use the gmock feature of gtest. I was trying to preserve
existing functionality but not quite sure what the original intention of
this was.


On Wed, Dec 30, 2020, 9:44 AM Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Paul,
>
> On Wed, 16 Dec 2020 12:44:04 -0500
> Paul Soucy <paul.soucy@sense.com> wrote:
>
> > host-gtest does not actually build and install gtest libraries or header
> files, it just installs the gmock_gen stuff. This patch will now build and
> install gtest to the host like a normal cmake package.
> >
> > Signed-off-by: Paul Soucy <paul.soucy@sense.com>
>
> Thanks for your patch!
>
> Could you give some details as to why you need gtest to be installed in
> $(HOST_DIR) ?
>
> > -define HOST_GTEST_INSTALL_CMDS
> > +define HOST_GTEST_POST_INSTALL_PYTHON
> >       $(INSTALL) -D -m 0755
> $(@D)/googlemock/scripts/generator/gmock_gen.py \
> >               $(HOST_DIR)/bin/gmock_gen
> >       cp -rp $(@D)/googlemock/scripts/generator/cpp \
> >               $(HOST_GTEST_GMOCK_PYTHONPATH)
> >  endef
> >
> > +HOST_GTEST_POST_INSTALL_HOOKS += HOST_GTEST_POST_INSTALL_PYTHON
>
> Is this thing still needed? I applied your patch, and I was able to
> successfully build the target gtest+gmock, even without gmock_gen being
> installed in $(HOST_DIR)/bin/ by host-gtest.
>
> Am I missing something?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201230/a92f3b03/attachment.html>
