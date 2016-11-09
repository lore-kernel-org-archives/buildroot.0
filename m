From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:17:13 +0100
Subject: [Buildroot] [PATCH 1/2] python: fix double format detection
In-Reply-To: <20161109092508.4503-1-jezz@sysmic.org>
References: <20161109092508.4503-1-jezz@sysmic.org>
Message-ID: <20161109221713.0cc8eb3b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Nov 2016 10:25:07 +0100, J?r?me Pouiller wrote:
> Python is not able to detect if compiler double representation is
> compliant with IEE754:
> 
>   checking whether C doubles are little-endian IEEE 754 binary64... no
>   checking whether C doubles are big-endian IEEE 754 binary64... no
>   checking whether C doubles are ARM mixed-endian IEEE 754 binary64... no
> 
> Accordingly 'legacy' mode isused. It is possible to check this at runtime by
> check if 'sys.float_repr_style' contains 'short' or 'legacy'. Calculus
> correctness is not garanteed with 'legacy'.
> 
> Problem is better described here:
> 
>   http://stackoverflow.com/questions/29920294/what-causes-pythons-float-repr-style-to-use-legacy
>   https://bugs.python.org/issue7117
> 
> However, all gcc architecture use a representation compliant with IEE754. So,
> we can enable it unconditionnaly.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/python/python.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

I've applied both patches, after taking into account the comment from
Baruch. Also, I verified that even ARM is not "mixed endian", by
running the test case under Qemu ARM. It seems like "mixed endian" was
only for the old ARM ABI, which we no longer care about.

Thanks for those patches!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
