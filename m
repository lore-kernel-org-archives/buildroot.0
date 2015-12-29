From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 23:28:25 +0100
Subject: [Buildroot] [PATCH] graph-depends: optimize
 remove_transitive_deps()
In-Reply-To: <1450174901-30667-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1450174901-30667-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151229232825.0820a970@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Dec 2015 11:21:41 +0100, Thomas Petazzoni wrote:
> For large configurations, the execution time of
> remove_transitive_deps() becomes really high, due to the number of
> nested loops + the is_dep() function being recursive.
> 
> For an allyespackageconfig, the remove_extra_deps() function takes 334
> seconds to execute, and the overall time to generate the .dot file is
> 6 minutes and 39 seconds. Here is a timing of the different
> graph-depends steps and the overall execution time:
> 
>   Getting dependencies:   42.5735 seconds
>   Turn deps into a dict:   0.0023 seconds
>   Remove extra deps:     334.1542 seconds
>   Get version:            22.4919 seconds
>   Generate .dot:           0.0197 seconds
> 
>   real	6m39.289s
>   user	6m16.644s
>   sys	0m8.792s
> 
> By adding a very simple cache for the results of is_dep(), we bring
> down the execution time of the "Remove extra deps" step from 334
> seconds to just 4 seconds, reducing the overall execution time to 1
> minutes and 10 seconds:
> 
>   Getting dependencies:  42.9546 seconds
>   Turn deps into a dict:  0.0025 seconds
>   Remove extra deps:      4.9643 seconds
>   Get version:           22.1865 seconds
>   Generate .dot:          0.0207 seconds
> 
>   real	1m10.201s
>   user	0m47.716s
>   sys	0m7.948s
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/scripts/graph-depends | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

I've applied an improved version provided by Yann E. Morin,
implementing the various suggestions he has made (mainly using
exceptions, and making the code more pythonic).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
