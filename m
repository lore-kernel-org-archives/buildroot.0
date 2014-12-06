From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 6 Dec 2014 14:28:03 +0100
Subject: [Buildroot] [PATCH 2/9 v2] pkg-infra: differentiate remote
 tarball name from local filename
In-Reply-To: <bef744df6da6d00760218ff688449f2bb3fdeb4f.1417863715.git.yann.morin.1998@free.fr>
References: <cover.1417863715.git.yann.morin.1998@free.fr>
 <bef744df6da6d00760218ff688449f2bb3fdeb4f.1417863715.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMKcCtD0iK1ooZyLH93cquSXH-u0e=m4OTM+K+EVMuDbaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sat, Dec 6, 2014 at 12:13 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Some upstreams may use a naming scheme that does not fit well in how
> Buildroot wants to handle filenames.
>
> For example, GitHub used to have a scheme like:
>     https://github.com/USER/REPO/archive/VERSION.tar.gz
>
> which means we would have a local file named VERSION.tar.gz, when we
> want to have PKG-VERSION.tar.gz
>
> Other forges are also known to have similar schemes. Google Code, for
> example, may also use similarly named files.
>
> Introduce a new variable, FOO_UPSTREAM_SOURCE, which the package may set
> in that case. If not set, it defaults to FOO_SOURCE.

I wonder how it will play when download falls back on
http://sources.buildroot.net/, I mean what will be the tarball
filename uploaded on s.b.n? Will it be FOO_UPSTREAM_SOURCE or
FOO_SOURCE?

Afaics, FOO_SOURCE will be uploaded on s.b.n, whereas the fallback url will be:
  http://sources.buildroot.net/$(FOO_UPSTREAM_SOURCE)

Regards,

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> ---
> Note:
>
> A suggested alternative would be to specify the local filename if it
> were to be different from upstream, adding the new variable as
> FOO_LOCAL_SOURCE (or whatever it would be named).
>
> I believe this is not an appropriate solution, because I believe we
> want to show that it is *upstream* doing things weirdly, not us. Using
> the alternative would convey the message that we, Buildroot, are doing
> something weird, which is really not the case.
>
> Besides, I think users should only be concerned about the local
> filename, and thus the value of FOO_SOURCE should really be the filename
> users have to manipulate, always. Having a second, optional variable
> holding the filename risks making it less straightforward in the users'
> eyes.
> ---
>  package/pkg-generic.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 9643a30..30bce59 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -84,7 +84,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
>                 done ; \
>         fi
>  endif
> -       $(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
> +       $(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_UPSTREAM_SOURCE),$($(PKG)_SOURCE)))
>         $(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
>         $(foreach p,$($(PKG)_PATCH),\
>                 $(if $(findstring ://,$(p)),\
> @@ -361,6 +361,10 @@ ifndef $(2)_SOURCE
>   endif
>  endif
>
> +ifndef $(2)_UPSTREAM_SOURCE
> +  $(2)_UPSTREAM_SOURCE = $$($(2)_SOURCE)
> +endif
> +
>  ifndef $(2)_PATCH
>   ifdef $(3)_PATCH
>    $(2)_PATCH = $$($(3)_PATCH)
> --
> 1.9.1
>



-- 
Samuel
