From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 4 Oct 2016 21:49:51 +0200
Subject: [Buildroot] [PATCH v1] assimp: fix pthread linking
In-Reply-To: <20161004214605.65fc336e@gmx.net>
References: <1474839222-26976-1-git-send-email-ps.report@gmx.net>
 <20161004214605.65fc336e@gmx.net>
Message-ID: <20161004214951.6b6caf21@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 4 Oct 2016 21:46:05 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> On Sun, 25 Sep 2016 23:33:42 +0200, Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Fixes [1]:
> > 
> >   [100%] Linking CXX executable ../../bin/assimp
> >   /home/test/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-uclinux-uclibcgnueabi/5.4.0/../../../../arm-buildroot-uclinux-uclibcgnueabi/lib/libstdc++.a(guard.o): In function `(anonymous namespace)::get_static_cond()':
> >   guard.cc:(.text._ZN12_GLOBAL__N_115get_static_condEv+0x6): undefined reference to `pthread_once'
> >   ...
> > 
> > [1] http://autobuild.buildroot.net/results/c10/c10886686a0d29877004a0afe2106a77aa2f2ba0
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/assimp/assimp.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
> > index cda02dd..fecf6d7 100644
> > --- a/package/assimp/assimp.mk
> > +++ b/package/assimp/assimp.mk
> > @@ -18,4 +18,8 @@ endif
> >  
> >  ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)"
> >  
> > +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> > +ASSIMP_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-pthread"
> > +endif
> > +
> >  $(eval $(cmake-package))
> 
> Waldemar is sure this is a uClibc-ng failure and will be fixed with update to
> uClibc-ng 1.0.18 (as stated for similar failure of powertop, see [2]), will
> defer this patch in patchwork...
> 
> Regards,
> Peter

Forgot to add the link, here it is:

[2] http://lists.busybox.net/pipermail/buildroot/2016-September/173086.html

Regards,
Peter


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
