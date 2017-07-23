From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 11:01:21 +0200
Subject: [Buildroot] [PATCH 3/4] support/testing: fix run-tests -j
In-Reply-To: <20170723042019.10323-3-ricardo.martincoski@gmail.com>
References: <20170723042019.10323-1-ricardo.martincoski@gmail.com>
 <20170723042019.10323-3-ricardo.martincoski@gmail.com>
Message-ID: <20170723090121.GA2917@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-07-23 01:20 -0300, Ricardo Martincoski spake thusly:
> Since commit cf3cd4388a652c9af27ef1c35622e2d0a55b99a9 the -j option is
> silently ignored.
> 
> The configuration lines are processed using '\n'.join().
> This function adds intervening occurrences of the separator, but the
> resulting string does not end at a separator.
>  >>> "n".join(["a","b"])
>  'anb'
> It results in a config that does not end in a newline.
> 
> When BR2_JLEVEL is added by -j logic to the config it ends up
> concatenated to the last line of the config.
>  BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=yBR2_JLEVEL=7
> The resulting .config has the default BR2_JLEVEL=0.

Confirmed.

> Instead of just workaround this problem by adding a newline before
> BR2_JLEVEL when -j is used, make the config to end in a newline since it
> is a more future-proof solution.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/testing/infra/basetest.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index 07c180e232..29e7872572 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -41,7 +41,8 @@ class BRTest(unittest.TestCase):
>          self.testname = self.__class__.__name__
>          self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
>          self.emulator = None
> -        self.config = '\n'.join([line.lstrip() for line in self.config.splitlines()])
> +        self.config = '\n'.join([line.lstrip() for line in
> +                                 self.config.splitlines()]) + '\n'
>  
>      def show_msg(self, msg):
>          print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
> -- 
> 2.13.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
