From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Oct 2017 18:26:58 +0100
Subject: [Buildroot] [PATCH 1/5] utils/genrandconfig: filter empty lines
 and comments in CSV file
In-Reply-To: <20171029171440.8095-2-thomas.petazzoni@free-electrons.com>
References: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
 <20171029171440.8095-2-thomas.petazzoni@free-electrons.com>
Message-ID: <20171029172658.GE2899@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-10-29 18:14 +0100, Thomas Petazzoni spake thusly:
> In preparation for the addition of comments in the CSV file listing
> toolchain configurations, we filter out such lines when reading the
> CSV file in utils/genrandconfig.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Small nit, below...

> ---
>  utils/genrandconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index a67d46fad9..e963349d70 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -126,7 +126,9 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
>      """
>  
>      with open(toolchains_csv) as r:
> -        toolchains = decode_byte_list(r.readlines())
> +        # filter empty lines and comments
> +        lines = [ t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#' ]
> +        toolchains = decode_byte_list(lines)
>      configs = []
>  
>      (_, _, _, _, hostarch) = os.uname()
> @@ -164,6 +166,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
>          with open(configfile) as r:
>              config = r.readlines()
>          configs.append(config)
> +

Spurious hunk.

Regards,
Yann E. MORIN.

>      return configs
>  
>  
> -- 
> 2.13.6
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
