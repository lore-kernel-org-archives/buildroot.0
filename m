From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 26 May 2021 11:20:12 +0200
Subject: [Buildroot] [PATCHv3 06/15] package/sysrepo: remove explicit
 setting of CMAKE_BUILD_TYPE
In-Reply-To: <d3098530-47bb-c944-b226-275d64ff4591@mind.be>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-7-patrickdepinguin@gmail.com>
 <d3098530-47bb-c944-b226-275d64ff4591@mind.be>
Message-ID: <CAEyMn7ZE2Q=tv=SYP=et7SRq3DN-1H85mUHMADBw=D+tphd9xA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Di., 25. Mai 2021 um 22:56 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>
>
>
> On 25/05/2021 14:27, Thomas De Schampheleire wrote:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > sysrepo explicitly sets CMAKE_BUILD_TYPE=Release, ignoring any possible
> > value of BR2_ENABLE_DEBUG (previously) or BR2_ENABLE_RUNTIME_DEBUG (now).
> >
> > With the introduction of BR2_ENABLE_RUNTIME_DEBUG, this change should no
> > longer be necessary. Users that do not wish to have additional runtime
> > debugging just keep BR2_ENABLE_RUNTIME_DEBUG disabled (default value).
> >
> > As the 'Debug' build type enables tests, disable them explicitly.
> > As the 'Debug' build type uses a custom REPO_PATH which does not exist on
> > target, force /etc/sysrepo like in the 'Release' build type.
> >
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Heiko Thiery <heiko.thiery@gmail.com>

>
> Although I think this could have been squashed with the previous patch.
>
>  Regards,
>  Arnout
>
> > ---
> >  package/sysrepo/sysrepo.mk | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
> > index f5be29d2c9..c0db05e52c 100644
> > --- a/package/sysrepo/sysrepo.mk
> > +++ b/package/sysrepo/sysrepo.mk
> > @@ -13,8 +13,10 @@ SYSREPO_DEPENDENCIES = libyang pcre host-sysrepo
> >  HOST_SYSREPO_DEPENDENCIES = host-libyang host-pcre
> >
> >  SYSREPO_CONF_OPTS = \
> > -     -DCMAKE_BUILD_TYPE=Release \
> > -     -DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF)
> > +     -DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
> > +     -DENABLE_TESTS=OFF \
> > +     -DENABLE_VALGRIND_TESTS=OFF \
> > +     -DREPO_PATH=/etc/sysrepo
> >
> >  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> >  SYSREPO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
> >
