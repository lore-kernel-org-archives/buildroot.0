From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Oct 2017 10:09:01 +0200
Subject: [Buildroot] [PATCH] support/dependencies: always run
 check-host-tar.mk first
In-Reply-To: <1508878293-15873-1-git-send-email-jcmvbkbc@gmail.com>
References: <1508878293-15873-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <e8fd5b1a-3576-773a-35a4-562679eaa31f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Max,

On 24-10-17 22:51, Max Filippov wrote:
> In case both host lzip and tar are not suitable the buildroot build
> fails with the following error:
> 
>   >>> host-lzip 1.19 Extracting
>   gzip -d -c dl/lzip-1.19.tar.gz | host/bin/tar --strip-components=1 -C
>     build/host-lzip-1.19 -xf -
>   /bin/sh: host/bin/tar: No such file or directory

 Good catch! We really should have an autobuilder without suitable tar to
capture this kind of issue.


> Make sure that if the tar dependency is present it is always the first
> one in the DEPENDENCIES_HOST_PREREQ.

 However, this is not a proper solution. It will break with top-level parallel
build and it just looks hackish.

 The proper way to do it is to add a dependency on host-tar to all the other
host-prereq packages. But that also doesn't scale well... I have to think a bit
more about a good solution, but I wanted to flag the issue already.

 One thing I though about is to put something like

$(filter-out host-tar,$(DEPENDENCIES_HOST_PREREQ)): host-tar

in check-host-tar.mk, but that only works if check-host-tar.mk is the *last* one
to add anything to DEPENDENCIES_HOST_PREREQ...

 Regards,
 Arnout

> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  support/dependencies/dependencies.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
> index ef2ae9b7e158..4e8528b91f05 100644
> --- a/support/dependencies/dependencies.mk
> +++ b/support/dependencies/dependencies.mk
> @@ -12,7 +12,12 @@
>  define suitable-host-package
>  $(shell support/dependencies/check-host-$(1).sh $(2))
>  endef
> --include $(sort $(wildcard support/dependencies/check-host-*.mk))
> +
> +# Make sure that if the tar dependency is present it is always the first one in
> +# the DEPENDENCIES_HOST_PREREQ, otherwise sources for other dependencies will
> +# fail to unpack.
> +-include support/dependencies/check-host-tar.mk
> +-include $(sort $(filter-out %/check-host-tar.mk,$(wildcard support/dependencies/check-host-*.mk)))
>  
>  ifeq ($(BR2_CCACHE),y)
>  DEPENDENCIES_HOST_PREREQ += host-ccache
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
