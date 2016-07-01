From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 22:54:25 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/busybox: support spaces in
 module aliases in mdev
In-Reply-To: <1467399379-945-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1467399379-945-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <20160701225425.57f0816b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 21:56:19 +0300, Andy Shevchenko wrote:
> The new change which enabled automatic module loading on boot does not handle
> the cases when module alias includes spaces. It prevents modules to be loaded
> since script fails:
> 
>   % find /sys/ -name modalias | xargs sort -u
>   sort: /sys/devices/platform/Fixed: No such file or directory
> 
> First alias in question is "platform:Fixed MDIO bus".
> 
> Amend the script to support above like cases.
> 
> Fixes: 07f46c2b6dae ("package/busybox: support automatic module loading with mdev")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for this patch. However, I have one question below.

> -	find /sys/ -name modalias | xargs sort -u | xargs modprobe -abq
> +	find /sys -name modalias -print0 | xargs -0 sort -u | while read ma; do

Why is /sys/ changed to /sys ?

Is it because of the sort -u that you cannot do another xargs -0 for
the modprobe (which would look nice that the "while read ... done"
loop) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
