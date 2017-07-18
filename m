From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jul 2017 22:45:00 +0200
Subject: [Buildroot] [PATCH 01/20] support/tests: allow properly
 indented config fragment
In-Reply-To: <9ffa131e00b78d82799b6761884257afb6f74621.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <9ffa131e00b78d82799b6761884257afb6f74621.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <20170718204500.GA6291@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

This is version 2 of the patch. Version 1 has been just reviewed now by
Arnout, after which I sent v3:
    https://patchwork.ozlabs.org/patch/790525/

So, please disregard this one; use v3 instead (but still before the rest
of this series).

Thanks!

Regards,
Yann E. MORIN.

On 2017-07-18 19:25 +0200, Yann E. MORIN spake thusly:
> Currently, defining a config fragment in the runtime test infra requires
> that the fragment not to be indented. This is beark, and causes grievance
> when looking at the code (e.g. to fix it).
> 
> Just strip out all leading spaces/tabs when writing the configuration
> lines into the config file, allowing in-line indented config fragments,
> like so:
> 
>     class TestFoo(bla):
>         config = bla.config + \
>             """
>             FOO=y
>             # BAR is not set
>             """
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v1 -> v2:
>   - add example in commit log  (Thomas)
> 
> ---
> Note: this is only tangentially related to this series, because it is
> needed by the last patch in the series. It wasalready submitted before:
>     https://patchwork.ozlabs.org/patch/788985/
> ---
>  support/testing/infra/builder.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
> index a475bb0a30..81735dec96 100644
> --- a/support/testing/infra/builder.py
> +++ b/support/testing/infra/builder.py
> @@ -16,7 +16,8 @@ class Builder(object):
>  
>          config_file = os.path.join(self.builddir, ".config")
>          with open(config_file, "w+") as cf:
> -            cf.write(self.config)
> +            for line in self.config.splitlines():
> +                cf.write("{}\n".format(line.lstrip()))
>  
>          cmd = ["make",
>                 "O={}".format(self.builddir),
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
