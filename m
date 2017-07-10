From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Jul 2017 22:48:05 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: unbreak run-tests -l
In-Reply-To: <20170710204007.8402-1-arnout@mind.be>
References: <20170710204007.8402-1-arnout@mind.be>
Message-ID: <20170710204805.GA22898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-10 22:40 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> In commit b78b50465c20c1733753a8dd47945cf80c9155f8, the initialisation
> of BRTest.builddir was moved to the __init__ function. However, it is
> set based on BRTest.outputdir and that is only set when the -o argument
> is given to run-tests. When called as "run-tests -l", there is no -o
> argument so BRTest.outputdir remains unset.
> 
> To fix, keep BRTest.builddir at None when BRTest.outputdir is None.
> 
> While we're at it, drop the direct access to the class member. If a
> subclass wishes to set outputdir to something else before calling
> BRTest.__init__, they are free to do so.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks for the quick fixing! :-)

Regards,
Yann E. MORIN.

> ---
>  support/testing/infra/basetest.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index 2a5c9ec939..1a082bb441 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -39,7 +39,7 @@ class BRTest(unittest.TestCase):
>      def __init__(self, names):
>          super(BRTest, self).__init__(names)
>          self.testname = self.__class__.__name__
> -        self.builddir = os.path.join(self.__class__.outputdir, self.testname)
> +        self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
>          self.emulator = None
>  
>      def show_msg(self, msg):
> -- 
> 2.13.2
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
