From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Nov 2013 18:08:36 +0100
Subject: [Buildroot] Makeinfo
In-Reply-To: <CAAXf6LWWWG4DABPQzNezk+Tnr1tbDx9mc6+zXZ457vskm1VFBA@mail.gmail.com>
References: <CAAXf6LWWWG4DABPQzNezk+Tnr1tbDx9mc6+zXZ457vskm1VFBA@mail.gmail.com>
Message-ID: <528B9B14.3080708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/13 11:45, Thomas De Schampheleire wrote:
> Hi,
>
> I'm having an issue in building a package (libuio, which I did not yet
> submit) on machines that do not have makeinfo (part of texinfo).

  That's a different situation than what I encountered, because I _did_ 
have makeinfo installed.

  I'm surprised that a trivial package like libuio would require texinfo 
to be installed - is there no way to disable documentation?


>
> Recently, Arnout changed package/stress as follows:
>
> --------------
> stress: disable documentation
>
> It fails to build with my makeinfo version. Note that the autobuilders don't
> see this, probably because they don't have makeinfo installed.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>
> diff --git a/package/stress/stress.mk b/package/stress/stress.mk
> --- a/package/stress/stress.mk
> +++ b/package/stress/stress.mk
> @@ -17,7 +17,10 @@ STRESS_AUTORECONF = YES
>   #
>   # If the BR2_PREFER_STATIC_LIB is not defined, we have to specify
>   # --disable-static explicitly to get stress linked dynamically.
> +#
> +# Also, disable documentation by undefining makeinfo
>   STRESS_CONF_OPT = \
> -       $(if $(BR2_PREFER_STATIC_LIB),,--disable-static)
> +       $(if $(BR2_PREFER_STATIC_LIB),,--disable-static) \
> +       MAKEINFO=:
>
>   $(eval $(autotools-package))
> -------------
>
> I'm now wondering if this is an approach we could add globally: set
> MAKEINFO to : to effectively disable the generation of
> documentation...

  I still have the feeling it is a bit of a hack. But it's true, it could 
be part of DISABLE_DOCUMENTATION.

  Regards,
  Arnout

>
> What do you think?
>
> Thanks,
> Thomas
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
