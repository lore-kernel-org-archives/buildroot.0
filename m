From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 11:20:20 +0200
Subject: [Buildroot] [PATCH 4/4] testing/infra/basetest: move jlevel
 logic to constructor
In-Reply-To: <20170723042019.10323-4-ricardo.martincoski@gmail.com>
References: <20170723042019.10323-1-ricardo.martincoski@gmail.com>
 <20170723042019.10323-4-ricardo.martincoski@gmail.com>
Message-ID: <20170723092020.GC2917@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, all,

On 2017-07-23 01:20 -0300, Ricardo Martincoski spake thusly:
> As suggested by Arnout in [1].
> 
> While at it, simplify the logic by always appending the BR2_JLEVEL and
> defaulting to 0 (the value copied from Config.in is used for 5 years now
> and is very unlikely to change).
> 
> [1] http://patchwork.ozlabs.org/patch/790525/
> 
> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> tip for git send-email:
> Cc: Arnout Vandecappelle <arnout@mind.be>

You can (and should) leave that one below you SoB line, not after the
'---' line, because it is important that it is recorded as part of the
commit log.

It is not a problem that Arnout (or whoever) is named twice in a tag.

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/testing/infra/basetest.py | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index 29e7872572..431605b23f 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -34,7 +34,7 @@ class BRTest(unittest.TestCase):
>      outputdir = None
>      logtofile = True
>      keepbuilds = False
> -    jlevel = None
> +    jlevel = 0
>  
>      def __init__(self, names):
>          super(BRTest, self).__init__(names)
> @@ -43,16 +43,14 @@ class BRTest(unittest.TestCase):
>          self.emulator = None
>          self.config = '\n'.join([line.lstrip() for line in
>                                   self.config.splitlines()]) + '\n'
> +        self.config += "BR2_JLEVEL={}\n".format(self.jlevel)
>  
>      def show_msg(self, msg):
>          print "{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
>                                      self.testname, msg)
>      def setUp(self):
>          self.show_msg("Starting")
> -        config = self.config
> -        if self.jlevel:
> -            config += "BR2_JLEVEL={}\n".format(self.jlevel)
> -        self.b = Builder(config, self.builddir, self.logtofile)
> +        self.b = Builder(self.config, self.builddir, self.logtofile)
>  
>          if not self.keepbuilds:
>              self.b.delete()
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
