From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 16 Feb 2014 14:45:47 +0100
Subject: [Buildroot] [PATCH v6 3/4] dependencies.sh: Introduce
	BR2_HOST_NEEDS_JAVA
In-Reply-To: <1392557273-3522-4-git-send-email-maxime.hadjinlian@gmail.com>
References: <1392557273-3522-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392557273-3522-4-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAGduivzyDKpEOua9zitV6fEhiw4ZMMpydeuagfLsWmO-svz2jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sun, Feb 16, 2014 at 2:27 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> XBMC needs Java on the host in order to build, because it  uses a
> code-generator which is build in two phases:
> In the first phase SWIG is used to parse C++ header files that define the API.
> SWIG outputs an XML file that contains a complete description of the structure
> of the API.
> In the second phase, the XML file is ingested by a Groovy (Java) program that
> then creates C++ code that forms the bridge to the scripting language (Python).
>
> The second phase is why we need java on the host.
>
> You can learn more at the XBMC's wiki:
> http://wiki.xbmc.org/index.php?title=Codegeneration#How_it_works
>
> In order to check that, this patch introduce this mechanism in
> dependencies.sh
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> Changes v5 -> v6:
>   - Remove useless loop (Thomas Petazzoni)
>   - Thanks to Martin Bark idea, change this patch to have a non package
>     specific variable.
> Changes v1 -> v5:
>   - Patch non existant before
> ---
>  support/dependencies/dependencies.sh | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 0e7e1fa..dd90bee 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -191,6 +191,14 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $BR2_CONFIG ; then
>         done
>  fi
>
> +if grep -q ^BR2_HOST_NEEDS_JAVA=y $BUILDROOT_CONFIG ; then
> +       if ! which java > /dev/null ; then
> +               echo >&2
> +               echo "You must install '$prog' on your build machine" >&2
> +               exit 1
> +       fi
> +fi
I stupidly forgotten about the change BUILDROOT_CONFIG => BR2_CONFIG.
I will send an update with the rest of the series when more reviews
came in.
> +
>  if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
>         if test ! -f /lib/ld-linux.so.2 ; then
>                 echo
> --
> 1.8.5.3
>
