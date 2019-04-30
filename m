From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 30 Apr 2019 09:25:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/bind: fix python build
In-Reply-To: <87ftq0ot5n.fsf@dell.be.48ers.dk>
References: <20190427134925.1730-1-fontaine.fabrice@gmail.com>
 <87ftq0ot5n.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W83NrB4bdbc-zbhCrP7SY0VgJpxiAxGOpfvnEcCbiRh7Fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Le mar. 30 avr. 2019 ? 09:21, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > A check for python-ply has been added as this is a dependency of the
>  > dnssec-keymgr script so install host-python-ply to avoid a build failure
>  > if python-ply is not installed on host
>
>  > Fixes:
>  >  - http://autobuild.buildroot.org/results/96815b1300547c976443bf74b762febdfcc8d3ba
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  > ---
>  >  package/bind/bind.mk | 7 +++++--
>  >  1 file changed, 5 insertions(+), 2 deletions(-)
>
>  > diff --git a/package/bind/bind.mk b/package/bind/bind.mk
>  > index 356bc259b2..087ce941b0 100644
>  > --- a/package/bind/bind.mk
>  > +++ b/package/bind/bind.mk
>  > @@ -70,8 +70,11 @@ else
>  >  BIND_CONF_OPTS += --with-openssl=no
>  >  endif
>
>  > -# Used by dnssec-checkds and dnssec-coverage
>  > -ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),)
>  > +# Used by dnssec-keymgr
>  > +ifeq ($(BR2_PACKAGE_PYTHON_PLY),y)
>  > +BIND_DEPENDENCIES += host-python-ply
>  > +BIND_CONF_OPTS += --with-python=$(HOST_DIR)/usr/bin/python
>
> Hmm, I somehow missed the host/target mixup. This is not good. You test
> if the target python-ply package is enabled, but then add
> host-python-ply (which doesn't exist) to _DEPENDENCIES:
>
> http://autobuild.buildroot.net/results/2615ebfdcb068594d028af4823260e613d37e867/build-end.log
>
> If I understand it right, we need ply for the host to satisfy the
> configure check and ply for the target for runtime, so I guess the
> solution is to add a host version of the python-ply package.
Yes, I forgot to add the host variant of python-ply.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
