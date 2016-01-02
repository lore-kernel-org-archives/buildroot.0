From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 22:35:33 +0100
Subject: [Buildroot] [PATCH] Add download helper for PyPi
In-Reply-To: <1451766174-7072-1-git-send-email-yegorslists@googlemail.com>
References: <1451766174-7072-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <568842A5.6010103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-01-16 21:22, Yegor Yefremov wrote:
> PyPi has following URL structure:
> 
> https://pypi.python.org/packages/source/{first pkg name char}/{pkg name}
> 
> User only needs to pass package name to the helper. The helper itself
> extracts the first package name character and inserts it into download URL
> together with package name.
> 
> Usage example:
> 
> PYTHON_SIX_SITE = $(call pypi,six)

 The reason we introduced this variable for github was that github had changed
the direct URL a few times. For pypi, there is no such problem.

 In general, we prefer to keep things explicit, even if that is more verbose.
The $(call pypi,six) is nice and terse, but it makes it more difficult to
copy/paste the URL in your browser for instance.

 In short, I'm not too fond of this new helper.


 Regards,
 Arnout

> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/pkg-download.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 1332e66..caaeba5 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -55,6 +55,9 @@ domainseparator = $(if $(1),$(1),/)
>  # github(user,package,version): returns site of GitHub repository
>  github = https://github.com/$(1)/$(2)/archive/$(3)
>  
> +# pypi(package): returns site of PyPi download location
> +pypi = https://pypi.python.org/packages/source/$(shell echo $(1) | cut -c1)/$(1)
> +
>  # Expressly do not check hashes for those files
>  # Exported variables default to immediately expanded in some versions of
>  # make, but we need it to be recursively-epxanded, so explicitly assign it.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
