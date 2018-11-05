From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Nov 2018 09:15:55 +0100
Subject: [Buildroot] [PATCH v2 00/12] default runtime test case for
 python packages v2
In-Reply-To: <5bdf75d55554f_4f663ff4e40da8e0185a@ultri5.mail>
References: <20181104114044.3a01aa11@windsurf>
 <5bdf75d55554f_4f663ff4e40da8e0185a@ultri5.mail>
Message-ID: <20181105091555.484cb898@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Sun, 04 Nov 2018 20:42:29 -0200, Ricardo Martincoski wrote:

> I am really unsure about the best approach here.
> TBH all (my v1 and v2, and the 2 links above) look a bit hackish to me.
> 
> But I just found deeper on nose2 docs [3] the __test__ attribute. It seems the
> most correct solution as it depends on a feature that was implemented and
> documented. I just failed to find it earlier.
> 
> In the multi inheritance version it would look like this:
> class TestPythonPackageBase(TestPythonBase):
> ...
>     def __init__(self, names):
>         if not issubclass(self.__class__, TestPythonBase2) and not issubclass(self.__class__, TestPythonBase3):
>             self.__test__ = False
>         super(TestPythonBase, self).__init__(names)
>         if self.config_package:
> ...
> 
> And without multi inheritance you can see a hackish patch on top of v2 in [4].
> 
> I know I changed my mind a few times.
> But now I prefer to resend using [4] (reworking each patch, of course) because:
>  - it does not use multi inheritance that can potentially lead to future
>    problems as the article you found pointed. Let's avoid it while we can;
>  - the code for each test case for a python package looks nice, i.e. [2];
> But it is not a strong preference.
> 
> What do you think about this?

First of all, thanks a lot for this additional research. self.__test__
= False is definitely what we need here.

I also like the proposal that doesn't use multiple inheritance.

Let me make two possible additional proposals:

 - Use an integer for the Python version variable, rather than a
   string, there is really no need for this to be a string I believe ?

 - Alternatively, you could derive the version of the Python
   interpreter to use from the child class name. Maybe this is too
   "implicit" and a bit tricky, but I wanted to mention this
   possibility. I.e, in the base class, you use
   self.__class__.__name__, and it gives you the actual name of the
   class that is instantiated. You can then check if the string
   contains Python2 or Python3, and decide which interpreter to use
   according to this. I am not saying I absolutely want this, I'm just
   offering this as an alternative solution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
