From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 11:14:42 +0200
Subject: [Buildroot] [PATCH 2/4] testing/infra/builder: dump config to
	log
In-Reply-To: <20170723042019.10323-2-ricardo.martincoski@gmail.com>
References: <20170723042019.10323-1-ricardo.martincoski@gmail.com>
 <20170723042019.10323-2-ricardo.martincoski@gmail.com>
Message-ID: <20170723091441.GB2917@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-07-23 01:20 -0300, Ricardo Martincoski spake thusly:
> The config is composed on-the-fly by test infra + tests.
> 
> Dump it to the logfile before running 'make olddefconfig' so it can
> easily analysed when debugging.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  support/testing/infra/builder.py | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
> index a475bb0a30..dc128cdd8a 100644
> --- a/support/testing/infra/builder.py
> +++ b/support/testing/infra/builder.py
> @@ -17,6 +17,9 @@ class Builder(object):
>          config_file = os.path.join(self.builddir, ".config")
>          with open(config_file, "w+") as cf:
>              cf.write(self.config)
> +        # dump the config to the logfile for easy debugging
> +        self.logfile.write("> config:\n" + self.config)
> +        self.logfile.flush()

Although the variable is named 'comfig', it is in fact a defconfig.

Also, it is easy to miss exactly where the end of the config is, so
maybe:

  - prefix all lines with 'config: ',
or
  - add 'start config' and 'end config'.

Otherwise;

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  
>          cmd = ["make",
>                 "O={}".format(self.builddir),
> -- 
> 2.13.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
