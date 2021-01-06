From: Vineet Gupta <vgupta@synopsys.com>
Date: Wed, 6 Jan 2021 15:36:36 -0800
Subject: [Buildroot] ARC no console output (was Re: [PATCH 1/2]
 init/console: Use ttynull as a fallback when there is no console)
In-Reply-To: <20201111135450.11214-2-pmladek@suse.com>
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
Message-ID: <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+CC Buildroot folks

Hi Petr,

On 11/11/20 5:54 AM, Petr Mladek wrote:
> stdin, stdout, and stderr standard I/O stream are created for the init
> process. They are not available when there is no console registered
> for /dev/console. It might lead to a crash when the init process
> tries to use them, see the commit 48021f98130880dd742 ("printk: handle
> blank console arguments passed in.").
> 
> Normally, ttySX and ttyX consoles are used as a fallback when no consoles
> are defined via the command line, device tree, or SPCR. But there
> will be no console registered when an invalid console name is configured
> or when the configured consoles do not exist on the system.
> 
> Users even try to avoid the console intentionally, for example,
> by using console="" or console=null. It is used on production
> systems where the serial port or terminal are not visible to
> users. Pushing messages to these consoles would just unnecessary
> slowdown the system.
> 
> Make sure that stdin, stdout, stderr, and /dev/console are always
> available by a fallback to the existing ttynull driver. It has
> been implemented for exactly this purpose but it was used only
> when explicitly configured.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>

> --- a/init/main.c
> +++ b/init/main.c
> @@ -1470,8 +1470,14 @@ void __init console_on_rootfs(void)
>   	struct file *file = filp_open("/dev/console", O_RDWR, 0);
>   
>   	if (IS_ERR(file)) {
> -		pr_err("Warning: unable to open an initial console.\n");
> -		return;
> +		pr_err("Warning: unable to open an initial console. Fallback to ttynull.\n");
> +		register_ttynull_console();
> +
> +		file = filp_open("/dev/console", O_RDWR, 0);
> +		if (IS_ERR(file)) {
> +			pr_err("Warning: Failed to add ttynull console. No stdin, stdout, and stderr for the init process!\n");
> +			return;
> +		}


This breaks ARC booting (no output on console).

Our Buildroot based setup has dynamic /dev where /dev/console doesn't 
exist statically and there's a primoridla /init shell script which does 
following

/bin/mount -t devtmpfs devtmpfs /dev
exec 0</dev/console
exec 1>/dev/console
exec 2>/dev/console
exec /sbin/init "$@"

Buildroot has had this way of handling missing /dev/console since 2011 
[1] and [2].

Please advise what needs to be done to unbork boot. Otherwise this seems 
like a kernel change which breaks user-space and needs to be backed-out 
(or perhaps conditionalize on CONFIG_NULL_TTY. I'm surprised it hasn't 
been reported by any other  embedded folks

Thx,
-Vineet

[1] http://lists.busybox.net/pipermail/buildroot/2011-July/044505.html
[2] http://lists.busybox.net/pipermail/buildroot/2011-August/044832.html
