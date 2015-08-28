From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 19:36:43 +0200
Subject: [Buildroot] [PATCH 1/1] python3: add patch to fix PEP 3147
 issue with automake built packages
In-Reply-To: <1440773921-769-1-git-send-email-cvubrugier@fastmail.fm>
References: <1440773921-769-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20150828193643.10876a0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Fri, 28 Aug 2015 16:58:41 +0200, Christophe Vu-Brugier wrote:
> Packages built with automake use a `py-compile` helper to byte-compile
> Python source files. This script uses the "py_compile" module from the
> standard library. In turn, the compile() function in the "py_compile"
> module invokes the cache_from_source() function provided by importlib.
> 
> This patch changes cache_from_source() and source_from_cache() in
> importlib to get rid of the "__pycache__" directory.
> 
> This fixes the following import error in kmod when the module is built
> for Python 3:
> 
>   >>> from kmod import Kmod
>   Traceback (most recent call last):
>     File "<stdin>", line 1, in <module>
>   ImportError: cannot import name 'Kmod'
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>

Thanks for this patch. However, I'm wondering if it doesn't make the
existing patch 016-distutils-no-pep3147.patch unnecessary. Patch 016
fixes the distutils/setuptools case by preventing the logic from
calling importlib.util.cache_from_source(). But since you're fixing
this function in your patch, maybe there's no need for the 016 patch
anymore ? What about patch 004 ?

Could you do some quick testing without patches 004 and 016, and see if
1/ the Python standard library is byte-compiled without __pycache__
folders and 2/ same for Python external modules built with distutils
and setuptools.

I'm pretty sure with your patch we can remove patch 016 (so your patch
could replace it). I'm not sure about patch 004, though.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
