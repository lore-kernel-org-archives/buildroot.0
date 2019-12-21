From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 23:03:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/openrc: cleanup sysv-rcs script
In-Reply-To: <20191220000437.475219-1-aduskett@gmail.com>
References: <20191220000437.475219-1-aduskett@gmail.com>
Message-ID: <20191221230330.10a919fb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Dec 2019 16:04:37 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <aduskett@greenlots.com>
> 
> Currently, the sysv-rcs script has two issues:
>   - The return code of each RCS script is not checked.
>   - The output does not match the formatting of the other openrc
>     init scripts.
> 
> Modify the script in the following ways to fix both issues:
>   - Remove the "einfo "Starting sysv rc scripts"" at the top of the
>     start function in favor of "einfo "Starting $i" in the loop
>     itself.
> 
>   - Add a "> /dev/null" to the end of $i start; this suppresses
>     stdout while still allowing for stderr messages to print to the
>     terminal.
> 
>   - add an "eend $? to both the start and stop functions, this
>     allows for openrc to show if an RCS script returned 0 or
>     not.
> 
> The following is the startup output of OpenRC on a minimal system
> with S01syslogd modified to exit with a return code 1 for testing
> purposes:
> 
> Before:
>  * Adding static routes ...
>  [ ok ]
> Starting default runlevel
>  * Starting sysv rc scripts
> Starting syslogd: OK
> Starting klogd: OK
> Running sysctl: OK
> 
> After:
>  * Adding static routes ...
>  [ ok ]
> Starting default runlevel
>  * Starting /etc/init.d/S01syslogd ...
>  [ !! ]
>  * Starting /etc/init.d/S02klogd ...
>  [ ok ]
>  * Starting /etc/init.d/S02sysctl ...
>  [ ok ]
> 
> Signed-off-by: Adam Duskett <aduskett@greenlots.com>
> ---
>  package/openrc/sysv-rcs | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
