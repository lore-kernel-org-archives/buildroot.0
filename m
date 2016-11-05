From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Nov 2016 22:50:16 +0100
Subject: [Buildroot] [PATCH 1/3] support/download/git: log checked out
 sha1
In-Reply-To: <20161101193354.8716-1-ricardo.martincoski@datacom.ind.br>
References: <20161101193354.8716-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <6b271555-29d7-0b41-dd3f-698b2cd9724b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-11-16 20:33, Ricardo Martincoski wrote:
> In preparation to have automated tests for this script, display the
> checked out sha1 in the build log.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
> Another solution would be to use an environment variable set by the test
> to print that info, e.g. if [ "1" == "${GIT_DOWNLOAD_AUTOTEST}" ]; then
> ---
>  support/download/git | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/support/download/git b/support/download/git
> index 7921411..7c44c65 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -85,6 +85,12 @@ if [ ${recurse} -eq 1 ]; then
>      _git submodule update --init --recursive
>  fi
>  
> +# Log the sha1. It can be used for automated tests and debug.
> +if [ -z ${verbose} ]; then

 It's quite weird to check that verbose is empty, but that's how the variable is
defined... Perhaps s/verbose/quiet/ would be a good idea...

 Regards,
 Arnout


> +    sha1=$(_git rev-parse HEAD)
> +    printf "Checked out '%s'.\n" "${sha1}"
> +fi
> +
>  # We do not need the .git dir; we keep other .git files, in case they
>  # are the only files in their directory.
>  rm -rf .git
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
